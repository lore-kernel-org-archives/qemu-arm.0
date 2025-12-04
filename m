Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8742D24477
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 18:37:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vREBx-0008Om-AX; Thu, 04 Dec 2025 13:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vREBv-0008OG-Ps
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 13:36:35 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vREBu-0007V0-7u
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 13:36:35 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-34372216275so1383330a91.2
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 10:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764873393; x=1765478193; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4sJjiGWs1N++nWJpef6v9Bvf41rJMyLV4hdvMlidK0I=;
 b=DQu+2LnrMcFH48D1jBhyGwwnQeEtno0NG0bhdtL8PeiM+8Wdq+mvNfccd559CSEno+
 ZkNEuxrAcva1NX/Sw/6722fM/s+e05rZIXb0FclJ3YgtTSCqtUHao87L0IGfcfGPgquC
 5o/Ic7jtxqOkvSu9MyuJkCAf87I2f556EE/g0IQAOtsA6FP91wAFVzMXVkj3wIQd0Bnf
 uzpIJQNxMphRFO88rRXqwdyGWZGuGwpcy8MD1kUnrSd0Jqq3T7Z21n4l5zsGp/TJPzfa
 SKRVh6VhbZEWWaKyc5s/u5+kRK2oPWL88VF8ceIqW2e7g35leJDaHM8Zhb+OahsxDV+S
 pq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764873393; x=1765478193;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4sJjiGWs1N++nWJpef6v9Bvf41rJMyLV4hdvMlidK0I=;
 b=CPp9jzcXbJWiOQJCXoRzNEvk72Mk1VqXK6rGOrBp9n4ZxXYPlx5/DZkIel6fPt7GjF
 9IQu7K1/WX0x6i+8gFWmJs91Tb2bHTf2tq+fh+5NmLLLyuoUc/2F+ei5w5D0hgJdDuHF
 6F9y8nBuidy9xLu/32B8xP+ZGj5+v0AgPBx5wvCKNi4YfsntP2y1fzM+pNeSIMiMOQVY
 FNmOWiJYojQSHVyDzuEQn0CH2UVp0csyqGNAGCNA3/u90KebrVfouGALrV7PrPMTPVbs
 iHx8lvhsuGjlBv8Xfhnl57wGvS3pCBxUinxKFd9U0bpPZglgu13QMCxZGXdcRaSZdZv8
 5VuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+EJH3f/5h4zInvqhI2nnGMwIC1merTgrb07L4fGMZtwii3lqmpVcQqxBQ7w8jmUQsTPyJ2QzrJg==@nongnu.org
X-Gm-Message-State: AOJu0YxWQoSzA53jMFn8IN7gvhN4PhysDmCdlB0Y66Hr906E9+qZWZ4x
 qz4kfcYxtKmxgTecAoSQ8Dhp/7CZvK6isFbiiIWZqP0qv4VqlxV/5hhsFQcE9BWKGpM=
X-Gm-Gg: ASbGncvrDID6PbDUbFAAP0PM2rc4Wfm44GF77V64P9kYy4SjT+SUdu2tIXpE/TMN6CM
 0JGEh2a+oTsvH5oMvfrkRnBYJMDURZ12oYsfsUpVREpT/ZVXYWvlZcf0J4ay/Ssyju5DqfYa+su
 pH1R9m6n2358AFbjI49TlvsH6brAtWDLz1Sy7D4cFsSjvH/2fpQj9WXTX+oxd2dfvqFyDy7js7E
 RhNwHF5HISIeifS65Nt9goIvd1jPvMhpY18gdBziodImenK+7G27l6mkjIKjb3ITHSwGcQrJWPY
 +gY5EgeeSYQbu2Qbb9q/RnOjoEPRUpnNXQRm7t/GqMpWUn+DrF2Ak6X44E8I8FyTcObFb98tfkO
 ENKdFdgdH6n9EDh3WYrzLw3ruNa6LATT3K59zg55lgGyvqlY+2OoEjfuAQyBlM8JqS3tlVZi8iK
 XB/HSnM2K7rPaQHOllWMrXW0oKJhbsrAIIDJnKNyVXmLjhzmDB2O4dZQBvvOzAgtJdCA==
X-Google-Smtp-Source: AGHT+IGXacDhACO8mBswxofKjIOStTHM8Iik5BEXKmuNBYNUAZ5u8IswPuqV00rTSF9ZjtFLcKf82g==
X-Received: by 2002:a17:90b:38ce:b0:340:ba29:d3b6 with SMTP id
 98e67ed59e1d1-349125c002dmr7587123a91.6.1764873392764; 
 Thu, 04 Dec 2025 10:36:32 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3494f596877sm2444342a91.9.2025.12.04.10.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 10:36:32 -0800 (PST)
Message-ID: <e52db78c-15ca-4c09-a5f2-e149b6c5cb5d@linaro.org>
Date: Thu, 4 Dec 2025 10:36:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC RESEND v5 2/4] hw/misc: Introduce iommu-testdev for
 bare-metal IOMMU testing
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20251126154547.1300748-1-tangtao1634@phytium.com.cn>
 <20251126154547.1300748-3-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251126154547.1300748-3-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102f.google.com
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

On 11/26/25 7:45 AM, Tao Tang wrote:
> Add a minimal PCI test device designed to exercise IOMMU translation
> (such as ARM SMMUv3) without requiring guest firmware or OS. The device
> provides MMIO registers to configure and trigger DMA operations with
> controllable attributes (security state, address space), enabling
> deterministic IOMMU testing.
> 
> Key features:
> - Bare-metal IOMMU testing via simple MMIO interface
> - Configurable DMA attributes for security states and address spaces
> - Write-then-read verification pattern with automatic result checking
> 
> The device performs a deterministic DMA test pattern: write a known
> value (0x88888888) to a configured IOVA, read it back, and verify data
> integrity. Results are reported through a dedicated result register,
> eliminating the need for complex interrupt handling or driver
> infrastructure in tests.
> 
> This is purely a test device and not intended for production use or
> machine realism. It complements existing test infrastructure like
> pci-testdev but focuses specifically on IOMMU translation path
> validation.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   docs/specs/index.rst            |   1 +
>   docs/specs/iommu-testdev.rst    | 109 +++++++++++++
>   hw/misc/Kconfig                 |   5 +
>   hw/misc/iommu-testdev.c         | 278 ++++++++++++++++++++++++++++++++
>   hw/misc/meson.build             |   1 +
>   hw/misc/trace-events            |  10 ++
>   include/hw/misc/iommu-testdev.h |  70 ++++++++
>   7 files changed, 474 insertions(+)
>   create mode 100644 docs/specs/iommu-testdev.rst
>   create mode 100644 hw/misc/iommu-testdev.c
>   create mode 100644 include/hw/misc/iommu-testdev.h
Overall, the test device looks sane and has a clear interface, that can 
be used for several iommu implementations, beyond Arm smmu.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

