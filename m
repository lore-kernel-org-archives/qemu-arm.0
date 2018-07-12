Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1608327wrq;
        Thu, 12 Jul 2018 10:12:34 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfjW93of8mPwRMNB8q/tSmLC5j993NFWpCgMsfg4co/forpR6md5Wme3VEC3liCA6KsDLGh
X-Received: by 2002:a0c:bf4e:: with SMTP id b14-v6mr3390500qvj.65.1531415554573;
        Thu, 12 Jul 2018 10:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531415554; cv=none;
        d=google.com; s=arc-20160816;
        b=u7qyClizk8OM3zpqqcYBi6lHP0nhH2MLAlxPGUhcJJa9RozeLe832dNgGKV+L/cIe+
         /Bx6XbzYjwqW5oWhaD2UGF1ZC2V2s04pzeGKxvJ5BXQ6puhOF1AwCB5WMlYB3p6yO/HJ
         0P1XWWmLtKscgoC6eQS+AjmYnPKIZxX74XkevtQQHYmKKaejpJ4zj+2qO3iYRTmLLEFp
         0YQL68nerMRhq+t94WLd4y3buV+qxrALfrOmiRN2ClVB8RL5FN4CrwfmhPM8fgN8dQbh
         xo31m2UiFmgFb5HEc1sMyb/YGHde3ty0NLutJV0ZahqjGZBz5fLGBK5KpIZsUIErhzu2
         qwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=maOO8kTxmGD+oz8AjnNlQMUKtAebvz1LrFGiEOStOxg=;
        b=z5DNzctZOzwA9nXr7cI4XAzTHnwpWVvEVfBoq1PeOPSmCl0VYSASc3lyd10J1FRBhj
         9HJ8zY0VRoRzf3A/gsE2FjXmIdpwHpG4V48810UW0uc5hkXlMT/MNgrlHWVXd8WB1EZa
         bYyuRGDnUmBb7bLIPlZqfo2tO+BkQNGVLgXG6RYxTINxL4I/T/faxdB//zeegHv9lI7I
         wxROcNdqh6RyoS2mKdH+9Nc31uD40FSdsVW57oWV9wS4+mXf7S7eqlo/ytSKyQQV4g74
         Yr98mqjzdou+8oVUZXJvV42TC/zuMmwpMNVAx2A76ddLAFxnQa76m4+84rhZrQ2IVteV
         ANeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u33-v6si1422997qvh.150.2018.07.12.10.12.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 10:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdf8s-0000G2-3P
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 13:12:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdf8i-0000Fh-HE
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 13:12:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdf8e-0001YX-Eo
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 13:12:24 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46038 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdf8e-0001Xo-AV; Thu, 12 Jul 2018 13:12:20 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9942E81663FC;
	Thu, 12 Jul 2018 17:12:19 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-19.ams2.redhat.com [10.36.116.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AAB902142F20;
	Thu, 12 Jul 2018 17:12:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 19:12:17 +0200
Message-Id: <1531415537-26037-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 12 Jul 2018 17:12:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 12 Jul 2018 17:12:19 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH] hw/arm/bcm2836: Mark the bcm2836 / bcm2837
 devices with user_creatable = false
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W343AZBejC4z

These devices are currently causing some problems when a user is trying
to hot-plug or introspect them during runtime. Since these devices can
not be instantiated by the user at all (they need to be wired up in code
instead), we should mark them with user_creatable = false anyway, then we
avoid at least the crashes with the hot-plugging. The introspection problem
will be handled by a separate patch.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/bcm2836.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 6805a7d..45d9e40 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -185,6 +185,8 @@ static void bcm283x_class_init(ObjectClass *oc, void *data)
     bc->info = data;
     dc->realize = bcm2836_realize;
     dc->props = bcm2836_props;
+    /* Reason: Must be wired up in code (see raspi_init() function) */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo bcm283x_type_info = {
-- 
1.8.3.1

