Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3179225wrs;
        Mon, 19 Aug 2019 14:50:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxFpn9aL6UPxajK07duucyQCYaMCyGF76HDnErGsDP4nsjBAxK0QKwtT65I3K37IO0dfwna
X-Received: by 2002:a17:906:1c8b:: with SMTP id g11mr16426601ejh.81.1566251438512;
        Mon, 19 Aug 2019 14:50:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566251438; cv=none;
        d=google.com; s=arc-20160816;
        b=HRKd3LXDosNL+hjKf3vPwfAGcANZskzg8g19g8oTQpcihQyfsksLIDlDxRqFgEbTFl
         bQYjQd/2Mv3Yt8aMTOuYX50/Lolz0kdsuw1IVhlXQ4VmCR6QH8QN04ctvckOm8C3EfWW
         hGqfjDGNPy+hlpSmUCsKdh/2ZnGYuZDFEoDxU+gRnEx1e23VmQrIssgYR2AEq8tJ9O+m
         uHfO87jZ8B+ltSRUvE2G7BJyMLflKi4XrY2q/Af9O8Gep8sK6U/hu8Fe9x+QS7CwP2Wb
         XjQxO5qkRaGjdVjbZpXEzZgKL6ls3j/i1BkJbbAUB/PExRkx6MJdBUu/nFDOd36KUxB/
         U57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=F/upwaanfqXSt3Hk/7WIkT0U11Hn2bkl0Zsc2jcodB0=;
        b=jYOfN7FJ6/un1LeLMUPPqXAaTZdXfLOWXuQe+TdX5xXYO6rJFJ3sTANV5RaHMwPnZV
         FrXaa/VMDeiUzJ7vSZQuhqVyZ/qz0J5Puq17Ep8QABtc/XUcRsLTnnoOu3A4TKlmp8/R
         jq0/X4XhqHoS6xf/x7XOk+kuYZQ/7T3c+Dc1mh6oxXlVGK0Siw4HoHl6QY1oll/zxivz
         8y4strkOmVkgyezBOkce7VeU6TRnDS7V7ebOoh1R9ycqcFX++TTWYcT4knhyYAZpxdyq
         X/ao0XEJrnxaH2RHlTA+kCZLpuIy8J4EhUan44O+QetLppzZfIwag9q5S/BEcbbUPH87
         7E6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s7d7yvxy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id um3si7833527ejb.319.2019.08.19.14.50.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:50:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s7d7yvxy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpXx-0007ix-1J
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58801)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpM2-0001b8-HN
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpM1-00068p-55
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:18 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:47035)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpM0-00068U-VF
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:17 -0400
Received: by mail-pg1-x541.google.com with SMTP id m3so1915050pgv.13
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F/upwaanfqXSt3Hk/7WIkT0U11Hn2bkl0Zsc2jcodB0=;
 b=s7d7yvxyrP04hcw4TOgSZXuVe0kp2q777ybiXRZoZ2RxEmdST4Boy/6w3bkuB3R5Wc
 ljietIQp+kzGWwJu5dR1yABU/E+xqMptzKjG8ujBpuylaoiXSHP/MjLpsf6AEy7wGBBG
 +BTPCPVAaIW3n5nHX/uFvjgZZwfEITTZaoaZQetl8PRgCKJsLXyH8HO5q/Gatc8f/5Z6
 tYxT0OBCjg/O+4TkeI87l+8ju7sXnhDCj/LqqCbRzacB4c94IAH3IodwtcXUjRYwDM+3
 CEUkaONwmJmotDMxX/xfpKBAxeRMyoLhxhBt7DYH2S9mIrzD8wOiMheRWDpKQ1DeL9Sv
 UvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F/upwaanfqXSt3Hk/7WIkT0U11Hn2bkl0Zsc2jcodB0=;
 b=E2VYYlnhCrQ86a0HpMulayHlnciYS3xw8idShZv7js4emwazg6blyMR7QW2dpFvs8I
 Drdf5rg8QClI7w8HtSG619Y+UZ/138y+Alk868NBtpE72VCmngpmo89OryTpGrYYexzr
 67I6numVKcTujGemi7n/cIAwCv5oO5N6u7gzH8VhQ+QhKG6Kaat17br740L/dl1rZZj4
 51ZAu+Xlh0GM99ps6AzsbCGn3IIueVc+Tas0a4hRzp/PQZv9GwgmJeR01IYTW7dMqdXW
 tKnD26KGoBI9p2E5VxmJ7/ql6DzQQjZfYqR1oL8GpRDL2hShXs4mIXf6TWadjNx/0cNU
 QWmg==
X-Gm-Message-State: APjAAAUfP9ZL+qMjyechD7coanQhmEpJEFVNFIBpoj/aD30l9kHiizl/
 zNZjjKmK+/+Z2WAZqSHJfR1+nQ==
X-Received: by 2002:aa7:8189:: with SMTP id g9mr26793797pfi.143.1566250696097; 
 Mon, 19 Aug 2019 14:38:16 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:02 -0700
Message-Id: <20190819213755.26175-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH v2 15/68] target/arm: Convert BX, BXJ,
 BLX (register)
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2IAQV9RvzjdU

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 78 ++++++++++++++++++++----------------------
 target/arm/a32.decode  |  7 ++++
 target/arm/t32.decode  |  2 ++
 3 files changed, 47 insertions(+), 40 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f390656ce9..ef26ed7b57 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8429,6 +8429,38 @@ static bool trans_MSR_v7m(DisasContext *s, arg_MSR_v7m *a)
     return true;
 }
 
