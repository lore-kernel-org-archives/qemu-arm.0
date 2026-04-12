Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DBBE93804
	for <qemu-arm@archiver.kernel.org>; Sun, 12 Apr 2026 20:53:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wC1oM-00012C-RU; Sun, 12 Apr 2026 16:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wC1oK-000104-I4
 for qemu-arm@nongnu.org; Sun, 12 Apr 2026 16:53:40 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wC1oH-00065J-QR
 for qemu-arm@nongnu.org; Sun, 12 Apr 2026 16:53:39 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48897fd88ebso40560825e9.2
 for <qemu-arm@nongnu.org>; Sun, 12 Apr 2026 13:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776027216; x=1776632016; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dlGKgcDRVNZh/ceoFaMTbHZb+tkfz+iHzXD+62lWtK4=;
 b=Je/4GR/PSs3BRhw/lKXZQIltyjWuNkprIDmfBHGR00MBbmslolwf00jaEm0Vlwxfb6
 iHY6LN520+tiW/UXoWj+EErBEkXFdSbIiSPJBIaSKiKuCcrMff5ps9tkWPtBgIzgO4pb
 /wywht5CbYYP8QffJ5fHwvy9n1pGE2rmphdvSSeWZeJbsPcngPSUQbcHT4g0In7ef6vl
 7tcpP/zbiGHyRKzq+BKC2bvCI/NAVND3SypdDlzYTNyh13dOnCChYpfqHloUodbRfpR4
 jxSKlqBr/uoMZcC/xgFn50Z0K8BrsXd5PJpiIzW5wj6cNqY6VSnrFG/oCTlC2dpDUhpY
 GZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776027216; x=1776632016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dlGKgcDRVNZh/ceoFaMTbHZb+tkfz+iHzXD+62lWtK4=;
 b=RyFZTnrmX53kB+JVPpwsYNEnvuwK+EAzkOWMWi2SvB+R/ymFjnV/lh+QnK5hbeli9F
 RAZAfMgExvFfLIwrXGjP9/BwW1KIlp6RMINuRDbnRlxGFDc6dk6ps3GO7WRYHMcH15dE
 +JqvFIJ+zjvVmpbX7WXv/k6s26OBT2X+bTOGkRZS5Wke8ckqhxbV4uI6tYTyzzRRMh4p
 IVIii3sc1LiV/4a8vRppcwjwPtIHu3vnXCC19f2+yaw5LLY1PvGD3RCbEttEiffWo5iP
 KDPcBa0NmH/dZ+/koPgcW8SAbY6gkQUuM2wAk83VUHujjQwYw/yKYs53Mie6zaHsRwb3
 M4ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2zVIxnDSvvUUfB/6+Nlh2WPmaFClS9qgd9k7abtdAFxVVg74c5K3ec2oECCKJTYviImNTzwIP4w==@nongnu.org
X-Gm-Message-State: AOJu0YxLcIrPsWM/Vr2ppMy8GC1l0edgeGKHvjjxAUnmtV/vU5wC5AOC
 UZ63+Qh6UnjJhVU3CiZvMRMa0rxMV5WzDwjs/whAukRt5ErsoKyNhSruwyNXrX3cRS4=
X-Gm-Gg: AeBDietE3sMztCNr6l991CVbmhoUHH4BsNd0G5d+7MuS8MfAbyN6lPtwyRpfaYPoZSy
 OraKzCINhrU83tE13LDndI9WlfxAI3C9IR3ZR3+ZNGbugNC2tMBU/k0ph+0WSVYo6X8mHO2xkn9
 7Y40+zpeu+fmbTIc8aWOTNjtX3YBcEXBTTSTULd5gB0RoTKiwC0DCS8YUzkY4xBcu2HIvEdU1LU
 YMR7evqHSoP5dPFtqhCpG9918YGmKuCEFMy7Zd0VGqVCx/Db6OEFuwK5CHB1Pjjw4c2wm9sDIlD
 +usEO5At3g5Er8nO80aeXVxeCalA+ErkSpiucAy7YHbjxtcdgnYW/qTo+RqjDIujZbnRAR2mkfP
 2LDbJkbO1kBYrtqU9HJ1TYa3l3gFO7IzqXyYHOMt4jPA1j0/1YpV/ppBISr5Ll8ulo3y9b8oisT
 c6T1NW9yi4YMRQxHNkGxpI+Vi2jUjm56hJDUtJCb89jkZwO/oYBS6NivRx2nC5HVz1vw==
X-Received: by 2002:a05:600c:64c4:b0:486:fbd1:9dc0 with SMTP id
 5b1f17b1804b1-488d68c2c56mr132751815e9.22.1776027215811; 
 Sun, 12 Apr 2026 13:53:35 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d67ced32sm107711855e9.7.2026.04.12.13.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Apr 2026 13:53:35 -0700 (PDT)
Message-ID: <f1f030b4-acc6-414d-a0ef-4afff50278fc@linaro.org>
Date: Sun, 12 Apr 2026 22:53:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/13] hw/usb/hcd-ehci: Add descriptor address offset
 property
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260311072614.1095587-1-jamin_lin@aspeedtech.com>
 <20260311072614.1095587-12-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260311072614.1095587-12-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 11/3/26 08:26, Jamin Lin wrote:
> When 64-bit addressing is supported, the Linux EHCI driver programs the
> segment register to zero. See ehci_run function:
> https://github.com/torvalds/linux/blob/master/drivers/usb/host/ehci-hcd.c
> 
> The driver comment also notes that descriptor structures allocated from
> the DMA pool use segment zero semantics.
> 
> Descriptor memory is allocated using the DMA API. The platform driver
> configures a 64-bit DMA mask so memory can be allocated above 4GB.
> See ehci_platform_probe function:
> https://github.com/torvalds/linux/blob/master/drivers/usb/host/ehci-platform.c
> 
> On AST2700 platforms, system DRAM is mapped above 4GB at 0x400000000.
> As a result, descriptor addresses constructed directly from the guest
> EHCI registers do not match the actual system address used by the
> controller when fetching queue heads (QH) and queue element transfer
> descriptors (qTD).
> 
> Introduce a descriptor-addr-offset property so platforms can provide an
> address offset applied when constructing descriptor addresses. This
> allows systems where DRAM resides above 4GB to correctly access EHCI
> descriptors while keeping the default behavior unchanged for existing
> machines.

This is dubious. Maybe the AST2700 isn't modelled appropriately (like
some memory region not mapped in the correct container, or some code
path not using the correct address space).

> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/usb/hcd-ehci.h        | 1 +
>   hw/usb/hcd-ehci-pci.c    | 2 ++
>   hw/usb/hcd-ehci-sysbus.c | 2 ++
>   hw/usb/hcd-ehci.c        | 1 +
>   4 files changed, 6 insertions(+)


