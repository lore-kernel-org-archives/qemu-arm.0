Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp978506wrq;
        Fri, 15 Jun 2018 08:23:51 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKV4f3ikBtSBSIP1ORSDyj6ypM5gQxi6+OblOd7Pe4tUX111ngtO+AION0UqfhQGO6B23+j
X-Received: by 2002:a0c:90e1:: with SMTP id p88-v6mr1762842qvp.145.1529076231338;
        Fri, 15 Jun 2018 08:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529076231; cv=none;
        d=google.com; s=arc-20160816;
        b=cd4riDE6JlJCrNx7PDuB18dJsTQyJ7idrkx59KC8dfnVmLBTN07PQgo3JPvFW4YgIh
         DJ+/5Vw/K7oDK4BZiCoyepNHsxTYhsz4imneIg8ltN3HUU3gIHzRO9EoDltpWq0XvnxA
         fm/VVZDwmz2DuiH44BRzxrKO/Cs13fzp1dZnZibwYq9UsLC9++jmIrt0vLVH33/IhlbF
         Adu+TjxXN4zsWgK58u8r9wnf2o2XFgB/wn8rkogxHiZaklEHSZEWPHd8I0fOAYSjZ1ks
         Sya7emG/R9j4Z8EH3Ok6CDn9R8KOY4vkaevfOYqmddYbEuocMx6idRcCjnAOqUoA3ysj
         6QKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=3PecPucuWlbtO0xqU/GJSnsnMh/MAB28zshV/B+IG2A=;
        b=BsJOMKGF0vLHZ/CnYCtTxhCKBLJ7leWWZgrmCPYcOHu+9gRmAmvU4sJA4pQq9/r9xn
         ga2/NGV2kR4gVOx9h5nspvizlNy0n+xy4/D0OUJg5lE5hy5jkGzpSAm8/vQtSJfsxWwj
         sfnIMubd0YrtMFleMu0mNtE6jiC8nVuK/Rw6R1U8+ay4seiu1CpjgmB/qIMRmQ7oLPjm
         a1BcD3hYgY9lXzoLxiNB+MhsE04VqMCwwK/Rw8svDlO/9iDQptrZQD6QaUhijyPnfSou
         d8GxGB1VLNLfROD7z4fcSIduK1j5hzKBci4tF+GxvjRFpKkrh8WG9+gx4dMHTxn1Mp0N
         5xUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z23-v6si2751916qve.209.2018.06.15.08.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 08:23:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTqZq-0001sU-RY
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 11:23:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpie-0004au-AB
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 10:28:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpic-00014Q-NN
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 10:28:52 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55846 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTpic-00013w-Jy; Fri, 15 Jun 2018 10:28:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D204F68AB;
	Fri, 15 Jun 2018 14:28:50 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B9432026612;
	Fri, 15 Jun 2018 14:28:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 15 Jun 2018 16:28:25 +0200
Message-Id: <1529072910-16156-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 15 Jun 2018 14:28:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 15 Jun 2018 14:28:50 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 06/11] hw/arm/virt-acpi-build: Advertise one
 or two GICR structures
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
X-TUID: 3ZNzPmb/E9yd

Depending on the number of smp_cpus we now register one or two
GICR structures.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>

v1(virt 3.0) -> v2
- Added Drew's R-b
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

