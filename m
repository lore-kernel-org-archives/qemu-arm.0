Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2766706ejb;
        Wed, 24 May 2023 12:13:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6i2DDWl5k6gHqh+CMC8JRYBzdNj8rX6FMWQGhvNOjVlIZj/q7nCjo2aAXNSS28hl1AuTfc
X-Received: by 2002:a05:6214:d83:b0:625:aa1a:937e with SMTP id e3-20020a0562140d8300b00625aa1a937emr3094767qve.58.1684955580015;
        Wed, 24 May 2023 12:13:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684955580; cv=none;
        d=google.com; s=arc-20160816;
        b=K2y0uXZn7fFCXsRpnXuaIyx2rG1rvHYLm2444UkBq8fVH41V6HYVMLQ5j3dFq6m8Mi
         0pldZLUeNYyGH3HVFAHI2OVHJvFp58CQtLaG4TY8bBlRAJ6d8eKROpNkDLgZ7SyHNee9
         5Y38R8+bVVDExQhnTXMY7lF8m0za2wSfMtqm3ztn44VsbmhkP8qvWt0VeVyX3wJya4fb
         PCDaWRS5VMLbtSbJy7FzKqAnJzevt62PuJ2vPT3+vb0HnaxNF7f6vg2BTj7BP7P//Xgf
         ojeaNZ2QjVQmU5w8xlXdwkGyHnTG3DuBMyrWJ4yTHqQG3B+VeN3q1LfoSDbmOQWwqllC
         JC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gAq2fsDgD506O1XwE5EUT6+UfdTDa3xInx9SxnTNMQU=;
        b=Zc7kqyVPgnIzawe1yRM5Qjjvye5oF2jNoIYEYm9eNYDHDkBQYHwZ7k5YjK16kxtgWw
         k9Wl5QQYO6JFE1mY6VsUrHFIbtqJtCHxQkiL8oetYk03ovMw/yJJToom/17M8GXidp7S
         CEz28lYRVBNV0QOBIPF7c835AjbMgPsyx4LNQE1ieNszREDWStcwuc6S0bWR3UKPyjNN
         qNeEjIh240oC49ig9gHX/yLijqZfHqZ9aTtZ4xs76/2ropALLpXF7bj1pyq6zHpjg2nP
         E/6ZSEZGW8qK7UB/is9G8J9VotANkjO/BZ+S4kgD6tc1HBLF8apANh8rXSiAsH7SPHh4
         R3FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B3NZN87s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jt6-20020a05621427e600b005bff3694a54si7066495qvb.365.2023.05.24.12.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 12:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B3NZN87s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1tuk-0006ln-9d; Wed, 24 May 2023 15:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tue-0006kq-SI
 for qemu-arm@nongnu.org; Wed, 24 May 2023 15:12:46 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1tuc-0008Vs-9D
 for qemu-arm@nongnu.org; Wed, 24 May 2023 15:12:44 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-64d41763796so973991b3a.2
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 12:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684955561; x=1687547561;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gAq2fsDgD506O1XwE5EUT6+UfdTDa3xInx9SxnTNMQU=;
 b=B3NZN87s+ylRg6KeB/3JKO97fxlKzVqoGJ7uLYRsyof8UtfitNMxIZr+Rh7JSbb1Sj
 JLSdvWx6xFdygYvvwMy3BJ84awm9ogbbz4sZyFe/UP1fAoBuFmViWf7Pyg8hAdStqdUK
 WS0BS+ozRINTTLuw6hfWKO4fzTLK72+8A2qJ7YFr+DQB9dTwLmj6gMo52+wLKgZwl0HT
 2TPEuwbSaDdRIrq1V0lsORhFPZUdw7FXf2ytRThjyGMYMXPp1Q2IXG6fkUEVSomYb44n
 adsnL7V5ZbygIY5vMhiYf+KqtJXLXG+Rx7Xny/kHx/ZvR3TMzNKRAgi0yISV9OfTC8js
 AJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684955561; x=1687547561;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gAq2fsDgD506O1XwE5EUT6+UfdTDa3xInx9SxnTNMQU=;
 b=ZrwbkseM5fkl2Tu1hqmhK5a7x4sXS0oaBZmjAgqkrQHJh1+NGUkIxQhM9AOCzEMWmX
 ezmqyl+qGOtT6tH3CtbHSj/ING+ES2SLognW6tBgKC5i+JCzzf+6sp0buJABZ5uaeeMp
 6s4x6KVh79HZJZG4O8f88qrg9umXDVeNtTVWiDf/2WuAwiBvOneXBf0pLKXF5narGGzV
 hIdJbbpzNKXdGdKg1rUBDK8wBJ/xYLYGtNgKGE7bkjnYrk4snu5LhX06h4I+P9aAqrkD
 GrYEMuV6b6R4ejWLOfE2RbpiwYX8E/aL5BJhl6s3HcNMiyGgdEgcf9Vf3GK+tzihZl3E
 Ofsw==
X-Gm-Message-State: AC+VfDz3rUW+VocCnKjLKWeMTDVeUHzhYzCxs0RAszAt2kEFK0EuwesC
 ixumACmmDZczCcrOeISXiNoqzA==
X-Received: by 2002:a05:6a20:3c91:b0:10e:ce12:356c with SMTP id
 b17-20020a056a203c9100b0010ece12356cmr1282039pzj.17.1684955560712; 
 Wed, 24 May 2023 12:12:40 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:6b03:9af2:33c1:3d6b?
 ([2602:ae:1598:4c01:6b03:9af2:33c1:3d6b])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a17090ab80300b00253298287ccsm1681026pjr.14.2023.05.24.12.12.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 12:12:40 -0700 (PDT)
Message-ID: <fac72b97-71b6-c911-c2d9-68e823d347d3@linaro.org>
Date: Wed, 24 May 2023 12:10:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 08/10] hw/arm/realview: Move 'loader_start' to
 RealviewMachineClass
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20230524145906.33156-1-philmd@linaro.org>
 <20230524145906.33156-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230524145906.33156-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UjkyQS5/+/8y

On 5/24/23 07:59, Philippe Mathieu-Daudé wrote:
> Instead of having each machine instance resolve its loader
> start address, set it once in their class_init() handler.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/realview.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
