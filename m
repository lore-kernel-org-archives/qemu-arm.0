Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3177543wrs;
        Mon, 19 Aug 2019 14:48:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzrgTBY2kGS/ULPgOTvUC8SwNFSFG6Ki3gBopsQFi2mGD/zYGbFipJfsA9nAFiv2kROttYr
X-Received: by 2002:a37:a090:: with SMTP id j138mr23336403qke.83.1566251288216;
        Mon, 19 Aug 2019 14:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566251288; cv=none;
        d=google.com; s=arc-20160816;
        b=W7VyOhwj3mZx9N+Vj/y3AOtCul/txTGv5T6T9unvj46fk0zzbRZ8I9FGntWgMCmahQ
         mPIXzfoJQWKnTjFjp0XRSrgBOhNOFJ7g95gtKf1XiZZb68yhtQAmX6+hCEuXJ4lTd4cp
         l3NMLam7kxgQN/LfCRcRIq0f09Tlin6mI20KVGTmajimqqne2cMdKR23RWXB4CnRNtcZ
         N0ECHTUee/5PJNfVbIIqeKEYNajapwkkFRPs5QpKj2doWyxhDtZ9hCFbfr0FOEqen7oA
         gbYPqillGDsJP4LxVx7tsrljxI4WG5q8DiJA8vtllkxBCkq8SN2HwxllmIvMso235Ot9
         44Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=lmni/76O+knM0gbFh8KJGT9HS18kVAz/Vke5rjDhrnk=;
        b=vVJZ99v3FL01TKOoh8b+JjYkP978/hJRvEugUk+yb6ix47ymbSFObsT7d8W/s3I9cd
         8n4wzIE/fzu7RNwji0gy5JnQNfz9Q+u9ZhbpO6hknm+KvnnqDFQ2tO+rH5NQpE86x6S4
         O3zLznmURCKXzbGPkQAcPdD2rKJ+/Yn9USAzBOda9BadlfYDIsbw/0HZaAGFD0X14KUI
         EasgDw7X6OsxfkX2Ty8F5cYD1LfRZU6uN8z+euI9KavYIBQVNJiKnKdki6krILBQ6ufX
         FrkduZLJ7bTlAfC2Gk1gEMSCEA/O9EBr/iOXOavxEeq/JtHee5uHfAGOUuj3DjJEiJn3
         G3yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hCX45omn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s22si10355693qvs.40.2019.08.19.14.48.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:48:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hCX45omn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpVX-0004sQ-5H
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58904)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpM7-0001jw-Nz
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpM6-0006Bu-Fs
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:23 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:36032)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpM6-0006Bg-9i
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:22 -0400
Received: by mail-pf1-x442.google.com with SMTP id w2so1950376pfi.3
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lmni/76O+knM0gbFh8KJGT9HS18kVAz/Vke5rjDhrnk=;
 b=hCX45omn7zmvTg4bYLt5wK3G4l7dfL2jPcgj+kXHf97Kyb9DpZ27nhjvkAhBGgOwPI
 vYc3HvxNaMhHHLRGBANezEMGtlPfTEibk2+VpxP7C5dmxkXWYty7v95a+CicdSgYTg9y
 Gm3X1bJ1Em/YpbwVjWpRsbdsQua/dK5LRXl3qLbHwvtdn8ebEizXiRemV71jt+6L0jm/
 vmNDL+/Fk00mc7kqoY1FBVHv9NJEzR37Fq7LyFC1qcNDUQWKvcmXq35iSnxacRJWoCCX
 dU+Iu0PiK7oCegktiMExarNnSkS0Cda+wCGEpG4tgyxgKFR0VRAi2kwqYWBVSAL7+H2l
 HdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lmni/76O+knM0gbFh8KJGT9HS18kVAz/Vke5rjDhrnk=;
 b=VTADCzZObYrFdkPhvQNlkV0JF8mAp+PvcEjNcaVFhd5MjV3sUn5X17sAv3Ne1oOIBc
 UVsgAlRSHGlH3HkkFFBDabRMWoE8DhndTtTpg84KC/b8EC4fv+BZEuJDVze80bFUT/B8
 8LllwTUSZt6gBcrVB2Mp0WNuW9D/eVlPLGAM0U97/kipFEP65CI59YuZ9FnjtpzzTpcW
 Gc6L+Ipe6b4owcA4mOGIGzj5l1GnOOVCinf54Ebo1t7fKI/iib2o/zXfoBjgAdTa+SLO
 KrXCbuXWrTzFLaq3+EmLZu+fYg7Z2k36Xp6dldHu1UwEIqej/R0bx2h7LLsHtsA5q2JJ
 J8vA==
X-Gm-Message-State: APjAAAXUUF5G3t/CHBUWQDP3CRrsVKY8gJnjvi8DnRMbIixJjn5ym4R+
 rSvtUJG9vVftYPkKgGOFU+OkdWJqn4Q=
X-Received: by 2002:a63:b64:: with SMTP id a36mr22296590pgl.215.1566250701387; 
 Mon, 19 Aug 2019 14:38:21 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:06 -0700
Message-Id: <20190819213755.26175-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-arm] [PATCH v2 19/68] target/arm: Convert T32 ADDW/SUBW
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
X-TUID: 4898djopU2bX

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 24 +++++++++++++-----------
 target/arm/a32.decode  |  1 +
 target/arm/t32.decode  | 19 +++++++++++++++++++
 3 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index cb6296dc12..0e51289928 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7626,6 +7626,11 @@ static void arm_skip_unless(DisasContext *s, uint32_t cond)
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
@@ -7975,6 +7980,12 @@ static bool trans_ORN_rri(DisasContext *s, arg_s_rri_rot *a)
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
@@ -10670,17 +10681,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
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

