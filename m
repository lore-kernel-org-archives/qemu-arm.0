Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3934507dye;
        Wed, 2 Jul 2025 09:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUj0rpvHfLnf+UbvbVLs/D2g5zGQkzAJT+gDbe+89zK+ar5S3LyiJr4RMsOO+7KT8d/Cwgi+axmVlUOcw==@linaro.org
X-Google-Smtp-Source: AGHT+IHszD+Kz/MXDn/yWo95B6906i92YyBtJ18l9pN/yt6tr2i8cN093XyLK1SBCo5FxZY/T5WK
X-Received: by 2002:a05:6102:2927:b0:4e9:91b2:c74c with SMTP id ada2fe7eead31-4f1611d6b08mr2273203137.14.1751473989964;
        Wed, 02 Jul 2025 09:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751473989; cv=none;
        d=google.com; s=arc-20240605;
        b=I3m6w6nEgIAGWZ7On2ubxfLFTPH1lWRNlZGKqy98xt181lTER2DsJtDLV3chQGYQbW
         F0OoeM+Pk4hQ2tMdDirVmF8exNNEGpZT6OJ8wRebIMhP+w15eymkR/QFC+PkfyKW9bl+
         lw1foyIPUl6JDhShufpVBkahwP27arMtXkCNoHeibzsDYXe+Uv+jODTTeIlUgsG7QwZM
         qW0Kpe1mZuJ5fnEsT7vkI9WeJjLodMPqWVYe9MR8ab8ncud88EW0Tjrty4DJxf0D5VtY
         c8JsKFtdsjaOM+o3WRloGbC0Q61qlpi4LjfJsT+x8jcxV/cgOpgg24BfEB0syr5V+LO2
         5/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cTZ0qXILdB9I1xdIOTy0v9rOTOORuOlBBMW7XIFebYo=;
        fh=UVrGBnfE9R8/5nTz0HPCluylUu4vXq1b0MPFtmDhPnc=;
        b=i+mBQvusfBGwwxTaMOGYtyn1ankGmDJpWcPALbnzF6DMqWa4pHXqCCLAFVDEyoeQhy
         dNaM/ADyDMoIhtkPzdUYIARbg6OqYGwd4vM7fev0h4Kn7kqmmLGAad6nM0TqAb0CRFdD
         zs/Ynkampaw0S6JlDu33L5uCqwobc/pkJYHG2ExRFxIZaxvPZ9hg2kbPwwWH4t/WIQhQ
         leYGhHmKQJdDiwm/DNAtWCuS0aNWI4vm499pKDsKUl6jzFdmkxovzYOmG29Z4Zka/F3w
         12pbq5qCDWS7VwTOtcIEZA1bTmNI58dULuWVLWT7L+vtfm51bxKMJc4usyE0oTkdubqq
         Fexw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OBXAyfWg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ee4c7570casi2900543137.119.2025.07.02.09.33.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 09:33:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OBXAyfWg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uX0NV-0001IQ-1n; Wed, 02 Jul 2025 12:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uX0NJ-0001Eh-To
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 12:31:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uX0NC-0006IE-6B
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 12:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751473908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cTZ0qXILdB9I1xdIOTy0v9rOTOORuOlBBMW7XIFebYo=;
 b=OBXAyfWg6VgM9DauFxHNKhOpVPy02576YqajB0xYdeZph9PrP35E1EFXXyi4fmdf0s6GB/
 QICuzciJvttyLoz2fqGT+8aGf52dpUgL004617abW/hZMMqp9bZcGsqKAE0VayTzilIaU8
 m2bUDaLEtIhNagZTEjHkY1gUzmsFWec=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-25-JLOcErEyO3audzYIs8V-fw-1; Wed,
 02 Jul 2025 12:31:43 -0400
X-MC-Unique: JLOcErEyO3audzYIs8V-fw-1
X-Mimecast-MFC-AGG-ID: JLOcErEyO3audzYIs8V-fw_1751473901
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4A65A180120F; Wed,  2 Jul 2025 16:31:41 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6AEDA195608F; Wed,  2 Jul 2025 16:31:37 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Cc: hi@alyssa.is
Subject: [PATCH v7 4/4] hw/arm/virt: Allow virt extensions with KVM
Date: Wed,  2 Jul 2025 18:30:43 +0200
Message-ID: <20250702163115.251445-5-eric.auger@redhat.com>
In-Reply-To: <20250702163115.251445-1-eric.auger@redhat.com>
References: <20250702163115.251445-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5SpVbKz2c1Sa

From: Haibo Xu <haibo.xu@linaro.org>

Up to now virt support on guest has been only supported with TCG.
Now it becomes feasible to use it with KVM acceleration.

Also check only in-kernel GICv3 is used along with KVM EL2.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---
v6 -> v7:
- rebase on top of "hw/arm/virt: Make EL2 accelerator check an
  accept-list". I dared to keep Richard's R-b though.

v2 -> v3:
- check gic version/in-kernel implementation when kvm el2 is set (Peter)

v1 -> v2:
- fixed test ordering: virt && ((kvm && !kvm_el2) || hvf) [Richard]
- tweeked the commit title & message
---
 hw/arm/virt.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 550a272fbb..1c0a2c43c4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -792,6 +792,13 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
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
@@ -2211,7 +2218,8 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->virt && !tcg_enabled() && !qtest_enabled()) {
+    if (vms->virt && !(kvm_enabled() && kvm_arm_el2_supported()) &&
+                     !tcg_enabled() && !qtest_enabled()) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
                      current_accel_name());
-- 
2.49.0

