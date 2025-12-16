Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E423D5B87B
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Dec 2025 00:13:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVIgO-000428-Kg; Mon, 15 Dec 2025 19:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVIgM-00041m-GJ
 for qemu-arm@nongnu.org; Mon, 15 Dec 2025 19:12:50 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVIgK-00065P-R0
 for qemu-arm@nongnu.org; Mon, 15 Dec 2025 19:12:50 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2a0d6f647e2so27200235ad.1
 for <qemu-arm@nongnu.org>; Mon, 15 Dec 2025 16:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765843966; x=1766448766; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GU4SAkcunlzsRFVBrhsYDXaaTWCcBzS0XdyQgsSIQv0=;
 b=rojxIIYoYBdA7XL8i/iCu/d6sbhF1DI128qZaGuabChSzfDW6sPeSDKldBYexSqitM
 ZH847SYnFgBB9yYWyzAx+cSkN9QXKTVBWQXR8nRzeln2ypHvagR6JVK8ZjqZMOk3mRpp
 Rced2ohl6qDiZP/RQgEghgXoks88yOxOcs/CIPKmDQU0j2ljnQ0NgAsY+cMHQ0980pUS
 4vfp2D8UkOvxOaHdgVHyJeKpK5uXhPzujkNmcEC+RgjoGzZVyJ0DyiVFZkKr1b0noyx9
 vmg0Mv8kG92Lpr1zAp97oWXypSrX4JMnli2ifHZ7F0rSJhU4EFEX7NEAaDJhI8PNPUQx
 ESJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765843966; x=1766448766;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GU4SAkcunlzsRFVBrhsYDXaaTWCcBzS0XdyQgsSIQv0=;
 b=wGg3oVokEpcuK9WKddNPmfqD7nmNczy3XR+Pso6SBGH/Efrd1WvOKvyOZKIOy8DNHb
 h81CyWLQlnUDkR5ivPd+H1XTHCk7AOx1ew9ByuauLv3YCb8zMr78OTwGF0vjemv2/69Q
 Ee7GzdQE5RfHj2AT3kPDVYfYWtvFjkyNeyU8rI/kUux2PIMQkX0REGAMAiXR6vwKWVwG
 6j5R+//QO+uWcwRjTB+8Rr5k0TwzBfjTWUvlstAXpfY0hEx/6E4Z0K8g99+wDuFsbuPb
 h2kTiSzrkGtcasQQajZCas23+VfbTlbkn3w+R36DrSOD05Dh9QAkazt/JJDEejJjfI9m
 Bm+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvKzUSvv5QYasRvana5UXWjeiKH92d2uWyhbaN61k5U1J4d8PtjnsohCoLtn2yGVHzwAyWE3XVnQ==@nongnu.org
X-Gm-Message-State: AOJu0YwzB1peAsZMm3S92ohUSh+2gO6UkgcaNKZNyNj41PQeB4c5BL0j
 3eYM+yYZ6lz8U9s2iozADKv80V57bhwyTvJMXnrhnGbPGqCy41efuiblKLP7W21IFWM=
X-Gm-Gg: AY/fxX66X1QnclxIDBfNiVnLP4cvc7ObTSbRI3inEiS8sEXaw34uOaes8f6aM20mKoc
 WNV6FdWPhQsbDXY3ZOFiYP9uEs3NDcTsspX88tQYgSJP3LRPQBEVDjCb8DIM7zlXzIqVPahYzGA
 lB4dGN3uWhyLB7fwHjNO+nID9IbT0Ke3IFvtVlxopR7gk031olzI4nyeRiTIrIVtbUQ4sTj3I/e
 3a6qQFY0IJFr9OVusXU8IKsPv9d/UYt2Rs2cA9RDJl75Y4TtfBEKpaYPmxaKAtGhAs8g/41uuq9
 Ob2n4Ykj4Zjbm4+eMLQLnx6cKwiv6Hz76aqE92E/h40hj7MqjiKUrhaiPAxVNnl/t/4qhgq0NGg
 7r0C9FfyQNCupyfXjfDJRd09wPAqDyK+Qn0Mt0Tq9Kougjyw8a8q+akLvAT1A3+tfvROsAVG5UV
 9RkMTwEcTl4741JSISpEzcxm5p26VNI/3TRFcYwVXQEafQKvwcmk3d1pI=
X-Google-Smtp-Source: AGHT+IEUy6qVuSM/kO4vOW1anZCqsCswVHzMxc8pGPvuZtyg3WGv2pDcDrshS9J4Fw0aGig+xjDYDw==
X-Received: by 2002:a17:903:19e4:b0:2a0:c954:3bc6 with SMTP id
 d9443c01a7336-2a0c9544164mr77726835ad.22.1765843966313; 
 Mon, 15 Dec 2025 16:12:46 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a0e2318990sm48185825ad.38.2025.12.15.16.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 16:12:45 -0800 (PST)
Message-ID: <72bb831b-8cd2-480c-a144-b26865d503ea@linaro.org>
Date: Mon, 15 Dec 2025 16:12:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/smmu: add memory regions as property for an SMMU
 instance
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 tangtao1634@phytium.com.cn, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-arm@nongnu.org, Eric Auger
 <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20251211221715.2206662-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251211221715.2206662-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
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

On 12/11/25 2:17 PM, Pierrick Bouvier wrote:
> This will be used to access non-secure and secure memory. Secure support
> and Granule Protection Check (for RME) for SMMU need to access secure
> memory.
> 
> As well, it allows to remove usage of global address_space_memory,
> allowing different SMMU instances to have a specific view of memory.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/hw/arm/smmu-common.h |  4 ++++
>   hw/arm/sbsa-ref.c            | 16 ++++++++++++----
>   hw/arm/smmu-common.c         | 24 ++++++++++++++++++++++++
>   hw/arm/virt.c                | 16 +++++++++++-----
>   4 files changed, 51 insertions(+), 9 deletions(-)
>

Sent v2:
https://lore.kernel.org/qemu-devel/20251216001053.784223-1-pierrick.bouvier@linaro.org/T/#u

