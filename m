Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1580899lfc;
        Tue, 3 Dec 2019 06:30:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqxmsEhcDJTTopjfpK2Ma3zX9FmPEW2SxyrjAbYAVPaCsCTZOrWJPNj3XluYbIQvBpztYLDQ
X-Received: by 2002:a17:906:958e:: with SMTP id r14mr6209450ejx.228.1575383421460;
        Tue, 03 Dec 2019 06:30:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575383421; cv=none;
        d=google.com; s=arc-20160816;
        b=rhdVer9WNxQDf8Le7+UbVxfhol4Q87X7mWUSpMsMJIXgER5Vzc1Qyt3JwbdVmOy3VH
         qPUFDndJfuCCImnAbpa4S3ZHxVMs4F94D4hk0Xe5ikfDbfvxtZRns1rGBMvPjjGLDw52
         izRK8x3i2CmEnLP8LMUYaXYPGB6CAMbOykK+2iMEPx1H+utmIiCJ6xdHITNrLR2KurLQ
         A37nlCsbJUlrEbg01K1uPXsnDsulRdW4I2wFMhjecfpxSj9/tF+gaYycNM2w6IJqo22b
         mgICtpkdgln3oeHqYp4X4cccckNA5ZewzHnDtRWBKUDSi5Y8C86xYHFD93cGCsmAWQcy
         mtdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=InB6KgY6GCiRdq/2s1tuH0uEgrcaw+iAWR/7DGnezY8=;
        b=x7DXKldvFppCEAhlOhC1tvCpXkRA8UKP3mQgN3mndHLSCuan5g7yrdiegzdNalShBP
         42aVy1hGLnDgZI/q3hsSJCM1KUFobzcbLNmOrrQpkACFw8G2Fr2Q3TPEeESC5SdOMyCe
         JB9oe8EoUhK5c68a+p/b6ojsW5Pa1lr/zEg2U/Yaof0FsBkRYhI3BFHLXqc1+fdBisyN
         ncQBLFo9EN7p2VlHY+jaQ6y4qhIJOlS0CP3gmhS5xRNcwe0iQjRsq3Jf4LYSfKEq4pMZ
         yMoUqXPW4qlC1volDvkzRMDqRLI5Tyu+nDdRYiNrejrlkDkEkUs2PLTBb/a6/H+PkadJ
         WGyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M+LU6PAP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si2273841edf.164.2019.12.03.06.30.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 06:30:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M+LU6PAP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic9Bv-0002i0-By
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 09:30:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36658)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ic98U-0002Wk-TJ
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 09:26:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ic98J-0001cZ-Jf
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 09:26:37 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44137)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ic98J-0001GE-Dh
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 09:26:31 -0500
Received: by mail-ot1-x341.google.com with SMTP id x3so2999294oto.11
 for <qemu-devel@nongnu.org>; Tue, 03 Dec 2019 06:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=InB6KgY6GCiRdq/2s1tuH0uEgrcaw+iAWR/7DGnezY8=;
 b=M+LU6PAP0IoEiZ/YA2PoMVzZk9dRZYO/gX6co+4B0LdPxoPBw8vPeZGZqg5cRYUNrK
 CbKSMgiRNJP/uiuq67s49JexLbrrXsibIbVX7rtBRNG7MlXm3c0cIfEO7Rpj+RXO9//f
 QMUGNii5kQXU38xL04o1cpKl0TM5oIzzwNFyPdzbWTNGspKogrC9OCDWZFI+8d6tlSJF
 tkq04PyJ+PrBCdJVmvpHVkKbAarTbqf+ygSDk7WcRRb72eu8/0euBXbwqkA3cU0xbPsc
 tQcslOxwIrL6ke2fCV9Ca69OqfVrfo5pn9TP+V0mk6TNqQ3X55ODTauwEEAxbYiyd2Gb
 m9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=InB6KgY6GCiRdq/2s1tuH0uEgrcaw+iAWR/7DGnezY8=;
 b=LOgPfYIDm7WJIqI2B3E/xDBhEVLsgbJcp+s8AIm5Nd0n5EC6q+v/bWd7P/gLKIniHJ
 4ObUBmjE6lH+JIxgqm+PhTKB43HGLxo6n0b/9goaQfVywlfHuC/3jUPVvDuTD2gOVTo9
 comTP5aFLbsP3F/Jh2CKzDWWdz5ROesuT7ZbM6at0hl6PSjiN6X+MbmYaX/bfMlaaP02
 W7iiD6vcv3kAXUZZN31wvdmEc2sRkl/RArEDkllN4nWipWo+aKnsERoNKKAPp5qz+g5z
 umANxNt/mILPOWCzEZxCb+uLXVTAu5GK2Rn6EfDuzdxV7YLm8+uZH0aJrjONfcf+JCCt
 h8ZQ==
X-Gm-Message-State: APjAAAWETXdd0APrgV8Lekfxg4MJ/dh1Be+szKwcza6fkElo0yNq17zG
 VEhgCoA8bSitDAPFNXbGY2dsMGZqCSMdM342RDiRMw==
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr3400676otg.232.1575383183807; 
 Tue, 03 Dec 2019 06:26:23 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-7-richard.henderson@linaro.org>
