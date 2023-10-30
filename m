Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1617440ejc;
        Sun, 29 Oct 2023 20:40:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvfm1IYfRqDuhRXReSgzRw6cv/oyzuEW82D3g304Rrx0cpVDttMWnpSJcnZOvONe+jOjY9
X-Received: by 2002:ac8:4e47:0:b0:417:d340:c426 with SMTP id e7-20020ac84e47000000b00417d340c426mr11926105qtw.9.1698637219615;
        Sun, 29 Oct 2023 20:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698637219; cv=none;
        d=google.com; s=arc-20160816;
        b=g3posIDYuYpUxkSRgPnXKIkL94CelaqXZ6ICr4938sXy/UX/h0gHVeNm2GoxJcAQvQ
         rMSFY8rC0qFyR2upsoi5iCSNsvKN4exZwm2D7qXiiGvzcXA50Ew1z1tceUvNNcipA4gG
         tXFEpACb/oRXYo8T5JYQaCoCTpCgoZXO7s4s3A9A2oVMEybNKskNhrkSucyi4xGwLtxH
         pGbSQrGtRnmMqZlJRQ2m+lYdqkqac8H34vIVjJHyvwJdIqdOQqOoaJP+XI8tDkNrFwb5
         9MZHMLfWmYNJTVQYmHGYBuXAjGgWqrKq28iK6CQ0oDGr2BiZtKnA8GI4JSybZYsltE2P
         t1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CLbnV4tOw6DA3WcwtkTlioe4LZD7T9M1jQqf5mnagl0=;
        fh=5H85q9tQYYGdQYeaF5Nhx+gdy8rTfR/PSyyhR28qviE=;
        b=XzlCT1PVmmBowktYdJ5iffCvSUJ2LNY/jOMXszGRAlVqvi+PAkR9pEyV4b52T5DSNV
         otd++qRTnnwG5Mv97qytM2jveUgknBzyzG+CunEHsDaF6aYvUTuMAFQItRDF3GoJ0rPx
         /THEldrtUGjGSS6JkYvQeq6Lidgg5XdztZ170S8YXoJd+a3UYzD5XIMWU0z0AT6RFpAG
         ZNuDWXTXFQ+jn31F2Y917Sc3Z1x+HoskKts/lxXqCC3qr5qMq5twTgYmevDyaTBdltHH
         ZA1BvvPY3WgVovezxEPbJpOtwrMWU2bIhn1vWf2NBPEThUEMRS00wt4WVe+zbpM/cStO
         5Agw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mL/HoMRS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13-20020a05622a138d00b0041989c564ecsi4979913qtk.423.2023.10.29.20.40.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Oct 2023 20:40:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mL/HoMRS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxJ84-0005Kl-45; Sun, 29 Oct 2023 23:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxJ82-0005KV-Kf
 for qemu-arm@nongnu.org; Sun, 29 Oct 2023 23:39:50 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxJ80-0000nS-UR
 for qemu-arm@nongnu.org; Sun, 29 Oct 2023 23:39:50 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c5071165d5so11377031fa.0
 for <qemu-arm@nongnu.org>; Sun, 29 Oct 2023 20:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698637187; x=1699241987; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CLbnV4tOw6DA3WcwtkTlioe4LZD7T9M1jQqf5mnagl0=;
 b=mL/HoMRSQHKgfdLLV6AqMlqkfKQjnHXkIEfyw8ZtwmcYRieLklYwXqe79mIvu+ZtVo
 eHG6CRrps/T5MZh6zehmVT13M4qvRzlE+7+TszeVeFJjudAuIiYq7lLAfAQ/csYhVROF
 X++d8UbKwugpa7z/nnbPN289y/ljzcA14yIc5reWPL8GbNkeOHXkWWP8RCK+6rgJF3rL
 3oOvUXogEj+0qQJvrM996QOTglFUf3DrpxbI2LrhNXK26W+4jXC9risR8lp3StoKvzHN
 s9VZY+AlfJolWeUD3DiAdsqFPMb1FitnDgxfeZ9TiEVIr1ugXEFUeRXRBcV11dByGoNO
 ftGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698637187; x=1699241987;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CLbnV4tOw6DA3WcwtkTlioe4LZD7T9M1jQqf5mnagl0=;
 b=C8Uy5q3MQn7SJpUf5TtpTy7tufHv6W3G+lB/o5BgxlL9Tp9wJbKImQtZz/IfAYQZnV
 5qUOrHpwKyv/5c9f7233TtQE+tFYYPcuFrEOASoRXNak0+HhrbidUZ6Z9aUZns+GmWmu
 JFrGbTI2D756L3uCMV1HqPEAnYpKoMUecKIDfVFS4zHApjI7t/VxrZjSSny4G0R92vlw
 xa+aofXN5CzM+H0vPLF5phz8EytnI/KfalfyiLmN9pThovftenpf31+ij4S2duzDS/UF
 3ivVNfRsrpflrVtYJU2FS/+qRwWr1TsmeN8Aghh0eUY3FlLaq1ZFy0U5aUk3dFMj8iY0
 Xq3g==
X-Gm-Message-State: AOJu0YzXaV233+ViQ3THVaSHqr+jvmn6MKiCpIgvJ82nMWda/gsRrBRi
 w4tZJGMnGMG/A2xEMikLjz9MHQ==
X-Received: by 2002:a2e:9154:0:b0:2c2:8efd:a52b with SMTP id
 q20-20020a2e9154000000b002c28efda52bmr5584293ljg.36.1698637186979; 
 Sun, 29 Oct 2023 20:39:46 -0700 (PDT)
Received: from [192.168.69.115] ([176.170.212.50])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c431500b003fe61c33df5sm11389641wme.3.2023.10.29.20.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Oct 2023 20:39:46 -0700 (PDT)
Message-ID: <797a7fb9-6987-525d-cc0f-442a308357a9@linaro.org>
Date: Mon, 30 Oct 2023 04:39:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] linux-user/elfload: Add missing arm64 hwcap values
Content-Language: en-US
To: Marielle Novastrider <marielle@novastrider.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20231029210058.38986-1-marielle@novastrider.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231029210058.38986-1-marielle@novastrider.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.972,
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
X-TUID: ANKt0WVAKMQN

On 29/10/23 22:00, Marielle Novastrider wrote:
> Specifically DIT, LSE2, and MTE3.
> 
> We already expose detection of these via the CPUID interface, but
> missed these from ELF hwcaps.
> 
> Signed-off-by: Marielle Novastrider <marielle@novastrider.com>
> ---
>   linux-user/elfload.c | 3 +++
>   target/arm/cpu.h     | 5 +++++
>   2 files changed, 8 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

