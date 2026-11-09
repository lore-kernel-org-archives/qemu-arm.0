Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065EB606A338
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 22:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YOvyvhVp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQXu6-0005L7-7b; Mon, 09 Nov 2026 17:31:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtl-0005Dq-AY
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:35 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtg-0003sg-2P
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:33 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-8b67f25e6e1so629264b3a.0
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 14:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794263487; x=1794868287; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e6cGpCW9ua2cMf+lJeF3kZN84gK1Yf677YZr+Kh5B/8=;
 b=YOvyvhVpfB0px+PFTCg+4p1qowAW+bWIPIXwt219g+sarG7KxtFFvaRNJo0CgWoOnE
 jRAmxnnK5LEv5NejL/9KnDPSqEz2vgqe7kHRhhbS6hDHR7tsCl4LAOxD2WacXwFDYtge
 P78AnyVEMQOlaUpp2+M5xDnddg9cV3c4IGU02r1nP9kQILrxbMY10XIt8Y981oobdn1o
 +DBa1Q1W9ehqNWXtvS5amEqiMjhF5VkF3SrF2hduL/9g49Xu1cs+e/i5bXRnGMmb8+oe
 Hsc9VPjMiICW+Kk8oF3idUaQ6X5SuvN7hYD4VAIsQQVRJJsTpTEeJoq9vhGIbV+1KdFo
 /gOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794263487; x=1794868287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=e6cGpCW9ua2cMf+lJeF3kZN84gK1Yf677YZr+Kh5B/8=;
 b=qEn1u3pNa2rcGCw/4Rzql/y/JXdZJjYQ/OggZGti8/i/fzm8SzoZvdPjIlgv5c9lZH
 JiMe280oiUyMIa9eCQzk78WRq59XfFxJvIUbMrkhdQn6oGd1t37Lma0f1sSvNJ+qIRTj
 56ESYV39rLcPTxOflewxo5IYOAkBWy4WbuNRjZrgounkXOlrL8ssn1SQzafQB5bgYJBm
 ZkjTFh4SCItE2it6f3HOfkYwJTNAZ1QYQlmgEjlKsAE9CceUmAh1u3bMuzSnpCfMvmlp
 cK4oFKTvlVDypwyWxS0hGy9ImBjBVc8aNtSZU+SicvtN4NXm7CWj+ktf3iYA4i42X5hb
 0FyQ==
X-Forwarded-Encrypted: i=1;
 AL+hErG6vt+Vi2ZtPyiAlskcwu1BmO+NbQ24mUkgxbcssUNuv0UrfMwotLs4QwojJQquvpuhuAwaOik6+w==@nongnu.org
X-Gm-Message-State: APuU4Z88UXYX48lHj5XTL9Ms1+PrD9jXE8X2LDoi/Obms18H9IR07p93
 gdbIJERAoWGVFWvspXpmdjhnlYiMUxAVUYV5WE4behkn/8ttALsPN1pyeClNwm+Rr2A=
X-Gm-Gg: AYBFou0yIV1sYoUt+LOIEWbpp3No2VMh9LMS3coKA/bXriKVIEFCdks2J0Fu6ITQKUK
 Qret3LVzLi/mHCN974dhNQoHZZLmaotES8s86faglM29bLsokZJvGHSwgd/2XZRhr1sNXCOCmy9
 Fq4nDRWOijMGOS/Rw/rrgnxYgrIT1R95numFDcFpFUWB0k1rUIZAtG9cvAJoCZUVvDVSFaT3JpJ
 tAE6yW+6zf7cGVLoRSfK+fWgbvXBlhEuVTUIFY/cUMtKxCahXb5nNE15bJd1wc71gliFj+Auhy8
 QULusZ3+fD44AEksqg+hiF675623Z9Eci0mf3Y0Ave/e+DKD/ToSs0rzBpASun02/aIXm7eF74O
 m/+5g3DPcFKgcTlJcRL61Ju5T7Mru94hI5MTH7m8yo7NK6GjL6EHolI32n0Q4teNOcVnkh5luJ0
 wcKn5AIripcqdh2iXzT4ty2AxqpW00LQ8tWgOtxOwIHda2Py8vG3l1U2ExqwGTOw9/s9f+RQV/e
 b5Mnc0uVl7zuSUEr7MdXfeERuRrNUOj0s84xoQZpEjTPGyc1oUa1Q3bZsE+BDznlsvGjdYhmoLg
 9Ke8D5BeiQEK0YKKHxiGG+vF8d7rZ6kTANxMcR8TEpxIzNxVXd4svUtyz0zabzXzB36fKDmhmig
 =
X-Received: by 2002:a05:6a00:a226:b0:89c:d875:603c with SMTP id
 d2e1a72fcca58-8ba882e23b8mr929126b3a.53.1794263486735; 
 Mon, 09 Nov 2026 14:31:26 -0800 (PST)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baa506bca4sm165830b3a.0.2026.11.09.14.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 14:31:25 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v6 06/23] target/arm/kvm: Create scratch Realm VM when
 requested
Date: Mon,  9 Nov 2026 16:30:53 -0600
Message-ID: <20261109223110.1619504-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
References: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x42b.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

When a Realm is requested, create a scratch Realm VM by setting bit 30
of the argument given to the KVM_CREATE_VM ioctl().  Bit 7-0 are reserved
for the guest PA size.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 941951a9bc05..63a3e78efd53 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -110,6 +110,8 @@ bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
                                       struct kvm_vcpu_init *init, Error **errp)
 {
     int ret = 0, kvmfd = -1, vmfd = -1, cpufd = -1;
+    MachineState *ms = MACHINE(qdev_get_machine());
+    int vm_type = ms->cgs ? KVM_VM_TYPE_ARM_REALM : KVM_VM_TYPE_ARM_NORMAL;
     int max_vm_pa_size;
 
     kvmfd = qemu_open_old("/dev/kvm", O_RDWR);
@@ -122,7 +124,7 @@ bool kvm_arm_create_scratch_host_vcpu(int *fdarray,
         max_vm_pa_size = 0;
     }
     do {
-        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
+        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size | vm_type);
     } while (vmfd == -1 && errno == EINTR);
     if (vmfd < 0) {
         error_setg_errno(errp, errno, "Failed to create the scratch VM");
-- 
2.53.0