In-Reply-To: <20191011134744.2477-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Dec 2019 14:26:13 +0000
Message-ID: <CAFEAcA-p7TJEBCD3nh7-c1eaBgPGus7wLG7xqMy9HKSoy=9PSw@mail.gmail.com>
Subject: Re: [PATCH v5 06/22] target/arm: Implement the IRG instruction
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tc++9Z/1OvrN

On Fri, 11 Oct 2019 at 14:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Update to 00eac5.
>     Merge choose_random_nonexcluded_tag into helper_irg since
>     that pseudo function no longer exists separately.
> ---
>  target/arm/helper-a64.h    |  1 +
>  target/arm/mte_helper.c    | 57 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-a64.c |  7 +++++
>  3 files changed, 65 insertions(+)
>
> diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
> index a82e21f15a..6ff7f5b756 100644
> --- a/target/arm/helper-a64.h
> +++ b/target/arm/helper-a64.h
> @@ -106,3 +106,4 @@ DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
>  DEF_HELPER_FLAGS_2(mte_check1, TCG_CALL_NO_WG, i64, env, i64)
>  DEF_HELPER_FLAGS_2(mte_check2, TCG_CALL_NO_WG, i64, env, i64)
>  DEF_HELPER_FLAGS_3(mte_check3, TCG_CALL_NO_WG, i64, env, i64, i32)
> +DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index bbb90cbe86..9848849a91 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -37,6 +37,31 @@ static int allocation_tag_from_addr(uint64_t ptr)
>      return extract64(ptr, 56, 4);
>  }
>
> +static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
> +{
> +    if (exclude == 0xffff) {
> +        return 0;
> +    }
> +    if (offset == 0) {
> +        while (exclude & (1 << tag)) {
> +            tag = (tag + 1) & 15;
> +        }
> +    } else {
> +        do {
> +            do {
> +                tag = (tag + 1) & 15;
> +            } while (exclude & (1 << tag));
> +        } while (--offset > 0);
> +    }

I feel like this would be easier to review if it matched
the logic the pseudocode uses, though I think the end result
comes out the same.

> +    return tag;
> +}
> +
> +static uint64_t address_with_allocation_tag(uint64_t ptr, int rtag)
> +{
> +    rtag -= extract64(ptr, 55, 1);
> +    return deposit64(ptr, 56, 4, rtag);

This doesn't match AArch64.AddressWithAllocationTag -- the
fiddling with bit 55 is unwanted.

> +}
> +
>  /*
>   * Perform a checked access for MTE.
>   * On arrival, TBI is known to enabled, as is allocation_tag_access_enabled.
> @@ -165,3 +190,35 @@ uint64_t HELPER(mte_check3)(CPUARMState *env, uint64_t dirty_ptr, uint32_t tbi)
>          return dirty_ptr;
>      }
>  }
> +
> +uint64_t HELPER(irg)(CPUARMState *env, uint64_t rn, uint64_t rm)
> +{
> +    int el = arm_current_el(env);
> +    uint64_t sctlr = arm_sctlr(env, el);
> +    int rtag = 0;
> +
> +    if (allocation_tag_access_enabled(env, el, sctlr)) {
> +        /*
> +         * Our IMPDEF choice for GCR_EL1.RRND==1 is to behave as if
> +         * GCR_EL1.RRND==0, always producing deterministic results.
> +         */
> +        uint16_t exclude = extract32(rm | env->cp15.gcr_el1, 0, 16);
> +        int start = extract32(env->cp15.rgsr_el1, 0, 4);
> +        int seed = extract32(env->cp15.rgsr_el1, 8, 16);
> +        int offset, i;
> +
> +        /* RandomTag */
> +        for (i = offset = 0; i < 4; ++i) {
> +            /* NextRandomTagBit */
> +            int top = (extract32(seed, 5, 1) ^ extract32(seed, 3, 1) ^
> +                       extract32(seed, 2, 1) ^ extract32(seed, 0, 1));
> +            seed = (top << 15) | (seed >> 1);
> +            offset |= top << i;
> +        }
> +        rtag = choose_nonexcluded_tag(start, offset, exclude);
> +
> +        env->cp15.rgsr_el1 = rtag | (seed << 8);
> +    }
> +
> +    return address_with_allocation_tag(rn, rtag);
> +}
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 18d45fba87..83d253d67f 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -5156,6 +5156,13 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
>      case 3: /* SDIV */
>          handle_div(s, true, sf, rm, rn, rd);
>          break;
> +    case 4: /* IRG */
> +        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
> +            goto do_unallocated;
> +        }
> +        gen_helper_irg(cpu_reg_sp(s, rd), cpu_env,
> +                       cpu_reg_sp(s, rn), cpu_reg(s, rm));

In the case of "we only have mte_insn_reg, not full MTE",
the allocation tag we insert into the address must always
be zero, so you could just special case this and emit code
inline to clear bits [59:56]. The code as it stands works
because we ensure that the guest can't set the SCTLR.*ATA*
bits. (That's a bit inconsistent with our approach to the
PSTATE.TCO bit, which we do allow a guest to toggle, but
the inconsistency is permitted by the architecture.) I'm
not sure whether "we only have the EL0 visible bits" is
going to be a common enough config to care about to
special-case.

thanks
-- PMM
