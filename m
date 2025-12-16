Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E972D5B87B
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Dec 2025 00:15:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVIiQ-0004cv-M5; Mon, 15 Dec 2025 19:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVIiO-0004cM-Tu
 for qemu-arm@nongnu.org; Mon, 15 Dec 2025 19:14:56 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVIiL-0006Jo-OU
 for qemu-arm@nongnu.org; Mon, 15 Dec 2025 19:14:56 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2a0d5c365ceso24684145ad.3
 for <qemu-arm@nongnu.org>; Mon, 15 Dec 2025 16:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765844092; x=1766448892; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OuFEIS57RimBz1m6D5sz7mKNjCdSjMvI7LQMzNKUMOU=;
 b=V+y4LyLMTvwBZ/nTmj4bfoDwpQ9BCQdARgIncd45IOVd13afI/8MEI7FXeTEpvicyr
 wWj8T0vmxH26BwXGCuwK/hiYGN+kEFlyODTVyPzGmtb8qNOnN4SE/245+P0ADdgbzmeu
 qAI7mn8CMvvw82ENmfJYoJReKlS294gJ+PgshIdoTKsQ/A+8CdK5x/mJLdnJ2Sqysn2w
 5GxTKlMAk24hwaC705twQBNpi8itYdhOUY+jd1mLR8/TjwmFwX6MrqWchX0kN/gS5d9r
 rrFfyHcFjxxUA2eDd//xQHQBuisZs02DFWH2ZAc4GotGPxANqmh8ZCkJVINDp++SWW10
 Yt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765844092; x=1766448892;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OuFEIS57RimBz1m6D5sz7mKNjCdSjMvI7LQMzNKUMOU=;
 b=gq5qkHCES0Diip4Tzxuw+PekC2Iy2cnEYovpUobu+9yq3jszpsDytfY0gNTd59n4LE
 RmuU8PraCWKZEVanLus1sSVSfN+aDKP6v8YOLwYmaU1AvEkpsf2X0Zh7MQKez238jqmY
 faa/an21IwN9rqCtUhMGUt6VSYpbLPgH+WYPRcm11mHKqcA7b7PY0nMbV5a3XlQuq/hb
 wIif94MU7qBnXRiab4lZflQUOvdmKjoJXVym+nZEZ/IJcbjrG86668o6SAvZTIgSHqKP
 bb4EHBm56tpBytLZMFwZWfpwcv8PBa/fHgBLBC1BuC71HLD8yF1vLEvRahY6AJj7nJs5
 DTxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZDVhYHVSJ8Z7ngrEYBSEesmFs1cmYtDH/g2sgp7c8l0/P6ZB7IAiRwDUujSKhDc1K5fnvVYiC0g==@nongnu.org
X-Gm-Message-State: AOJu0YyIEPUYSDOt9YRbMmePytI5/3vAn+zoqGA6KkK514CPVVo1T3yt
 UMEAiYpyDt2jNgSMpRc7tZDPe8jQHeqz5MF2J2G34AVJwNeXU7qr5Eu0/5tXo4OsvG4=
X-Gm-Gg: AY/fxX4BrX32fzs2+ymDeupNqWksRtc9mNx7AeQOEanjJMkbwW+PbEDZCdMKomQjRou
 0Dnoh1jC6abn0JNihqsY8phQlKNSpvtii8/7GSdfpsaZ5Pu+l81d2IUEvHB/akFrVBG28zyD88H
 b8hCvLS44v7jYlaVHrlQLanXAJkExN4pMzfcZ44dGQkpsM2uBQSc1ROd3a2PWOPLrD+WBOVkzGs
 B+vL7xpRi9IuAC78YDUIMQ4fun/p8yul/GDWcKCrPNtCaxwrCNVyb1SEUcSbnxCxVolA9aJYmpj
 3Dz/K1E/kyA23N5b94puKZ94hsfqvcN+FLYlSBkCtTHSrhip5fglKNOLhSOHsY+sOa74dCFjosh
 Wo5IQx5/11z/Tdd5p4KVhFprsDrj3MeXOLNgdhTWJco8GBzISJ+f7ZOGVI45WxIM7FGnNdLKjTN
 WU0EsGMB0IVeGK4hMI50jV0wuWfGwLfbFYVU51eCvWtYfHtT1WoXVQH/E=
X-Google-Smtp-Source: AGHT+IGHNo3ZV5ywMGyqmovUCNnh4r7CoQy/Qp6sEhSiCvSp4Qbz9lRB7gwW+mAiY2i/CS+gH76MyQ==
X-Received: by 2002:a17:903:2445:b0:2a1:2ed4:ca1e with SMTP id
 d9443c01a7336-2a12ed4d1ebmr17214875ad.34.1765844092146; 
 Mon, 15 Dec 2025 16:14:52 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29f2e40765csm104702855ad.0.2025.12.15.16.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 16:14:51 -0800 (PST)
Message-ID: <7e841ef8-fa50-4ee9-9370-5cc6c23d4a5c@linaro.org>
Date: Mon, 15 Dec 2025 16:14:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/arm/smmu: add memory regions as property for an
 SMMU instance
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 tangtao1634@phytium.com.cn, Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20251216001053.784223-1-pierrick.bouvier@linaro.org>
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

v2
--

- Fix rebase on top of master
- rename memory and secure-memory address space with
   "smmu-memory-view" and "smmu-secure-memory-view".
   If someone prefers any other name, I can change it.

