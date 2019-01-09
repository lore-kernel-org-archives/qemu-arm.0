Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp755400wrt;
        Wed, 9 Jan 2019 07:24:58 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6K7bSmqKo4MNtHaYcXX0eCg5imnZaMksnhSGUsD5+Zt+IGiySc3f7BYJtx6CaGR1ZXyzys
X-Received: by 2002:a1c:a401:: with SMTP id n1mr6451136wme.101.1547047498083;
        Wed, 09 Jan 2019 07:24:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547047498; cv=none;
        d=google.com; s=arc-20160816;
        b=NbGL6N+nCOYFv0mmz1rs/V7r8B0DHvTUPFDePtNuyMQXqntZ/EIO34QGKdyLqUTO2h
         c4WDmcdXJhjMJug1CRhxaPTz7Nl5svmlQ1rS0s95KGm+Co8P+J08pjHtKEX4xpphK5WC
         47RVr93VwacDsTSuvBk1XFAOzwVpNZGrPKruLxmwc5KPTAQQxHr5m3pRs+cFtGOYofJC
         w+xEKhUP5eXERZjbykWb5emx/LOIqcj5yY0bJUlzjHxMx/8CfboUHMpyrQbIgxrl633S
         0fpKpe1h21ISZLH11eJi2wIp0OC2QCgjgv5LeS4Mu8nfz+1YqrYQRfR1mR7vCNdEhI1O
         c2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=hy9zgKoMNOedk/uGX3dfIz/q0RLyoiwxL/mM8ashevY=;
        b=Kw6PSBtq9woPwP91A7IitZXX2O1DXXgrtwie+yYS3mB2HYoK8oGTMrpirQodvHMNJn
         lXZfzV39HO3hdN8i039uTvPm2a8XwCSPstMxEqN6jDtSCWr7EPJpD5Z5lu2DIViNAKmC
         r1LQ8NiqOUTey8I7Zbpq0ZqFUyL4SlQwI+uBaHqpv54x0AAsxbCKLKfGJ4RREL95SQgK
         zEgpMBM5O0GyzgOWdPynOiQKE4IPDquykqFVQQ4WsmBU+VTLYEzg3Zl07hnguUgiMzjZ
         uPXMM0ek8Z1JUbO6qmB0eG84G89pIVFdbZ4pMx8QRJ8cBqnM2u6jqTia2bI1Et7GjrJt
         HQyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17si33842843wru.106.2019.01.09.07.24.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Jan 2019 07:24:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:41677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghFiz-0003BX-2m
	for alex.bennee@linaro.org; Wed, 09 Jan 2019 10:24:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1ghFie-0003AB-6P
	for qemu-devel@nongnu.org; Wed, 09 Jan 2019 10:24:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1ghFid-0007GD-Hh
	for qemu-devel@nongnu.org; Wed, 09 Jan 2019 10:24:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:39076 helo=mx1.suse.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <agraf@suse.de>)
	id 1ghFib-0007DJ-Pp; Wed, 09 Jan 2019 10:24:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 9E429AEDC;
	Wed,  9 Jan 2019 15:24:31 +0000 (UTC)
From: Alexander Graf <agraf@suse.de>
To: qemu-arm@nongnu.org
Date: Wed,  9 Jan 2019 16:24:30 +0100
Message-Id: <20190109152430.32359-1-agraf@suse.de>
X-Mailer: git-send-email 2.12.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Subject: [Qemu-devel] [PATCH] target/arm: Allow to switch from MON->HYP on
 AArch32
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tom Rini <trini@konsulko.com>, Michal Simek <michal.simek@xilinx.com>,
	qemu-devel@nongnu.org, Stephen Warren <swarren@wwwdotorg.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5JZnwKc+cT2U

In U-boot, we switch from S-SVC -> MON -> HYP when we want to enter
HYP mode. This dance seems to work ok (hence it's there in the code
base), but breaks with current QEMU.

The reason seems to be that we try to see whether we are entering
HYP mode from the NS side. However, MON is always considered secure,
so we always fall into an error case when going MON->HYP and never
manage to actually do the switch.

Fix this by not using a different helper function that does not bork
when we're in MON state, as that switch is supposed to work.

Signed-off-by: Alexander Graf <agraf@suse.de>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f00c141ef9..9bf8fbd8f9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6297,7 +6297,7 @@ static int bad_mode_switch(CPUARMState *env, int mode, CPSRWriteType write_type)
         return 0;
     case ARM_CPU_MODE_HYP:
         return !arm_feature(env, ARM_FEATURE_EL2)
-            || arm_current_el(env) < 2 || arm_is_secure(env);
+            || arm_current_el(env) < 2 || arm_is_secure_below_el3(env);
     case ARM_CPU_MODE_MON:
         return arm_current_el(env) < 3;
     default:
-- 
2.12.3

