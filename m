Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp313681njc;
        Thu, 19 Jun 2025 07:52:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2uyAfBx/OAhhZP5qaaIAH76Nl2p3NEVzcPdQdjxoRI7g8sXQxas1zPvanoJOn5YyZVcmWyZH2mMd5AQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHw8BL15OqAAET79QW9WLlaIwyrPc2JN+8S4Y1YR84VyqOiauPONJth80562tw9apBp59w2
X-Received: by 2002:a05:620a:440f:b0:7d3:90b3:28f with SMTP id af79cd13be357-7d3c6c08440mr3515452385a.5.1750344740856;
        Thu, 19 Jun 2025 07:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750344740; cv=none;
        d=google.com; s=arc-20240605;
        b=LoKtsTN6gk7RjSTghFVbjoZlZs+QtA2fBMwVZuX4Yz/kNZh4qn9H1bRUWVMaSA74CY
         /xXHnyxCBtVu6lVujSrEBmuu7d+YawPx/aMyKsy7jOnHWcIjiQJj7emkXCtQgQBx8z5r
         vvK8UNTjX3ozwOtW1Buy23sWV5UXmAR4nULqxXDkXnn2MjuhsyNFdzUoR8zT2Su+fE5U
         Xkc+aSDHcJY24EvTvJTNlcPagdHnjTEEfnFKdU9xwT4EfYW0O/ig2/m1wCnOB/Dn5VI0
         Ou1JJHUjHyn0vyDTXwbC+UeMYo7ec6nRjx5lwgjwfvL7/a0mTU5X8FtWmKXYq58UPrzl
         Hn8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=r7AlY5DuvlpGUmOxegRb6Vcqr+33treq3S+6FWzdPX4=;
        fh=UVrGBnfE9R8/5nTz0HPCluylUu4vXq1b0MPFtmDhPnc=;
        b=VrxGjIrogdwyzK6YJupPXQBVUO0BDeMFnWoLTG3cM4JmIsSIPaNmr9ILWGB/T01FtA
         P60/Md9Nqr9gb4ZPvZogsKXHP+K4c0BuiX338ESYXAQ5YE3UqyPVbwxq21uxSx7al0/z
         T+cd1SXZF5J6qi+7WrY86YpZzi2iSS561RuFbhwe5Hra4qxosAWUXz+UMF7YAZGqs54H
         RW1UpT10p1jC+u80vDaNRrLAgOB/tb5XpTyW5TzCi6SLwFO0e929V22U6X1YB7vI1t9G
         AdDgY4zOBW0MmZXXRerqJUgQfK3aWVXDns03SEqWC+efDeBLrUX7nPbawsEbYmqrFJUQ
         jtEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fpY78Ycc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f8dcc889si9926685a.51.2025.06.19.07.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jun 2025 07:52:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fpY78Ycc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uSGcD-0000Dx-Or; Thu, 19 Jun 2025 10:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uSGcC-0000Ch-6M
 for qemu-arm@nongnu.org; Thu, 19 Jun 2025 10:51:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uSGc9-0006TA-2J
 for qemu-arm@nongnu.org; Thu, 19 Jun 2025 10:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750344686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7AlY5DuvlpGUmOxegRb6Vcqr+33treq3S+6FWzdPX4=;
 b=fpY78YccuES/2xfGjyyCNaq1xq6OjCbYJnVv1X6wnWH6Yyb0UElAf6Pn4Xyq3m+to1QUmr
 e1N62xxqDQD/L3lqXvl1e+//JO5sj1sA7ClU32VRt08X3ALP1ob2NBb5T+nmO4U56ON6kx
 pj4eIfeXI133gWmnMu5RLhi9gnp9fzc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-39-8bsf7ZD-Oa-a3jrhVb3qXw-1; Thu,
 19 Jun 2025 10:51:22 -0400
X-MC-Unique: 8bsf7ZD-Oa-a3jrhVb3qXw-1
X-Mimecast-MFC-AGG-ID: 8bsf7ZD-Oa-a3jrhVb3qXw_1750344681
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D0C241956096; Thu, 19 Jun 2025 14:51:20 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 34CE019560A3; Thu, 19 Jun 2025 14:51:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Cc: hi@alyssa.is
Subject: [PATCH v6 5/5] hw/arm/virt: Allow virt extensions with KVM
Date: Thu, 19 Jun 2025 16:50:03 +0200
Message-ID: <20250619145047.1669471-6-eric.auger@redhat.com>
In-Reply-To: <20250619145047.1669471-1-eric.auger@redhat.com>
References: <20250619145047.1669471-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.897,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8YJT/bRQ+r+z

From: Haibo Xu <haibo.xu@linaro.org>

Up to now virt support on guest has been only supported with TCG.
Now it becomes feasible to use it with KVM acceleration.

Also check only in-kernel GICv3 is used along with KVM EL2.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---
v2 -> v3:
- check gic version/in-kernel implementation when kvm el2 is set (Peter)

v1 -> v2:
- fixed test ordering: virt && ((kvm && !kvm_el2) || hvf) [Richard]
- tweeked the commit title & message
---
 hw/arm/virt.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 675ddeec14..06a57380b8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -795,6 +795,13 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     default:
         g_assert_not_reached();
     }
+
+    if (kvm_enabled() && vms->virt &&
+        (revision != 3 || !kvm_irqchip_in_kernel())) {
+        error_report("KVM EL2 only is supported with in-kernel GICv3");
+        exit(1);
+    }
+
     vms->gic = qdev_new(gictype);
     qdev_prop_set_uint32(vms->gic, "revision", revision);
     qdev_prop_set_uint32(vms->gic, "num-cpu", smp_cpus);
@@ -2208,7 +2215,8 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->virt && (kvm_enabled() || hvf_enabled())) {
+    if (vms->virt &&
+        ((kvm_enabled() && !kvm_arm_el2_supported()) || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
                      current_accel_name());
-- 
2.49.0

