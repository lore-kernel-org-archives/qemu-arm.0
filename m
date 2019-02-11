Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1942313wrq;
        Sun, 10 Feb 2019 17:09:40 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbbAIdPQKCxE5k0BhWPep2814Qp+EgHqgPUDs3/pTQ/HEvfrpvMtOe5olrX62tNRFdyz7fZ
X-Received: by 2002:adf:e30f:: with SMTP id b15mr10287289wrj.0.1549847380603;
        Sun, 10 Feb 2019 17:09:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847380; cv=none;
        d=google.com; s=arc-20160816;
        b=K2l9lWsanJid+pvr9CREg8c8yDZxpS4d0z2JJLiAifp3m4H/bpeuE9nqnc2qdnbxSG
         0cue2jK2pF3pRGa5x3AwjRDTBmhKFE+8/lY9OV7y+4KxFZDH3EkYJZ4FU2ewn0PtpMMY
         d/yCX6vjG5zYtZZ2bSTaVM6qxdAiQmY5jM4aoi4U8RH2TOIc+0+WdSFS/gugV0X6XL6C
         rFuV0o/EKC6TMg8bxuDmvid3WRr2pt2wONz3jZFXx7wOnhiqeyWRj7euus46qUKtzohJ
         CO03UnIgJMDbWZW23krceRBqMrEgKx5CnhmxskbRs0SeJFnkHbP01qzzXmJ1wK2JHvz0
         wpjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=n4B8y8+rNu+NTfg8hfCg33xodySkURfq2FGlIVTIp5U=;
        b=yeRmM2Fariz0M/zCpHEJ470Yii2FtMZZJ+Q7Qztf7ER+7JUIOw8BWn5Idl9iEI6KLd
         3ogPyxdAywva1xL3AYuc0/k9JZFf2tRAXZDGkl33JIzqnybeqJBfPqMCuzVZY5YL8ndZ
         +oCUMxqLtwbvnM+kE4kN3CwnbaYdt6RyJ2ecYmsKWjjfzYnz7KQR4zHh94aZNwLcLt7X
         PjrOHWuyX05lBH3zEvOu0F+z++JFEuwwQ2szavMdSxGCC76g6135UjRPaxJyxkOEQ1LQ
         Zka6vhOSLlizBA8kH7wvXezk9TrXy2036ajYDSajY37nPvVkiy4e88R/SuOdiC2WfYfj
         DUXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IxV42RnR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si5841046wmj.9.2019.02.10.17.09.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:09:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IxV42RnR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt06N-000681-Kr
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:09:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05l-0005ih-5S
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05i-0008NO-AE
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:59 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:39409)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05g-0008HF-DO
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:08:58 -0500
Received: by mail-pg1-x531.google.com with SMTP id r11so4206017pgp.6
	for <qemu-arm@nongnu.org>; Sun, 10 Feb 2019 17:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n4B8y8+rNu+NTfg8hfCg33xodySkURfq2FGlIVTIp5U=;
	b=IxV42RnRrS15dVJKns6jDSdjgAuPFwL/uwFwQtINaxy48JKpTNa85PzMSSaFXCUByf
	aEgzffwd7IEEcvA10u33zF+2h9VKlifCY0L7bo6mboKYikNQWtoaZiIMWUbhdFAvujk/
	7Ghy0TLRhjyuN4lMQhcHdVKTWQiffR0QciHRNyt+4Z8PWUAEnTXwvL38cl+fuwKLBoN9
	q9AcFfX24wUyLu/X4kAHKY+S8zvKMThvE8hKL3HvNjvBaCvMFFs6D1oKRPs8JY9+aJo7
	SvCPXeve4RV9EGZR2ABHAQ1kf11GRIjtcw5wE5WxO2OM1rA0VzrLcCGZxxDMlkIoBWYu
	iPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n4B8y8+rNu+NTfg8hfCg33xodySkURfq2FGlIVTIp5U=;
	b=U2BIugrwh32qNkK2J2vEY+olu4bhIpPuhi9dU70VPLbX5OhmmLEIZqVpMZOytmDdGj
	DRHr0VbaQlRzrfeY7XrS/H5+8ipDcTvbMSF3gFxmoB0LCdBQp8nPChaYzOCBjwtQ7vAj
	RQNU1z2/Zeg7p8cvhf20KEqDi2oh8sD3JP7sKVq9418kMMe/gruBQWgKheBGvvCoaGpJ
	ZUY+EKQhnZE6u5ggujDRmBrlBEFAa08c7KhkWFSMLCCI04qzk7EQVM2ue5jWaQXFH5jf
	3b6cnoAqXC6VSMQ/k2UT4Hxhz38J4+DZyi/WmXNcWiN7XKGYDQKKvlXjyD/Lyfa8vXzC
	n0AA==
X-Gm-Message-State: AHQUAuZtYvWbeJSQvuoqJNbaabEwuowbLbgJuWhCLdnF7By1uC4AKDst
	E+O3VwV5BFpQxJePknRK5jXMj2SI8fo=
X-Received: by 2002:a62:3888:: with SMTP id
	f130mr33614130pfa.132.1549847332766; 
	Sun, 10 Feb 2019 17:08:52 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:19 -0800
Message-Id: <20190211010829.29869-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::531
Subject: [Qemu-arm] [PATCH v2 16/26] target/arm: Implement the STGP
 instruction
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6tENHmunpo2C

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 539c25a80b..9bd68d522c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2701,7 +2701,7 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
  * +-----+-------+---+---+-------+---+-------+-------+------+------+
  *
  * opc: LDP/STP/LDNP/STNP        00 -> 32 bit, 10 -> 64 bit
- *      LDPSW                    01
+ *      LDPSW/STGP               01
  *      LDP/STP/LDNP/STNP (SIMD) 00 -> 32 bit, 01 -> 64 bit, 10 -> 128 bit
  *   V: 0 -> GPR, 1 -> Vector
  * idx: 00 -> signed offset with non-temporal hint, 01 -> post-index,
@@ -2726,6 +2726,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     bool is_signed = false;
     bool postindex = false;
     bool wback = false;
+    bool set_tag = false;
 
     TCGv_i64 clean_addr, dirty_addr;
 
@@ -2738,6 +2739,14 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
 
     if (is_vector) {
         size = 2 + opc;
+    } else if (opc == 1 && !is_load) {
+        /* STGP */
+        if (!dc_isar_feature(aa64_mte_insn_reg, s) || index == 0) {
+            unallocated_encoding(s);
+            return;
+        }
+        size = 3;
+        set_tag = true;
     } else {
         size = 2 + extract32(opc, 1, 1);
         is_signed = extract32(opc, 0, 1);
@@ -2788,7 +2797,12 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     if (!postindex) {
         tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
     }
-    clean_addr = clean_data_tbi(s, dirty_addr, wback || rn != 31);
+    if (set_tag) {
+        clean_addr = new_tmp_a64(s);
+        gen_helper_stg(clean_addr, cpu_env, dirty_addr);
+    } else {
+        clean_addr = clean_data_tbi(s, dirty_addr, wback || rn != 31);
+    }
 
     if (is_vector) {
         if (is_load) {
-- 
2.17.2

