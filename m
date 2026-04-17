Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94733F8E4A7
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 06:28:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDcgL-0002CP-7d; Fri, 17 Apr 2026 02:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDcgE-000222-K5
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:27:58 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDcgC-0006ri-HH
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:27:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488b8efed61so3124675e9.1
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 23:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776407271; x=1777012071; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6eXAMPHkSnLLO7oQisWGyDJxoix+hc4FH5kyYYbpwi4=;
 b=ZqnrZO8mfVTQwGIx8foSLFF0bmyseF76sKo54SUCvKbUJgvlZcOyGpB/Vn4wUIKFpJ
 BhbcEVkO4kUQRGRYoR1/yEpuV6yRQhhDb914Q1vmFjhwpKBizG48gZxSlwge/qfR9jxF
 mdSEUsZAPXBWCGIKDXjNl8/+vP5PYytcQAT4Kfu9KQKFM7FKQfiblKUVKAjRoBV1WzZv
 i0uGFlKdw8JaUimTrdOjxaw7KZCH4s7I1Ukc7MorEB6zBu63dsBix480ywP2cLZiBWLV
 Ng07p/en/Fx6dVpXXO1EiwsJNjwmoxhgGu2F89rsul7ANMVPU8RGBlbPf/KIyNMXaEqb
 EfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776407271; x=1777012071;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6eXAMPHkSnLLO7oQisWGyDJxoix+hc4FH5kyYYbpwi4=;
 b=eH+Bz6pKuHB3uV2J4zuj/8SGOjYbsF3Ntl9cUtaPS+xwmAu6hzPXmGiXQpvcTw7g3j
 jqknby2zlXlBVm+1fSHQdRfmmX6TzfE1pOAFLvb4uzfByM7vwPEYHKD85fl3sALzaTH0
 ctuPHqJaQIRGK/fOE62ezrLYifAgQ8Iid5vlmTZ+2CsDemuaIo1te0pnMxnIiSBnAsZD
 vQ5RZfbc4WTTB0XnjE9chUI8I6A8sqPd7yjPbcc17ad/r6hHRBQGikdSVTQT1D5TRz5K
 hytcwA9UjxdwfdkgpsJbcm7OqsMCogBEgCW52qHYT5sM3qglF5ghK1otVF8Gx+LTJazi
 GMTQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9uOiDgHWa/R9Z7M+y7PMBx+YNN76m6zz6/eTTHe52AeyS0ABD1T8qOiexUJL52Y7ercLbuWm7d/g==@nongnu.org
X-Gm-Message-State: AOJu0YxkJYBacx6jLZn1NUTflpxtVyNBZH1KWDvu8h+DQA8FZKe8AJO9
 Ce+wJ44kPoMgZRuoL/tlPJwBU38OcYwHmE24jYMCxvuhBmrctLBFbBhnsAKwUv5jr7I=
X-Gm-Gg: AeBDievTL2siQ790HtF1tlR5BcLxT4ij5eNwuOrWvqvksPK7/6BC+PSkICBlsMVv8ew
 mxQcsH6EPrpYVarqsglqvSjuy7PcoVCgSqyLSw8D1XnJ1C1ENz1OblOfLIb2E4PjAUNHbfQ22GY
 pV8JVA65g/AUJOF2ZpxhNawmn4s/ycRfNgIzctCZoOZTFUsCJNC62mZ386ph8pqsutWEUXn9jky
 HJ8KOMQjn50Pl0DmnWU+wDqgAD0cxXO0QIJpP8wQUHhtgcL/zDa3anOUtENnMgZ0STz/5kQ7pJa
 yDpEXb4bZoaH5CnyDJfPgi1UT4ui+pwYvL1NEm4nalxSqVMwPA0gmjtNnsFljWC+x7hN11tEd2M
 KgpkmR7C/EyjMLQcG/hx289jZBiWUhHeD5Y8dpTbbdPmTgwMa13xKz7BMCwgCk2/7s5SrwvaQQY
 5WL4zfpC4n6/RfO2c22N+ODrRiauBNT39QwBf9OHYCH2XmRjIVKbjhV8sJnjk5bsUrEQSA2W91/
 JsYmJLiF1db+YA=
X-Received: by 2002:a05:600c:c167:b0:485:3428:774c with SMTP id
 5b1f17b1804b1-488fb889336mr17424255e9.4.1776407270900; 
 Thu, 16 Apr 2026 23:27:50 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f82bbsm33042225e9.3.2026.04.16.23.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 23:27:50 -0700 (PDT)
Message-ID: <3d289236-eba5-4b94-9930-bfb0086ee66e@linaro.org>
Date: Fri, 17 Apr 2026 08:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/17] hw/usb/hcd-ehci: Implement 64-bit siTD
 descriptor addressing
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260416014928.1279360-1-jamin_lin@aspeedtech.com>
 <20260416014928.1279360-13-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260416014928.1279360-13-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 16/4/26 03:49, Jamin Lin wrote:
> EHCI supports 64-bit control data structure addressing when the
> 64-bit Addressing Capability bit in HCCPARAMS is set. In that mode,
> the CTRLDSSEGMENT register provides the upper 32 bits that are
> concatenated with 32-bit link pointer values to form full 64-bit
> descriptor addresses (EHCI 1.0, section 2.3.5 and Appendix B).
> 
> siTD link pointers are stored as 32-bit values and must be expanded
> to full 64-bit descriptor addresses when 64-bit mode is enabled.
> Update the siTD traversal path to use ehci_get_desc_addr() when
> following link pointers.
> 
> Appendix B also defines high dword fields for siTD buffer pointers.
> Add bufptr_hi[] fields to EHCIsitd and use ehci_get_buf_addr() to
> construct full 64-bit buffer addresses from bufptr[] and bufptr_hi[]
> when processing split isochronous transfers. This allows buffers
> above 4GB to be handled correctly.
> 
> When 64-bit capability is disabled, descriptor and buffer addresses
> remain 32-bit and existing behaviour is unchanged.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/usb/hcd-ehci.h | 1 +
>   hw/usb/hcd-ehci.c | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
> index af8c080c60..6406f536e8 100644
> --- a/hw/usb/hcd-ehci.h
> +++ b/hw/usb/hcd-ehci.h
> @@ -109,6 +109,7 @@ typedef struct EHCIsitd {
>   #define SITD_BUFPTR_TCNT_MASK         0x00000007
>   
>       uint32_t backptr;                 /* Standard next link pointer */
> +    uint32_t bufptr_hi[2];

Not used?

>   } EHCIsitd;
>   
>   /*
> diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> index 3db1c25e4d..e1d5ecbad7 100644
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -1791,7 +1791,7 @@ static int ehci_state_fetchsitd(EHCIState *ehci, int async)
>           warn_report("Skipping active siTD");
>       }
>   
> -    ehci_set_fetch_addr(ehci, async, sitd.next);
> +    ehci_set_fetch_addr(ehci, async, ehci_get_desc_addr(ehci, sitd.next));
>       ehci_set_state(ehci, async, EST_FETCHENTRY);
>       return 1;
>   }


