Received: by 10.223.159.74 with SMTP id f10csp5779206wrg;
        Wed, 13 Dec 2017 18:01:47 -0800 (PST)
X-Google-Smtp-Source: ACJfBothTMu0muixSsQYx2Ny43T3Q15XQoLUETE9XQItYdlhIUqfqlQuxbhDUTOVFw8fm1ax9hXI
X-Received: by 10.13.238.194 with SMTP id x185mr3107116ywe.243.1513216907877;
        Wed, 13 Dec 2017 18:01:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513216907; cv=none;
        d=google.com; s=arc-20160816;
        b=04evpgTuvLLqZ9Y5lov+3ZXlSpwlt92K2Dlj0RZIi1SMXBBbizpoquOkqRTc9EFR5g
         UJqRWbn4trq4MmyXcb70bSmVng0JPvJKaxfANNv+k8ELXkP6w2tT4Wmqm/aCQH9k7I2c
         ael/LvO9299zisKAo6NFGDkJMSXU3p8LB8CEkMey1FcSRSOphw3lTr+5ZPVzpCQq0Uln
         1yg3PyipUpkkasdqicdVoh3qyTOAKzZhi15LKj+WxVQbGTrxxdYUH3GyYfTeOvxIJt+U
         yEvHPnnZfNe8bh8t+lLDFoCYh2NPtIiUM6UHil2ieJWNC6EsPZ4WJZyhAIQLEI0XUoYD
         PrOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=2TYkBN6gDT6e8qB2laVOvmWLo76x1KqvDILTOff3xfo=;
        b=gXJh7jP2uME+vSiABR4ZzyU3X9xEQMPbZTnh2Cpf8VCqgW8dy/m3G6jnKoRk3VMVe+
         kZyI+iKaip0xlZzChKNIv6imIF0QefWvqCMGwIir60vIQUJJcbTku75ZsMmZmmlmykpl
         /MRR6juXoPIy5iC4TKG8YI24LHCMRrvka7OxtLk5xYZNXqUXgPZHFFKpvw+kgxLyJbK6
         SUwCPG7kM4dmDU1ImtDoeDuOsHnQXHAgUBoXU7LmjACv0vpWyOuIXGYnFawxH0XqVlO0
         hZsBSWV5y50RdMmnzzyKxXff51yoCSONLAa0ZG1DXbFMts/eXkA1/anOFe1bj7qYvuOa
         rl5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=skV6HKcB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a65si602808ywg.634.2017.12.13.18.01.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 18:01:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=skV6HKcB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38729 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePIqJ-0006Ol-7m
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 21:01:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIpJ-0005iN-3t
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 21:00:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIpI-0003QG-0H
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 21:00:45 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:46526)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePIpF-0003Mi-An; Wed, 13 Dec 2017 21:00:41 -0500
Received: by mail-qt0-x242.google.com with SMTP id r39so6174446qtr.13;
	Wed, 13 Dec 2017 18:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2TYkBN6gDT6e8qB2laVOvmWLo76x1KqvDILTOff3xfo=;
	b=skV6HKcBPZt7/pYAKBbHVGzlzlu1xiaM2C4khPhLovy3Sfx/ihyd21RZVLShGJMf3k
	iiIN55U6c8zBuHXqmSLXZpvI8o6VX4fgx36DrRO7S+YKGBL0mLtz8n6oP0J9M1wduB6M
	juFUjvTaK6aGu0yZOG5ErZHAElJIZ1CTUMpoA7dervvWAYVcSA60KIYazI1NiqHNL1pT
	ebg+AdLz8EqmdYt3AGsZKNhTco0JPmOcNMwNq588724/PeLBCKG+pr+LnIifEAtmdxGJ
	DqL2z8J0mFwUBihM7G2113XbyvOwTJn3+OUSDh4v22fRPdHuMoeg1taDYTnKS5Ili9Cu
	p7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=2TYkBN6gDT6e8qB2laVOvmWLo76x1KqvDILTOff3xfo=;
	b=hspKm+0ahIeh/TBow30pW93MwveNWTFUsjpH95+9hzekYbifeOe1ElG/nSuyWc6a/R
	ZmFShnfqckL2pMfca53GRbJA89PdTsDWRslEZcjwvRMlXfmCeNQo04oWIBi/xv22ZkPI
	rdLmrX2COjT1Zr5v1vhpOOsHmkRkXxrXs562kp//6S8ZvFzKgdJ9jioWOscOikG1LUeP
	XWFqw+XzYIdgLZNkQZthuEhJ2C8Wd7n9K6P2esiFo9Kr2yk9tnTT4jPTygVHxVr/w4wj
	7Qy+nzZMHc6wMVXimOubjLwYj//VC8lXM8T4u3NKBuQvTtrLTrFhn7HzoUjz0IGBh3fH
	w6ow==
