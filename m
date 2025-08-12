Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2983DC87FCB
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 17:51:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ult9P-0007nR-7M; Tue, 12 Aug 2025 13:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ult9L-0007m2-BY
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:51:03 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ult9G-00071M-Al
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:51:02 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-24307977420so8273975ad.2
 for <qemu-arm@nongnu.org>; Tue, 12 Aug 2025 10:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755021055; x=1755625855; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n0TVrgvas1SgmCGOwnRZ4AumkWT3T/fTUtggJNzOQWM=;
 b=XA4kYK1jL335ULknMLMfe2NnDr7S6Ih2DCoi1WyBIHSK5YcBPqAhzshPyrrC7Hp8Nr
 GactDhrhfwWJnURdMKRE/BOL7MLiVjaQuxOyrT93DbdUjecLN53HXPm/c+VSX6lgmrlv
 TO+yTBAPbBKs6cEJ/w+MY/kZyIsLswY0gk6kM16exGyeXMdhezw18OwKmxnQ2B+5SSYI
 5Ke3FiWUoimYVrhCaGacSELCk4aR2uUhabbFC5/Nk1KkPDqdYa0n4YYdmNYioB6ZTCW/
 nDwf43VPVQkbOf/bmXQhsayWDJlHm+FGtWU5nEDYLAP1UIiLXHPThIP332pUADYcoybE
 ei1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755021055; x=1755625855;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n0TVrgvas1SgmCGOwnRZ4AumkWT3T/fTUtggJNzOQWM=;
 b=Q6d51Ir1XUFt1RoR6lRVNnodP2obUG9F8SFL9qZaAHoa6UQ+LF5cxKT8bAk0CU0yNK
 pKn4YntBqr/OPGii7Nmsck+I5S36ZrZt2+nyr7AduPJKRcXvcrPYVa5g91YRItcCXSXl
 vCr4DLfYiQy6faTRvZWXoxW3aVQidr+ksqSNx3/sG/PjUkaIR6p1vdQuO11vlCgzfseQ
 xXIhN9x3TON37tcram1qpMM4QGGPxiBdv5KHpwCk9f7kgo2OO009BVSdZziTu5LNVgdq
 FigUDkblgcU9ZJVXNbSOQeOUd+QGI3iI2P3GFN/J2fDaDueUim5f9k5Ha33vON8432Fy
 oFiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZlqv/t6Ah8nnjOxXSoKktCO2NNw3Bx5kyTxcLm8hshZ/Ew5s+sRdkBSehUm/76NMrv9lCh1PIyw==@nongnu.org
X-Gm-Message-State: AOJu0YwShMmbPcSwLJaw8tmled/JZk8w3nEDQKdb7YTikm17KHoVYcUH
 jMyMC+FDqEKJt8gb6TJV5B6UEAyRiE9Ae5nuSDZ3DIo/w6KIQTn+itLLNmKZA2wp6UM=
X-Gm-Gg: ASbGnctNnpL40cVPgwMHkiXZsIon98aMhFaM36457IPK/W8vxpENLev9rt1/9ZKcTXK
 TXQWvPIGd4vd5QE4A2yzMFmvta0dWcoliYf1M4PLRSv/OBATAP0KsXLjwPJ7PyFRaF83PrErehZ
 nog9Xrn5lKalI+K/WBO4qYt8J9NEnjESToe40X1y+3NdNCX6PTAeBUSYzlBD4nPy889IouG5kVC
 lkNRkUU2ceKUGHVDkcCn5f1FB4bgbFw1ag0uaYrZw7pOp+5F7IcPQD37j2s+uLFAkV+eJT/Q6FZ
 hRlZnoX4GcRiCUt5Rt2LM3s5LWPwkERTlKKScvPzpI4P2VZRwvLjA+pEdPPTugDNq3LkGE0c9tV
 +Xx+PWG1tHqRqH9gTl5Nzcf+x1Ywr52USQ2E=
X-Google-Smtp-Source: AGHT+IEn+qdVb4ytVYHQ8vl3dj8L06K8nGqkBvh3x+XdGDlFFDXkQn4QFkBnX1WI4IdcNVv+L/k9FA==
X-Received: by 2002:a17:902:e542:b0:240:2bb6:d4ae with SMTP id
 d9443c01a7336-2430d1a1154mr837025ad.30.1755021055210; 
 Tue, 12 Aug 2025 10:50:55 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef8204sm305776035ad.34.2025.08.12.10.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 10:50:54 -0700 (PDT)
Message-ID: <49d2568d-8f15-4cc5-8295-b02540890be9@linaro.org>
Date: Tue, 12 Aug 2025 10:50:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/11] hw/arm/smmuv3: Add initial support for Secure State
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Tao Tang <tangtao1634@phytium.com.cn>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chen Baozi <chenbaozi@phytium.com.cn>, smostafa@google.com,
 jean-philippe@linaro.org
References: <20250806151134.365755-1-tangtao1634@phytium.com.cn>
 <d4fcf3a2-6789-4926-882e-1abac4c07843@linaro.org>
 <2169e4b1-97d1-43c9-a512-5e6e25a562ad@phytium.com.cn>
 <805a9a58-df34-4a0c-8613-1c7f22310170@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <805a9a58-df34-4a0c-8613-1c7f22310170@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 8/11/25 3:26 AM, Philippe Mathieu-Daudé wrote:
> On 10/8/25 18:11, Tao Tang wrote:
>>
>> On 2025/8/7 05:28, Pierrick Bouvier wrote:
>>> On 8/6/25 8:11 AM, Tao Tang wrote:
> 
> 
>>>> Secure Translation Path: Since the TF-A SMMUv3 Test Engine does not
>>>> support QEMU, and no secure device assignment feature exists yet, I
>>>> created a custom platform device to test the secure translation flow.
>>>> To trigger the translation logic, I initiated MMIO writes to this
>>>> device from within Hafnium. The device's MMIO callback handler then
>>>> performed DMA accesses via its IOMMU region, exercising the secure
>>>> translation path. While SMMUv3 is typically used for PCIe on
>>>> physical SoCs, the architecture allows its use with platform devices
>>>> via a stream-id binding in the device tree. The test harness
>>>> required some non-standard modifications to decouple the SMMU from
>>>> its tight integration with PCIe. The code for this test device is
>>>> available for review at [3]. README.md with detailed instructions is
>>>> also provided.
>>>>
>>>
>>> I am not sure about the current policy in QEMU for test oriented
>>> devices, but it would be really useful to have something similar
>>> upstream (Note: it's out of the scope of this series).
>>> One challenge working with SMMU emulation is that reproducing setups
>>> and triggering specific code paths is hard to achieve, due to the
>>> indirect use of SMMU feature (through DMA) and the complex software
>>> stack usually involved.
>>> Having something upstream available to work on SMMU emulation, at
>>> least on device side, would be a great addition.
>>>
>>> Eric, Peter, is this something that would be acceptable to merge?
> 
> 
> This shouldn't be an issue, we already have some:
> 
> $ git ls-files|fgrep testdev
> chardev/testdev.c
> docs/specs/pci-testdev.rst
> hw/hyperv/hyperv_testdev.c
> hw/misc/pc-testdev.c
> hw/misc/pci-testdev.c
> hw/tricore/tricore_testdevice.c
> 

Looks good indeed, and we have the TEST_DEVICES category for that.

> 
>> Looking ahead, my plan is to refactor the smmuv3-test platform device.
>> The goal is to make it self-contained within QEMU, removing the current
>> dependency on Hafnium to trigger its operations. I plan to submit this
>> as a separate RFC patch series in the next few days.
> 


