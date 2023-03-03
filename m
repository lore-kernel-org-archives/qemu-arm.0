Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1341304ejc;
        Fri, 3 Mar 2023 09:29:15 -0800 (PST)
X-Google-Smtp-Source: AK7set9tbpRIA6OLAFhg2LsD9fWw/IXsuM7gF6bWclK3AgeTU9xUH2zr17p5dtI54dRskkOzEeOQ
X-Received: by 2002:a05:600c:524b:b0:3df:de28:f819 with SMTP id fc11-20020a05600c524b00b003dfde28f819mr2323503wmb.15.1677864555105;
        Fri, 03 Mar 2023 09:29:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677864555; cv=none;
        d=google.com; s=arc-20160816;
        b=QafPkBp82MRFlcSIqkJoZWEjITKIWARlJ2oMfcV5enXreySICi+3IdaOfqnxjGifMu
         M7bLyVUpGl0VFI5ojAib6dLbn1TYnrIX5yiRMMgN+KcjlkEgIdvFf4xRgNPwAgahi61o
         zLqiGhcDoIOZO23zhSEetfZTPiwmfkM4sqhaj9UNSCrZJCkvKyIdUJo4E8ziezRz7JQe
         bqebSoe2+49OYEPTKwP8OKlR99awuFHcGwLDGbYT1DEHQ6+6+mFpcsILCxEOt+1oicpL
         CYm+k28ZcuATUAZjl5A+OzdtpiLj549EOKUp3N8WzwLZoaZaJm5TXM7GyM8UlWjDdO/u
         nibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZC5aDh9QQfLJ8nzcrCrqXMtBp100M4u+alta7wDtNOs=;
        b=FJ8Gvqrh0vRWFB6atcLG09MqZK8vXRnTecw4gZdbGvC1bR0P08JK1q13Q9mpubwPOa
         QQ6wSccQeu8k0MNRNJolajHjpF04VrBSsuMDVGpC8cw945/KU7vydnDtIxUzF3mu8koU
         5VdoQ/15auJyz2vt0CDjVb0B3UNV1M6+L2Q/iNC7uJakHPRNfEEJP8yC674ogkgZpQ/2
         MkKCh/ur5mrf2YkR7b48wXLf+5KOevfqCXSsfAeqhmwloFiMpgx7baqxzNSzGP8QSDk/
         wlGh3UGaQZfx83BBfHVoOMwlw2Lxb7jBeCyc5qzgTpFuMng4CyeND1Bhim38bTY36v4e
         qfkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZRXRDvkC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m42-20020a05600c3b2a00b003eb19faa5a6si4922365wms.43.2023.03.03.09.29.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 09:29:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZRXRDvkC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY9D3-0004aL-6o; Fri, 03 Mar 2023 12:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9D1-0004Xv-P8
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:28:43 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9Cz-0006wa-LJ
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:28:43 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 130so1939977pgg.3
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 09:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZC5aDh9QQfLJ8nzcrCrqXMtBp100M4u+alta7wDtNOs=;
 b=ZRXRDvkCviOl8P77HHu4dEMyh4y3e7gL3u7fHRpSKtk4g5/Q9MtgeAOHy+lSw5xzWt
 MQVEMeyvPIev41B2ONFabzfSgVnPzsN0vUkHKyUcel+PHTNU1EbtLtTlE5o7cEKFaN3p
 dvv/n//M5GTD1JVFeaJN2YUutdE9Kbu5Suwkquje0Woxfllg3zFqS4pBjdj8n9ahvXBV
 aFj0FSe9eEvMORYrtFqqOPn+JF2L+jV02Lg1IPiBLbnhlUqkOoXnyBlygfi7vikoniBb
 C5tRoOEv4e+WnFOrJoP3rBwbC2oXfctINjcqVzUuio34Led8XUT7sH4s/0mrgp3x4ItO
 99ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZC5aDh9QQfLJ8nzcrCrqXMtBp100M4u+alta7wDtNOs=;
 b=UXEQN53AWAjP1qrw//YylKgRcrAouJGxLaCuM0UgOT8IianUPsokIq0izF+nTPb0/Q
 W0VbUCfeG0ZMFfv082NiWoPX8Bfdjsf4mWU8m69Q58wTv6Um4bwWq5dqhuCZqQcqRH9F
 VBxiTYwPyq5j7w4mzzPjjxAlGQGjwJNt5AJyJWJBxC6SUesNMmYMFlV407cRHTNt1srb
 E8fBZX4JV2D30Y9x/FmC3PNuIxinh26E6S3aWhZ6fZPrQmpYJzACyJlR/JltvbWwuGEA
 K+fzhmGAeOiq1MIrc64HXuo0gfuq4dXn4BcbBiiA5TFwhb1jukPZ9gAPhbZIHVfBBf/4
 3lww==
X-Gm-Message-State: AO0yUKXAts6tDaZEkdvA3VMcT5W+IZwTrUEFmPHJUI6x2CH6+l23e9cV
 x5v2LCKwONKnReeCZSMhWwSjnl+3lLavnNbUJu96uQ==
X-Received: by 2002:a63:f705:0:b0:503:7cc9:3f8d with SMTP id
 x5-20020a63f705000000b005037cc93f8dmr778837pgh.9.1677864519885; Fri, 03 Mar
 2023 09:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-5-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:28:28 +0000
Message-ID: <CAFEAcA_emihcb_dLiN529BwO-sinoQQBfUrxUCGH_HeV7dh5wA@mail.gmail.com>
Subject: Re: [PATCH v2 04/76] target/arm: Remove arm_free_cc, a64_free_cc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
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
X-TUID: pPGeE2WHbMXl

On Mon, 27 Feb 2023 at 05:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h     |  1 -
>  target/arm/translate-a64.c | 17 ++++-------------
>  target/arm/translate.c     |  9 ---------
>  3 files changed, 4 insertions(+), 23 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
