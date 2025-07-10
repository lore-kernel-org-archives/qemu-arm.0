Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB02C83F1A
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 08:12:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZmNu-0004zZ-3a; Thu, 10 Jul 2025 04:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZmNs-0004yV-P7
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 04:12:00 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZmNq-0006L4-PX
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 04:12:00 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-711a3dda147so8148787b3.2
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 01:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752135116; x=1752739916; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2s/Zqafw8AcoBzgRuZ54ScgDx0pAEPd4KULnehzKxBg=;
 b=E7M7mvRq+Dw0H+3zISFaE0lH2DDj9wIL/E4gyxU/cmzllF0SA4RcvQaYwF8N4/muyB
 BDr1xVSOyIsHieqfm2q1smheqJDyHwYao/xvFE3oBP64YihhSN41abKi5X7cr8SJq0t/
 DpmUVD76T3TjLq8yAkGarlNIswiYazZAoI9GVlt6UbUxnNh/JWGKREDC/eDZMdAjg+1K
 WL02+8ttMyN45hwjsoVoKurkAL1X8mn084g1aXp0QHPtqPQGvZ3Msg7rjvIqTl/E3Pwr
 0BZwVr+ip46Z0/WlOuc1jV/P19bjLaC/a1Sk+63F/E+JE5MevL7yQy/AGItu51PtWEbr
 yswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752135116; x=1752739916;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2s/Zqafw8AcoBzgRuZ54ScgDx0pAEPd4KULnehzKxBg=;
 b=jxyTmmV610ct10cVsup6YKWOx96pA1M90vfNjK2UBxJLpUOryl3ag5IYhCUVYne9AY
 28RNH7lYKp8tk5vM6uK3XWlVICOQWTMbNmPSSrRyWR8r9ViYkw+1yuQxMmzvJGN9Uo5y
 rOD3014nZlGi/cVaRkC0cbd6FrJrDMkecwy749ZoK4hMjKaoQ5xAcoj6EXNwho+W1QI+
 wKD0A4NVCNSBFUkHx3Ou7nqdxwErGY6o/ND/qcSW7AB2tnB8AYV5tVALI2LUX6b7CxO6
 uDseyaJ6A/Kfj33swWzb++JeMFcKw2+wkl+7n8DcROYM2qJTATK7Oe/yOD4UVy7Ffc82
 vOtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1oo21ukV7mpPiDHbi+atkbk19CLX6giOxZzOWn01svAUyW/uXD7/Pcjc4Fj3oIH6Poei6/WQ3Sg==@nongnu.org
X-Gm-Message-State: AOJu0YzRxPTFKkxq3tW7q+6nYWdiZtXo/R6OuykB7ZQPgNV8qAkb+t0O
 Rg0uaoENodyMH5LvIHFEfVI81LyyoGJ6xXc1fV117i7ci3+jDW068dxo2teZbI9NC18Ob+fed9z
 I4zBnMlLt6r3Tkfs1bqxC0UR6uP/WoveXbpeAvBmRu51konDuoPNN
X-Gm-Gg: ASbGnctC0d96mqy82zEGKlHmaPnloJU0YTMG87m7P4Yvv3tL9aBmegXBDiiIO1ZzIDm
 LIBR/PSBaGiqSEvcUMVh0EZz7hoppckVKS7DZEJ3lM77mdh6D/LHuAFoBIt0w3CtbkUZh5GZotL
 HVP1bzmo1m5eLIVCQSOhaRO4swNpdCm9iCUbxf+M67v5J7
X-Google-Smtp-Source: AGHT+IFP+d3kfFlfXU34Hul8KsHFBVCuvpuCpVKWMgez/2tubk87UqxG1pqPRadEPQ4pauRTaUj/kTpukXVQAtDyNlU=
X-Received: by 2002:a05:690c:87:b0:70d:ecdd:9bd1 with SMTP id
 00721157ae682-717b198ef8emr84285357b3.24.1752135116592; Thu, 10 Jul 2025
 01:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250703104110.992379-1-Jonathan.Cameron@huawei.com>
In-Reply-To: <20250703104110.992379-1-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jul 2025 09:11:44 +0100
X-Gm-Features: Ac12FXwPnQQnWUTVs71FmnCoarOVLcrYujDLpcY0gASudkRZRuyeu7_DF9hc4Qg
Message-ID: <CAFEAcA9gDM87t0RXWPdu5bi1WxcMcpRiYEcnqjzhdUiys=E0gA@mail.gmail.com>
Subject: Re: [PATCH qemu v17 0/5] arm/virt: CXL support via pxb_cxl
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>, 
 Eric Auger <eric.auger@redhat.com>, mst@redhat.com,
 Zhijian Li <lizhijian@fujitsu.com>, 
 Itaru Kitayama <itaru.kitayama@linux.dev>, linuxarm@huawei.com,
 linux-cxl@vger.kernel.org, 
 qemu-arm@nongnu.org, Yuquan Wang <wangyuquan1236@phytium.com.cn>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Thu, 3 Jul 2025 at 11:41, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> v17: Thanks to Eric for review
> - Add a comment to the high memory map to reduce the chance of nasty
>   surprises in the future as similar to device_memory, the CXL
>   Fixed Memory Windows are of variable size as so can't be represented
>   by explicit entries in the map.
> - Updated a couple of patch descriptions to provide answers to questions
>   Eric raised.
>



Applied to target-arm.next, thanks.

-- PMM

