Received: by 10.28.71.27 with SMTP id u27csp203543wma;
        Mon, 12 Feb 2018 10:59:16 -0800 (PST)
X-Google-Smtp-Source: AH8x225F06eamnwmubk2qNbao9R8g+940Ir2VJXFFc8Lij0lXGyVC3gco4HjXs2ur1Mtj0Ng22qy
X-Received: by 10.37.163.193 with SMTP id e59mr8709374ybi.434.1518461956615;
        Mon, 12 Feb 2018 10:59:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518461956; cv=none;
        d=google.com; s=arc-20160816;
        b=SjfNQnW0W3RfPtF6Xf4pgkL08nexSXBPUL+uGfETbXPJXuuWEC/7LZV1QkCoOPJdWN
         nzdaurYJ0b7uY5KQ6DvutOKD0BWJ0T0OLW5LncaLdfozr8v8PFXlKb7vqpnD4KXgAi7X
         VtqQj3nWf99iQrg2esR0y9VYKI7c74Y3wvr2llSSXjcRySTmkNy8r8vi2YOALfuWTln1
         wef/X5b0m1+WJZgyxhhnH0aNmaxvnuIqXz999e0sVK3LCoGteNmt/Y/59WK2tZMZfhac
         SjZIeXl1IZPMkK7fotkvH2k/xQzILg5PL5ht28B6VAZd9iXpblmYNDZTkFJHQ1JoxBjs
         fcgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=4Ktrrsh91Zk8tZ8z8GR1jykXv1OiExcPWvRZrJiJfQs=;
        b=zdLtU6mfkbJXPX84JdKLWNCvGZZEASGk61wu0HMhwldYviBrEPRe1kjkJhawpRBmIB
         SU7VbcsTB9XJRMku2S0dGhWT/VQxBCl1VR2rCvIN4KHqiGqGV4k3fcSmWgGtiOJ8PtzT
         g93v1WnFPdABBI5QPjIgQfvbPLjyNjX+XpBapp1HNjc6z68x17+7N4JCqoEOui4mnDh0
         4IxyFyBZr7deBC73v57Sq6jTds0+LHTlnqYAHMh93LqImrY+WUOpdUxn54Ykv8RA9L2A
         d9qbtNlFSfNEtq1C/m6TwP2oK8yIBjxWd2TV9NupqJK4fsWHkl/kbiR7N+CHa9MT8ScK
         A58g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k11si1656094ywl.783.2018.02.12.10.59.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 10:59:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJJr-0008G4-UX
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 13:59:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJJb-0008Cp-GE
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:59:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJJW-00028i-R5
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:58:59 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34152 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJJW-000275-N2; Mon, 12 Feb 2018 13:58:54 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E63B8182D2F;
	Mon, 12 Feb 2018 18:58:53 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED34F1006ED7;
	Mon, 12 Feb 2018 18:58:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:03 +0000
Message-Id: <1518461904-5305-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 12 Feb 2018 18:58:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 12 Feb 2018 18:58:53 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 01/22] machine: Add a get_primary_pci_bus
 callback
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C3ujgFflhPLe

After e492dc5a267e "pci: Eliminate pci_find_primary_bus()" we don't
have an easy mean to retrieve the primary bus of a machine. This will be
needed by virtio-iommu-device which is bound to be dynamically instantiated
in at least ARM virt and Q35 machines.

Adding a get_primary_pci_bus() callback allows to retrieve the PCIBus the
iommu is connected to.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

This is a temporary solution until we decide whether the
virtio-iommu-device should be instantiable through a -device command
line or through a machine command line, as already suggested by Peter
(for vsmmuv3 though).
---
 include/hw/boards.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index efb0a9e..0ed376a 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -156,6 +156,8 @@ typedef struct {
  *    should instead use "unimplemented-device" for all memory ranges where
  *    the guest will attempt to probe for a device that QEMU doesn't
  *    implement and a stub device is required.
+ * @get_primary_pci_bus: return the primary PCI bus or NULL if there are
+ *    several root buses
  */
 struct MachineClass {
     /*< private >*/
@@ -212,6 +214,7 @@ struct MachineClass {
                                                          unsigned cpu_index);
     const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
     int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);
+    PCIBus *(*get_primary_pci_bus)(const MachineState *ms);
 };
 
 /**
-- 
1.9.1

