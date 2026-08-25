Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B292C61DBD
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 12:18:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyq6q-00020s-Lt; Tue, 25 Aug 2026 08:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wyq6o-00020X-Ic
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 08:18:30 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wyq6n-000562-0R
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 08:18:30 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-47f7027ca11so2376036f8f.3
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 05:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787660307; x=1788265107; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=DT4QrbFI3IsncY1zCuQdV9ZdCP1rmNgzkzyyROTMyFU=;
 b=Dayewew+q3ou4qPKILef6LqtzHEdWYjCfIuMyAJYMCit4uit5QS7QkbmMtctNGdM4n
 NJJ0s4pERhBSqz9uhQODGDL3A6VAxXCg1cvjauggRmCnNT7x+7cBMFbJwxb8QHXJGk6K
 cc6jH0kU8u8Rce9YhRrGWhkXuIwQdfZW5rj4lBrwMLUSaFpwEeU74Bol//HotvfIOO4L
 NnNnAmAwkDAUKSwcrpsDClozY+OZgGeQYdku4gaKFXVcLuiXWLpijFKx8N2bTQmcodSU
 j13Zsvh4k/gKxz3xYlEh2EETBUYLaMevCnT8FWYIyvu42P/NJ9cytnizdoRDSwmBj+3B
 dSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787660307; x=1788265107;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DT4QrbFI3IsncY1zCuQdV9ZdCP1rmNgzkzyyROTMyFU=;
 b=eq/4uKk+PI+K6iF0M4OkU9LxKZ/VhDSNRCqta9NcoKIEEdTesxVrCu3LpTzDVyuawq
 DP/9kNX8DnnNLZZiXdvYbrCVP3Qp8Yc8Gewqj1bv9ztYHqqFLB3uCKVf4//PHDRz7MCE
 he42dbS/lP1dsfOpsC7ZyVc3Ljr0NsM5zQB0YaLqaImSvld85cpJ3kxC0FQoFveLeuSX
 tK1T6X4iUsIOCaAY9MItcnzuJx6CfIK9TlXLoNwXgrsiKjrVXER9nEFYWZFg1csM2k/K
 lsJp7QwtRi6PJXWZQPFxK3A59RE1IooJnm/v9yGX/tTik2QeRpgYnDcxhSu/S9xAUdPE
 tsMQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrJgDdsQA8PBh3GAgl+QI3DnCWRB2zvogpWAlunIULDixCXo8AUCggPocJ3onr1D4q9M/uHGPwuuw==@nongnu.org
X-Gm-Message-State: AFuF++k2FMY0tjzLWShPRfcgAZFZI1vR3W/i/kytvmJTgv9/0PUSRv+s
 bZaBhXV1kKLStNVsMLVrcaTdkKV03R79kcx1N2Bkq2LjSXFXmaR3MHJ8lmttiZP/g00=
X-Gm-Gg: AR+sD12RZam6hOJi24UHynHCO5NriZ6ScGFQmMoGq2wY7lWcC2StxYnJxkM1Gx5w8QF
 CS/Pkyv1H7VlfRwT335adX9M7L3yN50V5zfT1LWaYCcYGOl5sb+XO90g4KqtfqiDjJzZgQlr0ld
 jrJfofCyq+iU9ctAd6TnXQpI2CIInL5Lq5fHXXK+rBlJqi4+ODdIO9DTIl/HXBESuSE7OEkglOv
 CGLsXM2cujAY/sGeJ+feIHErDHddPE1M5fF4NqFSBtg3VhST4nmz6J8ajOSVBphCJTbfo9aJS8w
 syCfkCPQNaIQ/J1RBMsj6UAxz6m1iQ0+D22dzYg4qawFAiYBxyJ9HgvIY975uD4+o8tRqgVi0Ey
 Us8NJrdKgOevX2ZsTdPFScFTkiha/792P8ZpjncVQ7NapQMYW18jrLeSq6TmTuSD97onmy0HxZe
 W1ouBrCFqiAWlwwFI11dwlsVVYtLEPTG77cqNWtO0xPQ0vSyu4KUymI0qtQSlQeahLjnfrzZse
X-Received: by 2002:a05:600c:3e0b:b0:499:84fe:5f3e with SMTP id
 5b1f17b1804b1-499d656bb33mr70263465e9.9.1787660306775; 
 Tue, 25 Aug 2026 05:18:26 -0700 (PDT)
Received: from linaro.org ([2a10:d582:31e:0:8679:ff59:1b3a:5e93])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499d5d64ffdsm21677175e9.2.2026.08.25.05.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 05:18:26 -0700 (PDT)
Date: Tue, 25 Aug 2026 13:18:23 +0100
From: Jim MacArthur <jim.macarthur@linaro.org>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>
Subject: Re: [RFC v5 22/28] hw/arm/smmuv3: Harden security checks in MMIO
 handlers
Message-ID: <ao2ID_3urG4gejDH@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162624.2809349-2-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813162624.2809349-2-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x433.google.com
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

On Fri, Aug 14, 2026 at 12:26:21AM +0800, Tao Tang wrote:
> This patch hardens the security validation within the main MMIO
> dispatcher functions (smmu_read_mmio and smmu_write_mmio).
> 
> First, accesses to the Secure register space are gated by whether
> SECURE_IMPL is enabled. When it is disabled, all SMMU_S_* registers are
> read-as-zero and write-ignored.
> 
> Second, the check for the input stream's security is made more robust.
> It now validates not only the legacy MemTxAttrs.secure bit, but also
> the .space field. This improves compatibility with Arm security space
> handling.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/arm/smmuv3.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 

Reviewed-by: Jim MacArthur <jim.macarthur@linaro.org>

