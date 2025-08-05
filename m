Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB44C87FD1
	for <qemu-arm@archiver.kernel.org>; Tue,  5 Aug 2025 14:30:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ujIfi-0000L8-Vp; Tue, 05 Aug 2025 10:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ujIfE-0008OU-Pj
 for qemu-arm@nongnu.org; Tue, 05 Aug 2025 10:29:18 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ujIfC-00064e-LF
 for qemu-arm@nongnu.org; Tue, 05 Aug 2025 10:29:16 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b78127c5d1so3272230f8f.3
 for <qemu-arm@nongnu.org>; Tue, 05 Aug 2025 07:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754404153; x=1755008953; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3s/1VSDo9kvlkPhLtRT0ljoYRRfKzeTqbQfYd/v2U7Q=;
 b=mcIIISTYXHuJT1WVGxhFvwHVhyKHHvzIqMbMaz+BdDFhTKetwr9xHSBePHjVUt/0SV
 Wz/1YDYPK2OTKn2dMqJW8Oo/vEeEEhlQYtOl6GeUcBI99pHFBnPfzUaQl8ln8U2nmzj/
 y15WcSKCeIVjj7+/Fmsncd6phc1TdL/zcc7QgGu5QleZLCR4DBW6zozapX3Rd9gU0N3s
 sgkvgDhgPfDmbR42B34qMEGwnRcSAQriiRbVbIj5QKhPwye1QEeLcaX8NTALVefW7Rep
 o3oJgqmpbynBstrUDOJ8AHg0YqhjPqp+gCo4CGJmEcwdUYp/m+dhujRYlrpJPpPgQfJG
 vi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754404153; x=1755008953;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3s/1VSDo9kvlkPhLtRT0ljoYRRfKzeTqbQfYd/v2U7Q=;
 b=P2BsoXlDA4yPAxzAbRG1ZE5vYjg3BbCmfb9fYmDkVlUrhV6pu950K/MqAiZA2gCojF
 8560PP9f3GWWcgZ7lfsMCusHPkqjiz/yS4vDrnZNd7l79ys2eDYur14Lra27SWKPMpBL
 2ySUQ4IBcbWgXIN9fzHrZquP6KaEU4Z2UPHIsLgjxLyMBX+a8XQ6R3hjSQpSr/mT1Oo3
 SD+jYzlTcf9LHydeqWDr66n0ui5Rpv8oQTFTz184/jelxneJ5vHwZz5aez52PFyuG8w5
 v2f9AThU0OmMzCKwv4ds7EBtT9M4oWdjOi38mKSw1ELiLQJ7a9PlxajgtxW9zL2outla
 Sp2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0PXZrwOrcknoaLgH+FkuVORn4x5cisf6nCx8FlXcFNTfCnrC3Kpf2gezM6mSPaEY0E2tIB9OpwQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy+81rxyDIM3eSVt0TftFe3U3DUstFd/ufjMLzC83sJnKVrWuSA
 7Nuv3h71qI4nVo/+DqcKw8zJpwBAJLWOuNC5Iti6hcw3ezqVsjel4nStJsasGjobKzY=
X-Gm-Gg: ASbGncvw1L0phmPvxeob8VOQnNCNdC8/yK0Y/Q6dCpGV1c1hrJ+WoWp7OB3dSsmBTUX
 tA8klpzEEtwXCALgCgb6kARjpff8qR1N8Xv+c55TYuR/Lhp0cqo8cTFWlxRLFVRXrOJjJshXMEz
 efqC4XWphz0pKFnJxtFfcIcXHt1atbrqgL7IBDkimNgMxy5j4IXQf8a7LsVo57A20swayuI4vOz
 2fAWhrmor9x8VvfOahB857U7FWLy46/ZwutzbRuz+OZiy9BNompx97XKnbzkOlA5UuGTEna5DGX
 gvSF5w9N/etmedRAmfIYqX52bTCdTZ62fOUKdtvYF6kOa1y1WlLSJqgxJPgTD04p+//zsxDBnUc
 jz9GuX2aJiY1UTyPcRsZ4768rCGpYUp7YPMKBAHuuqVWhc/tmjfg3/vfWA0pUqKORYg==
X-Google-Smtp-Source: AGHT+IH+WX+5oaPwXmOoSnvVKCY2eU7oAAMtwX67B3L2n4aNivB/IWHNFVJFyiBmpsJm8yJxyTu6sQ==
X-Received: by 2002:a05:6000:4308:b0:3b7:9af4:9c75 with SMTP id
 ffacd0b85a97d-3b8d94b5f5cmr8658008f8f.30.1754404152792; 
 Tue, 05 Aug 2025 07:29:12 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abf33sm19535705f8f.7.2025.08.05.07.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 07:29:12 -0700 (PDT)
Message-ID: <e275eed0-4ca7-456a-b445-c608865282cf@linaro.org>
Date: Tue, 5 Aug 2025 16:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v2 00/11] hw/sd: Fix SD cards in SPI mode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>
References: <20250804133406.17456-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250804133406.17456-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 4/8/25 15:33, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (11):
>    hw/sd/sdcard: Do not ignore errors in sd_cmd_to_sendingdata()
>    hw/sd/sdcard: Factor sd_response_size() out
>    hw/sd/sdbus: Provide buffer size to sdbus_do_command()
>    hw/sd/sdcard: Fill SPI response bits in card code
>    hw/sd/sdcard: Implement SPI R2 return value
>    hw/sd/sdcard: Use complete SEND_OP_COND implementation in SPI mode
>    hw/sd/sdcard: Allow using SWITCH_FUNCTION in more SPI states
>    hw/sd/sdcard: Factor spi_cmd_SEND_CxD() out
>    hw/sd/sdcard: Disable checking STBY mode in SPI SEND_CSD/CID
>    hw/sd/sdcard: Remove SDState::mode field
>    tests/functional: Test SD cards in SPI mode (using sifive_u machine)

Series queued.

