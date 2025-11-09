Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F66CCCFA13
	for <qemu-arm@archiver.kernel.org>; Sun,  9 Nov 2025 13:40:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vI5eT-0002aQ-19; Sun, 09 Nov 2025 08:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI5eQ-0002ZC-HJ
 for qemu-arm@nongnu.org; Sun, 09 Nov 2025 08:40:15 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI5eO-0000UI-Kt
 for qemu-arm@nongnu.org; Sun, 09 Nov 2025 08:40:14 -0500
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-b4736e043f9so303285366b.0
 for <qemu-arm@nongnu.org>; Sun, 09 Nov 2025 05:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762695611; x=1763300411; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FGGWXmu/Gp5QZI1NAlHAkNxYhkYxP1TdvMJCl4NIAwI=;
 b=wR1ssRj9AzOnB5arTnhLfwEcv8KZxRK1Rrjnp1WFKQTzAhJV2KT/pPzseenQYXQVNG
 Ei3A78EsLS9f5CrdKDv7DPSwZO+feobqnnXPh8M69/f3HNXPFHDs9mf75OB079AHmcOn
 0eBfYPopcXCN1irVc9TkmCnEKrKiamCHlGttiA8HIaK9U4grG+O3pOtp38Bbrfy1Jawv
 n6yXyDyDNYh6xp/ZWSkhQpaDFnYJq5HfCnldw8Nly9E8Ic61TRYwebTb5GgfDhks24KA
 NWFaSMoz6/gQQANPeoDf6hSvYp4+zsC3tiy+ef0Rn56OWkOqub6RcazQ+jQ/QBA960kn
 +VmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762695611; x=1763300411;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FGGWXmu/Gp5QZI1NAlHAkNxYhkYxP1TdvMJCl4NIAwI=;
 b=Nnkl72LM9HNpyonu/2FJ6qBb6amKMsUwd2NLzcfRvKaUftwmFovY58Y3M8FjomqE0T
 iXSdrF3K6Y4xRf7hBGXLDPtbHRBqnP+LZZdkjUnZhMdicT0XlVc/nN2QnlSAnazbysqo
 chniL+aWqxnTArEAo6n4LkrLZ+OwfQGfLVnQSNcj2W2cNNoG8CtRPeuuQOpy7UwFIQam
 gRsiHPsPcGd/I706ODnapvkRRd5c/UoHTb1lLqZPKrycJxrIXxZjujvRmgZbvPa538ow
 LGMFAZwtPJGYmUgr03THsWiOCD6HugYFwR34L6uIT2VFcCM0sKQss9Gni+cfMeUPzOW8
 HR+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0l5WtvZYW/NpplNMzGcLAf0VnPhZs4VnpaxVPnhl/UkaNxGvs9WGY+mpUPIEQF2BVbuszkIseFA==@nongnu.org
X-Gm-Message-State: AOJu0YzbKIrY2yCfTtgT848JXcLvJ3VKzrss0IYdA3zaibTKIL1EE6yB
 yDUpm84eo2CRWzSI0n23V/EXbYmxf5vhm7tx6GprjDu4sTbVpE6W3z7awVcdno8LrzE=
X-Gm-Gg: ASbGncuCHdFzdINtw3VE5SYw8nvtlXhsLmigvQrp9aE53/KpkCXvyfY9VQJ3M9tnMyN
 MM6v6h0uH8W9cYDrhpYDjQBOjalXLL+rhGXvur4heJTwEgpNCBUJEnC4w/95y88PUY3dShJfK42
 g3jMlkIGCIDFkxLzQJwgzIejRfuOa2+KFFthwOL1O/wNbXKRnNfNrvmDtWGbV0DUf8uCD9VqDck
 dZOvR59azmZuX64XBDdxyWUV0H31zq9yWhNh1/yFtoFav9UFcVVbZfqtYz2cuee2QhwrpRX+IBX
 Y55ddKMYo1DdTJDFMYdAZgTm98iPt4Pe2/X39CuyTXEz0Kt3rmvCL1kdLWB5gJy5yFzD41OMzuR
 7IHVmeZVDIPop8vC0Aqdwc3LHwPOubppfthO0kWCkpdBLVC1pSLQptE/Tas3yiCY2cSOGAByz56
 tuUjIh0Fn4Rs4C8AB8FBOJ6Xe92vpkSBSJsUrzFrGX+j3gONnLIzmvf8/Teg==
X-Google-Smtp-Source: AGHT+IGXWcafAtkvpfqSQj5CLPxLhG6iz+bmK+NVtdOrflDHP2NhzUIFdlIk6YTgWBr7onfep3XNzQ==
X-Received: by 2002:a17:907:7e91:b0:b6d:9576:3890 with SMTP id
 a640c23a62f3a-b72e04ca2a7mr522352466b.45.1762695610760; 
 Sun, 09 Nov 2025 05:40:10 -0800 (PST)
Received: from [192.168.2.7] (tmo-086-152.customers.d1-online.com.
 [80.187.86.152]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bfa24d2asm795825666b.70.2025.11.09.05.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Nov 2025 05:40:08 -0800 (PST)
Message-ID: <b708afc7-f894-4035-b6e4-62c6be99895f@linaro.org>
Date: Sun, 9 Nov 2025 14:40:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hw/display/xlnx_dp: Don't abort for unsupported
 graphics formats
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20251106145209.1083998-1-peter.maydell@linaro.org>
 <20251106145209.1083998-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251106145209.1083998-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x643.google.com
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

On 6/11/25 15:52, Peter Maydell wrote:
> If the guest writes an invalid or unsupported value to the
> AV_BUF_FORMAT register, currently we abort().  Instead, log this as
> either a guest error or an unimplemented error and continue.
> 
> The existing code treats DP_NL_VID_CB_Y0_CR_Y1 as x8b8g8r8
> via a "case 0" that does not use the enum constant name for some
> reason; we leave that alone beyond adding a comment about the
> weird code.
> 
> Documentation of this register seems to be at:
> https://docs.amd.com/r/en-US/ug1087-zynq-ultrascale-registers/AV_BUF_FORMAT-DISPLAY_PORT-Register
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1415
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/display/xlnx_dp.c | 53 +++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 48 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index c2bf692e7b1..d8119a56292 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -665,14 +665,28 @@ static void xlnx_dp_change_graphic_fmt(XlnxDPState *s)
>       case DP_GRAPHIC_BGR888:
>           s->g_plane.format = PIXMAN_b8g8r8;
>           break;
> +    case DP_GRAPHIC_RGBA5551:
> +    case DP_GRAPHIC_RGBA4444:
> +    case DP_GRAPHIC_8BPP:
> +    case DP_GRAPHIC_4BPP:
> +    case DP_GRAPHIC_2BPP:
> +    case DP_GRAPHIC_1BPP:
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented graphic format %u",
> +                      __func__,
> +                      s->avbufm_registers[AV_BUF_FORMAT] & DP_GRAPHIC_MASK);
> +        s->g_plane.format = PIXMAN_r8g8b8a8;
> +        break;
>       default:
> -        error_report("%s: unsupported graphic format %u", __func__,
> -                     s->avbufm_registers[AV_BUF_FORMAT] & DP_GRAPHIC_MASK);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid graphic format %u",
> +                      __func__,
> +                      s->avbufm_registers[AV_BUF_FORMAT] & DP_GRAPHIC_MASK);
> +        s->g_plane.format = PIXMAN_r8g8b8a8;
>           abort();

Don't we want to remove this abort() call?

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>       }


