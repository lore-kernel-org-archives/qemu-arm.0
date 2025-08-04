Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D196AC87FD1
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 22:56:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj46K-0003JD-6W; Mon, 04 Aug 2025 18:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uj46H-0003Cv-PF
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:56:13 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uj469-00009p-FX
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:56:07 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b78bca0890so3044000f8f.3
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 15:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754348164; x=1754952964; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XdpxGk4t+ozvUDgbhAGwDmnLk7TQc5J+/viJMdYyp9w=;
 b=QV/NunbewLOagGC1A+dHfjMXdexE7/5aiUIsxBiFPtsb0Q4L1R2gpBh9yJ3EJAZiIT
 V5Bg32tqCM6Dk2qHCPUHsAhItWQFlSDol/Hc4pmdu8NW3LEIvNMizHu+dfqrYsJ7wzOf
 sXKFlwLKUYqSgJOY+KTeNzAMLO6SrgAGLT8gj4L4BPiSj1zdz51IHfus9p/k4ous+GUI
 HwXZVXXYZcXwmi6+FO+bdV2g8ZCppVJWV7CD6CQcfcLwtSjGCwXgq83/iHK7Nv4uruFj
 ZNaANdlfamHe1rpeyfhCExM/AoulpXWXr5bLfC8HLFNoBqTx1m5ZKKxbYUj7wajtoU39
 npIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754348164; x=1754952964;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XdpxGk4t+ozvUDgbhAGwDmnLk7TQc5J+/viJMdYyp9w=;
 b=hYbBckxyiXDGi1pc0QzosrwTGz9DVBXcM6oIhguCM/exLb/30dA3tP3dygt4pKylcA
 nN6DOVqD3PJjc2p2idhAD69YgYZU6NUfIiiYRPh/FO3ar7kEjX0sqV4KWmI0DrRvuKo6
 F6kCD1/QTXAqYgYGLlAPHYqWuP02pft6bpGf/Ddn3+2baFhMdR+Mix1+re1veVRBnt3G
 KBmxOXRdEaYdDaWuuvht2JStygqAn4oKH/B8/PsJeQ/hwW5mICqck+ElOsQ3iYG+z/pf
 8X1rmy9qBz+THmOcNAOOGbuvqmlFcx9nZyh459X10XtIiuOF0hTmT53r+6CV7adXrakx
 OBvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfn5fUOHf3bXjvTKtAnT2edFYltDvWeVbC7nkqjiHpDc5wPYLyTphYtqDFK5uBP3BtmofgRXsF2g==@nongnu.org
X-Gm-Message-State: AOJu0YyWlqze2PdBYWesBBNxwdgJ5P0SOVfvrww9umov/ByF4gnQQ7us
 MivkK7EMY0qyBYpK/JcaLYo6xK5pklkTH6BtKrIxal5FVbWz7PF+hPERypotnVwZug0=
X-Gm-Gg: ASbGnctJ057rrG8z8rbG45kquBB4kF526m8OpPjv5RuYU15zXwwNjRKXPUlG/YUyEBc
 kE2l3uQt2K9Y2GSGhvBqfGNg0IIBar/KJpCwkWYzKSJ73J2zDRqSXk/kI2vMMZ7J3EDoTSiFo4Y
 eZrnEPSp/NxwkX7vGXrcszbxnr3bR/ewNiVZRJR+iF9AmiHjPl20reWNJEoj6pv0ZOqU8ZpOVM/
 5bnNypNjUPiCCSUsvORCwUU3yuXO6JeCJeHAos/d/19lnHlBlRc22NZhPkYQmn2d2GJbrfuKnek
 vCQT5m7fZPNZTRvdwVzQQwIvsQ2P2gZxcE0Owo5OzZEezi97k9fjDcelsjcuXLlZqlesPfBF8+0
 fjSeWM6YZcohPb9F7IiGxMKd5C6Rrsk76AOovq3uvH4sP2HGlcq5WkilkQkkVmz+6Tg==
X-Google-Smtp-Source: AGHT+IFznGq01jDCILd6ZulN37dfynflrK1XyeUG3xRI7nT0BJifc4JXD+E7p8Rnxk+wo3foCym9SA==
X-Received: by 2002:a05:6000:2a82:b0:3b8:ebfb:4592 with SMTP id
 ffacd0b85a97d-3b8ebfb45e7mr487660f8f.55.1754348163778; 
 Mon, 04 Aug 2025 15:56:03 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e0cd2c90sm12240625e9.17.2025.08.04.15.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 15:56:03 -0700 (PDT)
Message-ID: <16f2c007-8b84-4b44-b0a2-25b61c7cb3c3@linaro.org>
Date: Tue, 5 Aug 2025 00:56:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/17] whpx: copy over memory management logic from hvf
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Roman Bolshakov
 <rbolshakov@ddn.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250804142326.72947-1-mohamed@unpredictable.fr>
 <20250804142326.72947-11-mohamed@unpredictable.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250804142326.72947-11-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 4/8/25 16:23, Mohamed Mediouni wrote:
> This allows edk2 to work, although u-boot is still not functional.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   accel/whpx/whpx-common.c | 201 ++++++++++++++++++++++++++++-----------
>   1 file changed, 147 insertions(+), 54 deletions(-)
> 
> diff --git a/accel/whpx/whpx-common.c b/accel/whpx/whpx-common.c
> index 86750c304d..752a57170e 100644
> --- a/accel/whpx/whpx-common.c
> +++ b/accel/whpx/whpx-common.c
> @@ -258,89 +258,174 @@ void whpx_vcpu_kick(CPUState *cpu)
>    * Memory support.
>    */
>   
> -static void whpx_update_mapping(hwaddr start_pa, ram_addr_t size,
> -                                void *host_va, int add, int rom,
> -                                const char *name)
> + /* whpx_slot flags */
> +#define WHPX_SLOT_LOG (1 << 0)
> +typedef struct whpx_slot {
> +    uint64_t start;
> +    uint64_t size;
> +    uint8_t *mem;
> +    int slot_id;
> +    uint32_t flags;
> +    MemoryRegion *region;
> +} whpx_slot;
> +
> +typedef struct WHPXState {
> +    whpx_slot slots[32];

Please add a #define for this magic 32 value.

> +    int num_slots;
> +} WHPXState;
> +
> + WHPXState *whpx_state;
> +
> + struct mac_slot {
> +    int present;
> +    uint64_t size;
> +    uint64_t gpa_start;
> +    uint64_t gva;
> +};
> +
> +struct mac_slot mac_slots[32];
Ditto.

