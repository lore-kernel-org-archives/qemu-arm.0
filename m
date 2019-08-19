Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3193680wrs;
        Mon, 19 Aug 2019 15:08:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw8BdSQF+hHNbJpHsnzBFp/wt5Uy+myHhjidz0JeU5OkbeDqpyn/7wLpxbt5AL8+Lw56A01
X-Received: by 2002:a17:906:6d5a:: with SMTP id a26mr22962296ejt.97.1566252526625;
        Mon, 19 Aug 2019 15:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566252526; cv=none;
        d=google.com; s=arc-20160816;
        b=CckuSC1BpeOzCUfDsYSNKwg0D1mO7i2FuREctXHJj5tag2/C0impXBC6ruAsgrMoom
         NAhuHriCSDQSN4BrYUHDtgsPCHjH8ffrQtG2RT+8Y3JWIa28KAXZO9ZZbetSdcMcWyHK
         UuCNYqxrF61F6/1gaNYwovKaWy10u5wUFULcwwQnsFzcGh887dMFFnU0Awyk07+zYFKN
         VZa5vnDtXIKyDrkHObegh+Z8AcD0pjddDXjo01AVcz460bw5SY0pHK6CM4YXCTaOz0Lt
         XCHBYVtkbVOqrrCq0NZQk8K65Hx7dkWQM33hNtA6GG7zLcy/pG8Kj8QDbBj3qqP7SzTb
         WDog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=fWWvdDru9knlRm6IuiK5xbgxCPFGSOj1TibiqgY2wt8=;
        b=x6WCixrwzQQtjJKM3bL6WmGlisx9EGfmuaBbRhthvxZzm1WpRABPKWFVLz71t5mTfI
         Zp47zIP9kOfIqjOf+J1drKORP4kSkRvm8mKQiIqxgrT7A0IyXM85nvAVYpYxFhI5fU06
         kmr9r3Zs7l3a2loOQmoo5/5g4o4hkDq7DOwxQ8foOflRp3so5VlYisUeVglxKVSbkUBC
         tv5y56rshyZhO87I98dsQ6PW3YN6COZYjTqISWSkt6rYKF9cMIKxNnlSUrknW//ar1eI
         y00Se5q+11dpdaHxe6Znk19EloseT/j6n4ZaXJRKmFOfH1pDNfBco5bfEjhF+g35tt5F
         LSTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=grW2OU+w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j52si9664761ede.415.2019.08.19.15.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:08:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=grW2OU+w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzppV-00008r-6T
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59704)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMi-0002VL-NO
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMh-0006gw-C4
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:00 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37997)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMf-0006eD-8x
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:59 -0400
Received: by mail-pf1-x435.google.com with SMTP id o70so1949273pfg.5
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fWWvdDru9knlRm6IuiK5xbgxCPFGSOj1TibiqgY2wt8=;
 b=grW2OU+wjg/5blRzRrGgbm6QX4+AxMXafojAUOXf/h/bJW41xxALJFqKvkV9qG5ix8
 +IVCedUWBAVE+xyVpar6Xcw/VcYj3Jf+sSFlvgr654a/rGMqjAM4eY17yJat4Jw8lUve
 QNQZLPHKWSgT4asBLpPLIwiezLISqCO5o2n2mHQKmU83ivFwZcVw7UAkTgXA2YBHHklg
 NNURNx8hYC9IlelKGc/iknMcOjBPiOBqHhf3jrKlHgeXDe1ByyNmElFnhJGCNsubmCe0
 fKaIVulbcK0mvnet4b4+gzg5Jcg1/kEP5fwZTV3k1ckIGv8jGTgn9N25QcGOhctWD8na
 lu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fWWvdDru9knlRm6IuiK5xbgxCPFGSOj1TibiqgY2wt8=;
 b=FS9EE+FWmngLF2D2TaJH2TcEviuGqteJWANUP0+hLGbFb25BOVKlFcQK3frRu8R9/v
 /rC9co8SA4fZLmWc1mE3z6Z1GIkRQzuJ2k6iJ4YDU+jQNMOITXlezbv7j39wr3xNS8/k
 Q6DEASvfyZ6YXWN8Xi9vqpb3bAh+t8VEyxI6HPnD1C7EVxZE/MggZiUo3hvM0I/XSopQ
 5I9eRXxG65NjvTZ2L0Tb4bo/FFBAeKx/P4lKKimh40xZ/4fIcvpgacF/V+RWTUw5vyuJ
 1+q3zOJA2LnOOufZMZDJNkMNyMC4+pv4jYTXFLlEpa1floVsGnsJ//1J2KoU+4v7U+Yc
 eijQ==
X-Gm-Message-State: APjAAAU3xVWWewcMiheWaQ1kOybgQGEQVtSKxdC0fgl+48VoxTjenu7t
 gjbw4wt2I1MscmK5CRjIwtpac4Nd7ys=
X-Received: by 2002:aa7:8c57:: with SMTP id e23mr15883178pfd.48.1566250735751; 
 Mon, 19 Aug 2019 14:38:55 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:35 -0700
Message-Id: <20190819213755.26175-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::435
Subject: [Qemu-arm] [PATCH v2 48/68] target/arm: Convert T16 add pc/sp
 (immediate)
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
X-TUID: /cDJ1Yya31ud

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 12 +-----------
 target/arm/t16.decode  |  7 +++++++
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 24537fc107..2640f50fcf 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10749,19 +10749,9 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     case 7: /* load/store byte immediate offset, in decodetree */
     case 8: /* load/store halfword immediate offset, in decodetree */
     case 9: /* load/store from stack, in decodetree */
+    case 10: /* add PC/SP (immediate), in decodetree */
         goto illegal_op;
 
-    case 10:
-        /*
-         * 0b1010_xxxx_xxxx_xxxx
-         *  - Add PC/SP (immediate)
-         */
-        rd = (insn >> 8) & 7;
-        val = (insn & 0xff) * 4;
-        tmp = add_reg_for_lit(s, insn & (1 << 11) ? 13 : 15, val);
-        store_reg(s, rd, tmp);
-        break;
-
     case 11:
         /* misc */
         op = (insn >> 8) & 0xf;
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 1cf79789ac..71b3e8f02e 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -23,6 +23,7 @@
 &s_rrr_shr       !extern s rn rd rm rs shty
 &s_rri_rot       !extern s rn rd imm rot
 &s_rrrr          !extern s rd rn rm ra
+&ri              !extern rd imm
 &ldst_rr         !extern p w u rn rt rm shimm shtype
 &ldst_ri         !extern p w u rn rt imm
 
@@ -102,3 +103,9 @@ LDRH_ri         10001 ..... ... ...             @ldst_ri_2
 
 STR_ri          10010 ... ........              @ldst_spec_i rn=13
 LDR_ri          10011 ... ........              @ldst_spec_i rn=13
+
+# Add PC/SP (immediate)
+
+ADR             10100 rd:3 ........             imm=%imm8_0x4
+ADD_rri         10101 rd:3 ........ \
+                &s_rri_rot rn=13 s=0 rot=0 imm=%imm8_0x4  # SP
-- 
2.17.1

