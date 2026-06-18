Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C262FCD98F9
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 04:16:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa4A4-0005TZ-0r; Thu, 18 Jun 2026 00:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa4A1-0005SL-Fp
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:15:26 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa49z-0005ZX-85
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:15:25 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2c6dadfbaafso5529865ad.3
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 21:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781756121; x=1782360921; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XVAMupBOJkNA80/6RDyqkDvmnjbTdkZvhYWDGSKfQ6Y=;
 b=V8jXBLEjgTKapOx2wUPAAxsPU7AluMCVQDxZXDP4SBllCttsVhYYjvCUoRi8RvCp20
 xBq93w2clWZlmLFqRniwlS2ULkqwO9/X1HFAHYD4IYEvK8tM8UF5H35ehHd0si23Ao3I
 8Iuib60PWUxS59VKAcDtG2KlWu9OrzhilhlnZpK9iygv8r0Gx7wEShTiB1PlHJ3kHsEy
 PMZRoNYwiZBNGPRDVMgan/9Qx3EuhYSZtE5XvD8NCtRoFV+NF69wz4yeyo+kNOx9ffN2
 QeqafqxGWOJIR7C82A4d39ZpRsSzVQPSd6IOhQVa+lIOsalzE5GAHlfUjnvgWbS3JrkW
 jcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781756121; x=1782360921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVAMupBOJkNA80/6RDyqkDvmnjbTdkZvhYWDGSKfQ6Y=;
 b=subqldVSS+vcl+QoCw0vr3HTdYTDnEiHVXsqdcml2baVE9jlVSl5VcW9ovTcZ6QycE
 zNdm9ZASeazJmE0TgQvBJ1Ht6NAUygHfAndGdqx5WZwlrhR3eLSZXiC9iyJtM/NdfTrV
 pEyERwe6u+y0wwEvDdy7Mo9NBQaoGshs/j88rl4UqySGgnYwuZ5DTtMLkrifHBcH5O9P
 0NhErirpeY4nA/ieJYpLZaAC4rAWQaGLgD1lj0jIxwfyX/aYgVMqtHGDC2A+vNUxHvWs
 W3DXzUz2sUhs3PexEtq7HSHnJVsPV/1cWRAHGDbS2F0z0/Wp6wEXprFzTytJYtMYwRdx
 VKNg==
X-Gm-Message-State: AOJu0Yztvzr9QAzCywA+qgi3kztZhHTX7A6qYoirSFxGTnPEkHbmr+wE
 MPEdRVMaa2zzrzel/stnsCOVEF8/j8rSd3MYOqTnIXXEpY6EXqKnZWR2n44lTgzPXW4=
X-Gm-Gg: AfdE7cn+aXwFitVFo5dXOiz1F9QQDHmvoNWjv8KqTD73IHe0IO5LZF9VrPgdrXjYmr5
 fPhdeMsuMlPbDDPUswDOu42XC/1/peHHo/Bkz7MQ71I9fx9W/HNbn3QqN/kDULiOXr6Lb/GE8t4
 2ciMCR5AnNFxv5NA+PECVDC6LhuE68OrhnVDqAjU4DPbNgmu8mqMhvbkLW4oTY6b8jWgvDex6FT
 vI1zpvInF626A+tmcRr+bY7jigsVID9ItCmy036DZjRP4F6E8YRsaiHjxnEnwvoZ7MltYZnAfs8
 DQZbU10AfMkhlTQovGCz2A1buKBwDDmJZxPuSBlGaAKTsVfjm42IL58VX44uMVLPT6aLpYvXNTE
 LftifE1aE7Y4pvSIWnJKs8QZojGzVwHTj1JZB0vfcAo/6SiHKI4GIpfuR9Bpey3UO5gzjrsPUnu
 MQrqNBAU2IBRs5iqJ6fkizkodvjHzEJp/mSG0gMmetxo4J75K3FXRM+jgJLhXQ
X-Received: by 2002:a17:902:ced0:b0:2c2:27be:39a8 with SMTP id
 d9443c01a7336-2c6e52a0c48mr18322755ad.31.1781756120464; 
 Wed, 17 Jun 2026 21:15:20 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c42f2e535csm173905935ad.6.2026.06.17.21.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 21:15:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/10] Implement FEAT_SME_F8F32
Date: Wed, 17 Jun 2026 21:15:07 -0700
Message-ID: <20260618041517.573469-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Based-on: 20260618040718.572950-1-richard.henderson@linaro.org
("[PATCH v2 0/8] target/arm: Implement FEAT_SVE2p2")

This is (kinda-sorta) a prerequisite for (parts of) FEAT_SME_MOP4,
which is a prerequisite for FEAT_SME2p2.  It's fairly easy because
it's mostly re-using helpers from previous FP8 features.


r~


Richard Henderson (10):
  target/arm: Move tile_vslice_{index,offset} to vec_internal.h
  target/arm: Implement FMOPA (widening, 4-way fp8 to fp32)
  target/arm: Implement FMLALL (multiple and single vector)
  target/arm: Implement FMLALL (multiple vector)
  target/arm: Implement FMLALL (multiple and indexed vector)
  target/arm: Implement FDOT (multiple and single vector)
  target/arm: Implement FDOT (multiple vector)
  target/arm: Implement FDOT (multiple and indexed vector)
  target/arm: Implement FVDOTB, FVDOTT
  target/arm: Enable FEAT_SME_F8F32 for -cpu max

 target/arm/cpu-features.h        |  5 ++
 target/arm/tcg/helper-fp8-defs.h |  4 ++
 target/arm/tcg/vec_internal.h    | 31 +++++++++++
 linux-user/aarch64/elfload.c     |  1 +
 target/arm/tcg/cpu64.c           |  1 +
 target/arm/tcg/fp8_helper.c      | 58 +++++++++++++++++++
 target/arm/tcg/sme_helper.c      | 33 -----------
 target/arm/tcg/translate-sme.c   | 96 ++++++++++++++++++++++++++++++++
 docs/system/arm/emulation.rst    |  1 +
 target/arm/tcg/sme.decode        | 29 ++++++++++
 10 files changed, 226 insertions(+), 33 deletions(-)

-- 
2.43.0


