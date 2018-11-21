Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1490457wrt;
        Tue, 20 Nov 2018 22:39:35 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VTlXIQRuBqg+Ljv846aRvTgOBnpH8kG8hcjLUsz7hk5WTuWMh1EMM9bKysiEPOvBOat8jY
X-Received: by 2002:a25:4195:: with SMTP id o143-v6mr5251798yba.103.1542782375369;
        Tue, 20 Nov 2018 22:39:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542782375; cv=none;
        d=google.com; s=arc-20160816;
        b=pa8oEO7BBrCLYVGyVE1hNaSiTJ6vznCatd7cdPkVY9XvO65d85G6VX4C5uwwrKRiBh
         R0e8Jibxg/D7Dsv+px1hJdRWCQicXZaddfZkXQL54spn7Mb2QRs/UglK8tSD4UOMN4UB
         1IDNstmXtTnICt/jan7rGL4Uktd25fBaJGDePIbkfZ54bd9+pdehSrsq36J8pNpiZYT8
         ajDxV55BUqmlekkeZ6hM8XJPReR8WmIMuzdxcwt2CCTHhVHpho+iDggbKdobG0rnM4km
         jew4KIG7yXJyVy1bnK7dmVxagToKyHbxBwJe5u6ahM9oTIuVVCr5jDlV8ZqGMkA8xVDW
         KsGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=jAZAdIedU+nCMHVHbY+OU7daVxXZNRcA8sUSRMXVjAs=;
        b=NsTziw7sZvPc/i2e1vmWJlemwXdABW5NtHXJFvddCNQVvm//LINFljI+L93RkN1UIj
         yNttTosqTCh/XTx/llzNlmrAalvvvva24SgSiun3fHj6aopl40RFoggTClu4qJeUvn6F
         1pWNhOhggxl7llAk0auAUMZYe9DWJHhWmjm3dF9ZGM40t/yvjafUqxHOajGdtI1PwEmp
         gIhsakdaquRm0bztcv4rNdQEUX42B1WNb6xMEDiTKpy50NcoSGhrUGN1wKqoEOZhSTo9
         LDI1jD4JSjetbLO4NhwBPbJjP36p1X55BpdAGiT8/e1dg+nHWpuHRwnMRWZiYZGxrZ/Z
         UAng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uniudc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g30-v6si427124ybi.417.2018.11.20.22.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 22:39:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uniudc.com
Received: from localhost ([::1]:37465 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPMAg-0007QI-QL
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 01:39:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luzhipeng@uniudc.com>) id 1gPJed-0001wq-Bh
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 22:58:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luzhipeng@uniudc.com>) id 1gPJea-0004wb-7F
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 22:58:19 -0500
Received: from m21397.mail.qiye.163.com ([223.252.213.97]:26538)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luzhipeng@uniudc.com>)
	id 1gPJeZ-0004UK-PM; Tue, 20 Nov 2018 22:58:16 -0500
Received: from cvknode54.localdomain (unknown [106.37.239.65])
	by m21397.mail.qiye.163.com (Hmail) with ESMTPA id 54949142EA8;
	Wed, 21 Nov 2018 11:58:07 +0800 (CST)
From: luzhipeng@uniudc.com
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Date: Wed, 21 Nov 2018 11:57:42 +0800
Message-Id: <1542772662-2621257-1-git-send-email-luzhipeng@uniudc.com>
X-Mailer: git-send-email 1.8.3.1
X-HM-Spam-Status: e1kIGBQJHllBS1VLV1koWUFITzdXWS1ZQUlXWQkOFx4IWUFZMjUtOjcyP0
	FLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MxQ6Sxw4EDkcHTBMNzUoMR46
	KTFPCTBVSlVKTk9JTExJTUNMQ09JVTMWGhIXVRcOARMSCx4VHDsOFRIOHxhVGBQWRVlXWRILWUFZ
	SktNVUhMVUlIQlVNTllXWQgBWUFKSUtLNwY+
X-HM-Tid: 0a67346b03117f6bkuuk54949142ea8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 223.252.213.97
X-Mailman-Approved-At: Wed, 21 Nov 2018 01:39:22 -0500
Subject: [Qemu-arm] [PATCH] hw/virt/arm: Add support fot Cortex-A72
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
Cc: qemu-devel@nongnu.org, ZhiPeng Lu <luzhipeng@uniudc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GJiX7yNJtoZX

From: ZhiPeng Lu <luzhipeng@uniudc.com>

Signed-off-by: ZhiPeng Lu <luzhipeng@uniudc.com>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a2b8d8f..f69e7eb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -174,6 +174,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a15"),
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
+    ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
 };
-- 
1.8.3.1

