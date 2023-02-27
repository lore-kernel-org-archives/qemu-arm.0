Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4301177ejc;
        Sun, 26 Feb 2023 21:50:44 -0800 (PST)
X-Google-Smtp-Source: AK7set+XnNAcTdGbdJ3LuJdOTEO3ov/d5gzrz0Ca02MV59Q/uFepJMcHOBdKbJvj4OnHc+6bgOcO
X-Received: by 2002:ac8:5910:0:b0:3ba:26a0:d0ee with SMTP id 16-20020ac85910000000b003ba26a0d0eemr46206825qty.52.1677477044790;
        Sun, 26 Feb 2023 21:50:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677477044; cv=none;
        d=google.com; s=arc-20160816;
        b=PbeebvRl907hKUJK8uQ35sWg5kEZ8AKmxsiYjtTw59oux876DEdJLMbd/apUE/Cj7y
         OoFGOXCumDHiGWJWBFz3mgkpT1x3W9fozfuiHmUP/6SRN8x7FD9fE0AToIlOEvADKNDm
         kIlNoTZzLZGdkeanig2U2PVjRTgG6Uwym3+g6VzLbZMVzbD64tSvxc22yBsAN4Kmcfzk
         zL8TWInDclgAN7HPiA8IhMudY/5fwz0tBzZ2+NHYpTYEEnpuYhcECog5CLgcgjf4nnEK
         dV/6fDqGm94izTSDhiob0SuYaV9o6F+pRT9DTYdsySU+0Gk4Jfc+85gUieK/62V7F9Qt
         3i+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/zCqZBQrzNOn6osZDTRgqatKCTehdYwPWQUE6TO3Ir0=;
        b=oWzxup2Su3PZEIn682/S/miw/j+I38yhM37wsXgZc83fvOfodTVkbnxDJLTpuehG73
         7xCgGfjfyLIumWAIwE7niSnjFOAQIWHkM2IyehD5quxQVKbmEWX5dFy3myH69wiKzCF1
         GPY7k/TsIVU5/+Z1I1q2S/rcmvHmCXdjB6uj2KtBwM15AnWf1vWs6fxdIWbQLtKlfDaQ
         fOtBPZDdMecEtlIXSU73Z2tYEyt5i4lhLxakj8lQDaHA4/T2DNjocLHv/VCItuMp3FcT
         f576dlBGnBZOEkj3F3gNnlcfpZJuVpEJoX3Rc3D8xCHLKgmHYXXfwC+AZlIBayOj53zq
         J3NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FCPEKdow;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3-20020a05622a148300b003b820e518b7si5987766qtx.406.2023.02.26.21.50.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:50:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FCPEKdow;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWJA-0006MT-Up; Mon, 27 Feb 2023 00:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIr-0005Y3-6c
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:44:05 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIn-0005Lt-UC
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:59 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so8921957pjb.1
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zCqZBQrzNOn6osZDTRgqatKCTehdYwPWQUE6TO3Ir0=;
 b=FCPEKdowx1+Zhn3QKVOhpybUPL3EijaO7Y43UfPpXNGmALsHDbUBfgYAyKzaN0B11P
 eL71/lX0kMQHKg+ToN/tJNnAvUoq7cDr5snSUVGicroy/yaC5AMXZOgtOU2iE98hv8xB
 I5UvNlOBS9iZc1QvooNZVihXO76WPB701N7sVt6Qc91yKThw4mVtaTK7HFNuw+E/2hbd
 RmvknCMcHqiaEdWzW9yIzjh9g8nPInbK+uJxR9zgUNs+GCnhjKcsYGxqGDi9f72X+7BF
 jnAdlAE8z++mw+6XpixMyLwfdvedQ8pC5Mm9WQwiY0nrkCjkaZQSbbMSP1+odN2I2P/H
 iwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/zCqZBQrzNOn6osZDTRgqatKCTehdYwPWQUE6TO3Ir0=;
 b=upOdSXTymNFJYXxelkEvNI/2GiF0IdfLs9uSPuBo/0hbe4dCtXXzCsrTrLrdQtTjxU
 A6Kp3/FyOJ+enbYw1ZSoCw7q5u8y8a5BycPw+TSJlzVYG58xTHhEzym/fF5g/n6M/bVk
 8ItU/t2hriHqXihx6iRIWMsVCtmcYHEgZJ8JOC1FHJf+ZmtqbbnTGb3xiC4f/dJELTBH
 cSRsJqDy7kSa/jWvgSz/0IQ0dgV0jZXsIB0wE5mRzbVfQZml+sqJ7C7kEVW04AzDGFrD
 0yQTIynDrHKkpIZFd85RqqiCcrGM46Ztzix0JpLwbZTsuiS7slqD38NJlukxdeQNjs9j
 /TTQ==
