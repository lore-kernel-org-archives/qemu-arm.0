Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B820C43458
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:49:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEdv-0008TR-Or; Sun, 05 Jul 2026 00:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcO-000596-UP
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:38:14 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEc4-0004KW-Md
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:38:12 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2c9ed0c7fc7so25658105ad.1
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226271; x=1783831071; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzGgogh2drGaxG2qqYgsAosa8MuuctrHRN1e6nlJ7Xc=;
 b=uKjt+Dx4aCL0WzWIrbnUuopi0G6s7rc4FHZwBVAhpEBQrD65nvoNIJbPzEeiLJZo6O
 WQWSNsTOhcqGkv46uAgqlKBsN2Inn9YFha0WlnfCslc8stgjn021MDP9cvsAIzb8qxOS
 76l7YLT0iXVMfrMciIirBoIYX23BnCzu28LcUROWMAIYK5bIKayN0fpHJTlxjQ01KUXx
 DOFm2yJVx6V39mc4yLzlcxzRgx+LuiT1pHXZiNn+5c1Vjbl7g/q2uX/iMNAFoM80BB9l
 Z2Tl+cXyMCw/O9lmU5raD7u8zqtmC5ARDz1EtezWuPQMLEYeGbQRmFdnW9frh/x/iVLQ
 jXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226271; x=1783831071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kzGgogh2drGaxG2qqYgsAosa8MuuctrHRN1e6nlJ7Xc=;
 b=WyS5P8cblP5sAZs/flJQx0u/9avcah4Rs/Jsl4Vn0QQp3WgMALnZF8CN/a0cfY+ViS
 yShR5/ss/7q7i+f6NFdFe/P5fxE93xmF6vmJhJoXw4/u2vGiB7uaN997GOoHLq/28cpL
 1CnVD6MWQ+v9H2hlehR3vQHtsp0WpuFpbXFY1AaxhlSjfuQwiFPCwKvisXDKeFciqNJx
 OPPbmEUFLPPT6Qnp6W1drBa6WrQxTlZJzIpk+KVVBErpPVPDYG7W5n0yj5+KD0FwuQhY
 wj/F3YrnpT3ESjcTuoxQ2CAEaQH1NMpFCW+KLf5E7wRYWd1tiCKsyIsqX2/iIxMemCP9
 e14Q==
X-Gm-Message-State: AOJu0YxlpN66FpWPLLXbuYKINfjZywVo4TLZs9a79FWYI0GUObt8BtEk
 pOI8Ve7lCW1qRy4KomcYp+3Jr/mTTtktAdxsPGdW3sVm8vpONbDWV+hCoYYs+6oPLOrLdpNYDtK
 3k93j
X-Gm-Gg: AfdE7cnb8PAB71o+Tcl5YWxOwlr6EL8ONCyqMmwEa16JhPXzi8RM8YSEV/Uq+ekm6tC
 uJvoK4oqRsGy8RsJ9oJ0tYilGncwZ2QzOK+vVrU/QA613SC0UwVnTXXEDk9cADD6DqZz+ky0Q6M
 lcG+6E1TI0Z3bzsElaS19vIKFCIj13fnb42ibKGTICvk052DcQIl/pA7/varadLgzB6L5VQvArD
 PQiaIg9vABMJ7Bh7ljhwzP1S1oqu6FAbIhz0JJYgE7uHogUFdj23csi8tzOqNhbhBKeoTKzXzJf
 OpDwlEtw5kqqGlBKPMsvP21czq/4Cn9yHizCpk5OwIFXdlu5BAETC8eIaWupe+EMDWqqDpKwHq5
 G2kAaEWIZR5cxYibK8G/bbgThTts0iN37quKiIdlp0d4tzvaWjpHQxYw4HliyczYh+qoRm9JvCQ
 +MdkaPCE5grIu1SEetNO4lH1ndhLE9GSC1whcEtz8znLTcW3s=
X-Received: by 2002:a17:902:da2d:b0:2c9:97a8:afe8 with SMTP id
 d9443c01a7336-2cbb9eef2e6mr53420945ad.43.1783226270860; 
 Sat, 04 Jul 2026 21:37:50 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 28/46] exec/breakpoint: Add CPUWatchpoint.hitlast
Date: Sat,  4 Jul 2026 21:37:07 -0700
Message-ID: <20260705043725.1373137-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Allow the debug_check_watchpoint callback to see the
entire range that triggered the query.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/breakpoint.h | 1 +
 accel/tcg/watchpoint.c    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
index 254762c9b2..175d0cc670 100644
--- a/include/exec/breakpoint.h
+++ b/include/exec/breakpoint.h
@@ -36,6 +36,7 @@ struct CPUBreakpoint {
 struct CPUWatchpoint {
     IntervalTreeNode itree;
     vaddr hitaddr;
+    vaddr hitlast;
     MemTxAttrs hitattrs;
     BreakpointFlags flags;
     unsigned id;
diff --git a/accel/tcg/watchpoint.c b/accel/tcg/watchpoint.c
index a7ce5fa9dd..edd1d5708b 100644
--- a/accel/tcg/watchpoint.c
+++ b/accel/tcg/watchpoint.c
@@ -89,6 +89,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                 wp->flags &= ~BP_WATCHPOINT_HIT;
                 wp->flags |= flags << BP_HIT_SHIFT;
                 wp->hitaddr = MAX(addr, wp->itree.start);
+                wp->hitlast = MIN(last, wp->itree.last);
                 wp->hitattrs = attrs;
 
                 found_wp = wp;
@@ -109,6 +110,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                 wp->flags &= ~BP_WATCHPOINT_HIT;
                 wp->flags |= flags << BP_HIT_SHIFT;
                 wp->hitaddr = MAX(addr, wp->itree.start);
+                wp->hitlast = MIN(last, wp->itree.last);
                 wp->hitattrs = attrs;
 
                 if (tcg_ops->debug_check_watchpoint
-- 
2.43.0


