Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CBFCFD317
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Nov 2025 12:27:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNVU1-0005eC-AE; Mon, 24 Nov 2025 07:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNVSB-0004C9-Tn
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:14:07 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vNVS8-00023P-Ic
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:13:59 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-429c7869704so3542793f8f.2
 for <qemu-arm@nongnu.org>; Mon, 24 Nov 2025 04:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763986418; x=1764591218; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3ZRVkQe6ilkOsEr1CXYcqPV7oTc8hFPfQ5cblOBGK/c=;
 b=OHr3T1E1OM7rXOrHx7ct1I/9LKWMF0t6aCMq5x4grIiI2/luvEU8bG04pUJuv588xO
 DFXzlygOTfxbfIjezjee6mz3u5gi2TGJh2CkVqL7F4YWSloKf7Na67CEYVLWMkfECZun
 8qKYii5tei5kPoE2DrnPb4cIILDUHiyvkb5tuukllTuRaW/i8lAFqLGK3UqfDtNb1rVM
 A43uBTWC9Ngt7g9U2hQI6ronUHYcsOmcX3kIasuUXtTizPIGM1MGaJ1GnKutRZhlniPk
 pFLKCSF/Mm0sl7J1ND6/FPmIR2UnV5dUFv028OABTTrD5cWr8GalKZRl3H9zfBo+xHI3
 x/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763986418; x=1764591218;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ZRVkQe6ilkOsEr1CXYcqPV7oTc8hFPfQ5cblOBGK/c=;
 b=oGJ/W8KYI3Eog3jYRGh9XomhedKuj/nxzVcWkxWn77W2YOoIoJ37iSkG9G2hK3k18i
 cd0PTbJiCbiOXy69TXIGMCLRKaiTPXK+paDV8Myrm2hhY/JWDgpRFJ/0mKQOWPbYXaL5
 vCHXksnCh8Z6NljREUrqZGpK30HfnJNPMDD+MhDOHYShHSIG89sv9rzjm7AVddUrR++E
 T0Kaj4+MmkabSYA+r/NsWzjUYGR+D7Og6ibZThAXLIk82wCEhCNdOuX9AQyONMUccBS5
 stjM9EN5BUXV64Njuczz9HB7MnT1I3yVU7a3BFWOteOzwl78PShHQ/XuoTQ5s8BAu6Lg
 zZxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrZOf2Lq2r7v95ywNh9UZh5Nrda8fbbdEDSVEvKsHA58WyiY9g4mwODr/ydBV8+5W19Ut4PrEusg==@nongnu.org
X-Gm-Message-State: AOJu0YzqTamc2fi6bLhk/ih4kYw5VcQTdFvU5ZWpJ36oNxeXKjtvVSM5
 QdVlN7+qvCdKeg0MOKeG4SCNY0CsNL6jTL7yTOiMobzm9DJHFVkOP4BUAWUskRro+GQ=
X-Gm-Gg: ASbGnctLlpOmbP/mMiRRO0R80hMMTiZJyC5lQLVfklZNLwcNXjQmSV41tY2AiwCRN2s
 BQ3z0WCqVXIsWwrAZA+zNYUbsUdCJkN6xJEpuEup4GXrrkTkT25ylQlpVAGg4FpJAyWjJ/cLqwm
 BiNBZ9+dTR5HT5QxsKZy6Jy1BnrFQLyB2KU3NypTFjctVoxya/9DUIm7s9kYtlL6qCDNZyeAfrp
 oZSP4L8WRrmJa+9icrh/Zo4fVr4qmKCgIQcvOiP3AvgcbaqXqDp8805q5lSxSoShg0WrCizj4zR
 fO2LK2PekBE/qkC4MsQXZnzRJ7ZlreJiuifMZT2WHZugxhKTqZp8RvUUOddpenN5uMnkM1VEigj
 SmNrNd5bXb/u0TYbOMZnSHFY/jMPfEZhHS2K1h2NXVdY967Cu+fzUDjN3/TjyyTRKkhe5b0PTB7
 X5Rx0YcUbshsPbYE0WoacMVkS18to5zeAuq+31SBbx1EQWjM4JYkt3fA==
X-Google-Smtp-Source: AGHT+IGgAjoYiegnohNMZGEuTlFRGqrx0uu3B5zuzQmKFlPK5MfZDxiLUXpOi/PkzY68TA1eHQD0ug==
X-Received: by 2002:a05:6000:26cc:b0:42b:3c8d:1936 with SMTP id
 ffacd0b85a97d-42cc1cf4f69mr10368528f8f.26.1763986418219; 
 Mon, 24 Nov 2025 04:13:38 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f34ffesm28846052f8f.10.2025.11.24.04.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:13:37 -0800 (PST)
Message-ID: <ab955a8e-e96f-4071-a956-3eb7389c151c@linaro.org>
Date: Mon, 24 Nov 2025 13:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] Add support for zboot images compressed with zstd
Content-Language: en-US
To: Daan De Meyer <daan.j.demeyer@gmail.com>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20251011081553.4065883-1-daan.j.demeyer@gmail.com>
 <20251011081553.4065883-4-daan.j.demeyer@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251011081553.4065883-4-daan.j.demeyer@gmail.com>
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

On 11/10/25 10:15, Daan De Meyer wrote:
> Signed-off-by: Daan De Meyer <daan.j.demeyer@gmail.com>
> ---
>   hw/core/loader.c | 30 +++++++++++++++++++++---------
>   1 file changed, 21 insertions(+), 9 deletions(-)


> @@ -899,7 +896,22 @@ ssize_t unpack_efi_zboot_image(uint8_t **buffer, ssize_t *size)
>       }
>   
>       data = g_malloc(LOAD_IMAGE_MAX_DECOMPRESSED_BYTES);
> -    bytes = gunzip(data, LOAD_IMAGE_MAX_DECOMPRESSED_BYTES, *buffer + ploff, plsize);
> +
> +    if (strcmp(header->compression_type, "gzip") == 0) {
> +        bytes = gunzip(data, LOAD_IMAGE_MAX_DECOMPRESSED_BYTES, *buffer + ploff, plsize);
> +#ifdef CONFIG_ZSTD
> +    } else if (strcmp(header->compression_type, "zstd") == 0) {
> +        size_t ret = ZSTD_decompress(data, LOAD_IMAGE_MAX_DECOMPRESSED_BYTES, *buffer + ploff, plsize);

(here I'd re-use a shorter local variable instead of this def)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


