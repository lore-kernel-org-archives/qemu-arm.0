Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1180749wrs;
        Wed, 28 Aug 2019 12:35:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyS06JllI0+YE2GPzwm1HocKz02tuXX7Xbt6VdpqffsjHVFyGJ+AemUwNL8YRTorydiFATS
X-Received: by 2002:a37:de08:: with SMTP id h8mr3803857qkj.485.1567020918377;
        Wed, 28 Aug 2019 12:35:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567020918; cv=none;
        d=google.com; s=arc-20160816;
        b=kYKJd4e8B86rJ2aLhInZW8uiKS4zIPPvWavkbBf3Z+NUXe8QctDpkdEi/VsnPiRnhF
         BIg0SjkqMfQNvOI8bEsOJp0Kf8SHvvazg08FQTXnsSj2sKpeEr3hPptKTS+uMZb3yArU
         /j7bcClpM8CVlRNUoK7LMfWd99zjl+POZpdbGLuUXsBFWNjwC8oES4jPY0pZiEwcDvRU
         WSISoPZvRRpHqbXo0THlyTJ8/V6AmprL9fBY21aQxMYXZ7jiUuFLBiW5G4Gta3z8WpPD
         C08oEb4TiQrP0vlRh+M79zM1ACnq7qWG9v8bU0NuVY8DX0rBhmM4CJiuHdmZRZAeMab1
         y5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=U00Zb093z+hXOMnaNizAdzZJk8lMkRiGoOKwHfvrSvk=;
        b=CcsjXOqQXeRVXVp43NGot+5fNhAeyKXSkRVhMP16kTGqahUEfIqPCJA9kvCVFrjnYD
         GaoVA0alvVX0ORSD2dDWz6xC9b5mC48MLS7L3NaHWhItprxRd8q5Z20dy1W7LOtYDP9T
         xjkG3C5xuUa2fsH7G5LKSA1kyywibExoDABnmgRztO3sWsZXsIN97KChQ4UpJhTQpkq/
         9Z7MFYxGdCxz4k/JLQVhzMpcmJK+fU88WrjXzSHihmW44xWlwuXGy6epYGGsXrHPDtkH
         zrQyUEBGT882ZyijlXMtgGBf86Ql+2M/7RXQge3lCsIgUwZVk9SAduHtUFU5aIEwsEOa
         hxqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OyOOI8lX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b25si67461qtb.318.2019.08.28.12.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:35:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OyOOI8lX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41379 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33iv-00072J-2U
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38271)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GV-0003oQ-2e
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GS-0000OP-GR
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:54 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:44405)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33GR-0000Mj-17
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:52 -0400
Received: by mail-pg1-x542.google.com with SMTP id i18so206480pgl.11
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U00Zb093z+hXOMnaNizAdzZJk8lMkRiGoOKwHfvrSvk=;
 b=OyOOI8lXMBHwRm2Akw2bT40UBK9uvuraCgICZ2ejQoxP1HWKfw4W+9+YhQKKRBNgrS
 RukDgSM3RI8Lg4TW4WqhbO69lv6URPRPtlG57CHgeyiyR2weaonlx7eiOzUlO7fdcqnr
 3qIiN7x+fhpdCiP5HDBr/drzH4QRRKfihta2+iYeHpP0rP93cmmZuPfG2auf8yP/E2N8
 4MJFqUTL5/RPN7jbFDbH527THyMZt2VeCemXgZTl714h3kj4rpjpHgPf+HCtF8i/c537
 fzqc9jrsZRAgzsekFTz9JmE+iE/UFPCVzIGYaT7aJK3blR5yjphoYdjeEaPw32pTkep1
 e3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U00Zb093z+hXOMnaNizAdzZJk8lMkRiGoOKwHfvrSvk=;
 b=S4ge3zScEfJpOvfuRZcFawIagFgTMMEluIuz4HD05Wmat+ztSgJJldwHYXspnL51x3
 k2qiY/0zipPOFezExhMVFQakK183zCe8CNVGc7JcdFuksc922LjkqqrVlsZxqP1WzPki
 HhAXdTtUqf3XHCyw61ZTY1+L7kn6iSYJfz28E5TC0Sm0I+e6bZDnyK6UoA4zTUVFNGgD
 rvq45J1cvbdijfzxhbAGHU3cAEQszJl9XFc1Si2pSai9ga4haJNhxjjqm0bzobZv60YJ
 Hl6zaRarVo5OeHFgnnxdymw/PN+A0WU+5wW08COyUj0kv4UdpiYC7lamNH3z/OCvlUFj
 bAUg==
