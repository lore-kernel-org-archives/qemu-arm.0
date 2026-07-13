Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B0EC44507
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 23:04:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjPfm-000645-K2; Mon, 13 Jul 2026 19:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjPfl-00063I-EX
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 19:02:49 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjPfj-0005lp-RK
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 19:02:49 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2c7c61b5292so4446785ad.0
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 16:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783983766; x=1784588566; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=N9vaunpGtCu85rFgK3ivuUDYGAyeCp+q4K8EoUFSa34=;
 b=eNiaPspwZhpaPLQ+qb8i72DivjRd1F9RSUb2NLUtp4GifxW+0XOghnHXEVR/y/JK7o
 /+ZaxF5Mr1tQL+btK9SblVKOPv7kMqDDtq+JEL9NbLR0uhcXf5WvLo+E4h6vSSNlznaE
 BCIkp/ARBlW6t23aoySkYCO5Tz5YRAOUaRU6qEKoSa/yEw/caoGv6iHvGeCZWtF96U3w
 KlNa+18xTQ031bc5k7uPGUCs0vldg+P/Oh+NJdaQA4oXb1aUeV6SmoSZJRRGK0pK97f8
 0rT9vO1VHQLFi2bomYqrNlhO/iA15tbM4HfeHxo5wEGkoNIFHsEZQ863EHrqbvLEXmai
 MLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783983766; x=1784588566;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=N9vaunpGtCu85rFgK3ivuUDYGAyeCp+q4K8EoUFSa34=;
 b=Dtmwz86DC1WQ97NgTG9SdJlKF6qxL5Fyll+ubPpZk/Eoe1ppTa4vngSwdgcU8FrsYf
 TfjD0hIp87wAuAAFGBRWMif9SB8HJdsswTx88jpzBjmaymUaG6U9eboYRIqFgHt9c9qh
 haSD7rBG5L2Gl1CC4utfe/yqkF1NHJNwofcbQ5gVpFdE5aM8GXtSdLAxJAegmuCO8gBY
 jETzjkoZyhC8C+v/BchRQfftP5au2hUa9qxFg66C/36rCn8oFxiW38dBUn4zvayO6Fbd
 ksbBo2qLH7TUHsehy2oLqRiAGaKqEf5M8iCa+X+ovr/m4/Li1UZYqtTiTjyNpkRzxrZ/
 9Qig==
X-Gm-Message-State: AOJu0YxsIaDWsMJ0loLvDkU9mPn04ihHd6FWHrB2tGZ7GiMUkK3DlNOC
 Q6eEunhojfChayGXBwk/hjBvezprEFXLMiYyXFkmYwowzX+A3FOwXYBrbmFbkKoMATUp5gP4nqN
 q8Cay
X-Gm-Gg: AfdE7clfLKCnNxz6UHHUOzsR8HRmbvrMMQ590ZCJ6FlJcXModJ1jVNEMucGePY2Vm0F
 b54Xvujq7o3c/ManHSrhqUub+tM0K7CSuQuh/HPosaPQsRl9f9zhg5p7b/hmWqB4C9zRkHEc9zk
 B8meH5g9IKjP+fN1fXA05O+5Unibeu0R3TT5tAq5fC2CLCeu0hBIMJJuPxC+weIqOGJdiLfN1d1
 FCsPAZQt/uRp/lZ5DCrabEf6/pG+uLxx4Y9q/YB1VmZeo4sJ3lQJPN6Gwsz4eDf0BugelHA9hIx
 CE2CWsbm3MkSEhfUm9qlsXTq25q25WCDMUskFNWUMmKYB5DRRQ3E+fCV02L7jf+3/xzJVPi+bnO
 FniNNP9fr6Uc6cJti8u3tMsl8XcUUxW7I0p+CNRe4HjPaDyU0hPyyOA66Joa6v2LQOGm5QOvpjF
 YBh7stb0pb/FB6rzIjOA==
X-Received: by 2002:a17:903:8cd:b0:2c1:98b7:ecf3 with SMTP id
 d9443c01a7336-2ce9ec0f0bfmr98918315ad.23.1783983765604; 
 Mon, 13 Jul 2026 16:02:45 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bf8e9csm106902965ad.24.2026.07.13.16.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 16:02:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-11.2 00/10] target/arm: Implement FEAT_SME_TMOP
Date: Mon, 13 Jul 2026 16:02:34 -0700
Message-ID: <20260713230244.70174-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Another SME2.1 extension that becomes mandatory with SME2.2.

I reused the little helpers that I created for FEAT_SME_MOP4
without renaming them to something more generic.  I hope that
isn't too confusing.


r~


Richard Henderson (10):
  target/arm: Implement FTMOPA (non-widening, FP32)
  target/arm: Implement FTMOPA (non-widening, FP16)
  target/arm: Implement BFTMOPA (non-widening)
  target/arm: Implement BFTMOPA (widening)
  target/arm: Implement FTMOPA (widening, 2-way, FP16 to FP32)
  target/arm: Implement FTMOPA (widening, 2-way, FP8 to FP16)
  target/arm: Implement FTMOPA (widening, 4-way, FP8 to FP32)
  target/arm: Implement [SU]TMOPA (2-way)
  target/arm: Implement {S,SU,US,U}TMOPA (4-way)
  target/arm: Enable FEAT_SME_TMOP for -cpu max

 target/arm/cpu-features.h        |  25 ++++
 target/arm/tcg/helper-fp8-defs.h |   3 +
 target/arm/tcg/helper-sme-defs.h |  15 +++
 target/arm/tcg/vec_internal.h    |   7 ++
 linux-user/aarch64/elfload.c     |   1 +
 target/arm/tcg/cpu64.c           |   3 +-
 target/arm/tcg/fp8_helper.c      |  50 ++++++++
 target/arm/tcg/sme_helper.c      | 191 +++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c   |  79 +++++++++++++
 docs/system/arm/emulation.rst    |   1 +
 target/arm/tcg/sme.decode        |  28 +++++
 11 files changed, 402 insertions(+), 1 deletion(-)

-- 
2.43.0


