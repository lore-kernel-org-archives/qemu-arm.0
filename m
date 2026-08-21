Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE883C5DF87
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 11:42:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxNd3-00011w-V0; Fri, 21 Aug 2026 07:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxNd1-000112-VO
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 07:41:43 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxNcz-0000T9-OV
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 07:41:43 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-499b2981a7bso9751545e9.3
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 04:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787312500; x=1787917300; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=upTdKsMlqEl4z/2IvDUxBIfujT7J8Jlu0FB1+sSl9SE=;
 b=i6igQdap/kIW13ArKcsCRGVUGhPSdTyuLPTjxsBfckZsZZV5NgKZIuZXzSwbP6NNc5
 0eykX0OfFs55oxvy2gYz8UCSIk062TPBickY0b74o3ljFg7Q2s1u7ojTIy8u1Fqd0Di2
 SEFxeWQZYFamCHrRe/z5dzGwsYokbao9nManOrXDL569R5BzOWFNYyE79vTsK5pMBjMB
 2Jp1PCg3itdZigv9/J0K4kQfUe9FECLU5zc4QZhkWqNZkUlveS75XcdfWyg9qSJH5s8j
 zI7EM947S30p1TzHZEuAuRltZijvpYehpxA3dHLp5eMVTxXsKvD8GiidLBTZbGgcqU8N
 IgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787312500; x=1787917300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=upTdKsMlqEl4z/2IvDUxBIfujT7J8Jlu0FB1+sSl9SE=;
 b=NEb7zFW7xJX2XB19o6ZnrC/x7+qHNZNCFpLKdiRnygH2Sou07U6or+FZPVTk0EiFxg
 Uhp0EOokEjnfrxjNG02UEtkqgMOszuybuidZEE+CU4SJ12RXoZ6H9guy9bIL56+wjgzP
 jcn0+3qw7RDCDkuhRAgSxWMM7t9CCCs2xeQtYTUKF7dasCV9OLVGto/XfCOwfItTFRK6
 yIArhF+K2DCnpoeOj4EW4QUXXiTWySVs3ZEZtSf4Tk+qglGFdjTGNWBwbPGvArU/XgoZ
 9KNCrBPCMpmclBIEAbC4qv3kif4pTR2L88OkI8D54DhTQK7mrWgSJj2gKwXLiPR2SQoF
 D6TQ==
X-Gm-Message-State: AOJu0YwK86j8rTtph9VvXrgIIDVqZlOXsn90nXHlg956JTYfXCnpCVxu
 7ZyPSqkNnhkUsO8PJnoe3Y2Hc1lw1CsQ/74o0c8QUYyBEPy6XPKu0nrysI2E06nVZVmdGcZKEtL
 xfhbk
X-Gm-Gg: AR+sD12P1vfTqw7jkf9LszKPO7/wsaIchBHSZ04oSOh++GdQspEh9Hjj2paBxwBAYOW
 81TIBOXzapNA6OXogZcVCFhV3KpeGuQ3mOpOCfaH1qWRgB+RfagoehHgqWTZmBkLWXa6Yr0MMi+
 9ILYT21Asoz2qHSw2aFFqT+zPzAmZy0rqKfNmBD4OuGQPqBXHOqbomjvxXp7qMS0CJOZ4EzdjAL
 XzE2ACRzBm2P5/RSD1uPuJ0eEpEfytGgxEqPWy5QRksn5VmugVyeJFKSSa/vZXatvSnrd+AJ+ey
 BPyN9wGH6AGw+s+lgt+TbGwh6Xr++9BBPnkfa/HDnYzxq2rYqFa+q03rMQg3ycjwzMYjbb7ykIQ
 THZwAfvgfyReyis/lgl6Jjdc33aG2JWNk73OtPqeomakhwwPXbviwliOsWmJrbhbdjSuRdMUzd0
 7IE6pmX72quQ14bx3dRHuzA7hiliugfDHILqEpmx1b8Dh9l6lSF3ESoxAM63FE3tB7lXqvPBG9y
 RMZCW2hroUTZoW1RhTpD7pTbgnL51MKLv1PPIPklLdUv3Ker/uTuOLqNEV/JWLZJNP16Q==
X-Received: by 2002:a05:600c:e549:20b0:499:b65e:49c9 with SMTP id
 5b1f17b1804b1-499b8343decmr66361255e9.10.1787312499780; 
 Fri, 21 Aug 2026 04:41:39 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b90d67bfsm24393725e9.3.2026.08.21.04.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 04:41:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2] target/arm: Correct reset value of SCTLR for arm926,
 arm1026
Date: Fri, 21 Aug 2026 12:41:38 +0100
Message-ID: <20260821114138.4068582-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

For the arm926 CPU we reset the SCTLR to 0x00090078.  This is not the
value specified in the ARM926EJ-S TRM (ARM DDI 0198E), which states
that bits 16 and 18 are SBO, bit 17 is SBZ, and bits [31:19] are SBZ.
It's also not the value seen on real hardware.

Similarly, for the arm1026 we use the same SCTLR reset value but
the TRM says that bits 18 and 16 are the SBO ones.

This has been wrong in QEMU since 2007 when we first started actively
resetting the SCTLR to some fixed value rather than zero.

This wrong value didn't affect any of QEMU's behaviour, because we
don't implement any handling of the old pre-v6 meanings of these bits
(which were IMPDEF), and their v8 reuse is guarded by appropriate
version checks.

Correct the reset values to 0x00050078 (i.e set bit 18 and not 19).

Cc: qemu-stable@nongnu.org
Fixes: 610c3c8afd99f4f11 ("Reset ARM cp15.c1_sys to default values. Fix XScale cp15 accesses.")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4202
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v2: fix arm1026 as well, since RTH found its TRM
---
 target/arm/tcg/cpu32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 8220d785f5b..c49265e673c 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -33,7 +33,7 @@ static void arm926_initfn(Object *obj)
     cpu->midr = 0x41069265;
     cpu->reset_fpsid = 0x41011090;
     cpu->ctr = 0x1dd20d2;
-    cpu->reset_sctlr = 0x00090078;
+    cpu->reset_sctlr = 0x00050078;
 
     /*
      * ARMv5 does not have the ID_ISAR registers, but we can still
@@ -74,7 +74,7 @@ static void arm1026_initfn(Object *obj)
     cpu->midr = 0x4106a262;
     cpu->reset_fpsid = 0x410110a0;
     cpu->ctr = 0x1dd20d2;
-    cpu->reset_sctlr = 0x00090078;
+    cpu->reset_sctlr = 0x00050078;
     cpu->reset_auxcr = 1;
 
     /*
-- 
2.43.0


