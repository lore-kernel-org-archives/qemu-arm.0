Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B88CD4F3D
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 06:39:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPx44-00081N-UX; Thu, 21 May 2026 02:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPx3w-0007pI-FS
 for qemu-arm@nongnu.org; Thu, 21 May 2026 02:39:21 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPx3u-0004xz-I0
 for qemu-arm@nongnu.org; Thu, 21 May 2026 02:39:20 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5a8f9841616so4788651e87.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 23:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779345555; x=1779950355; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=711XTc+nYu882xY9Nq/q9sOvZjr17jp2oAtXi70W0VM=;
 b=BQ4DVh3PstVhREZztc2t0jAZnIQbHVOa/XfwKbrSnAhOb37GbsZ3WRcwTuIW73e0WT
 9hvj5KfKtNtIlRhPHjKS7nKaoJH9tww+SO52iwkkOBM2LMSnEG5qmKODFhrWnWwOSSMx
 /seon2Msmy6CT+hOc6MqLQeEZs9sEwGMEf4DW0lp9nXNQvMJW96iNjkKEMiSH3QqzT5Z
 C8pDfw6L4MYr75a+81mzttGKTQdPY4uCUDM1vi/Gzerj3l7i7pFr1d9qv9q5DnKCGSc2
 Jif8p8y76QbX2DFvvaRgqgwfpOJ8H9VMTEP3ufl2aIGplZ0PTQN87mYLEtUelkZFNxBQ
 BxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779345555; x=1779950355;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=711XTc+nYu882xY9Nq/q9sOvZjr17jp2oAtXi70W0VM=;
 b=KC2Avl/SD/L/x0tU544xS/WEe3gFBjflSovZ1kIgWSNSuhpxjZvxzT8VWd146BuISA
 Vs9ever26v4f8S20tdT1ZBUhySERR8GYZIHtq7f8iX72Oc+JvkiqKqE/a8LuK9672kK0
 Yt4oJsdsFdm6tCBez+oimhUQzksesKNR/VVWjgpUxOwwpmBNjYBGXkGiSVJcyxU3ns/R
 Zg9FswoP79+wlH/IDl17UllOyRIUY/CM3WrK/9J6H1TBZzF9TxjxYSq7r431AvWMqSfy
 96SqvdJrQewArkLDQJ9NU32zIJB4Sngd6z/UNkys0c0fG2JG5D/OkQ0NcWkcXeGZcoEZ
 ke2w==
X-Gm-Message-State: AOJu0YzK4H605/MieBsMBBVQtCILmAbUjmry1qol98GupE5kh1DzTfvK
 7b69u2yf58aB9ucWX5S9rBc1EDyXu2zl8pw3imqQRr7YUyrzZyuaF8ibUpt7i36/uXOxgtRPsLb
 iWwoO2gk=
X-Gm-Gg: Acq92OFPy3i+DB+sA3ivyPjyvVbitZoDrfCf7jsPU612xvUl5QqYNvd+4axFHkvAa2W
 BuYrHj+KUK2LbBHYwNdd9a25Fz+2zu583Tu7oA0iipZKQI20NYuZj6W9rP875qivLkw134mHd3Y
 w9AiYo4Q6Ckakh0vFttqWItjsBfbhAqoyT5PwMGSzK9wMQjUtw7Zx6uz9hQbvU13dMJrmkAJsCD
 higP9dq1wZgNggqbWPDEPw1Ome1UQKIwDummHu27wsrkK92QrPhsXRlklx+BepDVIJdu2KVED7l
 0EUjBejCQGT+dp/78UTAoFcO2pRF0g2TGc6q5y3SKD3zoYrVF7hw0NJm+M8uNtDZMN28Z+YcIP+
 nE1ZWGtcj81J2qMfVOA7Qj12t6HsATfzjrVBSGQQq/MSxIO5GrusFgu8TLzULtigi9M9xw45CO9
 HheqtbcjBIxqSeUuNa2bPubAULRfNlCT5fi3GyotBdB+qe5DF0zpMh/oxnUVbeI989RbSWzaFav
 zBS
X-Received: by 2002:a05:600c:1f8d:b0:488:936a:6220 with SMTP id
 5b1f17b1804b1-4903607cc18mr17057915e9.21.1779344831290; 
 Wed, 20 May 2026 23:27:11 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4903c995f13sm2520205e9.3.2026.05.20.23.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 23:27:10 -0700 (PDT)
Message-ID: <88d5e3d0-8c77-4e17-b51e-65737771696e@linaro.org>
Date: Thu, 21 May 2026 08:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/18] single-binary: Make hw/arm/ common
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260519144553.91483-1-philmd@linaro.org>
In-Reply-To: <20260519144553.91483-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x129.google.com
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

On 19/5/26 16:45, Philippe Mathieu-Daudé wrote:
> Series fully reviewed.


> Matthew Penney (1):
>    tests/qtest: fix discarded const qualifier warning

The first patch is now committed as e68da5b7a2cd8f46; hopefully
this series still applies correctly, otherwise I can respin.

> Philippe Mathieu-Daudé (17):
>    hw/arm/raspi: Initialize 64-bit CPU types during DeviceRealize()
>    hw/arm/raspi: Build objects once
>    hw/arm/aspeed: Do not realize 64-bit CPU types under QTest
>    hw/arm/aspeed: Build objects once
>    hw/arm/meson: Remove now unused arm_ss[] source set
>    target/arm: Introduce common system/user meson source set
>    target/arm: Build gdbstub64.o as common object
>    target/arm: Build cpu64.o as common object
>    target/arm: Extract common code related to 'max' CPU
>    target/arm: Use make_ccsidr(LEGACY) in 32 bit 'max' CPU type
>    target/arm: Implement DBGDEVID* registers in max AArch32 CPU
>    target/arm: Only set %kvm_target when KVM is enabled
>    target/arm: Factor aarch64_aa32_a57_init() out
>    target/arm: Re-use common aarch64_aa32_a57_init() helper
>    target/arm: Define 'max' CPU type in cpu-max.c
>    target/arm: Build cpu32-system.o as common object
>    target/arm: Build cpu-max.c once


