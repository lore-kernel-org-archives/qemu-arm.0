Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7957AC54F52
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 19:30:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wonS1-00037D-Po; Tue, 28 Jul 2026 15:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonRz-000352-UY
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:26:51 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonRy-0001QO-DC
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:26:51 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-38e7109321dso120033a91.3
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 12:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785266808; x=1785871608; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BW+koEYMGeh3Q0Il0QE3jfPQEhQaRsizJA+FKY6y1jw=;
 b=Xwy8w1sCVSmelc2f89Sv6ZKM2f3hllhCL+BjDg/gvkJLYbIeoWBGVPY8Hr/yZYfRMD
 hJyZguhPwCkP1mA+BdlBgy1GVcl3zn5O9ebBCbLs8/QqywpCr14843XVgCgl2Ed67j7r
 b+jnnFWGANziRk5RbigoCTECX+lYiex1eHteTBErPhbMop0kSoUSIzDzvAVdiEaWoS8E
 Ji7SNGVR9dTEO3dXSZWjiytGBAVA7XVE/JSZMatYMtdNAuHjhXVZkHZjFRAaGTV5C/jE
 0Teblr5mMXfLXLfihiLnnnmnoFs74TwtH5c1WSu3XaAN3/ObocHYdY6DBXYGZbRVu2SA
 uS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785266808; x=1785871608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BW+koEYMGeh3Q0Il0QE3jfPQEhQaRsizJA+FKY6y1jw=;
 b=ANN1hE2SHZdAOteAC5CivShwQC0+bShbDtNEnkDCChPkkNiLfWVy31Q95blR/+ibwY
 ILo/8w1nZm+5lwsHmG6JsPBBhEahEhDU/ASB3PuO2cOl+nYZeE3Wif1eJX3gHZHl6WmL
 acntBTwzV1CJI4UCcm+XApFqr/MTWLy4gDLV6/j0ZESMqpgG5L2fZQiLHQAMgVdsXdrv
 DVnGRaQJXRn26edR73q+S0G2v9oZGe/fMmsOj0760JvBGaDOifOMeSewXYtfoa3C6h/+
 DUlK7wCjd1pEtEVf5xJSYao6X4IuIYpEISWFYdE5AajuGhn9KPJaELEVpaulxHGp6TyS
 1f1g==
X-Forwarded-Encrypted: i=1;
 AHgh+RophQp8ejYzjj6gMI4Ec45KM7sEC3FwL9BrXt5OWCzaYKOMB9KIAPry8BG+foAIqy+6knnclY1tqg==@nongnu.org
X-Gm-Message-State: AOJu0YyFz3U1aOmCnNpdZoCjPw0zmuor8u77I58e7aCrv2JqPOZFhOX7
 4u865AHLGzhI4FUhYLCEp0VUr+RztCAuapdfuKb2mQpg34NoCp+mZ4W6FHnvbUR/cyg=
X-Gm-Gg: AR+sD12K101bvNF5WIHzTVvX1qIrbHNpWi25e1zyYfLbDZSPkdcMMDYH5XouYjZJx4T
 8+Vz0icwUsXGFagZqP8FdDA8eTAKQhYY1Bbc5SEyf++gAaiYYx1cl4nLwdmfDvk4eD3MPaG6EMP
 QWpOT3+gOUeJSBJebp8qnnXR99CljXHLV3BPNam/wqyHwY9519eBrH18krqpteNZKktGNi9i1zg
 w7ezR4AYtdvV//KAyRQOLpcKQH059ROL/kQMmG9vI5sVxeflpbz7ww8kPrBbJbfZsIXZd79pWba
 15aCBhqxcDK2IWirng5p+EMuk50ZFEKdULpVuSYCUBUpWNE46Q/5zprzP3xVoaYmektQFrxJzAv
 Yoj6Kr2UPmEx7nUm47ZMn/0VrG2ri7jkrLZ9W+i4AkvpYGbFClVfLtPFD8jJHUAvNr6ImLSbK/u
 uCM63aoVT0C6/9UNsKGbt2ohzyTy4/m7ZbQSpEMxqVzm1mO7OLbhhzpHaj+9pIzOXtxREJHZCmA
 jfq8B/Ed5Dq8eI=
X-Received: by 2002:a17:90b:180c:b0:38e:5741:5173 with SMTP id
 98e67ed59e1d1-38f6a4205e1mr3934859a91.29.1785266808420; 
 Tue, 28 Jul 2026 12:26:48 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:b9d1:87c9:a085:86c9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f7f1353fdsm372650a91.8.2026.07.28.12.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 12:26:47 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v2 07/24] target/arm/kvm: Create scratch Realm VM when requested
Date: Tue, 28 Jul 2026 13:26:13 -0600
Message-ID: <20260728192630.240375-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728192630.240375-1-mathieu.poirier@linaro.org>
References: <20260728192630.240375-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

When a Realm is requested, create a scratch Realm VM by setting bit 8
of the argument given to the KVM_CREATE_VM ioctl().  Bit 7-0 are reserved
for the guest PA size.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b4c6da1fb9f3..d86e66e056b9 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -108,7 +108,9 @@ bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
                                       struct kvm_vcpu_init *init)
 {
     int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
+    MachineState *ms = MACHINE(qdev_get_machine());
     int max_vm_pa_size;
+    int vm_type;
 
     kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
     if (kvmfd < 0) {
@@ -118,8 +120,10 @@ bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
     if (max_vm_pa_size < 0) {
         max_vm_pa_size = 0;
     }
+
+    vm_type = (ms->cgs ? KVM_VM_TYPE_ARM_REALM : KVM_VM_TYPE_ARM_NORMAL);
     do {
-        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
+        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size | vm_type);
     } while (vmfd == -1 && errno == EINTR);
     if (vmfd < 0) {
         goto err;
-- 
2.43.0


