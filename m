Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FE0C79FB9
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Jan 2026 19:12:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vcpzS-0004pK-Fd; Mon, 05 Jan 2026 14:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vcpzM-0004UL-QE
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 14:11:36 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vcpzK-0006OV-AQ
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 14:11:36 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-34c21417781so307673a91.3
 for <qemu-arm@nongnu.org>; Mon, 05 Jan 2026 11:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767640290; x=1768245090; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FhSHiaUAmchznQpwn/zLomPV++UqAw2HPkNHjU5ciQk=;
 b=e1FKKSDGFTVinc/kLyElFd07GxIbh9gW50raP9VVVGTHlEZpdxvsMz5oIMyuDtLK9g
 OP5E8M3/dZBhpIjMaKfD4n4CvmxQmSUZ5uv56Exbi47WrWqyS2GRisdUIkPhRld+rK6n
 T297uN2Bl0ZJJaHDaVya17JWoVzHR4lMIKu/fJQZSgqJAsvA4LThcdCs6RrOG81xhLh4
 TWZL5nhNuZpXLrqmUTLzNzvLSX2UIMZCKW75WxctZ8Xh0JPwftCHViCGqHnVk4TX+Vk+
 LBaIC0ZyuXgU6TAOYP/8Y1plDCoBZDY8jLHWc3h+aJGom2G47tbXCHCTDJR+fa/jpX9B
 ZC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767640290; x=1768245090;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FhSHiaUAmchznQpwn/zLomPV++UqAw2HPkNHjU5ciQk=;
 b=Ab22RkjLM9YTWZ6VUjrL7uO2njZW6NqOb6nI36Ns8sXqIyBIeAVrKz8PQw/lJ/kVg2
 zsode4etg3ceP+tyGWIckWmzhknpkd4bL3N9OiYwwW9MO1k4AaawDnK9zO4q8tLt3rvk
 M3BnkI/PLbSgOj3uvSS885dqsQmXnMwMMzM6xQ5o80VBKuC1eM0oyBHDzQaCf8ffvJXC
 ynB2dzl8493xT5zksO+nfzipV6knznD0V2EUwpXDB+T+oTPtUEdzHgijnUExSeA54ZCy
 aZiKiyxjZgycEXLnBwHfPMCf/FXgEk6n3SEjJGx6fGKZ0tIAEmu8EhIsFjVKjGCs8GYa
 8FwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV71EmI7VUeWn7er8MTLIm2+ycouqIX7JgptVvBzA/aVOhHgAcJgG6SWjppbhVHXtm71q0S2uS/tg==@nongnu.org
X-Gm-Message-State: AOJu0YzOIH84RfGaxWkYGdRSp2QSI0YniC9C3qAUZh9HUCOInFz4Wfqj
 +QI129ifw0U36Cz6A0I8yZ0VsHuL9TUCedTiz3Mc+vlv56nCP9P7rZWIQo7h58nuRCM=
X-Gm-Gg: AY/fxX74IAniPlqLOxTdg5POf4jqfWFAtEXXgirHCE954q6nx6xnpvujg9OIcWhp7cW
 h9ki481AoW+JJ7Alh3EUEPujjYtworpA+UACUA0gebis6BUNHeZOdlcE271R5Zwv+Sea2Y928pq
 z0XHyLeSmyZrd6IzW/Iesy2vcRa7kkjQw2L1CSzy3ul4i6K0KNZWM5Oj4XtUpOkBTvLwSBwegVj
 fEWzVnngnFm+5hzLslx7tCVzVpni5g8b5U2iZtwzXKhtMdo42MirtNVYm4EcpipMlF8lqNavkV8
 zqjlCcgoBtkspEXIQL9b2MF+ioTytK2p0EWh7PxYWJDSaB6uyOtYJVYRwzbgVg7aCI6N+gS6GpO
 w0Ha3R0IW9iAQ3OXTWIAY8mQOdhV6GueltppNKH0OMFe5s4ivE5dvOrwwfiT9Dr5eMVLexBP7gM
 UcFJVeaU6RDOxpNgWyRxPFDCPwn3p+vn6FkAaSskT6p/ykGzTfrguf8IDe
X-Google-Smtp-Source: AGHT+IFAa/xJ33Kf7LBFZnR4htuVhvTIbaoMejmPyEziTeQ5F8S0JcJg4efLuA3GUddWuvOfqO7jWA==
X-Received: by 2002:a17:90b:1c07:b0:341:2b78:61b8 with SMTP id
 98e67ed59e1d1-34f5f301a25mr232360a91.20.1767640290054; 
 Mon, 05 Jan 2026 11:11:30 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5fa78f4asm92364a91.3.2026.01.05.11.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 11:11:29 -0800 (PST)
Message-ID: <5cab6793-7bb5-4272-83e0-9dd7a73188b3@linaro.org>
Date: Mon, 5 Jan 2026 11:11:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hw/arm/smmu: add memory regions as property for an
 SMMU instance
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Radoslaw Biernacki <rad@semihalf.com>,
 tangtao1634@phytium.com.cn, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>
References: <20251216235731.1793908-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251216235731.1793908-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1036.google.com
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

On 12/16/25 3:57 PM, Pierrick Bouvier wrote:
> This will be used to access non-secure and secure memory. Secure support
> and Granule Protection Check (for RME) for SMMU need to access secure
> memory.
> 
> As well, it allows to remove usage of global address_space_memory,
> allowing different SMMU instances to have a specific view of memory.
> 
> User creatable SMMU are handled as well for virt machine,
> by setting the memory properties when device is plugged in.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/hw/arm/smmu-common.h |  4 ++++
>   include/hw/arm/virt.h        |  2 ++
>   hw/arm/sbsa-ref.c            | 16 ++++++++++++----
>   hw/arm/smmu-common.c         | 25 +++++++++++++++++++++++++
>   hw/arm/virt.c                | 13 +++++++++++--
>   5 files changed, 54 insertions(+), 6 deletions(-)
Gentle ping on this patch that was not yet reviewed.

Regards,
Pierrick