+static bool trans_BX(DisasContext *s, arg_BX *a)
+{
+    if (!ENABLE_ARCH_4T) {
+        return false;
+    }
+    gen_bx(s, load_reg(s, a->rm));
+    return true;
+}
+
+static bool trans_BXJ(DisasContext *s, arg_BXJ *a)
+{
+    if (!ENABLE_ARCH_5J || arm_dc_feature(s, ARM_FEATURE_M)) {
+        return false;
+    }
+    /* Trivial implementation equivalent to bx.  */
+    gen_bx(s, load_reg(s, a->rm));
+    return true;
+}
+
+static bool trans_BLX_r(DisasContext *s, arg_BLX_r *a)
+{
+    TCGv_i32 tmp;
+
+    if (!ENABLE_ARCH_5) {
+        return false;
+    }
+    tmp = load_reg(s, a->rm);
+    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
+    gen_bx(s, tmp);
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -8718,12 +8750,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             /* All done in decodetree.  Illegal ops already signalled.  */
             g_assert_not_reached();
         case 0x1:
-            if (op1 == 1) {
-                /* branch/exchange thumb (bx).  */
-                ARCH(4T);
-                tmp = load_reg(s, rm);
-                gen_bx(s, tmp);
-            } else if (op1 == 3) {
+            if (op1 == 3) {
                 /* clz */
                 ARCH(5);
                 rd = (insn >> 12) & 0xf;
@@ -8734,30 +8761,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 goto illegal_op;
             }
             break;
-        case 0x2:
-            if (op1 == 1) {
-                ARCH(5J); /* bxj */
-                /* Trivial implementation equivalent to bx.  */
-                tmp = load_reg(s, rm);
-                gen_bx(s, tmp);
-            } else {
-                goto illegal_op;
-            }
-            break;
-        case 0x3:
-            if (op1 != 1)
-              goto illegal_op;
-
-            ARCH(5);
-            /* branch link/exchange thumb (blx) */
-            tmp = load_reg(s, rm);
-            tmp2 = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp2, s->base.pc_next);
-            store_reg(s, 14, tmp2);
-            gen_bx(s, tmp);
-            break;
-        case 0x4:
-            /* crc32 */
+        case 0x2: /* bxj */
+        case 0x3: /* blx */
+        case 0x4: /* crc32 */
             /* All done in decodetree.  Illegal ops reach here.  */
             goto illegal_op;
         case 0x5:
@@ -10578,16 +10584,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                             goto illegal_op;
                         }
                         break;
-                    case 4: /* bxj */
-                        /* Trivial implementation equivalent to bx.
-                         * This instruction doesn't exist at all for M-profile.
-                         */
-                        if (arm_dc_feature(s, ARM_FEATURE_M)) {
-                            goto illegal_op;
-                        }
-                        tmp = load_reg(s, rn);
-                        gen_bx(s, tmp);
-                        break;
+                    case 4: /* bxj, in decodetree */
+                        goto illegal_op;
                     case 5: /* Exception return.  */
                         if (IS_USER(s)) {
                             goto illegal_op;
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index a8ef435b15..6cb9c16e2f 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -29,6 +29,7 @@
 &s_rrrr          s rd rn rm ra
 &rrrr            rd rn rm ra
 &rrr             rd rn rm
+&r               rm
 &msr_reg         rn r mask
 &mrs_reg         rd r
 &msr_bank        rn r sysm
@@ -195,8 +196,14 @@ CRC32CW          .... 0001 0100 .... .... 0010 0100 ....      @rndm
 
 %sysm            8:1 16:4
 
+@rm              ---- .... .... .... .... .... .... rm:4      &r
+
 MRS_bank         ---- 0001 0 r:1 00 .... rd:4 001. 0000 0000  &mrs_bank %sysm
 MSR_bank         ---- 0001 0 r:1 10 .... 1111 001. 0000 rn:4  &msr_bank %sysm
 
 MRS_reg          ---- 0001 0 r:1 00 1111   rd:4 0000 0000 0000  &mrs_reg
 MSR_reg          ---- 0001 0 r:1 10 mask:4 1111 0000 0000 rn:4  &msr_reg
+
+BX               .... 0001 0010 1111 1111 1111 0001 ....      @rm
+BXJ              .... 0001 0010 1111 1111 1111 0010 ....      @rm
+BLX_r            .... 0001 0010 1111 1111 1111 0011 ....      @rm
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 261db100ff..337706ebbe 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -26,6 +26,7 @@
 &s_rrrr          !extern s rd rn rm ra
 &rrrr            !extern rd rn rm ra
 &rrr             !extern rd rn rm
+&r               !extern rm
 &msr_reg         !extern rn r mask
 &mrs_reg         !extern rd r
 &msr_bank        !extern rn r sysm
@@ -211,4 +212,5 @@ CRC32CW          1111 1010 1101 .... 1111 .... 1010 ....      @rndm
     MSR_reg      1111 0011 100 r:1 rn:4 1000 mask:4 0000 0000  &msr_reg
     MSR_v7m      1111 0011 100 0   rn:4 1000 mask:2 00 sysm:8
   }
+  BXJ            1111 0011 1100 rm:4 1000 1111 0000 0000      &r
 }
-- 
2.17.1

