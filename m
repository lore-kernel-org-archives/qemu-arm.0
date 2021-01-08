Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp531947lfq;
        Fri, 8 Jan 2021 06:15:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdCQyLk1baAf7SvfGb8LTDRGhnXHflZzoQ4xv9LToiaH25c4tKnEiPaHuaxoY8a3ogzRbj
X-Received: by 2002:a25:da56:: with SMTP id n83mr5657080ybf.265.1610115352967;
        Fri, 08 Jan 2021 06:15:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610115352; cv=none;
        d=google.com; s=arc-20160816;
        b=LLHJV+4ReCqTFu7ibSb85kHJsZkVSXIcoEOoUwySU9TdOImN1HKHYfyvBYLAm6lw5/
         owuPOD23g5tiSuWVc157330cSPFoerLUQXMGYgmCR7lTC81D3KeQhjPXGin3cWwFDcDJ
         /0oUhG7V+h61DfSj3AbcSVMR5H6wM0Z55ojj7fBtq5oo8Bf0+QvnZesAvOBIFT8mfPV0
         70LZ6uZa75B848ThkucqTk0lKWNlUBqFY5Syf9JCSiuzyVLalsPh0lM302SdOlJ8psuw
         b8iPeXmWeVEoUvd09WjcjHUsA75NblyhwcfchB50WE2Yl012cvs4NIuk+73idCSHWLjT
         Apiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PC4MWs3iyKPd4utj/FSXQHOmAjGulN6flg4XLteTLLo=;
        b=jDNvl6VZAwY603aKLr6C48qx6BFZJ3JedsvZXPoe1juZYu0/XLx1dztXXd98jwydTK
         bGn5qj2IR7BOUcueQWMJA/lDhrCuuTQRgYcFowMcgdJiUEvyH2gzlnFjK0OHJZp38ERx
         a9ylgpQ9HfkPKMDTTIuoDDpcuahVDs5JCH7/M4hsJ7pPv9aiKx2igeeQjK1KKDTFcKnO
         l0o5+zQu1Ja3Kgh6X9onGr2PdUFIU2aWSVe0cWqC1C6wjtWek69VB/PTm+3bpmRh0L6z
         Px0rRe0GsaMr4LhRVXbpJYgCPQpdKsbvLUdxYTjo75CTXmxzbHR74VqCI8gl2d8ue/7j
         DlYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FHuFjJr+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si9065439ybm.220.2021.01.08.06.15.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 06:15:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FHuFjJr+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxsYS-0002w0-CS
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 09:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxsYD-0002uB-WE
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 09:15:38 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxsYA-0007w2-6E
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 09:15:36 -0500
Received: by mail-ej1-x634.google.com with SMTP id g20so14783854ejb.1
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 06:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PC4MWs3iyKPd4utj/FSXQHOmAjGulN6flg4XLteTLLo=;
 b=FHuFjJr+BwzpJITJIrGrGxI8BY2S4IfQl7xq1BJmwjTTnBRN/xAyhrfVTv3uQw80II
 FtC/eFPQvw/yvHw0LeMNcSi0vS35y5R2rg5Oq6WVyIL0DNfpgY8FyN3fy4xzg4wuBGeI
 bEkiGQIipLvjr5yPE9aB1m4rTHGPPo6oPSTN7b/3Ln96xP6sxG7LY92O2dnaYUBHgi7a
 83HGexGi/hmmgWewFXVOvDp+1/VUcmcDtYRKEGWr7+Q7UhMBfKMzuDFKAalCkHkqxboW
 grrBK8yfSWp9G/iarLmGwwo33SKacIDep9M6FNepQ/BUzTXceTzLHSlkNlViwe877cn6
 mOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PC4MWs3iyKPd4utj/FSXQHOmAjGulN6flg4XLteTLLo=;
 b=uVGC4n489yXSKQ9k4oj3f7ZMiXryXcOnct/z7yB6sDdAYFpkBlzbX7cBg+ACDjKjzy
 8vGyUZGEjVXKc41ysYpUGQqWZckhuLqhgNCvz2+XbmaJRD8UpoAguJV3LUSAfB5vXt+6
 HbuJFmmgalwBUX/aVERPAIvWjZfyB0swrcyHiEu5JeM7N0DfbS/cQZ+KJ853uC+mga/x
 ssc00Q54Z986+l6CA9f5k3a22sLbuvUbWaUWxKdu1RKYS1zjk+Rn6ZcR4Et63K/4rqmU
 ZJuMRzhMXZRNAPNMsYUgeFpYL+6jBrRvCV3UwE53E2CDXH0cD2HXh2X/MS0JthGBrqwF
 ZC+w==
X-Gm-Message-State: AOAM530ktrBRG6umJgms0FlhH6cN81gz0u/dthIbQbsMg6+48YHNXyOU
 GQ+CRV1RLvWe7HT1I8WoOFtSyME/k9VWrqgCYXJ/uQ==
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr2793914ejf.85.1610115331730; 
 Fri, 08 Jan 2021 06:15:31 -0800 (PST)
MIME-Version: 1.0
References: <20201216221247.522686-1-richard.henderson@linaro.org>
 <20201216221247.522686-2-richard.henderson@linaro.org>
In-Reply-To: <20201216221247.522686-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 14:15:20 +0000
Message-ID: <CAFEAcA8zz2ApaqE7h7LEhPML2KZLysQ9i2e7msDB0nhdJKkDnw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] target/arm: Implement an IMPDEF pauth algorithm
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Mark Rutland <mark.rutland@arm.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pFdqtBrIDpO2

On Wed, 16 Dec 2020 at 22:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Without hardware acceleration, a cryptographically strong
> algorithm is too expensive for pauth_computepac.
>
> Even with hardware accel, we are not currently expecting
> to link the linux-user binaries to any crypto libraries,
> and doing so would generally make the --static build fail.
>
> So choose XXH64 as a reasonably quick and decent hash.
>
> Tested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Move the XXH64 bits to xxhash.h (ajb).
>     Create isar_feature_aa64_pauth_arch and fixup a comment
>     in isar_feature_aa64_pauth that no longer applies.
> ---

> +static uint64_t pauth_computepac_impdef(uint64_t data, uint64_t modifier,
> +                                        ARMPACKey key)
> +{
> +    /*
> +     * The XXH64 algorithmm, simplified for size 32.
> +     * See the description of the algorithm in xxhash.h.
> +     */
> +    uint64_t v1 = QEMU_XXHASH_SEED + XXH_PRIME64_1 + XXH_PRIME64_2;
> +    uint64_t v2 = QEMU_XXHASH_SEED + XXH_PRIME64_2;
> +    uint64_t v3 = QEMU_XXHASH_SEED + 0;
> +    uint64_t v4 = QEMU_XXHASH_SEED - XXH_PRIME64_1;
> +
> +    v1 = XXH64_round(v1, data);
> +    v2 = XXH64_round(v2, modifier);
> +    v3 = XXH64_round(v3, key.lo);
> +    v4 = XXH64_round(v4, key.hi);
> +
> +    return XXH64_avalanche(XXH64_mergerounds(v1, v2, v3, v4));

Since the only use of xxh64 we make is "feed in 4 64 bit inputs
and get a 64 bit result", why provide all the components and
stitch them together here rather than following the existing
pattern we have for qemu_xxhash* (the xxh32 algorithm) and
providing a function
 static inline uint64_t qemu_xxhash64_4(uint64_t a, uint64_t b,
                                        uint64_t c, uint64_t d)
in xxhash.h ?

thanks
-- PMM
