Received: by 10.28.4.212 with SMTP id 203csp168793wme;
        Thu, 26 Apr 2018 17:30:12 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZroragpU9FHlQGOPEiuO55wgaay/9LP1CIvvr3vBEPuVk4vh6nzuMkzSNRZMn/dKqQwapJ8
X-Received: by 10.55.182.5 with SMTP id g5mr183402qkf.136.1524789011955;
        Thu, 26 Apr 2018 17:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524789011; cv=none;
        d=google.com; s=arc-20160816;
        b=p4vNbgtGMFJc8A8Q4N9lRfJkHho3086ijr5Rm506H5353qoadk7enrv0DrgrUu0IBE
         5nwRksWO1CcDeEM3A3XDcuJSShZwFP/egxE8scKRyy35k32u1yriWwgAQE8CFgbrpagq
         y1SVWbRyuhU75EMf8hhQm6R+c0DhJfS5WPmMeJeSuWNvZnhC8ZvRtB5eMYmqZu3dsmw5
         wbDjHsyG0K6EFlEXx5JaG/PmaFLXuMbCrveGV0j6o1W8P0LeDNAtox3RU+UgBgxt2XMa
         rvK/ebfdXwj6Elr7RltjUjhDgxkZ2lTIVS16fQ/+Y0ELu4zumyog5MvTZeaoQTAXXkGE
         Gk6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=AK0p4SpyvZ3J/I+GdUe6KW90oSn4gSKkgLtPrMjVrLk=;
        b=f4SiUroQcmqthhNzPhEoJHJRPqni7GOkYEsnpx0vt0w8ocFl2+VBNsEpdVnpgrJQyy
         6h6BhgLtdkoSMoIKKuevCkoWbATjYNlZAKH8fo1VIaGEgehp+gvbR3rA4qS0kx+4gk80
         7bCfvXOONSjDgS5Q+JX+BSOWuojKgQZ5OS+3xPxhlpid/h0UfbGP8ihNArJWEpxp/1eS
         3TsiNEo/rOtMBSSjAdvMrc/elPVilSxPNG2uBl9GLjSOtMkLGaDET3mzwSqYOVZgmmm3
         1K70PJXN9dRODZqsZhaxricEUqz6lVQxAVz1zFs2pWrG0adiFmnTvjHZoze05thLE8iB
         +3UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q7tGKSCO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r190si106873qkb.127.2018.04.26.17.30.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 17:30:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q7tGKSCO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45114 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBrH9-0004uZ-BW
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 20:30:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrEB-0001zK-B4
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fBrEA-0004SP-Fg
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:07 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:46325)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fBrEA-0004Rx-9p
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 20:27:06 -0400
Received: by mail-pf0-x244.google.com with SMTP id p12so122340pff.13
	for <qemu-arm@nongnu.org>; Thu, 26 Apr 2018 17:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AK0p4SpyvZ3J/I+GdUe6KW90oSn4gSKkgLtPrMjVrLk=;
	b=Q7tGKSCOHhY7X8Msutm3H4PZBcM3r0r8/vpBaAJCB1NG5F951Kth5pDQtXPlcpDuVg
	HFitHinDoGjgbUoUk4em/0v7zAnmieYAj84/5NrRqtg/LDYvp7M0tU3bKvwvKa2DjzSX
	Xnr/2e+HiHE67YBGUb8FgKhKcaO1OasJsrvN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AK0p4SpyvZ3J/I+GdUe6KW90oSn4gSKkgLtPrMjVrLk=;
	b=l8CsJyis340gwvU09CCiUEHgU0uIozCScgOd+qDzEo0WZ0gDeF+u8Iib28kZoAJ1fi
	Z2ARWJFQSvAWHsqEsbU5tWsQzZER3lE5vNqR7H807Xfuo7MuLICJe//V+D0FMOoLJ+Ad
	dGmUy+GAjUq2ygNYnhigMzW9SeXjWF+t3+ScTrmTuYTeEuTONOcNJkcFEHPcaGc+ESgD
	dhCrohSucuXX56KnCU5lWME6rufF0Fz+VWZjSAOgP9NqQfYyGDyoGJ8pX/BfNp0UXZHn
	5rftkHNDNPAWXrRAQCtsP8q12gIDUr9HWtTc1aGKBgE2//Ce+LD2OMTLSXGh41VrX2v0
	LyOQ==
X-Gm-Message-State: ALQs6tD323cR4itiFoaPbKH5dhMixWd02bNMRPCjJ3q1BfHfZr/IaulR
	dKaOUA95r3xXZGPJfYc8kVn2Ig==
