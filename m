Received: by 10.25.0.6 with SMTP id 6csp1784661lfa;
        Tue, 30 May 2017 05:07:32 -0700 (PDT)
X-Received: by 10.200.4.162 with SMTP id s34mr24343143qtg.35.1496146052399;
        Tue, 30 May 2017 05:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496146052; cv=none;
        d=google.com; s=arc-20160816;
        b=RtizVQBCRakDm8PSvJ0ISCxb4HrIOa2QsGih3JvbknRi5wdyJAY+1RWEbsVV6YLZ80
         W6ZThvs0KndKxpwi72Bv6Z1T+ZWtUOJBb4n92tef6BWo5nZpESNbdOCG/EXz79Byl944
         +ftdl97lzGWpJ6sl0pohoS45DicYwZKzjV82+ucQC3zv5XX/C5/LE+iw2vYu5NekvRSD
         humzj3GnZCaRlQZu9fFNRUWbJRA3BR6I9+IG4i65zrNHfeI68EKcnE8AAxLGSExN9TUK
         B2EH/YbXVhpd0jyiSjGqz3eMbjebtS5+Vzd82ikIOkcnWlim1/0MAqadhkC9CgLY03Im
         ofpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=RS+Lwi6LkPD0GEdfRjbjdEsCt9z3+QlFZ5uF3d2wdoM=;
        b=ZCFJoUIDVV9p81JASDM7bVMayCQBLA/5/YWShN7M+l4tONkIQKcCN72O342MFoevBN
         O5Fxb00r0cU2YrH/Ab/JVpv2CkqaAtE2YigqlU5ZkFl6GDJ5DieupbqB7vapOwjTWcX2
         5ZC1IDIeb7k4V5t/ZIBvdUypA9c7f9VaHzFK6tt1/TkVi3xzkq877N6UITYVsfZjDHEQ
         /QR7Hjrv37ClMPu4eQSBVpfTnTTvWpsz3TJTa+P8x0t+3fP9Ny0L5DonRNX+xcetIqyb
         JEu2ZXNYaop3AiHsexTEIceH4pkoh9syZlC/uy+ym1lJ3xV9EjPRMX0FTdnZtYXD/DQC
         nyew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a18si12522439qta.125.2017.05.30.05.07.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 05:07:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFfvv-0005Q3-U9
	for alex.bennee@linaro.org; Tue, 30 May 2017 08:07:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFfvs-0005Pm-E8
	for qemu-arm@nongnu.org; Tue, 30 May 2017 08:07:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFfvr-0001od-Mo
	for qemu-arm@nongnu.org; Tue, 30 May 2017 08:07:28 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:36915)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dFfvr-0001oP-G3
	for qemu-arm@nongnu.org; Tue, 30 May 2017 08:07:27 -0400
Received: by mail-wm0-x232.google.com with SMTP id d127so95190271wmf.0
	for <qemu-arm@nongnu.org>; Tue, 30 May 2017 05:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RS+Lwi6LkPD0GEdfRjbjdEsCt9z3+QlFZ5uF3d2wdoM=;
	b=flZi6sUvOBxph8kTLGEezxfFuqCn5pWXUZ0Gn9NfUGIBnwShci3BIHA/cwrOliY5pt
	x3ckezOtNhKHri0iPvTTE5zAW7CrfIw30zzD/ENlmjKpWF+d0Q10ZhCXC/vpx4HovzKI
	WT89hNraSFfXc5uh7EfJDjx0cL2ftu76LvefQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RS+Lwi6LkPD0GEdfRjbjdEsCt9z3+QlFZ5uF3d2wdoM=;
	b=dloSHjJqNtuj/ZSrxbuAzpbeWEt5UuLu+GCzEVeZve0ufmuwmKeCn6GN8ukJf8kvaX
	Bt7lvH3J3y4j03uNHKfjFsdW9LV/cEjtuqKwJXBhyq+aMPwBDBHxGNbfnT+L7Uldoois
	iYa4dTP0SKdgTVc4fMouY/mdMFNt6MnZFi0jwlU0wcpdgudRUJ04TYFR8PGog7fcxiyA
	fWyOaDqGGSmdcSrSK24WzVMS3p7x7E9pdT4UDt0AMdNUCXwwN53cFr9ruxvxY2Lh8Fsg
	lsngqYLi+W4coiDhUOymAHvwabe2L7uukRCiJkreR1JlldDo7FI8S8ttcgQLFX1QWKpz
	TCYA==
X-Gm-Message-State: AODbwcDdGRTeTfbCwoxN2dSVuSQb/rEWH3geFbA2rTPsY/55BNzGnZJA
	qYzE3BQm5mWc7CBqonGYO0QXNEUNBZjE
X-Received: by 10.28.24.202 with SMTP id 193mr1556238wmy.125.1496146045624;
	Tue, 30 May 2017 05:07:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.135.82 with HTTP; Tue, 30 May 2017 05:07:05 -0700 (PDT)
In-Reply-To: <20170507181940.25882-1-krzk@kernel.org>
References: <20170507181940.25882-1-krzk@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2017 13:07:05 +0100
Message-ID: <CAFEAcA9QY253FP9mj6CfyHoxLJ8F-NrxGJOMKiM_yFN-RE2Syw@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-arm] [PATCH v2 0/3] hw/arm/exynos: QOM-ify the SoC
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /2hCAd2HfW6Y

On 7 May 2017 at 19:19, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Hi,
>
> Changes since v1:
> =================
> 1. s/RAM/DRAM/ in commit msg of first patch (as suggested by Philippe).
> 2. Add Philippe's reviewed-by.
>
>
> Convert the Exynos4210 SoC driver into QOM model.
>
> No external dependencies, rebased on v2.9.0-363-g0de9191deb14.
>
> Best regards,
> Krzysztof
>
>
> Krzysztof Kozlowski (3):
>   hw/arm/exynos: Move DRAM initialization next boards
>   hw/arm/exynos: Declare local variables in some order
>   hw/arm/exynos: QOM-ify the SoC



Applied to target-arm.next, thanks.

-- PMM
