Received: by 10.28.4.212 with SMTP id 203csp4792335wme;
        Tue, 1 May 2018 05:10:23 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo4+iafZFJ04pV8960xiv54mEv0yISt/kIm5G2Yyt7YaKpPnOsrwLFIJwNo0Af5VPhR8+dZ
X-Received: by 2002:a0c:bfb4:: with SMTP id s49-v6mr13632937qvj.168.1525176623202;
        Tue, 01 May 2018 05:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525176623; cv=none;
        d=google.com; s=arc-20160816;
        b=Z7lk19TpvgOwVfBrL0pq9QofleuZGEyyh+DSTs+as+mFfKSMgUZ/6JgYRyNTH+iq9q
         D/klrnsdn/ptr6/AGXJg1+yl6GfF/eWPzcyQpQUD0YksGMotuArzKVs1jjLVHgSqYnBi
         y51x2LdQhp8rrXRnFKz9kO9TGvbRHwzD8YEXwLNtPhccu9oFzkXlg8SgphuyrnNjOSfM
         zuDBkz7HNvjmusl0KaldrTKDRiu+8Aw2jKfXlAkv8Ii3MnHhfzUQICaNsRBpb7PZT6Nk
         qgmyC38o+CpoUblAOOpCliRLsVThObSvSn/IePYaUG4PlokAj41r3OeXbdv/6/oPlLwA
         tO4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=yGKokqZxl2yRzq1Aozo6snI5921x4UzAwv8Dg4qdU1c=;
        b=DejEXAfrm3e6JlBDzVy7xnCDBh1W8lFy5B4C6PVQsc7KSZD46wu5oTP+/puj94rgb/
         9utPC+o8NGOZmyok8pKXr6t6TEd0ktB9v1cp/adeuhJjwUxDdbXgbrvACJG/vYQ72St/
         oyPqFrBAKtRQBcRrsOBeuj2AQ6nfYjGGIOQJ90nVVo6sc27bcmPGcdCITorp7T3e9xHt
         t1WlpAPbN5ancWy4R14QnhwgoNiNx3K61gYiwK5Mr0hbVwJDxYKTOBWvD5uGlVqO4IEp
         6La620tepT+hYMQolcY7T/PQWf+bCWDeo10oC8UoNlzC/n0JC7j8jJ5233s/DHfn0WoE
         4G3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l47-v6si8926958qtk.30.2018.05.01.05.10.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 May 2018 05:10:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42257 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDU6w-0005ug-IC
	for alex.bennee@linaro.org; Tue, 01 May 2018 08:10:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fDU6O-0005aW-0K
	for qemu-arm@nongnu.org; Tue, 01 May 2018 08:09:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fDU6K-0003Qn-8X
	for qemu-arm@nongnu.org; Tue, 01 May 2018 08:09:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37592 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fDU6K-0003Qd-4b; Tue, 01 May 2018 08:09:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CEC4F8DC4A;
	Tue,  1 May 2018 12:09:43 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1648A2022C00;
	Tue,  1 May 2018 12:09:42 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 May 2018 14:08:41 +0200
Message-Id: <1525176522-200354-5-git-send-email-imammedo@redhat.com>
In-Reply-To: <1525176522-200354-1-git-send-email-imammedo@redhat.com>
References: <1525176522-200354-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 01 May 2018 12:09:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 01 May 2018 12:09:43 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 4/5] arm: boot: set boot_info starting from
 first_cpu
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TQT+OpYMUcTi

even though nothing is currently broken, make sure that boot_info
is set on all CPUs.

Ref:
"Message-ID: <CAFEAcA_NMWuA8WSs3cNeY6xX1kerO_uAcN_3=fK02BEhHJW86g@mail.gmail.com>"

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ad71dd4..144abbd 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1139,7 +1139,7 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
     }
     info->is_linux = is_linux;
 
-    for (cs = CPU(cpu); cs; cs = CPU_NEXT(cs)) {
+    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
         ARM_CPU(cs)->env.boot_info = info;
     }
 
-- 
2.7.4

