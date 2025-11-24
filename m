Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA176CFA466
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Nov 2025 12:30:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNVRT-0003sS-NG; Mon, 24 Nov 2025 07:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNVQy-0003Ty-WC
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:12:45 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNVQx-0001pz-DT
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:12:44 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so27208995e9.0
 for <qemu-arm@nongnu.org>; Mon, 24 Nov 2025 04:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763986362; x=1764591162; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GAahkJUUr13idApsrji8MqjFyOarSXxW6Th5dit+urE=;
 b=MNss/qDOt+E58VVlOGrkw+wjxc/Yb6yaQ9fHQW/k9Np73UDPzYPUHexr+WBpFEZ/Jn
 AdslJJlcAtPqirRN5fd96hCA6YQoM6MlacPskv+jzqgJv+u1CU0E+gd1Q8vs53oSoPSf
 kqlAkoQLJQFD0GqjN2VwYWV9Sd8WmlgbTrjhOz6ed3hVTJAM2MfRWVO0SC1ajn6GXFiT
 oVVorfxokJ5uS0WEokPYh+9uZctZKmLR5a9uJMeioodW2eM5GCcvFgwgvu6lcScusy2u
 XBqITKQW4P3fYKk2iGv6d778QlFgabTPVNLmis87LCeYigEW9JVnWNUSTFoTNZZtsswl
 08Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763986362; x=1764591162;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GAahkJUUr13idApsrji8MqjFyOarSXxW6Th5dit+urE=;
 b=EPt+qer0RT0TQxHWc7PcSZKMqFRi4040oTeHQiS5XEesHYQocsbCOmwFGYPmvudLE3
 aYFaNf9NfguCo/l+LmTtp/MbdRKAKh/krg8EaibgXL7sDEySw+lGo8C4NAZAHSG6rsJz
 3fJJ9Puh8VnwVTRvWbIpxBxG1D4zQT5VwJArK1s7YjbWg+UaCSpHWR0Dyvtf7X/MFkU4
 5z3xCxJQdffYHTEFAyO4tF5rn+yYgfqucNyN/S6UUCHGzKVOS3TlwQZRLeJa/V7scajV
 yvnCHZ1P5mxMJ0U9eq49rWpjSqazCjgZR0Y7UYzBDbYM3lLYNh0qijgiwwVr0Ifx12pT
 gguA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNB4gKGjHlki/kLVOmlj3sj290r5NOnJ4HIYCOZ9YiQvDLiJR6ppIJbv1MX4Pw2Tu5YMd9pNoixw==@nongnu.org
X-Gm-Message-State: AOJu0YxYgA9MP0fwslLV2hJrboabFgGhf/DIH+7YWZZxdSZrL1kbhSHY
 rxE6No1xkipB52T8QmBp5PeryUEOQudelHwmDKcyEr3ak5G4YO0ipovYAakgVyKKClskqAQcR87
 uh/xA6I/rmQ==
X-Gm-Gg: ASbGncukCKJCHPmw9moFY2wVwnGLP2nVBO1EzKMt9Lv6d7v2bBgW34eNP9kubleKHNF
 YAUMff+MIpgsa585wC45/iVuEI49EJQSEeW+opKMLoXFQt3Ro9RhwMUdeP4JZxw96IsUoxu46+L
 uc/y7Yw+yBUsSqU5xSGX58YDJNs6/NaFhMcCIqcco026Hm3yNZt2OOgYyUI1u7m5sTfAFVCfiIX
 kiQLardcnHPOv+0+aYR45e89yvvVv/pmHsF/RxE6cFEiQe3AMA+qIK1c+PwSFFm+UUOa4wiHY/y
 6fqIg6HSeKtBpY/2wsGdrZD0Z6gW7h5Ukbp+y9lWoSvASNrTh7AoDuU9rKNBfX9Pwx0epsTNI5j
 PdoT0Mk143N6/9/J+svehAgdry3Ez10YulieHOOQXASf7vqpcplOjpB0Mzq0sHn/MbBvLIdRtqi
 G7kdgW3S+lzE0BGwmFgwQBnlgMpr3gvNp40G3uJL3pZozRvGy9ykNUjA==
X-Google-Smtp-Source: AGHT+IGCuuh5MxYeyTa8fAkuX3uTgaUeAdaBnJlse1+kr0rABmGAVQpNcPI+/8zgfTlpGZNptvyfhQ==
X-Received: by 2002:a05:600c:1909:b0:477:7b16:5f9f with SMTP id
 5b1f17b1804b1-477c11337e0mr117832625e9.31.1763986361728; 
 Mon, 24 Nov 2025 04:12:41 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf35f976sm198059095e9.4.2025.11.24.04.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:12:40 -0800 (PST)
Message-ID: <76090cc4-fb02-4896-b00c-ac0c30585316@linaro.org>
Date: Mon, 24 Nov 2025 13:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] Rename LOAD_IMAGE_MAX_GUNZIP_BYTES to
 LOAD_IMAGE_MAX_DECOMPRESSED_BYTES
Content-Language: en-US
To: Daan De Meyer <daan.j.demeyer@gmail.com>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20251011081553.4065883-1-daan.j.demeyer@gmail.com>
 <20251011081553.4065883-2-daan.j.demeyer@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251011081553.4065883-2-daan.j.demeyer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 11/10/25 10:15, Daan De Meyer wrote:
> Preparation for adding support for zstd compressed efi zboot kernel
> images.
> 
> Signed-off-by: Daan De Meyer <daan.j.demeyer@gmail.com>
> ---
>   hw/arm/boot.c       | 2 +-
>   hw/core/loader.c    | 8 ++++----
>   hw/nvram/fw_cfg.c   | 2 +-
>   include/hw/loader.h | 2 +-
>   4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index e77d8679d8..c0dec0343a 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -826,7 +826,7 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
>       ssize_t size;
>   
>       /* On aarch64, it's the bootloader's job to uncompress the kernel. */
> -    size = load_image_gzipped_buffer(filename, LOAD_IMAGE_MAX_GUNZIP_BYTES,
> +    size = load_image_gzipped_buffer(filename, LOAD_IMAGE_MAX_DECOMPRESSED_BYTES,
>                                        &buffer);
>   
>       if (size < 0) {
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 477661a025..42edcf2d98 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -796,8 +796,8 @@ ssize_t load_image_gzipped_buffer(const char *filename, uint64_t max_sz,
>           goto out;
>       }
>   
> -    if (max_sz > LOAD_IMAGE_MAX_GUNZIP_BYTES) {
> -        max_sz = LOAD_IMAGE_MAX_GUNZIP_BYTES;
> +    if (max_sz > LOAD_IMAGE_MAX_DECOMPRESSED_BYTES) {
> +        max_sz = LOAD_IMAGE_MAX_DECOMPRESSED_BYTES;
>       }
>   
>       data = g_malloc(max_sz);
> @@ -898,8 +898,8 @@ ssize_t unpack_efi_zboot_image(uint8_t **buffer, ssize_t *size)
>           return -1;
>       }
>   
> -    data = g_malloc(LOAD_IMAGE_MAX_GUNZIP_BYTES);
> -    bytes = gunzip(data, LOAD_IMAGE_MAX_GUNZIP_BYTES, *buffer + ploff, plsize);
> +    data = g_malloc(LOAD_IMAGE_MAX_DECOMPRESSED_BYTES);
> +    bytes = gunzip(data, LOAD_IMAGE_MAX_DECOMPRESSED_BYTES, *buffer + ploff, plsize);

I'd take the opportunity to introduce a size_t variable, since
patch #3 re-use this definition.

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


