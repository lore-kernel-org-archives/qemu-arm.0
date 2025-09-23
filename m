Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ADECAC5A7
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Sep 2025 10:31:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v10Ip-0006MS-Pi; Tue, 23 Sep 2025 06:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v10Io-0006LC-IJ
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 06:31:18 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v10Ij-0004Hy-EH
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 06:31:18 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45e03730f83so23255015e9.0
 for <qemu-arm@nongnu.org>; Tue, 23 Sep 2025 03:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758623467; x=1759228267; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VBxEajzs7Wxc5qI1Nh5llJDIOdnTsd5c/L8oX7nwzr4=;
 b=BKiXuxbbEfXNXPz6+wne21FAGvZ5QDC4h3d7aTbrwUn6fV/kDBFPraisVbck93rTxK
 6XBAzr3tKWMmyXUj+mEe9KLg5FHaG+bYikz/+HEIPSqm0zwr+5XoUGRWMGB8CddzVml7
 RNjPOFHs9mv7Vg0g7mmGm4L4uOuL8mZAcQQmFeUjs8cQAB5FcYGnyH6pYYrUjVGBkOTz
 PY1i9sxWUY7vy9SVJB5eMQ03tYI+Hu2v+LICxtJ68OXnHpuDGONNLn3TTzM1WPU6Ge8T
 B9uqlWe5ddw7xYA8RbGWkXZ2wRzWYVlpIRWGbNpG096Ycr9P6V604y/CRQuLAFCSw/WE
 Hl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758623467; x=1759228267;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VBxEajzs7Wxc5qI1Nh5llJDIOdnTsd5c/L8oX7nwzr4=;
 b=BSucv/3HbGSCXGtxxtsCVReIGNxn4QmRonxErQnJ+ux+ULWNhgYHWFK9LtLMcg6SWx
 kii9WT5fPOgG1ACCwBd7TcW2XrEtEUpsJeDc7enh7Re5JpGGBP/rZn4qA0N7h/8cpxgu
 BEU9XC32kf5US87j6VuhQiXwMOnYAyVWD8dc1ggAp8ywysniC43iIKQQ02PJ5hYtUhHF
 YwEWZDUZP/WJKSRF4qonOr726LFAdW+Tm3Nj0GPt4nuqqraI0Jao2Raccpp8Tv6+Jp/c
 m3kTcUqfw+TyVFQYXWgf8BitPw22ZF3DUJuZdp1PjUVrHEuOfDJCmbD7NtrAdbPpAPad
 gP1A==
X-Gm-Message-State: AOJu0Yx1/7aEuKhDPurCL2OuvLpLohoWYZI+5cGlaXz4ejSbUvNth/sv
 uL+UM4znJ81I4Q2x6lpRhmjNUPQKeOFbjT1TSqadnTHsh6KQldo9GCkyYo5KPoGXCX4ozOMfsq3
 tVf9dIYEhcQ==
X-Gm-Gg: ASbGnctaU48DNyIZKO1rvdZeWKx4hWggDUXo4uxrgDxAeaQT6LFwQ6eic0blynRKtv6
 li1pikpCdQgiJrMl4FPQdx9JphG0cnOAjMgMPLOOEbItwvMOFjalfGDLHt8I/qV4dJl3ycNhYC4
 0hcEmZxXl66/QtSmehdeAJ1k7pVcm6De6Qn4E93Sql54L8S30JllCaRq3QPrgJ5LqZl+LrEW1cI
 S10b9d3Afqa92Cpa41KmnWo2V86bG07eAS+blHqyVxQ7o+d8D7HtusEdqtlR4O6NZ6yFE0sh8Z1
 CnHSyq/+MhyiP746APmEu9HeVqi/nRI5YWsejFe2b2CAzeqJdIPcos8onaLZKUNqe/ZAyiKIAQe
 BB8/E2i7vALg6zpGRDkyLNC44kCewziQmUrPpM2WRJHfuwnPa69CGUXocRnfTCMVvYg==
X-Google-Smtp-Source: AGHT+IFLcn6lWjI2aBiMfQfdSgBcoFHi1htcAN+ykOPAbMZlNc1sp3QoKI+lQNBvwQLhI4KWdY2x/g==
X-Received: by 2002:a05:600c:4f56:b0:46c:7097:6363 with SMTP id
 5b1f17b1804b1-46e1d98bf65mr20761295e9.13.1758623467277; 
 Tue, 23 Sep 2025 03:31:07 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613d33633bsm284377745e9.11.2025.09.23.03.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 03:31:06 -0700 (PDT)
Message-ID: <9cf69af4-fe5f-4998-acae-cffee41d2c91@linaro.org>
Date: Tue, 23 Sep 2025 12:31:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/36] target/arm: Rename all ARMCPRegInfo from opaque
 to ri
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-12-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 16/9/25 16:22, Richard Henderson wrote:
> These pointers are no opaque, they have a specific type.
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h | 10 +++++-----
>   target/arm/helper.c |  6 +++---
>   2 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


