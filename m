Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5545984lfc;
        Thu, 29 Jul 2021 04:28:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3mY9SU3cXUMYnJBuytqkyA02ucrliioXs7jWN7N3XZ0PJ2L6C0TK8Zzjf27/pThdDvfOm
X-Received: by 2002:a92:dc06:: with SMTP id t6mr3379955iln.231.1627558107655;
        Thu, 29 Jul 2021 04:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627558107; cv=none;
        d=google.com; s=arc-20160816;
        b=HDagWWXPUICC4YiY8cjlmXSzDp2WRk463QRdzuEARWSrcdSgv7P+L5bbsznnH3+r5B
         wyvOcgAduVWux9FVw9VEqpmwMsH0Y8zEvyzCJOekk+MhWqNl+UqJTH5pdpyt6YVjxRN/
         GQakvfUv9u2xa8+wNcavviZMQ81cUluD81yOnxsjE1NjYO4vXkh+pCvYoUpTy1JaVqlB
         RBSZtp1kfTaDInH4RPR8aI8wHmoDWtyMg0XOjiAoenUM+aa1p3aKUlDsjGkM0nIBZnof
         8thjzmuh5N2/oOHpr9lSJ9XG/8Wi39yjBxk05W2igwH4IgoqZd3ITgLXt5YtvfXA0Osw
         SOGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OIN56S8ygwPfGNHYDNt+mnV7Jb27Ma6YNdL6z4Tr/Uk=;
        b=FA5/iSLsBMY6AqvqU74xoKymMQAtW7p4JNxuqO5fafK+niP+VA8eMYI6ox79Abnolb
         xH+oVAL+pCxRXSKmz1rTWaKc+wNGo8h4+fIQVzbMzKdyJjD6OFuC2ap5y+wJF8yeLyri
         nhZLZT799k0F7bfsABJmsYsJUawEBRDiGGsy9pXw8CAwrT6Kki6H1+4E6fE6fz4HArTV
         7+qiSmFsI8mAkK50jDI/PS4eM4//ZfUymmtwcUzHld7Jeu/fuRf2mivICYy0GJ9Yc5Ut
         C8nfeZerrAYXmkrQGYH24wKMTuQ2+5TbhYFTruqa8WIno8cPEIQJoefXxibhZBdEKFCP
         ZDBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="w7bUrh/+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si3167532ioq.67.2021.07.29.04.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:28:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="w7bUrh/+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m94DC-000316-UH
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9419-00010T-F3
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:59 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940n-0001FG-8y
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:57 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 f14-20020a05600c154eb02902519e4abe10so6545753wmg.4
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OIN56S8ygwPfGNHYDNt+mnV7Jb27Ma6YNdL6z4Tr/Uk=;
 b=w7bUrh/+LkNO6XW+pQ8u5fz0Eh8s9x4vnJ/OKZbbKwVAK80NJO2lG/hPRSrBp/mxD7
 gsvCbs3NjG7RM4n04IEWA8PNS9jvPA5U8ORMPbjhTcfxGDy1dh20nk2TwCz7bxHFBud7
 CHDJq7AZOS9dgTUKGyWWSiOHtNHVwO8y0Jy+bZUdxCW1ngCdqoKJvG1BqnQOnJ9s5iKP
 dundHp9ViAHqkpu+i6MMvAJ2oQP5DPwprSaPf39ThNRzuFB+3cbbjvE2ILB7Mxjh2llX
 dnmf/g3Jmae7Aq019MvWnft8QiHirv3GMQNL/AZX8wiOahXEHDIYmTMd9XqhbImvXedW
 DGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OIN56S8ygwPfGNHYDNt+mnV7Jb27Ma6YNdL6z4Tr/Uk=;
 b=EPwmMBLd7LqfRaOHhqllXI8cYkSun7/3geTDC3052Q96HJ/k2w7W1tDBRS4ldz80BJ
 UYHa0PFvTTspGnR1AOXxNtwDlZn2O1ZiQi6hXFqwU8ExECzaBRQ5QlipZWKGBVrT7lHu
 tjonRtNXMmpejyCbxC4o2/j+tRr5g486cADe6/g4VsQVM2Cm+bzDOAm8+ie1uaDT2Lwl
 ueTso422dEOT1PbLxN/CEVRlDvTw4N+I9gSpHGX43nEUshzKtSFA5vlj7XrzOHZ3hHPE
 8LBc8UYZHrZEx1IBfSB8rKavlu9z6uwJ4yg0eVVYPNiKFyw8xYN83PbHpqD4+N0VdPi5
 8Siw==
X-Gm-Message-State: AOAM531lMUPyjgvz66Oztl/3VlxOan5ae4pw5KTmjvAHcDrHuZd4GiQG
 uFbaFwbYPKNyCSTzPB6ZJgNiVbpR8ktLrw==
