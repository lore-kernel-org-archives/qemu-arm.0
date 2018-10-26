Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp524282wro;
        Fri, 26 Oct 2018 03:07:21 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fO9dxlfO99vIkzRcE+t8YB1zKy/MJiQeEvy3a6Okyc8SFSf2bycl0sp8AIXL3Vu0Yzl09L
X-Received: by 2002:a0c:d94f:: with SMTP id t15mr431434qvj.189.1540548441637;
        Fri, 26 Oct 2018 03:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540548441; cv=none;
        d=google.com; s=arc-20160816;
        b=LxrnyKRH7cpOc5W8m3i+rHsb63JWGkr9HXb1VvEiXWXd1mBodJiS38rdD/wx+1bYt1
         K41tTqoRZz1yenLynn6aW+fedxKq/54XESWYWPOStZpk5IiN1rT02Wx0k2fipAVMe3+Y
         0sSMKF2BmVEajCXegZKfycK7cgX4bEbz+ZIyNyA7VloPf0C9YnR9paO4XF72E/Vd8nVv
         LCijg54FD8vw3cjVOCipFHZZeaAHA8xpu+wCmw0UwfLk3AmMeQnkLPQtX/4yqrpLsWfO
         qtXJ5iUVluCTWVDlhUesrVVZc1+NHf9Yn363W3kKn2IPC4C3zldcJ0XwMXiTCnsklbR+
         jrRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=yDE2DbIzllkjjbS9fXIvss17RWAEgKSkZT212OhhoAw=;
        b=CzkBOyXA0H5WpQfehEkT5Q0WT+/T8JEfVeuU1759pCBklZGGj9ScHDXVAKKFEOisnw
         H4Hg35FqeB3n1sHZw7sAMXICQK27KALXBSu75Dv6EPebP3QqnH4TP1g4GNBwKGhMXgb8
         pdMIB7SVmshFEy8pXtaFsB6Ibhm0JxJps2ZDc/ZAyU7RJdbFI7J6uN8W2qIWr65btIT4
         W0r3gue/GboojAzvYVKewLQqH//uKq1udPSG7pAGaopJn/d0reCfYpxsNH5OkehvsxVd
         IO4uUgV5L2RwtaVPYEaRbKlLgSeP0nGtouUVKjDhzJ3wDgCHa/tq+4D1CQQh2xM5Q6t/
         5iPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m96si706237qkh.158.2018.10.26.03.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 03:07:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59289 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFz1V-0006F7-1e
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 06:07:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gFz1D-0006Eb-O2
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 06:07:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gFz19-0005Yn-HR
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 06:07:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41738)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gFz19-0005TU-3Q; Fri, 26 Oct 2018 06:06:59 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C369AA53C4;
	Fri, 26 Oct 2018 10:06:55 +0000 (UTC)
Received: from thuth.com (ovpn-117-235.ams2.redhat.com [10.36.117.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7EA5260CD8;
	Fri, 26 Oct 2018 10:06:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Fri, 26 Oct 2018 11:06:48 +0100
Message-Id: <1540548409-22560-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1540548409-22560-1-git-send-email-thuth@redhat.com>
References: <1540548409-22560-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 26 Oct 2018 10:06:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/2] hw/arm: Deprecate the "collie" board
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
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zVFFFIoRC7Y6

"collie" has no entry in the MAINTAINERS file, and the initial commit
with ID c64b21d519a6ecae12f65625fa60f3035ed88644 said:

"Add very basic implementation of collie PDA emulation. The system lacks
 LoCoMo and graphics/sound emulation. Linux kernel boots up to mounting
 rootfs (theoretically it can be provided in pflash images)."

Thus the board is incomplete, since after that initial commit, there were
only the usual QEMU API-related rework patches applied to this file.
Unless someone speaks up and says that this board is still useful, we
should consider to remove it, so mark it as deprecated now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/collie.c      | 1 +
 qemu-deprecated.texi | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 48b732c..e41bbc5 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -60,6 +60,7 @@ static void collie_machine_init(MachineClass *mc)
     mc->init = collie_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("sa1110");
+    mc->deprecation_reason = "board is incomplete and unmaintained";
 }
 
 DEFINE_MACHINE("collie", collie_machine_init)
diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 11b870c..acf9809 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -129,6 +129,11 @@ This machine type uses an unmaintained firmware, broken in lots of ways,
 and unable to start post-2004 operating systems. 40p machine type should be
 used instead.
 
+@subsection collie (ARM) (since 3.1)
+
+The board is incomplete and unmaintained. Use a different ARM board if
+possible instead.
+
 @section Device options
 
 @subsection Block device options
-- 
1.8.3.1

