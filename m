Received: by 10.223.159.74 with SMTP id f10csp7096300wrg;
        Thu, 14 Dec 2017 19:25:01 -0800 (PST)
X-Google-Smtp-Source: ACJfBoumHJe3LsyecFvkaAInU1SLaWk0svJ9KRx2XsMxdz6Tyopfs+IFJlfC0QBzSMVpR9cr8j3E
X-Received: by 10.37.95.3 with SMTP id t3mr5992909ybb.196.1513308301146;
        Thu, 14 Dec 2017 19:25:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513308301; cv=none;
        d=google.com; s=arc-20160816;
        b=qAdWp8vHakdIjfR4ZQOhVvIdYQL2NHskC06R8mssd+V4MylPT4jrk/Qb7djJJoWCij
         dAjZ7qmVfM4mMlv5/j171WtL+jPam/KAMqcyMIDjnpSym7QO9CzqU2l0QgSaA10M0U/Z
         G2I2qP4tk8mvut9Ko0i8/D6uIPIQH48M0ZMl1aDEP+x765eDm4xY3HDRL7jiC4fS1W4O
         YwI7b0IUfgJ+2oLghPVp110LfcXmwYvziFXhVfWofOXFMLiwD6qgzeXMNyBh1iXB1Zbe
         kPt0QTrMaAh2FKVwPzPdRVYNnyA4LkuRUyLflKysKlPBn0Z4sjM/qQOd9c2aaraNF6ks
         Aqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=k5MeoBTT3FYTMXMBqzQ0jBWymyUyjpp3SVXdf22CZxU=;
        b=LrfTVR6MCQpzr7KGDAprdaoq/DnFWvC3lO/VTPoJoipzZdq6cLWIaHlVU8BH6XgK4G
         /HiD7Dkl/IcQUzRM3PEKNCK0d6pIKmCF2VXY+kKeeYlm/s1XspniKCBJfk5OBhorNcY1
         w4XrxnOU7BjAqnjOSJgxjPYlnk20nGg6rmfQJrGJJ0oyvJBKMfJInUagko4NO7ajpZwN
         GkBojRWp77CY/eLb1mKsDRQ4EfOEPt1nfRZNpxdIwaDOPiR3kWkP+cPeqNG4Hn31uGSW
         XeWiuCKkAtcabnoRq+53Dz5Xe7t4DRt2IUw5xCcfsxQOl3LjghSL6a+RihBudiuXEhF9
         SIvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lTX/NWLc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g73si1140030yba.594.2017.12.14.19.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:25:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lTX/NWLc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgcO-0004oC-HM
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:25:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUp-0006J7-PT
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:17:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUo-0001fP-Mi
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:17:11 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:43032)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUk-0001ar-6f; Thu, 14 Dec 2017 22:17:06 -0500
Received: by mail-qt0-x242.google.com with SMTP id w10so10528589qtb.10;
	Thu, 14 Dec 2017 19:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=k5MeoBTT3FYTMXMBqzQ0jBWymyUyjpp3SVXdf22CZxU=;
	b=lTX/NWLcS6s6uFfImjXG/eGe9j9za/Aa+w3q+Tkv6pZ2SfJ6DcjkkErYdjFfZo3VdF
	SCCQeDNq2ShwlwolslIVmg5R2XNd0EyufIlLt3d3S6XXKjP47prb2l7i7X4XttT6Zs9F
	2pnCTTVLwyq6GcauWijfoXaSN85tSddn3WrtBgWhWmWX4Fme27wYvjbbnqLAR0J/z/z0
	JJCkMHmyPVgGfvEdsJvzDmQmaY1pIo150v+K1arrMV3YYk6E9WQexM6ENnKt5pWQ3d3l
	GstV2ZX1X4zUCroQ3auHRh07vnESM3oQI3ziN2lvV+ZD4c7pC652yBzPA9qn3jWogQPH
	xNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=k5MeoBTT3FYTMXMBqzQ0jBWymyUyjpp3SVXdf22CZxU=;
	b=IN/MyXxcIvh34/KGNP1ClziU7/029I4CibfZ2vfp2dmFKDI94s/2zWCAJAjY6V2BSN
	QZm2hNQGqbt0RhwhBd7BPxRBC3tNXRUXMueBknKCvyrDSbR8aj24AwRoAlbzCJW8LEwC
	4Cr9RJq3fpxKLS+1eMfFjAaEv/dZYQXp7UnCotyihuvB9//LaKwm8jJFDmDnxpW6o9Uo
	KzTNNu4t3TE/DQDhv011Vv798RJYTOQ9RZswLBsO5oz0Fuc4+28XiKA7jD61kUWoSILc
	flbSjtMyBy4G2p9jcuQSdTyBPoocSaYZt8FA6uIrU8np77FyCxod+PI+faaIR8q4MUZR
	gFLg==
X-Gm-Message-State: AKGB3mId50NiiEotOblU64BZj+NdktmcLN9VrQmSinfoFhDArrts2WiL
	aMFoX5A8K9F5vqYkyCrFc0I=
X-Received: by 10.200.28.44 with SMTP id a41mr20765568qtk.340.1513307825760;
	Thu, 14 Dec 2017 19:17:05 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.17.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:17:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 15 Dec 2017 00:15:41 -0300
Message-Id: <20171215031547.31006-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [PATCH v2 14/20] sdhci: add a "sd-spec-version" property
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gK/bC01IXuYB

default to SDHCI v2

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
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
index a8ffac9dba..68f5902cdf 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -89,6 +89,9 @@ typedef struct SDHCIState {
     /* Force Event Auto CMD12 Error Interrupt Reg - write only */
     /* Force Event Error Interrupt Register- write only */
     /* RO Host Controller Version Register always reads as 0x2401 */
+    struct {
+        uint8_t spec_version;
+    } capabilities;
 } SDHCIState;
 
 #define TYPE_PCI_SDHCI "sdhci-pci"
@@ -98,4 +101,11 @@ typedef struct SDHCIState {
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
index 64a9b26e0d..926f6d1958 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -927,7 +927,8 @@ static uint64_t sdhci_read(void *opaque, hwaddr offset, unsigned size)
         ret = (uint32_t)(s->admasysaddr >> 32);
         break;
     case SDHC_SLOT_INT_STATUS:
-        ret = (SD_HOST_SPECv2_VERS << 16) | sdhci_slotint(s);
+        ret = (SDHC_HCVER_VENDOR << 24) | (s->capabilities.spec_version << 16);
+        ret |= sdhci_slotint(s);
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "SDHC rd_%ub @0x%02" HWADDR_PRIx " "
@@ -1290,6 +1291,8 @@ const VMStateDescription sdhci_vmstate = {
 /* Capabilities registers provide information on supported features of this
  * specific host controller implementation */
 static Property sdhci_properties[] = {
+    DEFINE_PROP_UINT8("sd-spec-version", SDHCIState,
+                      capabilities.spec_version, SD_HOST_SPECv2_VERS),
     DEFINE_PROP_UINT64("capareg", SDHCIState, capareg,
             SDHC_CAPAB_REG_DEFAULT),
     DEFINE_PROP_UINT64("maxcurr", SDHCIState, maxcurr, 0),
-- 
2.15.1

