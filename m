Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4654340ejc;
        Mon, 6 Mar 2023 05:41:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/QTNZw1MHXX1KWCk1Eg56mPhOhln8e9VK+1soOT02EC1LW7ysyVjf5dsDro3tpKZUQYeIB
X-Received: by 2002:a05:6214:509d:b0:56e:9f19:71f9 with SMTP id kk29-20020a056214509d00b0056e9f1971f9mr23486055qvb.17.1678110079341;
        Mon, 06 Mar 2023 05:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678110079; cv=none;
        d=google.com; s=arc-20160816;
        b=BDcHKK2h0reWNKNKUmphFeNx7UvrpdHGHdEnb4WrT5wMv0pIF0sQpobiexsBwwbArr
         XzblXtoPVhtg9s/4W0QTh5WiyiDnpT3xB7ErFNb49LgORklPfBYo/N5zj8Gw7fJs524L
         9ELP1FQKjlGijFvN4BMBznfyTetmE4jKX7I2nvs/j8hZASCaDLa4NsrmO0U7hNvH5+ce
         dx+JbsPyBNa1ZhAmyBl6tcUkTPradjv5TVci3zj4Oblr9eWk9KZKXI6SKWGTUr3mzxiM
         3R/Yex9FfIXsXrG/bTL+JPqguUdkwz+qGiuZWmB4lI8smx3JOdOo8hot18RUB8sUlEk7
         qR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=p3Cd1ABbVq0JFlqW93E4SrJdj9q3tAZb4gww9t0ZB6s=;
        b=XEDv5G2bmoeoEx10YRo7ERbTNn2fpTyBQ2lz6ZKSowqCU6WhCqpz0v17HwbcEKBgQ9
         4/QmYWrWGwGX4B78OYOseZiqB+frzgNf1Vs/1y/uicrBelwfTXGdQk0YSumeFVEsuTml
         ZHXiO59/LGy0wl+QvtU6EJTrdv2zbt6n9p6m4AqBELQAJ3RPkIA74OzqlG183Ta9pFJs
         7saexgvbP4aTug9TgnfxOrZy39xKBE9IlzUVfFFXOAsXEuvk2tc/EDcuJ13sc/iDJGEE
         mAFNeCnBr7NdVonne60MYqchkYhsOA5Z6i3HXo3mu8sr6nyKMJT1dGF5OCsv9QQv5OcK
         taDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tEuGeBxE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 202-20020a3705d3000000b0073b9dd746e8si7197284qkf.345.2023.03.06.05.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 05:41:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tEuGeBxE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZB5V-0004MM-81; Mon, 06 Mar 2023 08:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZB58-00047N-Ix
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 08:40:52 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZB4u-0001Ig-GX
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 08:40:46 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so5567181wms.1
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 05:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678110025;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p3Cd1ABbVq0JFlqW93E4SrJdj9q3tAZb4gww9t0ZB6s=;
 b=tEuGeBxEJQ4EaB0AGrlzV91EVzQVhbHsQ7ctlcjvgdnWQNgdIjm9+bLf12/qBlDTRk
 04AURAUK9tNilNtmt148N3ttj7Mo2QiUJKOqnInWZaabObgnXz36QrIis0vfnm1Uu92v
 iFSAluxWeEWKkTkGoMtdzgvtTaqyi9kRc1Vv5j/fUpizJWnYupGik02bigLM0KG0F9+f
 Obzkn9gRNOTL/akLFGXSR8LcWgsdWaAZ5AtX/eYYurWareSSIHAk6QeZUDSrLdW/tSSi
 F/mE0NjRKJGKj3d1oUgQSvMOngMD+JHeb5MmOf8ABnm24Y95OSSZaQGUTAsX2pDUz8RS
 JR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110025;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p3Cd1ABbVq0JFlqW93E4SrJdj9q3tAZb4gww9t0ZB6s=;
 b=dV/vu/HV39wYpmAy1S8TjWd8Mggco9rKcNAwVzt6MsZBG0hnaCk2u6FohrHQtyBw0Y
 ZN6wXMN+JmC/HrvIDRuGlYhglU9BtCZGevLtZRkYLB0PApZ/pYeJ4zIdPJG8uvXt1crc
 qgl7U6qDMDUOYdd5dngEfNULdLxF/2677HdJOK+wj10l4K/P2nWTtGRzx/yIFZLlSQt8
 Nrrv6PqR3KJsqJ2068GGTCerXLVU5uqi8sxT0zKphKesxsI/6n5fi3PKMLbTriL4WBnA
 QD0udXmzFWHum3rKYUwHv7gcSOoYpSJ/ib6GEh68bvuq/N+ApDQlBMcBYNzFnYEDB8iO
 rP7w==
X-Gm-Message-State: AO0yUKXHgPlgHNw9rY7JlHklHII82A7sFUhnoXsDGadXlujJiQhptELZ
 u7fyPha7kDr5f9AimRQ3l8wZSg==
X-Received: by 2002:a05:600c:3151:b0:3d3:49db:9b25 with SMTP id
 h17-20020a05600c315100b003d349db9b25mr9881206wmo.26.1678110025218; 
 Mon, 06 Mar 2023 05:40:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u10-20020a7bc04a000000b003e876122dc1sm13682220wmc.47.2023.03.06.05.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:40:24 -0800 (PST)
Message-ID: <8c2be250-4c17-6fd5-f013-6825b8c9a637@linaro.org>
Date: Mon, 6 Mar 2023 14:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 31/70] target/mips: Split out gen_lxr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-32-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: vb/wJLrvJ5js

On 27/2/23 06:41, Richard Henderson wrote:
> Common subroutine for LDR and LWR.
> Use tcg_constant_tl of ~1 instead of tcg_const_tl of 0x..fe.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/translate.c | 116 +++++++++++++-----------------------
>   1 file changed, 40 insertions(+), 76 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

