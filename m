Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1371088ejb;
        Sun, 11 Jun 2023 02:00:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4If73HivPnV6XEGQQ2jfWjPvxxZzNoligOkAmNceYpkLnGbpz/SKZact7aWuRRLQzSYBkQ
X-Received: by 2002:ad4:5bce:0:b0:62b:6b5b:f776 with SMTP id t14-20020ad45bce000000b0062b6b5bf776mr7738369qvt.0.1686474056673;
        Sun, 11 Jun 2023 02:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686474056; cv=none;
        d=google.com; s=arc-20160816;
        b=nJtZ6TTvpGG0B2bQvjoIKoq2YaHn48TNeciUb45p/+h8/TVpaPGDeslesNjBIQSd7c
         Ne2nFgN2viQBqu5XHubMZjPL3JQ3JUKiAPu//No9BgfXNWOi7h1WPBzur4nyT1Y8IFJL
         joxknw+Sy1sPXqO7Tdp86+28N6pZgw1uwnkZkELFulfOtkM2VbdbgrJ+hLEyO6GDBUWF
         pmlVts0FX11W6FIWrLJy/BR6j8UrLcJBOCp5dS6laVuu5/x3KE8EjMgittE3yZxQKmRc
         Mpco3z8qpq7XAqqTXxfBz25Dw12vuT5IKFbqYTA6ZEk+j7kgmK4PxnmIk0yoGdPnYpPt
         Sjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cI5tDvyzjBGzw5l/XkLwcYgWT6+N8zbnEiW/1PeWfOw=;
        b=NN88KSHJ/YbNaqOo/2/IcJmlP64zigWn9//JjLWv42VkGiRNQtKx2/pu3sHFfTUDVl
         rMF1b2Q9G9nchc4X8MeBYdFNCiAuN70zEOJOosl6Ndz1iXer6L+E04A9FRQWbU1F8hs4
         HlDQaZHgteufp8J9E2DvjcboU0og+w7j6RqSX9SU2Y8CWkTd4B4paDR0krhue5NcBzhS
         2UmK8gf2ocd0tDn9Gh5aG8nYFcEGCsf+SoA6T4iGbp8aAYBMmtYkzR/vOM4Zl5G5q//c
         X6F+j21HyoYA6K9UKlArqlgWkBjAft3h2AgHHD+7ScFHHCLRDwyKKZiT1Qnhnm/8vgQf
         pYSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=onYxBlIv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10-20020ac85b8a000000b003f9cd59bb47si4326479qta.725.2023.06.11.02.00.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 02:00:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=onYxBlIv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q8Gvs-0002eJ-LU; Sun, 11 Jun 2023 05:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8GvI-0002KA-DZ
 for qemu-devel@nongnu.org; Sun, 11 Jun 2023 04:59:46 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8GvG-0003ix-SG
 for qemu-devel@nongnu.org; Sun, 11 Jun 2023 04:59:44 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f7fc9014fdso23747665e9.3
 for <qemu-devel@nongnu.org>; Sun, 11 Jun 2023 01:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686473980; x=1689065980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cI5tDvyzjBGzw5l/XkLwcYgWT6+N8zbnEiW/1PeWfOw=;
 b=onYxBlIvsAEMelIaiMMsa1RUIC+5AVADZKAyOheNc5XcnTGqIgqsxXJcAJRMHrGwU4
 AFLPwC9c4W/v/jHdjEWdQiCNL9ICbvm6ri4HNldBuCBZJh1YL2tj3OPSvVG4PrriUqBB
 HT9OAFkLgCzYsXbbBjpPTcmrqdTiTwe7MADiQVK6VWN3r1Wv4jZOokkGh/UqnEPTDomy
 Q2TFdDpFkz0Lun/ay3315U3zX7iS0j9nLwnH3JIQenRp/LRdPiiFGSgsy48UGWeciAc0
 NJgBtdFLqCEKy1fIRM9He1sPmLYIRxlDKgOdydFJ6ZRhdvALefxPauCVYgaomHrY78VZ
 ozOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686473980; x=1689065980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cI5tDvyzjBGzw5l/XkLwcYgWT6+N8zbnEiW/1PeWfOw=;
 b=SxGx88FUql8w6OAF2ZKQOaeofSiBKtpNVIICbylTkm4GH0IdIAbA9K166Lidsyc65j
 NoK/tA8qfdKZd03o8qpKWHOgmHEpYxgi+5yRejAw+2N9nUolz3YW0CJ58842OilWNxR7
 qcIxktSFlWi0Tu04SdUimE7lOH1ns5gTWvhbz5K3MMV41rDgTYZYPIh4RRdPG3tk+rKT
 mbjby4I/h3iwTj3XIp0bRp9syZJca7Kt8MLYbfad7YR54rLkSpbb5lS8+e0NDjB+czIJ
 bWr7fa+9dL4uv4O6BAm1/erGFi1Fq57iCya4SCbEc92fGKwg4dmnKq4l1pLKD4tXWMcu
 fROw==
