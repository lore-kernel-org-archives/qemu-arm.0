Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1131814wrp;
        Wed, 4 Sep 2019 12:52:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx1NPmHbFetrnQ7IyfJORaMhkhiFpEjh5O8lqV2PK/kjA62zTy3XAEuSn3vLlMs5j1Z7JTe
X-Received: by 2002:ac8:7c7:: with SMTP id m7mr10170546qth.230.1567626777245;
        Wed, 04 Sep 2019 12:52:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567626777; cv=none;
        d=google.com; s=arc-20160816;
        b=bVLig85q3iFIIu9ekdBe3izRoy8gZyXAPAE/W6b0VCy4BDzVB8K2gF4jbhMXReKdPT
         WYEkMaJS7sCoAj91Yvc4Sqf6cxYMerO1knMjeJmRY0WeYUk4X1yHzDscViRcMhTZxjlU
         ifbB+OjXlMHYqiZ+0kW9DlM8urMZpXgAVDNf2penUWd336ckS/RtpXVe+d85qo92Os0F
         cqCE3xfoMIljilZPxAPV1aO9BT1VvcjKdbf2bUrgUmwGNJeFdEM38FfpN6rUxklI3blz
         FtDngNu/cP/q4kGCvhUPtOJMOnAIszLkLc59BTPBlh0qy8CEbxHzTvvcPH/ASh+uI3dM
         Kfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=VBWptZwV41wrybglM+V4M0H5NWdfiBjh3fvGH/I8Il8=;
        b=HOyqx++s7JyDzZ6t9t5rqV5L50ZhGvwEbcbs6ZjDV6rN5eAHnX4Lxm7aRVJUXHQO3d
         JzzZs4zs/BvJPci3sgqRPIs47e0+ciWuXqhi5//xtA8qkD7/7YorrCBe+Sm7l/qCqjop
         /JuOKy7GFGWVNOGQwor0lwa1CUxEBzZs4LZr0BbRPGKLYslaHyLFfD9hY2GbtL4XNmjY
         xxQ20/YV+W6UnWhlMlHlhJRzDSQvJaSVve2Xeeh6d+K6cSchZqu6HcsiwTnjNJwRbZ+y
         fSAORGAXoxRzEwT/eVGuSyj7yeNa0bIgBracv8CX8ZDQvMJZOzIn36GqtIYp/8onT8Zh
         9Ghg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lCJWSj6F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si2651883qtq.237.2019.09.04.12.52.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 12:52:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lCJWSj6F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bKq-0001gX-2U
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 15:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b03-0004Vj-KD
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b02-0002MX-1J
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:27 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:44448)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b01-0002Lt-Qo
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:25 -0400
Received: by mail-pf1-x441.google.com with SMTP id q21so8877252pfn.11
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VBWptZwV41wrybglM+V4M0H5NWdfiBjh3fvGH/I8Il8=;
 b=lCJWSj6FvV6YXOL/SGlJ2Z+qLbaColkyYDbblmOn7Fb/57++oNnVzepyyFsNqSxdSf
 oMA5o4sY+VEyAR+sSxVIL2aXv2Bjma6i4nYuNxpUv+OsGDHBqEbALnEXsJ8N72QhxrE9
 jSYlDxmiy/puELGP98tNqGQ3/nPvRkW0sBktEtc+/Vf026xAa2Uaz7PJ/MGF+iHdg93C
 9IAxrdgtjV43/o7A/3S9M5kkHNGgj9g4oxdis0v5gEqkIL/puURJIikRXqV3YCvLo/AK
 pnP6SqpC2p22ztLjR+sjxxt5GPLw3KBVnEdOeu9ulPxStKq/eMlK8qt9o1kc8leHznRW
 C2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VBWptZwV41wrybglM+V4M0H5NWdfiBjh3fvGH/I8Il8=;
 b=QAeTnXSdubxHmpZB/12g5F+z/FnAUVTt0+rpjq/yVRMe+VMBzh7rsUK+5gd7XDgBmE
 se0O+cbt9UNNHi6Mp4k6fe6XVadm2LQIz3LzejG405q0VOpBrQNR287u27pWhImg7u1N
 PpztohTZO7Vd+Zj8VcU0iguOv0av3efKOYABFu7x/B+Z+DVNQf47idtgus6xmNj4XVya
 TiOI3ang/cp0qnTYNn5P7OwkZxb5cg2iCdGdlTjMfOW+Nd2KmLDF9wIrQrM6GALvVC+0
 G8zlvr8T/hL2VlMMZAhKMHCg66qFHZFhdulVCvSh39ibgMBBkFot42qmKobcnlbVRXse
 /hBQ==
