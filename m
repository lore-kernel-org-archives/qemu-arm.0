Received: by 10.28.71.27 with SMTP id u27csp1913076wma;
        Thu, 22 Feb 2018 04:44:41 -0800 (PST)
X-Google-Smtp-Source: AH8x224RHl34IUrQZ/pe7deX+U/OCjP8WBwqNNSH7sSpGm8EqMPMnBRJS/ubu8ZeweDx2QYaQ64k
X-Received: by 2002:a25:cf55:: with SMTP id f82-v6mr4496476ybg.116.1519303481699;
        Thu, 22 Feb 2018 04:44:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519303481; cv=none;
        d=google.com; s=arc-20160816;
        b=NM9wt+FLlEJjp3GGNF1uA7hjKjdVeuWOWXM5xowuMaORppuahI9z4ucITFPDxXYRSz
         BE+zANM/7g/YZ/KAzh03Yz57Pf0qrTok3YO3exByzL/NC3lo0y2HwgxNlF++pEYD9rTe
         XA+Nzxlc/DIJzDSjsBKLdir3r3VbTRtljuVEVnxxnFb8iTXgWwkJP1VxCi/maxKO6bDE
         4KvqZLhM5/HwJMEwyey8QKlXsWcGjIz01+klCZ0ktxszJ1R2LtUv+l2W/3P9SHcwrZvp
         Fiie+wA4DDb8k2bUdCmOK5odFzdHgC3pBV8krYJf7BlE7PneDyX+tUcya/zNTN+XTnp8
         zVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=/Hyt0oF53VVvMva3aq7wwA1KO82FMTcv12xFFOO39JU=;
        b=M603BacZWy1qhec11iRRs/n1SsIEcg55km6hGhzy8J1cTdmXoXz9m8YgcFFcum0CDb
         uBNS91DG4nhxuz5CZ8FT3WloMwvn/nizd6pezfm3XjbbRMB4cY/Qgmei9q0fMb/eAZgx
         1UEn/cfz9mBz/pxeCkKtBf0kPQtXiqO3xuxu7dtkP3KmMmLOH/1g0U0Y9Q2fLUjUt3rY
         Wkfcm3qirvCODveAVOynUyI0bCOqPxHDdWNLEgZ0j9RHk4SnKez8pn6/wU9PJlyItYhD
         T/z7x0m4vKFo7GEsqCk6Ykkh7trjTqBZAoc4Q2ptIvfq2a512zpV28cJBSViuOIuxEKF
         VceQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id l77si2961489ybf.781.2018.02.22.04.44.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 04:44:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37769 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoqEr-0005YH-4f
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 07:44:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eoqEc-0005VP-RD
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 07:44:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eoqEb-0004w6-Sm
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 07:44:26 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44756 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1eoqEb-0004v3-O6; Thu, 22 Feb 2018 07:44:25 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47B0E40201A0;
	Thu, 22 Feb 2018 12:44:25 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 50DBF2024CA9;
	Thu, 22 Feb 2018 12:44:24 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Feb 2018 13:42:50 +0100
Message-Id: <1519303376-92875-4-git-send-email-imammedo@redhat.com>
In-Reply-To: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
References: <1519303376-92875-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 22 Feb 2018 12:44:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 22 Feb 2018 12:44:25 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 3/9] acpi: reuse AcpiGenericAddress instead of
 Acpi20GenericAddress
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b31T22wGy4po

Drop duplicate in form of Acpi20GenericAddress and reuse
AcpiGenericAddress.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 80c8099..9942bc5 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -40,18 +40,6 @@ enum {
     ACPI_FADT_F_LOW_POWER_S0_IDLE_CAPABLE,
 };
 
-/*
- * ACPI 2.0 Generic Address Space definition.
- */
-struct Acpi20GenericAddress {
-    uint8_t  address_space_id;
-    uint8_t  register_bit_width;
-    uint8_t  register_bit_offset;
-    uint8_t  reserved;
-    uint64_t address;
-} QEMU_PACKED;
-typedef struct Acpi20GenericAddress Acpi20GenericAddress;
-
 struct AcpiRsdpDescriptor {        /* Root System Descriptor Pointer */
     uint64_t signature;              /* ACPI signature, contains "RSD PTR " */
     uint8_t  checksum;               /* To make sum of struct == 0 */
@@ -167,7 +155,8 @@ struct AcpiGenericAddress {
     uint8_t space_id;        /* Address space where struct or register exists */
     uint8_t bit_width;       /* Size in bits of given register */
     uint8_t bit_offset;      /* Bit offset within the register */
-    uint8_t access_width;    /* Minimum Access size (ACPI 3.0) */
+    uint8_t access_width;    /* ACPI 3.0: Minimum Access size (ACPI 3.0),
+                                ACPI 2.0: Reserved, Table 5-1 */
     uint64_t address;        /* 64-bit address of struct or register */
 } QEMU_PACKED;
 
@@ -456,7 +445,7 @@ typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
 struct Acpi20Hpet {
     ACPI_TABLE_HEADER_DEF                    /* ACPI common table header */
     uint32_t           timer_block_id;
-    Acpi20GenericAddress addr;
+    struct AcpiGenericAddress addr;
     uint8_t            hpet_number;
     uint16_t           min_tick;
     uint8_t            page_protect;
-- 
2.7.4

