Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp577750wrt;
        Tue, 25 Sep 2018 04:56:46 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63Ba5tueFE94UGs8OLerpYQ+sKTBkHjM5BTHLTpGkB9Vu/WEWEfwGFRXbz0XGdeTiCvOmi8
X-Received: by 2002:a05:6214:d2:: with SMTP id f18mr417491qvs.205.1537876606416;
        Tue, 25 Sep 2018 04:56:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537876606; cv=none;
        d=google.com; s=arc-20160816;
        b=BFDDeg8fL+Pyk6YwXPRH+CslfqDlHpU5Xy54AEDh7svcQZFL+LK/TF5kEvGiALfSJ+
         VPo5vRf9lR6/gXXcHz7+PpXLjfnvec977D2OyumDC7qu5GiH/nhcj99HcdWG+2+/Yt5n
         VgvRmaL+nhRMyOaQdzq4FJlh/VNykg5lATLce0K0iyTZ4vio/qGo9gsDLy4l8PvUn6fP
         5YrpUIjZR/zNupJZfQ4unDOZNrXmotbcqdE8OHW0AFT7QT6SeYep2aaGAmBaormXxuDb
         lQ7Cb9kj6kVSx6G2pwcHaBghz+QeN6zslusc1LmUkwCaLViz0VBT5zqU5BKAdG1NxryR
         bUow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=MRIRjv/nXqN+QGcxISV6LZDGHPHBOl/Y7YBnfewa/YM=;
        b=lgw4+/rrofy7BI1sHq3d4NBYXsfWQuBmitRw5TFPsUDesSOgQk0ZL3/AxedvNl+l4A
         xe+GGbuzu+4SrVz2lrooyUnbOL1Vx6xXCSx69IGCHHvfud0/1nRWTfpwoewk8dxfrl4t
         fj88tZu6YtSW2XZRz0vno+RVlf0MsnYSNvrllZEi1A68PbKhBClLorlUSMFJDuAPl+UD
         S6A48m2wu6/cjIj2A9iIAvFeCLiXaVLeG6Iex5eOALuSM9iRlwBLs5nZGmVoLc2hFvcI
         RavSn/hxpIRp2NBPWVDQQeUq7lN9SDZzM9fMWGAfOMPW6pyBb7OQ/Mv/bkUsFc46s2Mb
         UhDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nGBTEv6b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h4-v6si568262qva.66.2018.09.25.04.56.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 04:56:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nGBTEv6b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52474 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4lxN-0007fV-UI
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 07:56:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g4lxE-0007de-Ff
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 07:56:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g4lxD-0003Zz-IG
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 07:56:36 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38188)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1g4lx8-0003W1-Qm; Tue, 25 Sep 2018 07:56:31 -0400
Received: by mail-wm1-x341.google.com with SMTP id z16-v6so6895355wmi.3;
	Tue, 25 Sep 2018 04:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MRIRjv/nXqN+QGcxISV6LZDGHPHBOl/Y7YBnfewa/YM=;
	b=nGBTEv6bzq7dBdh/3/4/N8Wx4oximbMV2UcmQwPkYP5vOc9WekF7q4Mw5iXZf0x56c
	1aYAQ/6aQvY6rOsK4smDn8k5G/MDGyqg+G5Lq60nImRax2y9nf9ihxeeS6WImzxlF0Qb
	0eME1CHJId3tdQuJ/3iTMR48f6GUTCzxcNPInuA0Ts2sNgqEKm/MePjOHEc75GDvggCo
	oVMmDsQDr8N9YuRvmvjDTODU0kCsftOKOYPO9u6jH7EMhNQhuWYU4wQj9FH+rZrQRGMr
	KINOmOPF6fAAwwhSsSVamBBSU03TbuubWYluQzJ2vaflSPaHh27F0t2vOIDKvfYMlf4f
	k2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=MRIRjv/nXqN+QGcxISV6LZDGHPHBOl/Y7YBnfewa/YM=;
	b=Vm8JAahhubc3gka4NeD57B/5KD0V57HVa2Jyh+A+OB4C/ngRF7rjQj39ProhP+m159
	5CQZKCFgWof9V2HwBEytY/tIhpJkQWHLsGFnBXldlkb5av0uXsrgNDArPJX+vy++Q7GJ
	a4cA39OHQyk8JkRRNkKdXULDiQrrUlZZoyrmerZfn1hNunWncUh/YtEAW56s/zUXs7uw
	CP+kJgAeAp/DY6D9KXW6zwOhi3BjZhGQZQpOSUc/d8RD8hFGSkNMEjow32ypDwx0gDUJ
	cC+RuBA0xBAjoccwNUMYR50cz9MYUUAc6lfk39xET9yjBw4IdgYb8L60zyC66vavGlSM
	iYGA==
