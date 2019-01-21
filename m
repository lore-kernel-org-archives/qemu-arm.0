Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6406815wrt;
        Mon, 21 Jan 2019 11:27:55 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7Zl8Wo71qXOijU7setJz1MFVwB5I8Nxl1zuVc7IuVi1zyhHFhXyDqdrwY+KCQJeBSGp+E8
X-Received: by 2002:a1c:c303:: with SMTP id t3mr628453wmf.94.1548098875481;
        Mon, 21 Jan 2019 11:27:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548098875; cv=none;
        d=google.com; s=arc-20160816;
        b=ZSIkU5csteWQX+svmK3H/X6woeRcG589ghi26DCPJuMSPgdQAev0c9aMSy2mEJWy3u
         vfX/rUI9bfnK3ARS/K/uPABbthUHSe6h5eOnRigZU/tnKS4XcXY5IxIwsvp3RtHOK84/
         c5prp3/AgA+FWMf9bYe1b6nWtb2Xs7Fqvi86TinhYw1tqzr6JeYtO6Q6ygyzM7MKRmAd
         +hpSOJHBSgZr6VQ3Fqmz01KjJo+RuwEVC7lPbsJiFeaOIEb/eo8QwjncOK3N+G3ZR4yZ
         XIfkW6pc25dwT5P8rFCh3MKP4Pla0cC97We3oO1wpwoNeS+L2W0MIk6umxM9btTjDLov
         VVpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=VmHuIRIe0slMKOXr+14HFfLZdXo4lblxIN5l7d3ILAc=;
        b=g/DPs0w5B7HICHmsl+IkmVZbQqtAmj1md0rLCz398b0WMWUtRUbb9CwSpBjPFBKNKc
         RZpjtssbioEA0kw9VkYd56OCm8574JTUgXCMKlGHwWZlYe3I3MagJe2vodZxVU2hxRhJ
         B1N/3D0i3jJk6OI1J1Ai7+5n3H7HnlBE62UQOjk9XNuqCvVSWaTUhsjt2CHegb++yRDW
         U/q4CrQ2fkaP+3TNX55iMeKyhdbbYOh8hk8CQw4qhfS7dqCOeZyf3HpZeeP1QNwGK+NF
         7ZZkuVx49lmJ51ey9UTNQZ7xrse9z3bK0DZmb8AT4hp+wkOJXxw+laWjo6Q3FHspXiYA
         o/2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SesOGL77;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s72si32697538wme.10.2019.01.21.11.27.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:27:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SesOGL77;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glfEg-0006iT-DJ
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:27:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevQ-0008Da-Bs
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 14:08:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gleff-0002tn-Gb
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:47 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33445)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gleff-0002pQ-4D
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:43 -0500
Received: by mail-wm1-x342.google.com with SMTP id r24so6819069wmh.0
	for <qemu-devel@nongnu.org>; Mon, 21 Jan 2019 10:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VmHuIRIe0slMKOXr+14HFfLZdXo4lblxIN5l7d3ILAc=;
	b=SesOGL775fsc9/86PZIQVXi1iJ6ymEgeMQdsTAHfJr1xh8SHO19KzSSu3eNIUYmhts
	01un4Q/lXFCf9G2YD66HKEQJKS8AqvREwmM/9i4cnnrnHsyQZ4UobZgM4vztejm7fjtM
	/a6c8+/FvgP1E1hpF9FmIdF+JD8Rkl3Xx+jcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VmHuIRIe0slMKOXr+14HFfLZdXo4lblxIN5l7d3ILAc=;
	b=kt6W3DegyG6WU+tQXOR64HAJeF1vdf9Y0O1Usaf4UI4LOHtWgjCxQ/FMkBiemr6R5+
	scw9LAnBOlbo7KmntKhnoRwzVzTR0GeZjpNr1vP8iBecSWJy9wyqqlLQyI+xi48d3HJs
	5cWk4ei5hZdrO93FUKH8b9Hh+/6XAWFbz5PJxkz1PmF7n2v3ONOnSn4v7AOmFaB2HrfS
	juuA75J2RzTuRYWcMyslU3BqlrvXxfGibUSk0nGY8D9mDPGS6cX3yjGakjxk9NGAAAlT
	Y62NKgQgf0UsDd27OS7Almw2oVxY6LiDw04uNzruQf0vb/2NWujoldjWfUPBkWQ2HN+Q
	WEUw==
X-Gm-Message-State: AJcUukddVrpZepAwlnc9OazfhnyP61ibQYYOTcxgbzBwIcxn5Av7XASk
	p61xJnu6FYDoF3KNBfUojVFqxw==
X-Received: by 2002:a1c:cf0d:: with SMTP id f13mr559540wmg.70.1548096696872;
	Mon, 21 Jan 2019 10:51:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:09 +0000
Message-Id: <20190121185118.18550-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH 14/23] iotkit-sysinfo: Make SYS_VERSION and
 SYS_CONFIG configurable
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CZXL4ZeSClnZ

The SYS_VERSION and SYS_CONFIG register values differ between the
IoTKit and SSE-200. Make them configurable via QOM properties rather
than hard-coded, and set them appropriately in the ARMSSE code that
instantiates the IOTKIT_SYSINFO device.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/iotkit-sysinfo.h |  6 ++++
 hw/arm/armsse.c                  | 51 ++++++++++++++++++++++++++++++++
 hw/misc/iotkit-sysinfo.c         | 15 ++++++++--
 3 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/include/hw/misc/iotkit-sysinfo.h b/include/hw/misc/iotkit-sysinfo.h
