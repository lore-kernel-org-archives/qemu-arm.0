Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9A8CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:48:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY9Z-0001vg-7B; Tue, 13 Oct 2026 04:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4S-0001H4-8q
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:16 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4Q-0008Fd-BD
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:15 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a1ad2e2391so2931985e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880873; x=1792485673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=s/z9Yvn1Q+fwTQJfLeFnAK/nNkUh7Y2+PQGp/wBgZSw=;
 b=Oc+eVk7oA9cBxCWBBtS2VklasV6wCwjU6u68RKw3hgneSKUJIVAIrQfq6/g7FBCUEU
 0FKjdljNppz0eDNwQJqDbTp6FOTKnYtPCGhLFL+0S6PKJ8MSU24VTv+Tp5PN3erEpLWm
 nKr7jojj7A0SKqrqa4scjx7RhsRynPWT6rbhy4t3mxmLO8yC691TR7Y/WJ81p1zWBewR
 VRqujOMYk5PFElWvf4i1jvZrFiRVzRDHg40GLe/DZr2RJeh+euBCTw9Bv3x+xwkxNfX1
 DWgZp0ESs8qsGCz8tbdKsO4UlJvD5VecNxvmW1DUVWyyiaxtLAk19eGU2JKjMTEtsNNx
 ZeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880873; x=1792485673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=s/z9Yvn1Q+fwTQJfLeFnAK/nNkUh7Y2+PQGp/wBgZSw=;
 b=sxCxMd87uL5AuQyYDXmNo48zimcFH3/1zfiFUJLzn4XGIwXqt7eVAh0/2g6Xd80ZN4
 zlVQI9PPWrhEim+1TUzp2az1tpISIlCdiTkgb9EVH+Rih8oGdfibvRhnqijxOmFqRJ4Q
 h5wHE5sIWcVA9t6Ryg8WhHb+m+/XuWTNgAycmW2ezjWinrwaRAaLSGxG5/avseMiqwue
 XnhArgehAGTRp4gU4fihtwVLfZXcTA9dvXEQ8BXD/hid+j3Ti3MGKtCo7/xw0EShg6X8
 c6sVZrsbbszK2o+ema66W0OlsXMWwk9IM9M10kpqxJv0KAVebm6xZBwXGArfd0D0HrZD
 pw9Q==
X-Gm-Message-State: AFq9FYJNFrS5mJhZ2wmNzMgRFtz3vhVy7S/GRz5MpXUJfhnIRAj+FHpy
 yEN4KqTM0l5FCTGletkXp7rCgf4Cnmh1nxCmWKJlQGF8o41vSPdUAvlwfcY2tK/cxPTy54zbBa+
 2bxWm6kc=
X-Gm-Gg: AYBFou2uiiuOXhR0wDln2AcfYfXGZLKc9mVZX7QLOcAzoc9hM45F0XLhky2EMXYEAWG
 B6K2c5WhSoVBLDdGuwe/F3jt9mm/Vyi17ZczMWVaVGGKIeIy5VsgxqsylpmjRsS0LuDJGfO9URn
 SSoh8sDtFmCsE7sCoP5aerQjI7S3hNXqERYAaIUmQ3QgZyitStOT8zrelQgGzi89vJcCLNt/49t
 u7ZyuyJaIPrNGPkK0ixamw/eLAVivwSbSaN986huZDwO31Xis6olflT8mj0Mi0gpKBPed14ITiz
 JnWCVXg89mw40yGKjPMmgECtkkhrB6iJnrX1rXyITNOwAiOfYnML4II6SwuU6ceOqIlG7DNcGaK
 mPVCk4K79sotPr29JGFJXhzaXzg9fNlyusyvNzQKnZMia2n3Pbh5kpf3Q03BBOfZ6SfdT5qboAN
 /zHGI1WYvFbSgNdutfhkVASTqzD/nxlt83LLMcBr7F5Ueun4C3RQWANdRbT/QWfyyje/Q6y0TFT
 TuEa5idZ7GiFVmmLuww9GZAtvevz7v7Z3Am8SIL4K7Suw0yrusUrtI9ejc4E063z+V6ei71ZkTq
 qBs=
