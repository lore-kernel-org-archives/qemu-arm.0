Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1056790wro;
        Thu, 14 Mar 2019 09:41:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4i6ypPagJ/TOCHcSt0FNQKu1a1ZV0n6PFrHvhWX2QSnZiTXVyozf5Vv1lxR6ifCP+fQMa
X-Received: by 2002:a81:7ad7:: with SMTP id v206mr24821738ywc.342.1552581677058;
        Thu, 14 Mar 2019 09:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552581677; cv=none;
        d=google.com; s=arc-20160816;
        b=oEuX5ETJkdDYhSsY2ykfqVheLzNBPpi/ecJFZbHuAWg1y6e752o5Sr7jbPgDgosHpJ
         19mi3xuJO8sVw00ZqkJe7G4J0T8XAyNQJOCeq9DqdvoBbsw5D5SjooCl31cvOOJblTmY
         521Qy61VZYqZSFtHZ4t95VudG6OjYkxTsHKp/XtaAJu7OosaRG030tGtwzKgPAlP2kbb
         k6mAodaVP+6dbLlhZ5ZT6jRbL4r8BfhMevcXmp7zT8OaoAxdir2206KZ8IBAap6iZxx9
         p3mqSJhOJj8UFxBJMZE+zdLF4NSFYFCJltyCcbNvUVoCX7yEEy6BA6O90ol+VevP3ntU
         9JSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=oQkMBfTlcSQmKYYnhR5jDg0kMO4RhQCuhMrhAA7XcB4=;
        b=uD1U2NnPbQqK+ae56BozKyJxII77ZZdRA2+a8Z8ibY6anhKwiViPLbJSnFmsmGgOxw
         JnbWHfHX6pbXn9fUc1daHJojgwOETqH02K8hVYIqRLlotAy88Azru2B/QuNu8UuLHGOR
         wrZEhhIyjOoFo23qGnNZK7C62peKI8qeJPJbCzTNWN+vhYqyd7DQaAOqtCqEwKzk7KBx
         Kfb2ZBiEWQ1YCNZEPZtpJzL2tdvyJSTqcs3rZQxHb8X7gYyIlgYcxb0rDafg0TDTpXpc
         PiMWH93d9Wm6UYJqD/EUpBwcYdQb0yNPHZBNoDgSiQDVuV7VE8Psl914QcWbUSOOFB9f
         Kd+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k204si8665338ywb.177.2019.03.14.09.41.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 09:41:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:41345 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4TPw-0000RF-AK
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 12:41:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amir.charif@cea.fr>) id 1h4TPY-0000Gq-Ry
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 12:40:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amir.charif@cea.fr>) id 1h4TJD-0007MM-Iy
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 12:34:20 -0400
Received: from sainfoin-smtp-out.extra.cea.fr ([132.167.192.228]:58871)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <amir.charif@cea.fr>)
	id 1h4TJC-0007Gk-2L; Thu, 14 Mar 2019 12:34:18 -0400
Received: from pisaure.intra.cea.fr (pisaure.intra.cea.fr [132.166.88.21])
	by sainfoin-sys.extra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0)
	with ESMTP id x2EGYAAL017597; Thu, 14 Mar 2019 17:34:10 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTP id F1EC92058B2;
	Thu, 14 Mar 2019 17:34:09 +0100 (CET)
Received: from pisaure by pisaure with queue id 6968901-2;
	Thu, 14 Mar 2019 16:34:09 GMT
Received: from muguet2-smtp-out.intra.cea.fr (muguet2-smtp-out.intra.cea.fr
	[132.166.192.13])
	by pisaure.intra.cea.fr (Postfix) with ESMTP id C8A872039A2;
	Thu, 14 Mar 2019 17:34:09 +0100 (CET)
Received: from amir-VirtualBox.intra.cea.fr (is233176-dock.intra.cea.fr
	[10.8.35.126])
	by muguet2-sys.intra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0)
	with ESMTP id x2EGY9WN003367; Thu, 14 Mar 2019 17:34:09 +0100
From: Amir Charif <amir.charif@cea.fr>
To: qemu-devel@nongnu.org
Date: Thu, 14 Mar 2019 17:00:48 +0100
Message-Id: <1552579248-31025-1-git-send-email-amir.charif@cea.fr>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 132.167.192.228
Subject: [Qemu-arm] [PATCH] Check access permission to ADDVL/ADDPL/RDVL
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
Cc: Amir Charif <amir.charif@cea.fr>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pf1d997IxpOm

These instructions do not trap when SVE is disabled in EL0,
causing them to be executed with wrong size information.

Signed-off-by: Amir Charif <amir.charif@cea.fr>
---
 target/arm/translate-sve.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3a2eb51..245cd82 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -943,24 +943,30 @@ static bool trans_INDEX_rr(DisasContext *s, arg_INDEX_rr *a)
 
 static bool trans_ADDVL(DisasContext *s, arg_ADDVL *a)
 {
-    TCGv_i64 rd = cpu_reg_sp(s, a->rd);
-    TCGv_i64 rn = cpu_reg_sp(s, a->rn);
-    tcg_gen_addi_i64(rd, rn, a->imm * vec_full_reg_size(s));
+    if (sve_access_check(s)) {
+        TCGv_i64 rd = cpu_reg_sp(s, a->rd);
+        TCGv_i64 rn = cpu_reg_sp(s, a->rn);
+        tcg_gen_addi_i64(rd, rn, a->imm * vec_full_reg_size(s));
+    }
     return true;
 }
 
 static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)
 {
-    TCGv_i64 rd = cpu_reg_sp(s, a->rd);
-    TCGv_i64 rn = cpu_reg_sp(s, a->rn);
-    tcg_gen_addi_i64(rd, rn, a->imm * pred_full_reg_size(s));
+    if (sve_access_check(s)) {
+        TCGv_i64 rd = cpu_reg_sp(s, a->rd);
+        TCGv_i64 rn = cpu_reg_sp(s, a->rn);
+        tcg_gen_addi_i64(rd, rn, a->imm * pred_full_reg_size(s));
+    }
     return true;
 }
 
 static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
 {
-    TCGv_i64 reg = cpu_reg(s, a->rd);
-    tcg_gen_movi_i64(reg, a->imm * vec_full_reg_size(s));
+    if (sve_access_check(s)) {
+        TCGv_i64 reg = cpu_reg(s, a->rd);
+        tcg_gen_movi_i64(reg, a->imm * vec_full_reg_size(s));
+    }
     return true;
 }
 
-- 
2.7.4

