Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp813514ejx;
        Wed, 9 Nov 2022 21:43:15 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7hEjqi1CqcbTvkq1Ar/kQFeCMZ4gXDe+MNXLFIah3xnouUFVdxL6AM3mNv9Yb2LOBweaNR
X-Received: by 2002:a05:620a:28cd:b0:6cf:93b3:a78 with SMTP id l13-20020a05620a28cd00b006cf93b30a78mr46011457qkp.11.1668058995349;
        Wed, 09 Nov 2022 21:43:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668058995; cv=none;
        d=google.com; s=arc-20160816;
        b=NgcQ3j3hzcLo4ruSL0sbO/4gc8oz90ceEgZryb9pSmp4ZvjE1YCBR1kpVulkBmWdvV
         LNyAMYvgeNj5BRfMq1y6YwGQ72mu5Ns0TCXI7Vb3pdLiQEOZA0wgWo+D0HNu8CTr+80T
         Dj2TyAqVfDfR+5UiLYLP/x6xjCdMOMy1qguy7/1+gasSI5sK7JlL8yahaxcthk26udEZ
         9FELavChmrf0XfVis7EZZcvuVwKmVZvz8a6e342ubrnAb+X9fpwwazg07tM6Tp6lYC7V
         hFSwnq+biiiJFTQS5ir+ZPnxPDShoxDvw2ILdctcP5e/QpXL2HDFV2MnPyE1wN8ZjITB
         syIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=WU/OVvNm8oee50IZZfJK+G9QlH4NsN0t/SATCJK44MM=;
        b=JcT4I9jYEpOl6Ypi8DmTOatwJsEm0K7O8cW7X5tSOq5JauuHZjLq8l/vu4a2cJn9Rl
         xqDwbN8s0LECO/jOaXeiPzw4Kz18ooWWlAwHutFhmd+w5mUGyrPUukQe2p1wdten416H
         ls1hTCIOGMd0cJtBl60fhIVSfsleGQLL9bkOWdHwPtUMxFE/qEDKpX0JQXVz5NJuc1Xh
         1ER1s8gXIpd2oKc0KFCoDeqY0l4HC43C+hHa0F7kQ9sBGKP65HduXQ3CUi1EMkaYgA67
         CGrSnMIgNJ2J9uEQqDQ8wnzoKWDvmXp/GAscuu5k7DQBp7Z823cvW9AIWSLunXzOStD9
         nmJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W5s0YA4j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2-20020a05620a0d8200b006fb21708719si254025qkl.169.2022.11.09.21.43.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Nov 2022 21:43:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W5s0YA4j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ot0L3-0002Zc-JT; Thu, 10 Nov 2022 00:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0L2-0002W9-JB
 for qemu-arm@nongnu.org; Thu, 10 Nov 2022 00:42:56 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0L0-0004UQ-TB
 for qemu-arm@nongnu.org; Thu, 10 Nov 2022 00:42:56 -0500
Received: by mail-pl1-x636.google.com with SMTP id 4so680038pli.0
 for <qemu-arm@nongnu.org>; Wed, 09 Nov 2022 21:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WU/OVvNm8oee50IZZfJK+G9QlH4NsN0t/SATCJK44MM=;
 b=W5s0YA4j04Ven6An/GvxxNM3oHDahE5MLJo1snTWBNfdbxwyo0c91Nt801eJotjPZ1
 uUc1JbUp3PTLkNUgAe2x/rNeD+OlmbHJWGrCl1fvtqtGP4UxoOdzGk3FnVDHH88324rS
 GsIRDCjmMpQEJMUm6ZrDRSJC+gwu01V59Mh++FLK1pduFeYZ1WKBJhrDTT8ye5gtqlVf
 enm/KMKhR0xgqQNDw4JtPwr9RsSY6panvTRCYUExvmFF+gQ7lznhfU42Mt4Xrzsy0NjQ
 BYX3x5rdn9TMny0HDLrkVOvjMBJ2q8SDXBqG+KpxaV4dC3ssTI1hw1hWAAal2XBd/uro
 FD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WU/OVvNm8oee50IZZfJK+G9QlH4NsN0t/SATCJK44MM=;
 b=hroGd3lqZW914Avy2BqbXTaH7+mph6iZHe272xSXezIarhcjWIoH9/BBl/+9Hq2ZAS
 wcUrO6Og9USiD9G9XM2VEuqckJr9Wndx5jzcWdaU/4NejJS1dzh4NzxHKDLQPd5jpO8I
 fgTfw+BDsiJhTNjItfD3qiDWR0iGvHgNcjhItskCsYMq+n8NpPS+nDsVZNO7NuIv+af+
 TS/JAwQTvDEFjwMnIji+HZsm7yUWpM+4hbu/AIheMYn80whqLUeQuW8n02gc/0n2LGUc
 zgtfZ7yu62B9UOZTSf5q4b/jfsLmVCSzqeREXUOENeVyYDHK+fKdVegH2guWQ6O7J0iD
 uY8g==
X-Gm-Message-State: ACrzQf3gxkwDgp8IEuJ3OYCiJyDl70xjEuT7fdwGAvGlkTHqamXD/1Hj
 WR9ITAUaKeldrJMMXS0x9E3D3Q==
X-Received: by 2002:a17:902:e54a:b0:186:a3ba:232a with SMTP id
 n10-20020a170902e54a00b00186a3ba232amr63336064plf.77.1668058973551; 
 Wed, 09 Nov 2022 21:42:53 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a170902e84d00b0017849a2b56asm10251168plg.46.2022.11.09.21.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:42:52 -0800 (PST)
Message-ID: <6ba6d08c-2538-a32d-cc12-23b456f70514@linaro.org>
Date: Thu, 10 Nov 2022 16:42:48 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 5/9] hw/intc: Convert TYPE_ARM_GICV3_COMMON to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109161444.3397405-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8n75k31X2hpW

On 11/10/22 03:14, Peter Maydell wrote:
> Convert the TYPE_ARM_GICV3_COMMON parent class to 3-phase reset.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_common.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
