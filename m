Received: by 10.25.0.6 with SMTP id 6csp1490035lfa;
        Mon, 29 May 2017 10:38:31 -0700 (PDT)
X-Received: by 10.200.44.101 with SMTP id e34mr20752922qta.146.1496079511644;
        Mon, 29 May 2017 10:38:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496079511; cv=none;
        d=google.com; s=arc-20160816;
        b=kGZ0fPAXppWvi8VeUmYQyriyffxZoM321cxOyijiqPzbobW9KQ3pjc+hvEYNCTwGUy
         MA4ITxFR1hib+C+WAPAE/uQkdRH1zn3yR146VCJbpPfHC1H59T2AYOj/+m1iH+YlYmhH
         EGP2XNYwpCGRhwdMjVC3m4IkYlyKcm/FhZ61udWDLdVBck1qcaDON/iokQOrKVdQfXZK
         RwDR9noeuBlpjFOqxnX4QeAGjOZ8mM5PP0McaCFLpoE2dF6Fy7XO+Bw7ljGOyEKJJ2TC
         J70s/OH0aDlTidpyZFJS5Kxd36JosZo1OUMad01jIA7TJN1EkbiMJ2niqfLbynEZWHe1
         INsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=CnskKJkTqDroWhkwnXYc3yCEQ6v6XBNFE7BA7MMDKC8=;
        b=eD0I3QD9jM7PJFl0hmA4VFUnqw52UERNjJhZzJS1nk+emXyIkP3dzs/QufYGH59yL/
         hWZZ/VUjc11gYrx3N1FKY06D2P3j/4XAj6MSbCbnAVhoNgh94pvgSFsCza7X81AU9iSO
         oIIkxrM331AYLETLWGFgarTifxyky0ffjCHIjKXJOa7iy8WijZER5oUSnTyS5l9eoN+g
         /pxPYkCm+grtQ2/caddlmx3C38J7g31i5U0/4mSQYwSuqmWWFmTtCPe4/fn3cNDpila6
         mxmFVnTVcREe/TaOJVdUx9p1PsYbFFY741LTH4YBJ1Y7yjFgL5u5b/PG7qhHHO/ehgVe
         5z6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a138si9984472qkg.202.2017.05.29.10.38.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 May 2017 10:38:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49808 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFOch-0005je-24
	for alex.bennee@linaro.org; Mon, 29 May 2017 13:38:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dFOcC-0005KF-W4
	for qemu-arm@nongnu.org; Mon, 29 May 2017 13:38:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dFOc9-0002Nz-Hf
	for qemu-arm@nongnu.org; Mon, 29 May 2017 13:38:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54104)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dFOc9-0002Nk-BL; Mon, 29 May 2017 13:37:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2437CC057FA7;
	Mon, 29 May 2017 17:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2437CC057FA7
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 2437CC057FA7
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB27017A9B;
	Mon, 29 May 2017 17:37:54 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 29 May 2017 19:37:50 +0200
Message-Id: <20170529173751.3443-2-drjones@redhat.com>
In-Reply-To: <20170529173751.3443-1-drjones@redhat.com>
References: <20170529173751.3443-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 29 May 2017 17:37:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/2] hw/arm/virt-acpi-build: build SLIT when
 needed
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
Cc: peter.maydell@linaro.org, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fMZZuq+fnitm

Cc: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt-acpi-build.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e5852067f5bd..2079828c22a4 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -776,6 +776,10 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     if (nb_numa_nodes > 0) {
         acpi_add_table(table_offsets, tables_blob);
         build_srat(tables_blob, tables->linker, vms);
+        if (have_numa_distance) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_slit(tables_blob, tables->linker);
+        }
     }
 
     if (its_class_name() && !vmc->no_its) {
-- 
2.9.4

