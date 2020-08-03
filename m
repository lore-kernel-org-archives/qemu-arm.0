Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5953579lfy;
        Mon, 3 Aug 2020 04:19:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvgPr34F9niVLab0rcQHuMPHOY+jEL2QzyxqfjD8rp0itPeFhW40PWsheg/wB178Nz/FTS
X-Received: by 2002:a05:6902:6c8:: with SMTP id m8mr5057844ybt.153.1596453547131;
        Mon, 03 Aug 2020 04:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596453547; cv=none;
        d=google.com; s=arc-20160816;
        b=ZbCZu4pA/opPL9sG1P7m7Lqk60SMj9AbbS3UaiDY+Z6qBA8+q1t1bVkSBu4c+i5EcH
         o2vWMXzMZ7UNbp3VqNDTmhiIshA1DeERvEnypUqC3jaBqSx0SkJC5PtBFB9kNFMX3S9V
         7IdFsm11VSYTAlUGiCkd1wX0OYC0RcfS+M9hcPkT+Zk9YXI3+MB0o/BZjN8zTcJOM1oR
         7PBVwN5qgXriV/a/cyLOUYjFd+Z+bV/+9Zakb17FYM6rxWHgqozjGj7ZimM8N2W9S+bc
         WUwOVKVPm4LqfEYvwe/fJ9CYrlufj9TazZXIgUN2KS779E/sYemmG4Wgl0bygunlrf4W
         4rpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/neSeNxwoki6I3Nz+WJ6z9QBWGfcGKIdgejdhynD3JY=;
        b=PcoqiQuSH22Ex96mdgTeAi3/FlZhnsgdCJhsSsp/crjbC00iIUGU9pEfZa1eavVgT9
         XpuazXqskT7KF2nYKX91BPI/IoqpJnaEj0BVv5kXCGD6L8cN0EeqnL/csE17d8gcLnt6
         nyP9WdmkRjYPpNiGtuKgAKsojq8gzFEN+n9O8wXD+d+zpuXajBY3Wyw+Gy/JTn9RL8gX
         WTCixROkkIBQuyT9apBJ6El/4QWVzQhjTMpVTL6R/g0rl+USrV0rF1i0ezKnpWqI57s7
         gpuofK/3rLML4diSka667Viq7uEcdgi8nb5U+ROoVaLak8gEmp10iKINlbOyfBmw1jB6
         uSHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nnNtqdEv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si13976497ybc.489.2020.08.03.04.19.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 04:19:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nnNtqdEv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2YUk-0003hs-Hp
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 07:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2YUc-0003hR-MO
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 07:18:58 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2YUZ-0004s6-M4
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 07:18:58 -0400
Received: by mail-wm1-x343.google.com with SMTP id t14so9869724wmi.3
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2020 04:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/neSeNxwoki6I3Nz+WJ6z9QBWGfcGKIdgejdhynD3JY=;
 b=nnNtqdEvagU3M94UKB7O0AlcjUn6f382ygY/Gg4IVF4k6TqQkCLqVGp3ssTzrGgbtp
 l4OMMKRYEj1wxbrDL8Yl18i1HBlbBKavpGmvVloUpGsHJB08eoBlSQctu6zRdKwgZ0hU
 8c4kEdDhRS3hnwMj43r8+OQU5l8+gclQExE2mfJ5JxapnuKUwQWZ53rsoX1+zLSJr/X3
 jCN5QxtgbKgTojBQlJ8MQGXS3c7hFXJ4vuqWfjIIZ6y0dJkoO1ECI8kKJQudCNBSV2Er
 Zr0yNoJJV6S/36QWpEKHJ/fqnZ8dekQ7lAY0wtzPR5hIAG43NQdsYMxsMdoXDmxxT+1I
 f+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/neSeNxwoki6I3Nz+WJ6z9QBWGfcGKIdgejdhynD3JY=;
 b=I8xgmQbG1WEoEWwW5T91JNpmdZ5Cp/upWqmrMfaHUjNXI2QGnMLIeHPvebyKyadkMD
 wrtTvX/nUJDiVOtH2zybnjjiQsto2LGpPp2z60Ofv9yjQd8lcwkn+y8Ia+CJ2DCAUN5q
 WwnEXFBBXMh0jG3qJTsR98il4xnDh4usyWp/l0ts2i83Ivi7o1s4tYGIXBGyTlk73fFq
 kFBch7bnhbZxaM5EblUyZixs7AtkPjJU1kSzINGcxi3wui/3ZDHX1wNoS80ezb6P7aSz
 h0ZjZq8JdU8D80MrtwFqrTap/BOKq713yFDOOwL0YyIzK1MMaJZycwxum3z+SShzEwVz
 oorQ==
