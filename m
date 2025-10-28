Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CE2CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 11:13:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDhcj-0003v5-8w; Tue, 28 Oct 2025 07:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDhcf-0003tZ-6e
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:12:17 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDhcU-00018t-Qq
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:12:16 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4710683a644so48894195e9.0
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 04:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761649922; x=1762254722; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xJyDe36il24B8sHiFvFIFNoNSBcoJYvI1h9pUm1P3RY=;
 b=sboEoPSwkOZ04zuHEonm+P65EEaW2LvF1bnpdx4RjHICwmDXnCUGvYWhHGcI9OSPzd
 SivB0WRsSCzLyt4S77EPx2eZ5oRer3OqDqgsdddG1LBAg3G+t3IsQYxLLli0XZ8wXRhb
 D/nHLHFYma5qw/lrZHpnU6dSxYdIiguAf3r+VpF7/S4CvdNGHndGlwgWtiGfWhUNfzl/
 Nf/4vBTSTQwjQNDjk/+LNgJT+HjxlFvJZND7sSaM7dc+5WaKJHsXxc9lu+FYsRYqaldy
 nPAnV1yKSkAoRzggqwHg7LRU/RF7ieP55bXEFxKChl/pZsz7toRRuzLt5McM8zeEJxS5
 h8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761649922; x=1762254722;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xJyDe36il24B8sHiFvFIFNoNSBcoJYvI1h9pUm1P3RY=;
 b=dCAKPDtE8AFmx1Jw+xwlZw4GNJlbB8kGoj2H0DjV171Gp7KKjD3P0OsRVQ6k6xpPKi
 O1Bn7J73NR3y+ijIVXn+bX9++Yx00EFFmcNCQyy1plBD0LFS1iaBm5U+qpT8A9V9Wy2g
 mU3EuErmGop/gicgPJKfywSgdBCXVqZN4w83Cl2SPOAVapAqcH9SeEOAPkpeeVE2b4yE
 Dk4jdIbksfTHOXlH7cDXSm6tV5R4iZDXpszW99Gi8XugxH79zZMIk7v6/fyRzHIkCt/i
 DToGO3jTbS64JB9FU1POEkRhHTRYh/xC08g1RXXHOT0WWFrRrwJYN5XHeGfSqf7NHGAL
 DcFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWScc8HgmNdgi1o6aYdwhaKwTh+hjddAH0yAGPNftI1cQBPal4C2OqVrFDhWBZr9d585lwoC97lGQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywt254AdvAmvR4XWLUunVcrDwBMXQSYyq6dGG3/vs+hyKF3abyy
 aSdbq3HLBeiGFNWAUgxW+UHDzj9W+l9WWbMGG0VYVCmkbFZW6iMYDhwdG1fhmtW2f58=
X-Gm-Gg: ASbGncuFEOGzJqMW8zbjP4XRtGrhkMReG9N1Zh9VO8wImtdximPWuxLoaHhQMpDvv4J
 cUMz6Oqkkal67hyzlyq0LRekHuAmHxI7pei0Vkn1J+sK9L4KoPTekvdKQQV0cwao/NcpspHdJzs
 NNngsNqvHqW0fzmreRzHf8wNU2HTXMxLHc5/qrsPMmO6toka9LUj3pEA80DS430y2A5Nufmkpm5
 ZR5NInwBcqTP1riIgzZepnZIDICYS2Zn1LDhD4YJ4fJg/rpbeDAoBVcIwk49qL6b+JM/pBnJuWi
 1D8ro0sfl/wUN041QaX7Ny/a4104yJ4wWrq1u1QZJ2IY50sXS53VJoaIOy02yTj1PfvJByGANt5
 8UwYnfVbNN2/9/QVm24yjxKZ8Slw87xygJYIooFwVvvdl+V5qEXxPERi2oaXyxEexfISO6O98+k
 tzXYFT6rBADuuhGxHEU2vUkAbfFcm2WwqkbbRtGUa3IIWuGwHB
X-Google-Smtp-Source: AGHT+IFe0Jziub8Wkt6LRYvZxNA1eoqQ+qP4ZgX/WCg11/8ilB/4Wi9IcsvRs9aJGN2mdW6ilHaNSA==
X-Received: by 2002:a05:600c:5246:b0:46e:6339:79c5 with SMTP id
 5b1f17b1804b1-4771812e415mr29792195e9.5.1761649921716; 
 Tue, 28 Oct 2025 04:12:01 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4a5cc4sm187031775e9.11.2025.10.28.04.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 04:12:01 -0700 (PDT)
Message-ID: <262b5b0b-ad9e-4a69-a5e8-f8948bc14d62@linaro.org>
Date: Tue, 28 Oct 2025 12:11:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] hw/sysbus: Spring cleanups (part 1)
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org
References: <20251028080258.23309-1-philmd@linaro.org>
 <CAJ+F1CJYxKD23TFCy1-rbZf0Y_mSMdyVH=nFDM6eomDhVpmHYA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAJ+F1CJYxKD23TFCy1-rbZf0Y_mSMdyVH=nFDM6eomDhVpmHYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 28/10/25 09:49, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Oct 28, 2025 at 12:04 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> - Use proper SysBus accessors
>>
>> Since v1:
>> - Reduce series
>>
>> Philippe Mathieu-Daudé (7):
>>    hw/sysbus: Use memory_region_name()
>>    hw/i386/microvm: Use proper SysBus accessors
>>    hw/i386/ioapic: Use proper SysBus accessors
>>    hw/timer/hpet: Use proper SysBus accessors
>>    hw/acpi/cxl: Use proper SysBus accessors
>>    hw/ppc/e500: Use proper SysBus accessors
>>    hw/pci-bridge/pci_expander_bridge: Use proper SysBus accessors
>>
> 
> There are a bunch of compilation issues that I will let you address for v3.

Sorry, this is based on my latest PR:
https://github.com/philmd/qemu/releases/tag/hw-misc-20251028
Based-on: <20251028074901.22062-1-philmd@linaro.org>

