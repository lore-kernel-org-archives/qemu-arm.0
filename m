Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp617001lfc;
        Tue, 13 Jul 2021 07:04:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyVfxmNtKsjFp56T/B2mx0BGmUAPF26Pcx0kMLH/mGzTUawLBuXGCOU8SP0PxpGustdiKD
X-Received: by 2002:a5d:67cc:: with SMTP id n12mr5950939wrw.131.1626185057202;
        Tue, 13 Jul 2021 07:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626185057; cv=none;
        d=google.com; s=arc-20160816;
        b=bJrJGz75PBbm015VBjkydGG4q7SFPajJ2zU8tOJpS2S+phI8ppirEZOozG0JlIb43A
         GkfZna1LezavA0HECz2EUgyM3KnU4uPcG9baMfVEFkUHyhAGWPofCO2vKt28pyyEQR9x
         Rpo1wCJTCClsIuvzM7h6EjGSrkFNn+R8T8s8CNpWq0psddV4zWC2SxexTHOdrb+vd6e5
         pRkpbuj9HkR+PP1VRrA0p5ln3apMfhUFF6uHWOvEGSXtXPk2lHyN/cC51cMV2ilOahUi
         cakyDyZ8y7JKgi6iefpHwura+KgQWfXocrbPvCzudWwNp3C6F68dzIm/+cbism70tl/r
         T6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ezvyuOx6k7IOrukp8TdSAl9DSXaSG8vwOoLlVakuAlI=;
        b=neGYHUeosBTG4mp/S9aIyb2ez7J/knrtHLS7l7H8dbI3+LDyTr6Pz4p1t6p5uYu/tc
         JDhLN4mcxRvzIzytRnoyRvGO7d/TUA2Wum7DWoi0LlKB8ewdieeW8etNOwgHx3YE9tem
         q9ILvoqYhNjid2OucD4vJXCAWMAFi+vNiJSNMbCBeLid5rgqNnePlyH8BUNu1/dxVV+x
         svLk9P4qTdLeaREsw409gpeFAmMlsOWghzriWc1T9FK0xTSDySiDM2ViMQP7+gRAEMwq
         TR/cXD9iGkrzWRopFxdBEzBfEXhCkoTN31HTvy5IzlNu4CQm/wmh04v7s6p/OL8jpunA
         FmPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xMSOWfwd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si26359573wrh.171.2021.07.13.07.04.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 07:04:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xMSOWfwd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3J1E-0004jb-2w
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 10:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibu-0000Yd-8o
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:38:06 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibj-0003qx-NC
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:38:06 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d2so30572861wrn.0
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 06:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ezvyuOx6k7IOrukp8TdSAl9DSXaSG8vwOoLlVakuAlI=;
 b=xMSOWfwdSthijX6JAvnMlLZaLu+AH+h4Fx09tR86/x5tp6RrF+Jc+LqMezl6tmR7T3
 inXeTfzCz7P+maVwXvlIMx04bxxWfTE0hKop6cM9n5cqxYWrMMZCMoinoYNde7jAa0Xc
 kBX8nsu2MSOtvQN8WismVwv+4FBJYACoUf1azlaiZJEQIkTcVn/OaOIiyW1g2H0gwpfg
 No5dZQDAAQL7ylEB/ClydrDCviyBqWmjhiH3zj16T5j1JAKMiP5Fl00SkT0MEDsgOcvE
 bivPHVSEqr7oS2LlWW2Mj0F6NcMIogIYIpSmfSf6A7N7Di2rFT4v+OSVFmDD3+G5T5En
 iTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ezvyuOx6k7IOrukp8TdSAl9DSXaSG8vwOoLlVakuAlI=;
 b=JyU9LdqsBsAfjGrj4G4XTwmkqYpddsOJ9fSC1I/QLtIuxygx21qjvKkWlcaCSvyEQC
 fMZCxT+qcK9L/QGz1S9p6ye1SKPIQVFloIhpsxCxjEQ6m0QLggxQ/GDJfPdF1r36zPV/
 jwQj6b1L46slmW/KPhRjHTHHCnVHSZc8mxZiPwgFyY2eJZtpkx4CNpJu39bytIz0ptPn
 CzA/ZTbvZg7UlvbN/psZmnRXB0zv7F8b6zsSYeXH6TTnYboliJXHIJ1slrmmks9dF9v4
 0D9arh3fR65mN5g8J1DGbxI/YPWovAY5RJYvghC13EgrtL632Gi6V7B7Mo9wKTKRFohl
 wYkw==
