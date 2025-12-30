Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6B8EE4992
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Dec 2025 18:17:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaeHV-0001XA-Sc; Tue, 30 Dec 2025 13:17:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vaeHL-0001Ty-3H
 for qemu-arm@nongnu.org; Tue, 30 Dec 2025 13:17:12 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vaeHI-0005Qz-Hc
 for qemu-arm@nongnu.org; Tue, 30 Dec 2025 13:17:06 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so102099205e9.1
 for <qemu-arm@nongnu.org>; Tue, 30 Dec 2025 10:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767118621; x=1767723421; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xb2hTNtx/qyQ4gJeaq4ZU9TVpAEY6+uolSyyBWJ34yE=;
 b=UUCSGHGdK2q6UrBfOZr2b+POWGo6clbHBPkQ1iyCkLo5AxW2W7RLGBG4DI81VSSCgC
 jaoxdPfWY/O8hPDUCvwPgEwuFqRJlVrXQT0Zzm0SOf2xI71DivhAlTX983nQb5ADMpQ7
 JgdKTqbSLeUvmY1E0RkD9WC3RscjIBnw3rUGFcPzLXsBfBailz/FadHYtVkCNZG5KOb0
 7WonrsFqtC3Utmo6lkl+D0Xbo0h4LUob+8Pyr140QOX0IOGbFIOSv/vcubgZ84KVMdNM
 kZo/djrdQKusUV7f9WM/HsAfeAemjGVPp0QYsoo3E4vnLGKZrLlvCIRX6Bvc55Ss/yjY
 /Gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767118621; x=1767723421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xb2hTNtx/qyQ4gJeaq4ZU9TVpAEY6+uolSyyBWJ34yE=;
 b=ZvjgQrB4+Jv5vuwWCkp6ZX9PjOHBubkn2bi2rvQwRrmdNr3XPxvaghPx99uGIronkk
 Lh3tiFdwPAfUYdJ8KN0wFxmQePvGUn4Oe8pjlbHz2CqFTJkjXIhB6XLsz1FS9H13zHxj
 Y+y15jT1wwzYxvZgG9rCw80d2D9KCh9GL3jDk2gALTa/YtapmW/fyt3Ub7ZiD2lpGc1N
 f0PcFIrHJjsbP0qu9d3DsfThZlV0cLjotQH9TsBfK0mFGYkp3XZfYBftY78+cqzgrqmF
 oE3gvDb76uNwDnt6nc2F4dJRADLLiYy5El98I1P6O+1UrCN8PXvu+nrjKt17VikwSyAO
 JHdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCQmw+fXq8dnsXtrzAyh93V53U7kaEsiaZbTO2wVU7oLGsRPVVT2Vb2jSljH68F/lr57b5kCHuYw==@nongnu.org
X-Gm-Message-State: AOJu0YweThPymmpmt3uQ5t+Tc+Pj2E593qESF8U0RWHgjmw0lFRvZOqZ
 j5SVHzLBKMt+Ql76Q+9vzwhY/iNe/mfPqnPeCQaVVcT57W8cmdLWSsbAeZ3xAgezwBY=
X-Gm-Gg: AY/fxX4VoGhSmwn6nQwYhSjoA6gsOnWwHcg12dodsq6ZBOjb2q4ZUz5mGFkzPDs1KrV
 uGnWMUXjPp2/L+ClIZr0LUm1IYPmYFj8ccWzH/NQ2U1jz44UNsSJguLo+8pVNzKBefoRzX8isDs
 7i9eCltllw3PD/clfPnSGCW7EBsC82PfVskfPmpyHf75UVKo7+GilwNCElVvVuHfPTMVHd9aCgE
 Slq0nzAuo7AgXjl81WIGKN7SoM+KAxkkPdykxG639LPSqBjZJEILg3vglum7FyJxOPNJCzvirgQ
 dvDZGcjKSnH/MYSTx/QcxMoi39b1O3FVj3rnoNetdfkOEa3j9/d3mMDsczYf6wDJw6vxTR52sbp
 kpDs/AhTVqsMbtUNoKzvZwuMdA2qF3Z25xpMwx9S24AXB7b0084pDN85QYnbm1yVOIWFprx41xd
 xDejf6VLa122UKISZ/ls3zpZzwEgt5m+TaCEk75lcgoAOACGJ8vGcoaQ==
X-Google-Smtp-Source: AGHT+IGHTPllILcQxRrbXtzTEwz8OEU8Globhvd9nEMB89k/yFmRgMS9/deltIDvvbrhDR4iNYu7nA==
X-Received: by 2002:a05:600c:a46:b0:477:5ad9:6df1 with SMTP id
 5b1f17b1804b1-47d1956ec3bmr442657075e9.3.1767118620949; 
 Tue, 30 Dec 2025 10:17:00 -0800 (PST)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d28bede16sm197931305e9.20.2025.12.30.10.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 10:16:59 -0800 (PST)
Message-ID: <921d5fda-5670-4526-96e8-1fbb48fe6a3b@linaro.org>
Date: Tue, 30 Dec 2025 19:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] hw: Preparatory cleanups previous to remove
 DEVICE_NATIVE_ENDIAN
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, qemu-rust@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Max Filippov <jcmvbkbc@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20251224134644.85582-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251224134644.85582-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 24/12/25 14:46, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (8):
>    hw/arm/Kconfig: Have FSL_IMX6UL SoC select IMX_USBPHY
>    hw/net/opencores: Clarify MMIO read/write handlers expect 32-bit
>      access
>    hw/char/serial: Let compiler pick serial_mm_ops[] array length
>    hw/misc/pvpanic: Expose MMIO interface as little-endian
>    hw/timer/hpet: Mark implementation as being little-endian
>    hw/char/pl011: Mark implementation as being little-endian
>    rust/system: Stop exposing bogus DEVICE_NATIVE_ENDIAN symbol
>    target/hexagon: Include missing 'cpu.h' header in 'internal.h'

Series queued.


