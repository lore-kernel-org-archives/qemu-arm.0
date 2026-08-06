Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC90FC56205
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 17:04:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws1W5-0005kV-6Q; Thu, 06 Aug 2026 13:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1Vz-0005jq-0p
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:04:20 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1Vx-0005dx-Ba
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:04:18 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-84e0688b7e8so2363365b3a.1
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 10:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786035856; x=1786640656; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=YxKgEb1bXCsHClo/nYVNmSBaE33fM8z21HS5kcCHiu8=;
 b=G+x7lAgFmJu4UUgJg/3RtUYuXR3KPH07kBvwbzYDOwk7Ud8I7PoHVJ0d6BJa601z48
 gcbDne1HiogY6JCtmuumEEL7YhEgp22GWE848R0Xyk3jeGxCw/qYzHadKCBIm/kODNjN
 Kq1V4twyJKSA8ULKzD1Fehl53Dlf8cVvx4/0QzSOLIAfXp+3Y51NTX6qqjzFCVThUFZe
 tlOi6vV+4TRO/wcoXnd7VOCk28NyUHMlqz/fz9Fs2Aj8e+CT2zxYEzrrg+6sSfb353ZW
 QG/vtZ1TrQfhYVxjBbuU6sNhx+/B94PETBGKsqer/ab9hZ1ZmVrpdQ58XytKOG68OBoJ
 wLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786035856; x=1786640656;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YxKgEb1bXCsHClo/nYVNmSBaE33fM8z21HS5kcCHiu8=;
 b=dK1nigvlsPk1HS1Yjp/cT/z80/UKJDfQXeGhDmQw34729yq6d1yFLnU+morUDAhSzz
 7EcZSCltIVms+rCOjvgM0T06aFxUqYUP44AeyzEUs6E/502k75xj/MgeifoTzvEOXxSo
 0C8IcwQZpBUkzEqGW0HGeuVqdK/wBYW2h/o2ZhZW+DwWeAMinBdZXMzisJMtWY4ry+G2
 f+kRMzzqRY5zXOpx2ygk7k8MW8SpNGGrD2u1bXEKPZBzxTkMdm+pP00ghX/Rv2fZu5p2
 lqPc9MU8FWB1/RzbJU9HiGtx6tesAcgZOXW4+gYHL6vkHIMkm8QaW5fIjcvdaGJIBikm
 YkdA==
X-Gm-Message-State: AOJu0YzkY5t7BAeHrhCCbZ7Ku6ivYe3ua3IEYX9bZl4EgXiAL+EKFEkQ
 if6En/WH2xf+PlIvbMIKIR0+MpVTMXPPKm/ZY92C3Rh4vQ9BvvjCu1Oxwps7bXZddN2oS8ybza0
 WywZ5
X-Gm-Gg: AR+sD13tOae+Ut2bs3LbbWK8s1EYZX7PSY3n1uXq0Ad7zYDgIitDgiBTMlSpDYF3i9M
 8ALOLri1OjARb2kTNNdxmF/aH1WQ8JBVgSd5LEOK7ApnqJLZ3IU9xKDOYdPZBQJphfD/IoAcM9t
 IgeBnhTUnc5V3wT0NCYfbcMtjX2QmbMwo/hHI1veVBpxdEhUc0bSxeXIuFsEKhxw6lYFPCVeUg0
 Z8jMZ6kNjhS+LhLsyCbn0X35Svz6EDozX9nHZtO19XWPBySUTZvrdrha5L5jLVJQVCeJLrZlr7+
 hlqZZ8H7UYwF5/G9TRRnoMuxJHQYSDhiN859NzB8FtI/O0fX8eBR46agwWb9LnbBAloxn6+YMcJ
 TiE3TUcGjFG08nzznzVpUrp6RQ6LzPc/pkSnmylYSFTJa3XHepexaXS3z+EBG3y6/uUcNEPzhHz
 9Tuzc8RAhpgnu91tvDed+32Gxz/EpCBn1cFiKN0ptGHiq2E8NNXH+0mQjdY3wYjsgyNAeXvpnxb
 gO5XJUS4BLPHxuv7o+QmKUb9Zii
X-Received: by 2002:a05:6a00:929e:b0:84e:26b8:5a12 with SMTP id
 d2e1a72fcca58-84f2e0057c3mr17871483b3a.20.1786035855474; 
 Thu, 06 Aug 2026 10:04:15 -0700 (PDT)
Received: from [192.168.0.4] (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84f456b785dsm1753004b3a.36.2026.08.06.10.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 10:04:14 -0700 (PDT)
Message-ID: <2a8f28b5-302d-48a4-a22f-3ada0f3ef879@linaro.org>
Date: Thu, 6 Aug 2026 10:04:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] target/arm: Separate cpu types max-v8 and max-v9
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260806163939.328201-1-richard.henderson@linaro.org>
 <20260806163939.328201-8-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260806163939.328201-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

On 8/6/26 09:39, Richard Henderson wrote:
> -    t = FIELD_DP64(t, ID_AA64ISAR2, CSSC, 2);     /* FEAT_CSSC, FEAT_CMPBR */
> +    t = FIELD_DP64(t, ID_AA64ISAR2, CSSC, 2);     /* v8.7: FEAT_CSSC */

This field should be 1 for CSSC without CMPBR.
I got this right the first time, but lost in a rebase/reorg.

> +    /* v9.0 prohibits FEAT_DoubleLock. */
> +    FIELD_DP64_IDREG(isar, ID_AA64DFR0, DOUBLELOCK, -1);
> +    isar->dbgdevid = FIELD_DP32(isar->dbgdevid, DBGDEVID, DOUBLELOCK, 0);

I missed adjusting ID_AA64PFR0.RAS.


r~

