Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FEEC88E72
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 16:03:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x697e-0004IJ-A9; Mon, 14 Sep 2026 12:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x696v-0003OW-Pz
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 12:00:52 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x696s-0004eo-04
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 12:00:48 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4843cedd129so1379180f8f.0
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 09:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789401634; x=1790006434; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=Tlfaa1zedcVGWMzuAJcTpxY+/iAccC+7WsTvKk/d05w=;
 b=QAmqmBR3PVQAl2OLzfvEEb6F9JIx47PKQDltQJzAyC4dxMtieKZJ9qACotfCiiC8fC
 EEfZal7oY+atUx5b7Uz9XqJdtR/pAv0wWav57oLr0VgOKY91BbpSyqDq+pPyzS1xvLh9
 Mj2hoaPD8pPKue3CJOqtEY2LsXlwBrTUB3deXye8kI84clIeQO0XQDO9IhSBQYHPW3Xr
 wQcSAXWqfZlIMTDRcZj2N36OKoOqmu+yGlQNMI5fGPn81FZ4lkdDaZ0jsF52e8A0q4e9
 ZYZXgbrxonWYQmOf7gbj69/MBO5L8h8gqVgzBPTB11RWBK+5tvCXW1HqUlA8lwto5itv
 8T2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789401634; x=1790006434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=Tlfaa1zedcVGWMzuAJcTpxY+/iAccC+7WsTvKk/d05w=;
 b=ULdiqBrD13hbmncMPsb5u8Uh1QxFRo9+eyZEzqKJAYpB+QMIa6n9eTfOVzWAPkEGLX
 4z91VbR9NM+JHN8FuG3xVBrxWMCjQhdzc7IUmfWy5+y4Q0zbzZr3QCK8ND/SobjiWZVq
 daTErxbuEWKNCG48BxniqQ+8jR2Y35G4tZm5Ua6lPD1MTkSx4z5LRTQw46ONzkJOxmmm
 NYYGBjGUge/Fny5SkAVB19QZxksr8+XYwYFehlG5LB8hkaRrKzUagUJf1S6kwjwgIPRM
 WI8KIc4dClA8Wrvbayxx3reSUWsqrng9QRMXPBzky4v8W7fHX+GYW1DDGdwhrFNxle8e
 W4Qw==
X-Gm-Message-State: AFuF++lF8BCNwIquKyV7WAJu9DMTxo41hPJbqfaV0UBFKWn2ugvV1DC2
 LC88t6k5grh6ff+9AYqTX5CGNoMpVCjBLnYleFIlWBvsmO4zftIpoCpTMB4llJdOKEwCtq6J52N
 KOHRDHmQ=
X-Gm-Gg: AYBFou0Pp9EA0ynM9+x/HOw2mBM2xddMjzAOaVTI7PfuBwQwn1HjKkuh/ogqFJmR+yE
 TjjOl6OnZ8U5N5rZO4N6G7LZwhhi6IlV8D3b3xCIHb2usFDbI446LkskRmDa7MsZEmG3mUcxMSn
 SIn7ajscuaHXpd/qllq3kVgpwyxnBmAdfHm5DpGaIyhctVGKVE9VTK5pxcwbnsvnV/2sdyMxPPr
 ynShWPD+khyYorTFnZMH6nChSTEWE7bd1JnZJSbawZmQuFOtqF8Kli8ZTsqkUToeH9nSE7KyJYN
 an7Svd4JVOJETKMO87Nn+e0myW4qUKkQh6RHX2lLLfgGbx5spFPk0m3Y521lcU2czVaC3WmH+PF
 qxRQ6CHrm/DjOJNm2Fi/v/Xu03x0eveXa4UW3IsTLqswmIHmtMT2IqXMb8KJm/xHugXeqhvaEaS
 RdUHWWq9L6Z9emWsrOgHVc7ioIGpChpte6X4Nv7RW8DD0SxYhUqWfEEWhcy+0VhEIpmJ54BGzQr
 0Fpmn7kjuExq2EvtubHAABt+PWbX6+pk3tJcR7dWfUhhNYJWHu7ZMNcwCEcMVRziJmEF6iMz9By
 a7hK
X-Received: by 2002:a5d:6f12:0:b0:486:f4b1:8c4a with SMTP id
 ffacd0b85a97d-48702ae32a4mr7748259f8f.10.1789401634196; 
 Mon, 14 Sep 2026 09:00:34 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb350686sm30797695f8f.27.2026.09.14.09.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 09:00:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 9/9] hw/intc/arm_gicv5: Pass cpuidx rather than iaffid in
 gicv5_get_hppi()
Date: Mon, 14 Sep 2026 17:00:20 +0100
Message-ID: <20260914160020.327787-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914160020.327787-1-peter.maydell@linaro.org>
References: <20260914160020.327787-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr2-x10.google.com
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

Now the CPU interface knows its own cpuidx, we can pass that to
gicv5_get_hppi() and avoid the IAFFID->cpuidx lookup in the IRS.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c                | 5 ++---
 include/hw/intc/arm_gicv5_stream.h | 4 ++--
 target/arm/tcg/gicv5-cpuif.c       | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 6b72870439b..66953606419 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -531,12 +531,11 @@ static void irs_recall_hppis(GICv5 *s, GICv5Domain domain)
 }
 
 GICv5PendingIrq gicv5_get_hppi(GICv5Common *cs, GICv5Domain domain,
-                               uint32_t iaffid)
+                               uint32_t cpuidx)
 {
     GICv5 *s = ARM_GICV5(cs);
-    int cpuidx = irs_cpuidx_from_iaffid(cs, iaffid);
 
-    assert(cpuidx >= 0);
+    assert(cpuidx < cs->num_cpus);
     return s->hppi[domain][cpuidx];
 }
 
diff --git a/include/hw/intc/arm_gicv5_stream.h b/include/hw/intc/arm_gicv5_stream.h
index f45072d8c57..641f3d0f499 100644
--- a/include/hw/intc/arm_gicv5_stream.h
+++ b/include/hw/intc/arm_gicv5_stream.h
@@ -204,14 +204,14 @@ void gicv5_forward_interrupt(ARMCPU *cpu, GICv5Domain domain);
  * gicv5_get_hppi
  * @cs: GIC IRS to query
  * @domain: interrupt domain to act on
- * @iaffid: IAFFID of this CPU interface
+ * @cpuidx: IRS CPU index of this CPU interface
  *
  * Ask the IRS for the highest priority pending interrupt that it has
  * for this CPU. This returns the equivalent of what in the stream
  * protocol is the outstanding interrupt sent with a Forward packet.
  */
 GICv5PendingIrq gicv5_get_hppi(GICv5Common *cs, GICv5Domain domain,
-                               uint32_t iaffid);
+                               uint32_t cpuidx);
 
 /**
  * gicv5_deactivate
diff --git a/target/arm/tcg/gicv5-cpuif.c b/target/arm/tcg/gicv5-cpuif.c
index eea66a4140e..0b1033c1ef0 100644
--- a/target/arm/tcg/gicv5-cpuif.c
+++ b/target/arm/tcg/gicv5-cpuif.c
@@ -147,7 +147,7 @@ static GICv5PendingIrq gic_hppi(CPUARMState *env, GICv5Domain domain)
         return GICV5_PENDING_IRQ_NONE;
     }
 
-    irs_hppi = gicv5_get_hppi(gic, domain, env->gicv5.iaffid);
+    irs_hppi = gicv5_get_hppi(gic, domain, env->gicv5.cpuidx);
 
     /*
      * If the best PPI and the best interrupt from the IRS have the
-- 
2.43.0