X-Received: by 2002:a65:6301:: with SMTP id g1-v6mr153110pgv.307.1524788825391;
	Thu, 26 Apr 2018 17:27:05 -0700 (PDT)
Received: from cloudburst.twiddle.net.com
	([2605:e000:112b:41da:c94c:5ee7:de92:7d78])
	by smtp.gmail.com with ESMTPSA id g76sm86338pfj.102.2018.04.26.17.27.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Apr 2018 17:27:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 26 Apr 2018 14:26:45 -1000
Message-Id: <20180427002651.28356-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180427002651.28356-1-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH 3/9] target/xtensa: Use new min/max expanders
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3WD0OdJO+L6h

The generic expanders replace nearly identical code in the translator.

Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 50 +++++++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 4f6d03059f..bad5cdb009 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1527,10 +1527,8 @@ static void translate_clamps(DisasContext *dc, const uint32_t arg[],
         TCGv_i32 tmp1 = tcg_const_i32(-1u << arg[2]);
         TCGv_i32 tmp2 = tcg_const_i32((1 << arg[2]) - 1);
 
-        tcg_gen_movcond_i32(TCG_COND_GT, tmp1,
-                            cpu_R[arg[1]], tmp1, cpu_R[arg[1]], tmp1);
-        tcg_gen_movcond_i32(TCG_COND_LT, cpu_R[arg[0]],
-                            tmp1, tmp2, tmp1, tmp2);
+        tcg_gen_smax_i32(tmp1, tmp1, cpu_R[arg[1]]);
+        tcg_gen_smin_i32(cpu_R[arg[0]], tmp1, tmp2);
         tcg_temp_free(tmp1);
         tcg_temp_free(tmp2);
     }
@@ -1855,13 +1853,35 @@ static void translate_memw(DisasContext *dc, const uint32_t arg[],
     tcg_gen_mb(TCG_BAR_SC | TCG_MO_ALL);
 }
 
-static void translate_minmax(DisasContext *dc, const uint32_t arg[],
-                             const uint32_t par[])
+static void translate_smin(DisasContext *dc, const uint32_t arg[],
+                           const uint32_t par[])
 {
     if (gen_window_check3(dc, arg[0], arg[1], arg[2])) {
-        tcg_gen_movcond_i32(par[0], cpu_R[arg[0]],
-                            cpu_R[arg[1]], cpu_R[arg[2]],
-                            cpu_R[arg[1]], cpu_R[arg[2]]);
+        tcg_gen_smin_i32(cpu_R[arg[0]], cpu_R[arg[1]], cpu_R[arg[2]]);
+    }
+}
+
+static void translate_umin(DisasContext *dc, const uint32_t arg[],
+                           const uint32_t par[])
+{
+    if (gen_window_check3(dc, arg[0], arg[1], arg[2])) {
+        tcg_gen_umin_i32(cpu_R[arg[0]], cpu_R[arg[1]], cpu_R[arg[2]]);
+    }
+}
+
+static void translate_smax(DisasContext *dc, const uint32_t arg[],
+                           const uint32_t par[])
+{
+    if (gen_window_check3(dc, arg[0], arg[1], arg[2])) {
+        tcg_gen_smax_i32(cpu_R[arg[0]], cpu_R[arg[1]], cpu_R[arg[2]]);
+    }
+}
+
+static void translate_umax(DisasContext *dc, const uint32_t arg[],
+                           const uint32_t par[])
+{
+    if (gen_window_check3(dc, arg[0], arg[1], arg[2])) {
+        tcg_gen_umax_i32(cpu_R[arg[0]], cpu_R[arg[1]], cpu_R[arg[2]]);
     }
 }
 
@@ -2984,23 +3004,19 @@ static const XtensaOpcodeOps core_ops[] = {
         .par = (const uint32_t[]){TCG_COND_NE},
     }, {
         .name = "max",
-        .translate = translate_minmax,
-        .par = (const uint32_t[]){TCG_COND_GE},
+        .translate = translate_smax,
     }, {
         .name = "maxu",
-        .translate = translate_minmax,
-        .par = (const uint32_t[]){TCG_COND_GEU},
+        .translate = translate_umax,
     }, {
         .name = "memw",
         .translate = translate_memw,
     }, {
         .name = "min",
-        .translate = translate_minmax,
-        .par = (const uint32_t[]){TCG_COND_LT},
+        .translate = translate_smin,
     }, {
         .name = "minu",
-        .translate = translate_minmax,
-        .par = (const uint32_t[]){TCG_COND_LTU},
+        .translate = translate_umin,
     }, {
         .name = "mov",
         .translate = translate_mov,
-- 
2.14.3