X-Gm-Message-State: AOAM530E+dEpvQ1YfEorx7y68QQLTHFZLMR2KcyRIua4ykQ0ybBJuBPo
 OrhCfZqUo0/Ij6HH/8h8M/bEYzDidu9GT+AF
X-Received: by 2002:a5d:6b06:: with SMTP id v6mr5975506wrw.146.1626183474415; 
 Tue, 13 Jul 2021 06:37:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 32/34] target/arm: Implement MVE scatter-gather insns
Date: Tue, 13 Jul 2021 14:37:24 +0100
Message-Id: <20210713133726.26842-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mYXiCb3djLVr

Implement the MVE gather-loads and scatter-stores which
form the address by adding a base value from a scalar
register to an offset in each element of a vector.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  32 +++++++++
 target/arm/mve.decode      |  12 ++++
 target/arm/mve_helper.c    | 129 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  91 ++++++++++++++++++++++++++
 4 files changed, 264 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 55f9151ccbf..9c570270c61 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -33,6 +33,38 @@ DEF_HELPER_FLAGS_3(mve_vstrb_h, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrb_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrh_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vldrb_sg_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrb_sg_sw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrh_sg_sw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vldrb_sg_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrb_sg_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrb_sg_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrh_sg_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrh_sg_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrw_sg_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrd_sg_ud, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vstrb_sg_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrb_sg_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrb_sg_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrh_sg_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrh_sg_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrw_sg_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrd_sg_ud, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vldrh_sg_os_sw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vldrh_sg_os_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrh_sg_os_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrw_sg_os_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vldrd_sg_os_ud, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vstrh_sg_os_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrh_sg_os_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrw_sg_os_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vstrd_sg_os_ud, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(mve_vdup, TCG_CALL_NO_WG, void, env, ptr, i32)
 
 DEF_HELPER_FLAGS_4(mve_vidupb, TCG_CALL_NO_WG, i32, env, ptr, i32, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 82dc07bc30e..b0e39f36723 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -42,11 +42,18 @@
 &shl_scalar qda rm size
 &vmaxv qm rda size
 &vabav qn qm rda size
+&vldst_sg qd qm rn size msize os
+
+# scatter-gather memory size is in bits 6:4
+%sg_msize 6:1 4:1
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
 @vldst_wn ... u:1 ... . . . . l:1 . rn:3 qd:3 . ... .. imm:7 &vldr_vstr
 
+@vldst_sg .... .... .... rn:4 .... ... size:2 ... ... os:1 &vldst_sg \
+          qd=%qd qm=%qm msize=%sg_msize
+
 @1op .... .... .... size:2 .. .... .... .... .... &1op qd=%qd qm=%qm
 @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
 @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
@@ -136,6 +143,11 @@ VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111101 .......   @vldr_vstr \
 VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
                  size=2 p=1
 
+# gather loads/scatter stores
+VLDR_S_sg        111 0 1100 1 . 01 .... ... 0 111 . .... .... @vldst_sg
+VLDR_U_sg        111 1 1100 1 . 01 .... ... 0 111 . .... .... @vldst_sg
+VSTR_sg          111 0 1100 1 . 00 .... ... 0 111 . .... .... @vldst_sg
+
 # Moves between 2 32-bit vector lanes and 2 general purpose registers
 VMOV_to_2gp      1110 1100 0 . 00 rt2:4 ... 0 1111 000 idx:1 rt:4 qd=%qd
 VMOV_from_2gp    1110 1100 0 . 01 rt2:4 ... 0 1111 000 idx:1 rt:4 qd=%qd
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 210e70d1727..36592b88372 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -213,6 +213,135 @@ DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
 #undef DO_VLDR
 #undef DO_VSTR
 
+/*
+ * Gather loads/scatter stores. Here each element of Qm specifies
+ * an offset to use from the base register Rm. In the _os_ versions
+ * that offset is scaled by the element size.
+ * For loads, predicated lanes are zeroed instead of retaining
+ * their previous values.
+ */
+#define DO_VLDR_SG(OP, LDTYPE, ESIZE, TYPE, OFFTYPE, ADDRFN)            \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm,         \
+                          uint32_t base)                                \
+    {                                                                   \
+        TYPE *d = vd;                                                   \
+        OFFTYPE *m = vm;                                                \
+        uint16_t mask = mve_element_mask(env);                          \
+        uint16_t eci_mask = mve_eci_mask(env);                          \
+        unsigned e;                                                     \
+        uint32_t addr;                                                  \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE, eci_mask >>= ESIZE) { \
+            if (!(eci_mask & 1)) {                                      \
+                continue;                                               \
+            }                                                           \
+            addr = ADDRFN(base, m[H##ESIZE(e)]);                        \
+            d[H##ESIZE(e)] = (mask & 1) ?                               \
+                cpu_##LDTYPE##_data_ra(env, addr, GETPC()) : 0;         \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+/* We know here TYPE is unsigned so always the same as the offset type */
+#define DO_VSTR_SG(OP, STTYPE, ESIZE, TYPE, ADDRFN)                     \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm,         \
+                          uint32_t base)                                \
+    {                                                                   \
+        TYPE *d = vd;                                                   \
+        TYPE *m = vm;                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        uint32_t addr;                                                  \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            addr = ADDRFN(base, m[H##ESIZE(e)]);                        \
+            if (mask & 1) {                                             \
+                cpu_##STTYPE##_data_ra(env, addr, d[H##ESIZE(e)], GETPC()); \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+/*
+ * 64-bit accesses are slightly different: they are done as two 32-bit
+ * accesses, controlled by the predicate mask for the relevant beat,
+ * and with a single 32-bit offset in the first of the two Qm elements.
+ * Note that for QEMU our IMPDEF AIRCR.ENDIANNESS is always 0 (little).
+ */
+#define DO_VLDR64_SG(OP, ADDRFN)                                        \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm,         \
+                          uint32_t base)                                \
+    {                                                                   \
+        uint32_t *d = vd;                                               \
+        uint32_t *m = vm;                                               \
+        uint16_t mask = mve_element_mask(env);                          \
+        uint16_t eci_mask = mve_eci_mask(env);                          \
+        unsigned e;                                                     \
+        uint32_t addr;                                                  \
+        for (e = 0; e < 16 / 4; e++, mask >>= 4, eci_mask >>= 4) {      \
+            if (!(eci_mask & 1)) {                                      \
+                continue;                                               \
+            }                                                           \
+            addr = ADDRFN(base, m[H4(e & ~1)]);                         \
+            addr += 4 * (e & 1);                                        \
+            d[H4(e)] = (mask & 1) ? cpu_ldl_data_ra(env, addr, GETPC()) : 0; \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VSTR64_SG(OP, ADDRFN)                                        \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm,         \
+                          uint32_t base)                                \
+    {                                                                   \
+        uint32_t *d = vd;                                               \
+        uint32_t *m = vm;                                               \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        uint32_t addr;                                                  \
+        for (e = 0; e < 16 / 4; e++, mask >>= 4) {                      \
+            addr = ADDRFN(base, m[H4(e & ~1)]);                         \
+            addr += 4 * (e & 1);                                        \
+            if (mask & 1) {                                             \
+                cpu_stl_data_ra(env, addr, d[H4(e)], GETPC());          \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define ADDR_ADD(BASE, OFFSET) ((BASE) + (OFFSET))
+#define ADDR_ADD_OSH(BASE, OFFSET) ((BASE) + ((OFFSET) << 1))
+#define ADDR_ADD_OSW(BASE, OFFSET) ((BASE) + ((OFFSET) << 2))
+#define ADDR_ADD_OSD(BASE, OFFSET) ((BASE) + ((OFFSET) << 3))
+
+DO_VLDR_SG(vldrb_sg_sh, ldsb, 2, int16_t, uint16_t, ADDR_ADD)
+DO_VLDR_SG(vldrb_sg_sw, ldsb, 4, int32_t, uint32_t, ADDR_ADD)
+DO_VLDR_SG(vldrh_sg_sw, ldsw, 4, int32_t, uint32_t, ADDR_ADD)
+
+DO_VLDR_SG(vldrb_sg_ub, ldub, 1, uint8_t, uint8_t, ADDR_ADD)
+DO_VLDR_SG(vldrb_sg_uh, ldub, 2, uint16_t, uint16_t, ADDR_ADD)
+DO_VLDR_SG(vldrb_sg_uw, ldub, 4, uint32_t, uint32_t, ADDR_ADD)
+DO_VLDR_SG(vldrh_sg_uh, lduw, 2, uint16_t, uint16_t, ADDR_ADD)
+DO_VLDR_SG(vldrh_sg_uw, lduw, 4, uint32_t, uint32_t, ADDR_ADD)
+DO_VLDR_SG(vldrw_sg_uw, ldl, 4, uint32_t, uint32_t, ADDR_ADD)
+DO_VLDR64_SG(vldrd_sg_ud, ADDR_ADD)
+
+DO_VLDR_SG(vldrh_sg_os_sw, ldsw, 4, int32_t, uint32_t, ADDR_ADD_OSH)
+DO_VLDR_SG(vldrh_sg_os_uh, lduw, 2, uint16_t, uint16_t, ADDR_ADD_OSH)
+DO_VLDR_SG(vldrh_sg_os_uw, lduw, 4, uint32_t, uint32_t, ADDR_ADD_OSH)
+DO_VLDR_SG(vldrw_sg_os_uw, ldl, 4, uint32_t, uint32_t, ADDR_ADD_OSW)
+DO_VLDR64_SG(vldrd_sg_os_ud, ADDR_ADD_OSD)
+
+DO_VSTR_SG(vstrb_sg_ub, stb, 1, uint8_t, ADDR_ADD)
+DO_VSTR_SG(vstrb_sg_uh, stb, 2, uint16_t, ADDR_ADD)
+DO_VSTR_SG(vstrb_sg_uw, stb, 4, uint32_t, ADDR_ADD)
+DO_VSTR_SG(vstrh_sg_uh, stw, 2, uint16_t, ADDR_ADD)
+DO_VSTR_SG(vstrh_sg_uw, stw, 4, uint32_t, ADDR_ADD)
+DO_VSTR_SG(vstrw_sg_uw, stl, 4, uint32_t, ADDR_ADD)
+DO_VSTR64_SG(vstrd_sg_ud, ADDR_ADD)
+
+DO_VSTR_SG(vstrh_sg_os_uh, stw, 2, uint16_t, ADDR_ADD_OSH)
+DO_VSTR_SG(vstrh_sg_os_uw, stw, 4, uint32_t, ADDR_ADD_OSH)
+DO_VSTR_SG(vstrw_sg_os_uw, stl, 4, uint32_t, ADDR_ADD_OSW)
+DO_VSTR64_SG(vstrd_sg_os_ud, ADDR_ADD_OSD)
+
 /*
  * The mergemask(D, R, M) macro performs the operation "*D = R" but
  * storing only the bytes which correspond to 1 bits in M,
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index be5a3e1a1f5..b0e4bdeb1c5 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -34,6 +34,7 @@ static inline int vidup_imm(DisasContext *s, int x)
 #include "decode-mve.c.inc"
 
 typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
+typedef void MVEGenLdStSGFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpScalarFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
@@ -209,6 +210,96 @@ DO_VLDST_WIDE_NARROW(VLDSTB_H, vldrb_sh, vldrb_uh, vstrb_h, MO_8)
 DO_VLDST_WIDE_NARROW(VLDSTB_W, vldrb_sw, vldrb_uw, vstrb_w, MO_8)
 DO_VLDST_WIDE_NARROW(VLDSTH_W, vldrh_sw, vldrh_uw, vstrh_w, MO_16)
 
+static bool do_ldst_sg(DisasContext *s, arg_vldst_sg *a, MVEGenLdStSGFn fn)
+{
+    TCGv_i32 addr;
+    TCGv_ptr qd, qm;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qd | a->qm) ||
+        !fn || a->rn == 15) {
+        /* Rn case is UNPREDICTABLE */
+        return false;
+    }
+
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    addr = load_reg(s, a->rn);
+
+    qd = mve_qreg_ptr(a->qd);
+    qm = mve_qreg_ptr(a->qm);
+    fn(cpu_env, qd, qm, addr);
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_ptr(qm);
+    tcg_temp_free_i32(addr);
+    mve_update_eci(s);
+    return true;
+}
+
+/*
+ * The naming scheme here is "vldrb_sg_sh == in-memory byte loads
+ * signextended to halfword elements in register". _os_ indicates that
+ * the offsets in Qm should be scaled by the element size.
+ */
+/* This macro is just to make the arrays more compact in these functions */
+#define F(N) gen_helper_mve_##N
+
+/* VLDRB/VSTRB (ie msize 1) with OS=1 is UNPREDICTABLE; we UNDEF */
+static bool trans_VLDR_S_sg(DisasContext *s, arg_vldst_sg *a)
+{
+    static MVEGenLdStSGFn * const fns[2][4][4] = { {
+            { NULL, F(vldrb_sg_sh), F(vldrb_sg_sw), NULL },
+            { NULL, NULL,           F(vldrh_sg_sw), NULL },
+            { NULL, NULL,           NULL,           NULL },
+            { NULL, NULL,           NULL,           NULL }
+        }, {
+            { NULL, NULL,              NULL,              NULL },
+            { NULL, NULL,              F(vldrh_sg_os_sw), NULL },
+            { NULL, NULL,              NULL,              NULL },
+            { NULL, NULL,              NULL,              NULL }
+        }
+    };
+    return do_ldst_sg(s, a, fns[a->os][a->msize][a->size]);
+}
+
+static bool trans_VLDR_U_sg(DisasContext *s, arg_vldst_sg *a)
+{
+    static MVEGenLdStSGFn * const fns[2][4][4] = { {
+            { F(vldrb_sg_ub), F(vldrb_sg_uh), F(vldrb_sg_uw), NULL },
+            { NULL,           F(vldrh_sg_uh), F(vldrh_sg_uw), NULL },
+            { NULL,           NULL,           F(vldrw_sg_uw), NULL },
+            { NULL,           NULL,           NULL,           F(vldrd_sg_ud) }
+        }, {
+            { NULL, NULL,              NULL,              NULL },
+            { NULL, F(vldrh_sg_os_uh), F(vldrh_sg_os_uw), NULL },
+            { NULL, NULL,              F(vldrw_sg_os_uw), NULL },
+            { NULL, NULL,              NULL,              F(vldrd_sg_os_ud) }
+        }
+    };
+    return do_ldst_sg(s, a, fns[a->os][a->msize][a->size]);
+}
+
+static bool trans_VSTR_sg(DisasContext *s, arg_vldst_sg *a)
+{
+    static MVEGenLdStSGFn * const fns[2][4][4] = { {
+            { F(vstrb_sg_ub), F(vstrb_sg_uh), F(vstrb_sg_uw), NULL },
+            { NULL,           F(vstrh_sg_uh), F(vstrh_sg_uw), NULL },
+            { NULL,           NULL,           F(vstrw_sg_uw), NULL },
+            { NULL,           NULL,           NULL,           F(vstrd_sg_ud) }
+        }, {
+            { NULL, NULL,              NULL,              NULL },
+            { NULL, F(vstrh_sg_os_uh), F(vstrh_sg_os_uw), NULL },
+            { NULL, NULL,              F(vstrw_sg_os_uw), NULL },
+            { NULL, NULL,              NULL,              F(vstrd_sg_os_ud) }
+        }
+    };
+    return do_ldst_sg(s, a, fns[a->os][a->msize][a->size]);
+}
+
+#undef F
+
 static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
 {
     TCGv_ptr qd;
-- 
2.20.1

