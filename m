Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E7AD637B3
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Dec 2025 22:51:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVdsa-0004tc-Rh; Tue, 16 Dec 2025 17:50:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVdsZ-0004sr-GK
 for qemu-arm@nongnu.org; Tue, 16 Dec 2025 17:50:51 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVdsW-0000NV-Ic
 for qemu-arm@nongnu.org; Tue, 16 Dec 2025 17:50:51 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2a0c09bb78cso120505ad.0
 for <qemu-arm@nongnu.org>; Tue, 16 Dec 2025 14:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765925445; x=1766530245; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HrFSEXMCtN9IHtH5gK78qFKwKLLgrg3aX257v7py5T4=;
 b=bTAQShvFUyo5BG0V1aP8qRF5UbGT3ONFOqyIkHUYhY/tdn+BOqHrIIAAaQkjWyuTpI
 JwgR+R7TsDb9JA9XExrFu3z4NovB5i1l6sPEkpO2Q/VYJzimt8Cmmn09kiLgAWzmXv8c
 4zWOwbtxvbyQ2JmkPQF056Xdgqxd1tvUL4sktntKubUX8OnRpDDOVUnzb6T8v08JxxYO
 l8qDw/I7OP6828PguUq6t697MXxF8tpb2QyRP1G/Zpk65IETOOrFn49i5D1WvbzF6dfx
 UChH9uX+JM7dThqZaeBqIem1u7BVk4iP+ewHNw2F5H1eEvySBbyIxoRGrS0OLervnoLe
 PnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765925445; x=1766530245;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HrFSEXMCtN9IHtH5gK78qFKwKLLgrg3aX257v7py5T4=;
 b=FHjM67eO/72aN6DBSnhZPgsC84FUwMJ6Q/eVz9wOfbhi99JnIRSVAbEbNGIZv56ni8
 YyRqJ5RMUaLAYyFGq3e1SMbnJLaS3xobNRGW1WomUgDdfJpMKHUbS9M2yNjEzwYFy7ea
 Rh8dX3cBHsPKpnY29kQCoYBontWIe4Nm1+x9xxuDAhfNi/KgXqUbFt+BTbVB//J6H+Ml
 +LM7b00t4h5nf1FnmHDmLR8anMpRYFkiHwYjBQaOtStFOA7jwBqVwSjZ9Sg522++R7mb
 Zonie2QebMU2ALG4FdPbkA3nMjXoueXwrL6HUlW2FcvC0a2rWIRxzIhzHeLnPxg71n/h
 wXoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLECKzbVah8vBMrQbaQ1kaPXmez7+GYBiT+sedCl65pfAejqlfKY6AXnb7QbFmIXrmomOvFnIYMg==@nongnu.org
X-Gm-Message-State: AOJu0Yx6MtKZ2IaO3FgsBs6uMODXqACVr8LeUuQCdHe/htWLgHSHlCYk
 Yr6kQTmNXqEuDdGg6H49LsdeVYHQN4E8JM833OComNDowRWIalLGeibx2j8i6AIIv1I=
X-Gm-Gg: AY/fxX4ayOwuHx1hTFD6sYN3rYcVGkvh8vWMtY//ptAE97QzwrqpkIrO/A2ekPRZ2Oa
 5wO/yQ8VD6R9ihLFUvg6568JFBUvGiZ6WwaL3MI8wlvIXLGYE3/SWA1yFrQsIVAVCt1pqnJydyw
 AoKaPqg4Vch9fZ/q5zKNb4TdKoHEsGRZqHWHTLtNEFaCfAEkKyvbLQUWcBya3w2zf6eg0T/cI+p
 CkaoEmmu1+R/pgeue3JMFJ7ui8AgBYYRtcv2ZA61QoozwpPxb1/vBTgjncBDn0PkgBl3RQ8btxr
 HZbMr1yEAasfkryPuzi/qgOzFCRuXEo77Xpd3bDaLTYu1aEMvMw0P3bimj+OE2t4UoC75ZvpjS6
 VsP4oCGITmjLMoIzmY+Umc85LlgpOwWcdW3N1rqDt3x/+AObhCsdbnvk7OOfpGBPsl7IHUXHp9d
 0CWPsDX/IJSKC4BihOSvhqhrStsaD+CHMzCRQ/XL2cUxh7RXKmGn3qDCU=
X-Google-Smtp-Source: AGHT+IFkazMF2ANplMozY98aE4ccIf9yp0XEK5AdL1iTypBVmrcHEuC4X8ITn4ISbXMRaluxXA8RLg==
X-Received: by 2002:a17:902:db11:b0:295:50f5:c0e3 with SMTP id
 d9443c01a7336-29f24e6fd04mr182094245ad.14.1765925444614; 
 Tue, 16 Dec 2025 14:50:44 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29ee9d36ddcsm177245115ad.32.2025.12.16.14.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 14:50:44 -0800 (PST)
Message-ID: <84215ba7-f529-4321-890d-44c0cba855f4@linaro.org>
Date: Tue, 16 Dec 2025 14:50:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/arm/smmu: add memory regions as property for an
 SMMU instance
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 tangtao1634@phytium.com.cn, Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20251216001053.784223-1-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251216001053.784223-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x636.google.com
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

On 12/15/25 4:10 PM, Pierrick Bouvier wrote:
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
>   hw/arm/smmu-common.c         | 25 +++++++++++++++++++++++++
>   hw/arm/virt.c                | 16 +++++++++++-----
>   4 files changed, 52 insertions(+), 9 deletions(-)
Sent v3:
https://lore.kernel.org/qemu-devel/20251216224845.1673051-1-pierrick.bouvier@linaro.org/T/#u

