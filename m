Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1113514wrt;
        Wed, 28 Nov 2018 06:34:50 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X6vuooe1Q43V1nEmyyd3MgUYCKXamZh2AlXe2ncJ3yECY+ROqOkmAUVxNIjvaqukYV3J4Q
X-Received: by 2002:a25:bd0b:: with SMTP id f11-v6mr37845841ybk.48.1543415689937;
        Wed, 28 Nov 2018 06:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543415689; cv=none;
        d=google.com; s=arc-20160816;
        b=FHMGP+DwPV6Ft1hv7pdeR0HlUuGP4rQOouGbGWD0ySd42MZKwY9Z0cpB48vcANm7pi
         fHG/yucvk4UocsMnXHgJHXFPTFrU6mdrRIKdC2nWBz2Wt7AponuQirQW0P9G2+9DhKxW
         vY5W2ENw8mNm/J0rZzhyeGm3FZITcCt2L5747rvgfYzXFl/MgN01j5cRlq5k5p7jqHUr
         kg6byK6KxZieEzUhAALcxvBlD0Osx38itaSQ0SlNWN8q/w/wSzBH84VHaAfxrcs0t7Hb
         IuIUk4vuU7WOCVYshOE/+mxPX9UXSj1NgSr3DNGC2yx78ELBWyfZZiKwj8m3skSecfuT
         hZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=LCOhiyGXUTD3udHYg9lul1cK5TuT310rkz0YU+Tvoto=;
        b=fI9RXI1TtuvnwSPEjxDU1K39Yoa4kRweXA7bVh3SM2exf8HUUHFmmaBWrPnBaMMUSu
         3TeDlLhI36TkW8QPI3D3BLnSHUyR5e6rO+RPavswcRp9WmQhNzxxImYvP452/HnPBWkk
         hOBcb/0ndIDvPHZiPhRJ/XcHD+g2KTTcHrBRGZHCvqDyghvdID89iGhKzXIxJW9nN0q4
         e2pDnXHW96bmgbuY/JSMk8z1N73ExiCynnW7vPE8hlCMDM+xi3ChUk5GKtU1gMrDGYOF
         gyMJ9nBCV6bAWsit5dFCl3P9LHOgrz0EavtNpe0mD6SpftBa6NMZJasCJ8cC44klSPEu
         prbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o123si5007687ywf.94.2018.11.28.06.34.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 06:34:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48068 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gS0vQ-0005El-VX
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 09:34:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gS0v7-0005A8-GS
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 09:34:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gS0v4-0002Fu-8I
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 09:34:29 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40464)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gS0v3-0002F7-Vi
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 09:34:26 -0500
Received: by mail-wr1-f65.google.com with SMTP id p4so26536864wrt.7
	for <qemu-arm@nongnu.org>; Wed, 28 Nov 2018 06:34:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LCOhiyGXUTD3udHYg9lul1cK5TuT310rkz0YU+Tvoto=;
	b=sBoxtYtm+A4dJHDp/Ji+VtY//JTOIC/XoR6U1v63gL+wTSjlhowCuwiz3Ig66GYDnr
	SUE/zqD81/hoOx6UAFqerSRxGNXN/ALmde731Yp92hf6DCSBmpm+fqAaGqsXlpanVT1f
	IPEWkNS0xqqnjU5xVkDW9nmxyIWEB83rPeID1GgG6LzMYVuk0VhWWx3WbIC19P6qa1qN
	PRU7KFVYL9aOegg/ef8F/2V8J1u+IahlAyoGYGLp4bFbqI65d9e4qS2/YGwmmu/YQLZ6
	Sl07tKGZDpJp7Ez+GE4rX4GCU8/jBUWRHONYHZiSfNmKHrYDB7T/KLEHmEL5BpGgrc0P
	afHg==
X-Gm-Message-State: AA+aEWaUlj2D7CIjPf5IpoLbnV5rhG+6hbo4EcbLGukNj6cn4p3PHVwX
	6KuXiSZzrrl9dzASmuPSYhKMBQ==
X-Received: by 2002:adf:8b4d:: with SMTP id v13mr6532024wra.282.1543415663430; 
	Wed, 28 Nov 2018 06:34:23 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9?
	([2a01:cb1d:8a0a:f500:48c1:8eab:256a:caf9])
	by smtp.gmail.com with ESMTPSA id
	q189sm3005608wme.5.2018.11.28.06.34.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 06:34:22 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-devel@nongnu.org
References: <1543399094-2260-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2ac07515-10f3-ed38-c022-e583cd1cd36a@redhat.com>
Date: Wed, 28 Nov 2018 15:34:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1543399094-2260-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1?] target/arm/sve_helper:
 Fix compilation with clang 3.4
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
Cc: qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3SL7MXQgzaKu

On 28/11/18 10:58, Thomas Huth wrote:
> Clang 3.4 does not know the "flatten" attribute yet. We've already
> introduced the QEMU_FLATTEN macro for this in commit 97ff87c0ed020c2,
> so use this macro now here, too, to fix this issue.

