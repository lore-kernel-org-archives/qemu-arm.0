Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp3112187wme;
        Sun, 13 May 2018 07:39:17 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrejMwemRliDuybqsWYJOBV9JCdA6aD6Bx78W9i9bIajlPOVXh+fqvO+AZg0ww2lJ5JESfP
X-Received: by 2002:ac8:72da:: with SMTP id o26-v6mr5547232qtp.23.1526222357160;
        Sun, 13 May 2018 07:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526222357; cv=none;
        d=google.com; s=arc-20160816;
        b=qH/TrO+8o+W1PVueBjXeqjofh2YWsaR1EwSbQhSL9s4xFRCozzSv8ddUs5DtEFX4dW
         Un80jrnd3ILPV/OnNJGjShBgsGuBkbnCHt+rukLcgpTIZMqx/w+5404hmbX3GOKUd37c
         Y9YVkMt1JU1PasgJxWgvsiXOoy7xjcT7770vF34pFJJ8IzkAr8GRCuoosdqnD+n9RBHp
         4zxRpARa/2xWLim84mZR/BlHRJAMbvoI24at/Q0Oy0xDwjVGz05Kx6jil8HUyzSj0HAz
         tQM6fmtEKai8RRJa/MV/azHuydoLNq2BDbdiBSaZIzjfWekyxCC9I4WDXH9HZc/pzId0
         PpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=HbMr9fs2it5NcuZMCLZBUkBCWpvHa/xckQNztkCRRVo=;
        b=A4ENDKyso6k5U6BAp4VsEs800pnjWx+PMl4bMEONWPSzOvN2RiCMngf9Bg/OUfu+It
         8yuNwkOKrJ2n1G+pBEC4qd2BZ7AvxczyRl9IZKsBIJK8IdshJfxtwMOe6MqT7Z+SUDkl
         HzZ5/uErh+KRZFxE7Rt16Yicmb/Q3ScAuHtg91x04gfvI9zJePsUSVFga3I5drWY2FUj
         fkDVc9j6iQo1e8bbCvtGcxIUStgrd31X7WMU3WCLhE0jnZskysr+n1G0aqXcLax3BhxN
         qp1xCJBL0QV6hTWsEsVTWUq7ZKcd7TjGQlhh5w9YDjMImZ6FCbubvEc8YPxzT/eL1GTT
         RRGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g33-v6si3051240qve.160.2018.05.13.07.39.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 May 2018 07:39:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fHs9c-0002ss-JW
	for alex.bennee@linaro.org; Sun, 13 May 2018 10:39:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fHs66-000881-2q
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:35:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fHs63-0006S6-GI
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:35:38 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41572 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fHs63-0006Rq-CP; Sun, 13 May 2018 10:35:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E07E240704A1;
	Sun, 13 May 2018 14:35:34 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 59C568445F;
	Sun, 13 May 2018 14:35:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sun, 13 May 2018 16:35:13 +0200
Message-Id: <1526222114-5324-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Sun, 13 May 2018 14:35:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Sun, 13 May 2018 14:35:34 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v2 6/7] hw/arm/virt-acpi-build: Advertise one or
 two GICR structures
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
Cc: marc.zyngier@arm.com, drjones@redhat.com, christoffer.dall@arm.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W4ET6TyWJs3v

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

