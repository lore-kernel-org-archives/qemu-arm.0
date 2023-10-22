Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp891711ejb;
        Sun, 22 Oct 2023 09:54:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5aPq4YOpOfT9Er4TuxjT3Dp8btGwbPpG4E6NZ6LR4mslZNOqpoN3dOxl8KmL/5EqCAVUn
X-Received: by 2002:ad4:5aaf:0:b0:66d:a130:1d50 with SMTP id u15-20020ad45aaf000000b0066da1301d50mr5068499qvg.21.1697993696667;
        Sun, 22 Oct 2023 09:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697993696; cv=none;
        d=google.com; s=arc-20160816;
        b=dtzklg4QKm/AuqGfBk3NLfBQgzklJHH3OOsmTc5sO45ogo28RZnbWigcccjg+VR1xQ
         6L9o3A9LWGnq5t93Neo+YopmpqMqw/FbRcR5Wa9Pr+SXxRssFo7hMj9WgeYrMf8ZdpYf
         vvJf+ZkZ/iYVKO8IlE9YvSv2qasQK/JfNZKTgb6cFop9XgxlSNGU2vSIro6mBcejVffN
         c8jR9bB4tDioPudSpebupVtEwJ4oC9Rmk0rEaxO6QMhiCwXu/S8FENKrTq0CXCqvXN/C
         aIbdhIq5l7NFEy2A805GkGJhqFkrEZMtoBuPOi16cuygxLfkzX3P5qvm4kgSK0bztLx6
         Pdxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VxWQazrEGhsusWLqLyeXUS1YYRaKS7zeGPdscQID2fQ=;
        fh=k4iButtuj8hEc/Hzb102WV+ymnTGT+2i4lFe9Di6uCY=;
        b=wtJ0RqmY+jKCRTNdhX5SR7PbCtCl7Y5uzh0Jr/Or7R/8uhBaFSjWaSW0yclzUp4C0J
         GTjHOjnj11E1TyR4tiZXyEpj03KVvzAGRigwwKTByKKdz8xVqZlZvXyVbN+PYy4vBtj7
         bCotKaMeyYrKvspMt0l8aF6AhiUspZpTYmXs25oaKu/gdSd2S3AbaZStwMC+zt4sxg/t
         sP8d5M720razLmqwnBKZFF77CH9lV4YH4xt9q50XtMvAxcsrMu8Fa/IJ7L2z76v9fyxj
         7Df921UzF4bsnHFzznGE4ex9HA4jncJWVFarBKRZ83MNO5tSit3Lm4aXJvDjQuZOTuqo
         Shxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GXdX7GXa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020ad44b62000000b0066cfafee84fsi4325155qvx.507.2023.10.22.09.54.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 09:54:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GXdX7GXa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qubj2-0001Mb-3k; Sun, 22 Oct 2023 12:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qubix-0001Ik-Ux
 for qemu-arm@nongnu.org; Sun, 22 Oct 2023 12:54:49 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qubiv-000344-8V
 for qemu-arm@nongnu.org; Sun, 22 Oct 2023 12:54:47 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6ce2bcb131fso1770335a34.1
 for <qemu-arm@nongnu.org>; Sun, 22 Oct 2023 09:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697993673; x=1698598473; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VxWQazrEGhsusWLqLyeXUS1YYRaKS7zeGPdscQID2fQ=;
 b=GXdX7GXaE6Y7B80TWEhTK8R7PgmwMivp28q+KP+I4IM8OnyKPY3/ISe7ipjEQJUxb+
 5iOy6APVoLdBLwGtMoHkathy531jF7VVm4wKozkLS0G49nLpTPaA7ajZcWEmxKScLI4/
 8yfsNOA5NuXw99noVcuCsiLku+KZtna0M+Vtr5fbak10TeKBTJ6e3larLUFjgwM+n1Lh
 OgE4Rne+/Y+gDk7efWgL0AzYdnrii2jCYmxYpqthlpo67WlxJRiJtoHHaqqkAMLaX8KY
 NtDbyw6GPPb7u5HWGLHgVKugLrQxqFM3yIC9FDdL+3VJsywOHkjZcyz7otE0Huq+3NKa
 E9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697993673; x=1698598473;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VxWQazrEGhsusWLqLyeXUS1YYRaKS7zeGPdscQID2fQ=;
 b=DBQIkFazdRkzYADqLgfTwEvg9sEBSF0usJ9BIEm9aazqtuGinoWuvKozm9ZPz/NCOz
 r452qoeVZPizUEmpmMEEiel0TVPURJIeIIcsCB4mQhGEgsfUTsBx6BYI2BC7GGHtca20
 7P4+38xOA2xVxOW6Riwq/qkgxmEY1bsWM40bj+ik1cBo3n/BzpqiIDyN8Q0K1Tyt0UG7
 rf5Fhry6hwzXL2knmkhMqLBO0RxX+dfcsRBixEQaMVJfbI3sg/0b31wNDEUmmGUQ4hOO
 4oQ9hBBZ8s9/HjOT7HhGcwULpsqrYEwIooVy1GpgVraDURxR8KNcMkJGX7ghk3VhZdZQ
 rX2A==
X-Gm-Message-State: AOJu0YxWq5T7WOglrvw92doSOPWTlKF7TPDyud55p0prF6BkvDe473Sj
 3xcJZyJ6FTe80/ay9F2OGMux0A==
X-Received: by 2002:a05:6870:9f8a:b0:1dc:33a:40d8 with SMTP id
 xm10-20020a0568709f8a00b001dc033a40d8mr10001768oab.4.1697993673576; 
 Sun, 22 Oct 2023 09:54:33 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a17090a2a4a00b002790ded9c6dsm4934130pjg.31.2023.10.22.09.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Oct 2023 09:54:33 -0700 (PDT)
Message-ID: <45a219a8-d2e7-4df3-a393-5a5407f1ab00@linaro.org>
Date: Sun, 22 Oct 2023 09:54:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] hw/char/stm32f2xx_usart: Update IRQ when SR is read
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20231020170009.86870-1-philmd@linaro.org>
 <20231020170009.86870-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231020170009.86870-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: r6zbui8tK8GI

On 10/20/23 10:00, Philippe Mathieu-Daudé wrote:
> From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
> 
> Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
> [PMD: Split from bigger patch]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Is this required?
> ---
>   hw/char/stm32f2xx_usart.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
> index 519d3461a3..46e29089bc 100644
> --- a/hw/char/stm32f2xx_usart.c
> +++ b/hw/char/stm32f2xx_usart.c
> @@ -109,6 +109,7 @@ static uint64_t stm32f2xx_usart_read(void *opaque, hwaddr addr,
>       case USART_SR:
>           retvalue = s->usart_sr;
>           qemu_chr_fe_accept_input(&s->chr);
> +        stm32f2xx_update_irq(s);
>           return retvalue;
>       case USART_DR:
>           DB_PRINT("Value: 0x%" PRIx32 ", %c\n", s->usart_dr, (char) s->usart_dr);

Is there a status bit change missing?  There doesn't seem to be anything to update here.


r~
