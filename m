Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB922C83F1A
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 21:56:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubR9t-0002UA-5J; Mon, 14 Jul 2025 17:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubPTD-0000w4-6E
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 16:08:15 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubPT7-0006WT-4a
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 16:08:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b49ffbb31bso2714707f8f.3
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 13:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752523687; x=1753128487; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0ERVhG4+19VK8uLTMl2gB0Pc+pWnwUVPvUP3CACLwt0=;
 b=F8dp9Plr46fyYX0V+s2ZgvmZJQJWAsaFU0IH3zf0oYoGhP7D+i+GPXTk1AmMtdLAIw
 SL72LknVNJoZHunOrdU7LH99wq6S0eroY1XEssl3q/0hQ9ZO8LeDsGFxoE9HCxPdenmP
 mdZO7m9Xo/35pbTz5+pPB4zrtdfjbpnUlaQ7+M4csblP1dzRkGKvteh/IwKTNKacQw2H
 eLGYrrbbhRq9DGnOeK4q4VX1lyQU+v5L1VGTV4MDDCz9D+S5e9ORx9/86Oza+PtChY72
 PKSt9dS60aOKZQYNUBRkOk/6N9eS9cuu371jVJOX7u9CH9sRMzLo3qRu/WNkvA0ZZSQc
 tmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752523687; x=1753128487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ERVhG4+19VK8uLTMl2gB0Pc+pWnwUVPvUP3CACLwt0=;
 b=DcVyVUY3uhYwvFfAd8coT7Dury9H9pYj7w9tiEFMPPCuNybS0dcewn7OnjueanNU6L
 TSTzd4lEKzyi+qD8BN/1oe2Ai+wm7CrWyLeJm42nppUFg0YCjLF8J06m2ba/miwB/Qgq
 xtd/IeXIObfNUSkpE9YAV+VIm1PAySnmfAyI+KHNoLGmpOExtXKR/S5fCOMDt03dkmCv
 7HbCKKWDtSxroD4HQozwIbuvr7fNd79VwgZgMsBLanDzFSfYFH0VYG+Cwc7cvm1pC79Z
 /xq3aApJ7wj4Gw8HkATLUTigt6+cE1Zoy0b+OHQPXEv7AflKpPKncpJtvKrC6rp5SGtW
 bSfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDgxVal3k+CSypgR0AuSUmLH2hGrp19ACLPuAjeBYPpeV+KP2o4ivEPQ4M6xiPuDWT8fogStCfLg==@nongnu.org
X-Gm-Message-State: AOJu0YzQpZPGSFNuBbuNMwdsDkKNq2ewhUHCDA/pOuoTvGknADcs04KK
 YJ/fk7nXW8SgYfu3sz4wHd/NsJI8MLM8/n8C6KyG51Q0oH551YVsNfJeDD4db+ElvwM=
X-Gm-Gg: ASbGnctG6stooQsPwN+kRK1nRpMwZU75M2iJ6c1J0UcuX0m37D1pZ1LhP1gQlkJJHXJ
 Ge3j6RvrkMX2w150N9qtThZLgbFSKV+PAEPViYlsPqu/FWEJX5vF3EdIYiBU83vrKnq7GpJGdyT
 8ziGv2Ad9A953AmFlPdnCdcuswG0T7KnVQJw8hl8WF3fjw/1oebL8zXBTiAE9dAEu+Ud4H1FHhC
 04yHAikbZF/WQWFbnXHJWnxEKxfMjuUzWNLyAdlJD0FmYHW+2saBQXB23BxUwPQGR6wxCp1buZd
 sU2AjiaIxTYfqwxraLmi/zwZNgcx3QlrEH9vBelFtueHllrzdH36uGNp6l24r1oL3hs35eRC4YX
 0OSf0hzbzSb5W0A1wTW+tpNoOUsLlKfDf4nVLYkdrLVjIR2NRXSbQ1Buk+EB2MxMrPt1FCC9mFZ
 ax
X-Google-Smtp-Source: AGHT+IHSlmOHR4/fgg/BkNfrqBUBdulpUUL5qzN3x6n5EZLyd0qDCF831ReBetRBd4pwDpRqxF03GQ==
X-Received: by 2002:a05:6000:4819:b0:3a4:e844:745d with SMTP id
 ffacd0b85a97d-3b5f18debb9mr12957796f8f.56.1752523687147; 
 Mon, 14 Jul 2025 13:08:07 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd241210sm142789715e9.0.2025.07.14.13.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 13:08:06 -0700 (PDT)
Message-ID: <3138a372-7649-404a-8e8e-53b097c33094@linaro.org>
Date: Mon, 14 Jul 2025 22:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] hw/net/npcm_gmac.c: Correct test for when to
 reallocate packet buffer
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Jason Wang <jasowang@redhat.com>
References: <20250714165523.1956235-1-peter.maydell@linaro.org>
 <20250714165523.1956235-4-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250714165523.1956235-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
> In gmac_try_send_next_packet() we have code that does "if this block
> of data won't fit in the buffer, reallocate it".  However, the
> condition it uses is
>    if ((prev_buf_size + tx_buf_len) > sizeof(buf))
> where buf is a uint8_t *.
> 
> This means that sizeof(buf) is always 8 bytes, and the condition will
> almost always be true, so we will reallocate the buffer more often
> than we need to.
> 
> Correct the condition to test against tx_buffer_size, which is
> where we track how big the allocated buffer is.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/net/npcm_gmac.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


