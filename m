Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3678712ejx;
        Mon, 5 Dec 2022 08:51:06 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5OAkRFGCWGsyo+VFh/EaybjH9/6De05DJV7fF3Fq2eLakq2kxGD3AAvX3s1+Pa0IXvlv6j
X-Received: by 2002:a05:620a:2e7:b0:6fc:9a48:eddf with SMTP id a7-20020a05620a02e700b006fc9a48eddfmr2001944qko.458.1670259066736;
        Mon, 05 Dec 2022 08:51:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670259066; cv=none;
        d=google.com; s=arc-20160816;
        b=NYnx9AGLbxHOKz2nuHV3JhXRY6ZhYnRryfhfUNcNW2KXMhp1j6Xbfxc8gSTpZMvtaa
         jkQ5wMYoGmoQl2kUhLD4B1+z3Yv76S2TwUj0JdJ93OJh+DvalngSj6s03Ns8cv9cl6fR
         yD/MAOUAGoPU6hpIBfGDAU7c0OMtfj8iQ/9faiV44/62m5v/ZqYApFkIhn7nQp1L76II
         1Ogfu0DR+i042Gqyo8mCBADjewptMrFx0C040ITRXdxjUG48S1drkCfrqwb+pBLTHuSJ
         h2prMI5RSvDvUpzikQRQ+UwX5h0UQyXBfSb8ziRCA86o0M68RoB9dygnUqJ8Yi7Md8Ij
         J3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Y6C6MAUioop+DtdSfdnLhzwpeD9w+vPUAVhC0ElJtXo=;
        b=hUg5siUI+ox5VIUtQkaC4yrFls8ezyLNiY6acdNDNX0J+Gf2ZvxCVp1fAib1D8a/ZT
         IunrRVuK7BG/N28OkFb69XBlBOVWmTiAb4xFdoAkdukrmRgMhGsMPhY48pvnci+8WafC
         5QcjNLT4qM8+7eht4neb5MSHGUytY6VVr3Vh6j4sTEHidJIWFokN1EK8GQTFhhZSTV+8
         UkYm3qbvEmBEP8g6dn6VLmMx7RqhfteJom/lQ+3QdhUOtl3rXdqoSs8xojv+Optw5Lmi
         LNwYK3QPzE4JR9vzjxqN+pF2llqWCzhZggKAlnMKhqdS1DXWG5eC2+LRVXiY4lu8/VGD
         xtAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uhRLgoP7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020a05620a158900b006ed277c6079si487127qkk.122.2022.12.05.08.51.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Dec 2022 08:51:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uhRLgoP7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p2Efo-0000YX-E4; Mon, 05 Dec 2022 11:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2Efn-0000Xq-CI
 for qemu-arm@nongnu.org; Mon, 05 Dec 2022 11:50:31 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2Efl-0000Mr-Q0
 for qemu-arm@nongnu.org; Mon, 05 Dec 2022 11:50:31 -0500
