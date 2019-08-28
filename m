Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1195006wrs;
        Wed, 28 Aug 2019 12:49:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwPoUeA23uGKvUE6h/HxCveaqxjOK0B6qVpAGWgiEB7cnH1kXXZqfYJk7ACjWaiNylQXQdI
X-Received: by 2002:a50:a6c8:: with SMTP id f8mr6017585edc.60.1567021782179;
        Wed, 28 Aug 2019 12:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567021782; cv=none;
        d=google.com; s=arc-20160816;
        b=Z9zuoU0D+1FvLTi9Ruc5uTvytuoKIl9+aXf6RRZNIhx8G0tQ3LJqxs4ll7nusZrZ/3
         Sf0S6rzw1SwUTnhaOnc5rO9sYJ14h/5znbp5dg7nSoF9Chrfvjx45FGdPAXSg0F6jkWn
         K4aXrawttYa7486UgVY+FO5dGkfrxg1gkVlqKhGQ7fvTsquUqpgiqsmj4RnzWmGjpn2Z
         SO9CXwIRAvB/VPBGUCKoVY4Xix5QjXRwr8PXyghGE4cS9fexhbQBW7ygLHhpPgVW0e8X
         1irsmVQvT3SIpTrLXjXA3zGLLdDFNuHN4vJhfms4mnc5NI0uYyyZ+FCJjo8cjFJ+bYGn
         lCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=V9/U0aGVS70AXEVxaqRPo6hkrItIElj/g3TdFJgyikI=;
        b=KlfoPe1o+iHi7eY+mbeDY4tf60sKEkkEx9NY8MA1NWzk7iX0YU81TRBeEZt3q0siOx
         XVA1M+chmXBDOwQWDlpGrbyRKdZwmVBI8Dztbs1W2PauTp9kI+8t9R6t/Pa2oyomj5rK
         c2rG4Ss9pRDsis++835ZsDROkUzWV8CMyprZjByVVXUUf06/ymIRYqXtAt5lISOoDhLr
         1lpFDXB4ohv0dX1DKq/xwYFMApdMP5sYHr+lFnYOGHtdhUHV5Za9tSGCDO8rC9rgw0W2
         4AFlvezGdd/BNEL/HqPuW6f/o6D2NVoC3EbxIGMW37Ytg6pCEaKLG0DLn7aDPjzeIdEy
         cK4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DCt3fFC1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f26si1767458edy.232.2019.08.28.12.49.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:49:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DCt3fFC1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33wq-0004M3-Jp
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38279)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GV-0003od-C4
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GS-0000OV-K7
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:55 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45605)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33GS-0000M0-85
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:52 -0400
Received: by mail-pg1-x542.google.com with SMTP id o13so203193pgp.12
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V9/U0aGVS70AXEVxaqRPo6hkrItIElj/g3TdFJgyikI=;
 b=DCt3fFC1zB24iL711MRq//sJFwvzaQ78sQBi7RAy10nqUr8k7n266cugxIax5Q8NH+
 jJupcfEb3R26ePU3mEj5uMo9NO1+YCwxPyEH4RZJwIsf1hb/i0XDAGlPkGqLWI4EPeBj
 o2KRfsLHARBrhon8hpaYIkREmJdfuY8uyopoFtxqWmWBPhLdbDIK/YjROJxejYALnGt/
 CD/ZOA0jetMWXpGP6bklYZ9UOf+qJLbBvQknjSRn3sDiPRmuO55PuAPPld9OL1e5tJbv
 Bbn00L3ZlT8RgEuAkxi0zUleb/kcDTdYk/o27+1fzzqPsO5d+uliU+Uz93ndIQ1/OqjA
 IBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V9/U0aGVS70AXEVxaqRPo6hkrItIElj/g3TdFJgyikI=;
 b=S0FnmaL5xX+xw7yyYu5NC/IAhR8g0W+p5wPOsk3dimG285OQm5zjMDJSSVtwIFgrF9
 8Ma8QAiSRPgnrzlwsqWP3cLReSrbE4woGJ4czA41XAwnX68iIa9mmK3xP+WwgqQpe94T
 5ta0VWXx1FFMwqNwkR5qUs0/bQQ6M5h3ZzIx6wuQNRcLIGgL0aXhnyxDR0H1mXnmiZyR
 bSRaiIW9c0HKdoVqmyVukpZVMo+qDgiYz+w8s6+j01Teo3JEcdV5qtRuCqku09VqK6U4
 e+vtIGMnkFcK2dUMcXRDalyWElHIDFxuOXo+Aozu8DT2pI2QykS6w0lwU3WU7NcisbmB
 uJgg==
X-Gm-Message-State: APjAAAU6E2S0icqr/B3AChnnoT982w/Ei4Balb9nAXPpZMJ+kIz4XNzw
 vwBeEITQpH7B+YVL5/BKl8Lz9A==
X-Received: by 2002:aa7:8c04:: with SMTP id c4mr6686545pfd.59.1567019147326;
 Wed, 28 Aug 2019 12:05:47 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:24 -0700
Message-Id: <20190828190456.30315-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH v3 37/69] target/arm: Convert SETEND
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
X-TUID: c1updExxL0EO

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 22 +++++++++++++---------
 target/arm/a32-uncond.decode |  4 ++++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e8764a88ae..f81f369544 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10217,6 +10217,18 @@ static bool trans_SB(DisasContext *s, arg_SB *a)
     return true;
 }
 
+static bool trans_SETEND(DisasContext *s, arg_SETEND *a)
+{
+    if (!ENABLE_ARCH_6) {
+        return false;
+    }
+    if (a->E != (s->be_data == MO_BE)) {
+        gen_helper_setend(cpu_env);
+        s->base.is_jmp = DISAS_UPDATE;
+    }
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -10302,15 +10314,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             return; /* v7MP: Unallocated memory hint: must NOP */
         }
 
-        if ((insn & 0x0ffffdff) == 0x01010000) {
-            ARCH(6);
-            /* setend */
-            if (((insn >> 9) & 1) != !!(s->be_data == MO_BE)) {
-                gen_helper_setend(cpu_env);
-                s->base.is_jmp = DISAS_UPDATE;
-            }
-            return;
-        } else if ((insn & 0x0e000f00) == 0x0c000100) {
+        if ((insn & 0x0e000f00) == 0x0c000100) {
             if (arm_dc_feature(s, ARM_FEATURE_IWMMXT)) {
                 /* iWMMXt register transfer.  */
                 if (extract32(s->c15_cpar, 1, 1)) {
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
index de611e8aff..32253b4f9a 100644
--- a/target/arm/a32-uncond.decode
+++ b/target/arm/a32-uncond.decode
@@ -24,6 +24,7 @@
 
 &empty           !extern
 &i               !extern imm
+&setend          E
 
 # Branch with Link and Exchange
 
@@ -50,3 +51,6 @@ DSB              1111 0101 0111 1111 1111 0000 0100 ----
 DMB              1111 0101 0111 1111 1111 0000 0101 ----
 ISB              1111 0101 0111 1111 1111 0000 0110 ----
 SB               1111 0101 0111 1111 1111 0000 0111 0000
+
+# Set Endianness
+SETEND           1111 0001 0000 0001 0000 00 E:1 0 0000 0000  &setend
-- 
2.17.1

