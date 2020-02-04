Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4687342lfp;
        Mon, 3 Feb 2020 17:46:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqw3qJuUmezztROTDUcU2vstP3w8cm5ZZU3xAsKzExVlsNq4LbbngS8kbAKG5gA0AVuP1ZxO
X-Received: by 2002:ac8:6b4f:: with SMTP id x15mr26183252qts.152.1580780813627;
        Mon, 03 Feb 2020 17:46:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580780813; cv=none;
        d=google.com; s=arc-20160816;
        b=BMxQYoqhXWpRBUPaIVsBAF5cnL8NwHDZSrLldqCxP3l4tq8Mxw3WDGlHAzCaKyGb97
         52lMfRPPXCOeMy2l7qNOgrqG7F36gj90hejOH9Hsxky6PH4gbWk1PU2ZvUBY8XJfY23E
         FHFcyZzo3nBZTVgyy5qCz3Jpfw+m/fWglNbMN7jf17/dpHsqTAFF49BHSwYmB1lOf51c
         0bp7MWBgs2dD0EJf4nr5xB/un2U8iMsJj6P7f8WqKzojOGCoWGJGPFzESH4Y1c47pd7p
         mJxtw7nhBveLj3/2wT0bT+KpfZm9bPOuTW8rzHtNhthe0G4N8qKFVFUkiiZU+d5WNbWh
         QsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=rtkcskng1xPzmKflqCWtgxFbgEp8sIdX4VtunTCD6Wc=;
        b=lUP0cm6MoLD4XGQmockparL9ULgFMGmWK/o0b8yQvQR7MKJAgtkfiPN2SlhaLG8e2a
         07IA4vubsQQdPwZlhCXd4kkyx+kI1mDzepG2fnss+JcMOZQdyjgCX0VY2VHRLGQ8txQQ
         RuEnJVB9kqScMzMnEpVcYoRIz/Pf0y9EoYDjqBp1QoeLnJZrI25vhfk+56FbDrt3IiYs
         wdqXB846Ookpq+KpzLyL71RiqYGMvpskJURbnmtzlsjTuHnVFHb+akcwb8Tdli7gLxyx
         F/uIm8NkgCkffgdS7RfhDUsJzTpkaJlN9VE/Gll4WenRgi6PFeSXMMZ69feH9YyGV3hh
         ybwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n54si12416230qtc.117.2020.02.03.17.46.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 17:46:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iynIi-0007ks-Vd
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 20:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iynIK-0007hn-Jt
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 20:46:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iynIJ-0008Ej-K6
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 20:46:28 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:51382 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iynIJ-0008BH-8z; Mon, 03 Feb 2020 20:46:27 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 57142B7A43C912B2C2A4;
 Tue,  4 Feb 2020 09:46:25 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 4 Feb 2020 09:46:18 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 5/7] arm/acpi: fix duplicated _UID of PCI interrupt link
 devices
Date: Tue, 4 Feb 2020 09:43:23 +0800
Message-ID: <20200204014325.16279-6-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200204014325.16279-1-guoheyi@huawei.com>
References: <20200204014325.16279-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
 qemu-arm@nongnu.org, Igor
 Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2xMQ25qaqn69

Using _UID of 0 for all PCI interrupt link devices absolutely violates
the spec. Simply increase one by one.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 5d157a9dd5..f3e340b172 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -189,7 +189,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
         uint32_t irqs =3D  irq + i;
         Aml *dev_gsi =3D aml_device("GSI%d", i);
         aml_append(dev_gsi, aml_name_decl("_HID", aml_string("PNP0C0F"))=
);
-        aml_append(dev_gsi, aml_name_decl("_UID", aml_int(0)));
+        aml_append(dev_gsi, aml_name_decl("_UID", aml_int(i)));
         crs =3D aml_resource_template();
         aml_append(crs,
                    aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIG=
H,
--=20
2.19.1

