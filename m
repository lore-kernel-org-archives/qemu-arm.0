Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp470987lfg;
        Thu, 13 May 2021 06:01:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxppaEEIn6bOaFSqW3Ccz5DundaLtgJ4dktIZb8vZqdEtXMMY0319gK86QNRC0kyYhcphA
X-Received: by 2002:adf:ff81:: with SMTP id j1mr52207139wrr.336.1620910880007;
        Thu, 13 May 2021 06:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620910880; cv=none;
        d=google.com; s=arc-20160816;
        b=RyFwcxCx2ru5WJOHUhz1EUce0apgMv1f5NzoMRwQFU8ssy49RGUX1p4Zyg2bm4eGD4
         VpAD3yKtuw1bB/HKUlTVvyQo/P7ob3KhqJeaWi3cTFssdpzJCxTipXwLvg/mUdBRGZfr
         VdoQhX3uXNi+iZVZS0JXphqGuR9yjCUtDUFvscOo9mLGbQsNhc3it5VCqEg4I7NAEg0W
         +2mLOJGsRtrcD4TUm2cyAkD2bnjGfgTuzQxOBj03bxb0o+4frYn5f3Wo9gK25KUSfNul
         HnRL7ir1zKQpcYqgZw32c6k3nLf9pG1tOf99gIBiynRO2kCRAJIHfCIaWrg2p62mKAA0
         511Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d6TNWsnEBtZatUpZMkhULE6wWhpmubgHRH7qdrGA3bM=;
        b=NSDj7PW/PpJDwZzxsbNztzCpsnPBnFthuZTjhKTWw8JDJ6iT+llJSK4n5BRbwUAu3+
         9ZkOshJtBmJmbJfRI0RdB8z/LmadiFbmt82+aWG50Dj4ZKAN5/1txvxQ0z8uNFmJKdDb
         9xPwgTAsyac0cUZY2idmiYLjsYq4XPob6O3B4x1RBEOvTuqDYH13KJjeD/BOiYRT++mO
         XvOFDGBBchNfC6GRFUu0DZP7xiOTU4aqVE99Yk6cmvUj9wWTayyR/M/8uaW6nnEb7vjJ
         SqH3HsQpFT/BCyjyaeFz05kj+PcN9z1WHFz12rC9hC+7Ywl3p/OTBsBrZyoulGIJLd9n
         TpMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OUEMV5PG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10si2576157wmj.164.2021.05.13.06.01.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 06:01:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OUEMV5PG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhAxq-0006QV-Rq
	for alex.bennee@linaro.org; Thu, 13 May 2021 09:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAuw-0003fA-RY
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:58:19 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:41514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAuq-00064D-J5
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:58:17 -0400
Received: by mail-ed1-x52b.google.com with SMTP id v5so19775466edc.8
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d6TNWsnEBtZatUpZMkhULE6wWhpmubgHRH7qdrGA3bM=;
 b=OUEMV5PGovxrAImh0ZJwcKH2zQjRwFkR1PTHfUPVHqOCdcF47lRmgrfmxfa6foAxf1
 MLh9qyenq7qAOEZpwsN86uqW0sBv6mSeABk5YPqekk3aHBq4gb5EltxAJXyleGTq6jRq
 TiaxA9AWaZrAE8N1lIhZnNa1AY0pP3Ywv4a7wfR7xfMyzxA8K+UMr+BwK64Kbg8RxfF0
 /wd2Cixx3RXOKB9nWPGz/YrQst7Y1VKFibpr8JbwUOLThHSHWnmyEDX8qN9+kP0AL2po
 DcYa0QfToBuGnIf6QE+fk2YzhhYckKboSejoyr1uAGoxFelDMDfMdc+jwmAlA2SrwykN
 nrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d6TNWsnEBtZatUpZMkhULE6wWhpmubgHRH7qdrGA3bM=;
 b=tEONtdlfncAf81xgjHs5TiTgnzYuc2wtMdNWsJtWr4/qOBhHRNHJ/c2wU9kJ5m6ZiK
 GhIQvyL7V3MgcXUrJhz1gWgOepTqrNAanxjVw76vyQiqdrceD6yiS/R7rK26lh/S2ywH
 2i5KFr6gRUeg+jrPRFOIIVnukkcXJWCp16yLcIB4PH6wxggmMbV4hsiDZzSAOsVj9KMO
 iASOnhaaw2QCLr2IpIDlHXzSE+ICY/nI9KDD8sfkfisfYG/97XtLhCuVqlAvJse6mupG
 T528gOBJkcbP+g/hGhQfrh0OpX8cWq2nNQvq235McIDu5gokpwxDFea+KvnEXsZffmYj
 qrcw==
