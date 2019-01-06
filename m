Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2869436wrt;
        Sun, 6 Jan 2019 14:51:27 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5QhdAKg1U7/g96YHsf1dld6a6CrSr7a9FxHtezzwpOCr5Vg7/u20TeYt/WOKQ2YCmuKqVb
X-Received: by 2002:a5d:5111:: with SMTP id s17mr48876680wrt.43.1546815087646;
        Sun, 06 Jan 2019 14:51:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546815087; cv=none;
        d=google.com; s=arc-20160816;
        b=05Qtn4LKTMB/DPgaL7h8ZRY/9Lv9e1L8H/aigXK74uqnxdefJ2wJqVa9dtAycBYj+d
         xoue0bj/CTNpJ/UOPEkKqfSkyQSe3ybkIRE+13QNOqxOq/uCWffkm7NxedST/sGROCE7
         +C3XlvfOQc1bF0KwDZgukc8IAHealseOMf560AhcLM5sLv5ff/exH4D+v8b9jwEA426d
         p2gFAgbXelX6v8RWkUuw/0ktoSEg6iTc9r3NaipqM9qO6YbtvOykiRSb25fUV8gmRql0
         d2oTKHFjHJSWtfqhuQhkSJbA5dJoG3BbeX18NvTmU2mf0W7Dxy832vElg2K6CUZ8Kn5u
         RSsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=FerA1jdUPmyzDQdllgAlLCmDGQMUpOXaXKd/jiLP8aM=;
        b=bJGaPyIdcPq4iSABSzdjC1Fy9+GLivMr5oEuWj3Jd+SwQ8UmtslhvNI/qAxIqc07Jn
         4QkvB5WhSowmxl9Oe5FkMCr1mlTPlfXfrBXbOZaJLfSZULAzCcLyEjZTN6OMFEshfpgG
         YAwTrkK0XJyAyimcrbJjD2sP6WhlPkXGllcSp1MwqiXFYq1zUbQmxPOw4TRcSvOLOtiR
         aDhhvdz+kcFWTwtCt/YkEuBk/wu1nwINImDNkPeQSUepKjnaeImu+nZpX00QtjNuAf3H
         0LQd7OrRC1m0s5Z3XMJFLih+occ66cmzQhkNQDETbBau5j5JO/Xl9KrFPmCbOgNyEo72
         o1RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CgDnNjU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t187si4113584wmb.5.2019.01.06.14.51.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Jan 2019 14:51:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CgDnNjU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:50335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggHGQ-0004DH-MT
	for alex.bennee@linaro.org; Sun, 06 Jan 2019 17:51:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ggHFr-0003pf-6O
	for qemu-arm@nongnu.org; Sun, 06 Jan 2019 17:50:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ggHFq-0004h1-Dh
	for qemu-arm@nongnu.org; Sun, 06 Jan 2019 17:50:51 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:46932)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ggHFq-0004gq-8M
	for qemu-arm@nongnu.org; Sun, 06 Jan 2019 17:50:50 -0500
Received: by mail-pl1-x643.google.com with SMTP id t13so19924877ply.13
	for <qemu-arm@nongnu.org>; Sun, 06 Jan 2019 14:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FerA1jdUPmyzDQdllgAlLCmDGQMUpOXaXKd/jiLP8aM=;
	b=CgDnNjU3z/4026ZoL+JSXZx91soiI0VkY8LF2EkblXEjDAPh2sWt9qNB82bIsuQK6M
	uThgi2KY3zWP9+1hU1NkEH+FtoZUWG/lKAkhAQXVHpitAKuqvTsj4JJO14uTrjTnpWOU
	RnSQRf+uEdEAd58JH8exzmAUtAaYjvOFk02Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FerA1jdUPmyzDQdllgAlLCmDGQMUpOXaXKd/jiLP8aM=;
	b=Gr1Vwe09G3DXZJInqo8QeQjMla2Z1Dd799/RdeyixyYXt5vZk5KbAOZqpl7rPguA/U
	3Zt+6nxqdJQv92+vSDtLqGLomN0O75pJbw3JD98r0sffvbsqaqCC02YXA8OYIUb17wr2
	1kGptvHufn5Tx+ltvruW/Mpn4mYb50NMLGjJ62JQeL2wBusyJkClncFh/WytE4dhheYn
	H8nNWSIjuYZ50SsAwqIdiA3ezTK9XcNQG4mKTGHcvfbPeOUebH8VT77krVXQavOzwvt9
	GD1EFSQGJ+/W1lhaXUzwcxYbVnet4I4jm/LzQZsfb/OHTiHbKfFGV7wjWKsML1n6LyJP
	5yEg==
X-Gm-Message-State: AJcUukfyNN2zLbH+f1sssPIazad/zhpl4Gh/PrfyeHnRaB/O3jq9IQHV
	lJbbQcIU/fBHIbkUAfKscAyTaw==
X-Received: by 2002:a17:902:5a4d:: with SMTP id
	f13mr60842695plm.49.1546815049177; 
	Sun, 06 Jan 2019 14:50:49 -0800 (PST)
Received: from cloudburst.lan
	(2001-44b8-2176-c800-8cc6-2630-7d99-5ef1.static.ipv6.internode.on.net.
	[2001:44b8:2176:c800:8cc6:2630:7d99:5ef1])
	by smtp.gmail.com with ESMTPSA id
	n78sm45905768pfk.19.2019.01.06.14.50.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 06 Jan 2019 14:50:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  7 Jan 2019 08:50:34 +1000
Message-Id: <20190106225035.5671-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190106225035.5671-1-richard.henderson@linaro.org>
References: <20190106225035.5671-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-arm] [PATCH 2/3] target/arm: Use vector minmax expanders for
 aarch64
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iBSVlTGR7TGu

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2d6f8c1b4f..bef21ada71 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10452,6 +10452,20 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
+    case 0x0c: /* SMAX, UMAX */
+        if (u) {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
+        } else {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_smax, size);
+        }
+        return;
+    case 0x0d: /* SMIN, UMIN */
+        if (u) {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umin, size);
+        } else {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_smin, size);
+        }
+        return;
     case 0x10: /* ADD, SUB */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_sub, size);
@@ -10613,27 +10627,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
                 genenvfn = fns[size][u];
                 break;
             }
-            case 0xc: /* SMAX, UMAX */
-            {
-                static NeonGenTwoOpFn * const fns[3][2] = {
-                    { gen_helper_neon_max_s8, gen_helper_neon_max_u8 },
-                    { gen_helper_neon_max_s16, gen_helper_neon_max_u16 },
-                    { tcg_gen_smax_i32, tcg_gen_umax_i32 },
-                };
-                genfn = fns[size][u];
-                break;
-            }
-
-            case 0xd: /* SMIN, UMIN */
-            {
-                static NeonGenTwoOpFn * const fns[3][2] = {
-                    { gen_helper_neon_min_s8, gen_helper_neon_min_u8 },
-                    { gen_helper_neon_min_s16, gen_helper_neon_min_u16 },
-                    { tcg_gen_smin_i32, tcg_gen_umin_i32 },
-                };
-                genfn = fns[size][u];
-                break;
-            }
             case 0xe: /* SABD, UABD */
             case 0xf: /* SABA, UABA */
             {
-- 
2.17.2

