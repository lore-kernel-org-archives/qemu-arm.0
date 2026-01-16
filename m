Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E091C982F2
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Jan 2026 18:59:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgp28-0001LK-B9; Fri, 16 Jan 2026 13:58:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vgp27-0001Ky-CJ
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 13:58:55 -0500
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vgp25-0000m8-WE
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 13:58:55 -0500
Received: by mail-dy1-x1332.google.com with SMTP id
 5a478bee46e88-2b6bb644e8eso1792818eec.1
 for <qemu-arm@nongnu.org>; Fri, 16 Jan 2026 10:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768589932; x=1769194732; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u5CoiFBlvwlDochbDx17D2JnG16QHyDmaOCgHopwzx4=;
 b=QrT5/RIp0o5npbeEtyF+6jrbIt+rpG3IoyNUt7Mx4Ek5dqK8syCfWvKakc2f58kcdW
 IM0cgrL5+Lrv7xPm1od/1BPWYQ4gX7Yr6/U7aJ1QD1ZzbiOEa0hy688JsETOf+THBRQj
 wFXDc9x+1H0RO8G3xuzVfeD9MHUcLSoFYlKZQonlNxFLSUNNtAS0iJYT9JQvDLLv3wIQ
 u/MgpI699iKH33kC1dmofQ6xNQE7ME92KL6807U9j+eft77tTT5FbIqMh08QUBlkKyEH
 u6KLZWVE9L2ye0xsBhovaWO2bAJIXc4u3ACLZNz7z2lXZj3jFmKBpRZzVyAbX9BvUyj7
 OrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768589932; x=1769194732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u5CoiFBlvwlDochbDx17D2JnG16QHyDmaOCgHopwzx4=;
 b=YrtISp6nwxoHcEaGdsq24TCDjgDAVb/EQQ3bg/WW3c51j+9OVzTNaZuY8lrPn5dVDY
 Elhm++Imtlx58aEOzLw18UIryujf1OJY1jPxgp3Qi5mBBJDYHxcbeNXrWtuXi9NTK4gf
 hCxnCKC8hF4pFl2054Z4L+P1Tp/3lD60YAL/d6ruCuPJXw/P3dfuMBPNgPxUV/o0m1IC
 joD0uH7d/BzSDRfMH9/J3oZCDVjvsF4AAPJ6SLV3qmSsMuPzw2k7Zn0MR6CqlrsQKo5o
 avZpMUJvwQYNSGIboCTAR8uUFzLTWWexaeICo59MVgr/DKzilFXOMFHp7cHWrBxyMNSW
 EMsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrOEMSyfQiLX80uQwbl7XmOVFR6dCEAsRMHoF1GJRZdQtIo5RP7yXb/gkbcyci0nxR6QERJbcOVA==@nongnu.org
X-Gm-Message-State: AOJu0YzuhKCNbYjCL3ragj3KH/NaMNZBGXBU6s+gaDNPsJekw837LXBx
 eB/P8cg9GAaP3QWEmW4KbnjAFdb0CR3IVadqwyjYpqgD020dYHMqircblngeJuvlPX0=
X-Gm-Gg: AY/fxX7bEMm/wIWk/7s7Y5VrqtUka6PvgHLKK/xVsWStSGGYDG4+qr9Sy7ByOtenBcl
 UoIu8ADryXFKqM+v7ZnO1Qb5bP+ByqcVezvLBKni7RdA3xzm4B3RT856Y3yY80WWwmkNHypK0Jr
 POXPFZnQkl2CHEnOeNocmEsBZfIsu2LPTWXxtLiJJBIp+t2wErrocqX78uvF5S/r3InkiD9h2lv
 /C3CYHAEb+NoMug7wJwWbBx1AHPdAAE9prQ3DD++Oy8YbqkAKcih3jboGrp0QpCTzkoj0w7sKZy
 JJu45UiD9wrJJZ14vqDzE8rShoFTJc+ZuN0cVsCJ5e8VOgRBKxhP9GnTC5NF3zfstHizE3cOydf
 mLlvjbS4Mpd+XrPWUL87q8LF1b3eULt+jBFeECAahhpSpAH/vhd538b3gnW35uvJsPGDXuGuRIu
 568XuSwu2hYoqewg==
X-Received: by 2002:a05:7300:a507:b0:2ae:5664:8110 with SMTP id
 5a478bee46e88-2b6b414aba3mr2680126eec.38.1768589931831; 
 Fri, 16 Jan 2026 10:58:51 -0800 (PST)
Received: from gromero0.. ([191.8.214.17]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6c2de1f29sm1524126eec.15.2026.01.16.10.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 10:58:51 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org, peter.maydell@linaro.org
Cc: gustavo.romero@linaro.org
Subject: [PATCH v4 3/4] target/arm: Add a _MAX sentinel to ARMASIdx enum
Date: Fri, 16 Jan 2026 15:58:13 -0300
Message-Id: <20260116185814.108560-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116185814.108560-1-gustavo.romero@linaro.org>
References: <20260116185814.108560-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1332;
 envelope-from=gustavo.romero@linaro.org; helo=mail-dy1-x1332.google.com
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

Add a sentinel to the ARMASIdx enum so it can be used to compute the
total number of address spaces supported by the arch.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9579d43ba3..31afd80854 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2336,6 +2336,7 @@ typedef enum ARMASIdx {
     ARMASIdx_S = 1,
     ARMASIdx_TagNS = 2,
     ARMASIdx_TagS = 3,
+    ARMASIdx_MAX = ARMASIdx_TagS
 } ARMASIdx;
 
 static inline ARMMMUIdx arm_space_to_phys(ARMSecuritySpace space)
-- 
2.34.1