X-Gm-Message-State: AOAM533KFulp9BnWZPlUtYWpOyR/nRy3McS/IWPhrxHn81cYgqoW8aPs
 X7/59bxk/u+NMEe21QsjFunQMEoM8SKH+MadYrcVRw==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr49487257edv.44.1620910690374; 
 Thu, 13 May 2021 05:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-60-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-60-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 13:57:59 +0100
Message-ID: <CAFEAcA-_SNn6bM52KV5z5v8tLS1e=-Si+KiC_gi-3oykV1Rzkg@mail.gmail.com>
Subject: Re: [PATCH v6 59/82] target/arm: Implement SVE mixed sign dot product
 (indexed)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: 3EO3iKyvQ+ir

On Fri, 30 Apr 2021 at 22:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           |  5 +++
>  target/arm/helper.h        |  4 +++
>  target/arm/sve.decode      |  4 +++
>  target/arm/translate-sve.c | 16 +++++++++
>  target/arm/vec_helper.c    | 68 ++++++++++++++++++++++++++++++++++++++
>  5 files changed, 97 insertions(+)

> diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
> index 8b7269d8e1..98b707f4f5 100644
> --- a/target/arm/vec_helper.c
> +++ b/target/arm/vec_helper.c
> @@ -677,6 +677,74 @@ void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm,
>      clear_tail(d, opr_sz, simd_maxsz(desc));
>  }
>
> +void HELPER(gvec_sudot_idx_b)(void *vd, void *vn, void *vm,
> +                              void *va, uint32_t desc)
> +{
> +    intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
> +    intptr_t index = simd_data(desc);
> +    int32_t *d = vd, *a = va;
> +    int8_t *n = vn;
> +    uint8_t *m_indexed = (uint8_t *)vm + index * 4;
> +
> +    /*
> +     * Notice the special case of opr_sz == 8, from aa64/aa32 advsimd.
> +     * Otherwise opr_sz is a multiple of 16.
> +     */

These are only used by SVE, aren't they ? I guess maintaining
the parallelism with the helpers that are shared is worthwhile.

> +    segend = MIN(4, opr_sz_4);
> +    i = 0;
> +    do {
> +        uint8_t m0 = m_indexed[i * 4 + 0];
> +        uint8_t m1 = m_indexed[i * 4 + 1];
> +        uint8_t m2 = m_indexed[i * 4 + 2];
> +        uint8_t m3 = m_indexed[i * 4 + 3];
> +
> +        do {
> +            d[i] = (a[i] +
> +                    n[i * 4 + 0] * m0 +
> +                    n[i * 4 + 1] * m1 +
> +                    n[i * 4 + 2] * m2 +
> +                    n[i * 4 + 3] * m3);
> +        } while (++i < segend);
> +        segend = i + 4;
> +    } while (i < opr_sz_4);
> +
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> +
> +void HELPER(gvec_usdot_idx_b)(void *vd, void *vn, void *vm,
> +                              void *va, uint32_t desc)
> +{
> +    intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
> +    intptr_t index = simd_data(desc);
> +    uint32_t *d = vd, *a = va;
> +    uint8_t *n = vn;
> +    int8_t *m_indexed = (int8_t *)vm + index * 4;
> +
> +    /*
> +     * Notice the special case of opr_sz == 8, from aa64/aa32 advsimd.
> +     * Otherwise opr_sz is a multiple of 16.
> +     */
> +    segend = MIN(4, opr_sz_4);
> +    i = 0;
> +    do {
> +        int8_t m0 = m_indexed[i * 4 + 0];
> +        int8_t m1 = m_indexed[i * 4 + 1];
> +        int8_t m2 = m_indexed[i * 4 + 2];
> +        int8_t m3 = m_indexed[i * 4 + 3];
> +
> +        do {
> +            d[i] = (a[i] +
> +                    n[i * 4 + 0] * m0 +
> +                    n[i * 4 + 1] * m1 +
> +                    n[i * 4 + 2] * m2 +
> +                    n[i * 4 + 3] * m3);
> +        } while (++i < segend);
> +        segend = i + 4;
> +    } while (i < opr_sz_4);
> +
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}

Maybe we should macroify this, as unless I'm misreading them
gvec_sdot_idx_b, gvec_udot_idx_b, gvec_sudot_idx_b and gvec_usdot_idx_b
only differ in the types of the index and the data.

But if you'd rather not you can have a
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
for this version.

thanks
-- PMM