index 7b2e1a5e48b..d84eb203b90 100644
--- a/include/hw/misc/iotkit-sysinfo.h
+++ b/include/hw/misc/iotkit-sysinfo.h
@@ -14,6 +14,8 @@
  * Arm IoTKit and documented in
  * http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
  * QEMU interface:
+ *  + QOM property "SYS_VERSION": value to use for SYS_VERSION register
+ *  + QOM property "SYS_CONFIG": value to use for SYS_CONFIG register
  *  + sysbus MMIO region 0: the system information register bank
  */
 
@@ -32,6 +34,10 @@ typedef struct IoTKitSysInfo {
 
     /*< public >*/
     MemoryRegion iomem;
+
+    /* Properties */
+    uint32_t sys_version;
+    uint32_t sys_config;
 } IoTKitSysInfo;
 
 #endif
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 2eb4ea3bfe0..19cae77e770 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -18,10 +18,18 @@
 #include "hw/arm/armsse.h"
 #include "hw/arm/arm.h"
 
+/* Format of the System Information block SYS_CONFIG register */
+typedef enum SysConfigFormat {
+    IoTKitFormat,
+    SSE200Format,
+} SysConfigFormat;
+
 struct ARMSSEInfo {
     const char *name;
     int sram_banks;
     int num_cpus;
+    uint32_t sys_version;
+    SysConfigFormat sys_config_format;
 };
 
 static const ARMSSEInfo armsse_variants[] = {
@@ -29,9 +37,39 @@ static const ARMSSEInfo armsse_variants[] = {
         .name = TYPE_IOTKIT,
         .sram_banks = 1,
         .num_cpus = 1,
+        .sys_version = 0x41743,
+        .sys_config_format = IoTKitFormat,
     },
 };
 
+static uint32_t armsse_sys_config_value(ARMSSE *s, const ARMSSEInfo *info)
+{
+    /* Return the SYS_CONFIG value for this SSE */
+    uint32_t sys_config;
+
+    switch (info->sys_config_format) {
+    case IoTKitFormat:
+        sys_config = 0;
+        sys_config = deposit32(sys_config, 0, 4, info->sram_banks);
+        sys_config = deposit32(sys_config, 4, 4, s->sram_addr_width - 12);
+        break;
+    case SSE200Format:
+        sys_config = 0;
+        sys_config = deposit32(sys_config, 0, 4, info->sram_banks);
+        sys_config = deposit32(sys_config, 4, 5, s->sram_addr_width);
+        sys_config = deposit32(sys_config, 24, 4, 2);
+        if (info->num_cpus > 1) {
+            sys_config = deposit32(sys_config, 10, 1, 1);
+            sys_config = deposit32(sys_config, 20, 4, info->sram_banks - 1);
+            sys_config = deposit32(sys_config, 28, 4, 2);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return sys_config;
+}
+
 /* Clock frequency in HZ of the 32KHz "slow clock" */
 #define S32KCLK (32 * 1000)
 
@@ -726,6 +764,19 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                           qdev_get_gpio_in_named(dev_apb_ppc1,
                                                  "cfg_sec_resp", 0));
 
+    object_property_set_int(OBJECT(&s->sysinfo), info->sys_version,
+                            "SYS_VERSION", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    object_property_set_int(OBJECT(&s->sysinfo),
+                            armsse_sys_config_value(s, info),
+                            "SYS_CONFIG", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->sysinfo), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c
index 78955bc45f5..026ba942613 100644
--- a/hw/misc/iotkit-sysinfo.c
+++ b/hw/misc/iotkit-sysinfo.c
@@ -51,15 +51,16 @@ static const int sysinfo_id[] = {
 static uint64_t iotkit_sysinfo_read(void *opaque, hwaddr offset,
                                     unsigned size)
 {
+    IoTKitSysInfo *s = IOTKIT_SYSINFO(opaque);
     uint64_t r;
 
     switch (offset) {
     case A_SYS_VERSION:
-        r = 0x41743;
+        r = s->sys_version;
         break;
 
     case A_SYS_CONFIG:
-        r = 0x31;
+        r = s->sys_config;
         break;
     case A_PID4 ... A_CID3:
         r = sysinfo_id[(offset - A_PID4) / 4];
@@ -94,6 +95,12 @@ static const MemoryRegionOps iotkit_sysinfo_ops = {
     .valid.max_access_size = 4,
 };
 
+static Property iotkit_sysinfo_props[] = {
+    DEFINE_PROP_UINT32("SYS_VERSION", IoTKitSysInfo, sys_version, 0),
+    DEFINE_PROP_UINT32("SYS_CONFIG", IoTKitSysInfo, sys_config, 0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void iotkit_sysinfo_init(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
@@ -106,10 +113,14 @@ static void iotkit_sysinfo_init(Object *obj)
 
 static void iotkit_sysinfo_class_init(ObjectClass *klass, void *data)
 {
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
     /*
      * This device has no guest-modifiable state and so it
      * does not need a reset function or VMState.
      */
+
+    dc->props = iotkit_sysinfo_props;
 }
 
 static const TypeInfo iotkit_sysinfo_info = {
-- 
2.20.1

