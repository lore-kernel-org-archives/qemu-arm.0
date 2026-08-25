Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75AAC61DBD
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 22:02:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyzDl-0004l9-Tz; Tue, 25 Aug 2026 18:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzCs-0003Jr-Sk
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:23 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzCr-0001RX-Ca
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:22 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-39675172593so136140a91.2
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 15:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787695280; x=1788300080; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eyJsbM3B9U91rhA9XcMnnj9HbTzV3f8teoGWTnmCdi0=;
 b=ZbKQomfQyjWWZwX0zenDsYgW/khA2tAfJOYEcTZX0SmSXBkVy/gxtXIJU1/klYBa3h
 Jo0xKoWJ8pNjDgPePf+u9Uk6bC3gqKBQYh3Pwrnv4n/oDzH5SUIz/qafeYD1UBH8YQ+d
 kRWWVAnUo0BsJ19MsMQh7Ei0LKA8QDIMYiOJ5OviyHrU18AzshqG8rokzC8lYvaTAM9S
 3ED5ui3kK3i49iaisVw7TnTBSdrOouP3paL2kavnAHieLagO746+VkFoLIqyQuxc7Sk7
 htcPmnWIRfo2QuIxPJXfq65txrszXiBB34kroN91sXZA85S2zirv+8qbSzt8XTOPZ5G2
 SEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787695280; x=1788300080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eyJsbM3B9U91rhA9XcMnnj9HbTzV3f8teoGWTnmCdi0=;
 b=s55Jua1IvTaV/fP6PIe7qKkBw1koTOFUGPll0aaT0jm61hWpQ8SLcR6N0aI3X0RV+j
 QwcPf7KxSWT8HM3QoZrbbnNiU7PQSXQbDb8EK1+s72g6MgCt+4YIAhIm0jxqfk+fdKmH
 F9mbkQl5bFndzJnztdb2xS97oWI996bECCZpijDrhCParmHwKI6gd3ssadVVtyxQLK2T
 Xuvjth3GiJkY0Yb8TacxHaIHu4Y/9cB+eY2Muk0E8ADs84POhjRNgVX+w4GXbaYSAhdS
 rv0gJbGflXYnRXKCBhbh45q5D5jLf0bgZlZncHng2DQ8Fh1L8yKmbTPDStgkpWo37odj
 Uq0A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpzGq0O3EXjZwDBy4sXPtbUSCA+C/bejnOdFjp+szWNrdUpv0D8dTf2/fuS1AbBieqTlnvginF9RA==@nongnu.org
X-Gm-Message-State: AFuF++nGZVS+I3UibJHgdcwZ1EgQuo8EIdsX2vqYzZprjCR6Pp6zhLRv
 /0euueBuFmn3Zn0dYq9kJo+TgawTw9RyixTXiJ9nE3Ho/qDtdMsXrDcDTuYHbV3WaB0=
X-Gm-Gg: AR+sD113GIbzmGJUqMbNCp1OeRXEdqHEethTkaoRFMwF4N4440/QcLK61ThAGEjCNc8
 Md0VmSRVSHArE5b3v+ZQn2EljyvdrEHWLTK50k0gYkKO6/rcW5MyBihZE2nkSIEinXFVhB9YzCm
 jxY27wFl24tu6De+hzG6gcBqqFLlo8VIDd4vsQoMWTOkq1fQddl6GiKSjXkIr99qbYssNb1I3Em
 kKOXBIZjwPBJHB8DB2Ls7rum63BDsSaTYod+XdjMSU9zeti8MVw+xoSe5l1GLuSFj2VYwuaN3uI
 jEm9C93/y1tFSAJ0AQtukpJmBxjzsMD4e9vzfW80TIRsWr0VVBt1KLvvEALsOTJF3aauf1lXJXR
 gv+VMDGjN4IjTx21kUw63N4AWytwZ/YqAvg8h/uwKwC6M91c0AW94lCy/QLF6GXfIAX8fpsIF9x
 mEefBagFCGmcEQ9cJ92Cn7m8dROKoCUNwuRBU0vXmfqXq/
X-Received: by 2002:a17:90b:390a:b0:396:5785:843 with SMTP id
 98e67ed59e1d1-3966d203a94mr3597179a91.8.1787695279952; 
 Tue, 25 Aug 2026 15:01:19 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3965d119724sm3090120a91.2.2026.08.25.15.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 15:01:18 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v3 07/24] target/arm/kvm: Create scratch Realm VM when requested
Date: Tue, 25 Aug 2026 16:00:44 -0600
Message-ID: <20260825220101.3443954-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index ff179a66b821..1acbd885bf4e 100644
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