X-Received: by 2002:a05:600c:820c:b0:49c:fa21:1c81 with SMTP id
 5b1f17b1804b1-4a18e4d5563mr210443465e9.22.1791880872770; 
 Tue, 13 Oct 2026 01:41:12 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:41:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 75/86] hw/intc/arm_gicv5: Handle activation of a virtual
 interrupt
Date: Tue, 13 Oct 2026 09:39:22 +0100
Message-ID: <20261013083933.1024405-76-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

Handle activation of a virtual interrupt.  Because this is more
complex than just updating a single field in the L2_ISTE, we can't
use the DEF_SET_FIELD_FOR_IST() macro, but activate_for_ist() follows
the same basic pattern.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 41 ++++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 5a038fc14e9..39c96fe0526 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1031,6 +1031,29 @@ uint64_t gicv5_request_config(GICv5Common *cs, uint32_t id, GICv5Domain domain,
     }
 }
 
+static bool activate_for_ist(GICv5Common *cs,
+                             const GICv5ISTConfig *cfg,
+                             uint32_t id,
+                             uint32_t *iaffid)
+{
+    L2_ISTE_Handle h;
+    uint32_t *l2_iste_p;
+    if (!cfg) {
+        return false;
+    }
+    l2_iste_p = get_l2_iste(cs, cfg, id, &h);
+    if (!l2_iste_p) {
+        return false;
+    }
+    *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, ACTIVE, true);
+    if (FIELD_EX32(*l2_iste_p, L2_ISTE, HM) == GICV5_EDGE) {
+        *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, PENDING, false);
+    }
+    *iaffid = FIELD_EX32(*l2_iste_p, L2_ISTE, IAFFID);
+    put_l2_iste(cs, cfg, &h);
+    return true;
+}
+
 void gicv5_activate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
                     GICv5IntType type, bool virtual, uint32_t cpuidx)
 {
@@ -1040,8 +1063,12 @@ void gicv5_activate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
     trace_gicv5_activate(domain_name[domain], inttype_name(type), virtual, id);
 
     if (virtual) {
-        qemu_log_mask(LOG_GUEST_ERROR, "gicv5_activate: tried to "
-                      "activate a virtual interrupt\n");
+        const GICv5ISTConfig *cfg = ist_for_vint(s, cs, domain, type, cpuidx);
+
+        if (!activate_for_ist(cs, cfg, id, &iaffid)) {
+            return;
+        }
+        irs_recalc_vhppi(s, s->res_vpe[cpuidx]->vmte, iaffid);
         return;
     }
 
@@ -1049,18 +1076,10 @@ void gicv5_activate(GICv5Common *cs, uint32_t id, GICv5Domain domain,
     case GICV5_LPI:
     {
         const GICv5ISTConfig *cfg = &s->phys_lpi_config[domain];
-        L2_ISTE_Handle h;
-        uint32_t *l2_iste_p = get_l2_iste(cs, cfg, id, &h);
 
-        if (!l2_iste_p) {
+        if (!activate_for_ist(cs, cfg, id, &iaffid)) {
             return;
         }
-        *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, ACTIVE, true);
-        if (FIELD_EX32(*l2_iste_p, L2_ISTE, HM) == GICV5_EDGE) {
-            *l2_iste_p = FIELD_DP32(*l2_iste_p, L2_ISTE, PENDING, false);
-        }
-        iaffid = FIELD_EX32(*l2_iste_p, L2_ISTE, IAFFID);
-        put_l2_iste(cs, cfg, &h);
         break;
     }
     case GICV5_SPI:
-- 
2.43.0


