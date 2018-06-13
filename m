Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp403729wrq;
        Wed, 13 Jun 2018 01:49:27 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIOeYAyOBMkplvHqvIeCkBHfFJ0Zl/5ol5/dtG3K3FUvInAacAVjrayelyFIaQlRBU8iTMu
X-Received: by 2002:ac8:2d6c:: with SMTP id o41-v6mr3685267qta.107.1528879767481;
        Wed, 13 Jun 2018 01:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528879767; cv=none;
        d=google.com; s=arc-20160816;
        b=outK/Lysl6AIxsPLzEPUZ0+6XDNK8sjUpzeXNGciK/gBUc4uEmiRdq8Ye83AxOnmd+
         sxvGiaiVla0+RbEz1IsSB5+N2i8HwmPJCXOgkCH+bWdz8j16zTsdOuSJu4YDm36QysTw
         h1ihUquBoFflteqrmsFcjFPmVQVbV/gNtigHHtVw3cyUhdk5endc4Rb9XauZsOY1+sZj
         +6SE8kwMwv67FcmkPrXiu3q4nUc4KnReFxydG08l34sITjWRDYfloqn5O8BkdkwqrQKp
         abcqriKMDYyM5/zJOYA3JYvebzHlh+T5KcG/BpvVJZdInrh9gdaS5F2tjpW1T4bKeMUH
         gGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=KiG1nxuDp8zsyfU4JCd29fi0zu15T+buVBLDVMqdUA8=;
        b=GklClK/q1EeLJgUT4ENR/2d4s3CyBPpnXW5pn3zexmH9n1+6HnCYzFKYPoNbDYP+pL
         yI6VY4uY74izJH1OG1QJpSOvYO18D3VPsp/Yg9cVkXRNPE6wSDDW+LrCn9s8gUO0iUc0
         K1xeckaaN7l9AXY7zI73XUMKnJKmxj35SvbihBk0O5RdPtApdnlNJco39rHnaZCd1pc4
         wqy6y/tT3TgqcaB0NsJkmbooJzxVb03CNKoeevZrmQkjSqG5/Wxw/bnGpk6TU0cTOaYp
         Bcnit5WRaYICf37IdaNHMo/5jI2HxmBbjkAbcgJNH7GpV/hgN9WwjUWNjlHOPZaGrHRe
         gdPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c10-v6si2011979qvn.121.2018.06.13.01.49.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 01:49:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT1T5-0002Le-0k
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 04:49:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fT1Sm-0002F0-I0
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:49:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fT1Sl-0003uZ-OP
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:49:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46564 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fT1Sl-0003uA-Ih; Wed, 13 Jun 2018 04:49:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C54D818BAF3;
	Wed, 13 Jun 2018 08:49:06 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C38961116703;
	Wed, 13 Jun 2018 08:49:04 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 13 Jun 2018 10:48:40 +0200
Message-Id: <1528879723-24675-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 08:49:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 08:49:06 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 6/9] hw/arm/virt-acpi-build: Advertise one or two
 GICR structures
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	christoffer.dall@arm.com, zhaoshenglong@huawei.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h9qoz3A+SVPU

Depending on the number of smp_cpus we now register one or two
GICR structures.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt-acpi-build.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 74f5744..eefd1d4 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -670,6 +670,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     if (vms->gic_version == 3) {
         AcpiMadtGenericTranslator *gic_its;
+        int nb_redist_regions = virt_gicv3_redist_region_count(vms);
         AcpiMadtGenericRedistributor *gicr = acpi_data_push(table_data,
                                                          sizeof *gicr);
 
@@ -678,6 +679,14 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
         gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST].size);
 
+        if (nb_redist_regions == 2) {
+            gicr = acpi_data_push(table_data, sizeof(*gicr));
+            gicr->type = ACPI_APIC_GENERIC_REDISTRIBUTOR;
+            gicr->length = sizeof(*gicr);
+            gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST2].base);
+            gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST2].size);
+        }
+
         if (its_class_name() && !vmc->no_its) {
             gic_its = acpi_data_push(table_data, sizeof *gic_its);
             gic_its->type = ACPI_APIC_GENERIC_TRANSLATOR;
-- 
2.5.5

