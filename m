Received: by 10.28.71.27 with SMTP id u27csp493008wma;
        Fri, 23 Feb 2018 03:51:18 -0800 (PST)
X-Google-Smtp-Source: AG47ELs3+bsL1h63iRAxdvGccKPcdEyvJvCg58IAhLZpVWYsU3TlB4Vh8+zL1IZoGBAp38Iis3FX
X-Received: by 2002:a25:744c:: with SMTP id p73-v6mr754935ybc.500.1519386678688;
        Fri, 23 Feb 2018 03:51:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519386678; cv=none;
        d=google.com; s=arc-20160816;
        b=jGLuo8smyzuwWWZYPq8r7bWywaCNMy7mqEG3xg47w8u2/G2M4LbgJFRcnWCS5YFZSZ
         DlrL5cyBnnHLgqlGZQ2ZHXFmrtErT5CjKbev8uCE1i5QPjt21u07mt/XZCL1Zt67Y161
         zamjaGnSYcxtngy8zWZ+bTHrOcqNm76drF3tfG7be9aHXKSNC+oVs9MS1+h3vNn6FJOj
         rh1X5mpMLHJppr7W23gYXqFs/rtbX0Jt7l1osxhcVNiIItqHUClFrVS09KBRKI7rntAW
         VCCkG9SvyiNSWlphXZO68c2fu+Kw/4j9i9/k4jcUmM7R2mGgCIL4H5dwAsY5o2IIKrll
         xiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=j/dolb1WvIH387QKW0vgj7OK1RAlYlsEwa2TtW6YJx0=;
        b=DY8pX9b/EjQeh27b29ECc0IN4CPlZFbt3+bg9nwZu0kJO+mWD9b8SFzMJaFHeBxWLh
         HwKAOHeRPPL2itt5qbTzoGOyAz3I/F0AsaLwOHARRXnLYVsylgW4GEkDAkCTOp+YjzQx
         bgN6oDh7r0bjt1qdRISIH/gSqjuu9AUBrWWuZX4QN8pUcW8wagFI3o+m8gjfveOQKNLA
         gh5EIEegfW/ccvo/+xiEMmGSGSDjwvD0VkUuAcxT7KWdAVdIffBhxhNq0CM1OOjgbFuI
         0NEaHyQn+AfUfijlzANmSEqUzElai2ifqAd5vKHRbhkZ9XtjurO3MwkaNAlVzA6+fo0c
         cAtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DXUvPfsJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i201si365842ywe.676.2018.02.23.03.51.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 03:51:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DXUvPfsJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43919 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epBsk-00021m-4g
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 06:51:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epBsS-0001yq-FL
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 06:51:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epBsR-000851-J1
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 06:51:00 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:45206)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epBsR-00083u-DA
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 06:50:59 -0500
Received: by mail-pl0-x241.google.com with SMTP id v9-v6so2760547plp.12
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 03:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j/dolb1WvIH387QKW0vgj7OK1RAlYlsEwa2TtW6YJx0=;
	b=DXUvPfsJuhTgCpzE8xhNk+n4f9vo9xCyO4ida6kZV10rXTD1p+MpSn1UIV+VhTBAHL
	cz1XzWaMlboftyR1SMu2z2Wi967QmOQhTsMIeONmvmtV4e0iw95KG6L4LDdDtyiR5137
	rL0uK3dsoZHVgYxWjq6MVqm/2ixXXLfxTKsJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j/dolb1WvIH387QKW0vgj7OK1RAlYlsEwa2TtW6YJx0=;
	b=mFd/2HKz+dFK0OVSatW4hCMP/SHUtgPge+yrUuRRPjPrUaspe2KJYy5UiMgFXqJMZK
	RBGImQnOSLJUvisKGtaDci2fUn6nq6aE42q8OoP+IWm1sH2EqWbax5lIBLYfMal3X9tf
	yc10I+xV5pemwgzplTLeSRzS2jmg9M2hSlIOfWCeAiBUTAebZvMfelbtBNAQLfaTpLdT
	1hSy+uWxb1SjSR31cwunMmvMQbHq1AKJSaII4go9bQGRXidn+u9Ip6ZDzbWJ25CKgStq
	SMu7q9HOLYyK1ad8+apssUs8cYpiGSH08Zf6Xk1R1aOSJz0ZOxnX70JHwhfDUocFf0Zi
	4Ytg==
X-Gm-Message-State: APf1xPAcFTwxhRGoODtOMnWJIVEAJPZOwkFvAwr7N3lvA+DlqaXR9hmX
	SM8tmV41VyXhO0eu6m1eJOZRNgC5NVak3YNZGqM4eg==
X-Received: by 2002:a17:902:8b85:: with SMTP id
	ay5-v6mr1498805plb.329.1519386658236; 
	Fri, 23 Feb 2018 03:50:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 03:50:37 -0800 (PST)
In-Reply-To: <20180217182323.25885-11-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 11:50:37 +0000
Message-ID: <CAFEAcA_7Tn5SWbTOY4VqMcwDngyUvRyPvWJJJeFwhGKh_kCgsg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-arm] [PATCH v2 10/67] target/arm: Implement SVE Integer
 Reduction Group
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ej6YtC5yMfFs

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Excepting MOVPRFX, which isn't a reduction.  Presumably it is
> placed within the group because of its encoding.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -306,8 +399,6 @@ DO_ZPZZ_D(sve_udiv_zpzz_d, uint64_t, DO_DIV)
>  #undef DO_ABD
>  #undef DO_MUL
>  #undef DO_DIV
> -#undef DO_ZPZZ
> -#undef DO_ZPZZ_D
>
>  /* Similar to the ARM LastActiveElement pseudocode function, except the
>     result is multiplied by the element size.  This includes the not found

Hunk in wrong patch or incorrect?

> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 116002792a..49251a53c1 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -276,6 +276,71 @@ void trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
>
>  #undef DO_ZPZZ
>
> +/*
> + *** SVE Integer Reduction Group
> + */
> +
> +typedef void gen_helper_gvec_reduc(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_i32);
> +static void do_vpz_ool(DisasContext *s, arg_rpr_esz *a,
> +                       gen_helper_gvec_reduc *fn)
> +{
> +    unsigned vsz = vec_full_reg_size(s);
> +    TCGv_ptr t_zn, t_pg;
> +    TCGv_i32 desc;
> +    TCGv_i64 temp;
> +
> +    if (fn == 0) {
> +        unallocated_encoding(s);
> +        return;
> +    }

Same remarks as for patch 9 about this being too late to
catch unallocated_encodings (or alternatively needing to
do the sve/fp check after this). I won't bother to mention
this issue for later patches, but you can assume it as a
general caveat to my reviewed-by tags.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
