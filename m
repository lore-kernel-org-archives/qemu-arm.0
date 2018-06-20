Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp752917wrq;
        Wed, 20 Jun 2018 06:12:29 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJvqvvY5cPMRa/CXPL599Lc6/1piIYZR6hOCJwqp8iYeCnCAQlIkgw6Vmo8UZmbWuDHEmHZ
X-Received: by 2002:a0c:e703:: with SMTP id d3-v6mr18259570qvn.209.1529500349021;
        Wed, 20 Jun 2018 06:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529500349; cv=none;
        d=google.com; s=arc-20160816;
        b=nbOaGMg/1qMfVGXMtsZDzpisMya1t1veA/61yhB0jWe/ixMR8iWDyeElwEUrCcMErQ
         KWmI9wuJulQvuDScbBDJ7L49V5nTHUnm0IhnxbMHgsrbvk8LBi6aMwdwS/emcfG9kYal
         F4JSFNkKVoyCuvmLuw0qRcmilNvq0nB/DhktnvVBRZSki5xvNWpkAN27Inm0us44ODrP
         iSSA7bLM9sZg1Pf+FwLPJiR8KSmPkjWiw2K47NVQOFjGPwkngKjy4Poo8Nx+LjuQZMxy
         5CZP7RD7mwP7d4aM9MC6pMfkPWVTs3H/gN6oPita53jm8VzfnyDzJvNqDkPZHqTYM1Pu
         k7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=sS95AZlGz3nBCFPuwjoUa2mNwZ8gQeh7drG7egc0WjA=;
        b=uXexz7gJHqOVKI1gVS46QCDYYOKXL7SzrvC+GRzXg3pz3bhKfZK2O7xo+W02UlFNrt
         mqVmEv0T8/efV61Nh3dRkcb3cuW+YL2cvvOrKwHlyB8BrpIZJTup3V73AId+1eMx35wF
         osQsW5YmcffnGLiqVkz0kMWXbpCblOA9cJ1lId4P1GLL6cDN7iUrVQTl6aXtkTfZ1II6
         j8n48NtQkZKebCpZxvJiBakt5J9aI1hW0leh3dDWKkngY7hdZYkoMFDX8OnNDmquBjgs
         fKe7FkqBfr1ALbtqKSeqShhSDbq5g8sx/WC7lUOc82M2o54NTxej88TwmP89fc9dpZ0X
         pTVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t21-v6si2256994qkl.63.2018.06.20.06.12.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 06:12:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVcuS-0008Bi-EK
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 09:12:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVcq0-0004QJ-7V
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:07:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVcpz-0005fz-91
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:07:52 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34694 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fVcpz-0005fs-49; Wed, 20 Jun 2018 09:07:51 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDEED81A4E9F;
	Wed, 20 Jun 2018 13:07:50 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A81C2026D6B;
	Wed, 20 Jun 2018 13:07:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 20 Jun 2018 15:07:30 +0200
Message-Id: <1529500053-21704-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 20 Jun 2018 13:07:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 20 Jun 2018 13:07:50 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 3/6] kvm: add kvm_get_max_vm_phys_shift
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
Cc: drjones@redhat.com, suzuki.poulose@arm.com, dgilbert@redhat.com,
	agraf@suse.de, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XFPTDLcZPKpa

Add the kvm_get_max_vm_phys_shift() helper that returns the
log of the maximum IPA size supported by KVM. This capability
needs to be known to create the VM with a correct IPA max size
(kvm_type passed along KVM_CREATE_VM ioctl.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 accel/kvm/kvm-all.c    | 7 +++++++
 accel/stubs/kvm-stub.c | 5 +++++
 include/sysemu/kvm.h   | 1 +
 3 files changed, 13 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0590986..137c38e 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -280,6 +280,13 @@ static int kvm_set_user_memory_region(KVMMemoryListener *kml, KVMSlot *slot)
     return ret;
 }
 
+int kvm_get_max_vm_phys_shift(MachineState *ms)
+{
+    KVMState *s = KVM_STATE(ms->accelerator);
+
+    return kvm_ioctl(s, KVM_ARM_GET_MAX_VM_PHYS_SHIFT, 0);
+}
+
 int kvm_destroy_vcpu(CPUState *cpu)
 {
     KVMState *s = kvm_state;
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 02d5170..7575ba7 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -161,6 +161,11 @@ bool kvm_has_free_slot(MachineState *ms)
     return false;
 }
 
+int kvm_get_max_vm_phys_shift(MachineState *ms)
+{
+    return 0;
+}
+
 void kvm_init_cpu_signals(CPUState *cpu)
 {
     abort();
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 0b64b8e..240e3d9 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -206,6 +206,7 @@ extern KVMState *kvm_state;
 /* external API */
 
 bool kvm_has_free_slot(MachineState *ms);
+int kvm_get_max_vm_phys_shift(MachineState *ms);
 bool kvm_has_sync_mmu(void);
 int kvm_has_vcpu_events(void);
 int kvm_has_robust_singlestep(void);
-- 
2.5.5

