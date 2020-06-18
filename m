Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1810793lfm;
        Thu, 18 Jun 2020 09:38:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNoZ3hTRr+jsWFzk2GMhMe593SvDVIQQbXIL9StOm766j5HGnhZYLnsS3nDDEj9NzFpam9
X-Received: by 2002:a25:8b05:: with SMTP id i5mr7673934ybl.301.1592498298138;
        Thu, 18 Jun 2020 09:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592498298; cv=none;
        d=google.com; s=arc-20160816;
        b=W8b1WhgE5JvwYUBOQCCeDJBiHvIqBDrD7aNulBfT/gI12bp2T4zgFUO93MHc5Wls+U
         kCQAFbSQtREHOJqYr8Mpuid1U9tH2DI62erbR0R79r5XB6qZMC9jA5t7i5EPh8yk2mhC
         QTjWVUTtV+/zUdIP0KMhTboYueqoSI3zRTysyqpNbxa7+QQ8xZugbqc3kho0rZAz7AB3
         b+Rbh3CMby0ebNjOGyf99D7MnMFegKxChrdZ4aRTvKjleeOd/+DGNrqf4disQCHJ4U1v
         VeT5xaiMp5XCubi/TbdTJA89T2hUYadNBgHu5AQ+RrLIFBMknqka4TtVTZPvjGulrP8S
         d1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PZonbftaCDc63VNz4v7l9NUr5JjVM0m0avU1O4pKiyg=;
        b=gu9Ix2Blb47cAzRqx60rzU7GvNnRW6AN79Z6W+eA1Vb9lMv8of6zq3xWbP0E3s7MMv
         W0Y2p4Hy9HwgoeHzAkgfoYQVKTlXv8FaLSyMxI8NFbMuS/PQE1yVUfYCw1qDrLmO//SV
         cm3AEO7wb4WW0BAxV2H5pnbqhnf93vUhUJa/WiguGM+edcULVdtKnaL24cD9Dot7iQbS
         H6EGZiVrsBT6Guh8ruSil+ilvW71L6/lV3shk0wnzlvXZJO/MIANy1CEj2/yofaJ2LjH
         o7+5OZCf2ikqHCR7f3Z41F+VZ/G/tc0lVUCy4RwCSqZIFXmWW+hdU7Fa5R6713LBC4A2
         P3mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vrV00q8P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n202si2926536ybf.48.2020.06.18.09.38.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 09:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vrV00q8P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlxYP-0004s7-GF
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 12:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxYI-0004qp-8W
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 12:38:10 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxYG-0003Vl-Pm
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 12:38:09 -0400
Received: by mail-ot1-x343.google.com with SMTP id m2so5002288otr.12
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 09:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PZonbftaCDc63VNz4v7l9NUr5JjVM0m0avU1O4pKiyg=;
 b=vrV00q8Pb45VJGvX7JMC6N278bdqIq8hGN60sJDGCSBKkQpBBP1T69yAs+c5sgZmBQ
 u2CxBBb1jDRk8WSH2dUCXoJIlsx507EDpthEFGmuK6iWRbxVEpwRpQt2ZUgSukhZGfdh
 AhN0kFClcu8ru1JFJVH+o8C1/jMP2dQ37dBuBxTDnTfkSkAXLRtNKxWbtdgoG9ZPUHb1
 0PpDrqyLKrchgxdU/ccPdB1L5croo3PDjMugPKkLLXjXTG1vudqcBkuqK4PXG/RzyAbw
 S84RkujXj/k5CUpJa5hItYsd4OSQ/N5orLEQCHXhUGZxBvx4XgS4QsvAisQungypls7f
 0GMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PZonbftaCDc63VNz4v7l9NUr5JjVM0m0avU1O4pKiyg=;
 b=sOEFOPn+FdZWBAYnh0VArafZeImBsv/NdyXCz9BCZG0FhsaNaFf3Iv1Kj1tLsSpU01
 udZCaHCl4Esg/tzeqv6DIj83cgpA6FNHv+3CtVpEsr95R4KEGuXLTmQQ0YJd3eFyMgP6
 GaZERYN27MrS3GSvUfBQt5+8Msau2wYa/fG26xDEqhC8HwacBQCViLitoLXRI/zYwxB8
 L+AoirrOZz1K9Dj7se2zBKYvAmPYrcphmeaHqqhmrALUcQ0V5bQxnQFlm2SypNp2FOoV
 EeIp/cvZDhrHU0bzhVPeKvGdBdglKuZS9nS/cRiSSFvlb0Yxolq89XP0qXnrFZ7TqP8g
 vGcQ==
X-Gm-Message-State: AOAM533g07aGS+LfySR3Xvb0aOvNXNHIYfjLVIdc7t6ZST9nEqs5wNDm
 gy4IhmMxtn9Ibunx4aSlXHhLv930TvibOd0PCYmgPw==
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr4238524oto.91.1592498287591; 
 Thu, 18 Jun 2020 09:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-26-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 17:37:56 +0100
Message-ID: <CAFEAcA9qwXRG8R+1QCjjx8Cqs3yCaDisWcpECTszZrVjKuJdxg@mail.gmail.com>
Subject: Re: [PATCH v7 25/42] target/arm: Implement helper_mte_check1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZJpYKpAuy0lj

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fill out the stub that was added earlier.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h  |  47 +++++++++++++++
>  target/arm/mte_helper.c | 126 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 172 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index fb92ef6b84..8ae80f3945 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1318,6 +1318,9 @@ FIELD(MTEDESC, WRITE, 8, 1)
>  FIELD(MTEDESC, ESIZE, 9, 5)
>  FIELD(MTEDESC, TSIZE, 14, 10)  /* mte_checkN only */
>
> +bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
> +uint64_t mte_check1(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
> +
>  static inline int allocation_tag_from_addr(uint64_t ptr)
>  {
>      return extract64(ptr, 56, 4);
> @@ -1328,4 +1331,48 @@ static inline uint64_t address_with_allocation_tag(uint64_t ptr, int rtag)
>      return deposit64(ptr, 56, 4, rtag);
>  }
>
> +/* Return true if tbi bits mean that the access is checked.  */
> +static inline bool tbi_check(uint32_t desc, int bit55)
> +{
> +    return (desc >> (R_MTEDESC_TBI_SHIFT + bit55)) & 1;
> +}
> +
> +/* Return true if tcma bits mean that the access is unchecked.  */
> +static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)

It's a bit confusing that one of these foo_check()s returns
"true for checked access" and the other one returns "true
for unchecked access"...

thanks
-- PMM
