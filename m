Received: by 10.25.44.15 with SMTP id s15csp5575977lfs;
        Mon, 17 Jul 2017 23:41:03 -0700 (PDT)
X-Received: by 10.55.221.211 with SMTP id u80mr156903qku.186.1500360063198;
        Mon, 17 Jul 2017 23:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500360063; cv=none;
        d=google.com; s=arc-20160816;
        b=mhO0aQE+8D2IHFJ00KOzqcgjuG8M9I8OhL4++iwCSTzYl9Qm0fInJbrzMIfIzwmiGj
         iCmIwU/miaX0g4zEKSi5LJhSkBO0+PruZBCO/0LghDXqRN+JVZo0STAy+uaFSfEfzIYm
         3JSl4j0mKAWLz/Kkl8eZnGzcHxdkd4YubBjTb5g1vuSOabI6e3Uu/iFtezb4q6k4YvwG
         D2pG/rFSO6Q3c/qgv6khH2dpDRGjVZdJAcKboe2KPoLmMf44x/JJak7GXKQpwnIhyia6
         pMA7R9oD/i0Fx6A1uZGHAt0BTd17MylEzLL2DbDA6Tv9slDeZpZq5c4h4Zz2L7LaiEIN
         JNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=0Z9ljCpDC9iQJVx2QWKQM5HuKq6LOocJgaEXih/MZv4=;
        b=ubNiRNcBPTDtaBGovFD/ai0MziZvdvTGahPYQvDDTTdzv4diW5unY26CUdFF04rQuV
         BYJ1JkgC6aAbTgBwV5YRBn9uq+FSQjyoAlqkF81ltrKoM7gm0S1T7Yj7lk9ubPW37krQ
         RY4sapv8s2jmlSgjbma++9+gr1pY3FQMiH7YBW0DN9TuJZ0G52YZJY6XTNvEO5bkLZy7
         lQ+S7GadlTG+QRpBQOzvpqZhqaOJslwn3CO83IejzWRk1eWz1J9Gz7YzuvpYRZ7RPIwm
         eUWcDNjWmGdIccVu+CqtyQFIunxzdjQ/0rCjziOB2FQkKtWioNOzW0sPmlWRBOIDOPGt
         TeBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ZBhul09P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r8si1355831qtb.29.2017.07.17.23.41.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Jul 2017 23:41:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ZBhul09P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dXMBo-00040D-FS
	for alex.bennee@linaro.org; Tue, 18 Jul 2017 02:41:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dXMAI-0002Jm-B9
	for qemu-arm@nongnu.org; Tue, 18 Jul 2017 02:39:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dXMAH-00040X-Gx
	for qemu-arm@nongnu.org; Tue, 18 Jul 2017 02:39:26 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:34257)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dXMAF-0003z2-20; Tue, 18 Jul 2017 02:39:23 -0400
Received: by mail-pf0-x241.google.com with SMTP id o88so1599802pfk.1;
	Mon, 17 Jul 2017 23:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=0Z9ljCpDC9iQJVx2QWKQM5HuKq6LOocJgaEXih/MZv4=;
	b=ZBhul09PLdhNR9k6tl2ffpp9W4axnfmMEBBHfvUqxYY283kQFTZE8xJ/Ird3Y2X+5j
	jvnnoY6aw5XL6MKFrv0/pSnU1bT/Vhs6UVrxRgbA0su/6av3Ik97bfEjhPJ/6wvL4mxy
	LN6v3oRW/VkbuQVenLnxHu0tGdameVir8r/UrwlCGEB0Qp0tcyzL5FBm2QiMKTTsKBjS
	rcFlF5QyM4QVWgbTKfaSTli5OFy0Rk5//hTYDhwCOsgB0ZrHmGGvDhmNGzSRSK5Qfyj1
	QTuhyhMq1MWs2Pulfo5vJWBiCAlKnjeeajwfCzivU1IUFoxGw4l9pIf/vosLz4rfulsD
	qccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=0Z9ljCpDC9iQJVx2QWKQM5HuKq6LOocJgaEXih/MZv4=;
	b=HOblgd06EWdrY3KwnqCIT0eWEXP1DThaRYAnlRoHmHJBU7dRpt0TPJ7uFVszIWjx7R
	07P1lxjLHRDxG4zB6pTgwKne0CbZG69BAUH5hOfeHMdxYB8z6SdxjC+KtGsa1eVUlH+v
	8Xzdkj2pb3LyhV97eeaji0Bjjc6nNRsM4zAs0OseFyAf3Xwa+UwqPFd6xN3+gm4AUaGY
	huHOfPvgNCop994IwbFNORehe6gMLeDDIDpuNxsRetcqqNlp5YQmDo6418mGDcLJsrRt
	DO+zMbi94Ch+u7iv/1k2uO+AEEpR948DR74mkkwymYKKKvQPfsD+VCExkTxLDvzSbPvl
	p9pw==
X-Gm-Message-State: AIVw112mQhFFZRuU5rvZIDQ9HovztDJf29zc15DxbZxgDIuAGZcKl2C3
	MSYWfKLleCTFOg/8tIM=
X-Received: by 10.98.67.147 with SMTP id l19mr121648pfi.198.1500359961703;
	Mon, 17 Jul 2017 23:39:21 -0700 (PDT)
Received: from bigtime.twiddle.net ([101.165.234.197])
	by smtp.gmail.com with ESMTPSA id
	s87sm2548402pfa.86.2017.07.17.23.39.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:39:21 -0700 (PDT)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jul 2017 20:39:07 -1000
Message-Id: <20170718063907.23525-1-rth@twiddle.net>
X-Mailer: git-send-email 2.9.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH] target/arm: Optimize aa64 rev16
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zAf6HFI1HUzq

It is much shorter to reverse all 4 half-words in parallel
than extract, reverse, and deposit each in turn.

Suggested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate-a64.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e55547d..6b247a7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4042,25 +4042,13 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
     TCGv_i64 tcg_rd = cpu_reg(s, rd);
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
     TCGv_i64 tcg_rn = read_cpu_reg(s, rn, sf);
+    TCGv_i64 mask = tcg_const_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
 
-    tcg_gen_andi_i64(tcg_tmp, tcg_rn, 0xffff);
-    tcg_gen_bswap16_i64(tcg_rd, tcg_tmp);
-
-    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 16);
-    tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
-    tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
-    tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 16, 16);
-
-    if (sf) {
-        tcg_gen_shri_i64(tcg_tmp, tcg_rn, 32);
-        tcg_gen_andi_i64(tcg_tmp, tcg_tmp, 0xffff);
-        tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
-        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 32, 16);
-
-        tcg_gen_shri_i64(tcg_tmp, tcg_rn, 48);
-        tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp);
-        tcg_gen_deposit_i64(tcg_rd, tcg_rd, tcg_tmp, 48, 16);
-    }
+    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
+    tcg_gen_and_i64(tcg_rd, tcg_rn, mask);
+    tcg_gen_and_i64(tcg_tmp, tcg_tmp, mask);
+    tcg_gen_shli_i64(tcg_rd, tcg_rd, 8);
+    tcg_gen_or_i64(tcg_rd, tcg_rd, tcg_tmp);
 
     tcg_temp_free_i64(tcg_tmp);
 }
-- 
2.9.4

