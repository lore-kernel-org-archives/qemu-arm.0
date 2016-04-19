Received: by 10.159.53.12 with SMTP id o12csp2037668uao;
        Tue, 19 Apr 2016 11:08:18 -0700 (PDT)
X-Received: by 10.140.152.78 with SMTP id 75mr5499111qhy.22.1461089298708;
        Tue, 19 Apr 2016 11:08:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f33si34587965qkh.115.2016.04.19.11.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Apr 2016 11:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:34224 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1asa4P-0001U7-Lb
	for alex.bennee@linaro.org; Tue, 19 Apr 2016 14:08:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1asa4M-0001QI-KR
	for qemu-arm@nongnu.org; Tue, 19 Apr 2016 14:08:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1asa4J-000105-EP
	for qemu-arm@nongnu.org; Tue, 19 Apr 2016 14:08:14 -0400
Received: from forward12j.cmail.yandex.net ([5.255.227.176]:51299)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1asa4J-000101-75; Tue, 19 Apr 2016 14:08:11 -0400
Received: from smtp12.mail.yandex.net (smtp12.mail.yandex.net
	[IPv6:2a02:6b8:0:801:1::11])
	by forward12j.cmail.yandex.net (Yandex) with ESMTP id AB62421861;
	Tue, 19 Apr 2016 21:08:08 +0300 (MSK)
Received: from smtp12.mail.yandex.net (localhost [127.0.0.1])
	by smtp12.mail.yandex.net (Yandex) with ESMTP id 3213B16A15E5;
	Tue, 19 Apr 2016 21:08:08 +0300 (MSK)
Received: by smtp12.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	WNad2B8dFm-87BOwP3O; Tue, 19 Apr 2016 21:08:08 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1461089288; bh=gnRBjunzM5ZMpmmH6MDg9ts91RNNShT26yuj36L7elA=;
	h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	References;
	b=Rft6K+JYTn6ck7MGVRSFu4KuasoeFxb9aA9i4jbtjUas9pgApPj9A0rt4ijRUcots
	ZMqoupiBlEMmA3jh61uONA13ffGdY0H6Fxq4Fwq1+Ob86jbMvKHM3qedl+7eq39G79
	xydwMnmZp9hI8DaxuMME0vxzOc424EYRT69A3MMw=
Authentication-Results: smtp12.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 37377968
From: Sergey Sorokin <afarallax@yandex.ru>
To: qemu-devel@nongnu.org
Date: Tue, 19 Apr 2016 21:07:18 +0300
Message-Id: <1461089238-18314-3-git-send-email-afarallax@yandex.ru>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1461089238-18314-1-git-send-email-afarallax@yandex.ru>
References: <1461089238-18314-1-git-send-email-afarallax@yandex.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.227.176
Subject: [Qemu-arm] [PATCH 2/2] target-arm: Fix an exception return on
 AArch32 instruction ADDS
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Sergey Sorokin <afarallax@yandex.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 10rXQ8mjVTW4

In AArch32 instruction ADDS r15, ... is used for exception return.

Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
---
 target-arm/translate.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index 68671b7..3e64ba9 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -8512,12 +8512,21 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             store_reg_bx(s, rd, tmp);
             break;
         case 0x04:
-            if (set_cc) {
+            if (set_cc && rd == 15) {
+                /* ADDS r15, ... is used for exception return. */
+                if (IS_USER(s)) {
+                    goto illegal_op;
+                }
                 gen_add_CC(tmp, tmp, tmp2);
+                gen_exception_return(s, tmp);
             } else {
-                tcg_gen_add_i32(tmp, tmp, tmp2);
+                if (set_cc) {
+                    gen_add_CC(tmp, tmp, tmp2);
+                } else {
+                    tcg_gen_add_i32(tmp, tmp, tmp2);
+                }
+                store_reg_bx(s, rd, tmp);
             }
-            store_reg_bx(s, rd, tmp);
             break;
         case 0x05:
             if (set_cc) {
-- 
1.9.3

