Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D084C624DE
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 19:37:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2DEb-0001Mi-Ue; Thu, 03 Sep 2026 15:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEb-0001M8-2S
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:29 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEZ-00049p-Io
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:28 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-39927410578so272786a91.1
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 12:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788464186; x=1789068986; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BW+koEYMGeh3Q0Il0QE3jfPQEhQaRsizJA+FKY6y1jw=;
 b=yBJ4agoBTQbQd7Vkz9bYjxon/c8C/XuTCwT79SjstETTHZio7gy1XgAhovehD6n2GR
 xhfXgNXG7q1Ms3N6ZVf72OfZ/djDmss0ga1S+/Fn+YfxULpQTNTdIZUKfWbXLpOv/lE5
 QGpoAIms1rL/7xqHuam794QJtGVxi7RVUmeF5W+3+6hcff8s6v6OncVbVBzUSt9dfpSo
 fxqPE2helov33XfdNDe6LQZ5M0LGy4m637AXA+iMEHbCPp1LNKWTfXsShsZp494PN0Xf
 7it9IarrF/aFZ8BbbvhPaI1yF7mpxXLc/gGpetkDc+WWb1cSuGFAa+nBOyW5tU+J3Zwq
 glmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788464186; x=1789068986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BW+koEYMGeh3Q0Il0QE3jfPQEhQaRsizJA+FKY6y1jw=;
 b=AlehpiEJWVn+P/j3ZNc4npCKRLXsinJrMicY22pQj4+djtMj+v994lF+9iIc6x8tnG
 zyTZRQSKNWJJb0GY+Sm3IpgQMJl2ac/8xOR5K0FLGBy5DTBXG4lO2+wOzSc5HETSyxYz
 QSGmio8YavvXVoeQKj7VkErDU0ExrSutlWeABSr+sL+E0nA4CVl7dmmuiF6vmvbHcpMX
 8b0/nGL+j9HnVb4prhCF2jqYEMiiV9psyyKQHbICyjABRUr09qOa6UmD9qi7YtZ8GLHH
 EtYlvR0CXnbynWX0LUQoV6D9vye+57L80jtOItybFGwlv4ahe8X338BSwSJCp2O0oRaJ
 CX6g==
X-Forwarded-Encrypted: i=1;
 AKwUvBw0LCUPFoSoBkunvCiBs9MUS9NWHJ+Bs8yndRXiCOsFfHqI0+N7r1VX1t1n8vxWxdSIka6jpihrUg==@nongnu.org
X-Gm-Message-State: AFuF++nFoFlxljXp3KtklozDdOVeLPzF4v86u9p8K5YdywMrsnQUns7y
 vAxKYZxMvGkf2m7xErcytWU/gtArM7krdgYJ24mFzgbjbf/oGfIpDmkG5MnQALHNEKE=
X-Gm-Gg: AYBFou2vXIS2iAcPY/F5mPGH+SS0y64rF/y0yBK79BRmtiodId2OPDO9GDHAAsF1an3
 uR3jT+4oiZuIapGQwyBoM2KaXOPlAPrBh4p5aTCfkh7ugx/kZBaaWrlgNHfcK2oiTnuVtpXy2BW
 8BpGb7HbH0dsXnkxWvuRkQUqAsCs6WGRnKyY6Uepj9ucjHX1XdPguJS3O5DI+iX9EH/q4gu3Oan
 SlbkEiq7YguKWJKzc7Vh3EgDK6Bf/yHv8BD4Lpp+Wv+WordB+HsEw+8zavU83fK3VOzgcCu8iiy
 bYzXAKlIyYwVEjc4qozjsL4KxNKW2Kq5C3nPv+4dDrKCfhp0y5G86hQ335gmOvksmaud0vbwPyH
 qkkPjWHVGtYC7fJV1M1opzsrb5h9mTHQVCfgXWZvTrwoyDhPczFmU5Xcb0toDinq/ai6V1JsxAG
 npHMshJkDz7zmX8ri8KfVUjdIxQVzipAP7yebZzM/GLiuYnKyTH1+gU+Lt7PWFv0c4+hLn9byid
 zarsFqQGJIshWY=
X-Received: by 2002:a17:90b:4c51:b0:38e:57a3:f218 with SMTP id
 98e67ed59e1d1-39b26204e5bmr851072a91.13.1788464185768; 
 Thu, 03 Sep 2026 12:36:25 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:40c0:ec33:6266:c275])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39b083e4fafsm6836951a91.1.2026.09.03.12.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 12:36:25 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v4 07/24] target/arm/kvm: Create scratch Realm VM when requested
Date: Thu,  3 Sep 2026 13:35:54 -0600
Message-ID: <20260903193611.1058589-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1030.google.com
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


