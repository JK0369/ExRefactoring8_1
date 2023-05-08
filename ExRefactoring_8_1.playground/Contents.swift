import UIKit

struct Value {
    let primaryForce: CGFloat // 힘
    let secondaryForce: CGFloat // 힘
    let mass: CGFloat // 질량
    let delay: Double
}

func distanceTravelled(value: Value, time: Double) -> CGFloat {
    var result: CGFloat
    
    // 가속도 = 힘 / 질량
    // 1. acceleration 변수 쓰임 첫번째
    var acceleration = value.primaryForce / value.mass
    let primaryTime = min(time, value.delay)
    result = 0.5 * acceleration * primaryTime * primaryTime // 전파된 거리
    
    let secondaryTime = time - value.delay
    if secondaryTime > 0 {
        let primaryVelocity = acceleration * value.delay
        
        // 2. acceleration 변수 쓰임 두번째
        acceleration = (value.primaryForce + value.secondaryForce)
        result += primaryVelocity * secondaryTime + 0.5 * acceleration * secondaryTime * secondaryTime
    }
    
    return result
}

func refactor1_distanceTravelled(value: Value, time: Double) -> CGFloat {
    var result: CGFloat
    
    // 1. 이름변경 && let 키워드 사용: acceleration > primaryAcceleration
    let primaryAcceleration = value.primaryForce / value.mass
    let primaryTime = min(time, value.delay)
    result = 0.5 * primaryAcceleration * primaryTime * primaryTime
    
    let secondaryTime = time - value.delay
    if secondaryTime > 0 {
        let primaryVelocity = primaryAcceleration * value.delay
        
        // 2. 새로운 let 변수로 수정
        let acceleration = (value.primaryForce + value.secondaryForce)
        result += primaryVelocity * secondaryTime + 0.5 * acceleration * secondaryTime * secondaryTime
    }
    
    return result
}

func refactor2_distanceTravelled(value: Value, time: Double) -> CGFloat {
    var result: CGFloat
    
    let primaryAcceleration = value.primaryForce / value.mass
    let primaryTime = min(time, value.delay)
    result = 0.5 * primaryAcceleration * primaryTime * primaryTime
    
    let secondaryTime = time - value.delay
    if secondaryTime > 0 {
        let primaryVelocity = primaryAcceleration * value.delay
        
        // 이름변경: acceleration > primaryAcceleration
        let secondaryAcceleration = (value.primaryForce + value.secondaryForce)
        result += primaryVelocity * secondaryTime + 0.5 * secondaryAcceleration * secondaryTime * secondaryTime
    }
    
    return result
}

func discount(value: Double, quantity: Int) -> Double {
    var resultValue = 0.0
    
    if value > 50 {
        resultValue = value - 2
    }
    if quantity > 100 {
        resultValue = value - 1
    }
    
    return resultValue
}
