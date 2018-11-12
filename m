Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3173348wrw;
        Mon, 12 Nov 2018 06:15:50 -0800 (PST)
X-Google-Smtp-Source: AJdET5esvMuBQkjng+kUP3+0xIxDvYaCJRDKIa9d63rlRl8yaNbHDBJBrPhF6QHTPaPRQd9aSMnv
X-Received: by 2002:a0c:fed0:: with SMTP id z16mr1070240qvs.229.1542032150520;
        Mon, 12 Nov 2018 06:15:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542032150; cv=none;
        d=google.com; s=arc-20160816;
        b=wIWaFznenGLvBuLt6UVttggSrux/eswKRCGPBr58WAnrGYyrS+VOuRVj3xH8SQl2Cg
         37N3dVoOo/1ykcsOCzQXjU6kbDuzSvtTnvD819rNQq0ZzS31qNkG/zf5yCMyuaG5eOA/
         tPhHKBtvfkQlC3ai5ffBRTV+PY/xovSEsOm9PsjjvUDwnMUX+9vFgLHdu6Eeh+LTp/FY
         Zwgijgu8PUaN21wrT/VM6GDPj6fZ+oLXa1PWT3byd+/PU6orSkvXcRnxYW0KOk3ub2Ts
         lJT1RPmtwp+j4+YRvrts5Twd0dyig0NiOVuUaJikk/5aAz9UQFgNM5r64NoSknItbmvj
         K2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=m1+2Av0KDBJZMMWEtchTWwAuKbkMTZ6rt997rsdhJ0g=;
        b=DWn/70PK8Hut6/N9kpAovHkBllWItrcVi6+U3xN/7aEORX2ljd2D1zglHjRQCTQ6so
         qLRvkHuhucmVjKFPBXqFK1uBhAF4ZOLnCIymLSOgdzCMqY6EVNBKR/bOIzI8WSroYo/K
         dyMfxo0SuFR+gNkc6iGPHfTCiUpYkXJheQf3/1wIiA4CkWrJ17WtFCUKo/BX4AvZpM7d
         pBLMH/Tvc9HDyDkWnrxoz1egdydwFihoLMVjXecD+66crP6BEzQQRG/ifua7bOUP77bw
         miM6NRj57+I+XyQOWTXitGI6a0FJ2d81i+7HSIetyYbj7yxXuVvhHIh0n+LISvUSi5JE
         15Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WZ6eY0Wh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u38si6807575qtk.133.2018.11.12.06.15.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 06:15:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WZ6eY0Wh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48865 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMD0H-0008GT-GL
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 09:15:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMCvZ-0003Uc-HP
	for qemu-devel@nongnu.org; Mon, 12 Nov 2018 09:10:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMCvT-0008CP-Rx
	for qemu-devel@nongnu.org; Mon, 12 Nov 2018 09:10:57 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:53592)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gMCvT-0008AB-Iu
	for qemu-devel@nongnu.org; Mon, 12 Nov 2018 09:10:51 -0500
Received: by mail-wm1-x344.google.com with SMTP id f10-v6so8628125wme.3
	for <qemu-devel@nongnu.org>; Mon, 12 Nov 2018 06:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=m1+2Av0KDBJZMMWEtchTWwAuKbkMTZ6rt997rsdhJ0g=;
	b=WZ6eY0WhI0b0xqHAksa4oJrmaj0zfAZJjqA6quz6g3+pvYqZewgaXoT2FPiZTewWuL
	Y2oy/n4MkX7hgrS+A2EXhRX3GBqEANwIkbiE15wkbYVoNOygGpMq3eS/aqH/yBkFn87P
	2Oyuc+2JgSsz1qRPtBjbMRVwatNuVErCt5GhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=m1+2Av0KDBJZMMWEtchTWwAuKbkMTZ6rt997rsdhJ0g=;
	b=BjpFQIOLefSzQHiFCmTSo0Xi6aJYeRLbiVkxK12G2lxRIckI8LZuzKlsk6fZckDFsn
	o+Q13UAXHok+QqCwFIqX5EtlhmIHqUg0YSdjeNy5muCCzj/J7wcBAh8IVbK4xyDdJ2iY
	XJD5fzVYI9uWi6SAttJ+Pe7CT0mRdkEggwwDN2/KnEZGTLultI7uQEDym1Fk6NQH4dv3
	iDccvTmDGkUlih+aVearoBDNeKZpZ7sCHCR6qP8+clTRxyQifgCGsvCdJv4YZ8dxx84X
	G13hk28k5RLprg+ynXeg4cmKCyteUo/rn3qLYgReylw8khiq/EKVquYIFH+Bq2sBsK0x
	aNEg==
X-Gm-Message-State: AGRZ1gJ4T6oOKLHBkzlJo96ETjsxUnQXipfb2RwKUmv7RMw9x8tEQAtN
	hmkZGJh56VPePXWLiEz+0xKN7w==
X-Received: by 2002:a1c:2b45:: with SMTP id
	r66-v6mr7691452wmr.128.1542031847428; 
	Mon, 12 Nov 2018 06:10:47 -0800 (PST)
Received: from cloudburst.twiddle.net
	(178.red-213-99-154.dynamicip.rima-tde.net. [213.99.154.178])
	by smtp.gmail.com with ESMTPSA id
	t4-v6sm5133320wrb.67.2018.11.12.06.10.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Nov 2018 06:10:46 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20181108175246.13416-1-richard.henderson@linaro.org>
	<20181108175246.13416-5-richard.henderson@linaro.org>
	<CAFEAcA-ooeVt=GRmu2Q+9DcaAs96B5AonpspVVExqQbf3kORPQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4290d696-cae9-c7bd-8c53-30376328e762@linaro.org>
Date: Mon, 12 Nov 2018 15:10:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-ooeVt=GRmu2Q+9DcaAs96B5AonpspVVExqQbf3kORPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v3 4/5] target/arm: Fill in ARMISARegisters
 for kvm32
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lrp1gEHTwGbj

On 11/12/18 1:42 PM, Peter Maydell wrote:
> Adding the following change allowed me to boot:
> 
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 8b2c9b3..2f7df81 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -84,9 +84,15 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>                            ARM_CP15_REG32(0, 0, 2, 4));
>      err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar5,
>                            ARM_CP15_REG32(0, 0, 2, 5));
> -    err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_isar6,
> -                          ARM_CP15_REG32(0, 0, 2, 7));
> -
> +    if (read_sys_reg32(fdarray[2], &ahcf->isar.id_isar6,
> +                          ARM_CP15_REG32(0, 0, 2, 7))) {
> +        /*
> +         * Older kernels don't support reading ID_ISAR6. This register was
> +         * only introduced in ARMv8, so we can assume that it is zero on a
> +         * CPU that a kernel this old is running on.
> +         */
> +        ahcf->isar.id_isar6 = 0;
> +    }

Ah, right, thanks.


r~
