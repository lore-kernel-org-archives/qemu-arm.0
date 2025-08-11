Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064EFC87FDB
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 10:27:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulPkF-0004M6-Hr; Mon, 11 Aug 2025 06:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulPk6-0004Hg-NU
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 06:27:06 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulPk3-0002Qh-2U
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 06:27:02 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-459d62184c9so23965025e9.1
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 03:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754908016; x=1755512816; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bqPdk+kMHdizcmns5gJMD0d28gNsebZwX40udCNZpW4=;
 b=Eb3KGzVHLBCMgNuaKOBQnA465X8WPtakkmbfhUJXC9UyaSEmzDTVNQAUwUEHlvjncP
 uzgxVTvw5mbA7BytUBuhiGAtYDEGcCRUBC8Q28Mq0XcFqcXOYeV6ROFUpzTBnpKh5LeG
 roMcbXSQf19M8TTg9v1MSCon1B+Qt8j0Vzt5ZiRpDmw9Q46ImEQm1tCjd1lestUM/5hc
 YO1KbnndFUQ7GpT1VTg6k784AiorFNAZ71r+0V0hV6BMclxH7QUWcYumhJLjlIutxnD4
 BfiiczsCWYg6d+3X+pLzjSuzZm3uS9k4+IF8U6Y2MGfVkHCZojodx2QypG0oERkyZa8J
 kjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908016; x=1755512816;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bqPdk+kMHdizcmns5gJMD0d28gNsebZwX40udCNZpW4=;
 b=OsFcBrAp6rjxRMN9E/Ljp2buD883TApcph7LNbW87bEUS5jGrw08BwIp73KHkHC2Ig
 aW2UX3fYlI5ykRPgQsQuH9BeeAUgnIiE7Mtd3NsVhaOVFBRRr2uKUhU3UD/i0bf+zTyi
 eH4q1pjMvHikUrq45aBohQF0kCw2HVNb1h9kEv3P0scc294itbb/xk+n2JXxrXIosR2O
 SU9FEv90lFXKaZ5DqOJNuPLVDiGiuvvpFocwe2ywBp1isx3hG84jy9JboigNR9jTpI3C
 V1xQMcKfFzuZ25IcQ5VRzz+YV7bIHSww7MQcMJKdRvMDEc4I1UKsIH+TxNaR6xXjngS5
 kmaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAVEmFwJ9uzwB7MIVTcrC+tqY3DraRsqnFpluIwP0OqUEUHEAqIAnn3mMBeHtFfUrjxRLTD6Nm8Q==@nongnu.org
X-Gm-Message-State: AOJu0YzdWbNY0XwKiGUcqrOsD4+rebblgAqQgxPwS3+fW53kO91LfAqg
 D07QPKk7Tjww2tK7REFXY8PI6UNtG1NJ/Stdve3RYmBKZ8/sb2OjXBnU2BM/EU9FAJ0=
X-Gm-Gg: ASbGncuBQ2kfgs0NNvQT2KqRKV9+T6tcFFMFKBCV52WdMgF+dPkITiiagqPrUkJ0Pie
 NzjeldthQPHn9/ncdGjteP1HpMwhDkT1mH9/P5B9uQ5GY2W5TZuLn458GKa90cnik5SDeTkC9ms
 +gKBw8ZJrJVsK9qiAE5wiThFjomQwqgDaYzXnWTbbPyBJdFnLm44SYvsehrAglxqyvVhw0GWXPJ
 pjm1hygmA2+saQFMoW51v4SWfVVHUXGvjLg5IQLxnKHgGoXG3YW8+ZEU29Ht50oEx3xv22aKGHZ
 VNWhhTzf2SvLl2ppVk4znqhZNmAUTLdCUxykwCRLrrgagzVOMenh722dB6wymBHAVSbmEJ+aWQs
 v0g6YgzuqfC8T4dz1k5L5B8BhteL0hbqdYvl1TNG6szv7UpVQSz2MIHBsZ9hCZL3sSw==
X-Google-Smtp-Source: AGHT+IH28QX1pqvgzJMV9kA7wZFpKc5AGU4RWDhCdWgRG9dm1Ew+Utan6kZS4k5oBTx7nMwpg7oIgA==
X-Received: by 2002:a05:600c:3b15:b0:459:443e:b177 with SMTP id
 5b1f17b1804b1-459f4f13f1fmr100235575e9.25.1754908015753; 
 Mon, 11 Aug 2025 03:26:55 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e0cd2c90sm295842275e9.17.2025.08.11.03.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:26:55 -0700 (PDT)
Message-ID: <805a9a58-df34-4a0c-8613-1c7f22310170@linaro.org>
Date: Mon, 11 Aug 2025 12:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/11] hw/arm/smmuv3: Add initial support for Secure State
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chen Baozi <chenbaozi@phytium.com.cn>, smostafa@google.com,
 jean-philippe@linaro.org
References: <20250806151134.365755-1-tangtao1634@phytium.com.cn>
 <d4fcf3a2-6789-4926-882e-1abac4c07843@linaro.org>
 <2169e4b1-97d1-43c9-a512-5e6e25a562ad@phytium.com.cn>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <2169e4b1-97d1-43c9-a512-5e6e25a562ad@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 10/8/25 18:11, Tao Tang wrote:
> 
> On 2025/8/7 05:28, Pierrick Bouvier wrote:
>> On 8/6/25 8:11 AM, Tao Tang wrote:


>>> Secure Translation Path: Since the TF-A SMMUv3 Test Engine does not
>>> support QEMU, and no secure device assignment feature exists yet, I
>>> created a custom platform device to test the secure translation flow.
>>> To trigger the translation logic, I initiated MMIO writes to this
>>> device from within Hafnium. The device's MMIO callback handler then
>>> performed DMA accesses via its IOMMU region, exercising the secure
>>> translation path. While SMMUv3 is typically used for PCIe on
>>> physical SoCs, the architecture allows its use with platform devices
>>> via a stream-id binding in the device tree. The test harness
>>> required some non-standard modifications to decouple the SMMU from
>>> its tight integration with PCIe. The code for this test device is
>>> available for review at [3]. README.md with detailed instructions is
>>> also provided.
>>>
>>
>> I am not sure about the current policy in QEMU for test oriented 
>> devices, but it would be really useful to have something similar 
>> upstream (Note: it's out of the scope of this series).
>> One challenge working with SMMU emulation is that reproducing setups 
>> and triggering specific code paths is hard to achieve, due to the 
>> indirect use of SMMU feature (through DMA) and the complex software 
>> stack usually involved.
>> Having something upstream available to work on SMMU emulation, at 
>> least on device side, would be a great addition.
>>
>> Eric, Peter, is this something that would be acceptable to merge?


This shouldn't be an issue, we already have some:

$ git ls-files|fgrep testdev
chardev/testdev.c
docs/specs/pci-testdev.rst
hw/hyperv/hyperv_testdev.c
hw/misc/pc-testdev.c
hw/misc/pci-testdev.c
hw/tricore/tricore_testdevice.c


> Looking ahead, my plan is to refactor the smmuv3-test platform device. 
> The goal is to make it self-contained within QEMU, removing the current 
> dependency on Hafnium to trigger its operations. I plan to submit this 
> as a separate RFC patch series in the next few days.


