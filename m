Received: by 10.25.0.6 with SMTP id 6csp1856708lfa;
        Tue, 30 May 2017 07:58:44 -0700 (PDT)
X-Received: by 10.200.50.45 with SMTP id x42mr26052472qta.23.1496156324804;
        Tue, 30 May 2017 07:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496156324; cv=none;
        d=google.com; s=arc-20160816;
        b=eqB8O86V30SfoBAg8Mc9mHmuTsZJHO1a4tO/6ZXLDHNGRbD45opgPtNw3KZEwGzjMU
         is0pOlx4DP6E+eFjQYMgedfunt1SJuVQuF71lCmuIehSkOuwoIl6Ma0W+UbBMr63nrTL
         Ezi+mwYEpdPQzIfl+bVuW40ZRIZGMHjmbsLUxLbSf0Vd0npfz9NeHQ+DN3nTN2p4P6yw
         Wx2vh/dTNN3ilRsSfx7VUN0Hit4q03ASAw0PowLT1IjocnTX4aFOGCt1Br8heoUuGTXT
         LsMGRG+DzaKSyF3oU2cXsDmo22eBPi2wYHwxoOtyQnmI4+eovoakSxjfstd+zBb0bInT
         v7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Vh357P40tWZEMSveW17djWH3pQLRDAMCGkRyLXzgj9U=;
        b=GHlAF1Y6OvFN00FJM0W0g9a9pnahl/DDZRtxOwRknn1FNtMFKO+LRDOb6AB8zcNLYy
         SHVVJP83bu9Vdu/4MMJUbZUk+zuS7n5NMiOZRK5ZBhxrHPukakqwyr73RfHzBXDp/6R6
         O/Kx5r+7YrwcoB+P/upAWu0f24/si7LyUEIuygDMWnbmKv4vcFTegOOtFr1B0bBcoZzq
         U+cwR0YYcHA/p9m6aXRzvmrqn1OgxWiQpYMduXh400ikXHwj3AuBVeeSpXD5R1UvxtsL
         FN4CVufWhl6KErTeRz1lQ/9kz1oYv8s3hxGKfpawqQMYAJExN1WA+eLl45nhq2Sn5K1/
         Qbbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w124si12821219qkc.185.2017.05.30.07.58.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 07:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54322 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFibc-0001X1-8Y
	for alex.bennee@linaro.org; Tue, 30 May 2017 10:58:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFibU-0001VR-Ch
	for qemu-arm@nongnu.org; Tue, 30 May 2017 10:58:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFibT-0001vS-DW
	for qemu-arm@nongnu.org; Tue, 30 May 2017 10:58:36 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:34849)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFibO-0001sw-Mr; Tue, 30 May 2017 10:58:30 -0400
Received: by mail-oi0-x242.google.com with SMTP id v80so16192481oie.2;
	Tue, 30 May 2017 07:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Vh357P40tWZEMSveW17djWH3pQLRDAMCGkRyLXzgj9U=;
	b=bhE5qaD4gnGIHYSzNoeIsZCSnp1mr8WGM25592qeBEY85M8etQzRTQOtgCnv4FLcLR
	qctrwufKNhmnez8xtQKewi4ihMYUf0jdb8DfzJb4pzlx11KCW2WV3HJ/5+7a0rl1oja7
	OlTAVIX7Xl4zhTpi7KA2467So97EALF+bylBHWGYMRvcgAEY4BzLXyYfR6GcVG3h/YKW
	538G9mM7TP111eGlZdFY/Nfk4DlE0mNvE4SiMr2wQZyS6nyv0OE4vOd5RHitj1bTCaEK
	NB32t8MOsj5K9ypEsU2PcB5gd9WSD//y0Rc384bPwGSBrTsNGVLp+nIes/8ktbxjdzXz
	6fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Vh357P40tWZEMSveW17djWH3pQLRDAMCGkRyLXzgj9U=;
	b=O0rTQwTOUNm5rbcpxPv2Bo6PnxWUCxV/RdwrghWYxjUFkaeQRaC9mIi4VGS2XCGnIW
	XA1VMzFAjpHKp3xGsH7gEUaXzycYMb83J4L+7ZqOSppX54/idENGpjDANhe7dXnoVijC
	rOn0zMGY+5+bfrU6xIPd+vsRMsS8u+8KZ4ERFvPzKSg1ev56t9OcknZMaOWZZFS93paB
	2jFkGMVcXbNQLwh1982gZZD1xp4WK8M2hcCf84bdihxax/njwLFl4ZIprOpF/RmCT70Q
	IQ2uOTv80HN9uu3fuOB7vNIP27bCkboasNydIMplVn9BZQQNL0fGMvwk0j0AqOQzDS07
	ghLw==
