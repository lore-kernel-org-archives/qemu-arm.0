Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1163006wrp;
        Wed, 4 Sep 2019 13:27:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWjJPRwUmo2/ILh64e6/SKQEOuG8+b1hPOxe8tTlqGiZsbgB/njedu8o8yQbR0vd7zTA7q
X-Received: by 2002:a17:906:1995:: with SMTP id g21mr24600262ejd.226.1567628855953;
        Wed, 04 Sep 2019 13:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628855; cv=none;
        d=google.com; s=arc-20160816;
        b=e8oo6PZCEYibUiiZV8uUqvs4RoGmPqPlKkm4gqVRdoB2qr2d/yaa6Ubh6XswkCkfgR
         6bIYBkN5X/JV5dl9Dje5Czxoe1SbjVqZarsNSgrvKK0ZzYQcfEUua7OF+xlMQ2t1QM2P
         Gdmsme0LLu0sqdeofM3ps6Y/gsBKPsgZCISorxvjj1q8K7/u1dCxNB55bF/jIR5jTWKG
         PQSIY+diKaY3rugISwofKAVtBEmGqxQtqILPKXb+rg5A+VATWYjpSSp2nRAopGSwOnmi
         JdY3UWwGo0chGGpHxteF5COAYqX3OIKVIow+SfY/30rGNycsmjpASueEQwQqve1/dXGb
         /H0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=xM5PgyYOOv0mxKWZUoslajtfwKtehkeOEG0dCYT++iA=;
        b=Cfpn+5kFDRzK88Vndi2X2OCT97+DHUjyCl5gdDb9uoH9rAaRKLhr6jmM9+kDJSBTJh
         GOdMfIjUKAzNpATWzFncNa+xTR2OI2fqSO2BBmPScIIq2I1SgjjivMpIi6p6vY9LGe38
         UiIeP9cK1eWCrUHL2xmx89YIHAzAXT+oSFC9leDaWigB0xzaUFLMHAgUUp7NUYVBfW4E
         1K8oz8XP70m5cV7uQcItTwXKF3DIZq4jdRkLfIC8iqeh1tljr0PRgd6P6P3L7PJSIEes
         HB7yPSiTJzYR0APni3ENA/zEdq3UgqsIrnVLMOQwLxG/Ly+KUBDHnBEjSUkxebOjxFs9
         ygyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J7HnLA4g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15si13801583edd.121.2019.09.04.13.27.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:27:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J7HnLA4g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bsM-0004um-Ar
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41526)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b17-0005eL-7H
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b15-0003Pv-An
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:33 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:36842)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b13-0003LF-9z
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:31 -0400
Received: by mail-pf1-x443.google.com with SMTP id y22so8280116pfr.3
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xM5PgyYOOv0mxKWZUoslajtfwKtehkeOEG0dCYT++iA=;
 b=J7HnLA4gZUweUgFUA/RP2tEKRY1pTK13ZQ/cKyGZH6pVy6DKYVfSv1xmX4zSblG+Wr
 hNWjdAK55jiBqAAkoMxKpeJrRlXJ4Ej/zqriMJuP7bZENW2VEnfzV39ck1WReKJYKrEO
 2zmKsid0O0dLnaIkWTWoiDWQhVUDW6ianfo7tjW3Gy3CD4zOR0tfqJs10Cv6lLdnYQHo
 L7f5T0L8FBTsN4Ni6HHPMOBtGQQPlNvZFDHX/FHR95BhUpoPh26EQt/f70QtBrKnsY66
 0IJt1GgoIvu4olQ37vU2D+G/oLdcm2wnYbTOy7HBEUx4kKG+lyjwJyoIjfoDYM3edMPB
 pi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xM5PgyYOOv0mxKWZUoslajtfwKtehkeOEG0dCYT++iA=;
 b=OfJzJ6HNds5i4uft383e0Yddeax2ZYPreVjvNqH/vs1ZHqyAnJm7iCEdQBYJapDnDA
 hkx7PGU4yOlLOxW6l/XXOY214GCuPd2qNO438ExfsbfkQ+sYEQlixZ7eb1UXg4htzqH0
 KnNVZiVaG8vhYAbn2vqxH4IN+ho2n5xat+MuanHMuZcMxlRfjrTlrLVXGxe6yUnnH9rB
 y+EONVHZwc+WmVZRYyZS4gUw9DimNIvSC+6RbV9OlKscjYRLEr4B27DzdnKEwMs/tN+k
 zhZ1OAQCTJeXIdO7FH9Sr02p8YZn9OxQzLvmMgz9wa2rUedZPJx0H+uFoygFUhdIm2El
 TLCQ==
X-Gm-Message-State: APjAAAXeq975FtDBVqZ0Vn0+cwZZUmZumx2QFOmfVzmtlgd7tPoct0GB
 JiWtmNpmqvrhnYBJYkWi04sJcve9Ugk=
X-Received: by 2002:a63:6d6:: with SMTP id 205mr37640948pgg.262.1567625546919; 
 Wed, 04 Sep 2019 12:32:26 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:58 -0700
Message-Id: <20190904193059.26202-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH v4 68/69] target/arm: Clean up disas_thumb_insn
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
X-TUID: LxaDz1/7AmiX

Now that everything is converted, remove the rest of
the legacy decode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a99a5c2eef..2412dde631 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10770,32 +10770,9 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    if (disas_t16(s, insn)) {
-        return;
+    if (!disas_t16(s, insn)) {
+        unallocated_encoding(s);
     }
-    /* fall back to legacy decoder */
-
-    switch (insn >> 12) {
-    case 0: case 1: /* add/sub (3reg, 2reg imm), shift imm; in decodetree */
-    case 2: case 3: /* add, sub, cmp, mov (reg, imm), in decodetree */
-    case 4: /* ldr lit, data proc (2reg), data proc ext, bx; in decodetree */
-    case 5: /* load/store register offset, in decodetree */
-    case 6: /* load/store word immediate offset, in decodetree */
-    case 7: /* load/store byte immediate offset, in decodetree */
-    case 8: /* load/store halfword immediate offset, in decodetree */
-    case 9: /* load/store from stack, in decodetree */
-    case 10: /* add PC/SP (immediate), in decodetree */
-    case 11: /* misc, in decodetree */
-    case 12: /* load/store multiple, in decodetree */
-    case 13: /* conditional branch or swi, in decodetree */
-    case 14:
-    case 15:
-        /* branches, in decodetree */
-        goto illegal_op;
-    }
-    return;
-illegal_op:
-    unallocated_encoding(s);
 }
 
 static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
-- 
2.17.1