X-Gm-Message-State: ABuFfogAVEZ7HjV192g/DJAkWKi4Rg4lMhsfQjpbg75bHx6ehpmxWogZ
	mvnaqpAzAR13XocIFYJ+Sv4=
X-Received: by 2002:a1c:bc86:: with SMTP id
	m128-v6mr357705wmf.147.1537876589652; 
	Tue, 25 Sep 2018 04:56:29 -0700 (PDT)
Received: from [10.201.33.207] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	e13-v6sm1841476wrt.76.2018.09.25.04.56.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Sep 2018 04:56:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180823135047.16525-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBAgA/AhsPBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJbkphvBQkm
	loU1AAoJEOPjLCzercDeTLIP/3pzTBotxvkddIREaw2j/6RoxN1lj5hnCx/XHGF7QxAlO4uV
	7eB6hcZxAqlt4AyNX5jcsSxNMfVNGnZ+u4ni6VdRRLUOw/QPXKGV8siK2E1zOG1GwZSCJ5zb
	ol7gpXNnOG/+ZXDfvkfSNnpim0ahNIPX8WAaZ/qN7I1qsPGupK2JrlCot561TfIOT7KNZFAZ
	m66Hf8MeNr8HQtn+oDk6j7g6WuIYZiqvF1MladikIZXndDMCsopXsjOikMXtoVuC/df7BlwS
	UaM+DT47onbIfXOtsWQGd2dJhu07Kxphqlz1Uh3YA7IHsFzZkX+S9waPBEzC8YB39dkZKA2E
	XbObk/ZTtCBLb39KTN2L7bv3Agm6wYO/hw3DQJQV3/07vW1EJd4fglQB5IY2A3eQ/ZSuRVm1
	E1GyFszjLXKUQIKx1938zoLrUDDdWQH7bhhSvG7JWk1BKmJrIXDTDx1tvTOW2pYZuO1PNx+p
	EhJraVuu3jtSbEfH+uPeoWtJtqSRkz1fLqp+dbha24ldPeKw4ija/YTviOem5baUlf/iNgS+
	a0s0eoRiJFrGZFCKLGKgZYoJe1rccQR6JKKd8JpoaIQuzptcHZD4+qn8W8FUlkNWGfpTQrsN
	iPLZt2EFOFkbjoZ2EoEByCs9nZ8ro91+lq7QfH9RFcldKLZfPEWwHPrchQ42
Message-ID: <82a820bc-8977-4ec3-ec2a-7a0495f43060@amsat.org>
Date: Tue, 25 Sep 2018 13:56:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180823135047.16525-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-arm] [PATCH] target/arm: Start AArch32 CPUs with EL2 but
 not EL3 in Hyp mode
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JBErjnwY84X/

On 8/23/18 3:50 PM, Peter Maydell wrote:
> The ARMv8 architecture defines that an AArch32 CPU starts
> in SVC mode, unless EL2 is the highest available EL, in
> which case it starts in Hyp mode. (In ARMv7 a CPU with EL2
> but not EL3 was not a valid configuration, but we don't
> specifically reject this if the user asks for one.)

ID090413 "G1.13 AArch32 state exception descriptions"

  G1.13.1 Reset

    When Reset is deasserted, the PE then starts executing
    instructions in the highest implemented Exception level.
    If that Exception level is using AArch32, then it starts
    execution:
    • In Secure state, if the implementation includes EL3.
    • With interrupts disabled:
    — In Hyp mode, if the highest implemented Exception level is EL2.
    — In Supervisor mode, otherwise.

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

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
> 
