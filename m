Received: by 2002:a17:906:3503:b0:a46:a4a7:8772 with SMTP id r3csp5347eja;
        Tue, 26 Mar 2024 11:24:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyjxgblZM/Jy6h8aEanLsnOccCdrRU1ZAgUR36oICv0+HGfwhCqLUzSf+wKOvAQiEulQTIB4B4vzScAZYhqL41UzVZSwk2
X-Google-Smtp-Source: AGHT+IH9DK6HK+6wfpbJz/8imB7UVMTt7ecAjV2vEtjzRf33fvZ9OvHV+KGOYKpIbQsJ7MUSJn1a
X-Received: by 2002:a05:622a:5ca:b0:431:442b:25d3 with SMTP id d10-20020a05622a05ca00b00431442b25d3mr3174287qtb.24.1711477484929;
        Tue, 26 Mar 2024 11:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711477484; cv=none;
        d=google.com; s=arc-20160816;
        b=Ng8QvRHicMQswODZsMqXxTgDGAwZetJpmDUGQM/eKo6yLl5Uuv+X87wZJ6wW3U5t3q
         t71NwXrYRuuP+hAjxeqWsyGlQBDn5AYJ41tBKlPzaHWHbYAcfl4Wp2W9I15Vw3uEtzxI
         jjpPO4v0K4CkFp7DrTh4NwgZkAaQD8IlyTGEuf16DIRUNfvmyiyIx0AgnrY9iPk+HDJl
         sAwspp2F8KMBGRiQqamM4BizEqyPcrrf2Q9H9MDJY7cS5S7rMImLdjUDhztC7MghrWht
         CTZJ5Jrf6n017ACWN/QSweE+CrsefeAueZUugmHCMZRdFgwSyCK8ompiwN7bOExDMM4L
         w2iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KTZ9FjrdUUDZGNQBroizG8Hk4yqp7vylLWIeDWb7RF4=;
        fh=+QYT5ic2V0JVqAzRbmJQwTxDwhWoCj38euddbeXj624=;
        b=UQozFrN7jia0uusLL+dGk1DGFBYqPqc9ytyPKKdn5GPS4p2RPerqRtW097ngENsNMq
         60sNWXM/6iVRpiLaqk+Y8TLkUgFkO2ENAeg91bEdnvMpLndHs8tD8pzmebVtSubVfKVa
         le2kkJKGMQA73wZ+lP+ES6p4XHN/0tsywYazKwtq+9p+Lfwurr7Im9OQWgrwUWpdMDp4
         /T2xz+lHcreb8PvOtySfOWHR7t+mJUI5GuoAwi8wyXLv5JyfY/VGuVR0NYIS18J8i9OC
         Cadahxuwd0qc78VvEWaiMVqIlqj+03pvo93XIqlqqn5dVOP+FfufR7982BibBr5X4k3Q
         I9Cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RlxsOYlN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cn10-20020a05622a248a00b0043136a72d8csi8298219qtb.560.2024.03.26.11.24.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 11:24:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RlxsOYlN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpBTH-0007mF-Vw; Tue, 26 Mar 2024 14:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rpBT4-0007dU-2D
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 14:24:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rpBT1-0000G4-Lo
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 14:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711477450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTZ9FjrdUUDZGNQBroizG8Hk4yqp7vylLWIeDWb7RF4=;
 b=RlxsOYlN3aRD4REmSgvO1Mj7TQ5ZujrUnOUpE882DKwE2Ll1XOK2XmYCXkVGDnkEVfSCoH
 k+09PahnXaEFi0wBpEovBykAeu5voZG9YLRJCOL56gbKcktE4GYxEX0nmZDUzIhgTyj1QT
 irk89/Benw2S+rfog+QKvkqxmaAL6UQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-495-t5Id6UcVOiSo_7Y8qC72fg-1; Tue,
 26 Mar 2024 14:24:06 -0400
X-MC-Unique: t5Id6UcVOiSo_7Y8qC72fg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7D1228C97CD;
 Tue, 26 Mar 2024 18:24:05 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC89D10189;
 Tue, 26 Mar 2024 18:24:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Subject: [RFC v3 5/5] hw/arm/virt: Allow virt extensions with KVM
Date: Tue, 26 Mar 2024 19:22:39 +0100
Message-ID: <20240326182345.326758-6-eric.auger@redhat.com>
In-Reply-To: <20240326182345.326758-1-eric.auger@redhat.com>
References: <20240326182345.326758-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: jYR/C+hRT2Ve

From: Haibo Xu <haibo.xu@linaro.org>

Up to now virt support on guest has been only supported with TCG.
Now it becomes feasible to use it with KVM acceleration.

Also check only in-kernel GICv3 is used along with KVM EL2.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

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
index b20b20edf4..e4d6b9bc35 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -759,6 +759,13 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
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
@@ -2155,7 +2162,8 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->virt && (kvm_enabled() || hvf_enabled())) {
+    if (vms->virt &&
+        ((kvm_enabled() && !kvm_arm_el2_supported()) || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
                      current_accel_name());
-- 
2.41.0

