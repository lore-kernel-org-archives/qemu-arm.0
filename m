Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3990635lff;
        Sun, 8 Dec 2019 22:39:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqwir4ACLs4fiRi442Xj7h81+PrLc06Y5Cwv+qRH9pJvgvAqIvJWrHDIbR5cd7FaN2QLWrJq
X-Received: by 2002:aed:3c05:: with SMTP id t5mr17020287qte.270.1575873545046;
        Sun, 08 Dec 2019 22:39:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575873545; cv=none;
        d=google.com; s=arc-20160816;
        b=feBMYLGlNUsk/xR2BmwlQtHDFTmeIW6kBwl4ZRyzunzWraAmR0NCT7oYLA33OvIW1s
         t5tnlGscqKvT9gY/BWvB8LdgP3UjDB889ZwYUFEQiqUfdXur9Hz2enVn1iHIXlBPQz3w
         0qgbSEoVh+WaJxKzSlH3ahi8bLR6584uLLhB9RqqhjYNwdTuUfhb2N3E840+8fhTJ3Fn
         D1KRyIox6SHDczGVGuS4kc5V1fhIj9+jxbPn/A9LszHGFxGKq4T9G3r9T4bUGWdN8RhQ
         GbsCrFHnFLUuSiQXI2AQLxXISQHcGiM01nwpsBNAAxgIDMG8prbu6/aYUXL4I5w492i6
         4CvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=/TDo1IHwpvzJLEQB2h9ChlRCjdjmY2+HYcteNe/c0iI=;
        b=OUv8J6uWC5oVOsu/2M+W1RJMEtu2o3cY2zQ3Ga8eVf6hcA0E8nC5jlY6aDTiwu1n9M
         fXnKmZEXAo57X1JDsDomDOrZptv5Rj9z1fNvd/9BqtITg8ZRmUKMnd3EJUpAjXTgSefA
         3sXAFZR47Sctk6SvP8+7zAqdLYVbz9jrBtWoHgUyyQ8KOYSlxhLGE9HNEjHD7UQWjtKh
         +QwPUL+KUdEKOoTCq8WLAbicvPOYhky5oSs6oyilbLa2sbY9rjeRPdKX1QsdDiIUGwoC
         S0NFSvQkNDnUdWmODsnY0u197cMeXgX3uj3+vtS5AACaaaMpr9Ia22U+w/duMQKDhOea
         Tn8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si11687482qvq.12.2019.12.08.22.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Dec 2019 22:39:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieChE-0005Ui-EH
	for alex.bennee@linaro.org; Mon, 09 Dec 2019 01:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36116)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1ieCgz-0005KV-Ky
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 01:38:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1ieCgy-0004bS-B2
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 01:38:49 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:60988 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1ieCgx-0004aM-Vu; Mon, 09 Dec 2019 01:38:48 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A8D9E3A6E32C72004617;
 Mon,  9 Dec 2019 14:38:42 +0800 (CST)
Received: from linux-XCyijm.huawei.com (10.175.104.212) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 9 Dec 2019 14:38:34 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v6 2/2] hw/arm/acpi: enable SHPC native hot plug
Date: Mon, 9 Dec 2019 14:37:19 +0800
Message-ID: <20191209063719.23086-3-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191209063719.23086-1-guoheyi@huawei.com>
References: <20191209063719.23086-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gx1TpEtzAigS

After the introduction of generic PCIe root port and PCIe-PCI bridge,
we will also have SHPC controller on ARM, so just enable SHPC native
hot plug.

Also update tests/data/acpi/virt/DSDT* to pass "make check".

Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Heyi Guo <guoheyi@huawei.com>
---
 hw/arm/virt-acpi-build.c          |   7 ++++++-
 tests/data/acpi/virt/DSDT         | Bin 18462 -> 18462 bytes
 tests/data/acpi/virt/DSDT.memhp   | Bin 19799 -> 19799 bytes
 tests/data/acpi/virt/DSDT.numamem | Bin 18462 -> 18462 bytes
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 51b293e0a1..bd5f771e9b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -267,7 +267,12 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemM=
apEntry *memmap,
         aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
     aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
     aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
-    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1D),
+
+    /*
+     * Allow OS control for all 5 features:
+     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
+     */
+    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1F),
                               aml_name("CTRL")));
=20
     ifctx1 =3D aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
index 05bcfc8a912f58f266aa906563ea01c24906717e..d0f3afeb134fdf1c11f64cd06=
dbcdd30be603b80 100644
GIT binary patch
delta 28
kcmbO?fpOjhMlP3Nmk>D*1_q{tja=3D*8809zbbW3Ff0C~9xM*si-

delta 28
kcmbO?fpOjhMlP3Nmk>D*1_q|2ja=3D*87-cu_bW3Ff0C~j-M*si-

diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DSDT.=
memhp
index c041a910fdf272cb89263bb636239ae3a5e1708d..41ccc6431b917252bcbaac86c=
33b340c796be5ce 100644
GIT binary patch
delta 28
kcmcaUi}Cs_MlP3NmymE@1_mbija=3D*8809zbbeqQp0Eq|*2mk;8

delta 28
kcmcaUi}Cs_MlP3NmymE@1_ma@ja=3D*87-cu_beqQp0ErX{2mk;8

diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/DSD=
T.numamem
index 05bcfc8a912f58f266aa906563ea01c24906717e..d0f3afeb134fdf1c11f64cd06=
dbcdd30be603b80 100644
GIT binary patch
delta 28
kcmbO?fpOjhMlP3Nmk>D*1_q{tja=3D*8809zbbW3Ff0C~9xM*si-

delta 28
kcmbO?fpOjhMlP3Nmk>D*1_q|2ja=3D*87-cu_bW3Ff0C~j-M*si-

--=20
2.19.1

