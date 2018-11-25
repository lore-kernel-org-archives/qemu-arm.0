Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4711519wrt;
        Sun, 25 Nov 2018 12:59:29 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WktFTI71BJ6t0QRHyXPY5wm0qh26uuYaqnHBL+DwFYu86HIvTkG5XKVl5+Rv09A8a14cUg
X-Received: by 2002:a25:4017:: with SMTP id n23-v6mr25701080yba.244.1543179568973;
        Sun, 25 Nov 2018 12:59:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543179568; cv=none;
        d=google.com; s=arc-20160816;
        b=DqZNfIt+uiYhZvtqZuu47z7hT9HiagNLddk2Lu1nNPDZLZRe3OfN9eIFh76yP46VLG
         TgRptN9o8SpsHeIqnfWoIuOurcVbUYBpgn4hBiqmtPF069suLafnHPdxcZc850fj12Uq
         t61gRRTBRZ4CTHlVkMuWoo1agkW5r58a7t/1DdCRHIz2rxvhA313f/HhG15UR8Z/m39q
         IIgbzvgkjJYTf1ClEoJe3qpHNeOImhlvzz5y04bPHz2CAmLE4FLYxcZpkrm0gVi6oFIH
         nVaQzHnrPaKKK4NXQU9jYj3O6RiBzCD/e/wo4DlbzC2A4xIV+LdKT7cI3OBSZvcpFpzx
         RcXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=J97B0n4eFf14SuNCqQNqUBSqpKJcXIASFxppaChrZgs=;
        b=oEAL0g+A9KqevcgNt0EzpyfwImcc6Ay4zIMMPBejKhEXIcdtXqOSRQ6ceLmWC5E0lc
         kvu/8t/B25yKz6ZeR5p+BnnCrk/wEzb6Ql2GsQyyi7zvjGao3whN8yITk6bxna0ydRSR
         6g/qX9XMpdtGIZ/gObetf6l8LNdHrnRofI7lvA8Tjtkpy2zVqjaxoK7PVacr8eHAjH5I
         tAW50rsOiftgMmOheIpJvycTxh2RfCSeuoYUS1Lfqh1LUjTwzO3ziweXmflKjq3zIirc
         F8pi0EMbnN8PTdTbOuWGuPkt0TIMpN8MnN8EIci3GziZZMTDuD8gxjvJzetdstFPdmHT
         yE3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c13-v6si31536578ybs.195.2018.11.25.12.59.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Nov 2018 12:59:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gR1V2-00087V-BI
	for alex.bennee@linaro.org; Sun, 25 Nov 2018 15:59:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1OL-0000yB-Uu
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 15:52:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1OL-0006Kp-8A
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 15:52:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50758)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gR1OL-0006KG-37; Sun, 25 Nov 2018 15:52:33 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6729883F46;
	Sun, 25 Nov 2018 20:52:32 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B05D95C1B2;
	Sun, 25 Nov 2018 20:52:29 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Nov 2018 21:49:51 +0100
Message-Id: <20181125205000.10324-17-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-1-philmd@redhat.com>
References: <20181125205000.10324-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sun, 25 Nov 2018 20:52:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.1 16/25] MAINTAINERS: Add missing entries
 for the MPS2 machine
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qc9dtyiu4T+H

Missed in de343bb632a.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e04f2f1a44..2795135a09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -587,6 +587,8 @@ F: hw/misc/mps2-*.c
 F: include/hw/misc/mps2-*.h
 F: hw/arm/iotkit.c
 F: include/hw/arm/iotkit.h
+F: hw/misc/iotkit-secctl.c
+F: include/hw/misc/iotkit-secctl.h
 F: hw/misc/iotkit-sysctl.c
 F: include/hw/misc/iotkit-sysctl.h
 F: hw/misc/iotkit-sysinfo.c
--=20
2.17.2

