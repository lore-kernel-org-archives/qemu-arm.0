Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2035921ejy;
        Tue, 20 Sep 2022 14:06:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5DbOhKdnDzwyPOOu3vW7E9xnXDhbGbDFmiNbx6revoeIdMbtjbFtnArPKO8BVN4G47SfHw
X-Received: by 2002:a0c:f4cd:0:b0:4a1:7554:c7f4 with SMTP id o13-20020a0cf4cd000000b004a17554c7f4mr21473489qvm.78.1663707994143;
        Tue, 20 Sep 2022 14:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663707994; cv=none;
        d=google.com; s=arc-20160816;
        b=Yj1IFQzgA/N+BnlGVQKgPkKKX0NRNCBJDq7/9yzlVNoxSWHZlM/FYWXUOXyQwtx4BY
         HLVQ8gxjlDBdOqADskniTvxx/VAe69zGywhb5mmDFK0+Jz9lbsaPNKVHGBMCl8plRvC1
         9D1VapX88/yTsSnQh6E9joibrO8aeCdZbUf7HWK6FiSwHzDNWK/Oae45CvxTGXAiS9Sn
         8UzrTmOFqYcUkYNcKJXlMlrsEoT4Ymp5sA6aO0d1wZd2hJcIbLUqQEc29p2a/W2bZBP6
         oUL1Ul8cyHnkLMLjJ75D67zi4AHZ4mZPbUueSRBeUoDn9WY184bbGcHKIoT2lr7LltTq
         +ejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=sHIbIj5CKF3dCNxY69abzfTvIJ32BVUVenHaLj9we48=;
        b=X7k1RYBmxu6xs38ZMJKYOWuO1+Ps6Whsxl5ibg9S/CXxVc8HAGAyed46/thEVkRz9B
         qzSwzoj0+TvjXuLeNv6woj0y3Jk8oVATdEPM9Nsllxpq5WgAyZFN38DYfHCmnG2tnTmB
         Vmyut+MpGVLWLuOxajQQCAW2UmwoYJmA7rfft1I0PPCPk8VfSFsOMkIjJ9oCBiqlR0Qm
         EIHuiUlkWVtpFSvQgY6XE9uIqcUL9HDPRKkS2TqItr9XbD/n319CUEAGQZrL6CGmmTKI
         4H20POG5Nlhgr3I6kiAh01+r8TM1sPXYVEBWBX9u0yQnXlKjaPTzMto+d3HXlvyXDvNv
         wDjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YrBrRA9n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cc19-20020a05622a411300b0035a657d8e61si436933qtb.50.2022.09.20.14.06.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 14:06:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YrBrRA9n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oakRt-0004S1-Cc
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 17:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafoq-00077w-L4
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:10:01 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:41525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafom-0006Rr-TY
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:09:54 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z97so4531186ede.8
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 09:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=sHIbIj5CKF3dCNxY69abzfTvIJ32BVUVenHaLj9we48=;
 b=YrBrRA9ndkqeAZwM5xdVJeMvqvcTfzoc2SZ8DCBxUf+oSM4rYuu2+ws/VrE5ZCYj8C
 4kZpClJUoPGsmY10WUGjq7PEphs3dSdGjksaAAfF4nbbOn4gBRI/J8GfPxrK9QYmgYr2
 yZ7Uzfx2v6h5c9IVvRSpGimXpiUFM3YqYuTzITcSfQMKSpfwjC5lG0phFloEa9t6wrTO
 HXtwBhHJVruNWr5UmS1aMC0PrSv+kZSlO7VTAdwaXBjgYQ1BsQRLkmGfbHXYBL2B5yjx
 cpv0z5gNkix25ySaxrvWjcLa3DNSCuRd1kFYm3blhrL+Oj82nhMNNwWnQ45I7Mt7zG1s
 jthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=sHIbIj5CKF3dCNxY69abzfTvIJ32BVUVenHaLj9we48=;
 b=OerBE8tgU6/JdnRiCplD9hBBDctkpFhWko69UV72Ud6ORynV9sNF/gTkX5o0ab+6oO
 QzkI+GPtYPGvJh48VdIHyMTQKYsYxbjD0p3dMP+SRJFXiSgUVFZRIAcRZTE/XCB72M2J
 vBlFNN3NVheH72kL5jET7wyZI679anvIGcCZBZrFQMz/uTEke0PzBGbHbo4oafVroWJY
 lcog7eKRXELgmSbxu1gKGBfKYsaOuWGpklPprjOMplWEhiKLCBDT+8Mar5VKaRc1mzFC
 B9DpTojcQoHjDwDY4xWXMhVyx4pSAJuFLXlrJ8WcCLEO7h2L5+xWbYKZeh4AiEkWPtyQ
 UfEQ==
X-Gm-Message-State: ACrzQf3q/6Pk+td0hxl02djMbp4khfdUfet7aJRbjYXVUZwXvYYdEiFY
 Hljrl0vuB6iOSiZobEeGD3W1/70C3eyX3QTpzdHtFQ==
X-Received: by 2002:a05:6402:11d4:b0:452:a97c:cd36 with SMTP id
 j20-20020a05640211d400b00452a97ccd36mr21144206edw.53.1663690191317; Tue, 20
 Sep 2022 09:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-35-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 17:09:39 +0100
Message-ID: <CAFEAcA_6MqDz3586oDo=Txn+1iYjmCsZh5-K2ESTB_mGVu4HTg@mail.gmail.com>
Subject: Re: [PATCH v2 34/66] target/arm: Fix ATS12NSO* from S PL1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rah4cd5suTZH

On Mon, 22 Aug 2022 at 17:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use arm_hcr_el2_eff_secstate instead of arm_hcr_el2_eff, so
> that we use is_state instead of the currend security state.

"is_secure", "current"

> These AT* operations have been broken since arm_hcr_el2_eff
> gained a check for "el2 enabled" for Secure EL2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index fe06bb032b..4da932b464 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -146,7 +146,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
>          }
>      }
>
> -    hcr_el2 = arm_hcr_el2_eff(env);
> +    hcr_el2 = arm_hcr_el2_eff_secstate(env, is_secure);
>
>      switch (mmu_idx) {
>      case ARMMMUIdx_Stage2:
> @@ -230,7 +230,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
>              return ~0;
>          }
>
> -        hcr = arm_hcr_el2_eff(env);
> +        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
>          if ((hcr & HCR_PTW) && ptw_attrs_are_device(hcr, s2.cacheattrs)) {
>              /*
>               * PTW set and S1 walk touched S2 Device memory:
> @@ -2360,7 +2360,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
>              }
>
>              /* Combine the S1 and S2 cache attributes. */
> -            hcr = arm_hcr_el2_eff(env);
> +            hcr = arm_hcr_el2_eff_secstate(env, is_secure);
>              if (hcr & HCR_DC) {
>                  /*
>                   * HCR.DC forces the first stage attributes to
> @@ -2493,7 +2493,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
>          result->page_size = TARGET_PAGE_SIZE;
>
>          /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
> -        hcr = arm_hcr_el2_eff(env);
> +        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
>          result->cacheattrs.shareability = 0;
>          result->cacheattrs.is_s2_format = false;
>          if (hcr & HCR_DC) {
> --
> 2.34.1

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
