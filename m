Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp501938wrt;
        Tue, 25 Sep 2018 03:34:33 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63wlKGYGy0adjzwOFUb7HpIxPT683kO2z1s5JIuPI+DBtFWVxEY5KmqB4FejXciqzDnJ4IE
X-Received: by 2002:ac8:3a64:: with SMTP id w91-v6mr254914qte.144.1537871673530;
        Tue, 25 Sep 2018 03:34:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537871673; cv=none;
        d=google.com; s=arc-20160816;
        b=FCxNxToxVIRh9pERw4zxzK/RI8tYQpeu8OAeekD4SrECxLWz9hPQ8Ct8yLk4Ddlruo
         KJ7nquPybiOcg8I395/aOja1DBDhm/hEbUlG5kzn0JwUrhbckLnqD+UHGClXzKU00SkY
         1tYf6OnGpPmOdlJn6F+d1wMx5vgwb0W448TNKnkKuB3ltEkOdAxqV5zxT39I5gjKvn1h
         7i3INWojbhQPSbjWeDVh6SB8o589qaotx7HaiI0pKo/QkbXshjmAwKhayiUi+2AkXkbK
         Rdta0w3oqDT9LgROah0Gr+oyYIeidECGYYcdq7GXBlr7kxDaAc0Tp7X5nyjwfLYHwR66
         03yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=wXa3g24pqmoGwQZOOGkr4nHgqm1Iv3k2mp3t1STiBq8=;
        b=oH5//+6nboxgqWeEwbSm4ytwQEH3doH4z0OAXk8/PGQSc9ysMW/1h/dUKzzpLSIzVD
         Iy9kYMenAn2Qd7jlG4Bu0XagAG5189kWxcepl3xb10T5DTQdojiNdDetTOwcD7u36Cdh
         crSm0CGDuoFt1bqjQBUGDYjEM5n4scPKy5vrrsOVtrdMrB6yd9rrZ5syG9B01F41k/VB
         prVL6iGbHdu6S1CKUjsYdt13S1zZ6MFGjzmE1fPv4j4mYQQNnreNMJRMtGJUC6q3782S
         yrG6aotT0Ei5R7NGLIZqSX4qlRAJXBlF6Yg0J7phOJgNXfC/wHHh1rm4X52SW5trnDH4
         b5VA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G78DcFl2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e1-v6si335269qvo.202.2018.09.25.03.34.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 03:34:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G78DcFl2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52075 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4kfp-0000UY-2R
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 06:34:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4kds-0007pm-Rl
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:32:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4kdm-0008Tm-VS
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:32:32 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39831)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4kdj-0008Hc-1F
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 06:32:25 -0400
Received: by mail-ot1-x342.google.com with SMTP id c12-v6so23843516otl.6
	for <qemu-devel@nongnu.org>; Tue, 25 Sep 2018 03:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wXa3g24pqmoGwQZOOGkr4nHgqm1Iv3k2mp3t1STiBq8=;
	b=G78DcFl285R2fRaX4tlPNAAUP2AmskVRyXew4nMCX2NvcbT21YJwenanD6nyQAeNWt
	I/P+1EZ9aG91oOcDOdafMRwURODhWrNXTeAYymy7yg4QQ3a1Mrp3AcJfzNqdU8zpaEp5
	59RxbSVlt22kAtZ4EaA0s6rcx8TFlffFkiEaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wXa3g24pqmoGwQZOOGkr4nHgqm1Iv3k2mp3t1STiBq8=;
	b=eM7eREWtpnfr8fGz+EYx0ZWYNBFahlglYWNE94ISq/wp7q9aBZ0Vavipo0LP6d1HbC
	ZbqP9Bu2WvrgTX69R2utEF8IFcu/KM+DKtPwolWKX4m5letNke7vcpoeVC2NrmzbEsJU
	ScKAxtorKY9uVUOEKrz52HfysOYn8wXV3MuekMcuiQWAoPhKFwoKoVV0Y8gM5ZD3oVP3
	45bwBOPdqqvQ1bD1pJBI5fq8lR+YH4Q/AIsSM4g5dQGY1nIFX3u2xJxVcJ/mo31rpWDp
	D+9uLOjZCb0UwGaRmnMoBh3HjyW2nMPb2KnBTzp+SeXYwTriSB6Zzl7BClz75X2O+0e1
	0c5Q==
X-Gm-Message-State: ABuFfogu39DHygAqG/my/nsctBjX6fUU94qIYWdcH083/uxBRAcUhyO1
	VpyBd5yasjrzuXpF8MjJPAV5cJ3DqAKI0UjEOBC6zg==
X-Received: by 2002:a9d:59c5:: with SMTP id u5-v6mr241695otg.332.1537871534546;
	Tue, 25 Sep 2018 03:32:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 03:31:54
	-0700 (PDT)
In-Reply-To: <20180823135047.16525-1-peter.maydell@linaro.org>
References: <20180823135047.16525-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 11:31:54 +0100
Message-ID: <CAFEAcA9SKw-g+Yq1cc7mqyQgoen86PDpGmdQmu31W7T2WbgcWQ@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] target/arm: Start AArch32 CPUs
 with EL2 but not EL3 in Hyp mode
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kPd2DWBzkpnX

Ping for code review, please?

thanks
-- PMM

On 23 August 2018 at 14:50, Peter Maydell <peter.maydell@linaro.org> wrote:
> The ARMv8 architecture defines that an AArch32 CPU starts
> in SVC mode, unless EL2 is the highest available EL, in
> which case it starts in Hyp mode. (In ARMv7 a CPU with EL2
> but not EL3 was not a valid configuration, but we don't
> specifically reject this if the user asks for one.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 258ba6dcaad..b5e61cc1775 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -199,8 +199,18 @@ static void arm_cpu_reset(CPUState *s)
>          env->cp15.c15_cpar = 1;
>      }
>  #else
> -    /* SVC mode with interrupts disabled.  */
> -    env->uncached_cpsr = ARM_CPU_MODE_SVC;
> +
> +    /*
> +     * If the highest available EL is EL2, AArch32 will start in Hyp
> +     * mode; otherwise it starts in SVC. Note that if we start in
> +     * AArch64 then these values in the uncached_cpsr will be ignored.
> +     */
> +    if (arm_feature(env, ARM_FEATURE_EL2) &&
> +        !arm_feature(env, ARM_FEATURE_EL3)) {
> +        env->uncached_cpsr = ARM_CPU_MODE_HYP;
> +    } else {
> +        env->uncached_cpsr = ARM_CPU_MODE_SVC;
> +    }
>      env->daif = PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F;
>
>      if (arm_feature(env, ARM_FEATURE_M)) {
> --
> 2.18.0
>
>