Received: by mail-pf1-x42e.google.com with SMTP id 124so11992214pfy.0
 for <qemu-arm@nongnu.org>; Mon, 05 Dec 2022 08:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y6C6MAUioop+DtdSfdnLhzwpeD9w+vPUAVhC0ElJtXo=;
 b=uhRLgoP77qUV+Y0hOxwUTnI9CUdA9o4uL0X+pi8RnLe49s7JJOIhcu+h7OUfMuHtAJ
 oXVp5BtvAT4Vj+mgU44zT34uGEXtpAPQsLA8QhxTKxvOCVj/fCGYhdXPl9aezWleeuQW
 bCRIxtMWJrV58UtL1e7gbE9mBMi8gud/CmYDbQghLcMZwIso/g0JrIKS0p4aAcLJrfpN
 gkUFRfWjqUhvRrTuu74MKD3XV8J0IRR9sRvZuMyWccBYs3+ErE+YPBsdW+81gYZqjZmY
 wAr98MlLeHxL9fNssCeGx0jYbPow+N27lgeH8pGiwqK+HGQ2kd5QQM7QgFWZa0kOYC+/
 RLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y6C6MAUioop+DtdSfdnLhzwpeD9w+vPUAVhC0ElJtXo=;
 b=euyxHy0Iwn9uwlUTOHCS8forW9H2UoNfAskQi26MfImvV57zusRxwN6SzFlk9WH/6G
 gYW4l/P0hK4XJkH69QQG5oJTT55C+Qw3HmoMww6rdLeBfxnQcNCQJ7dMmfPlX7QqW5Nr
 PTSEYTn8HA+u+sfyq2f7gXUnFaQDVkkqpeaO4m1DyvkGbX5uMjw9hziwCvBvglvzBqoB
 Zyp09/V13hJ0cYHiZjGpK0rF1eKXqSWn443vUsgx5sCIotEZAsbMj6Sa/nZRPbWlLo4y
 gKDHVLHQRKjS3yGlgCTIMzZTR2fxmIffewhwmPVmRaKlvYD6fu7qiQyudJtJ/w4dlWMc
 uUTA==
X-Gm-Message-State: ANoB5pnjt0aiepsbj7NldfInqUVkyv7r5Bvv4mD+aUcvyrjXxucdOKg4
 pWGcCLlwrLIEQgZ2nsxZ/87qH8R9QZKp/Ku6Bm64IQ==
X-Received: by 2002:aa7:8502:0:b0:576:9786:94c2 with SMTP id
 v2-20020aa78502000000b00576978694c2mr11807252pfn.26.1670259028234; Mon, 05
 Dec 2022 08:50:28 -0800 (PST)
MIME-Version: 1.0
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
 <20221024051851.3074715-15-richard.henderson@linaro.org>
In-Reply-To: <20221024051851.3074715-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Dec 2022 16:50:16 +0000
Message-ID: <CAFEAcA_5P+HgDjNJE6XZ7hN0TcOPOJfxzMANN9HQ8+b7R+34bw@mail.gmail.com>
Subject: Re: [PATCH v6 14/14] target/arm: Use the max page size in a 2-stage
 ptw
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jRNKs1xh3WXQ

On Mon, 24 Oct 2022 at 06:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We had only been reporting the stage2 page size.  This causes
> problems if stage1 is using a larger page size (16k, 2M, etc),
> but stage2 is using a smaller page size, because cputlb does
> not set large_page_{addr,mask} properly.
>
> Fix by using the max of the two page sizes.
>
> Reported-by: Marc Zyngier <maz@kernel.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

So when I was reviewing the v8R patchset I re-found this
change in the code, and had some questions about it that
I wasn't thinking about the first time...

> @@ -2639,6 +2640,14 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
>          return ret;
>      }
>
> +    /*
> +     * Use the maximum of the S1 & S2 page size, so that invalidation
> +     * of pages > TARGET_PAGE_SIZE works correctly.
> +     */
> +    if (result->f.lg_page_size < s1_lgpgsz) {
> +        result->f.lg_page_size = s1_lgpgsz;
> +    }
> +
>      /* Combine the S1 and S2 cache attributes. */
>      hcr = arm_hcr_el2_eff_secstate(env, is_secure);
>      if (hcr & HCR_DC) {

Firstly, what if the lg_page_size is < TARGET_PAGE_SIZE ?
I think this can't happen for VMSA, but for PMSA it will
when the region (in either S1 or S2) is less than the page size
(in which case lg_page_size is 0). Presumably in this case we
want to set the result's lg_page_size to also be 0 to
preserve the "don't put this in the TLB" effect.

Secondly, how does this work for VMSA? Suppose that stage 1
is using 4K pages and stage 2 is using 64K pages. We will then
claim here that the result lg_page_size is 64K, but the
attributes and mapping in the result are only valid for
the 4K page that we looked up in stage 1 -- the surrounding
4K pages could have entirely different permissions/mapping.

thanks
-- PMM