X-Gm-Message-State: AODbwcAQLl7mZyVCtDDIQ2HmKQEj/NkPRVT9r5p1GEdG044u06p6C2Zw
	g62o/Cfm3IA2dQ==
X-Received: by 10.157.14.236 with SMTP id 99mr9006630otj.164.1496156309902;
	Tue, 30 May 2017 07:58:29 -0700 (PDT)
Received: from [192.168.1.107]
	(162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
	by smtp.gmail.com with ESMTPSA id 59sm5779475oth.49.2017.05.30.07.58.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 May 2017 07:58:28 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
	<1493122030-32191-12-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <39de1197-c522-843d-eb2c-9774e9a2ca74@amsat.org>
Date: Tue, 30 May 2017 11:58:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493122030-32191-12-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH 11/13] armv7m: Classify faults as MemManage
 or BusFault
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
Cc: patches@linaro.org, Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cBAgdMMUQdk0

On 04/25/2017 09:07 AM, Peter Maydell wrote:
> From: Michael Davidsaver <mdavidsaver@gmail.com>
>
> General logic is that operations stopped by the MPU are MemManage,
> and those which go through the MPU and are caught by the unassigned
> handle are BusFault. Distinguish these by looking at the
> exception.fsr values, and set the CFSR bits and (if appropriate)
> fill in the BFAR or MMFAR with the exception address.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> [PMM: i-side faults do not set BFAR/MMFAR, only d-side;
>  added some CPU_LOG_INT logging]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 45 ++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 42 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 51662ad..49b6d01 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6342,10 +6342,49 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>          break;
>      case EXCP_PREFETCH_ABORT:
>      case EXCP_DATA_ABORT:
> -        /* TODO: if we implemented the MPU registers, this is where we
> -         * should set the MMFAR, etc from exception.fsr and exception.vaddress.
> +        /* Note that for M profile we don't have a guest facing FSR, but
> +         * the env->exception.fsr will be populated by the code that
> +         * raises the fault, in the A profile short-descriptor format.
>           */
> -        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM);
> +        switch (env->exception.fsr & 0xf) {
> +        case 0x8: /* External Abort */
> +            switch (cs->exception_index) {
> +            case EXCP_PREFETCH_ABORT:
> +                env->v7m.cfsr |= R_V7M_CFSR_PRECISERR_MASK;
> +                qemu_log_mask(CPU_LOG_INT, "...with CFSR.PRECISERR\n");
> +                break;
> +            case EXCP_DATA_ABORT:
> +                env->v7m.cfsr |=
> +                    (R_V7M_CFSR_IBUSERR_MASK | R_V7M_CFSR_BFARVALID_MASK);
> +                env->v7m.bfar = env->exception.vaddress;
> +                qemu_log_mask(CPU_LOG_INT,
> +                              "...with CFSR.IBUSERR and BFAR 0x%x\n",
> +                              env->v7m.bfar);
> +                break;
> +            }
> +            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS);
> +            break;
> +        default:
> +            /* All other FSR values are either MPU faults or "can't happen
> +             * for M profile" cases.
> +             */
> +            switch (cs->exception_index) {
> +            case EXCP_PREFETCH_ABORT:
> +                env->v7m.cfsr |= R_V7M_CFSR_IACCVIOL_MASK;
> +                qemu_log_mask(CPU_LOG_INT, "...with CFSR.IACCVIOL\n");
> +                break;
> +            case EXCP_DATA_ABORT:
> +                env->v7m.cfsr |=
> +                    (R_V7M_CFSR_DACCVIOL_MASK | R_V7M_CFSR_MMARVALID_MASK);
> +                env->v7m.mmfar = env->exception.vaddress;
> +                qemu_log_mask(CPU_LOG_INT,
> +                              "...with CFSR.DACCVIOL and MMFAR 0x%x\n",
> +                              env->v7m.mmfar);
> +                break;
> +            }
> +            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM);
> +            break;
> +        }
>          break;
>      case EXCP_BKPT:
>          if (semihosting_enabled()) {
>
