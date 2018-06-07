Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1935624wrq;
        Thu, 7 Jun 2018 03:45:58 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLFwjXnkTEGHDKue75QazsDidXw6134pkN1bfAXqdaA5L05AjVAHCxJg4g5zNGATYw3+mug
X-Received: by 2002:a37:9c02:: with SMTP id f2-v6mr946940qke.65.1528368358065;
        Thu, 07 Jun 2018 03:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528368358; cv=none;
        d=google.com; s=arc-20160816;
        b=zbfDVEl1/c/cIMh0TI+Fu51mDejQSq8FIgHeSOTGdyW+EJHk57vPjjniwEveEAMuqO
         hG31S+UusrUR724WimQRDKDPhzbglTKnxEILMzuwT1SDXB9/SxbRIKZ8cqBb2HR9X91F
         qY0/svdLh6XQb9U4sN8tWnmpRCfkrmsd5wBgJQOLBYhrWKFdb7tQL1gvwXHNXQ88eEIj
         bNhaIpxTdXh4L+RDccChL87mT6VoijuOX9J88DZcRkJk+qn6ZVJ6s7mMiYaWe3GPgV+c
         sirPot1CReF8Xkmhjh1/KfUL0QVUjgXtAgTKADNQwtuUAbBaXvTR3uHNHAw1KHrkhspz
         H+Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=jfyFNDioa3PdKomTbB3T3qsoZ88grEFCtDzQ2Wh2DjM=;
        b=eseq6UYY8TAS/DVpej4jJxN9sBUs5xseibLWlv8dguB2a0G6HbXVQcSqDcf8S111RQ
         xFgPuBxkfQVqvWUI+Z7aIv0ZczIGUyLx21IOynPfNLZTdN3WfoWtBfInElcJy7po3Bdr
         aGFvbv4YMRRmU+FGevDtVTyHTeYDaes3yQbm3yMmljcpLyGGOzoaoFYegyzKjx1S7b3H
         hOsAy1HuEc+MsNiHDCKtPylAA0mElp22fqqpgeJ+zPtlN2a7l+4kLJ9h6nuNzVUxLw3p
         1ONWdmhrQA0SB5BAqhHpl7UKXmUvlUaliDLN6Uy6YmTXG0Qatrjh+BrGWP1BErWRZhtA
         uBJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GhMIhHJ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p42-v6si5716767qtj.309.2018.06.07.03.45.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 03:45:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GhMIhHJ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQsQX-0007xd-LB
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 06:45:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQsQ8-0007lb-8C
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 06:45:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQsQ7-0007hi-3C
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 06:45:32 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:41756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fQsQ6-0007gX-Ob
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 06:45:30 -0400
Received: by mail-ot0-x242.google.com with SMTP id d19-v6so5400623oti.8
	for <qemu-arm@nongnu.org>; Thu, 07 Jun 2018 03:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jfyFNDioa3PdKomTbB3T3qsoZ88grEFCtDzQ2Wh2DjM=;
	b=GhMIhHJ2Vz2jVwdMEnEJGbpUtmEge+Y5v5BH2s+JWZ68lD5sQgq04C+1RvMnV7Z5Vb
	4jub/WpMqc6ViJ0v41H1aGdGNgigf+jVAoMRm9kmSpdb2eitFG16UOPl6LRR+6EM6Avc
	dNL+xBv9817Ztwcwq31VPdo6K0bXaTp9AdBEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jfyFNDioa3PdKomTbB3T3qsoZ88grEFCtDzQ2Wh2DjM=;
	b=s1b1scLun40nelNGZ9O35d3HFXdjNnAaxrlShUxXGfcaCsg1/Cy0uAavei6MIPOCHb
	UL7OBFoEpDUEYxLEo/cVuS3xyNLGjyVlHrkzpVIZwACX9khYw01ZrGeIvpCudjI0ewss
	AH6NGtO10Xg12IANtuolvTjjy7+VQe0ihwtayPzbjaqjceeN52re5jjYCBGZc1+W/TdR
	Klj5f/W1JEw7+AAO3RSKs7WqtcX/Exzcyt3uaCtOBYHezKMOoIIUCFI9dMdHP0JlK8GW
	F79N9PfgnOTOwXKcl2RvnNhiE6OEIkmNq2DrAOnwPjvh5m/ZEn3FrLY+P7AxxIi1tEuF
	ZPzg==
X-Gm-Message-State: APt69E2I4S+uQp6lLkzUkihYFj7XYD0yoX+mrkaIaqilGKZeAMq69wph
	30FzMYJ2YnGQ9QEQNilC/Y3myW3PNUYOBs7E6b901w==
X-Received: by 2002:a9d:2909:: with SMTP id d9-v6mr605555otb.258.1528368330014;
	Thu, 07 Jun 2018 03:45:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 03:45:09 -0700 (PDT)
In-Reply-To: <20180530180120.13355-19-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
	<20180530180120.13355-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jun 2018 11:45:09 +0100
Message-ID: <CAFEAcA-ZOrn0dHX9qhrsMsBVPLTVJp_EMjQi4q4JfgTABPXkzg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v3b 18/18] target/arm: Implement SVE Floating
 Point Arithmetic - Unpredicated Group
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
X-TUID: +R+WIKHPbc1H

On 30 May 2018 at 19:01, Richard Henderson <richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 14 ++++++++
>  target/arm/helper.h        | 19 +++++++++++
>  target/arm/translate-sve.c | 42 +++++++++++++++++++++++
>  target/arm/vec_helper.c    | 69 ++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 10 ++++++
>  5 files changed, 154 insertions(+)
>

> +DO_3OP(gvec_fadd_h, float16_add, float16)
> +DO_3OP(gvec_fadd_s, float32_add, float32)
> +DO_3OP(gvec_fadd_d, float64_add, float64)
> +
> +DO_3OP(gvec_fsub_h, float16_sub, float16)
> +DO_3OP(gvec_fsub_s, float32_sub, float32)
> +DO_3OP(gvec_fsub_d, float64_sub, float64)
> +
> +DO_3OP(gvec_fmul_h, float16_mul, float16)
> +DO_3OP(gvec_fmul_s, float32_mul, float32)
> +DO_3OP(gvec_fmul_d, float64_mul, float64)
> +
> +DO_3OP(gvec_ftsmul_h, float16_ftsmul, float16)
> +DO_3OP(gvec_ftsmul_s, float32_ftsmul, float32)
> +DO_3OP(gvec_ftsmul_d, float64_ftsmul, float64)
> +
> +#ifdef TARGET_AARCH64
> +
> +DO_3OP(gvec_recps_h, helper_recpsf_f16, float16)
> +DO_3OP(gvec_recps_s, helper_recpsf_f32, float32)
> +DO_3OP(gvec_recps_d, helper_recpsf_f64, float64)
> +
> +DO_3OP(gvec_rsqrts_h, helper_rsqrtsf_f16, float16)
> +DO_3OP(gvec_rsqrts_s, helper_rsqrtsf_f32, float32)
> +DO_3OP(gvec_rsqrts_d, helper_rsqrtsf_f64, float64)
> +
> +#endif
> +#undef DO_3OP

Why do only these ones need to be guarded by the TARGET_AARCH64 ifdef?


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
