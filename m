Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7552CD6100C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 11:35:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlQJ4-0002M2-BT; Thu, 29 Jan 2026 06:35:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlQIl-0002CL-7L
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:35:07 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlQIf-0007l3-IF
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:35:06 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so8835295e9.1
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 03:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769686499; x=1770291299; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UeYHngVgVLDRj+NMJd+pWVh0P03LOn7Sf9KsxEWjxW8=;
 b=lEZH0n4dVHtnb902CXixC7ik4k/nH/uSAyCtGyqKwzEoYoaqNBFoR8pCvCUXNcVS7v
 bCiVU9gZiUPfzYDxKxve2stB850t4U+7Jgo2uixx06DUbuGrCsRq+Gws+BbOWOtqRuEG
 XWAmQgSaQqxsBAxGQKFuuP8es+XTu+4tg8lW/Cx5vbz+WxtGIGMN2ai6DCmtj4bTH/r2
 8Vqf7uP6Y0AWiVJtXEqtr58M7i+eHDrtL7e72WA+nUS7w0eMeSohP1aK0Y7gJ4HYCckr
 EWxTmIZrZDdBXnAI+oowZu7UPaep6pWE6ZKFgBwzx9asbeBaqhn833caCjB52sGjU6Gz
 uUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769686499; x=1770291299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UeYHngVgVLDRj+NMJd+pWVh0P03LOn7Sf9KsxEWjxW8=;
 b=eP1mOetiLNO9LxUzWkKalZQ9qsifqshG/qVyoYG+cVTBmVvpWMSM63vNVPLn34sEk6
 zOeJG7M+LtpgyU+2pBdZ3fp2S2fcmBBZdBPth2pKC+JOtQWwbXFb0cuuFu5wD6MJPzVy
 gze2jMfipyd1kwLGbROiOYQ0MIcLUyVPX++9TOFmAGJiI4Kf5WjhsHVKZupO0d2yKZfy
 2fHfooE0TIibEQoL/e/jVXj2cOy1IMRwDWIM4qEnn3v775mUmn4byEXDihWTXAU4tNKc
 U8RliQ4KdbFHikPoVqoMaHUHx5o1H/ptKKQAwWddHl2bYygQH1Otb2CEhxHkp8YmXF5j
 CD7A==
X-Gm-Message-State: AOJu0YxKv/IA21p4LGxzmHzltpA5cVXdoHdPlfNvovvaxDR9lfpnOIag
 IuQsbnWwtI3Yzd9wGrbm4fw70c4SliWxHzsmX7MIfSPlqbd0ewtgzRACaxRmaDZkeBcErtZI7Yv
 cBww/OZU=
X-Gm-Gg: AZuq6aKFqpN4hx1P9rxno/1xAvZmouxrAJNnrcqP2KhWQCqkjCy5ARy8Yr/2cJ0TX3n
 sfhGFWmplpc2Jhuon/gdnkS2MBSmRrlyhYu1VQXM+7Ot1wYGw+oHyVCq3gzZ9tnSJp9hcbM4sHt
 c6d17rJHbOFxGxAynMlqAoAM6+vc21ZKBxj5YCES7L6Txky0yVG+6TxTPWR8Q9a4TKhj0L/0Ajc
 342yZF5nMOPMHQESojmkyRCJTutAmMs2XIIX4w7un4C2u83GkB2LU0CBUSBC8cdiXffoBtTdiPT
 tbv8jL5fdqGy3mRkLL5Mu+ftV9fpOLz674RXVt7kzqNQYszR0av0F+dLpyAk7n6bvJiv6ZcRpRa
 /Sf9XXko6jn+PyTYrQk/LMocxHO2k26viCb2UOEsR7LEjw8B7x/1UnAIQfbTHkxP6THih0K1TkN
 nkqSM9LF9ZDpE7t+PK//OtG5JPA9Rylw==
