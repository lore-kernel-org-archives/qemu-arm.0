Received: by 10.28.91.67 with SMTP id p64csp2012129wmb;
        Thu, 1 Mar 2018 08:14:07 -0800 (PST)
X-Google-Smtp-Source: AG47ELsV5j7p2KgNRY7ciZ4zRmZdvJydwiflDpE1btFG41tCue3dvTFaPoFBxA1j6czLXP7khz2R
X-Received: by 10.13.217.4 with SMTP id b4mr1579902ywe.314.1519920846933;
        Thu, 01 Mar 2018 08:14:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519920846; cv=none;
        d=google.com; s=arc-20160816;
        b=gDiJtrgsuQ2F4ojp+Jce8Wwn/mniizmHw9cIIeBt6zKkE99q8ZMHuPbAoL6fiOHgGi
         pctmEpvCeOwMQKSJylSgRzILzt4lEXBl5smuLCOAD1ed8u43sI/xNSTO9vLJol8D1+3e
         dNnqJvdevdRubt2JB5j4g7pIyZ3Ebgem8jK92odMV57oQTEuoAVE2Q1uyiJGg67pjJ6n
         1e+6T4m9gYFvmGuqQkc4MVzA4dMOnC6I/cpYizPB9k1wu/ezi6CjYT8X3iPrl/s6SmLg
         BEM/DSn1q+rPEVxXNRzeaBh/AFPprxNY3aHvQwdEpPjnl0B4PMt3NZTKrRmAt1Lfc4e3
         Z3HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=wdudGhOFoCG0P4oCXZcEcwMORepnf0YEn6/IqNTtAZQ=;
        b=JqdbJ1TCGcYcbpiNQgbf6El2NC3R0b+O5Unr+EaCHv3ND9GtPTc1wn3B5RHVgUeEYt
         Evg2Rh4L0Gnth4uFK8PyAxzzmnt06qjVERO4MJSdpr/Gxs2P8cOmqnViCLnyg42ZB2iZ
         8cDb/0Pq1I2i0WCVJbbV782BI5bDRjdBAkrm829cNtsBGAwAsADljMGcW4cGltlxYQaj
         EC5e7dFiFV3DBXCk9CGjzDPTkuq61M8rl68AdvCQPkGqhaaI0IUh+Ch8S0h2xXPavC7A
         X+K/WQhMJv8MK2LzAwejmIyB4KcrwVEF0xtFRXcgoF4sLLRA6Nm/iRSNHZJCoKr22sx4
         OOgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c5eSs+1b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f125-v6si703282ybf.338.2018.03.01.08.14.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 08:14:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c5eSs+1b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erQqM-0003Lw-Dw
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 11:14:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erQq9-0003Le-2b
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 11:13:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erQq8-00056s-5o
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 11:13:53 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:42564)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erQq8-000560-0P
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 11:13:52 -0500
Received: by mail-ot0-x243.google.com with SMTP id l5so6033456otf.9
	for <qemu-devel@nongnu.org>; Thu, 01 Mar 2018 08:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wdudGhOFoCG0P4oCXZcEcwMORepnf0YEn6/IqNTtAZQ=;
	b=c5eSs+1bRkQrs6LioTIX590dwvgb2zuRif/lBXZRplwc+211/Trj2NjBfo4Xa+3yO/
	4kiQ3UnDe0czu/kq1CSulSiSLEFvlxVrJR5N2VA6g5YBXqHO6NZTTq+uuaBwLR3F21GD
	NOBfZb2ArTocy4bFW4rVZS+4paY2x5RWja7V4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wdudGhOFoCG0P4oCXZcEcwMORepnf0YEn6/IqNTtAZQ=;
	b=ILzOvq1pKNcroRPnDjX+vAAmLsEBzAMLvRUjM2EQqsiqG93JFfPvDKwH0QfpljTco2
	lDMjd6KagVpmJ3huEg0nSesH12/7SzYCyR6fucqgtiFHOCJn+ypVFOClGiI59HKf/3AP
	sJsbDNogopKpVHopMYKL4KZrNRsyPPpkzXqtdYuDA7jI1G5g+cXrE6xhDNCiLKlK1nsh
	FXEKLPwpTTttbw9psB4itkb0V/KTZIPpMurSdYbguOR6i/OLuCJodzN0KSUvqyDJ3z7Y
	xxFUnhdLuTR70QCtNsAKwLuUhW/PQJec4OcbUH0unaNGJ/Fln1Ln7MvUZ/DF2CBy67zH
	w08A==
X-Gm-Message-State: AElRT7G35YWIBpDalFXqaQWVfdEdS7aJGlxyngcIJKeb314pBA30UuaI
	6J4OYbuTHzX7+XFVGV6kLbKePUssE/DkWrpBTsNUhrJc
X-Received: by 10.157.3.70 with SMTP id 64mr1683212otv.258.1519920831350; Thu,
	01 Mar 2018 08:13:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 08:13:30 -0800 (PST)
In-Reply-To: <1519815685-29200-2-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1519815685-29200-1-git-send-email-abdallah.bouassida@lauterbach.com>
	<1519815685-29200-2-git-send-email-abdallah.bouassida@lauterbach.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 16:13:30 +0000
Message-ID: <CAFEAcA80d1AF=32Ds7GcfrxzHyywjueRMKMex0euwsFFwbfB-g@mail.gmail.com>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-devel] [PATCH v3 1/4] target/arm: Add "ARM_CP_NO_GDB" as
 a new bit field for ARMCPRegInfo type
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
Cc: Khaled Jmal <khaled.jmal@lauterbach.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hwvNBHPZgR5D

On 28 February 2018 at 11:01, Abdallah Bouassida
<abdallah.bouassida@lauterbach.com> wrote:
> This is a preparation for the coming feature of creating dynamically an XML
> description for the ARM sysregs.
> A register has ARM_CP_NO_GDB enabled will not be shown in the dynamic XML.
> This bit is enabled automatically when creating CP_ANY wildcard aliases.
> This bit could be enabled manually for any register we want to remove from the
> dynamic XML description.
>
> Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
> ---
>  target/arm/cpu.h    | 3 ++-
>  target/arm/helper.c | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8c839fa..92cfe4c 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1776,10 +1776,11 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
>  #define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
>  #define ARM_CP_FPU               0x1000
>  #define ARM_CP_SVE               0x2000
> +#define ARM_CP_NO_GDB            0x4000
>  /* Used only as a terminator for ARMCPRegInfo lists */
>  #define ARM_CP_SENTINEL          0xffff
>  /* Mask of only the flag bits in a type field */
> -#define ARM_CP_FLAG_MASK         0x30ff
> +#define ARM_CP_FLAG_MASK         0x70ff
>
>  /* Valid values for ARMCPRegInfo state field, indicating which of
>   * the AArch32 and AArch64 execution states this register is visible in.
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index c5bc69b..bdd212f 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5663,7 +5663,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
>      if (((r->crm == CP_ANY) && crm != 0) ||
>          ((r->opc1 == CP_ANY) && opc1 != 0) ||
>          ((r->opc2 == CP_ANY) && opc2 != 0)) {
> -        r2->type |= ARM_CP_ALIAS;
> +        r2->type |= ARM_CP_ALIAS | ARM_CP_NO_GDB;
>      }
>
>      /* Check that raw accesses are either forbidden or handled. Note that
> --
> 2.7.4

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
