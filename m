Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1121628wrp;
        Wed, 4 Sep 2019 12:40:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzd2UoZq6vu/PfSwsXLun7t7Z5rpiXupc983Y/nMXqnP9TRdCKV3NXwjQX8XPzMjNzK3XR4
X-Received: by 2002:a17:906:f207:: with SMTP id gt7mr28250206ejb.126.1567626054675;
        Wed, 04 Sep 2019 12:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567626054; cv=none;
        d=google.com; s=arc-20160816;
        b=wOipDpvXLTmCBcs6nyf5LiVw7jzy+9wFKzGYcp90hPyEv2gaWpsmoRr2Ej9sY0NSyY
         rF/y9SqkNq/xcxESJoE339C8hwr3e47+9uBKjSbqsXCuSmguZzBp756GpUfU/cVLn/S/
         tlOLsbTSPGmh0hRXGhL51G8wLJEyn82OMHa5Si9wa61ofMmWIfcD1RoDBqXr9NZmk+Vs
         2R9ty7LypYkM1u6GlGyIzbLjaCrCoUJ6wtaOH6sYF8IMbJWQ0N+vSQ8teTcTdcqJRREc
         HiNlxeGfMPFw3ERMNog75/Zsc6nmnmtuHiJnfHhBeZaunVpNcgH9a6SgyW+hsZ4daUAR
         BIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=gVoXo3oBV5rjG7odbH2AUIPExjRoZyxfBk+LHOtrM+4=;
        b=Dw/5hIPf+AL4KFZLE5rfj94aJEOMThEbGWMTahkghVE8j0ldXJax/Kwy8YZwQtmcJB
         bPzMFs2VBg74eyrjFU4Jl1G/p1M6zIurVr5ssrD1gAD/aiAtRpHBzD0HHm/k4KSTqOlE
         BtDpSNLxCb19hX2vQKoZ9PYqjdgtqypJdS6Si3Vc9jUI8m9M4m88HG+cPVTXYyx9UBGR
         og3vOq3e5Lt2gmWrRtpAzEqUvItKmUUCYfBDT+CS+hfA8UgfBwHatUJq6T/QqvHrxE23
         2o23IemOo2pMvGfZY5ALxj+HGH0jKoCYxX/ee71mRYBSTwvsFn/SPuqaNXB8QG8jaj6n
         VeKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Vwo8qtj1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si5264728edc.404.2019.09.04.12.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 12:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Vwo8qtj1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5b9B-0005U1-Dw
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 15:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40076)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azz-0004QT-Vd
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5azy-0002Iw-51
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:23 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42818)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5azx-0002I1-RC
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:22 -0400
Received: by mail-pf1-x441.google.com with SMTP id w22so5462793pfi.9
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gVoXo3oBV5rjG7odbH2AUIPExjRoZyxfBk+LHOtrM+4=;
 b=Vwo8qtj1VcyQsHwTJghLoAhJf6TUVmZs/MhHhGWfHYzpl/doUFuVSYsdDJxJmWcZtr
 uWppIDVTcI7WJHzhDfQ2CBMlOeh8DLVE6EDuVyXeUZko+BSwrFTaGulLxDi/Ds4jBIsB
 Rh0ExsQA9f3hurtn9fbCnwa5g32SBtXBuYVyIlS6iZTuYNvGN6+0MbMeQ+4mgQXUz8H2
 u45LA45eom3+qWEbJTR2K9IFIJcfeI/IkYiiKJx2PkO0btuXZmXq+mazOVrdOKTQJntw
 yu5lBduQu4jAFxiLM1JUjwFy1p0yj910I/dqFrA/VEQD3HfFW3AvyhCP2Xj2aJAyxBPX
 x0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gVoXo3oBV5rjG7odbH2AUIPExjRoZyxfBk+LHOtrM+4=;
 b=Ntl9rvjnaCaKjfzBn/kf3F5RSUf7IuGkIWTMTL9I40fqc4o/QcG6UyDSFgGwmGlKnK
 fEgOtXSvCaQt7g3AAZRP1jbjebdT7VfXavlxsKcLlBNyEUowYF3LwIJSoqWZgDRMh4mh
 CTIRnx487epS1+VdaDsGf/qAwAWMnGb9t0Xw6F7j59YO0WeRMT9+RLPCodC2uph4eUH2
 ssbhcDML693fDE1vM8dyRFdAyJRv9HJ8KzvJUMGA8CI7qUzcEIlwYIk3kOlUirxJs6DW
 QEiqqU1CBISPQwaHCZc4pK9N+KdmKadXdYcDU+sceHDF0HT/6NmxmYfi0UgRnbkU2L2j
 oKog==
X-Gm-Message-State: APjAAAV5xBd8HTS6LjB4u5tEtI0NpZw6LpYzNrn1XP3tN3KSWtgkTxku
 hcqfSJEheecXiRDVwhgILetMVg==
X-Received: by 2002:aa7:98d2:: with SMTP id e18mr10640019pfm.188.1567625480867; 
 Wed, 04 Sep 2019 12:31:20 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:06 -0700
Message-Id: <20190904193059.26202-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v4 16/69] target/arm: Convert CLZ
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
X-TUID: 7TjaxFQU2nxf

