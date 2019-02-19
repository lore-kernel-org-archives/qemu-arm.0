Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3377883wrx;
        Tue, 19 Feb 2019 05:01:28 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia3SVwdg/ug8/xaTaY/RKE0MY+NKVdfzjGZjVeKlzPnUNY94/Qu3XbavvK/y7YmZABRsAT4
X-Received: by 2002:a0d:df15:: with SMTP id i21mr23268833ywe.27.1550581288434;
        Tue, 19 Feb 2019 05:01:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550581288; cv=none;
        d=google.com; s=arc-20160816;
        b=Dy9RRGym7ZSc4caAPWF81EA22v3BsjLcZClsmZ5hv7YqosGUivttrJKSOtXs4JnBml
         S4qwCa8IALvU2a54IpmP9SWbbATO076Tsw0u1Jpt0PM55CpLJo+LXv+N6rWNhnxvs4ZF
         +8CiF/XAB6hk5m/la02iZLf93b+a+Tnh6zCiZiNMy2ybYtrZUMArVF3vY5iatUGQ6Ni+
         3JKoEoxhCuSl4yFOhd2aDvwqtmrSSsvwMC+c9VmzCbH3RXhnfq+2JT89GuS+ZF9ey+qw
         MrL2vI4R2y33wzgqa7eMea3xBvIYrp1Bqmd3DLEJyh6pg29TSuipJ7mzJrnPyPQ3KQbt
         ZVyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=iZHCSzTkSeN8DcccRbnTD25aOJeO0Zlug61irY5xm5Y=;
        b=LIjs9OY0t023od2tKC2D7tPqiA7NAhS+9u1UvoshqQQE1vNNgwCc8lcw0j5/jBkNHb
         zsBUNDtuDDoyHAMvTYe1US5ZZPymyA5zgEuxRMTIW3oWsXZ3FExlFEBFYf1In68S4jgg
         jvOPr6OEj6P7ty99FNyfcoaNyZWMgNT8Mkug1nWE4oOhac7dps49t39Kp7sTSI34UHYI
         nFRGSHNuEjA5aZlGtM2U9L6wveSF9fkgNvjdL811AXqUZjiOd4BeXO2HCyKQhvhs1sVi
         67g04a5qkAXpYFdps0igLu4uKRmESlnjj9JJDphIe5g7TE7ojq3rhKWrMX2aDtpa9nFs
         fAtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R18UcBLu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s141si9140031ywg.33.2019.02.19.05.01.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Feb 2019 05:01:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R18UcBLu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47809 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gw51b-0004aB-UH
	for alex.bennee@linaro.org; Tue, 19 Feb 2019 08:01:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw4yd-0001m6-US
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:58:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw4yZ-0002qw-Qe
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:58:21 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46617)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gw4yZ-0002q3-EB
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:58:19 -0500
Received: by mail-wr1-x441.google.com with SMTP id i16so13624230wrs.13
	for <qemu-arm@nongnu.org>; Tue, 19 Feb 2019 04:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=iZHCSzTkSeN8DcccRbnTD25aOJeO0Zlug61irY5xm5Y=;
	b=R18UcBLuW+SuT147FoUqm0L6wVhtjS5flqth3PgBXWX71RzO2HfFcU9YZtz23ilpTz
	8+ABH8FakWmLIK9LjjMjmNAdhk/0X7sNwc7GYI59MY5ZkMtSg0SGU8UbN5n2zC3gS5S3
	mhO6lqVHcUAMAJH2WN6LPQcbirAQV6SE0j47LalDutNH4W8gwEHnwyrlML3eoKPOLar4
	8v/Oys2yB2hcrehj8At+5+z2FuTigJ7zIUnB1RBXtoFfgQh9dkqatvQLQR7mMisBi2t4
	xF73pO+TKT/WYFw2kVkTOktkMESZvrH6yn62WahEeUNXu8VH39okjC4j5ssQL4flnU0B
	osEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iZHCSzTkSeN8DcccRbnTD25aOJeO0Zlug61irY5xm5Y=;
	b=s4XTbAifbXaVG/Uk6/lRSODyu23j+8Sm6tyFDWkoamiL11RwuFwvCb9mCvUCIeF+P1
	SrBWDj4sxJbm0+hWbqigeZY7HAxJqR8otDZgELHueHeTTsCnJYveyPVEv9iVfqd0EmS0
	w9fSpPcWTNcQ3nWljrlYv8KPQhLMK6pcvXPu0WUVK5CxbWx1x+E5tpAGeT7n5y0H70y6
	dXWJSHYsj9UJZBYhxF6yDem7OuT0Rws2J2xiE60bbpjdQY7w31U8gNj4RmXfJAHKdIHJ
	u/5r/B98B2rcZvhpTcDZkiD0KW9e6UoZRZCr5Gg+mhuzRc4I00VnliyDTNdXcBgmaVL/
	PVQg==
