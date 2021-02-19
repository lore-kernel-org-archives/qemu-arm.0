Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8950191lfc;
        Fri, 19 Feb 2021 03:47:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzs0nldKCSvAxij0nKkbSUgchXwAK92t3m1BNZPAGmUSVwBHUx+pBN8ok5H07DYalvasfte
X-Received: by 2002:aa7:c7c8:: with SMTP id o8mr8762805eds.137.1613735259997;
        Fri, 19 Feb 2021 03:47:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613735259; cv=none;
        d=google.com; s=arc-20160816;
        b=h93QQAIz4cdsuiLIXUmTTF6rhNJGWRfzo7fwi+pbXY+rOMNk2YZzMZzhyuqHvTfoX8
         myKnnBMW6bb5zZ6Hq8gasfi2BkzYqRp4Qh/Od2F9IMCV6fnJyHkpWaz/Y1Ut7GvoE6vb
         RqRA7AEZ9C/Dt+GA1mj0dX6CtRZBnuDQnwdXoURKkIrqt4nHfxxNboQNinCpiUI34GoI
         8QeVY9fRKMnAoq7f8ZJyLsZl0R1VDOEj8gSADIT2U4Nqw3RaOPE6X/E2BTrXKSUnRxjw
         yc7NK3vvK15EimyhRDEQJM88nhUVEDI8lX/aNFnDtnFiKim9GdhTVgGzkzMMJT39xnJd
         ow0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=H2sRdB0zIoimpAVT57VzO2FhLqlcfJwpEUsEldtsV6E=;
        b=mHV+qj5ucxA/l6/4VDDGQ7xkQSlVkDI1jcSpDMY43VaIWfh8FoEipFhVkDhR92aYLv
         tlDzwyn5hUs3gtpA7WEXoUlpTxQLAzwrw61BfXL2uE4sNYZwAePLhgtRp5O06zGLnMZ3
         CEgIU/Wn0RTAu1NUiEmFhh1EXAvatMrX4kfmKDoITG/3ljYaGci47mGMh6NYyYVrh+0b
         3MG21cemANfP9wuqyyxtVgZ1Dz/XxDLYW5i9DMQm9OV47i/1O+7hfg2IURb87Q5q39Gz
         Ej9QIogWMk6HlTjG4l3Oumgeap5IH8E8M7V/o1Gz4uzRRAHSs1IpzIcFz62fuuqL2+xo
         ge4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IVI8idI2;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id o9si5797236eju.695.2021.02.19.03.47.39;
        Fri, 19 Feb 2021 03:47:39 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IVI8idI2;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbhBSLqU (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 19 Feb 2021 06:46:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42128 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230308AbhBSLqS (ORCPT
        <rfc822;kvm@vger.kernel.org>); Fri, 19 Feb 2021 06:46:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613735092;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H2sRdB0zIoimpAVT57VzO2FhLqlcfJwpEUsEldtsV6E=;
        b=IVI8idI2fOPiXQUalz6tx4ri9bh3BpVsrs5TkY5kOtoJsVlGKpdUXTt9vp5DXYuKB2jNTm
        GUXCw798T8kPYurSAh9ONiwDts6M6wsIReYmnq2AOz6z9AboKrwe0ThDzQ4BLlcsvXopGp
        JsPTQYEXLV0S4lHoVXy0cPkp2h26BH8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-CW7A2RPpO5OXEHJLtsDUBg-1; Fri, 19 Feb 2021 06:44:50 -0500
X-MC-Unique: CW7A2RPpO5OXEHJLtsDUBg-1
Received: by mail-wr1-f71.google.com with SMTP id e12so2321142wrw.14
        for <kvm@vger.kernel.org>; Fri, 19 Feb 2021 03:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H2sRdB0zIoimpAVT57VzO2FhLqlcfJwpEUsEldtsV6E=;
        b=e1OpBO21FaqsRTHJlqGYXWHwXXEP5kgxFgC/3kdcH9Vn3UkmBL0a1gPYSPtKSLtWXw
         I5anIX13P/qQVU3MBUEw2AIu4KDKGpzbeKiUEOYWYoNBbW8NQuhodduCaZPBxU54b7QH
         QdaJd8A0PTPFMSED4KJatVy1xbCXQYJ6GCFJjjMltZEBcm3otlpOtiskRf/Q65ysXxE0
         v8SIIAIC/lSIHvIWSXhk5eB2eKsBwEm6WKEtY+OW9dcVm0zUkAKdSnyrc/EdxJjYLeYF
         QvqKBgvATANyELprH20PiSNsoCBge11KfuKMJUx89xh133sv9I6hKgeeUmVIW3qwHBBO
         2weA==
X-Gm-Message-State: AOAM530v1MV3ET7y3BYra/sRigWXpPVd/MoWTcf8TfKMzgA6z4laqnkO
        3yS4DbPilAQxPVBWo7PAcl68g+kkgUuEWRm1BUFFbDg+KEoUCY3O80zSaC7jLlaFMduSmmeK7dE
        +5NhB4QYp8yjZ
X-Received: by 2002:a1c:23c2:: with SMTP id j185mr7787108wmj.96.1613735089336;
        Fri, 19 Feb 2021 03:44:49 -0800 (PST)
X-Received: by 2002:a1c:23c2:: with SMTP id j185mr7787095wmj.96.1613735089135;
        Fri, 19 Feb 2021 03:44:49 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id z63sm11490157wme.8.2021.02.19.03.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 03:44:48 -0800 (PST)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     Radoslaw Biernacki <rad@semihalf.com>,
        Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
        Greg Kurz <groug@kaod.org>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        qemu-arm@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        BALATON Zoltan <balaton@eik.bme.hu>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Richard Henderson <richard.henderson@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Leif Lindholm <leif@nuviainc.com>,
        Alistair Francis <alistair@alistair23.me>,
        Thomas Huth <thuth@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
        =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        kvm@vger.kernel.org,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 3/7] hw/arm: Set kvm_supported for KVM-compatible machines
Date:   Fri, 19 Feb 2021 12:44:24 +0100
Message-Id: <20210219114428.1936109-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219114428.1936109-1-philmd@redhat.com>
References: <20210219114428.1936109-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: bEfVl1aPXuy1

The following ARM machines support KVM:
- virt
- sbsa-ref
- xlnx-versal-virt

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/sbsa-ref.c         | 1 +
 hw/arm/virt.c             | 1 +
 hw/arm/xlnx-versal-virt.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 9f707351531..6923b6e77ff 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -858,6 +858,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
     mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
+    mc->kvm_supported = true;
 }
 
 static const TypeInfo sbsa_ref_info = {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 371147f3ae9..7e3748b6cd6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2582,6 +2582,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
+    mc->kvm_supported = true;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 8482cd61960..fb623c0cd54 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -621,6 +621,7 @@ static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpus = XLNX_VERSAL_NR_ACPUS;
     mc->no_cdrom = true;
     mc->default_ram_id = "ddr";
+    mc->kvm_supported = true;
 }
 
 static const TypeInfo versal_virt_machine_init_typeinfo = {
-- 
2.26.2
