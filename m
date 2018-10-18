Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2379896wrt;
        Thu, 18 Oct 2018 07:34:58 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63DfKJW5UBGAjn6BcgsJAPLYo0UBNSkK35Sg+2D1gRwewKyW+uldb9OeThDo7aMeB5ZY9JY
X-Received: by 2002:a37:2cc1:: with SMTP id s184-v6mr6239012qkh.28.1539873298288;
        Thu, 18 Oct 2018 07:34:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539873298; cv=none;
        d=google.com; s=arc-20160816;
        b=GhlhjIUjLUmcXb+zzwn7XBDbyTXIjI+jgAVyZSPRNzOI9QV96wqeJPWaRpeYE5vLjP
         ohRaArKCtUbSkao7p0aw/AfXosRJdDTfHMl97ac6QrT0Q5fZYyxEwyeA09PCxdGBjBSe
         VqicerMFr+0te2env+yhn9eo/PlDYVb1ceTG7UBRjaqYPVgz8Yj52XUloRV413rhee3h
         AyXu0mRxI+X4A3tDa4yP59szChjbVaVLtjpScNMQDB0GW3OrYeI+x1pnfUTJqAprHdGg
         pFnZ/6J+PW5htbxNTO2UnAUCYZqaydvh+9lxuOypo38Sp3s15Z50waFRbA2X4cDdLLEe
         eCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=llWE7Toh2wGFi16jaQfG6+iyip93EbyiVOnRWiVEW/k=;
        b=syBEbCcLr9ALkvsHM13V6efWCQHAPQllFgFwRJBFGk86gdTtI/zuGzjzQ6KWrPhJWx
         V6Fr3DGtMcdOuS8vX7JsYFcFble7cur2ixtE4ODW8wbOofJOYE/1Lh7+C3pibqrzP1tk
         t7inBc07LgVI/rksgjkD+11TkIi7C35xEyzVASEsgtgFMIBACnNc4YeOeZwbHVFAn1S9
         kJlgVxkpLMtjJ+gt+msGKp3uUoBCJw5seO6z2Cust+wwTlqhiIxyS6BbnPjHfsFWRfia
         r3Ca4/3O24Sxy/5O/0nRLl6JeydcoM35M5V4JYkhwzjR1GM2IbT0nSdCi4IkFAGhCo2B
         rYyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x17-v6si4696583qtb.89.2018.10.18.07.34.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 07:34:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD9O5-0000SK-PJ
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 10:34:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9KS-0005Vd-6U
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9KM-0006Vo-CJ
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56338)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gD9KM-0006Pk-1v; Thu, 18 Oct 2018 10:31:06 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7B173086269;
	Thu, 18 Oct 2018 14:31:02 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7929E7899E;
	Thu, 18 Oct 2018 14:31:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Thu, 18 Oct 2018 16:30:28 +0200
Message-Id: <20181018143042.29588-3-eric.auger@redhat.com>
In-Reply-To: <20181018143042.29588-1-eric.auger@redhat.com>
References: <20181018143042.29588-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 18 Oct 2018 14:31:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 02/16] linux-headers: header update for KVM/ARM
 KVM_ARM_GET_MAX_VM_PHYS_SHIFT
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
Cc: drjones@redhat.com, dgilbert@redhat.com, Suzuki.Poulose@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 09/J+0qrW08I

This is a header update against kvmarm next branch

git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm kvmarm/next

to get the KVM_ARM_GET_MAX_VM_PHYS_SHIFT ioctl. This allows to retrieve
the IPA address range KVM supports.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3 -> v4:
- update against kvmarm next
---
 linux-headers/linux/kvm.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 83ba4eb571..9647ce4fcb 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -750,6 +750,15 @@ struct kvm_ppc_resize_hpt {
 
 #define KVM_S390_SIE_PAGE_OFFSET 1
 
+/*
+ * On arm64, machine type can be used to request the physical
+ * address size for the VM. Bits[7-0] are reserved for the guest
+ * PA size shift (i.e, log2(PA_Size)). For backward compatibility,
+ * value 0 implies the default IPA size, 40bits.
+ */
+#define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
+#define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
+	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
 /*
  * ioctls for /dev/kvm fds:
  */
@@ -953,6 +962,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_NESTED_STATE 157
 #define KVM_CAP_ARM_INJECT_SERROR_ESR 158
 #define KVM_CAP_MSR_PLATFORM_INFO 159
+#define KVM_CAP_ARM_VM_IPA_SIZE 160 /* returns maximum IPA bits for a VM */
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.17.1

