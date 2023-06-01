Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp142840ejb;
        Wed, 31 May 2023 20:10:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5cxNaDOJjD1n+4Smo2DqMwYMiqYOpo2M0vSNf78dQt2hqcAJ393a+NkBIz7uXmo6nYsD3r
X-Received: by 2002:a37:801:0:b0:75b:23a0:e7eb with SMTP id 1-20020a370801000000b0075b23a0e7ebmr7592182qki.76.1685589046155;
        Wed, 31 May 2023 20:10:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685589046; cv=none;
        d=google.com; s=arc-20160816;
        b=wK1xMZK4g/wupUy6yRG3wlG6NVsPKeUf3N6HtOHvWd6CvxuxwdTAEt+pPPxwIIKC5G
         o8TxULDFRbn4ToLjT86n3w303O1mrbdSrVwdt99v63wyBox13blpwyCtru2tS6C4SHyd
         Ru2g6Ecu50WIYvrXubo7VdmrFSJHXdpT7h5HdT85kdeAN2TDVptR3mI/okew9QUWwVj0
         NggKDMRsfZRzE/hHljpRFkJic4I4xpz8fx2KpLuIilnyE7oG4NSidY3xA2Nz4+zgs/xi
         4sdZqhgN3y7ayxTWduxf0hfst2/VankWyZroIwGZPiGgN2z/6uT0zQ5Sc6NTWV2vW/y/
         BbTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jwhO8v48lzUhCJVA9SNVdwsnfkyhktZGOfQ1MAJIZ0U=;
        b=bGt8t+cETD6l3cA2rEgXxs+yvdvwvr2QZRtVmYr/ULWF1w9zApApc1zW1ON9h6LJDT
         KSeeK2oy2BYy+GRYQte9khXFMMguAjkHlSpEdD9G44ryRY00CbCx6n5Vl7gI1Y83YXz+
         yXnKFy4ySshqva1OL48We3XD7TYVGXrnDG/sMgo4J5nbv4gHdLaS7SEIDczFuO/8sHbC
         Fi8+t2tW1JHdXdQP/2ha/0Jo/HzBQvGqw0AQUAHejZb+u5V38G1lyZdWAuOHGWYpKsf5
         UDCfG+ahTM9EiUNl1Xa9owfFnB381e4ca3qSufXD5XPG8iWEumi9DtpkpP/lxsSF1J75
         FkAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZFmLm3AQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id op6-20020a05620a534600b0075c9760b545si9146457qkn.74.2023.05.31.20.10.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 20:10:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZFmLm3AQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4Yhq-0003cG-Gc; Wed, 31 May 2023 23:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q4Yhl-0003W4-M5
 for qemu-arm@nongnu.org; Wed, 31 May 2023 23:10:25 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q4Yhi-0001gx-UF
 for qemu-arm@nongnu.org; Wed, 31 May 2023 23:10:25 -0400
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-3f829e958bdso2230801cf.3
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 20:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685589021; x=1688181021;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jwhO8v48lzUhCJVA9SNVdwsnfkyhktZGOfQ1MAJIZ0U=;
 b=ZFmLm3AQCyLHiT0bD44V+Xzgs/8AZoyHAQNBbQNsxBcRmCBzIMj9C8sZWG3kZa2t3f
 pQ5UhBJFEIPTAaHmKnnK5wU4aT9yjE5N26dqv9potX9cXeOK3LKNIklga5mOmG37V1TZ
 veSXWbETNM5TjiqXbTB+1XtQ/Yws745ohMYQfrRUElBWMuH2ohbC1zBE7UXAgO/4if4C
 EpcZaILtmBBnyFdFWoelYj1QKLZI8sGaQ/JuKq479dWW1AsKFh/RRTYgbcrsp7Omb6EO
 wmLOXLBZN10w2udfjcJ+nQt1KBVM5V5nQn/i4/MpszY7QWax+HgTXU1jsOvwo6ItVvhJ
 EKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685589021; x=1688181021;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jwhO8v48lzUhCJVA9SNVdwsnfkyhktZGOfQ1MAJIZ0U=;
 b=UIjICUqSbFTsirWu2z3l9r0LBhF8JCODKPwuPsDd89xiXPv/8r0mNb+1qIasw7Nm9Z
 71jXWJgDPC0SJk8O6nK8FlLtAaZJr/XibodMYsBiITxQJSgFu5+i5Kve74trHLCzz/rE
 7H4EMJK1Kl6Au7zyFjP3zy3NVkrQIzpFH5DGSJqiYDdDjsnqyFop7jJJwl9HtM58YEU1
 QiAdqyK40I9XbRl7btC3MaRPXjZZcCT9f0gjzrm3NVDV7pkBFvzuCE8GB1/tDGwS05fM
 jeM1dQZ6w1wWgLYbyF59X3GFSdq2yw0qTU2jTBrqI55XXKLw157kFZwR3vLdMGySoenK
 /HOQ==
X-Gm-Message-State: AC+VfDwz6RZY8X5F9bOf61Jc1YzOv1YoRhthN/AInwNEh3kCZXFDUAt6
 LpiSbM95pkdXAkTLmHtQ5DwYMg==
X-Received: by 2002:ac8:5cc4:0:b0:3f5:41d9:fde8 with SMTP id
 s4-20020ac85cc4000000b003f541d9fde8mr7703596qta.57.1685589021665; 
 Wed, 31 May 2023 20:10:21 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:3019:d9fa:8bb1:50d7?
 ([2602:ae:1598:4c01:3019:d9fa:8bb1:50d7])
 by smtp.gmail.com with ESMTPSA id
 y126-20020a633284000000b0050f9b7e64fasm2037629pgy.77.2023.05.31.20.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 20:10:21 -0700 (PDT)
Message-ID: <2b01867f-2c9f-8704-54da-f618eca69913@linaro.org>
Date: Wed, 31 May 2023 20:10:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/7] hw/sysbus: Make SYSBUS_DEVICE_GPIO_IRQ API internal
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230531223341.34827-1-philmd@linaro.org>
 <20230531223341.34827-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230531223341.34827-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HYUXFIaeoXVC

On 5/31/23 15:33, Philippe Mathieu-Daudé wrote:
> Since we don't have any use of the SYSBUS_DEVICE_GPIO_IRQ definition
> outside of sysbus.c, we can reduce its scope, making it internal to
> the API.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/sysbus.h | 2 --
>   hw/core/sysbus.c    | 2 ++
>   2 files changed, 2 insertions(+), 2 deletions(-)

Yay!

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
