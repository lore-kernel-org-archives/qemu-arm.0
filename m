Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3568723dlj;
        Thu, 16 Jan 2025 00:34:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWT812NjmKJOMRZ2l5STODsiiI3iMtkyu3TDcNitFGq38QRb2UMO59/BrtK4hMVqRyq8pd5v7i2XvoKGw==@linaro.org
X-Google-Smtp-Source: AGHT+IFS5GKIDABwFii3u/PJ2Bi9NhC30qUOa9ZyObRxkmKHzonk0j6eta6XINXHch0hMKV3DLDg
X-Received: by 2002:a05:622a:1196:b0:467:65d4:42aa with SMTP id d75a77b69052e-46c710e4ef9mr576040211cf.37.1737016486280;
        Thu, 16 Jan 2025 00:34:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737016486; cv=none;
        d=google.com; s=arc-20240605;
        b=Dv01YIUQifGdS6o9GVvrTTcqODpM547hZKmGwrqY54l+NVANu9oGRmd5gQqM+Dkolu
         jzIdT1+ss0QMtl6lFIKE10QDpNmXweOycxC3rYWpmJ+8Hyv4BYTbO5dG82LeFicNdw0e
         mh0dKsE4ghpWqBXbI48lS+YZ3t/QrYTBehc+wIwwNi5hysmW/TOLtJ630JwQRj5te02R
         nQ+iHfdngh3sAjvThZLCVCszD40+nHkQF7OFFVoMX+xIqwIMemgxUJf/sD+o9C98ZNw2
         a4/B9eIPH0vlFZciR1uth7aXzn9TQLtyMdG+VvSk9DLPrykE2xzHOih5OGeEYSAMbRSM
         L6qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cBvbNB7PNqpM2+SpADvQvkgIWYVFUD5w84r3hgu8Xg4=;
        fh=+QYT5ic2V0JVqAzRbmJQwTxDwhWoCj38euddbeXj624=;
        b=Rw0fa/veeekUL0+p8t9E43b2bRTOx9UljTb6O+p/YQOFt9BoV6rs5mxLVK1xe+VkGl
         RoDS7UL2FzFKoXgmBCLF2WC64uTIUXSEAPJwJnowEtIdeVEGCBi12Lp/PBKq8/ZQ59sy
         H1eoQNbxz2+XOhMLHHs/BQX9An2W+ULe/gYVmX8MQ7U9lF7Q/gqT5rmmCK0phVjEdf40
         vY+JspwBzxaqcdobXbx9kXHE5V/WJGxxw87+K01uAebjzVl6w4Uf7dZGYYbs+9xO+Lkr
         55R7KoPnERWbS9V75x2o/Fx/TW2REgE5eWi588n8C0GVDCdDn+xi5jBRv1vbXHTnVk18
         woVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M5VHFLmt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c873e5112si154883051cf.330.2025.01.16.00.34.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 00:34:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M5VHFLmt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYLKc-0007Xe-UR; Thu, 16 Jan 2025 03:34:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tYLKZ-0007V4-Ih
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 03:34:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tYLKW-0005Y8-Sr
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 03:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737016460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cBvbNB7PNqpM2+SpADvQvkgIWYVFUD5w84r3hgu8Xg4=;
 b=M5VHFLmtv6v23Q+ZzsXF/AO26B728XxIf+/hUmpkWeNoGHSwIFVDaZfXY6yszy32SJa/yo
 jyz4WjWto88jzbea8B0gKLLLEJ1+eYT7n8uTOgu0B41BtM1N+xNl7KD9eWB8ETR3sYaB7a
 gGwHdtfNnC3mfWrFhvkmyg3kkhw2xUs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-312-TFZMyp-lNPykXe1pjYwXOw-1; Thu,
 16 Jan 2025 03:34:16 -0500
X-MC-Unique: TFZMyp-lNPykXe1pjYwXOw-1
X-Mimecast-MFC-AGG-ID: TFZMyp-lNPykXe1pjYwXOw
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D28DD19560B0; Thu, 16 Jan 2025 08:34:14 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.32])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BB60D3003FD3; Thu, 16 Jan 2025 08:34:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Subject: [RFC v4 5/5] hw/arm/virt: Allow virt extensions with KVM
Date: Thu, 16 Jan 2025 09:32:18 +0100
Message-ID: <20250116083339.674344-6-eric.auger@redhat.com>
In-Reply-To: <20250116083339.674344-1-eric.auger@redhat.com>
References: <20250116083339.674344-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.793,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: BSWRiuaZYp2P

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
index 55b0bb24ba..fff25dd615 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -791,6 +791,13 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
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
@@ -2210,7 +2217,8 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->virt && (kvm_enabled() || hvf_enabled())) {
+    if (vms->virt &&
+        ((kvm_enabled() && !kvm_arm_el2_supported()) || hvf_enabled())) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
                      current_accel_name());
-- 
2.47.1

