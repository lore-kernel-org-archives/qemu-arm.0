Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E46E7316F
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 13:34:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmu44-0006lz-8Z; Mon, 02 Feb 2026 08:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vmu41-0006jv-AH
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 08:34:01 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vmu3z-0002ZM-4I
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 08:34:01 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4806fbc6bf3so47829925e9.2
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 05:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770039237; x=1770644037; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZSrmdhiUgq2SNEfimuA2mrbtB8VoeGQdLMz68iV2+VQ=;
 b=YqjDcM6MEN5XV7FegGG35KqWyUw3dNcH9h/yJufnGykwqTUFRLjb9MA3KOsH5b+nkb
 7U9XOzFaresRclIRLsZgHjSKm07fcQWSNERxzJRil1BFUaYj14utwQljV4IVxfhmRgw8
 nSLiNCvA2jCc9mqcrsdU0rGy/02RiK7WcFE1sUzvEYwK3qSf88AnM9yUXkt+u2SzwAs3
 7foQxTF6FIA842E8xjDPL/WkL7kYgNJ+yLCcmpQ6t1miEFOZRSQC7BAjSAJsIVKH7dQK
 j/jSgL6mMzVJtCisgMUQynQw7yS6ZqPtUFysTR12CLfWjBKtdI0MbZecGiktGIpaj1RP
 f/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770039237; x=1770644037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZSrmdhiUgq2SNEfimuA2mrbtB8VoeGQdLMz68iV2+VQ=;
 b=fE5KYJjYKNhbkNc3QL0iTd2FwUU6aQqgbS1xkBBwC5Xu63Eiou+u68I/HF6qSeVh7o
 yCT95SPNtk9vS0vwuJco5XPrxS2cfzllIvqCvf3CBkYy+IIPmmJokt5Ib+TlEx4dBLix
 EXmWeP/E8RBfn0h49hEIFJv0ss66lf0xJPBa93SBkDs5azra/omQNSuB1vm84dYBSh8Q
 Z7nmB+dkpxlHI8kdEX2gxhjpDS+ujksXX3A9UQAsSTvleGdM9oMDkzpV9QuFGrToxPmi
 L1ObTm987MqHJNMzTn5ARqRF1GCDdzw2NeYSIKgMEqNQnuluAwTf6rx62c9EXkjWKzyd
 iWHg==
X-Gm-Message-State: AOJu0YyAnNNzGKPFC5nuBzlOGqS3ndovc4fXNg3ion8e6o9+9dsjATIQ
 2ASuU1oP2EXpsLdm2ykUWf+ouy/JY7ON1Qlo8ryGb1thcUWnNo1hlpE2IdLERddz0X6P2aFsUsR
 /RE+K
X-Gm-Gg: AZuq6aJFRbK3/61zpVXZWeXAxda/oV9Fb9NX/NdTonccbfKBsGowSXBwUbE0qpNo9PX
 DfOjPRZX4i6wLxfb5KMybUpliZuWF4M2nx4l23R7WaazUNNDHdSNo1ld7mVfu/m8F+ZDY6ADmpA
 se8aWXJO5B0dPsLHFso2J2TAvkTZfTmxON/7Df9qvSbbIfA0Y2+4I+CU1bsr0aB/5As9nlRafwH
 609NGR4aR3N2O927m4eTEZEM4CbAuL9ltjLm0orsWo+YFgQ1T8+cuGrS9eI/tfDeHtIu5X4zlgz
 UOLJjg40+D1XJaNDeMj1f5C99goZVmrkXOO89wMbNnQQnIdbpMPgN5LePBrDWfDbgo1Sr8pFJym
 KVnttNAg6xkzD0h/GE8+MesbGaa40MvOo87TPIJTJ+AEK2veceP+n6nx+luz/BuZf68ippQO59p
 oq3xzH41bcQurBoMaLcuX+QZFBxXaUg+tP3wBc4RDk
X-Received: by 2002:a05:600c:4e87:b0:477:b734:8c53 with SMTP id
 5b1f17b1804b1-482db46557cmr165258385e9.12.1770039237462; 
 Mon, 02 Feb 2026 05:33:57 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c42895sm478054495e9.14.2026.02.02.05.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 05:33:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 02/15] target/arm: Report correct vector width in gdbstub
 when SME present
Date: Mon,  2 Feb 2026 13:33:40 +0000
Message-ID: <20260202133353.2231685-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202133353.2231685-1-peter.maydell@linaro.org>
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


