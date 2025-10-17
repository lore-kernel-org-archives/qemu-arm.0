Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE99BCCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 15:41:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9ma4-00032W-LV; Fri, 17 Oct 2025 11:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v9ma2-0002zq-J6
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 11:41:22 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v9mZs-0002VQ-Fb
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 11:41:21 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b593def09e3so1422008a12.2
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 08:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760715669; x=1761320469; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d6N2+HdYpj33mli65GRZf5zXM/OGDD8jTDNnWqIMLU8=;
 b=C+jKYGBx3qJ/49VCK+vz8ftqYTCNPER1PmXxNJDpXdsmFc1dux4SnMsHCWlwN4eJy2
 JDIaDETqeVp/IgSAdH9aiUxApNz1uq8FkNm6t/+L1zsm8/sDIyM/O3/Tx62izTom9mV8
 sSTJLs3oGFEgS7EUc8kvjWoxh3oq7Lub0WGEGZHS3kXimT4z5DPeBXVD/4xiujcgX3Xa
 NnqpJLijI56yxGLV9y1XYr0NbT7viX1Qs0dao6UP7y8O4NvuL21pHcfcE4yBHJBdsfc3
 jdB8Rjc4RvQNPMm5H/q8OxHmRZ3c0rSVgSsn6RSxMJhb19bcSOIye2pXeGx4lfs3viaG
 chCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760715669; x=1761320469;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d6N2+HdYpj33mli65GRZf5zXM/OGDD8jTDNnWqIMLU8=;
 b=Y0XYInLfX9Lx+QMHOvmmQ7IYymGjhOoHRnADVTinhGYRmRqP5CK1THJ/Dgv29+j5fx
 kuGw9fn8S+/N7QUC7qvkM2qLobzXG8TwS2S8Lo3X5avFozusZq6fG1fLyd293ybHIzKe
 BNfR8gu7eVtzErV1rLR355N5pK5kxmpKv0lUwwx0oui6C4rKSQnu1sz5a0z7kk/CC65B
 CpbSZupJrFeP/mmgin/iqFc5/mG2DxzzPi+KShsHPnSZe13psSPlJvdKTvKymY2L0wer
 W7JwcNvh1Q+22gKc5kDgUrJC81rzPt8/7SQt6PF3hmgkmQFEk2vufo+GzsL1Q+c3gctU
 nBaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCEbSMDXYOPToG0L3mqXjDfTuokV+O2VZqz2uPGmKDkslDhdQ4QvZwyTjL6qKsJJUdBnRpPstr8g==@nongnu.org
X-Gm-Message-State: AOJu0YyufEhL6cjAROKqhKAJvey7f16NKAAqHeI6sY7TduCYz92OJxgt
 Qx8Va3VRVSdW5qrjno6TfEgOYKJxpoarZz7WgWwcBiqZWtJoB7pJ3h20rgqHcZediTE=
X-Gm-Gg: ASbGncu4fXGajtkvuuBtDzYzCh2CzODaOs8eNznMSNAF4tLMzhVD4vQbZSOjgCooaF+
 5EQPGiNv8J1QPmhBuhRzJX4GR6bJuqG1aKkYFu7DYfZoW0kcMDzIVsGitaUdWq24RN0piprDiqJ
 djyuFMip2wr95w+oSCa4sr/HGhsR8LHAzkD31Har/ap2Uzvsde9Jl66x0NUSahtouitUD9wOx5n
 uN9iNB/oXzElkZMPP6C4WrwtPElTptCXkca/f3nqIh9SCIyJXvuxUFIbak+GhXaMlkn1SaAVv9J
 RDWtpFWGItI5HXc6ce2Ji29UmKFNN1nD39NFxUB63m6A0QuKsGFv6ZV4F4CSlz1co63wZfq/Czr
 TdAenjVsuc+h4492b9QVUMoNcOffgP6UIAZscIbaQU+1veSO+5tUh3wNhvslOL+GHOmwbNV8ZWc
 HexSUlR9HwqFB5pEG7vg7t3W0E
X-Google-Smtp-Source: AGHT+IEkB18sBzZw4c84BBQQGbj4/1AL887GBqwox8T5oDtVDdsA2sOt1xrTpOVvImq+vTyPM9xLjA==
X-Received: by 2002:a17:902:c942:b0:264:a34c:c6d with SMTP id
 d9443c01a7336-290ca121a65mr56915565ad.37.1760715669024; 
 Fri, 17 Oct 2025 08:41:09 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2909930a756sm67663655ad.14.2025.10.17.08.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 08:41:08 -0700 (PDT)
Message-ID: <cbba8eb4-8628-4df6-87fe-b18a0e9f9520@linaro.org>
Date: Fri, 17 Oct 2025 08:41:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tests/tcg/aarch64: Add test case for SME2 gdbstub
 registers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
References: <20251017153027.969016-1-peter.maydell@linaro.org>
 <20251017153027.969016-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251017153027.969016-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

On 10/17/25 08:30, Peter Maydell wrote:
> Test the SME2 register exposure over gdbstub, in the same way
> we already do for SME.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   tests/tcg/aarch64/Makefile.target      |  9 ++++++-
>   tests/tcg/aarch64/gdbstub/test-sme2.py | 36 ++++++++++++++++++++++++++
>   2 files changed, 44 insertions(+), 1 deletion(-)
>   create mode 100644 tests/tcg/aarch64/gdbstub/test-sme2.py

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

