Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDDA106ACEF
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Mar 2026 22:48:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0ooN-0002fA-JL; Thu, 12 Mar 2026 18:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w0ooD-0002Za-9p
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 18:47:13 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w0ooB-0003Zf-Ab
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 18:47:12 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-82a07738118so873318b3a.0
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 15:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773355630; x=1773960430; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P4R+PfrpTL44BdQWmTJI+2BTLyEiS96HpVxYoD8sVcg=;
 b=PYSQLBZFIZOV17TPOGEVo9odIFTBddu4Wm8j2HmZLlGlv1VD6sDmWA7HaXUbs1EBr3
 gvtILFzY5x/wQbOiAa4hMJrk+7fwmfY/Psld7CcAs38odKzUzPy404tHWgFMKPqgNIm7
 E2QuFGDd102rE6755xXMDDcK56AXYVN+Fiio+5TDGSpx2kQddWO2Z4lI68kJKYqEgNdh
 d3DNwqHyxvbbOR9kDiQ8864/tmQomqxunk3R+p6O0XHkiLfrVsOOJUsBSvK5ls3KoCK6
 uE7f9EbMZKhacr6OKBulADn1KAiBpU4Xt9qF8d/6uEbeLpyWc5l8LGTrrkRXCKAzd00G
 kQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773355630; x=1773960430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P4R+PfrpTL44BdQWmTJI+2BTLyEiS96HpVxYoD8sVcg=;
 b=MTMLY5rRbcKYu3Y8cFUDFQLQeJtKx7AhL3Ydzb5Rkx7vANzbsmrKP3oXjQXDlTq+1n
 x6sz6tKNIZjOPh9ugaj4PmeGRJbzmjQMlZcnk7YuA2juAoib+jS7VuG2VSqKgyqgZgnY
 ll4bQ2D0UlMV9EU9IXA8pXB2iuPcAuED6sJlXZNVhSaPKnBUtnqT166WzpSd2yVjxAWn
 CwQwCiQzzv2TCJSFOoaSeqeJusAd/jmmSzw9J3bAdWgELfBcksXTOTx1Pz2j9GNdVBRD
 MUSbhmdD0Ykz744XNJgfmYJwdtIu7e3YpcmJHK80KUeVktbP42vcfxJhpff456Y+dhgN
 yGcA==
X-Gm-Message-State: AOJu0YyRG03ngXrZ8QqFl382wOFFMOSgevGWoigyi76XyjD9vWFspfKe
 vRcDaIbBWTjVv7QXMIVt0aEcxCEjtcNjPeDJb2i2qz0WsCs0JCfvgCrXzHWEijd2Hq8JTMyoEPF
 0YIM/rsw=
X-Gm-Gg: ATEYQzybAgzOLeHxxgPi5BhcVCMXEAIIFYXo4OpA4lMtfP0D10Wy27VepXtYbk3l5iA
 rCFSKumHAnW5HKIftMJQHl8UKGil4bR1chFYHZ/9U7MrYQYiyJ8kHlfbDrKT0NeiAAMshHiyRPf
 XtiXWZf+T6DmleI3o1mx3gaYKlQsSTSSVyIIxVEAKD8IxGsbD9FsN6pyFsLvPJgW/3TonGcKpDT
 P9K5C05HSZmCV2Zt3I2dmLHfTKDnzBRuefZJLBVPYzgN9hNGWxOiz/W5fhSkyEHywmNm6CbZKG9
 oyGLLRwuMyki8b8qozbZ8+CrXJr1Chnh4cS7NipM7zce9ald31OZOix3EbYzQkRI3PaBueOqVmC
 wiURgnj5RiA8h0Sw7CY5lTAyexAaJrqz5XYFAnq+yI02L/+JJdMyu+dQ2zUHuukrsPIFXvnJ40K
 Wd6mg7LAHMT/zwcq6lmYXQTjYIrDjV009CbfkOGcSlfcS0ojfY2zxBmAF7yS6ZeP8guOboPjG8+
 fa2
X-Received: by 2002:a05:6a00:1c9c:b0:81f:50ea:5d96 with SMTP id
 d2e1a72fcca58-82a19701820mr929747b3a.18.1773355629849; 
 Thu, 12 Mar 2026 15:47:09 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82a0725be23sm3992698b3a.15.2026.03.12.15.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 15:47:09 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 philmd@linaro.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 1/2] target/arm/cpu.h: restrict cpu-defs.h to target specific
 code
Date: Thu, 12 Mar 2026 15:47:01 -0700
Message-ID: <20260312224702.1608408-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312224702.1608408-1-pierrick.bouvier@linaro.org>
References: <20260312224702.1608408-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42d.google.com
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

Allow to use this header from common code, which we do in next commit.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 657ff4ab20b..b8042f65bb4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -25,7 +25,9 @@
 #include "hw/core/registerfields.h"
 #include "cpu-qom.h"
 #include "exec/cpu-common.h"
+#ifdef COMPILING_PER_TARGET
 #include "exec/cpu-defs.h"
+#endif
 #include "exec/cpu-interrupt.h"
 #include "exec/gdbstub.h"
 #include "exec/page-protection.h"
-- 
2.47.3