X-Received: by 2002:a05:600c:4e86:: with SMTP id
 f6mr14204477wmq.14.1627557335551; 
 Thu, 29 Jul 2021 04:15:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 25/53] target/arm: Implement MVE VMLADAV and VMLSLDAV
Date: Thu, 29 Jul 2021 12:14:44 +0100
Message-Id: <20210729111512.16541-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: vwB8VtPl6ynj

Implement the MVE VMLADAV and VMLSLDAV insns.  Like the VMLALDAV and
VMLSLDAV insns already implemented, these accumulate multiplied
vector elements; but they accumulate a 32-bit result rather than a
64-bit one.

Note that these encodings overlap with what would be RdaHi=0b111 for
VMLALDAV, VMLSLDAV, VRMLALDAVH and VRMLSLDAVH.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 17 ++++++++++
 target/arm/mve.decode      | 33 +++++++++++++++++---
 target/arm/mve_helper.c    | 41 ++++++++++++++++++++++++
 target/arm/translate-mve.c | 64 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 150 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 17484f74323..34d644a519c 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -392,6 +392,23 @@ DEF_HELPER_FLAGS_4(mve_vrmlaldavhuw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vrmlsldavhsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vrmlsldavhxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 
+DEF_HELPER_FLAGS_4(mve_vmladavsb, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmladavsh, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmladavsw, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmladavub, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmladavuh, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmladavuw, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlsdavb, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlsdavh, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlsdavw, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vmladavsxb, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmladavsxh, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmladavsxw, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlsdavxb, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlsdavxh, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlsdavxw, TCG_CALL_NO_WG, i32, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(mve_vaddvsb, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vaddvub, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vaddvsh, TCG_CALL_NO_WG, i32, env, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index d295a693b18..cec5a51b0ee 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -320,32 +320,55 @@ VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
 %size_16 16:1 !function=plus_1
 
 &vmlaldav rdahi rdalo size qn qm x a
+&vmladav rda size qn qm x a
 
 @vmlaldav        .... .... . ... ... . ... x:1 .... .. a:1 . qm:3 . \
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=%size_16 &vmlaldav
 @vmlaldav_nosz   .... .... . ... ... . ... x:1 .... .. a:1 . qm:3 . \
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=0 &vmlaldav
-VMLALDAV_S       1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
-VMLALDAV_U       1111 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
+@vmladav         .... .... .... ... . ... x:1 .... . . a:1 . qm:3 . \
+                 qn=%qn rda=%rdalo size=%size_16 &vmladav
+@vmladav_nosz    .... .... .... ... . ... x:1 .... . . a:1 . qm:3 . \
+                 qn=%qn rda=%rdalo size=0 &vmladav
 
-VMLSLDAV         1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 1 @vmlaldav
+{
+  VMLADAV_S      1110 1110 1111  ... . ... . 1110 . 0 . 0 ... 0 @vmladav
+  VMLALDAV_S     1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
+}
+{
+  VMLADAV_U      1111 1110 1111  ... . ... . 1110 . 0 . 0 ... 0 @vmladav
+  VMLALDAV_U     1111 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
+}
+
+{
+  VMLSDAV        1110 1110 1111  ... . ... . 1110 . 0 . 0 ... 1 @vmladav
+  VMLSLDAV       1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 1 @vmlaldav
+}
+
+{
+  VMLSDAV        1111 1110 1111  ... 0 ... . 1110 . 0 . 0 ... 1 @vmladav_nosz
+  VRMLSLDAVH     1111 1110 1 ... ... 0 ... . 1110 . 0 . 0 ... 1 @vmlaldav_nosz
+}
+
+VMLADAV_S        1110 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz
+VMLADAV_U        1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz
 
 {
   VMAXV_S        1110 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
   VMINV_S        1110 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
   VMAXAV         1110 1110 1110  .. 00 ....  1111 0 0 . 0 ... 0 @vmaxv
   VMINAV         1110 1110 1110  .. 00 ....  1111 1 0 . 0 ... 0 @vmaxv
+  VMLADAV_S      1110 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 0 @vmladav_nosz
   VRMLALDAVH_S   1110 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
 }
 
 {
   VMAXV_U        1111 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
   VMINV_U        1111 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+  VMLADAV_U      1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 0 @vmladav_nosz
   VRMLALDAVH_U   1111 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
 }
 
-VRMLSLDAVH       1111 1110 1 ... ... 0 ... . 1110 . 0 . 0 ... 1 @vmlaldav_nosz
-
 # Scalar operations
 
 VADD_scalar      1110 1110 0 . .. ... 1 ... 0 1111 . 100 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 72c30f360ac..ea206c932bc 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1189,6 +1189,47 @@ DO_LDAV(vmlsldavxsh, 2, int16_t, true, +=, -=)
 DO_LDAV(vmlsldavsw, 4, int32_t, false, +=, -=)
 DO_LDAV(vmlsldavxsw, 4, int32_t, true, +=, -=)
 
+/*
+ * Multiply add dual accumulate ops
+ */
+#define DO_DAV(OP, ESIZE, TYPE, XCHG, EVENACC, ODDACC) \
+    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn,         \
+                                    void *vm, uint32_t a)               \
+    {                                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        TYPE *n = vn, *m = vm;                                          \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            if (mask & 1) {                                             \
+                if (e & 1) {                                            \
+                    a ODDACC                                            \
+                        n[H##ESIZE(e - 1 * XCHG)] * m[H##ESIZE(e)];     \
+                } else {                                                \
+                    a EVENACC                                           \
+                        n[H##ESIZE(e + 1 * XCHG)] * m[H##ESIZE(e)];     \
+                }                                                       \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+        return a;                                                       \
+    }
+
+#define DO_DAV_S(INSN, XCHG, EVENACC, ODDACC)           \
+    DO_DAV(INSN##b, 1, int8_t, XCHG, EVENACC, ODDACC)   \
+    DO_DAV(INSN##h, 2, int16_t, XCHG, EVENACC, ODDACC)  \
+    DO_DAV(INSN##w, 4, int32_t, XCHG, EVENACC, ODDACC)
+
+#define DO_DAV_U(INSN, XCHG, EVENACC, ODDACC)           \
+    DO_DAV(INSN##b, 1, uint8_t, XCHG, EVENACC, ODDACC)  \
+    DO_DAV(INSN##h, 2, uint16_t, XCHG, EVENACC, ODDACC) \
+    DO_DAV(INSN##w, 4, uint32_t, XCHG, EVENACC, ODDACC)
+
+DO_DAV_S(vmladavs, false, +=, +=)
+DO_DAV_U(vmladavu, false, +=, +=)
+DO_DAV_S(vmlsdav, false, +=, -=)
+DO_DAV_S(vmladavsx, true, +=, +=)
+DO_DAV_S(vmlsdavx, true, +=, -=)
+
 /*
  * Rounding multiply add long dual accumulate high. In the pseudocode
  * this is implemented with a 72-bit internal accumulator value of which
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 676411e05cb..92ed1be83e7 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -46,6 +46,7 @@ typedef void MVEGenVIWDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32, TC
 typedef void MVEGenCmpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenScalarCmpFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenVABAVFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
+typedef void MVEGenDualAccOpFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -765,6 +766,69 @@ static bool trans_VRMLSLDAVH(DisasContext *s, arg_vmlaldav *a)
     return do_long_dual_acc(s, a, fns[a->x]);
 }
 
+static bool do_dual_acc(DisasContext *s, arg_vmladav *a, MVEGenDualAccOpFn *fn)
+{
+    TCGv_ptr qn, qm;
+    TCGv_i32 rda;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qn) ||
+        !fn) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qn = mve_qreg_ptr(a->qn);
+    qm = mve_qreg_ptr(a->qm);
+
+    /*
+     * This insn is subject to beat-wise execution. Partial execution
+     * of an A=0 (no-accumulate) insn which does not execute the first
+     * beat must start with the current rda value, not 0.
+     */
+    if (a->a || mve_skip_first_beat(s)) {
+        rda = load_reg(s, a->rda);
+    } else {
+        rda = tcg_const_i32(0);
+    }
+
+    fn(rda, cpu_env, qn, qm, rda);
+    store_reg(s, a->rda, rda);
+    tcg_temp_free_ptr(qn);
+    tcg_temp_free_ptr(qm);
+
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_DUAL_ACC(INSN, FN)                                           \
+    static bool trans_##INSN(DisasContext *s, arg_vmladav *a)           \
+    {                                                                   \
+        static MVEGenDualAccOpFn * const fns[4][2] = {                  \
+            { gen_helper_mve_##FN##b, gen_helper_mve_##FN##xb },        \
+            { gen_helper_mve_##FN##h, gen_helper_mve_##FN##xh },        \
+            { gen_helper_mve_##FN##w, gen_helper_mve_##FN##xw },        \
+            { NULL, NULL },                                             \
+        };                                                              \
+        return do_dual_acc(s, a, fns[a->size][a->x]);                   \
+    }
+
+DO_DUAL_ACC(VMLADAV_S, vmladavs)
+DO_DUAL_ACC(VMLSDAV, vmlsdav)
+
+static bool trans_VMLADAV_U(DisasContext *s, arg_vmladav *a)
+{
+    static MVEGenDualAccOpFn * const fns[4][2] = {
+        { gen_helper_mve_vmladavub, NULL },
+        { gen_helper_mve_vmladavuh, NULL },
+        { gen_helper_mve_vmladavuw, NULL },
+        { NULL, NULL },
+    };
+    return do_dual_acc(s, a, fns[a->size][a->x]);
+}
+
 static void gen_vpst(DisasContext *s, uint32_t mask)
 {
     /*
-- 
2.20.1

