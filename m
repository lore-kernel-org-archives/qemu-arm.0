Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp713649lfu;
        Wed, 6 Apr 2022 06:52:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbbbcDvRGB1ZGfvC386p9iU/P2pEJBEPxblQUJH5Ezzjyh7NxTEirziL5J37uphbdzCl5G
X-Received: by 2002:ac8:4048:0:b0:2e1:a800:2b36 with SMTP id j8-20020ac84048000000b002e1a8002b36mr7580590qtl.396.1649253165074;
        Wed, 06 Apr 2022 06:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649253165; cv=none;
        d=google.com; s=arc-20160816;
        b=j4VU8KwBTHrNlEU5XNOdqQw53mZB4mnoWRnViVPFBagvRrOipZQC6KsEeRL58Icdf3
         BNaTF42qPXpPDzM8hF96M8fVxHXvfDDhqYlOsdmqm+hV+sdVJ4WjYJ3ssxgpk7BPc7mB
         uUyhIYWSgcPbCNZ54ONF3962hvnrd70kqNwfhupBFBCaOqqAHZqkSaMZea+Pc5VFuDLi
         weUOf7sm9h1woetRP0K7ChV4UhWzRy4oytmJMQXe+OigDsIYNo+bKrlF9daP8ZItdcWo
         vbweT9rXi7W37czON0dgO6jEdJsXKTwwLUiEIXyoGMppOqndObSO+tTrxzPRorydalMe
         Xy1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=/ClRovqhWFUDMMN2830oVGY9eSLbwTn4rmtw4G9Gq6c=;
        b=OC23nCwAeSg7kE4lzws71ufeFOibkfAXR3y8yD19sDHLBMboM/m2RFEy7coA0H2ZKL
         OffKWg6Q2MO9i2MB+tMyI+TG1xoggfNe/ojcUdFBmxix26B+pr8aDlJa4Swb8Cch2BHI
         4IE8cJMwB2OxEuX06AGcTtKMn9TIJT1/Tl2DSesHXhiIbx/zeq059CPumqRcRQF1uGYL
         tQgCLrDuZaJdXAgYo8AOy6aV81kjd6zRkU2tL5Lm5xTECm0WS+WPSKJ0YNZups42OB0j
         XAFo39HKZYyCzBXWUOta9yy3+iIkobkYc4+F4RwTe3YHL+XgYXZ/tt8nm+orLb2t8Agi
         GnlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKeSDLeb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020a05620a204700b00680f657d423si5787913qka.384.2022.04.06.06.52.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 06:52:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oKeSDLeb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc65U-0007t0-Ja
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 09:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc645-0005TW-MZ
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:51:17 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:38425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc643-0003at-9s
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:51:17 -0400
Received: by mail-qv1-xf33.google.com with SMTP id p8so2259723qvv.5
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 06:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/ClRovqhWFUDMMN2830oVGY9eSLbwTn4rmtw4G9Gq6c=;
 b=oKeSDLebzVkrXlDRFP/Q8XD3NNutAt3qDgoyKOy57G/K9mhrQTmvYMzK0+2UmNY4xv
 QeG28D1XvyUUTR2aDS+24HFyGTzHan2lcfnzYfQiV5Lf2/oN9KHlfcDn/A/kROylZZRK
 NUKTHk7IVmLMgyBFe6miunXcz3rGLmJVeMu3TW34VLisecfvjApGdfY1U2QZ2F+gFaTU
 2pGFHvEsG4O2Q7kYz1h/Nz6OwwQP7WgHGx7ZsS0HPm6GujlY3Ult60qqQTLMpPII2PiB
 sFDzV3gfi9znSshd+Zt1MCh37sSnUc5/Qpt0EmxwHcDEDDAZG4e3BVb1EUzum1aDYTMk
 3M+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/ClRovqhWFUDMMN2830oVGY9eSLbwTn4rmtw4G9Gq6c=;
 b=o11MEgptIM+8lZS0CCSUQq9PDdtfkhIkaWvpU8mC6sGyHybB7InMzfBTrwaERDO/H3
 BdBtnVOksy8pqr4pFRrpWnVFPSckIJn0RgQ9lVCe0161T9OfPSliFhxLaKWtMbaV0phF
 0/vYDB7SRvPe0FiSRW7lq5B+HWEuFZEulimMpsHzV71N3DmZXbvIIY2Jlnc9JVniXu78
 m/9Q1fkQzGpREneRpgjr6aRszLkVnVEf3IkXpFlrgAZbc9OS9JF5bUG8ZrFp32tHzZl2
 X3Lgd/4cGV1dnHxFR9D7DZUSM0mDRb7WCD6CKNegehA40Q4VsVe39DfoWFaYLrDS6ofP
 uEmA==
X-Gm-Message-State: AOAM5305uYk/yTKR9fQW0RFeZv7Bk3Kmef2tp2NlDWExhkILdR5jd8yi
 eKL7uRzNN8yI7Zw6S7LrTsmprw==
X-Received: by 2002:a05:6214:e6d:b0:441:734e:8eae with SMTP id
 jz13-20020a0562140e6d00b00441734e8eaemr7301445qvb.30.1649253074368; 
 Wed, 06 Apr 2022 06:51:14 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 188-20020a3709c5000000b0067b147584c2sm9779868qkj.102.2022.04.06.06.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:51:13 -0700 (PDT)
Message-ID: <71415f4b-0eb1-edfd-7f6d-346589c83e2c@linaro.org>
Date: Wed, 6 Apr 2022 08:51:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 09/18] hw/arm/exynos4210: Drop ext_gic_irq[] from
 Exynos4210Irq struct
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: BfgUVr+Gmz+B

On 4/4/22 10:46, Peter Maydell wrote:
> The only time we use the ext_gic_irq[] array in the Exynos4210Irq
> struct is during realize of the SoC -- we initialize it with the
> input IRQs of the external GIC device, and then connect those to
> outputs of other devices further on in realize (including in the
> exynos4210_init_board_irqs() function).  Now that the ext_gic object
> is easily accessible as s->ext_gic we can make the connections
> directly from one device to the other without going via this array.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h |  1 -
>   hw/arm/exynos4210.c         | 12 ++++++------
>   2 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
