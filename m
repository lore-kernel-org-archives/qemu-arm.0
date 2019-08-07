Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071973wrv;
        Tue, 6 Aug 2019 21:54:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxHEqnu9s2/MQOhmnDYjKYLA/hIn4U+wiYKFGhS9Ii0dc9Yvzw5bfyVTlqPJiUZCBECovDC
X-Received: by 2002:ac8:2439:: with SMTP id c54mr6277241qtc.160.1565153641470;
        Tue, 06 Aug 2019 21:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565153641; cv=none;
        d=google.com; s=arc-20160816;
        b=SyBWU9Q5E9qZZhHSl60oVmlAxMS/8A+43iQPf4xWHQwGzTVC6z54xdeENRSyGQL6xK
         sF9dFPZ5aQYo0HN8tjgZCSqfe7bDkbCm7LSkTtamoXOG016TL3n22BiBeblYHgruqpaX
         WEAG2xajy384M9Us8hfpHWMCD21LHfVIPnfZzhn4EEy5FM7zr7tXhDpaQsQupVw5nY2k
         V/AcIsxq8PtbYXcS519hN5FodXHpBHSGk182qdLB+XFjFg2TL2Tv0ng6qUJlEq5rBr1h
         ofIgFUF/jI5nnMz6wMm+aoBdjbWX7+mfQBWYMXtVTG0w7LOkagYDk8e3+TwQO3vs0uUJ
         lkVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=sTmPUIypnziYaVGRFy0ALsWEJTPu9wrCWxAaqC9PPBw=;
        b=CyhtGvqCWitm3b630z38jepzpcWsfOucogOeKgcqo78infDKZSZRUQahHVxjda0HHA
         ehAUTaR1yKV5LuJr8D6rNX9GGZB+tWF2dfrR8W2KwF/b1xIjtwPsr72XDkZOwk2/2ZXS
         HbFBwkCSUcVQTKYvBC/u1nTqVXwgeAAV1PwnU+fLv0KuTINeTnXbQ84tiAheiyUnFrOd
         xGCdikKgJHzw8/yN5H7VtOGICkRTszRQqVkBPBDMx0n1aSdlBVlXP0kST2EA3GW/42oz
         AOUTlFjzeRneTNdQtTKKGOITrLZmknwN3dhRhEybgrj2/1JbctQ6qwCP7fCD9hjxZExX
         021Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a7oeOzFR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si23801193qtm.263.2019.08.06.21.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2019 21:54:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a7oeOzFR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvDxZ-0001Mp-1a
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 00:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40541)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxL-00012T-EV
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxK-0004iQ-98
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:47 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:35818)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvDxK-0004hR-37
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:46 -0400
Received: by mail-pf1-x441.google.com with SMTP id u14so42781668pfn.2
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2019 21:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sTmPUIypnziYaVGRFy0ALsWEJTPu9wrCWxAaqC9PPBw=;
 b=a7oeOzFRGXtuyzqaFWdbCMWvJXEENm+AagrmWV5f4ziqMOwceC8DCKliWoyOQN/wqK
 DyEybt0iOtL7E4bl6MgQSonlrbKd1cm9XH8uuFhwzzl3xTRhp5qD8LyV55UlntCMITWQ
 YGbgzwa+mj+PFWq1NSTnF7+SgWgOsZN8d0ciZs7dqTqxJky2iyvI2+2oHe9liYkjIyPE
 zvVHMu4gBHN/kjqnwQ65S2p4yniXLuLytHYn8qA8L8XsXtutSALGK9pBxscoCglFvI8e
 KyUfrk34QknjqIXIgiygCQzilJZssWbEsbm3VIj4GNlXN3ek1k64ZVzz5W3XXLuTQS5b
 0u5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sTmPUIypnziYaVGRFy0ALsWEJTPu9wrCWxAaqC9PPBw=;
 b=crRgU+CynW2n2H/F/+D9qVJcxOVNs2oFomhS4eY1YXrh1kB3SsQu8MCak/AIt6NZss
 y8KzrDf7p6kiGC0FsoqKeUJL52xFrFz2Ioz2lb6VdilMDeo8KBqSSM9heI0NTloOVHki
 ES7ioY+6xEWvKiniK0++AkOCFYLK72bXRLR81YlQ0b8S6BVgwyC4WrZ/zHv3p/M36yWH
 Eat0+BIpx6TMORifZg2o6MKxKhRtMNyhO3QFmq4EPseTP/ruo6T4f6z0cyX/MTAgWve4
 Xkw+TI3xvf3bDSRETY3mMxSMy8ZsmssqT+lW25Y8tL8oLa5FYoRpQiWQgTGH2kgUoE1e
 IpmQ==
X-Gm-Message-State: APjAAAVquAzoXvThAlxL296nAUT00SweIsR2/oEmz6P7WrPbrpxPO01g
 kxpu4kB60VpNMZLZVb+xC9p9wg==
X-Received: by 2002:a17:90a:8d0c:: with SMTP id
 c12mr6350022pjo.140.1565153624961; 
 Tue, 06 Aug 2019 21:53:44 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id t9sm24347921pji.18.2019.08.06.21.53.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 21:53:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  6 Aug 2019 21:53:25 -0700
Message-Id: <20190807045335.1361-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807045335.1361-1-richard.henderson@linaro.org>
References: <20190807045335.1361-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH 01/11] target/arm: Pass in pc to
 thumb_insn_is_16bit
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
X-TUID: j/keYGyxTsyy

This function is used in two different contexts, and it will be
clearer if the function is given the address to which it applies.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7853462b21..1f15f14022 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9261,11 +9261,11 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
     }
 }
 
-static bool thumb_insn_is_16bit(DisasContext *s, uint32_t insn)
+static bool thumb_insn_is_16bit(DisasContext *s, uint32_t pc, uint32_t insn)
 {
-    /* Return true if this is a 16 bit instruction. We must be precise
-     * about this (matching the decode).  We assume that s->pc still
-     * points to the first 16 bits of the insn.
+    /*
+     * Return true if this is a 16 bit instruction. We must be precise
+     * about this (matching the decode).
      */
     if ((insn >> 11) < 0x1d) {
         /* Definitely a 16-bit instruction */
@@ -9285,7 +9285,7 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t insn)
         return false;
     }
 
-    if ((insn >> 11) == 0x1e && s->pc - s->page_start < TARGET_PAGE_SIZE - 3) {
+    if ((insn >> 11) == 0x1e && pc - s->page_start < TARGET_PAGE_SIZE - 3) {
         /* 0b1111_0xxx_xxxx_xxxx : BL/BLX prefix, and the suffix
          * is not on the next page; we merge this into a 32-bit
          * insn.
@@ -11824,7 +11824,7 @@ static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
      */
     uint16_t insn = arm_lduw_code(env, s->pc, s->sctlr_b);
 
-    return !thumb_insn_is_16bit(s, insn);
+    return !thumb_insn_is_16bit(s, s->pc, insn);
 }
 
 static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
@@ -12122,7 +12122,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     insn = arm_lduw_code(env, dc->pc, dc->sctlr_b);
-    is_16bit = thumb_insn_is_16bit(dc, insn);
+    is_16bit = thumb_insn_is_16bit(dc, dc->pc, insn);
     dc->pc += 2;
     if (!is_16bit) {
         uint32_t insn2 = arm_lduw_code(env, dc->pc, dc->sctlr_b);
-- 
2.17.1

