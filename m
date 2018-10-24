Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp324279wrt;
        Wed, 24 Oct 2018 01:56:38 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eBY0IxolMNCMsyUX65jsKjU9op0L+bAMZAL3RtPNa1JBwbrckiKr9/1VUqVW9F55L13ch5
X-Received: by 2002:ac8:1c43:: with SMTP id j3-v6mr1609555qtk.320.1540371397950;
        Wed, 24 Oct 2018 01:56:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540371397; cv=none;
        d=google.com; s=arc-20160816;
        b=XWNbUns3ul3IGkBIVnpvX6VLEd6eihIu8Hxi4aEjqEQUfuWh01yAYjx0VEb9XZx9DA
         LfQpwGYnCx7VjoJF5Np/cHhyrjgXkYGRhjHJWivZKdMc/sJ0euhURfKEKJv3ZkLU6Unc
         YiZpIQy25shII75xT78rmj7DDuyGiDNV3V2oJR0j/iFm5ku2+0IC7rENDskjTu+P0eJb
         vAqwqI+Ipw+Ky6X2cM9hI5A95LjjQeMkyWOTYQKVkodO0yKEbOfAUJ0R/kyRSNxro470
         QyzhZHRwtnWcMjxXSLZCbiBLgPECOGNBkJyriTceuO/NSfpRAfx0YwPhJUnPMUWeCcFR
         mn/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=lm7Kqpwom2woS+i54LQg7NElqdPKNiwjM5faLHQ4fow=;
        b=MFvAK5WFmGB/elgGKuoZe7eC4FwxM3wfvCKrN1yGnEXJmep3GO5SSyi5PJ75wCQIty
         SM/H/FfmaauqrFDExJAUNjpYPPJnhKBpJLksnY4a1s4j0N/+gwa8fdFqkV66SgC2pOu9
         l28/McgrEd3apoYnJTsPiKu5q0bor+5iCYv/aFWTxFFyIiCbypAjxZw4PEHpzxfoDztI
         bcs4SboOiYic4YY0MRj0C49COoxyU9Gn5La8FANmdDV0cM01kMTAxFcJz8gMouYqCXtB
         dHcJ+Kr5FxXbBVqGiNi5WIb9RdBzLYVQZiCNhXrJZtUsmInfTv+ZdEnbPNL9jO+T5WEl
         IN3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r34-v6si614973qtb.257.2018.10.24.01.56.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Oct 2018 01:56:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFExx-0007BA-Hn
	for alex.bennee@linaro.org; Wed, 24 Oct 2018 04:56:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gFExn-0007Ap-KE
	for qemu-arm@nongnu.org; Wed, 24 Oct 2018 04:56:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gFExa-0002uh-HX
	for qemu-arm@nongnu.org; Wed, 24 Oct 2018 04:56:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51618)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gFExa-0002uC-8Q; Wed, 24 Oct 2018 04:56:14 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D3FA3082133;
	Wed, 24 Oct 2018 08:56:11 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E39195DD64;
	Wed, 24 Oct 2018 08:56:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 24 Oct 2018 10:56:02 +0200
Message-Id: <20181024085602.16611-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 24 Oct 2018 08:56:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/arm/virt: Set VIRT_COMPAT_3_0 compat
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
Cc: drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HmNE5Q2UIvBr

We are missing the VIRT_COMPAT_3_0 definition and setting.
Let's add them.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9f677825f9..a2b8d8f7c2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1871,6 +1871,9 @@ static void virt_machine_3_1_options(MachineClass *mc)
 }
 DEFINE_VIRT_MACHINE_AS_LATEST(3, 1)
 
+#define VIRT_COMPAT_3_0 \
+    HW_COMPAT_3_0
+
 static void virt_3_0_instance_init(Object *obj)
 {
     virt_3_1_instance_init(obj);
@@ -1879,6 +1882,7 @@ static void virt_3_0_instance_init(Object *obj)
 static void virt_machine_3_0_options(MachineClass *mc)
 {
     virt_machine_3_1_options(mc);
+    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_3_0);
 }
 DEFINE_VIRT_MACHINE(3, 0)
 
-- 
2.17.2