X-Gm-Message-State: APjAAAUgZ55+J7DwI8tXE0bwwe+P/GmsdcmKYwR04yp9fH+GGRJtd4ss
 Zql8QB25/cvfTzEl9dp+Ga0NjkOHpy8=
X-Received: by 2002:a17:90a:f995:: with SMTP id
 cq21mr5895568pjb.27.1567019148754; 
 Wed, 28 Aug 2019 12:05:48 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:25 -0700
Message-Id: <20190828190456.30315-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH v3 38/69] target/arm: Convert PLI, PLD, PLDW
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
X-TUID: 6ySJKy5z28tX

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 37 +++++++++++++++++++-----------------
 target/arm/a32-uncond.decode | 10 ++++++++++
 2 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f81f369544..c55bd1e563 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10229,6 +10229,26 @@ static bool trans_SETEND(DisasContext *s, arg_SETEND *a)
     return true;
 }
 
+/*
+ * Preload instructions
+ * All are nops, contingent on the appropriate arch level.
+ */
+
+static bool trans_PLD(DisasContext *s, arg_PLD *a)
+{
+    return ENABLE_ARCH_5TE;
+}
+
+static bool trans_PLDW(DisasContext *s, arg_PLD *a)
+{
+    return arm_dc_feature(s, ARM_FEATURE_V7MP);
+}
+
+static bool trans_PLI(DisasContext *s, arg_PLD *a)
+{
+    return ENABLE_ARCH_7;
+}
+
 /*
  * Legacy decoder.
  */
@@ -10289,23 +10309,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             }
             return;
         }
-        if (((insn & 0x0f30f000) == 0x0510f000) ||
-            ((insn & 0x0f30f010) == 0x0710f000)) {
-            if ((insn & (1 << 22)) == 0) {
-                /* PLDW; v7MP */
-                if (!arm_dc_feature(s, ARM_FEATURE_V7MP)) {
-                    goto illegal_op;
-                }
-            }
-            /* Otherwise PLD; v5TE+ */
-            ARCH(5TE);
-            return;
-        }
-        if (((insn & 0x0f70f000) == 0x0450f000) ||
-            ((insn & 0x0f70f010) == 0x0650f000)) {
-            ARCH(7);
-            return; /* PLI; V7 */
-        }
         if (((insn & 0x0f700000) == 0x04100000) ||
             ((insn & 0x0f700010) == 0x06100000)) {
             if (!arm_dc_feature(s, ARM_FEATURE_V7MP)) {
diff --git a/target/arm/a32-uncond.decode b/target/arm/a32-uncond.decode
index 32253b4f9a..ddc5edfa5e 100644
--- a/target/arm/a32-uncond.decode
+++ b/target/arm/a32-uncond.decode
@@ -54,3 +54,13 @@ SB               1111 0101 0111 1111 1111 0000 0111 0000
 
 # Set Endianness
 SETEND           1111 0001 0000 0001 0000 00 E:1 0 0000 0000  &setend
+
+# Preload instructions
+
+PLD              1111 0101 -101 ---- 1111 ---- ---- ----    # (imm, lit) 5te
+PLDW             1111 0101 -001 ---- 1111 ---- ---- ----    # (imm, lit) 7mp
+PLI              1111 0100 -101 ---- 1111 ---- ---- ----    # (imm, lit) 7
+
+PLD              1111 0111 -101 ---- 1111 ----- -- 0 ----   # (register) 5te
+PLDW             1111 0111 -001 ---- 1111 ----- -- 0 ----   # (register) 7mp
+PLI              1111 0110 -101 ---- 1111 ----- -- 0 ----   # (register) 7
-- 
2.17.1

