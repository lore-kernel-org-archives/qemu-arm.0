Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4644669wre;
        Wed, 30 May 2018 04:48:56 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJLS41uKiTxHCNSqisgw5ZJdZ342qwcuUQQBjYvQKft2l6bR8u3WZuQYRyWF7KfMEFfnMKK
X-Received: by 2002:ac8:5208:: with SMTP id r8-v6mr2087895qtn.102.1527680936876;
        Wed, 30 May 2018 04:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527680936; cv=none;
        d=google.com; s=arc-20160816;
        b=czEfbS9TAZQgbI/aOXPurcges+optz5iv1b/SBnT7PNrfEHlfhC8d11ThKp/M3jYxC
         nkCfESuX0jE+wat0r/1d0LB9oI/fRGzm6NL4mJgJRo3bbr+znkZUb0XdS7whp8R5PFGj
         ScJBLuQfzvoqAc0aXNlqAbgpduhG+KdVJPe3JIlGpe+0vwmaK1pcXFqBVdVy/BCE2rjY
         NPtjHV63Oyu2kTrGVi+WkS90j/AB1IZ7k+ViHhhGNtO6CCGjLvp8hDe5yoGRNKSGNgZ9
         8DUSIhF8foif2i7v3VNfInq435kIQtjy5/7ecr8uXnTqnh57LUCR3XpyB7zwkQgHz+ES
         xBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=HbMr9fs2it5NcuZMCLZBUkBCWpvHa/xckQNztkCRRVo=;
        b=twxARApFxGYY3QSwV9QJf24ias1Xi8Hfqs4tpEmtwc0x4pDUJzeBstfkEPR6Izg7l8
         nl6JxPLzx/g5nIxRUpiOVQTlKTku1SKhQN2MTyzkXpyKOK6BRgnCPvOsh++Lqop1/dnw
         SE5tnINMPZfZGkWkW+nNDfLNIwC0Eh+CVJdBhjz5XgPArDztTTFfkcKr1Ow19esDR/xO
         ryh7jb7kfk1VbzMuEx9Bmd605C8cHWRuASIUp+0hGHclKUADYb88NptKoVJ54ocZGG47
         O5jKU/2iJ/V6eVW9gzsy6xUFlg3m8IgzGqbBu+D8PT9ssb06zDyYQvpdTpqOPvz79r9p
         3TLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c185-v6si2688166qkf.135.2018.05.30.04.48.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 04:48:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNzb6-0006Rw-9S
	for alex.bennee@linaro.org; Wed, 30 May 2018 07:48:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNzYQ-0004w7-52
	for qemu-devel@nongnu.org; Wed, 30 May 2018 07:46:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNzYP-0005Ew-C5
	for qemu-devel@nongnu.org; Wed, 30 May 2018 07:46:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38306 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNzYL-0005Cb-IG; Wed, 30 May 2018 07:46:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FEA5BB40D;
	Wed, 30 May 2018 11:46:05 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C0D010EE6C1;
	Wed, 30 May 2018 11:46:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 30 May 2018 13:45:39 +0200
Message-Id: <1527680741-2725-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1527680741-2725-1-git-send-email-eric.auger@redhat.com>
References: <1527680741-2725-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 11:46:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 30 May 2018 11:46:05 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC v3 6/8] hw/arm/virt-acpi-build: Advertise one or
 two GICR structures
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marc.zyngier@arm.com, wei@redhat.com, drjones@redhat.com,
	christoffer.dall@arm.com, zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fKxNmdG4Nfxj

Depending on the number of smp_cpus we now register one or two
GICR structures.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt-acpi-build.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 92ceee9..6a4340a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -660,6 +660,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     if (vms->gic_version == 3) {
         AcpiMadtGenericTranslator *gic_its;
+        int nb_redist_regions = virt_gicv3_redist_region_count(vms);
         AcpiMadtGenericRedistributor *gicr = acpi_data_push(table_data,
                                                          sizeof *gicr);
 
@@ -668,6 +669,14 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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

