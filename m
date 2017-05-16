Received: by 10.25.0.6 with SMTP id 6csp2083592lfa;
        Tue, 16 May 2017 16:02:19 -0700 (PDT)
X-Received: by 10.55.9.141 with SMTP id 135mr389653qkj.20.1494975739051;
        Tue, 16 May 2017 16:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494975739; cv=none;
        d=google.com; s=arc-20160816;
        b=MWsbqMxAWVxogy5A83Zk/CuJEDq9NO2KV9ZOfkrvTVVobWpscdUmvx6x/+JxVcDhCm
         iGM1bibHGxwpKlqI8K/bW3kjvd+tMwqwgQDBp37g/tXEg49DFEMtYASa48Vl6hqcPErP
         3LEd8XiSE5uxnQs9wv4sP9rqxMkdq/BCFmcqdbWHheyCgsbn3SxSWhYAbEooRiXgr1Dv
         q1fXqIBFGyt8QoR2da6SJyZGpzaUQXfiX4PZSg0mGdJiIJjX9YvdJqIvuKM7SOl88Mqu
         iYjg/Wx6dUIM0sdHATC47fb4m3Ln+f70gLWm2YcU2j8/OAHW15vdFtJoujTBzGO3rFXA
         nn2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=T0xZV60gGhZ19ijLv6LIYQSMw8hW6qbd9MKtNchmciE=;
        b=TT3JpSChwFHTSEsJokoVSNBRFtURC2gIt1sb1v3uzZQXsMA7aUy/OiGWmq1IA1pUCt
         ljEBIHxZliXGGOHZ+U03jsogkCSMOVEfK+OC/zATUyR4CSXwxZYG1i/jqJXOt7iG9Btw
         rc6B4xfz0jb+dFwpR/qhfXtO/30G9LJsIXnFejRRLnes3icAgI5GgelJ5OwyQG46gM5K
         ko0x3Nbo/XPpcnEMyerO36Bf+GJ0cK4VmCzfp2z4MP1zFE6PjVjvGmhgixJqGD0JrP3U
         iKLSIN6r3q3rpFmOwR/itIQ8kWxg8m7EA4W8jaZ7jLAtQipVsY9cQBrkV8xcaiQ9Lk0L
         mYdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y64si226500qkb.229.2017.05.16.16.02.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 May 2017 16:02:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44493 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAlTu-00081R-HJ
	for alex.bennee@linaro.org; Tue, 16 May 2017 19:02:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1dAlTp-0007zS-NI
	for qemu-arm@nongnu.org; Tue, 16 May 2017 19:02:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1dAlTp-0002ey-0R
	for qemu-arm@nongnu.org; Tue, 16 May 2017 19:02:13 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:45192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aurelien@aurel32.net>)
	id 1dAlTn-0002dB-3I; Tue, 16 May 2017 19:02:11 -0400
Received: from [2001:bc8:30d7:120:9bb5:8936:7e6a:9e36] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1dAlTk-00021K-90; Wed, 17 May 2017 01:02:08 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1dAlTj-000223-Gf; Wed, 17 May 2017 01:02:07 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: qemu-devel@nongnu.org
Date: Wed, 17 May 2017 01:01:56 +0200
Message-Id: <20170516230159.4195-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170516230159.4195-1-aurelien@aurel32.net>
References: <20170516230159.4195-1-aurelien@aurel32.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:bc8:30d7:100::1
Subject: [Qemu-arm] [PATCH 1/4] target/arm: optimize aarch32 rev16
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uun54bk5Vqxx

Use the same mask to avoid having to load two different constants, as
suggested by Richard Henderson.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 target/arm/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0b5a0bca06..5becb2bb89 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -339,11 +339,13 @@ static void gen_smul_dual(TCGv_i32 a, TCGv_i32 b)
 static void gen_rev16(TCGv_i32 var)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
+    TCGv_i32 mask = tcg_const_i32(0x00ff00ff);
     tcg_gen_shri_i32(tmp, var, 8);
-    tcg_gen_andi_i32(tmp, tmp, 0x00ff00ff);
+    tcg_gen_and_i32(tmp, tmp, mask);
+    tcg_gen_and_i32(var, var, mask);
     tcg_gen_shli_i32(var, var, 8);
-    tcg_gen_andi_i32(var, var, 0xff00ff00);
     tcg_gen_or_i32(var, var, tmp);
+    tcg_temp_free_i32(mask);
     tcg_temp_free_i32(tmp);
 }
 
-- 
2.11.0

