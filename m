Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4976546lfb;
        Tue, 27 Apr 2021 10:10:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVkDRTnex0x8T9K0BnqNGZ7hOaq3PA+TSdAtFaZCaWTPArTbgaRQCzofrrWPE/mEXsXYRl
X-Received: by 2002:a6b:3bcd:: with SMTP id i196mr20423300ioa.121.1619543408716;
        Tue, 27 Apr 2021 10:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619543408; cv=none;
        d=google.com; s=arc-20160816;
        b=HxuhweqPnKflcxJ4/JNYby7VN3gaZFvaIP8IcKWzurviefkBumIsqhLJwtc42fH5lO
         LD2QIImg56PYRaeJ6R5Icfq22pU/aerPYL8ElsI56AoAvKcWVU1JXC1dSWaGWJNDBLwx
         dxmxbgFEeT0tI15/gUGqFCPzAZxg0CkIt4UtBeAtm6AfbTKAV9xxBBhCOmWvWyCtgZfv
         A09PX+a4nxux9q10cetBpNLlfQ49tHQNYEtsPfvTZKkClWf5eoRGjaAs/UEA2E+NK/2W
         Qc0x3Gw9+dl9NVfZ5+0Cq2/b+XHnzQb+knkL/ZPD1VUBrT2kkH4MmKNchvzf4O8pyRo3
         RZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=xxUWjvRfqr9Cgmm1DVsHz87lcBVLAKoNREEMzvSIpGU=;
        b=QoAh01SDX4HWyyDvN27sjLDnNS8mPEp+QQKsrxTfFZjXY2ERu8xBWT8uVgxJ1Zljz4
         DQ4jGjGCO8krqb3GfGihvSvb8mWlvali0WDnPpRr+Dhec7rvva0j6UtTVsaUYhSwx2/X
         oJVUGJ+vvuazhB43s/YJLJIFh5Gh0h0vXP+ZRxoVI7s8M5P/vK+/Sbuqjq4FqkI7Fuvg
         g5xVQ9ebnCwMdWc7pPSLhtriu1ZI+C0dY09XlQVVZpVjb1hh2AVRlssV3E8S+6iB0M18
         UfkZxM4A3liNrtcIDEqte3cB+8rnbTde7wlU7x4yWpzQ6hA3nlpk7Mxq7/FqTVVmd+BG
         i1bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bLSe/7Uk";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14si4883765jas.18.2021.04.27.10.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 10:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bLSe/7Uk";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbRDr-0002dh-WA
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 13:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRAw-0000UL-2s
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:07:08 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:56315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbRAs-0004p3-Cw
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:07:05 -0400
Received: by mail-pj1-x1029.google.com with SMTP id s14so24430815pjl.5
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 10:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=xxUWjvRfqr9Cgmm1DVsHz87lcBVLAKoNREEMzvSIpGU=;
 b=bLSe/7Uke6kCd/+J8gO/zuXsQ1M86B6uMUN5IzI8pAxOMihT8fTGegYZwLDQEclXM8
 Ph0splloQrhdralMzdNtsLtvD3R/JePeD1fGbgJklqd1M7VI2O4O4Hj7BuNxnQL9ngOI
 E9MfLrW+gO+UG/J3AK/lk7Tagaug96AIZFyfCFp/Ts5dl/7LXe/7rkcy0gSV3h6uagwK
 pGh3biYNx6RZHzxwGCH+NCaAYJDHpcign5Y3Y393aHwaAmAkFcZIfSCtq/1maoP1u3tU
 i5VjyeoBCT51Q2Cpfw4vMp0FGyDNxLRiSRmAHyCX1w8r3ZjRv5yL5B7ybdE4sfFZg515
 Jjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xxUWjvRfqr9Cgmm1DVsHz87lcBVLAKoNREEMzvSIpGU=;
 b=QwepfQQrcAeR7ELEyqIz8Xz5aAnr1ESFODzyCIz3Rz9nZmqUFS+Pl7VJfakdf9Jo9l
 rbIpqHQZe0dsmFuVK7Hjl3s+TOp1X264WWVnw4CN0PR78dYSqLkf8cNpKddE/oa3Rkfx
 jrSfcjHplivm8yIToRtInDs7k5wc9vzWOww3ar95L7/1pb2BD1bEDRUH873y3T/UC4d+
 SWMzflib9FH0419Nsp8iIydeJaDrpzKDwsLpmE2T3pHNOF6G7qZKyL86VL0Wpxjrl9j3
 PECQPedBenTzxAN0Z9VbrGtYLcPruWJUd2cx1bEbnzmBARCKB0Aru9DIG+5vpqf9o4O7
 ho3g==
X-Gm-Message-State: AOAM532W4mGsWe8zkW/68yis3qPf2L4Ul/hlxrPzx9PRbUbCcP+9aqCs
 Hvks0R05pGdDkwy8FyGhyOFb/N3SwxI+Qg==
X-Received: by 2002:a17:902:ce85:b029:eb:46e1:2da2 with SMTP id
 f5-20020a170902ce85b02900eb46e12da2mr25571218plg.38.1619543220862; 
 Tue, 27 Apr 2021 10:07:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id f188sm2884378pfg.130.2021.04.27.10.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 10:07:00 -0700 (PDT)
Subject: Re: [PATCH 09/13] target/arm: Move vfp_reg_ptr() to
 translate-neon.c.inc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fcb109bf-a74f-3319-f120-487d5231b096@linaro.org>
Date: Tue, 27 Apr 2021 10:06:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xMgnqbvN5Q37

On 4/13/21 9:07 AM, Peter Maydell wrote:
> The function vfp_reg_ptr() is used only in translate-neon.c.inc;
> move it there.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.c          | 7 -------
>   target/arm/translate-neon.c.inc | 7 +++++++
>   2 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
