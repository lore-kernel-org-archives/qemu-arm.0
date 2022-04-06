Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp718281lfu;
        Wed, 6 Apr 2022 07:00:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwOv5adiVPtg3zIC5tg3yLJUw1ITY66W43Lv21Y5yovbI5nlX5fQDMq+cIRSYU43Zql7a+
X-Received: by 2002:ac8:5c4d:0:b0:2e0:71b7:2829 with SMTP id j13-20020ac85c4d000000b002e071b72829mr7776624qtj.323.1649253657869;
        Wed, 06 Apr 2022 07:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649253657; cv=none;
        d=google.com; s=arc-20160816;
        b=czPUT2/6r5pG0k0B/XT12XQm4QCpUZ5oH9eDpZ8HzYoxZgEFsuKlYKQAO5QJqQ2aoc
         4P5jtan/cfkBwU1DbcD6fN9NlFleZa+PTCORfCR41ljND49OGo6sFFsL2cw4yQZym5tF
         YWZv2webalFYU4LXOXP3ELl2Pcnq4kCfDPuyzbkx/YtbDFN8JV94czERI12X7fzrbmeG
         4JznBCIUg8ZEljj/AWEPaal6qcS0cbsfoG02mde76uij2oFD95I/KOuaOsamCmzUM6QI
         u4wCzuW5HT00UVIVOJRGcNlLfjmEvDiZ3eBLU6p4lEdjU8RHIwLsINZVWfQrnh5Tj6v1
         51eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=HZ3d683UcsmgThdLPL+xO3pygbvtLqa3T5cQFRWY6Bc=;
        b=ipTH5giUJWa4cWVp/sgZ2Ol4N8aiN4AiJlw+0HFWX1YB/ErsZcteGfXt0Kdt7bwTxO
         /idPXCls9PwbZ2DM9mc1PtKnmVb1B90Tjg6MrkOo2eAw5TbLMznu+0OaaVh1iR74D0mC
         fSVeLZfZFGQoBiM14Vf06f6wbPz6TiJLMQ0YCvqP+AYH+4o3vQiPuu7nMpYx5iOfmgx9
         G1LewO1MnDpyHRy/UyfeaiWim/sKVbWmVPYlX3UuVTWWjyUsElXahNJaDhbzejE8ajjc
         V5XrxH7BpATMB1HP5om167vKKJ9WVH3uci2ADKIjRfUjaySDa0enJkdgwzvLGpVFvxW/
         vRVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mDTBtsPY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020ac80607000000b002e1fbf3bfd4si6405583qth.453.2022.04.06.07.00.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 07:00:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mDTBtsPY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc6DR-0001NF-6Y
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 10:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6Cq-0001KR-7T
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 10:00:21 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:33292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc6Cl-0005g1-JL
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 10:00:19 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id i15so2319685qvh.0
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 07:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HZ3d683UcsmgThdLPL+xO3pygbvtLqa3T5cQFRWY6Bc=;
 b=mDTBtsPYIr3wWjtBahQIIRtzhkJeHFYUAYGrb5AF2gawOw2goYhaDeKtVYWoe6HfKJ
 oQfePXtuH8j19hGIBAytVALB21sE4bIRArqFD+kWGzoGuQ/31sEV2iRM85OvvIo/gGBU
 P9GZbXXJ1J3KKVVLdwEljvwB6cNHEdFpde35J43Fax51J1L6DaqdBJsS2B2DgoifCzoV
 UtNPh+n6J8eQGg0VBcudAFkCzVEr6C+aH7rZ1Q2RSyHbGb98mDi2Dy6QssxqKs/GTn1z
 oI17JoLppzuHA4em1IpUcJM9Aw1ffEgswQGIgPHTBBrezEo9u30xPJKw/x5lv21dsjRv
 s62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HZ3d683UcsmgThdLPL+xO3pygbvtLqa3T5cQFRWY6Bc=;
 b=b2IGkond5WY8uV5Bk/tSheANqBzUnqBTVxX5eFl5cWDND7/Pqa0hsp2b5BbHyrZpGX
 WgHcAvlM0EdWy47BJ0sjAxyQVrQk+rkuaO6UEU8PQTlRBAArQrJkKUzVu5u6F6X74KNr
 Jh6VxPY2V67TLhWlbRImze1XLESPiDkk7mW4Y6GKmjxofcicptZBo74SzQ3fdkuwiJmd
 Y4RQXJtHWSgtRK/BAmqFdkEzR0krZCsKlEmFOakeM+kqKp1Vi6wOVBHOnSNUAh8WwySy
 5BVj02esEM/M3PXM0w8C0MDA5EzMvIQ7WT9cLks5yAlVID0yQ3E3e4CJmOk6oo5nq13W
 v0OA==
X-Gm-Message-State: AOAM530mSlFM3xVt+Imu74Xduh3mfRq5Ca+587llGyyJSOqVW6kuNtP4
 7PQIITio/fHDC7DRRCMB8MtF1A==
X-Received: by 2002:a05:6214:2409:b0:432:bf34:362f with SMTP id
 fv9-20020a056214240900b00432bf34362fmr7332701qvb.66.1649253614551; 
 Wed, 06 Apr 2022 07:00:14 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 e20-20020ac84e54000000b002e06753cf70sm15274775qtw.6.2022.04.06.07.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 07:00:13 -0700 (PDT)
Message-ID: <49ca71ae-906e-767d-8d12-9cd0a04d5b6a@linaro.org>
Date: Wed, 6 Apr 2022 09:00:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 15/18] hw/arm/exynos4210: Don't connect multiple
 lines to external GIC inputs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vIXq3LoNJkfB

On 4/4/22 10:46, Peter Maydell wrote:
> The combiner_grp_to_gic_id[] array includes the EXT_GIC_ID_MCT_G0
> and EXT_GIC_ID_MCT_G1 multiple times. This means that we will
> connect multiple IRQs up to the same external GIC input, which
> is not permitted. We do the same thing in the code in
> exynos4210_init_board_irqs() because the conditionals selecting
> an irq_id in the first loop match multiple interrupt IDs.
> 
> Overall we do this for interrupt IDs
> (1, 4), (12, 4), (35, 4), (51, 4), (53, 4) for EXT_GIC_ID_MCT_G0
> and
> (1, 5), (12, 5), (35, 5), (51, 5), (53, 5) for EXT_GIC_ID_MCT_G1
> 
> These correspond to the cases for the multi-core timer that we are
> wiring up to multiple inputs on the combiner in
> exynos4210_combiner_get_gpioin().  That code already deals with all
> these interrupt IDs being the same input source, so we don't need to
> connect the external GIC interrupt for any of them except the first
> (1, 4) and (1, 5). Remove the array entries and conditionals which
> were incorrectly causing us to wire up extra lines.
> 
> This bug didn't cause any visible effects, because we only connect
> up a device to the "primary" ID values (1, 4) and (1, 5), so the
> extra lines would never be set to a level.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h |  2 +-
>   hw/arm/exynos4210.c         | 12 +++++-------
>   2 files changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
