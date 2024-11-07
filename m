Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4123485njc;
        Thu, 7 Nov 2024 03:02:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX+i5pQPKl5ESLHs6CcQMw5mRMUm6xmLvs43T2IKoAIHA3v/m96QJ7pihT7xwON5v8yucIikrGYvXATmQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHgqVAkKYKGktUBlYBNp/PKfcEdZ7Um/AQ/hjdlJ1NTHmklzD1qIQ+qZ8Ym3GiWpVlxmUTm
X-Received: by 2002:a05:6808:18a3:b0:3e6:b3:33ea with SMTP id 5614622812f47-3e78fcb74acmr724439b6e.14.1730977356840;
        Thu, 07 Nov 2024 03:02:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730977356; cv=none;
        d=google.com; s=arc-20240605;
        b=WhLjBnin7yz/gVEvlaNu3sXUwMrXdXkjS+z/wmICqe4lyzAxAl7AYbybu9R2DbuD6p
         Y9L4qKq4HrwuuX49R5UqZMiUUdNvfnXN+hNKNf8vPB7ldmUQfGheP0fU+XNjHFDK/l9s
         WDC+tlg8NwlgEkslbLC0sklnCqj4zbgG5sQGiTCzi8AmyNfWWwd40tSigC5dtzQa5xrJ
         JpPRjbV7TCUQ+42A6LFkaUE+0oE2STdDNIXiowZLbR+wED9RNyPacGktij2lGs+Q1gR4
         tKJhoLEw05qik0ZRwiVNarBw1hxCEiiZmF9ryG6sGPpac7+IrNgrycA4M8JmOqixQTCZ
         tHGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DDq9D1U8taeFULz8W5ddU7nLUTOFAivkmxpUM45Z04A=;
        fh=LFSibL5J6aGwD3gtd8RvnNJAlCmLcgVpTz2OVCzrIiI=;
        b=afJbG1K+brcPNe4oPrMjKVNs2yxVjqY//kIiofZ5/3yMdhdNoQYirRMS19KgubbBQE
         g0F1Tf9ImJlFSyjq1VfTmLOTFayRsUAKByXP8tmqLu6soK71NpoUljh55absmdmMDE/k
         35Kxs7kSB5hlJrGOjScz+IFf4WjMHjLHmdQiWEEKmLVN6BQyyAUtza4sh/kNgJgpOsej
         e6WO6wkEmaQ98aLcLFmwq4Mlh+/qZF9TqSA38m9Uo2iHT83jIfHGm3cGnhlpJ12e0Ylx
         JV0k4SxSfyomMoO4xbeVvRgyWLrbERjSu6Up8QVWBRDiuveCwGmK+RmuCwZch5pqJILG
         ZTYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v1/hS8NX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-856555b52adsi154606241.90.2024.11.07.03.02.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2024 03:02:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v1/hS8NX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t90H4-0001G6-GI; Thu, 07 Nov 2024 06:02:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t90H2-0001FM-UQ
 for qemu-arm@nongnu.org; Thu, 07 Nov 2024 06:02:00 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t90H1-0000mB-A2
 for qemu-arm@nongnu.org; Thu, 07 Nov 2024 06:02:00 -0500
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso7471791fa.0
 for <qemu-arm@nongnu.org>; Thu, 07 Nov 2024 03:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730977317; x=1731582117; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DDq9D1U8taeFULz8W5ddU7nLUTOFAivkmxpUM45Z04A=;
 b=v1/hS8NXkQTeRL2Q87/KFHBxShVEIrShLnQpMk6clc3ybcZXm81MKUXFvoxChlKSaf
 WUCYm4kHltAWoQuC+v/TN/lvWUTgmsc0uAidlOKmaFzk/MTpdmbiznJ/T7gtBvNbGOhT
 yguK6ttuBOC9stNMDGUbrGKS3V+f3/xpNc/D8G+tilT/CUZlBb7KaNBLnFf99ZITEpO9
 uHKoiOUTZGeBTzOvmARJF5wcgWLWwvtQa8Wvkdumh9FlraYxBKMtlFgSYRKvrnxIwH/K
 ZSIRhHiK9VM13l2VohpYFUs/9Urqk1Gbn/XpiHSuCim5jfawtJU5D5heSx4OuBcMzYoE
 R6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730977317; x=1731582117;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DDq9D1U8taeFULz8W5ddU7nLUTOFAivkmxpUM45Z04A=;
 b=sjuCfFCNc6xq3GvhlOqWrv0fSnRczZYFv3QAUVZjZYlkiMLwL7MHObHmG5mJaUd5my
 ho93v9gCBzLLZ1uk8JZ64YCgGkO3LqCKN+Eyfnfpx48PQ7Sjrob8deJntxSegspTmbKZ
 Fe9qzqF62sfezvFj48dUSrTa2hbpEkiS//afuszXEp9NB6kS6EvCg/UoO1+J1arbzImo
 oAOEXNuclwdjdWpfwfB0ADn1IKoUlXAlVKO7AMCePW/ujOJWFQGb3ecaGhSqtG0rIqBl
 Gkj4Ag61N7pQc/J748WmuOyWT4xwjOPm3ZR/dxGXf6PSCdXN0rVpPYJsNn0330xEUxk2
 t7Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUszO739glH4GfwPN4XjiHxrewRO4yO4X99wjTkvx2Fbgije7j2PujmwB26o9532Lj+rbH6QeyAIg==@nongnu.org
X-Gm-Message-State: AOJu0Yyryb7jlgkOBIvDsPMBmVv8aR1PXNxII2KeLmSIiRIcu5/+Cb7k
 0f5l4uShAZkfbMEXkJNur2rXwUzRltBqM7XtbdJCZseE4VHRzmgn1FHgpBe0IRs=
X-Received: by 2002:a05:651c:1b13:b0:2fa:d604:e525 with SMTP id
 38308e7fff4ca-2ff1aadd768mr6195211fa.28.1730977317218; 
 Thu, 07 Nov 2024 03:01:57 -0800 (PST)
Received: from [172.16.23.118] ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b054b34csm20140695e9.14.2024.11.07.03.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 03:01:56 -0800 (PST)
Message-ID: <4b678b54-0f1b-4b3e-8201-fb22c7cd7cd5@linaro.org>
Date: Thu, 7 Nov 2024 11:01:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] hw/ssi/xilinx_spi: Make device endianness
 configurable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, devel@lists.libvirt.org,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20241107012223.94337-1-philmd@linaro.org>
 <20241107012223.94337-9-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241107012223.94337-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x231.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 313PZZwLtiou

On 11/7/24 01:22, Philippe Mathieu-Daudé wrote:
> Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
> of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
> Add the "little-endian" property to select the device
> endianness, defaulting to little endian.
> Set the proper endianness on the single machine using the
> device.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/xlnx-zynqmp.c |  4 ++++
>   hw/ssi/xilinx_spi.c  | 29 +++++++++++++++++++++--------
>   2 files changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index ab2d50e31b..e735dbdf82 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -714,6 +714,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>       for (i = 0; i < XLNX_ZYNQMP_NUM_SPIS; i++) {
>           gchar *bus_name;
>   
> +        if (!object_property_set_bool(OBJECT(&s->spi[i])), "little-endian",
> +                                      true, errp)) {
> +            return;
> +        }

How might this ever fail?
Despite xlnx_zynqmp_realize having an errp argument, I'd be inclined to use error_abort.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
