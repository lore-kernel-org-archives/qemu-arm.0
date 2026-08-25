Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3340C61DB9
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 22:02:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyzCw-0003OO-Hb; Tue, 25 Aug 2026 18:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzCi-000329-64
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:12 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzCg-0001Bs-Bb
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:11 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-38d489b6b71so526145a91.0
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 15:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787695269; x=1788300069; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=gzyHU9mpmLRwtQLq0gW2o+D00lhdgYVo2at04MRhk8M=;
 b=XmdwzWU3u7lx+qe2YQG1ucAesrZakFB1ua2ssTnaCBtn93KF8kZeFlLMy34Zq3s6lj
 noNjvrm5mM3sxw8ppLgPXtxMGV3dlylYtIQf1cbUZKOuG7dUgp6m9rs5AXgxFFTTadMc
 4LH9eW3bDNbMRB7HJedehfzpUWnUeyzm+f8E7TQL713nNuubMDh8TW3KoZLq0HcroigA
 ne6xvaZRFKtDvc8fr3qYyMytGrxxrr0RGOlSaf7u6gneg6gSsS8WatMmN2kmsghCAOH6
 KqH+BNDFixzEgencv8kpWj8dIFWh2T8jXrVMJkK7hG7ApCXJ2u8rlzMjvsmG6fubddhx
 Qx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787695269; x=1788300069;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gzyHU9mpmLRwtQLq0gW2o+D00lhdgYVo2at04MRhk8M=;
 b=DKlCcsbWLScmO2D1+Ean+4t9A/l5+h1m7u2V3YBXG9fA/fKU9KfQ5W0t5CUOm3F5GI
 ICGUwV7ARxiSm6MSo48Dq96I9tSp2FbfknFd8WAEXcAqShVfi71l5UVDbPiennc1mahL
 XYWJPV60M+vzq4EiHL+URfhOecCQCu6Uns9A7NpfQ6Vx1V1K/R/NyVOxwZEM3gs3Z2MX
 hKYnTPV8XCGLfaY6Yp9jvJvDW6w8tE2Efe8r2tnTaj1HdGJH/YG6CUXKf8C1ySgYpvcj
 7ObOGt8ayHHTp0sNETTFl3/32itD00GhoNQCRJUTcbzbASHYXYjJpiEPHNc2iHfobQtd
 TXyA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrNU/tM9zT79eis4e23LUUJhTYmr90gczLrWuxlfb7+iS6rnVu/Mu6JVJ+A8shlCqWwm8ygvyDqpA==@nongnu.org
X-Gm-Message-State: AFuF++m9USpqFdCYLXJO13xaVCVD1ib5/Jz++9Bz1SVOE8bGkwtgKS9f
 68Uywz0Q8rbMHhAHmWeIjpcjMnWIRQm+/YoXiOZTlEeSqqkBbW1Hpw75Z2OUaGtta0Q=
X-Gm-Gg: AR+sD10pa3bWheq8P15AWa7vEWWJw7KWj1KQKKYJ8p0AdGVN1nGtnJDLz1/GCQ/lra3
 3Z/UnF1ebcMp5DSIK1NnzgYstLxrWI2gxIx/eWfWmI79hsGjHxcz7XH8Obxbw/HvY0sMaiYHZWn
 X+TqUjte5+AyA+kP3ZfyJPIacDp5d9f31h9Ei338BCL5jYwjlprNxZU+3exIJaxtxW2DV5AZ5TK
 D5y/8Vm3VEb+B4s73dAL1Hun/tOk6++JDRTA5aHZyOzR/SAHljPC3AegPC6fqbcAgULDu0xjSc4
 EjEkabZN5v0wUPjWvI1pK542efo3VI3e5LQpJ1um6F8JH/XPpI+Zj+P6psbqnv0bGJdbjiGLkq+
 hILnmZpq7Q7fhg1159TBleSa/b+LRqFTUEbPyeJNzX9EFVjpGySjY8jqa2xRo/T1vpxZLup+d9x
 mXNdPA+JNnoZnZZ6hEhm5NtWqjq3luA9CHB5rwCKdmwKWsuQr1R12V7NfddxyAHZE8C+5+sOzr
X-Received: by 2002:a17:90b:3d81:b0:38e:c7b0:84ad with SMTP id
 98e67ed59e1d1-3966ce035e2mr5067715a91.0.1787695268545; 
 Tue, 25 Aug 2026 15:01:08 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3965d119724sm3090120a91.2.2026.08.25.15.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 15:01:07 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v3 02/24] target/arm/kvm: Return immediately on error in
 kvm_arch_init()
Date: Tue, 25 Aug 2026 16:00:39 -0600
Message-ID: <20260825220101.3443954-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x102e.google.com
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

Returning an error to kvm_init() is fatal anyway, no need to continue
the initialization.

Leave the `ret` variable in the function scope because it will be reused
when adding RME support.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 7d194ea112b1..20b39d10b766 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -596,7 +596,7 @@ int kvm_arch_get_default_type(MachineState *ms)
 
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
-    int ret = 0;
+    int ret;
     /* For ARM interrupt delivery is always asynchronous,
      * whether we are using an in-kernel VGIC or not.
      */
@@ -618,7 +618,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         !kvm_check_extension(s, KVM_CAP_ARM_IRQ_LINE_LAYOUT_2)) {
         error_report("Using more than 256 vcpus requires a host kernel "
                      "with KVM_CAP_ARM_IRQ_LINE_LAYOUT_2");
-        ret = -EINVAL;
+        return -EINVAL;
     }
 
     if (kvm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER)) {
@@ -640,13 +640,14 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
             warn_report("Eager Page Split support not available");
         } else if (!(s->kvm_eager_split_size & sizes)) {
             error_report("Eager Page Split requested chunk size not valid");
-            ret = -EINVAL;
+            return -EINVAL;
         } else {
             ret = kvm_vm_enable_cap(s, KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE, 0,
                                     s->kvm_eager_split_size);
             if (ret < 0) {
                 error_report("Enabling of Eager Page Split failed: %s",
                              strerror(-ret));
+                return ret;
             }
         }
     }
@@ -659,7 +660,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     hw_breakpoints = g_array_sized_new(true, true,
                                        sizeof(HWBreakpoint), max_hw_bps);
 
-    return ret;
+    return 0;
 }
 
 unsigned long kvm_arch_vcpu_id(CPUState *cpu)
-- 
2.43.0


