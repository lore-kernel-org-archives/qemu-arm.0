Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp634892lfc;
        Wed, 11 Mar 2020 04:19:54 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt1QK+S6tfKVbPLt/7ySnB8f6zsjz3G7BA3mZTj1m5sXeTfzBy1eO9ZaCU7EyPxgQ0NM2c5
X-Received: by 2002:a37:b042:: with SMTP id z63mr2217505qke.269.1583925594082;
        Wed, 11 Mar 2020 04:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583925594; cv=none;
        d=google.com; s=arc-20160816;
        b=hzLR6TpzlRYdFZDCBPEhyMc800WesVLVJZ7qGHzw7/E3ncid+ThtU20qya/9df8kHV
         rsVoYBwrTJvSTMXf5hfCWIrc4fBlMyooAMw2WvwBPJzMrTFV73Z0orZqPwaoVyjGb1FN
         NVWQlL15uSl5aYxmSZTbZU/mZBpKGUXDtmISfXQPLSDDAH4ILF/ei82pitM56J/5BoxW
         59/L6e+UsJZyfpdGHOAxm/9X3Wth1WAdbWuK1oYvFJHGxA/yGF7l0vvAI2lhGzizoYTA
         RWc8P8GKuSQCUMG/CGlGa+8PI5cGPPUneWfCSFKI5LvIFdR5TYyoGW9VW2NJVihUl579
         +0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wzbTyy338OK9x1tC0UjkMEAOnkQjAtfB2xgpd8yYspE=;
        b=tA7IkUzT0FfRoIqjcTi3jzN1KgvE6dbB/brFKxX7qw+gcSvVHIdg9gFD4xeGhlNaoP
         gFklavo7z4I0AjtYiSzms3hdfz83FxUjqYlmBAPMR+1N55dcNoKudQC+c+VKJl9AMbxI
         BpEkNStuBH0UOdZkKISHkpHwBLaXRSOXUQA5Fjfql3aQTOM6PfvQRdfx0GQqJIi/i5yv
         yntMkFdWjZhxqeY6GPmzO2rpInoMYWmtno0+FHWEa7KWgOgje7sK4XD/92NvHfuKyDLL
         Xxf+l6gLV14Ivqbvje1VDeX5c6Vn1HzrfdCO8gOCPAFOVJq8tYJtvBNnleZTlGL+oFSc
         YOgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="KRA5/ySy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a25si789706qtw.111.2020.03.11.04.19.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 04:19:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="KRA5/ySy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBzOz-0006j5-IF
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 07:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55687)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jBzMH-00022z-0w
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 07:17:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jBzMF-0000iD-Q1
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 07:17:04 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50982
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jBzMF-0000he-MM
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 07:17:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583925423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzbTyy338OK9x1tC0UjkMEAOnkQjAtfB2xgpd8yYspE=;
 b=KRA5/ySyjgeCvjnAENiv/QlCvhTviH+3neC8oza8gTlDixCY8kBhQ/x2KW+3HZJpYao7gE
 P3Ojf1utDoPZPkO35QaFL5SUHa2wEdSs+KjqLG6ApofLyuDZN66UMlIe/3QxNz/2xf3cLf
 I01rgVgFUPv1kk9HJpNrYKub7PUfhB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-tPb6PKEVPIaaCF9Ku1jpsw-1; Wed, 11 Mar 2020 07:17:01 -0400
X-MC-Unique: tPb6PKEVPIaaCF9Ku1jpsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88EAC107ACC4;
 Wed, 11 Mar 2020 11:17:00 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A86A91D91;
 Wed, 11 Mar 2020 11:16:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v4 6/6] hw/arm/virt: kvm: allow gicv3 by default if v2 cannot
 work
Date: Wed, 11 Mar 2020 12:16:26 +0100
Message-Id: <20200311111626.5705-7-eric.auger@redhat.com>
In-Reply-To: <20200311111626.5705-1-eric.auger@redhat.com>
References: <20200311111626.5705-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: maz@kernel.org, drjones@redhat.com, richard.henderson@linaro.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PBmONwo+Mo25

At the moment if the end-user does not specify the gic-version along
with KVM acceleration, v2 is set by default. However most of the
systems now have GICv3 and sometimes they do not support GICv2
compatibility.

This patch keeps the default v2 selection in all cases except
in the KVM accelerated mode when either
- the host does not support GICv2 in-kernel emulation or
- number of VCPUS exceeds 8.

Those cases did not work anyway so we do not break any compatibility.
Now we get v3 selected in such a case.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

---

v3 -> v4:
- Deal with the case where v3 is not supported by the host and
  the number of vcpus exceeds 8

v2 -> v3:
- add ()
---
 hw/arm/virt.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f5ff2d9006..6becf9aaae 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1543,6 +1543,8 @@ static void virt_set_memmap(VirtMachineState *vms)
  */
 static void finalize_gic_version(VirtMachineState *vms)
 {
+    unsigned int max_cpus =3D MACHINE(vms)->smp.max_cpus;
+
     if (kvm_enabled()) {
         int probe_bitmap;
=20
@@ -1583,7 +1585,20 @@ static void finalize_gic_version(VirtMachineState *v=
ms)
             }
             return;
         case VIRT_GIC_VERSION_NOSEL:
-            vms->gic_version =3D VIRT_GIC_VERSION_2;
+            if ((probe_bitmap & KVM_ARM_VGIC_V2) && max_cpus <=3D GIC_NCPU=
) {
+                vms->gic_version =3D VIRT_GIC_VERSION_2;
+            } else if (probe_bitmap & KVM_ARM_VGIC_V3) {
+                /*
+                 * in case the host does not support v2 in-kernel emulatio=
n or
+                 * the end-user requested more than 8 VCPUs we now default
+                 * to v3. In any case defaulting to v2 would be broken.
+                 */
+                vms->gic_version =3D VIRT_GIC_VERSION_3;
+            } else {
+                error_report("host only supports in-kernel GICv2 emulation=
 "
+                             "but more than 8 vcpus are requested");
+                exit(1);
+            }
             break;
         case VIRT_GIC_VERSION_2:
         case VIRT_GIC_VERSION_3:
--=20
2.20.1

