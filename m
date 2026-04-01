Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A5E10F931D
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 04:12:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7mvx-0000oR-9c; Wed, 01 Apr 2026 00:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w7mvw-0000oB-Aq
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 00:12:00 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w7mvu-0001kg-E1
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 00:12:00 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-35d971fb6f1so3199450a91.0
 for <qemu-arm@nongnu.org>; Tue, 31 Mar 2026 21:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775016716; x=1775621516; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wTUvG2bQYKBmkEgKHomLI08q5jTinJyVh+PH1aAcKQw=;
 b=LuJHBu7nJv1v9ZjV6FPmQHbh4BfOgxzNudkxXZ4PVOdljmv8qIOWc1jpgeqsOsAno1
 DIkt75HnYTS4T6Ad9CHICUvZ6jQQjN+hYlZJx0rmcvp55uRlcZD3kD/N5H3RnXDCW9ge
 CVdflZlEe/E6HenhUA9fylgJnnnspO2iETq0QymtDTCDCP9rJ/0pz3qcJkYr6hlQFZ6+
 IWbszcNBIl0JaBVevFM5SaYeiKxUzqQ0QzSs6/gSBaRcRvBEZDP8p/XSfLJF3Wnr3Q6I
 JnkOIx8omw4E0nKlNna48LfK4/wtJONGO31qp8e9E4JUB4a24MQT4A/4fQ+xqSee/Ev+
 vVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775016716; x=1775621516;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wTUvG2bQYKBmkEgKHomLI08q5jTinJyVh+PH1aAcKQw=;
 b=q2bzPsRYWVyQ17Hu7UO1jcpTjF1Zy+h0PCqHwE+f/tu8jVrGoW/xrfr2OQxq3l48Kv
 jCFoTcJXkdOcOYWRkjOq76DWYJDlzJkIRcGyQUNU0cAjh46okTfnTXXPMz9uHEDrZogZ
 JTvVB3Kv/QuKduZlHkI0pA6Wozz7bQyNlj2RQfr6vdwCpZKpG/2rLwpDAmEYtkEQwN7i
 waz/DYfLu9aMwlekDYgjYVfRN0U6gx2kmqAeTTPzVAmC4nGJ9CC+qHQ8ck9W1shQRSay
 +1UHRBxiQORdqSKSGlLR9kOygEpGubvC+6bUKWfTD8FbNtxfz+g9+M8TWoBx/JaiYh1r
 ILIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfWM5po/kPSUUffFII+qcGBxIeN9wev+3GPM+Ouo4GAyG5F3KSXNcEfEX9rVh+URhTdeZYVRS7kA==@nongnu.org
X-Gm-Message-State: AOJu0Yy9sXmOVVJof/FKm1nktdHKmj7WRB+1P5xuwT5k0gXqwU1DeyRu
 LHm9vlLZrbowoCIKRBHGqHFFDVf4jo0Z2nEUgr2q2HrqpA7iRJs+suM/srRtz/9L1mMpdHTYBq/
 w053D1So=
X-Gm-Gg: ATEYQzyLGrhPsSTa+obhPX5xaSr7ib8bk7v8VNoy9+Bp2B84A0mtn/rrqM40PPhzmjc
 xEIJ9o0VDRnc9eYMCHomrqq5pta3ZlWGjFE1YNyj0M0OAxPqKWDClJzvxcoInD8dwlSJW5Ar4N0
 zVU2gOYuvw6tgJuXRaZ9bl5VxJWK/TJWfu3mUsEylyOZpWkOez4yCQShZkJm+wz8B00HP8dhVmp
 1fkVBl3Obh/dGw9L8EfGMIYt/LwPrIHjEwjLYxIZcZU4W6N6HoSTSDwluQLMRDtSwKCr3n1wOGc
 E12iM2icteQNRCrEl1TNEQL/jBTtUK9+0CoNCEJCUMZmg2inmuMkEHKMEM8jXi9rQkiFa//pW9Z
 RwFuNcUVZgtGdWu4XerMSFNkAv34ESjfXBdci4dOnej76/ia/J1PUYG4I8CjP8qcxWkC870Gjp2
 wYbKhBKUwknfz4XNKsE6ReSwg0tMFqSHIsNO1lr0Kwv8m60cwdjklwLltYQjM2HHZQnvkLFeOAt
 6W4gVdfBtxZbg==
X-Received: by 2002:a17:90b:3d92:b0:35d:a557:e44 with SMTP id
 98e67ed59e1d1-35dc6e7ab5cmr1989326a91.6.1775016716199; 
 Tue, 31 Mar 2026 21:11:56 -0700 (PDT)
Received: from [192.168.68.76] (122-150-206-170.dyn.ip.vocus.au.
 [122.150.206.170]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dbb883465sm1621007a91.5.2026.03.31.21.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 21:11:55 -0700 (PDT)
Message-ID: <b29dca1f-dde3-4e70-ae08-750d162e1b7d@linaro.org>
Date: Wed, 1 Apr 2026 14:11:47 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: do_ats_write(): avoid assertion when ptw
 failed
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20260331092305.2062580-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260331092305.2062580-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 3/31/26 19:23, Peter Maydell wrote:
> In do_ats_write() we try to assert that the cacheattrs from
> get_phys_addr_for_at() are in the form we expect:
> 
>      /*
>       * ATS operations only do S1 or S1+S2 translations, so we never
>       * have to deal with the ARMCacheAttrs format for S2 only.
>       */
>      assert(!res.cacheattrs.is_s2_format);
> 
> However, the GetPhysAddrResult struct documents that its fields are
> only valid when the page table walk succeeded.  For a two stage page
> table walk which fails during stage two, we will return early from
> get_phys_addr_twostage() and depending on the fault type the
> res.cacheattrs may have been initialized with the stage 2 cache attr
> information in stage 2 format.  In this case we will incorrectly
> assert here.
> 
> Fix the assertion to not look at the res fields if the lookup failed.
> 
> Note for stable backports: the do_ats_write() function is in
> target/arm/helper.c in older QEMU versions, but the change to the
> assert line is the same.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3328
> Fixes: 9f225e607f21 ("target/arm: Postpone interpretation of stage 2 descriptor attribute bits")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Not a regression, but it's a very safe fix, so this will probably
> get into 11.0.
> 
>   target/arm/tcg/cpregs-at.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/tcg/cpregs-at.c b/target/arm/tcg/cpregs-at.c
> index 0e8f229aa7..53dd67375d 100644
> --- a/target/arm/tcg/cpregs-at.c
> +++ b/target/arm/tcg/cpregs-at.c
> @@ -37,8 +37,9 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
>       /*
>        * ATS operations only do S1 or S1+S2 translations, so we never
>        * have to deal with the ARMCacheAttrs format for S2 only.
> +     * (Note that res fields are only valid on ptw success.)
>        */
> -    assert(!res.cacheattrs.is_s2_format);
> +    assert(ret || !res.cacheattrs.is_s2_format);
>   
>       if (ret) {
>           /*

The assert could plausibly be moved somewhere !ret is already tested.  E.g. just before 
the only use of cacheattrs.  That said,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

