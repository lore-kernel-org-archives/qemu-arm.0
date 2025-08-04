Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42BDC87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 20:58:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj2GR-0006em-47; Mon, 04 Aug 2025 16:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj2GO-0006c8-KJ
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 16:58:32 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj2GM-0000qF-WF
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 16:58:32 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-240b3335c20so29698235ad.3
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 13:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754341109; x=1754945909; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yKiDuY+L/8jppyeuNn7Gz9yXLcztaXF4YZrU9lBcODE=;
 b=h3R4sepv2nR/Q8vllMcNNrnQb0d8mkp3HRt98ub6Msl1NSi8AQ7iNcT/ExQRXgvTpL
 1Z9gtN/OgjEjv157hTjuwPjLPR4SGXfCYWd6s4MgVFuUyrPMk+4afpDr+nQNfiwHbsLd
 DZ0i6CO+WLsB6xKdRXzeqiQF/uLAvMOSXdZknqLc8YVsGK4qOopTCxNupBOF5LApGy/h
 k4+ZTQJESE9DtL7FOUcK5+UMzSGng0TB7ZLKmbCnNs2CGNvX5plh+S8KFgVdW/2TZXVC
 IST5VKHxWIcPRaDEtFz9NDRxlEXSKbJZRM81KeQ/GEIZUIZRFVFuitM1WzNEgFxoTy+E
 tWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754341109; x=1754945909;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yKiDuY+L/8jppyeuNn7Gz9yXLcztaXF4YZrU9lBcODE=;
 b=DH6lZdSPgRktphQ3ZaueuJnZ562GrddMbpQZZuopA3cA+VcHaReQ1SZiUw/nhUb1l3
 XoPZqKOuZqg7DXNrL8FgCbJp/pZNKCwXl6f93W7ri1M77T71xuE/pA1Q863tOtFuGCgl
 vyxxpL/AGRuSZIQgBXHl7sxscUqS1Cl1nECGeEMnaJGc2NpzpVFaYxXSJwdNsHtQBSE2
 jz/o+ZJ3hq/q7QVkLEHtHNNuUcDRVjvcYrYJ+x8hAQvMmcvTthOs2WsPALGzgFHQ+vXO
 rK5q0zBzI5ujgRwb3+nebIioYSS5pD5bUfu3CEFLXLL5+5YUBe7VjOa2RFqcJpfuXDiR
 rQWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQUG1ZHoZpiVBU6N94a6euN+obv1S36jmGO+o9Dy2W1keyZ9YVokz44/CXvMhnA+rzFnEzgPjWZw==@nongnu.org
X-Gm-Message-State: AOJu0YyNVOvJJXyS9cYqexN5XyOCOSjDPvMhmDGdn20PCIKRYt1CEBT8
 wCab4UhzBz4Wmue/ZUXzh4ep7vaO9+9uyKRDS2zTDtfGaE8pV6i8hZXS9yF7/9uOfMk=
X-Gm-Gg: ASbGncs5B+PV/m+r6f3bM59VKdmWJvLXAkSz/UYBQg2avHQbYw5P0N5mg9ayR4rpvZ0
 UEqoYD+YbAKuevs0FFAZ0ZHumJLje08ObSWKis29tlTs8OMJP+KPV0wGj6gmHT1QzcUuJWsSk/A
 IRSCm5K4/JPYrfXnioiZJ57CpF3FVmbdUJ0wKWK9mhYZba1JnhRb6Ewr0iZucwRdRNQPfhdhBox
 uGiKAX98bR7sfzSsCLk02FaWbtBlUCXsZlGLc6NksCjVnzGNwbt8EKrN0Nk5U0rL7dp0cQVdDxV
 Dwa/T0xFg+YSTC0Ce/lkxqO0P72e06/162zJGsYaIqIDshFdvFW+NUQ1nM1nU1+HGOA8nhC3CFx
 ClGYb7r/xzdIvxpZ5zo+ZFnD314siBKc1ejY=
X-Google-Smtp-Source: AGHT+IEW2Wf6OtAjowbxAHFPh4XzxWD94nxIz+B2CZHAOmuMgipQSPPXLiWwYJhdjtMILfXc30P83g==
X-Received: by 2002:a17:902:ecd2:b0:240:5bde:532d with SMTP id
 d9443c01a7336-24246fef0b8mr159722155ad.38.1754341108809; 
 Mon, 04 Aug 2025 13:58:28 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef671fsm118188025ad.9.2025.08.04.13.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 13:58:28 -0700 (PDT)
Message-ID: <022d68d8-a407-46b8-a46d-40c4e9b9b02d@linaro.org>
Date: Mon, 4 Aug 2025 13:58:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/17] hw/arm, accel/hvf, whpx: unify
 get_physical_address_range between WHPX and HVF
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
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
 <20250804142326.72947-15-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250804142326.72947-15-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x634.google.com
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

On 8/4/25 7:23 AM, Mohamed Mediouni wrote:
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   accel/hvf/hvf-all.c        |  7 +++++--
>   hw/arm/virt.c              | 41 ++++----------------------------------
>   include/hw/boards.h        |  4 ++--
>   include/system/hvf_int.h   |  2 ++
>   target/arm/hvf-stub.c      | 20 -------------------
>   target/arm/hvf/hvf.c       |  6 +++---
>   target/arm/hvf_arm.h       |  3 ---
>   target/arm/meson.build     |  1 -
>   target/arm/whpx/whpx-all.c |  5 +++--
>   target/i386/hvf/hvf.c      | 10 ++++++++++
>   10 files changed, 29 insertions(+), 70 deletions(-)
>   delete mode 100644 target/arm/hvf-stub.c

Good cleanup!
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


