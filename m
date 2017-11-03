Received: by 10.223.150.237 with SMTP id u100csp165284wrb;
        Fri, 3 Nov 2017 05:38:24 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RnB+0Th0dQwy2PoDHL/KhgzdbH6kmR6cWS2gyrWtraBNRH1EV3ZZQpvj1AJECUXPUyezUC
X-Received: by 10.13.255.199 with SMTP id p190mr4598994ywf.180.1509712704442;
        Fri, 03 Nov 2017 05:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509712704; cv=none;
        d=google.com; s=arc-20160816;
        b=XYb0Zu3WQ1cCqgZbHQhOAWF4P5gEVB8SiMM+34Ae/Az5khDikCTs703liugf2GSAbZ
         +5BR32svr9CCnAH5HKZ42EYxuBRb2BkEKvb5RjMLAv1C+gACXi4dPF+j6NHSKMfykpc9
         C4JSZXPnJ5LgiPNb17+sO0ZhH+D9OzJ5OUohoGVrfy863plT8IM9I242ODRZdt0e2zYN
         CB1TCbtOxsC4FqLq6fB236n8+vD9PZrEMdRldfWebLqKTMxb933QLU6Rv4ljTGR7OUUb
         +TxxxZ3prrE9YTCUX19jRZjwDrmsRJD1eH9NulF00MaBc6+p0O1iy15ASOt5hMVuM+4p
         7fCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=jZdScDr6Wf/iX2yl04N35dfCNdEPV3I0KnCB0e3/7a8=;
        b=q0lvzfU7hCsE1ND1NKPj+fvcNIxACDomYI9HlHmfO8Q+98Vqys9xfLxrgvrdNobgpX
         LYHbatTETk55QSQaVFS7pSMFoHVybHtgzz8iJjjs/jmgHyERrif1Ia/iOFYhrYhvrtv4
         AK1Aoa1osNh7h6RkNHWXhLoBLZAdTX+XHeATIBdYW9UJhS9RvDGMbUZMIaJzDt/EkfP7
         vAzlb5PHaAi3V3pZVbJQHUl9QTRnbNsLcu9g5EC62I3NMJT8tNaLnwv+DZT0wyA5R5RG
         hYWgz8pFbhW6StJDiuFFLWYsARQC11T74IOijuIKNoa4/x9LAqPBDq7LrNWc0+tOsGW5
         XGIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=fmYsu5hd;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=fmYsu5hd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z8si483751ybg.276.2017.11.03.05.38.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Nov 2017 05:38:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=fmYsu5hd;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=fmYsu5hd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36520 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAbEt-0000mz-Rb
	for alex.bennee@linaro.org; Fri, 03 Nov 2017 08:38:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shankerd@codeaurora.org>) id 1eAbEm-0000lf-15
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 08:38:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shankerd@codeaurora.org>) id 1eAbEh-0002TH-1r
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 08:38:16 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45730)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shankerd@codeaurora.org>)
	id 1eAbEg-0002Rj-Rp; Fri, 03 Nov 2017 08:38:10 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id B92C66079D; Fri,  3 Nov 2017 12:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1509712688;
	bh=bBmmM3HD1en8neI4O1iIadQqnIe6vXDU8LGHXGMDPvc=;
	h=From:To:Cc:Subject:Date:From;
	b=fmYsu5hdcB9nOCpUAPGcES7PVSuit1ZaWtUdm9jL9gxaNmXxUz6CgXokt+axjfDuV
	jE71cM4683zUR+S1kqKUqOsyQsKllIhskKAEdAQbJmsSqK+dfSfkcCp5MRZlUDqQlp
	Dys8rZycbm/eMzUTLfNpHgHPAPccjF4fxBej7US4=
Received: from shankerd-ubuntu.qualcomm.com (i-global254.qualcomm.com
	[199.106.103.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: shankerd@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id E835360313;
	Fri,  3 Nov 2017 12:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1509712688;
	bh=bBmmM3HD1en8neI4O1iIadQqnIe6vXDU8LGHXGMDPvc=;
	h=From:To:Cc:Subject:Date:From;
	b=fmYsu5hdcB9nOCpUAPGcES7PVSuit1ZaWtUdm9jL9gxaNmXxUz6CgXokt+axjfDuV
	jE71cM4683zUR+S1kqKUqOsyQsKllIhskKAEdAQbJmsSqK+dfSfkcCp5MRZlUDqQlp
	Dys8rZycbm/eMzUTLfNpHgHPAPccjF4fxBej7US4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E835360313
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=shankerd@codeaurora.org
From: Shanker Donthineni <shankerd@codeaurora.org>
To: Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  3 Nov 2017 07:37:51 -0500
Message-Id: <1509712671-16299-1-git-send-email-shankerd@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH] hw/intc/arm_gicv3_its: Fix the VM termination in
 vm_change_state_handler()
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Shanker Donthineni <shankerd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8+PQZUFNtqKb

The commit cddafd8f353d ("hw/intc/arm_gicv3_its: Implement state save
/restore") breaks the backward compatibility with the older kernels
where vITS save/restore support is not available. The vmstate function
vm_change_state_handler() should not be registered if the running kernel
doesn't support ITS save/restore feature. Otherwise VM instance will be
killed whenever vmstate callback function is invoked.

Observed a virtual machine shutdown with QEMU-2.10+linux-4.11 when testing
the reboot command "virsh reboot <domain> --mode acpi" instead of reboot.

KVM Error: 'KVM_SET_DEVICE_ATTR failed: Group 4 attr 0x00000000000001'

Signed-off-by: Shanker Donthineni <shankerd@codeaurora.org>
---
 hw/intc/arm_gicv3_its_kvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 39903d5..9b00ce5 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -111,13 +111,13 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
             error_free(s->migration_blocker);
             return;
         }
+    } else {
+        qemu_add_vm_change_state_handler(vm_change_state_handler, s);
     }
 
     kvm_msi_use_devid = true;
     kvm_gsi_direct_mapping = false;
     kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
-
-    qemu_add_vm_change_state_handler(vm_change_state_handler, s);
 }
 
 /**
-- 
Qualcomm Datacenter Technologies, Inc. on behalf of the Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.

