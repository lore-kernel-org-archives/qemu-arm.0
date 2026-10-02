Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F6ECA5FE5
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 20:21:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCjkZ-0007O2-MN; Fri, 02 Oct 2026 16:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkI-0007BG-Hf
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:44 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkG-0005lT-Ut
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:42 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 d9443c01a7336-2d747ed9866so55390155ad.2
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 13:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790972439; x=1791577239; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gzLwnH4jDzrX8kj8UPASW2z1d+DNR/ChcuS1IhF3HHk=;
 b=EesmtMA8Bi39Jn22GB15LJvQh7u3fbqNyTc8ncf0iifj6waM59s2iOv9fRsqFmkdee
 oZcPZYrLCH/CmYbRIlUeFW0HYmn/Sg6UAhEucNtklRdkYDYON/XWqTAe9CsJ2kVxboWK
 48Lqs5yU24n7HpNOEjJHmJX2OxXwvrEHP02b6beJE41DgCxbgZWwZdLb5dZPma11OwHe
 JblqD8ONuRapZT/t0WQwWl938WjWINyS7WJ64RE22EuqQuRAqPtcMHjRZULrFBkNlMDL
 at5NdXEVfRsx4gWWm1kkBa7Hv90Ei/UHFDVtc26j6RCdIOnUTnQdOvJoQGIlKmM/pNZ+
 Kx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790972439; x=1791577239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gzLwnH4jDzrX8kj8UPASW2z1d+DNR/ChcuS1IhF3HHk=;
 b=EGt+OQW+k/9OzIG0SLrNvMt8dFys7gFl+o739X9ReE0kWlqVj2ZBhL7c7wZt9JEaKY
 jXYp1pHiFug+B9YYJ3F7LzoH01BabSX06XCR+9SxVYO9R86B6fadeKj30n3Y771cnDqt
 hoYEjkgDyrpqGcD21J6FHzjaN2xK6qbnWeb/qqnsBh8myyP+bW6cRWWrf3tvPaPhE/B/
 I0SMHsu854+oIvADvFGS+LVbEhUKO7wWNzcOQ3r8YHLwXgd7ZobG16b9gLZ+SP5NItCF
 up/wkLYDKJPBOgSOQw0acXW6KRpGM7N/wvSLPHkCBfewpEfNH1CsgHqGKbOF+XZPJr+C
 Go/g==
X-Forwarded-Encrypted: i=1;
 AKwUvBzPXItzFiatCUlhVUivM/UL66NlEOSzhwsGFbg3xsnXjqytJbzU60TNoRByTSMRZoKC50lJEpGb+w==@nongnu.org
X-Gm-Message-State: AFq9FYI1pDlZdu2lG3CHQ+nsYomEqcNGdtsP+QE8kapnwc1RvYQmDBws
 0xqp6YQO7fJDUtu8GSWBGmDIExRINYb+faf0Ap8H8HRIgiB061ZpXwfA/m5bgFFq3RE=
X-Gm-Gg: AYBFou2GwEaRpjoKxaOUJfQyerlF4Xlr1jDQKnXwdxS8uvwZ0i5ZnYzCgBtBf9KTKGg
 z1kGYOM5t9yU9h+99vaAss3Ck2C/MbuzVK2EBwOuQWNvG+s4UvSdIhMxBuTBujupC35g30oCPUE
 gSW4PiWET4WnmWF1LNFHrzdCs60aChAzn5ed/MJh3X3DTqS9FkdtgWiHi8SPVVK2LauvJUzyXXb
 CKnQP9CqhNZ5vKkXvJaQE1caOT02s2psZzfWMZlZoXQfwLZv2m9uYzgjf7O3ydJwKLWEW9P/3cB
 9ozZIbwois66U0rWy42Fo35wkD0m+iC1bhy6V9HgvbHEHq0hh45nhC4FNswi9jKJIUehpvUZhFy
 NXiSqR/eL/z6XFZS84xcagnh3JgKXi7MlEpXXH5a1UpawL82wLRE0f8fpxYkLHtbnoV89nLkUy5
 xp43Q5QI8Qg+VfWF6vTXP3oS00AjWJ1wCRlX7A6pfQSjdlufIna+4ScEeVF+oluUA9UjTgk1pXB
 2iUgqdQwOeU8fg8+jr3+SEK
X-Received: by 2002:a17:902:ec92:b0:2dd:c100:a5e1 with SMTP id
 d9443c01a7336-2e49b684416mr31187295ad.53.1790972439265; 
 Fri, 02 Oct 2026 13:20:39 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:61ac:e744:6559:a357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6a99acsm12399415ad.34.2026.10.02.13.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:20:38 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v5 06/22] target/arm/kvm: Create scratch Realm VM when requested
Date: Fri,  2 Oct 2026 14:20:10 -0600
Message-ID: <20261002202026.1204110-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
References: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj2-x11.google.com
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

When a Realm is requested, create a scratch Realm VM by setting bit 30
of the argument given to the KVM_CREATE_VM ioctl().  Bit 7-0 are reserved
for the guest PA size.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index cfee9fe99f79..8c74785998c2 100644
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