Document our choice about the T32 CONSTRAINED UNPREDICTABLE behaviour.
This matches the undocumented choice made by the legacy decoder.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 31 +++++++++++++++----------------
 target/arm/a32.decode  |  4 ++++
 target/arm/t32.decode  |  5 +++++
 3 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 386a460bf5..7de6949db3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8490,6 +8490,19 @@ static bool trans_BLX_r(DisasContext *s, arg_BLX_r *a)
     return true;
 }
 
+static bool trans_CLZ(DisasContext *s, arg_CLZ *a)
+{
+    TCGv_i32 tmp;
+
+    if (!ENABLE_ARCH_5) {
+        return false;
+    }
+    tmp = load_reg(s, a->rm);
+    tcg_gen_clzi_i32(tmp, tmp, 32);
+    store_reg(s, a->rd, tmp);
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -8778,18 +8791,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             /* MSR/MRS (banked/register) */
             /* All done in decodetree.  Illegal ops already signalled.  */
             g_assert_not_reached();
-        case 0x1:
-            if (op1 == 3) {
-                /* clz */
-                ARCH(5);
-                rd = (insn >> 12) & 0xf;
-                tmp = load_reg(s, rm);
-                tcg_gen_clzi_i32(tmp, tmp, 32);
-                store_reg(s, rd, tmp);
-            } else {
-                goto illegal_op;
-            }
-            break;
+        case 0x1: /* bx, clz */
         case 0x2: /* bxj */
         case 0x3: /* blx */
         case 0x4: /* crc32 */
@@ -10236,13 +10238,13 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 case 0x08: /* rev */
                 case 0x09: /* rev16 */
                 case 0x0b: /* revsh */
-                case 0x18: /* clz */
                     break;
                 case 0x10: /* sel */
                     if (!arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)) {
                         goto illegal_op;
                     }
                     break;
+                case 0x18: /* clz, in decodetree */
                 case 0x20: /* crc32/crc32c, in decodetree */
                 case 0x21:
                 case 0x22:
@@ -10275,9 +10277,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                     tcg_temp_free_i32(tmp3);
                     tcg_temp_free_i32(tmp2);
                     break;
-                case 0x18: /* clz */
-                    tcg_gen_clzi_i32(tmp, tmp, 32);
-                    break;
                 default:
                     g_assert_not_reached();
                 }
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 6cb9c16e2f..182f2b6725 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -29,6 +29,7 @@
 &s_rrrr          s rd rn rm ra
 &rrrr            rd rn rm ra
 &rrr             rd rn rm
+&rr              rd rm
 &r               rm
 &msr_reg         rn r mask
 &mrs_reg         rd r
@@ -197,6 +198,7 @@ CRC32CW          .... 0001 0100 .... .... 0010 0100 ....      @rndm
 %sysm            8:1 16:4
 
 @rm              ---- .... .... .... .... .... .... rm:4      &r
+@rdm             ---- .... .... .... rd:4 .... .... rm:4      &rr
 
 MRS_bank         ---- 0001 0 r:1 00 .... rd:4 001. 0000 0000  &mrs_bank %sysm
 MSR_bank         ---- 0001 0 r:1 10 .... 1111 001. 0000 rn:4  &msr_bank %sysm
@@ -207,3 +209,5 @@ MSR_reg          ---- 0001 0 r:1 10 mask:4 1111 0000 0000 rn:4  &msr_reg
 BX               .... 0001 0010 1111 1111 1111 0001 ....      @rm
 BXJ              .... 0001 0010 1111 1111 1111 0010 ....      @rm
 BLX_r            .... 0001 0010 1111 1111 1111 0011 ....      @rm
+
+CLZ              .... 0001 0110 1111 .... 1111 0001 ....      @rdm
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 337706ebbe..67724efe4b 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -26,6 +26,7 @@
 &s_rrrr          !extern s rd rn rm ra
 &rrrr            !extern rd rn rm ra
 &rrr             !extern rd rn rm
+&rr              !extern rd rm
 &r               !extern rm
 &msr_reg         !extern rn r mask
 &mrs_reg         !extern rd r
@@ -126,6 +127,7 @@ RSB_rri          1111 0.0 1110 . .... 0 ... .... ........     @s_rri_rot
 @rnadm           .... .... .... rn:4 ra:4 rd:4 .... rm:4      &rrrr
 @rn0dm           .... .... .... rn:4 .... rd:4 .... rm:4      &rrrr ra=0
 @rndm            .... .... .... rn:4 .... rd:4 .... rm:4      &rrr
+@rdm             .... .... .... .... .... rd:4 .... rm:4      &rr
 
 {
   MUL            1111 1011 0000 .... 1111 .... 0000 ....      @s0_rn0dm
@@ -180,6 +182,9 @@ CRC32CB          1111 1010 1101 .... 1111 .... 1000 ....      @rndm
 CRC32CH          1111 1010 1101 .... 1111 .... 1001 ....      @rndm
 CRC32CW          1111 1010 1101 .... 1111 .... 1010 ....      @rndm
 
+# Note rn != rm is CONSTRAINED UNPREDICTABLE; we choose to ignore rn.
+CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
+
 # Branches and miscellaneous control
 
 %msr_sysm        4:1 8:4
-- 
2.17.1