X-Gm-Message-State: AHQUAuYwhTX1Bqwnq4T5zfdqlgA+7WdlxOqTB0RORstYKe5Sypmx3Xhd
	667ysjXaJhdqM541i2jgUd2dipv9cJwobg==
X-Received: by 2002:adf:e487:: with SMTP id i7mr14322375wrm.202.1550581098128; 
	Tue, 19 Feb 2019 04:58:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	e75sm5226113wmg.32.2019.02.19.04.58.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 04:58:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 19 Feb 2019 12:58:05 +0000
Message-Id: <20190219125808.25174-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190219125808.25174-1-peter.maydell@linaro.org>
References: <20190219125808.25174-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 5/8] hw/misc/iotkit-sysctl: Correct typo in
 INITSVTOR0 register name
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L0xIbEsTMroi

The iotkit-sysctl device has a register it names INITSVRTOR0.
This is actually a typo present in the IoTKit documentation
and also in part of the SSE-200 documentation:  it should be
INITSVTOR0 because it is specifying the initial value of the
Secure VTOR register in the CPU. Correct the typo.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/iotkit-sysctl.h |  2 +-
 hw/misc/iotkit-sysctl.c         | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sysctl.h
index e36613cb5ee..17a145517a4 100644
--- a/include/hw/misc/iotkit-sysctl.h
+++ b/include/hw/misc/iotkit-sysctl.h
@@ -41,7 +41,7 @@ typedef struct IoTKitSysCtl {
     uint32_t reset_syndrome;
     uint32_t reset_mask;
     uint32_t gretreg;
-    uint32_t initsvrtor0;
+    uint32_t initsvtor0;
     uint32_t cpuwait;
     uint32_t wicctrl;
 } IoTKitSysCtl;
diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index a21d8bd6789..8c85aea9309 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -33,7 +33,7 @@ REG32(RESET_MASK, 0x104)
 REG32(SWRESET, 0x108)
     FIELD(SWRESET, SWRESETREQ, 9, 1)
 REG32(GRETREG, 0x10c)
-REG32(INITSVRTOR0, 0x110)
+REG32(INITSVTOR0, 0x110)
 REG32(CPUWAIT, 0x118)
 REG32(BUSWAIT, 0x11c)
 REG32(WICCTRL, 0x120)
@@ -76,8 +76,8 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
     case A_GRETREG:
         r = s->gretreg;
         break;
-    case A_INITSVRTOR0:
-        r = s->initsvrtor0;
+    case A_INITSVTOR0:
+        r = s->initsvtor0;
         break;
     case A_CPUWAIT:
         r = s->cpuwait;
@@ -145,9 +145,9 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
          */
         s->gretreg = value;
         break;
-    case A_INITSVRTOR0:
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl INITSVRTOR0 unimplemented\n");
-        s->initsvrtor0 = value;
+    case A_INITSVTOR0:
+        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl INITSVTOR0 unimplemented\n");
+        s->initsvtor0 = value;
         break;
     case A_CPUWAIT:
         qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl CPUWAIT unimplemented\n");
@@ -206,7 +206,7 @@ static void iotkit_sysctl_reset(DeviceState *dev)
     s->reset_syndrome = 1;
     s->reset_mask = 0;
     s->gretreg = 0;
-    s->initsvrtor0 = 0x10000000;
+    s->initsvtor0 = 0x10000000;
     s->cpuwait = 0;
     s->wicctrl = 0;
 }
@@ -230,7 +230,7 @@ static const VMStateDescription iotkit_sysctl_vmstate = {
         VMSTATE_UINT32(reset_syndrome, IoTKitSysCtl),
         VMSTATE_UINT32(reset_mask, IoTKitSysCtl),
         VMSTATE_UINT32(gretreg, IoTKitSysCtl),
-        VMSTATE_UINT32(initsvrtor0, IoTKitSysCtl),
+        VMSTATE_UINT32(initsvtor0, IoTKitSysCtl),
         VMSTATE_UINT32(cpuwait, IoTKitSysCtl),
         VMSTATE_UINT32(wicctrl, IoTKitSysCtl),
         VMSTATE_END_OF_LIST()
-- 
2.20.1

