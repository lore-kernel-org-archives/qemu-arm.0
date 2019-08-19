Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3202649wrs;
        Mon, 19 Aug 2019 15:20:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRQ7IS75aYaF64m2vsX0vBMN9m96pM9UfJacPG1oG1De5bYzKzVukRGskvXJbgiKa/N+PS
X-Received: by 2002:a37:646:: with SMTP id 67mr22541114qkg.287.1566253218742;
        Mon, 19 Aug 2019 15:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566253218; cv=none;
        d=google.com; s=arc-20160816;
        b=0FqhKzWNoWrqEtCRu6xCkRYwcf7D/UgHusxeyfbszvqvjGFIErJWruvLO/jP8mHYCK
         kohldg2Bo2cJOYN0sR+chxp7n+d/XPjED3p5jwmU4Wl798PGSaKlEGX5wVfZuiTZrYOv
         zvj4Tt8Etx5L2iwFkJldy7zzQfzEYtaXtDHI+QYkHCE+g6d55uQUf7x2qaDdXDgCwXN6
         qWJYepi55O4ANd5LxtkdEgcYp1wVIyR4SORnsdem1AkPv3RSNB2C1kqzupH0ufHnVhio
         YvFUekWjVCisJvCvjcc1s1ZzOwb94ESRnVhQT3Yq+yK8aQUkyxknFVbv75dpVx+6JW/E
         mtFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=R8HoRqd/AoFmWYfXPK5hhE5318TDJ9BrfYUZdys1jYA=;
        b=jaBee+e39iPFLxlFsZLK5r6tFdCuxlwtT5i19CF+ZSThUV1g/EVZl7HsITGeozcH+p
         g8b72hj2uDqxUGrLL5ri3sbgNcjOcq90j9C1HTbsVC8zT1lNFemfKs144gn5Q/xj1ai0
         uO3zXBzx/zDI6qNYJ6uSld2Fm/k+CFDEgeqNETPYLM7bDuFRszqbCW+On5hxaURh4MYk
         VJMEZ/6w80MddnY+kL7lTLRm3f8zzK0xo5U4qkR57SuEINMUiHPsCORge65vp8kGemxi
         N725VlZV9cvFGe+y1TTj70hVOmiCNNMT76OkaDRHSlWY+4Q+lRAGnfVBaFz9+PfMQeu2
         B3Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FrMhe1sV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q24si10044462qtf.61.2019.08.19.15.20.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:20:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FrMhe1sV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzq0f-0008Fz-In
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59705)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMi-0002VM-Ne
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMh-0006hI-Gj
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:00 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:32856)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMh-0006gG-9W
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:59 -0400
Received: by mail-pg1-x544.google.com with SMTP id n190so1942694pgn.0
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=R8HoRqd/AoFmWYfXPK5hhE5318TDJ9BrfYUZdys1jYA=;
 b=FrMhe1sVfA6OZy+SANvMDtN3xGxjlWOmeMn5GOFTm/hi0WmNcVopCVhmgQGAfcul/f
 xTXZP+nsOop00FozGbAoI8NrjdCEiN7T0Gq37a5ueJdF6meg7mZ70n5ZyPqMbnRzxUls
 XmxHnkGjAbA8wLUk025hbucB/GxdoHOeNYdcqlMIeZcjfXuy2K3iokfBmtPVyyvjyKut
 IOEILkEOgCzZY7aQVMnCoxy673kKnCv+3Rc/uqsOcB9ltFO8Y6u7XKYsfNVYbZ+HWGip
 H6QqkO3ZITRfCsvvHhL1SPltV4HOzmkJ3RpmoOYoqn1HvAQyEfFdc6QoCoMMLAfPuk68
 +YZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=R8HoRqd/AoFmWYfXPK5hhE5318TDJ9BrfYUZdys1jYA=;
 b=j3wFKwI4V6svJn1724guAPNT8BduZGBpzS16rHwW4RwDzaQ05Swgs1U+VNA5urt35Q
 E0qqtSlXJxq6KyZTdLVzXA2V2b9FjW0zT8jEFcaNAI7+D1vqpsetjHwIzUGdTxmsch4Y
 heePQrr46k77TNJMfbzoKMTDaOBy/eGpLS+kLb0989h5chZHR+SeJbQ7gQw9nGHA5PRF
 5pD2c6zKFPuEEwgd5vcq76dqglm5GlFwvf3rm3J9hifEozbfK11XS0sqZoSYUmyXO2Db
 h11aOXvz/xorlnkbPOOsFGcMJvM2QWorb1Vu5FljEVVOt92QVmmPQYPfRixm2pmgbPHH
 x6uA==
X-Gm-Message-State: APjAAAVg2zcu+KMP0tbSRVt05S5uk0L4LyV+EbNrEZEvAFV0qYUucFNp
 XaQEt41PwsIzuBWzHeF3Vea38w==
X-Received: by 2002:a17:90a:be06:: with SMTP id
 a6mr23028467pjs.92.1566250737948; 
 Mon, 19 Aug 2019 14:38:57 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:37 -0700
Message-Id: <20190819213755.26175-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-arm] [PATCH v2 50/68] target/arm: Convert T16 add/sub (3 low,
 2 low and imm)
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
X-TUID: jTmdl2aL3+gD

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 26 ++------------------------
 target/arm/t16.decode  | 16 ++++++++++++++++
 2 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d417958b23..6f30415371 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10572,31 +10572,9 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
              * 0b0001_1xxx_xxxx_xxxx
              *  - Add, subtract (three low registers)
              *  - Add, subtract (two low registers and immediate)
+             * In decodetree.
              */
-            rn = (insn >> 3) & 7;
-            tmp = load_reg(s, rn);
-            if (insn & (1 << 10)) {
-                /* immediate */
-                tmp2 = tcg_temp_new_i32();
-                tcg_gen_movi_i32(tmp2, (insn >> 6) & 7);
-            } else {
-                /* reg */
-                rm = (insn >> 6) & 7;
-                tmp2 = load_reg(s, rm);
-            }
-            if (insn & (1 << 9)) {
-                if (s->condexec_mask)
-                    tcg_gen_sub_i32(tmp, tmp, tmp2);
-                else
-                    gen_sub_CC(tmp, tmp, tmp2);
-            } else {
-                if (s->condexec_mask)
-                    tcg_gen_add_i32(tmp, tmp, tmp2);
-                else
-                    gen_add_CC(tmp, tmp, tmp2);
-            }
-            tcg_temp_free_i32(tmp2);
-            store_reg(s, rd, tmp);
+            goto illegal_op;
         } else {
             /* shift immediate */
             rm = (insn >> 3) & 7;
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index a7a437f930..2b5f368d31 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -117,3 +117,19 @@ ADD_rri         10101 rd:3 ........ \
 
 STM             11000 ... ........              @ldstm
 LDM_t16         11001 ... ........              @ldstm
+
+# Add/subtract (three low registers)
+
+@addsub_3       ....... rm:3 rn:3 rd:3 \
+                &s_rrr_shi %s shim=0 shty=0
+
+ADD_rrri        0001100 ... ... ...             @addsub_3
+SUB_rrri        0001101 ... ... ...             @addsub_3
+
+# Add/subtract (two low registers and immediate)
+
+@addsub_2i      ....... imm:3 rn:3 rd:3 \
+                &s_rri_rot %s rot=0
+
+ADD_rri         0001 110 ... ... ...            @addsub_2i
+SUB_rri         0001 111 ... ... ...            @addsub_2i
-- 
2.17.1