X-Gm-Message-State: APjAAAXZEu3ZnTrVUYV5Z5VDKj5GT5ku21dank071E7VBMTVwOSGY2ty
 orVTTE9k9cEVhzJF1tsfgJdkN4yBBX8=
X-Received: by 2002:a63:d04e:: with SMTP id s14mr34727644pgi.189.1567625484790; 
 Wed, 04 Sep 2019 12:31:24 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:09 -0700
Message-Id: <20190904193059.26202-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v4 19/69] target/arm: Convert T32 ADDW/SUBW
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
X-TUID: H7fjnY4APqvX

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 24 +++++++++++++-----------
 target/arm/a32.decode  |  1 +
 target/arm/t32.decode  | 19 +++++++++++++++++++
 3 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 750331071b..7d12be4025 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7648,6 +7648,11 @@ static void arm_skip_unless(DisasContext *s, uint32_t cond)
  * Constant expanders for the decoders.
  */
 
+static int negate(DisasContext *s, int x)
+{
+    return -x;
+}
+
 static int times_2(DisasContext *s, int x)
 {
     return x * 2;
@@ -8004,6 +8009,12 @@ static bool trans_ORN_rri(DisasContext *s, arg_s_rri_rot *a)
 #undef DO_ANY2
 #undef DO_CMP2
 
+static bool trans_ADR(DisasContext *s, arg_ri *a)
+{
+    store_reg_bx(s, a->rd, add_reg_for_lit(s, 15, a->imm));
+    return true;
+}
+
 /*
  * Multiply and multiply accumulate
  */
@@ -10724,17 +10735,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         }
                         store_reg(s, rd, tmp);
                     } else {
-                        /* Add/sub 12-bit immediate.  */
-                        if (insn & (1 << 23)) {
-                            imm = -imm;
-                        }
-                        tmp = add_reg_for_lit(s, rn, imm);
-                        if (rn == 13 && rd == 13) {
-                            /* ADD SP, SP, imm or SUB SP, SP, imm */
-                            store_sp_checked(s, tmp);
-                        } else {
-                            store_reg(s, rd, tmp);
-                        }
+                        /* Add/sub 12-bit immediate, in decodetree */
+                        goto illegal_op;
                     }
                 }
             } else {
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index c7f156be6d..aac991664d 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -30,6 +30,7 @@
 &rrrr            rd rn rm ra
 &rrr             rd rn rm
 &rr              rd rm
+&ri              rd imm
 &r               rm
 &i               imm
 &msr_reg         rn r mask
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 5116c6165a..be4e5f087c 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -27,6 +27,7 @@
 &rrrr            !extern rd rn rm ra
 &rrr             !extern rd rn rm
 &rr              !extern rd rm
+&ri              !extern rd imm
 &r               !extern rm
 &i               !extern imm
 &msr_reg         !extern rn r mask
@@ -121,6 +122,24 @@ SBC_rri          1111 0.0 1011 . .... 0 ... .... ........     @s_rri_rot
 }
 RSB_rri          1111 0.0 1110 . .... 0 ... .... ........     @s_rri_rot
 
+# Data processing (plain binary immediate)
+
+%imm12_26_12_0   26:1 12:3 0:8
+%neg12_26_12_0   26:1 12:3 0:8 !function=negate
+@s0_rri_12       .... ... .... . rn:4 . ... rd:4 ........ \
+                 &s_rri_rot imm=%imm12_26_12_0 rot=0 s=0
+
+{
+  ADR            1111 0.1 0000 0 1111 0 ... rd:4 ........ \
+                 &ri imm=%imm12_26_12_0
+  ADD_rri        1111 0.1 0000 0 .... 0 ... .... ........     @s0_rri_12
+}
+{
+  ADR            1111 0.1 0101 0 1111 0 ... rd:4 ........ \
+                 &ri imm=%neg12_26_12_0
+  SUB_rri        1111 0.1 0101 0 .... 0 ... .... ........     @s0_rri_12
+}
+
 # Multiply and multiply accumulate
 
 @s0_rnadm        .... .... .... rn:4 ra:4 rd:4 .... rm:4      &s_rrrr s=0
-- 
2.17.1