X-Gm-Message-State: AO0yUKX/Bxrqwpu/+MSHF6u+rB+w3HKlWwikdimfWe5WuAcXbt7XBrhX
 9zVJjW8cPwkol6Vd01Oa/oiOtQ==
X-Received: by 2002:a05:6a20:748d:b0:cc:b0e0:5534 with SMTP id
 p13-20020a056a20748d00b000ccb0e05534mr8457008pzd.60.1677476636070; 
 Sun, 26 Feb 2023 21:43:56 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 27/70] target/m68k: Avoid tcg_const_i32 in bfop_reg
Date: Sun, 26 Feb 2023 19:41:50 -1000
Message-Id: <20230227054233.390271-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5IzkaC+tlhtq

Tidy up the whole function, hoisting is_bfffo as a common test
for whether tlen and tofs needed. Use tcg_constant_i32, and load
a separate temporary for mask.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 42 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 6f4151232f..3d97aaf578 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4031,14 +4031,8 @@ DISAS_INSN(bfop_reg)
     TCGv src = DREG(insn, 0);
     int len = ((extract32(ext, 0, 5) - 1) & 31) + 1;
     int ofs = extract32(ext, 6, 5);  /* big bit-endian */
-    TCGv mask, tofs, tlen;
-
-    tofs = NULL;
-    tlen = NULL;
-    if ((insn & 0x0f00) == 0x0d00) { /* bfffo */
-        tofs = tcg_temp_new();
-        tlen = tcg_temp_new();
-    }
+    TCGv mask, tofs = NULL, tlen = NULL;
+    bool is_bfffo = (insn & 0x0f00) == 0x0d00;
 
     if ((ext & 0x820) == 0) {
         /* Immediate width and offset.  */
@@ -4049,45 +4043,49 @@ DISAS_INSN(bfop_reg)
             tcg_gen_rotli_i32(QREG_CC_N, src, ofs);
         }
         tcg_gen_andi_i32(QREG_CC_N, QREG_CC_N, ~maski);
-        mask = tcg_const_i32(ror32(maski, ofs));
-        if (tofs) {
-            tcg_gen_movi_i32(tofs, ofs);
-            tcg_gen_movi_i32(tlen, len);
+
+        mask = tcg_constant_i32(ror32(maski, ofs));
+        if (is_bfffo) {
+            tofs = tcg_constant_i32(ofs);
+            tlen = tcg_constant_i32(len);
         }
     } else {
         TCGv tmp = tcg_temp_new();
+
+        mask = tcg_temp_new();
         if (ext & 0x20) {
             /* Variable width */
             tcg_gen_subi_i32(tmp, DREG(ext, 0), 1);
             tcg_gen_andi_i32(tmp, tmp, 31);
-            mask = tcg_const_i32(0x7fffffffu);
-            tcg_gen_shr_i32(mask, mask, tmp);
-            if (tlen) {
+            tcg_gen_shr_i32(mask, tcg_constant_i32(0x7fffffffu), tmp);
+            if (is_bfffo) {
+                tlen = tcg_temp_new();
                 tcg_gen_addi_i32(tlen, tmp, 1);
             }
         } else {
             /* Immediate width */
-            mask = tcg_const_i32(0x7fffffffu >> (len - 1));
-            if (tlen) {
-                tcg_gen_movi_i32(tlen, len);
+            tcg_gen_movi_i32(mask, 0x7fffffffu >> (len - 1));
+            if (is_bfffo) {
+                tlen = tcg_constant_i32(len);
             }
         }
+
         if (ext & 0x800) {
             /* Variable offset */
             tcg_gen_andi_i32(tmp, DREG(ext, 6), 31);
             tcg_gen_rotl_i32(QREG_CC_N, src, tmp);
             tcg_gen_andc_i32(QREG_CC_N, QREG_CC_N, mask);
             tcg_gen_rotr_i32(mask, mask, tmp);
-            if (tofs) {
-                tcg_gen_mov_i32(tofs, tmp);
+            if (is_bfffo) {
+                tofs = tmp;
             }
         } else {
             /* Immediate offset (and variable width) */
             tcg_gen_rotli_i32(QREG_CC_N, src, ofs);
             tcg_gen_andc_i32(QREG_CC_N, QREG_CC_N, mask);
             tcg_gen_rotri_i32(mask, mask, ofs);
-            if (tofs) {
-                tcg_gen_movi_i32(tofs, ofs);
+            if (is_bfffo) {
+                tofs = tcg_constant_i32(ofs);
             }
         }
     }
-- 
2.34.1

