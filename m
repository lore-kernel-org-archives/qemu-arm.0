Received: by 10.28.71.155 with SMTP id m27csp727372wmi;
        Tue, 27 Mar 2018 07:15:56 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtuRCzYv+wiz7BoRm4IsB7+jseC3nJUWr0iREn8FZL+A6sltOeG2oXT/znq5XT0WtDD0M9Q
X-Received: by 10.200.63.187 with SMTP id d56mr63341754qtk.169.1522160155981;
        Tue, 27 Mar 2018 07:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522160155; cv=none;
        d=google.com; s=arc-20160816;
        b=Xo3R15H0yp995tSMqIAfOWl5KGHB9KNrBtDRggzXY0qCRYdoULeU/IYoZ4kXXS/WUr
         g7t5xgPXOzHFvY77Dt0o8A6aqhaYCn34LbGbVa2eyHyA+KcDhLjU+4vQ1kEkQD85KktX
         JRiCSkLKT5ifL8RTKFRa1T0MsKc10zeKWuElnWUcWLLmREtMgnFSLMOrqOa6iGJLxTtA
         tSgdI/Rovq4lmXC5NS0Ay0FYX/o5PloXqNR5FqXRy7dnvbMtcjVsZ3Rjs31tY0sVl492
         11Jlo3dNY3ZNj01nAXpPSKzCtnu9Rl1fogCxLC8IPQsNMnBTJ3NxhLMT8bs5hkLTjXwO
         KrtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=CJkYx6AGR+4Q43yxj6hfN1I2jtLm/eLBgdjQmijTJmA=;
        b=Gahi5p+yZtFqKFYm0J/q7IWO955ySLH9BkzA4wZ04rIt6KdGifKWr0ZgGgwR691fwq
         5py8oExowj1CnpQDJzXcTnBKrN3Dxtkn8hvadA3aFQWC5fY2Mc/pfDg53QV4xWoZev68
         PumqNPQcrCWAlPhdk1msQGT5VMT2j+F9LA4mazdU+3V8/gFlKAqmduHXV9PLsM1RwXJT
         Y1H/fM5QTQqDsJb5wxm0nJdGZiyno7ebtn5ngzXSQ97b636kVBCIU7/flMztJaadfsn/
         RHSw9X7sEEI5oTJnv0HucoT5WQxYZ6sBgdZ1GhTBgAM0PWqZ4GC0qeAHYUIGE194Etox
         ARDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n5si1539497qtn.66.2018.03.27.07.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Mar 2018 07:15:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34523 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f0pOF-00031T-FF
	for alex.bennee@linaro.org; Tue, 27 Mar 2018 10:15:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pO4-000317-Lr
	for qemu-arm@nongnu.org; Tue, 27 Mar 2018 10:15:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pO3-0006Ri-CQ
	for qemu-arm@nongnu.org; Tue, 27 Mar 2018 10:15:44 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51258 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f0pO3-0006RA-7W; Tue, 27 Mar 2018 10:15:43 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CAECB722C5;
	Tue, 27 Mar 2018 14:15:42 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D95286F9E6;
	Tue, 27 Mar 2018 14:15:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Tue, 27 Mar 2018 16:15:17 +0200
Message-Id: <1522160122-10744-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 27 Mar 2018 14:15:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 27 Mar 2018 14:15:42 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 3/8] kvm: Expose kvm_max_vcpus()
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
Cc: marc.zyngier@arm.com, drjones@redhat.com, cdall@kernel.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qgx73x8CGstf

Make kvm_max_vcpus() public so that the machines can query this information
easily.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 accel/kvm/kvm-all.c    | 2 +-
 accel/stubs/kvm-stub.c | 5 +++++
 include/sysemu/kvm.h   | 7 +++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index ffee68e..b04f4ef 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1462,7 +1462,7 @@ static int kvm_recommended_vcpus(KVMState *s)
     return (ret) ? ret : 4;
 }
 
-static int kvm_max_vcpus(KVMState *s)
+int kvm_max_vcpus(KVMState *s)
 {
     int ret = kvm_check_extension(s, KVM_CAP_MAX_VCPUS);
     return (ret) ? ret : kvm_recommended_vcpus(s);
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 02d5170..e816050 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -170,4 +170,9 @@ bool kvm_arm_supports_user_irq(void)
 {
     return false;
 }
+
+int kvm_max_vcpus(KVMState *s)
+{
+    return -ENOSYS;
+}
 #endif
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 23669c4..1e7c621 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -546,6 +546,13 @@ int kvm_set_one_reg(CPUState *cs, uint64_t id, void *source);
  * Returns: 0 on success, or a negative errno on failure.
  */
 int kvm_get_one_reg(CPUState *cs, uint64_t id, void *target);
+
+/**
+ * kvm_max_vcpus - return the number of supported vcpus
+ * @s: The KVMState pointer
+ */
+int kvm_max_vcpus(KVMState *s);
+
 struct ppc_radix_page_info *kvm_get_radix_page_info(void);
 int kvm_get_max_memslots(void);
 #endif
-- 
2.5.5

