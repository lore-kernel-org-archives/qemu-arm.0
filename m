Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1155220wrp;
        Wed, 4 Sep 2019 13:18:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxVmeBDGhWdpSOWNtcux+l6koqZqjYxHEXLr8ZQb/ugk8GCysx59empQfCG6US65kANhD/h
X-Received: by 2002:aa7:d1da:: with SMTP id g26mr124401edp.100.1567628285720;
        Wed, 04 Sep 2019 13:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628285; cv=none;
        d=google.com; s=arc-20160816;
        b=RiuH8S/3F+gdapTws24pCvwhbki+2JBpWezs3kiXJZnGMZ3U5kHUF/xfhf5jNlTz0P
         OkGBg+U0o7Hm+Dw5oTAkQTnIFGmEQyinlIZnz0YcPrKAm5azOdmhBSU94Wup13zAWPrx
         fl2LugWT/7Lf1vWRPIlPRm7wo6X1OkKSb1yuLNpTVTvVjVTPBG+lgnJC5o4MV1ecZ05n
         9naZgRan6hfr7pfKX7J7+Za2z2ldl7n0ZkJRZVrb8SNHcfidKzkWMk+57ZlcERFQ0VRV
         SA6IB6qSaYUhymCVSu33AJ2mb1BsMzRGVxExADZdLhsH9KUr9+83sXv/OUz8ukbdeG1S
         yC0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=hhcY0Qa7fXCZ0Y1BiAhkkX6indoh0p/z8TLYSSed1LE=;
        b=Xglm2rvR3khp087G3NDkdcxIX3OlNxsEA9BS7gIaQCxIzrI37S+vU9C4aa55VXZY/J
         chvoucyIDOkPcRDUCGFcGncGOAlkxW1u5rctBTJsWNfPyIP+UxN7Dd5t4w21ItULvPLl
         XHehxvHSPtOmvgVqNCl7+RikTe3GrddK0TT3+V+kJFKn2NEPnBo4hd6F2ji97IFEYD/n
         WKH9syimYceDZUiWhqKEJoyZpbFXm1sMcQg1DjgU+x3Ec1tjRBCCJX86oXurUb2zKzSd
         L21GEnuNRBVp67MI0Z/6EgHGVQ3N3s/tWuOKlaA0loSDBHg2+YZbd+tycYN9GplWoRuh
         IOOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IqIdEnms;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si3737266ede.311.2019.09.04.13.18.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:18:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IqIdEnms;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bjA-0002d9-6M
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0t-0005Uz-HH
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0r-00038q-Gk
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:19 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36058)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0r-00033y-2a
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:17 -0400
Received: by mail-pg1-x541.google.com with SMTP id l21so11787468pgm.3
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 12:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hhcY0Qa7fXCZ0Y1BiAhkkX6indoh0p/z8TLYSSed1LE=;
 b=IqIdEnmso+AZ8Q9fmmqoaGghZ5y33Pp7+DN2kIput9XRDJrVfZ6Vo9ZUxf3XrXBfL6
 nmsTssS60QYgf58qN5fqgR5aEt3Dpxzp7iFukXOfaLOyfKncL465pmlmE2PbVeMjnLPn
 MUXXljd1+8aaPbsN39fbU23x3BtcfZo35wM4sS2emXRigT/6nkGNs/UoMlLwDLhifj64
 zmgy0AxOTVScK6rct4KHKSB2kK70vt1c68J4AkbEoIS7xk1nYBHP5GKDSK7GL7mY6esz
 sDObCfYGEhOIdY9RCIQE7rxHVJMch5TwNWGQuWMNrY8A3kRdYY/cSct5PNdQQWZSjzeU
 igvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hhcY0Qa7fXCZ0Y1BiAhkkX6indoh0p/z8TLYSSed1LE=;
 b=kKjsiFmzd+IfTcDkJA0MxyfNgtxb0q66PY/dIiCu2YjLkBzJkLiW4XLXYzbWBVuxFu
 973PBff8mtcem1Fg1cLfmLbr5oRpXPk9ZdPfvTRlTqB+eQ0eSksGLcH7FCXEm3tyPjzb
 YQJa8C1dsigOgkAtk7zJpJGPiZP8PIOC/PaduPcbHhqjynXimRDlmeIcg3HLWthF/rp4
 JkJKEmJBpeghbiBHldKVvO5eWn0aQ/h0q7waqal3mhIiw1NbvXTtV4/JHeKsOdj15aYE
 mVzNf17o7R1qNzYlHu8yFXo5aggqb/o8j/isvBKWfMqxlWN+rwcHkrxLjmqPKlvC3zal
 xMXA==
X-Gm-Message-State: APjAAAWg4pMxsR6I7tme3t8u+6gVn9CxPVGlQlrJxZVr3C+XmHGdbO6E
 pB6g+g6WFzYxt0nikA7PblLkoskbS9I=
X-Received: by 2002:a17:90a:8d0c:: with SMTP id
 c12mr6658159pjo.133.1567625532171; 
 Wed, 04 Sep 2019 12:32:12 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:46 -0700
Message-Id: <20190904193059.26202-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-devel] [PATCH v4 56/69] target/arm: Convert T16, extract
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ee4s6JMr8MIO

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 14 +-------------
 target/arm/t16.decode  | 10 ++++++++++
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8399a2c1f6..09c05de320 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10766,21 +10766,9 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         op = (insn >> 8) & 0xf;
         switch (op) {
         case 0: /* add/sub (sp, immediate), in decodetree */
+        case 2: /* sign/zero extend, in decodetree */
             goto illegal_op;
 
-        case 2: /* sign/zero extend.  */
-            ARCH(6);
-            rd = insn & 7;
-            rm = (insn >> 3) & 7;
-            tmp = load_reg(s, rm);
-            switch ((insn >> 6) & 3) {
-            case 0: gen_sxth(tmp); break;
-            case 1: gen_sxtb(tmp); break;
-            case 2: gen_uxth(tmp); break;
-            case 3: gen_uxtb(tmp); break;
-            }
-            store_reg(s, rd, tmp);
-            break;
         case 4: case 5: case 0xc: case 0xd:
             /*
              * 0b1011_x10x_xxxx_xxxx
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index b425b86795..b5b5086e8a 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -23,6 +23,7 @@
 &s_rrr_shr       !extern s rn rd rm rs shty
 &s_rri_rot       !extern s rn rd imm rot
 &s_rrrr          !extern s rd rn rm ra
+&rrr_rot         !extern rd rn rm rot
 &ri              !extern rd imm
 &r               !extern rm
 &ldst_rr         !extern p w u rn rt rm shimm shtype
@@ -173,3 +174,12 @@ BX              0100 0111 0 .... 000            @branchr
 BLX_r           0100 0111 1 .... 000            @branchr
 BXNS            0100 0111 0 .... 100            @branchr
 BLXNS           0100 0111 1 .... 100            @branchr
+
+# Extend
+
+@extend         .... .... .. rm:3 rd:3          &rrr_rot rn=15 rot=0
+
+SXTAH           1011 0010 00 ... ...            @extend
+SXTAB           1011 0010 01 ... ...            @extend
+UXTAH           1011 0010 10 ... ...            @extend
+UXTAB           1011 0010 11 ... ...            @extend
-- 
2.17.1

