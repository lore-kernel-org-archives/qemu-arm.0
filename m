Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8336963wrv;
        Thu, 8 Aug 2019 13:27:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy79s3qTeps9BWlP9O6X5IDR6CNAMTtCgeyRfopNzw3TX/gUAyngsWHWQg8PE1Z+uZ9dIfN
X-Received: by 2002:a50:f285:: with SMTP id f5mr5149114edm.109.1565296044259;
        Thu, 08 Aug 2019 13:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565296044; cv=none;
        d=google.com; s=arc-20160816;
        b=06/3pGW3RLdtmz13miwCj1eR0g/hdvdY7Wa+q1/DicYT1DUqC3orzpi8S5mbtrS9wy
         yvbC/l+rhoI1Fc7VKrlqz2ztMRjUZi/lyC5yPZCmjY9xw9kTXN41U2lBi2Kzd2LBWW12
         bLpLv+JOizDAUAWe7/3KNPXgYQIO83UAG6Dbw3Yl5bumMqD8keJebDtvAuJRIHT3vNUY
         2BwLMnHRdpnJkHwPmAQyVzy1d89cAzuj+iT2VtWorMjx09Rhowp5OHGLYQUzmvoPBFIA
         XF0h4LQ3aqMOhaz13qsYjWIbEzT6Wj8m8WZ30U50fpWg2h373lr0J540cCS4AtbFWDuy
         B1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=nqzQU642U0COih1CmgjWbkQy5lirJcAcLB93HWWBZtw=;
        b=yrR+k+MpUIlqOkW0/Aq9VwmI91jqV1rZbsYMb6dmZb/xFG7zJ1wPM1Butfx6Kg/SXr
         JIjgYZF/cnmXDt+w15otnIuFUSgUc37gtLkdWK8x7zCL11+sl7h9Ep9MgBxuxNiu3BKn
         uxCKIEDTuYOdT86I7miYkOGSkKt5s1+x/Ocdwuxc/Y5nqOp89WiM5VWhyYkEYqDoiQ1+
         9SD0Ah8gEA4HgpU+rzDZoVnNGudJ7tyEOGTAgUYkM/3tyv9POzWvWZFL21SmYXKjJsc0
         ct71jZeCUaTmntskeTb2GLrDlbrDRdZmoZOn/xIGvf5KExDxdReGrb2DJn9uf0WnMGhf
         791g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f4x3IifJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id um7si32170443ejb.72.2019.08.08.13.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 13:27:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f4x3IifJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvp0N-0000QA-AR
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 16:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvozS-00075E-At
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 16:26:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvozR-0001Iv-BP
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 16:26:26 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34206)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvozR-0001IE-6H
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 16:26:25 -0400
Received: by mail-pf1-x443.google.com with SMTP id b13so44724458pfo.1
 for <qemu-devel@nongnu.org>; Thu, 08 Aug 2019 13:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nqzQU642U0COih1CmgjWbkQy5lirJcAcLB93HWWBZtw=;
 b=f4x3IifJ5NF4+rRGiMDD/6mffiSedpgiTboNBBfCNIUABOKv4uEyTedewTSTZGif2G
 OK3b6LiDTatS2yds7cbMJsul3xUL73d5M/A221BuTd/xCE+bP/c4q3rYpsCE9/s//biT
 y3byX0n20EyREj7D6Qp9/o0kFA1E8M/qHp1mvSQzn+ITbz8Bxx8rSqiQV2T/7oRqUtFg
 evltcs0K+vibzQ3Af5AO9WH23zdK1+TCgXzmBrvQFmQt/bMha1dgxJgCJD3//k0qgjN0
 /9KvgZIFtlhXRpQfSOzIU+ZqpLVBqC/X1Hs/ZqgVnoJMnWF2LVTceAtBb5jCLyZpX976
 InIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nqzQU642U0COih1CmgjWbkQy5lirJcAcLB93HWWBZtw=;
 b=ZCjm+lht42sn1y3f5hvrBU1wkCvYvjbvCPFTA8xwnPUC9TXXzlUH6d8t8Ef/cl6m0m
 hqfOw1XipMbSvnIfqx6nRoOJDMozf8MURAWyvPbQn5KS+iMNy37f8WfLau7VjFD7LEUG
 sdeRttFRS8JSnYw7xYJRd/isUOFxDj376h+HsbFs19AtBVXC8u17O9KPPpkawuSUW1Ck
 gkcpNz/1X5+w9rlnUgDxqvuzB/JH41F8g5us3G/VC9ei6qqX5b/64RLMLIIl/xmCvlvd
 S2uRx8Q3oWC1VYcLhXJF8jyR4V/h4MlnzjCNokyTOZ8eSF8Ergw9H3csgpig2Cd2rVZz
 oOeQ==
X-Gm-Message-State: APjAAAW7z9ZT3NSoNmRlJQR1dWJun6QK7X4cXAKnsEcccD1dUPHF9aw3
 2C0FZ5TK8TyUCRJBdPIIYcTdY/jD7eY=
X-Received: by 2002:a17:90a:3aed:: with SMTP id
 b100mr5814407pjc.63.1565295983855; 
 Thu, 08 Aug 2019 13:26:23 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id v12sm2850146pjk.13.2019.08.08.13.26.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 13:26:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  8 Aug 2019 13:26:13 -0700
Message-Id: <20190808202616.13782-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808202616.13782-1-richard.henderson@linaro.org>
References: <20190808202616.13782-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-devel] [PATCH 4/7] target/arm: Use ror32 instead of
 open-coding the operation
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
X-TUID: kfRsos3qYjl/

The helper function is more documentary, and also already
handles the case of rotate by zero.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 3ddc404b3b..b40f163bab 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7979,8 +7979,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 /* CPSR = immediate */
                 val = insn & 0xff;
                 shift = ((insn >> 8) & 0xf) * 2;
-                if (shift)
-                    val = (val >> shift) | (val << (32 - shift));
+                val = ror32(val, shift);
                 i = ((insn & (1 << 22)) != 0);
                 if (gen_set_psr_im(s, msr_mask(s, (insn >> 16) & 0xf, i),
                                    i, val)) {
@@ -8243,9 +8242,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             /* immediate operand */
             val = insn & 0xff;
             shift = ((insn >> 8) & 0xf) * 2;
-            if (shift) {
-                val = (val >> shift) | (val << (32 - shift));
-            }
+            val = ror32(val, shift);
             tmp2 = tcg_temp_new_i32();
             tcg_gen_movi_i32(tmp2, val);
             if (logic_cc && shift) {
-- 
2.17.1

