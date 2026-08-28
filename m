Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50959C61DB9
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Aug 2026 22:28:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x052L-0002tI-FR; Fri, 28 Aug 2026 18:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x052J-0002rK-C3
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:59 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x052F-0002Kg-3E
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:59 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2d715f4a587so21368635ad.2
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 15:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787956010; x=1788560810; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iAnGfAmlIa4zGWUxbLQOr6sCdCNjHw8VOXPeiP81wTw=;
 b=oWcDzdWaYbiJG7CxTiWQjVMVmbp8iRMnhlHLP5aYW+oz8tIw5SLZZzL9Ly/bNxfgDA
 o4uJOh2gzLICn1KRNTIZHKziCvNApdXa/o+ZjbcKGwuMBrBm6GN9+NSAyn6FdSLd8jd0
 2WNZH1q64iZQT/rwOQV586twa12Y3AVOU0IkXPEi7ei/nEBc+/dsX4RCeMFeFacO6iIE
 Mk4gtBg0eMwxP1RNl95Lf8ebCsI3q05Wvu/YDJCKAhS0Q/dOvIqi4e2SpLXsYytdf0KO
 MVCDMG8gqY/nIewOCq4RsMU7g6lalJ6i1MXzWbhsiUuiHxf465y/jxLcIJnx7K4i6T7D
 emJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787956010; x=1788560810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iAnGfAmlIa4zGWUxbLQOr6sCdCNjHw8VOXPeiP81wTw=;
 b=LE1sV9Ci9PR79LUC97UBe2VyimU91Yy23h/eZ79uvzIkf5+OOZDQnZwsv8oUrjhQTf
 QT3vLAdb3JMuOfyXfSJsdtxcrT44GdJzDOGkFqS/7Qb0Zamem+YMS2FYGdRIU6LfqeFx
 MSfJU69Vby1XdEopCJI5GCTsBreImzqAFht6bbbxEa7eISUd/GE6vjf2kuLVSvu8iGwM
 3+CD0hPooJ8b8RIM6S485jn5JBuGtf8ody0Bz4kxzVl8PR4BTUo9x03zGTo80ZrEaYrP
 PxqJiY4uy2hBzP3XyB9qroVj9KGi0UitAaSkvk3rD9WCEJEf8XHi51es4psjYBlGhpPr
 A9Qw==
X-Gm-Message-State: AFuF++kh3voTbgNlktrQVceNH75XpVmBVAYhIAuziiYvUHSK6DH20q45
 JX7UAl+867lwEFVJWyuRgwcV1aYaliyAKu1/3HPAaSjTIJDl1JKM9+G4G7/F2pnISPc=
X-Gm-Gg: AYBFou0BwMe2eEW1d8o76clml7eFeDQqQj171+dZUb5+8fH8OI8W8/wmfOojrkIl9Vp
 8kCCX1Fl7qvZWw2EpYbsu0jcrq9tnPVkgfrR92XrB0D7aN84ON5nm+sfJwOkNlv4Nkupzv7bSR4
 3mcr83cWtGKjJMulkkSqpo5Yh/U2QCEhoPlxNHRdsFhTFldcQy+O+QYyYtVe7yDu/HN5GMs/0qk
 wF2gTqE2NpCKxnzIgC6uMCMO89ay7IsSTNRw7fSLMAZZN2IfoHMLgIAWUB3zZ2szAYYkOZdhpQY
 Xf8kX4IxC53nXStYAafANQg3JOhuU/o1pepGS/H/7ZH1uItqWNG2zan3wt6pCpH0252iLim2KAj
 SzAfZXeiWVTZH61HjykOqdmMtDQ4ub8+e4L3hLnOYGVwpPPa4spNwyjBoY6O0fwY13eIco+DjdP
 8QTE1n83hahs2eIXNwiYxA1m/aUoZMs+Rn2HaP2ZFzIo/X41AGSCLtfZeVD0Ar9rmfn+C1UXB+C
 anOmp7SRIOfUwZZIr/shMYhGL/IHec=
X-Received: by 2002:a17:903:3d06:b0:2d8:d4cc:5baf with SMTP id
 d9443c01a7336-2d8d4cc5dcemr50529365ad.15.1787956010298; 
 Fri, 28 Aug 2026 15:26:50 -0700 (PDT)
Received: from stoup (71-212-39-143.tukw.qwest.net. [71.212.39.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d759640270sm9178355ad.34.2026.08.28.15.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 15:26:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 12/13] target/arm: Honor PSTATE.UINJ during translation
Date: Fri, 28 Aug 2026 15:26:38 -0700
Message-ID: <20260828222639.1432046-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828222639.1432046-1-richard.henderson@linaro.org>
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c |  8 ++++++++
 target/arm/tcg/translate.c     | 16 ++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 026a2a72d05..05741c94dd7 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -11168,6 +11168,14 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         gen_exception_insn(s, 0, EXCP_UDEF, syn_illegalstate());
         return;
     }
+    if (s->pstate_uinj) {
+        /*
+         * PSTATE.UINJ injected undefined instruction.
+         * Priority immediately after PSTATE.IL.
+         */
+        unallocated_encoding(s);
+        return;
+    }
 
     if (dc_isar_feature(aa64_bti, s)) {
         if (s->base.num_insns == 1) {
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 40929a6ef78..77391c5486c 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6125,6 +6125,14 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         gen_exception_insn(s, 0, EXCP_UDEF, syn_illegalstate());
         return;
     }
+    if (s->pstate_uinj) {
+        /*
+         * PSTATE.UINJ injected undefined instruction.
+         * Priority immediately after PSTATE.IL.
+         */
+        unallocated_encoding(s);
+        return;
+    }
 
     if (cond == 0xf) {
         /* In ARMv3 and v4 the NV condition is UNPREDICTABLE; we
@@ -6700,6 +6708,14 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         gen_exception_insn(dc, 0, EXCP_UDEF, syn_illegalstate());
         return;
     }
+    if (dc->pstate_uinj) {
+        /*
+         * PSTATE.UINJ injected undefined instruction.
+         * Priority immediately after PSTATE.IL.
+         */
+        unallocated_encoding(dc);
+        return;
+    }
 
     if (dc->eci) {
         /*
-- 
2.53.0