X-Received: by 2002:a05:600c:83ca:b0:480:4b59:932e with SMTP id
 5b1f17b1804b1-48069c1c2e2mr109367275e9.11.1769686499283; 
 Thu, 29 Jan 2026 03:34:59 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c42895sm196311075e9.14.2026.01.29.03.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 03:34:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v2 2/6] target/arm: Report correct vector width in gdbstub
 when SME present
Date: Thu, 29 Jan 2026 11:34:51 +0000
Message-ID: <20260129113455.1283266-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129113455.1283266-1-peter.maydell@linaro.org>
References: <20260129113455.1283266-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Our gdbstub implementation of the org.gnu.gdb.aarch64.sve feature
doesn't account for SME correctly.  We always report the Zn vector
registers with a width based on the maximum SVE vector register size,
even though SME's maximum size could be larger.

This is particularly bad in the case of a CPU with SME but not SVE,
because there the SVE vector width will be zero.  If we report the Zn
registers in the XML as having a zero width then gdb falls over with
an internal error:

 (gdb) target remote :1234
 Remote debugging using :1234
 /build/gdb-1WjiBe/gdb-15.0.50.20240403/gdb/aarch64-tdep.c:3066: internal-error: aarch64_pseudo_register_type: bad register number 160
 A problem internal to GDB has been detected,
 further debugging may prove unreliable.

Report the Zn registers with their correct size.  This matches how we
already handle the 'vg' pseudoregister in org.gnu.gdb.aarch64.sve: we
call sve_vqm1_for_el(), which returns the vector size accounting for
SME, not the pure SVE vector size.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
We should make sure we have agreement on the gdb side about
the interpretation of this bit of the protocol. See this
gdb mailing list email:
https://sourceware.org/pipermail/gdb/2026-January/052056.html
---
 target/arm/gdbstub64.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index c584e5b4e6..b71666c3a1 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -158,7 +158,7 @@ int aarch64_gdb_get_sve_reg(CPUState *cs, GByteArray *buf, int reg)
     case 0 ... 31:
     {
         int vq, len = 0;
-        for (vq = 0; vq < cpu->sve_max_vq; vq++) {
+        for (vq = 0; vq < arm_max_vq(cpu); vq++) {
             len += gdb_get_reg128(buf,
                                   env->vfp.zregs[reg].d[vq * 2 + 1],
                                   env->vfp.zregs[reg].d[vq * 2]);
@@ -174,7 +174,7 @@ int aarch64_gdb_get_sve_reg(CPUState *cs, GByteArray *buf, int reg)
     {
         int preg = reg - 34;
         int vq, len = 0;
-        for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
+        for (vq = 0; vq < arm_max_vq(cpu); vq = vq + 4) {
             len += gdb_get_reg64(buf, env->vfp.pregs[preg].p[vq / 4]);
         }
         return len;
@@ -208,7 +208,7 @@ int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg)
     case 0 ... 31:
     {
         int vq, len = 0;
-        for (vq = 0; vq < cpu->sve_max_vq; vq++) {
+        for (vq = 0; vq < arm_max_vq(cpu); vq++) {
             if (target_big_endian()) {
                 env->vfp.zregs[reg].d[vq * 2 + 1] = ldq_p(buf);
                 buf += 8;
@@ -233,7 +233,7 @@ int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg)
     {
         int preg = reg - 34;
         int vq, len = 0;
-        for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
+        for (vq = 0; vq < arm_max_vq(cpu); vq = vq + 4) {
             env->vfp.pregs[preg].p[vq / 4] = ldq_p(buf);
             buf += 8;
             len += 8;
@@ -540,8 +540,8 @@ static void output_vector_union_type(GDBFeatureBuilder *builder, int reg_width,
 GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    int reg_width = cpu->sve_max_vq * 128;
-    int pred_width = cpu->sve_max_vq * 16;
+    int reg_width = arm_max_vq(cpu) * 128;
+    int pred_width = arm_max_vq(cpu) * 16;
     GDBFeatureBuilder builder;
     char *name;
     int reg = 0;
-- 
2.43.0