X-Gm-Message-State: AOAM5309CvUi2OFj45RwQzFC8brEQIpTmoovqvFXGqAFQamalkgx0pzv
 vBUidco3ZiPpoqS/y6dFobcD6OFcA/I/nA==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr14860688wmk.86.1596453533557; 
 Mon, 03 Aug 2020 04:18:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g3sm28013170wrb.59.2020.08.03.04.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 04:18:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/7] target/arm: Pull handling of XScale insns out of
 disas_coproc_insn()
Date: Mon,  3 Aug 2020 12:18:43 +0100
Message-Id: <20200803111849.13368-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200803111849.13368-1-peter.maydell@linaro.org>
References: <20200803111849.13368-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: esAdxRhiSJd0

At the moment we check for XScale/iwMMXt insns inside
disas_coproc_insn(): for CPUs with ARM_FEATURE_XSCALE all copro insns
with cp 0 or 1 are handled specially.  This works, but is an odd
place for this check, because disas_coproc_insn() is called from both
the Arm and Thumb decoders but the XScale case never applies for
Thumb (all the XScale CPUs were ARMv5, which has only Thumb1, not
Thumb2 with the 32-bit coprocessor insn encodings).  It also makes it
awkward to convert the real copro access insns to decodetree.

Move the identification of XScale out to its own function
which is only called from disas_arm_insn().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 44 ++++++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index c39a929b938..a2765fc60b2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4551,20 +4551,6 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
 
     cpnum = (insn >> 8) & 0xf;
 
-    /* First check for coprocessor space used for XScale/iwMMXt insns */
-    if (arm_dc_feature(s, ARM_FEATURE_XSCALE) && (cpnum < 2)) {
-        if (extract32(s->c15_cpar, cpnum, 1) == 0) {
-            return 1;
-        }
-        if (arm_dc_feature(s, ARM_FEATURE_IWMMXT)) {
-            return disas_iwmmxt_insn(s, insn);
-        } else if (arm_dc_feature(s, ARM_FEATURE_XSCALE)) {
-            return disas_dsp_insn(s, insn);
-        }
-        return 1;
-    }
-
-    /* Otherwise treat as a generic register access */
     is64 = (insn & (1 << 25)) == 0;
     if (!is64 && ((insn & (1 << 4)) == 0)) {
         /* cdp */
@@ -4823,6 +4809,23 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
     return 1;
 }
 
+/* Decode XScale DSP or iWMMXt insn (in the copro space, cp=0 or 1) */
+static void disas_xscale_insn(DisasContext *s, uint32_t insn)
+{
+    int cpnum = (insn >> 8) & 0xf;
+
+    if (extract32(s->c15_cpar, cpnum, 1) == 0) {
+        unallocated_encoding(s);
+    } else if (arm_dc_feature(s, ARM_FEATURE_IWMMXT)) {
+        if (disas_iwmmxt_insn(s, insn)) {
+            unallocated_encoding(s);
+        }
+    } else if (arm_dc_feature(s, ARM_FEATURE_XSCALE)) {
+        if (disas_dsp_insn(s, insn)) {
+            unallocated_encoding(s);
+        }
+    }
+}
 
 /* Store a 64-bit value to a register pair.  Clobbers val.  */
 static void gen_storeq_reg(DisasContext *s, int rlow, int rhigh, TCGv_i64 val)
@@ -8270,15 +8273,26 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
     case 0xc:
     case 0xd:
     case 0xe:
-        if (((insn >> 8) & 0xe) == 10) {
+    {
+        /* First check for coprocessor space used for XScale/iwMMXt insns */
+        int cpnum = (insn >> 8) & 0xf;
+
+        if (arm_dc_feature(s, ARM_FEATURE_XSCALE) && (cpnum < 2)) {
+            disas_xscale_insn(s, insn);
+            break;
+        }
+
+        if ((cpnum & 0xe) == 10) {
             /* VFP, but failed disas_vfp.  */
             goto illegal_op;
         }
+
         if (disas_coproc_insn(s, insn)) {
             /* Coprocessor.  */
             goto illegal_op;
         }
         break;
+    }
     default:
     illegal_op:
         unallocated_encoding(s);
-- 
2.20.1