checkpatch candidate?

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/sve_helper.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 8cbc651..bc84725 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -4382,20 +4382,20 @@ static void sve_ld4_r(CPUARMState *env, void *vg, target_ulong addr,
>  }
>  
>  #define DO_LDN_1(N) \
> -void __attribute__((flatten)) HELPER(sve_ld##N##bb_r)               \
> +void QEMU_FLATTEN HELPER(sve_ld##N##bb_r) \
>      (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)  \
>  {                                                                   \
>      sve_ld##N##_r(env, vg, addr, desc, 1, GETPC(), sve_ld1bb_tlb);  \
>  }
>  
>  #define DO_LDN_2(N, SUFF, SIZE)                                       \
> -void __attribute__((flatten)) HELPER(sve_ld##N##SUFF##_le_r)          \
> +void QEMU_FLATTEN HELPER(sve_ld##N##SUFF##_le_r)                      \
>      (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)    \
>  {                                                                     \
>      sve_ld##N##_r(env, vg, addr, desc, SIZE, GETPC(),                 \
>                    sve_ld1##SUFF##_le_tlb);                            \
>  }                                                                     \
> -void __attribute__((flatten)) HELPER(sve_ld##N##SUFF##_be_r)          \
> +void QEMU_FLATTEN HELPER(sve_ld##N##SUFF##_be_r)                      \
>      (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)    \
>  {                                                                     \
>      sve_ld##N##_r(env, vg, addr, desc, SIZE, GETPC(),                 \
> @@ -4832,7 +4832,7 @@ static void sve_st4_r(CPUARMState *env, void *vg, target_ulong addr,
>  }
>  
>  #define DO_STN_1(N, NAME, ESIZE) \
> -void __attribute__((flatten)) HELPER(sve_st##N##NAME##_r)           \
> +void QEMU_FLATTEN HELPER(sve_st##N##NAME##_r) \
>      (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)  \
>  {                                                                   \
>      sve_st##N##_r(env, vg, addr, desc, GETPC(), ESIZE, 1,           \
> @@ -4840,13 +4840,13 @@ void __attribute__((flatten)) HELPER(sve_st##N##NAME##_r)           \
>  }
>  
>  #define DO_STN_2(N, NAME, ESIZE, MSIZE) \
> -void __attribute__((flatten)) HELPER(sve_st##N##NAME##_le_r)          \
> +void QEMU_FLATTEN HELPER(sve_st##N##NAME##_le_r) \
>      (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)    \
>  {                                                                     \
>      sve_st##N##_r(env, vg, addr, desc, GETPC(), ESIZE, MSIZE,         \
>                    sve_st1##NAME##_le_tlb);                            \
>  }                                                                     \
> -void __attribute__((flatten)) HELPER(sve_st##N##NAME##_be_r)          \
> +void QEMU_FLATTEN HELPER(sve_st##N##NAME##_be_r)                      \
>      (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)    \
>  {                                                                     \
>      sve_st##N##_r(env, vg, addr, desc, GETPC(), ESIZE, MSIZE,         \
> @@ -4966,7 +4966,7 @@ static void sve_ld1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
>  }
>  
>  #define DO_LD1_ZPZ_S(MEM, OFS) \
> -void __attribute__((flatten)) HELPER(sve_ld##MEM##_##OFS)    \
> +void QEMU_FLATTEN HELPER(sve_ld##MEM##_##OFS) \
>      (CPUARMState *env, void *vd, void *vg, void *vm,         \
>       target_ulong base, uint32_t desc)                       \
>  {                                                            \
> @@ -4975,7 +4975,7 @@ void __attribute__((flatten)) HELPER(sve_ld##MEM##_##OFS)    \
>  }
>  
>  #define DO_LD1_ZPZ_D(MEM, OFS) \
> -void __attribute__((flatten)) HELPER(sve_ld##MEM##_##OFS)    \
> +void QEMU_FLATTEN HELPER(sve_ld##MEM##_##OFS) \
>      (CPUARMState *env, void *vd, void *vg, void *vm,         \
>       target_ulong base, uint32_t desc)                       \
>  {                                                            \
> @@ -5326,7 +5326,7 @@ static void sve_st1_zd(CPUARMState *env, void *vd, void *vg, void *vm,
>  }
>  
>  #define DO_ST1_ZPZ_S(MEM, OFS) \
> -void __attribute__((flatten)) HELPER(sve_st##MEM##_##OFS)    \
> +void QEMU_FLATTEN HELPER(sve_st##MEM##_##OFS) \
>      (CPUARMState *env, void *vd, void *vg, void *vm,         \
>       target_ulong base, uint32_t desc)                       \
>  {                                                            \
> @@ -5335,7 +5335,7 @@ void __attribute__((flatten)) HELPER(sve_st##MEM##_##OFS)    \
>  }
>  
>  #define DO_ST1_ZPZ_D(MEM, OFS) \
> -void __attribute__((flatten)) HELPER(sve_st##MEM##_##OFS)    \
> +void QEMU_FLATTEN HELPER(sve_st##MEM##_##OFS) \
>      (CPUARMState *env, void *vd, void *vg, void *vm,         \
>       target_ulong base, uint32_t desc)                       \
>  {                                                            \
> 