X-Gm-Message-State: AKGB3mI269D3dFfFNFblBNlfaN97eLw0Qkqz/7ROH5qAUuJ5T4I+01CG
	9+JCza8kAsxDnQVXuT6YXls=
X-Received: by 10.237.58.67 with SMTP id n61mr14172887qte.171.1513216840656;
	Wed, 13 Dec 2017 18:00:40 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	n39sm1938120qtn.95.2017.12.13.18.00.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 18:00:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Wed, 13 Dec 2017 23:00:18 -0300
Message-Id: <20171214020025.4004-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171214020025.4004-1-f4bug@amsat.org>
References: <20171214020025.4004-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [PATCH 1/8] sdhci: add a "sd-spec-version" property
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
Cc: Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZBIzF8ybWeLJ

default to SDHCI v2

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
I am not sure which real VENDOR is HCVER=0x24, we probably don't care.

 hw/sd/sdhci-internal.h |  4 ++--
 include/hw/sd/sdhci.h  | 10 ++++++++++
 hw/sd/sdhci.c          |  5 ++++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index e941bc2386..7e4a9d79d1 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -210,9 +210,9 @@
 /* Slot interrupt status */
 #define SDHC_SLOT_INT_STATUS            0xFC
 
-/* HWInit Host Controller Version Register 0x0401 */
+/* HWInit Host Controller Version Register */
 #define SDHC_HCVER                      0xFE
-#define SD_HOST_SPECv2_VERS             0x2401
+#define SDHC_HCVER_VENDOR               0x24
 
 #define SDHC_REGISTERS_MAP_SIZE         0x100
 #define SDHC_INSERTION_DELAY            (NANOSECONDS_PER_SECOND)
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 579e0ea644..f8e91ce903 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -88,6 +88,9 @@ typedef struct SDHCIState {
     /* Force Event Auto CMD12 Error Interrupt Reg - write only */
     /* Force Event Error Interrupt Register- write only */
     /* RO Host Controller Version Register always reads as 0x2401 */
+    struct {
+        uint8_t spec_version;
+    } capabilities;
 } SDHCIState;
 
 #define TYPE_PCI_SDHCI "sdhci-pci"
@@ -97,4 +100,11 @@ typedef struct SDHCIState {
 #define SYSBUS_SDHCI(obj)                               \
      OBJECT_CHECK(SDHCIState, (obj), TYPE_SYSBUS_SDHCI)
 
+/* Host Controller Specification Version */
+enum sdhci_spec_version {
+    SD_HOST_SPECv1_VERS     = 0x00,
+    SD_HOST_SPECv2_VERS     = 0x01,
+    SD_HOST_SPECv3_VERS     = 0x02
+};
+
 #endif /* SDHCI_H */
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index d8188fdc2a..d6145342fb 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -908,7 +908,8 @@ static uint64_t sdhci_read(void *opaque, hwaddr offset, unsigned size)
         ret = (uint32_t)(s->admasysaddr >> 32);
         break;
     case SDHC_SLOT_INT_STATUS:
-        ret = (SD_HOST_SPECv2_VERS << 16) | sdhci_slotint(s);
+        ret = (SDHC_HCVER_VENDOR << 24) | (s->capabilities.spec_version << 16);
+        ret |= sdhci_slotint(s);
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "SDHC rd_%ub @0x%02" HWADDR_PRIx " "
@@ -1263,6 +1264,8 @@ const VMStateDescription sdhci_vmstate = {
 /* Capabilities registers provide information on supported features of this
  * specific host controller implementation */
 static Property sdhci_properties[] = {
+    DEFINE_PROP_UINT8("sd-spec-version", SDHCIState,
+                      capabilities.spec_version, SD_HOST_SPECv2_VERS),
     DEFINE_PROP_UINT32("capareg", SDHCIState, capareg, UINT32_MAX),
     DEFINE_PROP_UINT32("maxcurr", SDHCIState, maxcurr, 0),
     DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_quirk,
-- 
2.15.1

