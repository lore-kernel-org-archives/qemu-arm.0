Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3198301wrs;
        Mon, 19 Aug 2019 15:14:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHubo41g+HrAjulR0qQFa6oOyeinURMzzl5+ejfw5tGX69WLMIVtKpHzTvJq+fjdZ5volY
X-Received: by 2002:a37:660f:: with SMTP id a15mr20662829qkc.428.1566252869237;
        Mon, 19 Aug 2019 15:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566252869; cv=none;
        d=google.com; s=arc-20160816;
        b=rkyeHsgaDNe7wM6kg6o9/hS4BckJsusfUvJ7poQzoaHsih5lmJJIPSVoIvcun058kH
         chQSvrZY9qqAvHI7AnYUQPqP9SulluJYCm4DzkrELH8ukr7w41mGrGRcsyKK65EcGboc
         tV5v5w6o00Hl/y5peGMMbwUtRVkDn9EMdUPKhzRA6W2Q0UpjsES0339yeHDNlKXglIKZ
         gtrDB40LaA5tzk+wSEaIzH0UM585OnAFRtwpMOVgyMKRzmH4vUc+JGV2l+EZ0QWYH+Ig
         iC5HPzfr2Ugme5hVaWR4ShzhXgMn/0a7jEJyss/0w1PiFZKe9t6YEiOfSJv2o/CCHAfT
         ZJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=IoEU+NRa2JWhajyfKqrmJYRYOBCu04dzJDGI4c2fGqA=;
        b=fYhKkLUA1YIchLEKkkoIRFAsVWqw3nTTpRtbY9fG3gw9DqzawzW8EDkJWJGjupJm1j
         R8jDm+/9aWETFjezQgYD3dGnsCr+0Q62Zn0db+XbBY5WU+M8BTX5irlGD6KGbO3OEtXT
         t9bHcb9DkF/KCYNLft6FSTVndRFOzXj6ce2CRpi3czzQFmeJf7nchI7pHqUBk6Eb9Qay
         k7wsqaXx6wSvWGwMeOU4Y4y4Hb9P/JKrZGPbhvQO0pYM9WC6qGOi0HBL7lidPtAF0x2R
         +HPVQx6dJprI54XYXoUZusEosyudNHY7yPMX9LsNjstIQtca9bDqnmUqynNq1ZwCqUF2
         WLeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fVWboJtD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a50si9445549qtk.284.2019.08.19.15.14.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:14:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fVWboJtD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpv2-0007Rw-94
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59881)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMp-0002ie-FY
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:39:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMo-0006oa-5V
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:39:07 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:46335)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMn-0006nf-WA
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 17:39:06 -0400
Received: by mail-pf1-x444.google.com with SMTP id q139so1934188pfc.13
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 14:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IoEU+NRa2JWhajyfKqrmJYRYOBCu04dzJDGI4c2fGqA=;
 b=fVWboJtDgcblSVQ9v2jozNz5T7a1y+Km5gqHeD/FUzAxk/yHqNmBGlH/rew6l8AQkP
 QepSMzHhSmyQAUrW6clwCom0I4ZH7a4AbKrpKv3rQN9Fu392Y15uTTreWqENMsUUwzwr
 W+YsaCvFpLRS6ZSBB+jv4jA4f3kC0R8N5qRm5M3XH5LHJP/n4VV0vvNTziAWElLdv1gj
 oBdayyKMQXSYA7OOA9MLEj6CIF+DYCYJ/M7Ws2ByNvT/yMGgqlmPdS0Ciiobqe980ckv
 yGWtjiiezJW3l746Kj4Yi1uHQepYKgdb2GXyXCZ/8DAYrifELFAwCYPuqcyCJ5BI4dSV
 23yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IoEU+NRa2JWhajyfKqrmJYRYOBCu04dzJDGI4c2fGqA=;
 b=HGc0HouJIJ5Von44Plm15isphvh6RtAkuV5z1dmDT7zk/OwDYbkJkGFgIB0bXlCJ5k
 RV6dEUpS3k0wDOd510QohbW9hpTmlMjDXpzSc8Dc++ef8/kCdg9gXINlPQM8PcCYImQ3
 2NUvukefWPh4XsbYiTdXpAxxfXI/n7eDoCOSiMV/Q+NAi4hXGs0uGXFfYGyssh+A9ydc
 vUJj+q1Oqa3eq6mgrYIbrrmlTjz88F6Zgs/7zCZS0A8YnGADaMDP9HxbXgqerKgPmkVm
 nC7NjwDcIpfFA5EpdtAFirOZkkE4tDPkM+c22Vkv5jtfoqlZ+Cr/+UhsiAv3wXHJS6MY
 4Wow==
X-Gm-Message-State: APjAAAX+6u+dFMFaHbOAysjls1HvqylqYibh/6qD6UlqCFgJryLWU7zV
 XyI2/VZRj+prgiQCsO8gqAZPGXCR9hE=
X-Received: by 2002:aa7:925a:: with SMTP id 26mr26491760pfp.198.1566250744805; 
 Mon, 19 Aug 2019 14:39:04 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:39:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:42 -0700
Message-Id: <20190819213755.26175-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-devel] [PATCH v2 55/68] target/arm: Convert T16, extract
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
X-TUID: ZmKPkc/90yna

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 14 +-------------
 target/arm/t16.decode  | 10 ++++++++++
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index cac3893386..414c562fb3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10641,21 +10641,9 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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