X-Gm-Message-State: AC+VfDx3zhFx1dKym4M5+aHBFX6iuhIlxCCOXiSndDsarANqDtSvlPqv
 jnGpwycNNZmNLfSzHWeqTZE+JTiyPko4geX0QlM=
X-Received: by 2002:a05:600c:21c7:b0:3f7:3651:450c with SMTP id
 x7-20020a05600c21c700b003f73651450cmr4555420wmj.6.1686473980472; 
 Sun, 11 Jun 2023 01:59:40 -0700 (PDT)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 k10-20020adff5ca000000b003077a19cf75sm9081745wrp.60.2023.06.11.01.59.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Jun 2023 01:59:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 12/26] target/arm/tcg: Move neon_tbl() from op_helper.c to
 neon_helper.c
Date: Sun, 11 Jun 2023 10:58:32 +0200
Message-Id: <20230611085846.21415-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230611085846.21415-1-philmd@linaro.org>
References: <20230611085846.21415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VFWl0M+Bw6/6

neon_tbl() helper is only called by NEON files. No need
to have it in the generic op_helper.c, move it with the
rest of the NEON helpers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/neon_helper.c | 22 ++++++++++++++++++++++
 target/arm/tcg/op_helper.c   | 22 ----------------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
index bc6c4a54e9..0a4ab3e42c 100644
--- a/target/arm/tcg/neon_helper.c
+++ b/target/arm/tcg/neon_helper.c
@@ -1738,3 +1738,25 @@ void HELPER(neon_zip16)(void *vd, void *vm)
     rm[0] = m0;
     rd[0] = d0;
 }
+
+uint64_t HELPER(neon_tbl)(CPUARMState *env, uint32_t desc,
+                          uint64_t ireg, uint64_t def)
+{
+    uint64_t tmp, val = 0;
+    uint32_t maxindex = ((desc & 3) + 1) * 8;
+    uint32_t base_reg = desc >> 2;
+    uint32_t shift, index, reg;
+
+    for (shift = 0; shift < 64; shift += 8) {
+        index = (ireg >> shift) & 0xff;
+        if (index < maxindex) {
+            reg = base_reg + (index >> 3);
+            tmp = *aa32_vfp_dreg(env, reg);
+            tmp = ((tmp >> ((index & 7) << 3)) & 0xff) << shift;
+        } else {
+            tmp = def & (0xffull << shift);
+        }
+        val |= tmp;
+    }
+    return val;
+}
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 3baf8004f6..70a9c37b74 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -82,28 +82,6 @@ void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
     raise_exception(env, excp, syndrome, target_el);
 }
 
-uint64_t HELPER(neon_tbl)(CPUARMState *env, uint32_t desc,
-                          uint64_t ireg, uint64_t def)
-{
-    uint64_t tmp, val = 0;
-    uint32_t maxindex = ((desc & 3) + 1) * 8;
-    uint32_t base_reg = desc >> 2;
-    uint32_t shift, index, reg;
-
-    for (shift = 0; shift < 64; shift += 8) {
-        index = (ireg >> shift) & 0xff;
-        if (index < maxindex) {
-            reg = base_reg + (index >> 3);
-            tmp = *aa32_vfp_dreg(env, reg);
-            tmp = ((tmp >> ((index & 7) << 3)) & 0xff) << shift;
-        } else {
-            tmp = def & (0xffull << shift);
-        }
-        val |= tmp;
-    }
-    return val;
-}
-
 void HELPER(v8m_stackcheck)(CPUARMState *env, uint32_t newvalue)
 {
     /*
-- 
2.38.1

