Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1501023lfc;
        Thu, 11 Jun 2020 07:51:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrxSIddQqVFnBo3FvRhm9OobW1Q5PUBW1xlBD0VG2ZPkIRRgzLmpB/a6lStoC7Vc1qZ/8X
X-Received: by 2002:a25:df0b:: with SMTP id w11mr15282049ybg.449.1591887086031;
        Thu, 11 Jun 2020 07:51:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591887086; cv=none;
        d=google.com; s=arc-20160816;
        b=REHE1vWhaCQIQerUJgflz1jpqe7nWD9gJhRGUrOTJb9cbDU3B5orgl2gDmXJ/zfGJR
         w73R1pt8HrRTUgImDMkX/iToNbM2PAIi1Ad7bTqn1TjufoEz/457Q7ABmvyhhu15gO+8
         u+OvaFPuuh2sHcty5BLSRLuz11ziOEpQkdTQ2iaitNnWOYqLmpQEonhjnBy5AjW+uvYC
         wxPLbFC02x42OoKfLEAsRnk6VXNZO5JcP56WBbBRIpnIjr6v+YE2nVhA71MIFwFRvjp8
         XAjmOhnSdnimnnDSRn6eEj0P1s5KT47bzhuXK7NXlniVbMhNnrzN5P51z/aMsBdI12Pk
         e30w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cq48sZHddC4o6oJ2WmnwSWUEEe57gydI+UXN9zRR5WE=;
        b=k7wj0nEG+AvF4LpvUdvTt8R3qXpHFPz1Q2DpGY5oNpd8JRo5bVuPlZyqlkuPtEozF2
         WuL4qJ/M25AajcYcZdrLc2lH88VtC4Vm3ADGqoejO0k0crNlIWn901Kx76vDWZab+Sq2
         ubwA3+bVhrBF3SRNSFGXvMvY8cuI0A2Hjqp1r+Lexz0BjKwiy981oZg4oYViKZrrUFQX
         tEx73KwSHLhpFu1+jAd5rtiHU+DbSLHjEihr+QvFqHMLGMbJwxtKB61aaW6fDrQ2fO/x
         71+OLXSRdAHBIEn9cuFaeBDuoG+ZSpKnqU36GnI/PNMmgz/uOgBYvhwTNXrs/4FR94hc
         vN5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gFd9Bcv3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15si2679531ybp.154.2020.06.11.07.51.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 07:51:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gFd9Bcv3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjOY9-0000Nu-Bh
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 10:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjOSt-0001i8-Jl
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 10:45:59 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35291)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjOSo-0003wY-Qf
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 10:45:59 -0400
Received: by mail-wm1-x342.google.com with SMTP id q25so5333449wmj.0
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cq48sZHddC4o6oJ2WmnwSWUEEe57gydI+UXN9zRR5WE=;
 b=gFd9Bcv305OuYQMD35Bz/M9U7ec/PIeQpJ0pdGCScdU9Y0HOMwpLXY3vEYlAXjta78
 DVoRNW3ilZDj4tk/Qzt3T5UYCDrMBWlIKBVVDlzGNAaU43FOrb+2YCfymvQzSrhRo2gB
 AverT7maOujXA631QBlbgip2gVMHf42SFWVgDiQN+jzxMsV4X8oiOrPjk5tAYwTY80hW
 CkBBEPntFRX34uKpVCxU9RZCH7EP4K3zSicGfuCghIkJcMnia2Kx2eOJr+FO2t4FTfmc
 Xj18CO7ZTXsq+YWzjamqvcTw5dcfjw6L4h15gFgMIHwydaEds+Lz8Kvo4J5YrSBMx1Rg
 BzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cq48sZHddC4o6oJ2WmnwSWUEEe57gydI+UXN9zRR5WE=;
 b=IWyMI7070g0PGcch3qmrAlbUyRn3A64+wREGqemqbvPyoJxhHvlWWM1NnOL+IqQQji
 t9SxRUecz4h3qsZ3GlNRlhJGODhKfgPpYSCrcqGI4tbv11XfCfQStPh99JxFKfDw4a9u
 2SLYNMCKUeJeeEzlop64ogZQSHn8JMlGRn9MBkeywM2SKGPagJk1cAEhEORaPniSbvMo
 ddKpiEmAbVsN9VGrLAfAscK898ZnTCLwlE2ktw2akd4R7nX5mRyUl09cv2G0U+3Hlp1P
 rq4pJrXC4ZhAjyOIu3RTRNcivpDQ9EEUB//a4J+SgVmhMBpSOPhPJXdWIY/cyEqMDx8b
 r9YQ==
