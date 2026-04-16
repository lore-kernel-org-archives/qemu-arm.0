Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E62F8A161
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Apr 2026 11:13:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDKeX-0005pa-Gf; Thu, 16 Apr 2026 07:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wDKeV-0005od-OO
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 07:12:55 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wDKeU-0004Bn-5x
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 07:12:55 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43cfde3c3f3so8005213f8f.3
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 04:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776337972; x=1776942772; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VN+jDUrX4GWZ+biVA/W5Cql4Uc3y2Sb/xOJTXeGdJ6Q=;
 b=JciiVvc88SmcNUjMVEUL1deno5IFTlj57VgJ1rG2ad82XVadLczdd1kEC5C+35fU55
 gzzzYe5fg8y6RsE2hkBS2KWzzS5eGssQo4wu/YiDZsa7YuuzA8xpzyj5v6Er1Y1ZbpZT
 Lkdz4clwyyQ+omIHYmac2B4KdruRIc3Lw1ImYdQpXy9SpumyWBaz/ajw+Mf8w8hbDWoR
 T6nX3oF7F7hcFEaDNX1bQbqBZQZBDVlZtOBRGyjEHoya99gRPc+HUoYPo+498iJLq1pK
 +B9KZ52sBjoGfWgPZagETLToTA8WaRYuej4R3az+BVwZKSdkrdGtE8u3Xd+YHn81GiOb
 wuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776337972; x=1776942772;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VN+jDUrX4GWZ+biVA/W5Cql4Uc3y2Sb/xOJTXeGdJ6Q=;
 b=oYBAw2K/3inCBNHO1psZbKk1nGRmW8DLgkw+Z77OhkOggNLfLfk7UO7l5FztrPgicD
 oQU941sKa7bjVEtPJ68D8t8HtRPc3YoKR0PTW9EMoXJfcDpvt70J4MPxadSfse0GEDnT
 4u0LbXvysOSP7Z48+VXqIxcK14fKIBMORlUYfd0J3oI3hOZlP3tTfPFvSbIskuZ+8oHB
 hJ2KqE/fU4/nLeczWvnOI6hVPsS/gOE5WBLyhRB0lQihzAfijsXVi/HZ8iFXcWQBxVtr
 fFQd0fgJKAOSw5QONXBjamdKUI4Y6nrzIiU9t6sywcsKzTApdnlntBkInMHjUceYJSNg
 k01g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9emfSZfpZC/RUOHiKyZSz78fCVWxZJU8gjUPXcBgLAMXKVtw+ha2DyxRbyOoB3KT7iEI1Unug8vw==@nongnu.org
X-Gm-Message-State: AOJu0YxiQ6Hww0ESUWakoaIQvZKdgSDwz+4+kiMJ0I/ujvfPJNTQfYo1
 xG6OW+S0jcuj9MVciA7r3H0zyM8rL0trw2R1INmuuReONC13om84Sr2y2d48eNpUVEqUVDdD646
 /OTb0
X-Gm-Gg: AeBDietVdrUrrLwsDR7JeKsV8MlGav/LAozBRC8G8S89t6tIBjOxiPQ2a566ae/8oJ7
 xSyBHU9p6/nh9om02PL7RmALXNofkxQRwMTA9hgnXkENFsbR1BAxWjXTh6+JkBxrtflcba5exqG
 AXD/6zA29lXLGXku+sV+0CmvzmNq6bqV5XSVJpNrelrBCsKJ63GG8BH1S/sjXrZ8UuIT1jQCAsD
 skQPducd3XIcJ8yQMpyQfhIXaCZZhLDh7PEcMjWpKjDtt8DCjtLTQYp68dsvvG5+rIww9r4zZvH
 Efi+Xzxuvk7vp/deSqAbtUFPanogKgqfVlrscuwtxHY8uhYfCHOR6MpYIDQwKeLMmQySp1jBFH3
 fFZ4EZiAKWAJmsuqyDxlfUKBl29ZxMk82zvvBh37uEkFRrt+HtUEuavUojMS0exWWcR3+5R0K3O
 Kxjr81s3lCgExFSe/G/+qx7WmtAw9Pq2LTKm9L
X-Received: by 2002:a05:6000:1ac5:b0:439:b60a:b400 with SMTP id
 ffacd0b85a97d-43d642c8697mr38566918f8f.31.1776337972224; 
 Thu, 16 Apr 2026 04:12:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:8f74:d82:f9ec:90cd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead2decafsm11513078f8f.0.2026.04.16.04.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 04:12:51 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH 0/3] FEAT_RME_GDI initial work
Date: Thu, 16 Apr 2026 12:12:37 +0100
Message-Id: <20260416-jmac-feat_rme_gdi-v1-0-d9fa0781ed58@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACXE4GkC/x3MTQqAIBBA4avIrBNUQqGrRIg4Y03QDxoRSHdPW
 n6L9yoUykwFBlEh082Fj71BdwLiEvaZJGMzGGWs6rWV6xaiTBQunzfyM7J0Oho0iNY5Ba07MyV
 +/uc4ve8HVstyyWMAAAA=
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x42c.google.com
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

Adds FEAT_RME_GDI, some extra cases to arm_granule_protection_check,
and a very basic TCG test to check the prerequisites of FEAT_RME_GDI:
FEAT_RME and FEAT_RME_GPC2.

FEAT_RME_GDI is not enabled yet as no functional support has been
added; it can easily be enabled in cpu_arm_set_rme in future.

In the future we should correctly set bits in the fault address
registers such as PFAR_EL2, but I don't see any apparent support for
these in the existing GPT mechanism. Testing this also gets tricky as
I think this would have to be done from EL3 (e.g. by modifying
test_rme_virt.py)

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
Jim MacArthur (3):
      target/arm/cpu-features.c: Add RMEGDI to AA64MMFR4
      target/arm/ptw.c: Add two new spaces to the granule protection case
      tests/tcg/aarch64/system/rme_gdi.c: Very basic test of GDI

 target/arm/cpu-features.h          |  1 +
 target/arm/ptw.c                   |  5 ++++
 tests/tcg/aarch64/system/rme_gdi.c | 56 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)
---
base-commit: da6c4fe60fee30dd77267764d55b38af9cb89d4b
change-id: 20260416-jmac-feat_rme_gdi-71c2d2dd6770

Best regards,
-- 
Jim MacArthur <jim.macarthur@linaro.org>


