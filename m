Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp656271lfq;
        Sat, 9 Apr 2022 13:54:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx88Zij7lE6K6AxXQfSDn6pTMVz+lqIhCF51lOnxihhYeEjTR5YbbAqhTLQCuMVDdHJrOW3
X-Received: by 2002:a37:8e07:0:b0:69b:f8d6:34c3 with SMTP id q7-20020a378e07000000b0069bf8d634c3mr2496783qkd.5.1649537690716;
        Sat, 09 Apr 2022 13:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649537690; cv=none;
        d=google.com; s=arc-20160816;
        b=eO6iF7DgdLW3mJjM0R0vdpIVJLcP37MVNGk3F8PpYnxoWM5yB3NFhlxy3k5pv59X3m
         DxbariTyQgI4e8xexoowEbUN9yDJmVsa47aNfKJcVXGKC5wgg1eKPIdbluJi7PCix0Ra
         Z65ECSdhk0qOGupMxt4zuDzH8Lm/DRBspce8U3AJ/j+XgZOCKqt0wyFt8gLQuzP92tVY
         b5F4XgSumCl/T2mA/JxE+G7WsECuHw6+dCvDmbSnsOoOg2FwhuyffRhrQZ62jWFGMazV
         E1g8O+oEI4SwwoPBFCD9wuEKwLEhz1k9Zd6NnaO32VnyT7ui0RxOR1F5Z+gJLvxhSUhS
         cB1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=9RBShkMvp/3tGtI7eoNovtDiFs3ApIbKkhLHwibBIz8=;
        b=R2dx7D5VVg18jv23eNqq/NLbZTDcFCTBF9/psAw2L52dmqXiC5q0Y2jedRkW+N6B7u
         xsbWLIdfnF88gwEWsomtnKOtjhiqO4+GmpFQz/UbL7qh8O50zh/rjYd3GfujtRuV9ElD
         Md8UcpGXkdYeYfoKL4FkJ60dqF1j5u10x733g5CZqfJNFzv7l6ApEZg9zfPWGiNM30Ge
         WzMV33kbfXYnDDAN99u5OD1luSkgznUZD/7Jn5CKFWGbynT1XzQRNU2U68C0qerzuwRl
         FZBS7wD3AQRrpiWqNzrt6Np9M5lh7ofn0c6vNpsb6rrL4Sk2SEgi5HG40/9Fh6+6AUhi
         6MZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fYHwS73I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9-20020aed2789000000b002ed0f18b044si1656577qtd.432.2022.04.09.13.54.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 13:54:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fYHwS73I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndI6b-0004Yd-Ik
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 16:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndI5K-0002TF-Iq
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:53:31 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndI5J-0005wo-1M
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:53:30 -0400
Received: by mail-pl1-x634.google.com with SMTP id be5so4838302plb.13
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 13:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9RBShkMvp/3tGtI7eoNovtDiFs3ApIbKkhLHwibBIz8=;
 b=fYHwS73IRYl5hvTySBo/6v/sEqBtnXK5eFc/z3YLACC9xpQvB8F4pfd9G/J/BXn7Du
 Ej/C7F82sNqaIHOqdZsNCEz0HJ/P0aM4egp1d5tfi5ARwCRM4mKKJlmWwfLrW6TwU2wY
 nvtQKKPbRatvBC8xv11Jy5BXMTqj3FxPSNw3gE3HfHZG4Oe3Wnm4FNCtiEj1lIM2ZdmD
 BHwRJ6YQRDErSMJ7+FOIoj7tr12Vi1e5+MRNNX4VEoGoSMqhmpgh6f6iz8WZGLJXgUK1
 GhayuYsytWGxlIMA4HSptxwG12mBsB5+NFZhkSShgF3/Kh50RWMYlYNhIT1ydF0GAYVU
 7LbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9RBShkMvp/3tGtI7eoNovtDiFs3ApIbKkhLHwibBIz8=;
 b=2R6E28PT/tRT5XSFt/aJLdNbx1AkXlwNWxJ3M2r5kBfkoqVXjYcEA58D9BTbyJuBij
 SqxaYIwLQUU7UMbyx+lZz8LPWUQ8TvQRAWtWRayZU3V5B4p8Mls1LgL6Y2GygE98w51H
 UPWSQX7uwksD9UmUc5e3IZAdYhCb8TJ0A/ZP/TW6PUvi28IwWKJFjFj/gpK8aFfn00Wn
 XdwLGrfjWQ208lqbbNuyPJjMbAn10CmfXun7nEWX4zVkit4WBg0lSfXslW6FgnkjL+Cu
 OOMv+8MHQC0h3NLzZqGFMbHy52L8v3uQQQTBKtA/3wh0LPFzr4gq1EGISNFwIeWoFNkf
 0wpA==
X-Gm-Message-State: AOAM530SucbxX8UTXvNJR4VXlneH5A3zUXlgA+ONZZj9fSsUkBPbbW1o
 p68mt82ipC2SKIF8+p06uR4FsQ==
X-Received: by 2002:a17:902:868b:b0:156:7afb:2ce2 with SMTP id
 g11-20020a170902868b00b001567afb2ce2mr25365002plo.27.1649537607711; 
 Sat, 09 Apr 2022 13:53:27 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 v3-20020aa78503000000b00504e93ef182sm9966857pfn.31.2022.04.09.13.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:53:27 -0700 (PDT)
Message-ID: <7c596717-09d1-f4b4-6f49-eb357e7f0139@linaro.org>
Date: Sat, 9 Apr 2022 13:53:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 40/41] hw/arm/virt: Abstract out calculation of
 redistributor region capacity
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-41-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-41-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QxqPbwxQY6ub

On 4/8/22 07:15, Peter Maydell wrote:
> In several places in virt.c we calculate the number of redistributors that
> fit in a region of our memory map, which is the size of the region
> divided by the size of a single redistributor frame. For GICv4, the
> redistributor frame is a different size from that for GICv3. Abstract
> out the calculation of redistributor region capacity so that we have
> one place we need to change to handle GICv4 rather than several.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/virt.h |  9 +++++++--
>   hw/arm/virt.c         | 11 ++++-------
>   2 files changed, 11 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