X-Gm-Message-State: AOAM5334bfP8xX9avgdiMPSmF7usAg1W6F0jau/buKRUh/rUOyrK/oyJ
 zd5vYHMu0KptzjCWHKwU9Pc7iQ==
X-Received: by 2002:a1c:bcd5:: with SMTP id m204mr7992016wmf.146.1591886745377; 
 Thu, 11 Jun 2020 07:45:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h18sm5271658wru.7.2020.06.11.07.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 07:45:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/10] target/arm: Convert Neon VDUP (scalar) to decodetree
Date: Thu, 11 Jun 2020 15:45:29 +0100
Message-Id: <20200611144529.8873-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200611144529.8873-1-peter.maydell@linaro.org>
References: <20200611144529.8873-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kxgTE8iZjceN

Convert the Neon VDUP (scalar) insn to decodetree.  (Note that we
can't call this just "VDUP" as we used that already in vfp.decode for
the "VDUP (general purpose register" insn.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       |  7 +++++++
 target/arm/translate-neon.inc.c | 26 ++++++++++++++++++++++++++
 target/arm/translate.c          | 25 +------------------------
 3 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 91bc770dfbc..6d890b2161f 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -422,6 +422,13 @@ Vimm_1r          1111 001 . 1 . 000 ... .... cmode:4 0 . op:1 1 .... @1reg_imm
 
     VTBL         1111 001 1 1 . 11 .... .... 10 len:2 . op:1 . 0 .... \
                  vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+    VDUP_scalar  1111 001 1 1 . 11 index:3 1 .... 11 000 q:1 . 0 .... \
+                 vm=%vm_dp vd=%vd_dp size=0
+    VDUP_scalar  1111 001 1 1 . 11 index:2 10 .... 11 000 q:1 . 0 .... \
+                 vm=%vm_dp vd=%vd_dp size=1
+    VDUP_scalar  1111 001 1 1 . 11 index:1 100 .... 11 000 q:1 . 0 .... \
+                 vm=%vm_dp vd=%vd_dp size=2
   ]
 
   # Subgroup for size != 0b11
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 83d5c3eae31..cfbc546f484 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -2944,3 +2944,29 @@ static bool trans_VTBL(DisasContext *s, arg_VTBL *a)
     tcg_temp_free_i32(tmp);
     return true;
 }
+
+static bool trans_VDUP_scalar(DisasContext *s, arg_VDUP_scalar *a)
+{
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if (a->vd & a->q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    tcg_gen_gvec_dup_mem(a->size, neon_reg_offset(a->vd, 0),
+                         neon_element_offset(a->vm, a->index, a->size),
+                         a->q ? 16 : 8, a->q ? 16 : 8);
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0c6425928f6..6d18892adee 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5574,31 +5574,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     }
                     break;
                 }
-            } else if ((insn & (1 << 10)) == 0) {
-                /* VTBL, VTBX: handled by decodetree */
-                return 1;
-            } else if ((insn & 0x380) == 0) {
-                /* VDUP */
-                int element;
-                MemOp size;
-
-                if ((insn & (7 << 16)) == 0 || (q && (rd & 1))) {
-                    return 1;
-                }
-                if (insn & (1 << 16)) {
-                    size = MO_8;
-                    element = (insn >> 17) & 7;
-                } else if (insn & (1 << 17)) {
-                    size = MO_16;
-                    element = (insn >> 18) & 3;
-                } else {
-                    size = MO_32;
-                    element = (insn >> 19) & 1;
-                }
-                tcg_gen_gvec_dup_mem(size, neon_reg_offset(rd, 0),
-                                     neon_element_offset(rm, element, size),
-                                     q ? 16 : 8, q ? 16 : 8);
             } else {
+                /* VTBL, VTBX, VDUP: handled by decodetree */
                 return 1;
             }
         }
-- 
2.20.1

