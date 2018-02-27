Received: by 10.28.71.27 with SMTP id u27csp5068335wma;
        Tue, 27 Feb 2018 09:27:30 -0800 (PST)
X-Google-Smtp-Source: AH8x227lbndRXEKUSuWY2xHUnKCofIvUUjSNsq8gNSVpavUg33v+Jxzn+e1jskV2TC3JoTMHbRu8
X-Received: by 10.13.212.196 with SMTP id w187mr9993177ywd.143.1519752450067;
        Tue, 27 Feb 2018 09:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519752450; cv=none;
        d=google.com; s=arc-20160816;
        b=AaQHIjNRjANgvrufV0nWLM4Y5tKQ+jl75D2IcffN7ajNsXC8KHzmydpz0qoEHqpwTk
         vuMMMy0VWBVd3RXXbTwkq5TwoAqeWSATOXJqzP8SLKi3i76ccVljpF1hIPilT9AKu/sn
         57BmtlIO/7ppP03pFk0I3CIIeNT4CPNG05b1xn3CWEY6XfO5ErDonJA9JRC3e4NCFEWS
         uvw3YCKrdY/tDoSODOSn1za2qOwohVmh5txyFfAlK0t+0SCY7CYKaN/Cmes0dH9osBzn
         xjessPlmjSLWktp8jfUAlxvm5ont0fvQ6bCtqFdhdrXV6HMC7PXW9g2ByIa5uDHnAGQR
         /kjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Ad53eF5SylCmxHNEOBgipdm64CP/EmpEKaHlYsi5mmE=;
        b=YRkn09X4YDMbPjzeSE8mi0ed3imPwVX6XQhDSXXSys25ZSVxhgs54/FOtPZ2Tccr73
         p0RqSU55YeHWqI1q9/8hizW3UHJVAAIz1fRmEMA6+VY1OSotVZLO1T7XJ4mcJok2ociG
         n/dyJBgYZ3+v/2vcmrEc5QXoPC5P7jPZta41kD+ZJmZzEzh4zMxmqMfjH8Xuhjf7Herk
         6Q5jGa+T9VgjPXYrTNEi0vFbS9sib32J6lxzMW0k9HJS0qTEMoIuP8Hb+Ae0V3hxVGMf
         1cTKWa83EKO7ku/VmpZAnQhOUUtHNh6/Vxlj8eW1Wnh3eHwe8huiw5JIT2JySH/XiTm6
         O9wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qq1HIzPP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x9si1998688ywl.628.2018.02.27.09.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 09:27:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qq1HIzPP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqj2H-0007Ji-Ek
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 12:27:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqj25-0007HH-0i
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 12:27:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqj24-00076b-4n
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 12:27:17 -0500
Received: from mail-ot0-x234.google.com ([2607:f8b0:4003:c0f::234]:46158)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqj23-00076H-UZ
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 12:27:16 -0500
Received: by mail-ot0-x234.google.com with SMTP id g97so4481422otg.13
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 09:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ad53eF5SylCmxHNEOBgipdm64CP/EmpEKaHlYsi5mmE=;
	b=Qq1HIzPPN2YL9Oqm/yXXzOoFWA//Mze3NEbyhxegyKSPpx/alZEc2/hUXLMj6jDEY9
	Bq5gPMZoOyZtK4Li8qzoZ34FzLHGClOp9hkF0rxKvIUq8chW+nxuzOJa7G9BouoV1pSF
	ozqVhkunSRxT8BxZQ3L6DKoxZocBAlFj9/IGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ad53eF5SylCmxHNEOBgipdm64CP/EmpEKaHlYsi5mmE=;
	b=iVIbWNFxLea+pF0qgtIsnO6dYaOeXjBCdu7myGO3nPPCrmmAqd6gt/h8M4n9XPUTlt
	S5Jg3zVOa5kI4yRSuln5AgvlkjsX6Cm065xnrOghae0ieIhXzhQGbTroASPuEj/z0apM
	0I98C4tLO43jldLOXAXT0R/RczA2H25GD9KF63yAeji/H9KONxm6jUHcty8uBZgGeA97
	fqJZDQ4/2lIBaw+L2oOqXummoHWsufoO+Ez8pXLIs0meNSFZKfwurhDo/A2iwvgI/ToG
	5iuIlJlx/y/8CACT+1misZW6TEIkUZRaQO6o52pEa+B7nrg/7WYS58KwcsjeqnJGfAGa
	ocTQ==
X-Gm-Message-State: APf1xPA/QzHpRbeHhIZNKtz37VWtYIRQVTbz9zKxP0sV9O4vXsuJtutL
	G8J0aa/C6SOan7i6xhCTNmdaDuRoaE3B7mpNE0wnIA==
X-Received: by 10.157.27.17 with SMTP id l17mr11190370otl.294.1519752435148;
	Tue, 27 Feb 2018 09:27:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 09:26:54 -0800 (PST)
In-Reply-To: <20180227104903.21353-1-linus.walleij@linaro.org>
References: <20180227104903.21353-1-linus.walleij@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 17:26:54 +0000
Message-ID: <CAFEAcA9h9VjyS7QjHiRkYwThGyK0NErWSPxMGD=iRT82qECi8Q@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::234
Subject: Re: [Qemu-arm] [PATCH 0/5] Versatile Express SiI9022 emulation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5FAsOa6OnZW+

On 27 February 2018 at 10:48, Linus Walleij <linus.walleij@linaro.org> wrote:
> This series adds proper display bridge/connector emulation
> for the Versatile Express, implementing a simple Silicon
> Image 9022 emulation spawning a DDC I2C child.
>
> After the series the Versatile Express is successfully
> presented the "QEMU monitor" through DDC I2C.
>
> The series includes two refactorings from Corey and a
> minor bug fix for the i2c-ddc so that everything is smoothly
> integrated.
>
> Corey Minyard (2):
>   i2c: Fix some brace style issues
>   i2c: Move the bus class to i2c.h
>
> Linus Walleij (3):
>   hw/i2c-ddc: Do not fail writes
>   hw/sii9022: Add support for Silicon Image SII9022
>   arm/vexpress: Add proper display connector emulation

Hi; I've applied this to target-arm.next with the tweak to
the commit message of patch 5 and the reset function in patch 4.
Let me know if you think those are wrong or you'd prefer to
respin the series yourself.

thanks
-- PMM
