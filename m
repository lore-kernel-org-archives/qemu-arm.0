Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22883C83F1A
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 21:55:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubR87-0000QK-OU; Mon, 14 Jul 2025 17:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubPS2-0008CG-G7
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 16:07:03 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubPS0-0006OY-24
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 16:07:02 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so2854304f8f.1
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 13:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752523618; x=1753128418; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HnGuHvjonix1TgErAzlhDeOfGgZDuvfIQJU1S3KJiag=;
 b=PU7n7AdWLVpfUJQSnRSbaarumIXl2vDT0gfYi92UVgpBQWlWw05PyAeHXwnUwPR6lI
 GSKXFKddIJnDtd6RiSjxqsbKEPCshQcBgyevPRqOBwU6ehBUNsMuIZy6xR4LVu+9nxdu
 GZdKde3afa3MakJCTivFKZcpAFyNvWmEQexa6SNI9Y08Qz+o0Am2cxoDxcl0PxLQU0lx
 YqXEXdjg3JH8wILs5Nm64j8JukF6H8P+R6heSkZZDHkpUwMLaw0OwHTkFqZ5j9MUc7wb
 cBL15TdX3q4ZaMhnQq4Hc60AVyoOcCaekbtVlcfNV8nADkU4j1k7+Xc4C8E9kW0izMnC
 ukIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752523618; x=1753128418;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HnGuHvjonix1TgErAzlhDeOfGgZDuvfIQJU1S3KJiag=;
 b=Kj5ROnDK4L4y1ahFOmzbPuS045m0hLsSoq1q6bWBHwtaQfOtjZTe/U3dwyp4bj/cNk
 QnUeE3Ooizqjzsu4PPIQOfqZJchmqhj4Z/nohr4aWP88Dx7kz7dqHdKbzMZvIhXbxWnk
 +0c9r17t84hFusV6czAU8RaEEYrtocZoJ/zriolSAuIiujHIVR5AnbXXjMwmaCriVzgq
 gc18pXIbIKSu8l7rPghazdlzp+LEv20SRajWCK7FcMSTP1K9DpCrUzXFhp3JQytrb5yd
 CGld6ahU60ulDFMyCTxplx+MaxO1AAa7eWtGfAGQfP5drantuhaHIhV6+6CzWD4pALlB
 E5SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPPCey1bmCgLafykdCltI5Kjdsm9T4EceI3Cc4gq6jFoym7Nyr10yPnTjrKnXM3U0KGjzv92BpDw==@nongnu.org
X-Gm-Message-State: AOJu0Yz8oZ5T06g5myDpOZco9R05PoCsE58g/b+GTO04E48dezCLEMtB
 2iFarTLAVPL0sKyq5YlU1DZVB9RbXqnEN0yx6MfbkN/zCx3tnptrEU6S5MB9rvg5k0A=
X-Gm-Gg: ASbGncvPbQnnGRxp2rHcyvw8zvvk15g+IPpuXYwb7ROH/dEMKeW4JCRkede1PPm4/O1
 1zPSA1F57pd8Zu5YxjUt29Bs4z/VYqmOu30LZmuItsBNYc15cSE3axJ3vyRC+pclpNcVKA9KDjA
 KJ0t8ow/HFQmzrwAlBa1o3ckG3UNKA6u/Bp6OiFyPY9WWJ/RhRGN0WV5Wb5nm6N8smYxfMYG4Ms
 ajdkYdu9RPKx9UhD2cv/URa/Zg8P6uyjqfFVMp8m26M/XRCtBOd8J+5CefqbjfRVaRmw2riOsgJ
 U1+1vfi3Bbu4KysfnXsr5gUPA6dqnc6E0bxVIGkeXE1QXi1/k4GtbyiGBF9YEG5iwhycp7tjozV
 E+SXuRfTzh+kBTCbG871kl5s+RGtDZ4kEQhP6S6Wgw4wgKqKyklK+tRcyelQSYyMaEQ==
X-Google-Smtp-Source: AGHT+IHvvkxTfUYFzjGFZYZThFJQ0Fo+kLEO5mtI6Cz1NsTYN6C3+cPekXTGxz0L3Js4DxK/n3cBYw==
X-Received: by 2002:a5d:54c1:0:b0:3b5:def6:4e4 with SMTP id
 ffacd0b85a97d-3b5f18dc957mr10427699f8f.46.1752523618024; 
 Mon, 14 Jul 2025 13:06:58 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e26ee3sm13491852f8f.96.2025.07.14.13.06.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 13:06:57 -0700 (PDT)
Message-ID: <9f73dd64-5fd9-4b92-b146-74e94408d437@linaro.org>
Date: Mon, 14 Jul 2025 22:06:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] hw/net/npcm_gmac.c: Drop 'buf' local variable
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Jason Wang <jasowang@redhat.com>
References: <20250714165523.1956235-1-peter.maydell@linaro.org>
 <20250714165523.1956235-5-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250714165523.1956235-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 14/7/25 18:55, Peter Maydell wrote:
> We use the local variable 'buf' only when we call dma_memory_read(),
> and it is always set to &tx_send_buffer[prev_buf_size] immediately
> before both of those calls.  So remove the variable and pass
> tx_send_buffer + prev_buf_size to dma_memory_read().
> 
> This fixes in passing a place where we set buf = tx_send_buffer
> but never used that value because we always updated buf to
> something else later before using it.
> 
> Coverity: CID 1534027
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/net/npcm_gmac.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


