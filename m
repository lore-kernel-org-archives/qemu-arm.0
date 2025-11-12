Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1E6CCF9F8
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 11:28:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJ91G-0003cV-B8; Wed, 12 Nov 2025 06:28:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJ91A-0003ST-PO
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 06:28:04 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJ919-0003mJ-4S
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 06:28:04 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso5029025e9.0
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 03:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762946881; x=1763551681; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AoKUv+DzVLzxaf70gVSshw91mhv9yjN4uGTACtzDyD8=;
 b=lFebL/9z6jNNHuA+dkwk7V7RJFNE1t5lw5zXLT+mlj/HIMIc015NkT/nSlVJ0vXmcm
 27ShP75NJy/h78J9nn6PjWBhlHfvBfiIwuh7TlmsCsnhNpYHwmiHaEEu/5vvTPCePj6V
 P097UJAb5WjuPsWoAxcmawQBDAZ2lzVShjDDM4hd3HVNOAMmTe1kIXyDD59yIycWmr0j
 TdyOPZVYwJ2kjvI29lWhaKEm5B0sLcrcSJa1cscvOa/FQ3Yhemahn5qJEbiRPioDV1mo
 /pES6acLNbCRj3sM7LOlqqb4aWzYiDdpWP6txCSYVXWgK56b7/fGcq/teG1p6CceAL6k
 +RZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762946881; x=1763551681;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AoKUv+DzVLzxaf70gVSshw91mhv9yjN4uGTACtzDyD8=;
 b=G78Z9zKr4ggCCez2jFERm3JnFDzhAMt/4ejYWYgNu6JqrXPelPguVjVVRXPHzFD8eH
 YBEhwyNISoLzlrgHW4OLPer9szqlwraHN5kOpjs1fWomFe6vCquUWnEQmAsn73o+Z+Qz
 SEJ900Nmdm9k25rA1VVJ/sAafu5V3mdBlVSbMgt+0LlGOOoHFYnpJQCRhgGNcCyh/5oG
 /7A/fmUmqEpa5CkIiUtpp7v6LMUU38QIYKGx2AXwyScwnEh97vBYUSojN1rXhUvDwr7n
 XkFfZQ90ubqlVLjDQa/NYo8ABlQl301soIGcUMhc0eRThDuvR9tLw1kS/aZUw3mBrf8M
 zSVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe95DSwXZt7VOjpIWhsTNewCfTCOaE0mItC33UNWMt7pIy00ILuUOM/MkqZj5N5lOjV0Au+Zyl3A==@nongnu.org
X-Gm-Message-State: AOJu0YysmTa2KjcWVRdSwvXw/sgo+nIW/36Qw7wFGlZN080ZkaQXWCHC
 XD18YOiS4k+cQsk9LM89Oxi6iGGnwpYkGyxJFgI7qyARyj7PrF9R1RQsbQS6Ff2nlBg=
X-Gm-Gg: ASbGncvL8WR3fXWWzlDI7xOo8gY8MxJj3wvIKLHX7gX+86dBvxGfp3BufV7MqecpUz+
 DFptjc3xBPiUpCPFzfKogL/f+OWi0HfoHu8qI2L9OUMXEkeetbKVlLKG10e2s9/k5Kwl+0nsaaW
 aL1k3BiiwFLQcZWckAeF3zJ1oAGa/jeQNmo6JimHCExSFKOOse1ZzvnC23AgHhc+n+J6AbmCywL
 EnfeIys2RPsgQmgz0+29vF+ghhvfCDxET4TiGKTjKqmcnDbEUWHpFih5XQAlS61en6x8fZMQyfe
 cNwzYKYbXIGSbBu10dp5K5MmqIXizDI00N8larJrecLt1iooQyIXMWhU5MMnr2B/vqEoFOTR/I7
 DHMm6MmM+nDnXNWCI0yILXWFLSBvEIgPA1ijGcBIPAjSceava/WdDq6Iy95Ye0kC2/cVBa29Ivz
 PEK+3Hwehp4/968DrYHw+NLnKyXdb/4qYkbZeJUd2Et7o=
X-Google-Smtp-Source: AGHT+IGfKlLK08BjzDpfbmkS6l/S6hiJRoBU04Qb3tkycW23WEeXu9QKoIiU7quBlFOELTbv547pZw==
X-Received: by 2002:a05:600c:8b4c:b0:46e:59bd:f7e2 with SMTP id
 5b1f17b1804b1-4778732a9b7mr22253195e9.11.1762946881468; 
 Wed, 12 Nov 2025 03:28:01 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e8e743sm28601125e9.15.2025.11.12.03.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 03:28:00 -0800 (PST)
Message-ID: <75da1fc5-0140-4c98-a4c0-b1946c9f61a8@linaro.org>
Date: Wed, 12 Nov 2025 12:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] hw/arm/zynq-devcfg: Prevent unintended unlock
 during initialization
Content-Language: en-US
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Kevin Wolf <kwolf@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@amd.com>
References: <20251111102836.212535-1-corvin.koehne@gmail.com>
 <20251111102836.212535-5-corvin.koehne@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251111102836.212535-5-corvin.koehne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi,

On 11/11/25 11:28, Corvin Köhne wrote:
> From: YannickV <Y.Vossen@beckhoff.com>
> 
> During the emulation startup, all registers are reset, which triggers the
> `r_unlock_post_write` function with a value of 0. This led to an
> unintended memory access disable, making the devcfg unusable.
> 
> During startup, the memory space no longer gets locked.
> 
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   hw/dma/xlnx-zynq-devcfg.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
> index b838c1c0d0..f28d0015e6 100644
> --- a/hw/dma/xlnx-zynq-devcfg.c
> +++ b/hw/dma/xlnx-zynq-devcfg.c
> @@ -221,7 +221,9 @@ static void r_unlock_post_write(RegisterInfo *reg, uint64_t val)
>   {
>       XlnxZynqDevcfg *s = XLNX_ZYNQ_DEVCFG(reg->opaque);
>       const char *device_prefix = object_get_typename(OBJECT(s));
> -
> +    if (device_is_in_reset(DEVICE(s))) {
> +        return;

Alistair, does this belong to the upper layer in register_reset()?

> +    }
>       if (val == R_UNLOCK_MAGIC) {
>           DB_PRINT("successful unlock\n");
>           s->regs[R_CTRL] |= R_CTRL_PCAP_PR_MASK;


