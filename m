Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8127920wrt;
        Tue, 4 Dec 2018 06:23:49 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Ugo8e92WqjPU9DRg5/eiIY+n3iaF+GkRgHQyiHyTreQyXGqMi3836Gfv7MBJbEMRFydnNX
X-Received: by 2002:a0c:90a6:: with SMTP id p35mr19807497qvp.125.1543933429175;
        Tue, 04 Dec 2018 06:23:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543933429; cv=none;
        d=google.com; s=arc-20160816;
        b=xX0eKweG+UxFRsg8i+iyQfuLVPIWSJU3b+F4/T7uHDy57RfU0Te/zZ9ONrD2sWY+Aw
         0ZS+RZH2WFVvP0AFwJLtVB7KwwuoBfOPOTiahbNZigMxYmTJ0E3J+xC7a4Jgwxa2flcm
         29JStpALx8EvvYPEGfm3XtqZN9ub5HAHFvtWgCazteDFt9a765fLZX2Oj1invwSGW1eu
         lU29T/h+UvWS+AnhR9zTtJnuHpgplkehinb9GfPLTQSbDdFwBhqSL4ZJOYBZpdv+fYWr
         Wud28gl5fjyV2WPYmoo0GgEAht913ywqIVy4o0XabkeOdRmOVhS9/tRpY0QYkPqnp52q
         8zdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=4le3P2D2fj0UVmE7fti6OQ3eF8ssUbLSwlGpOQz14r8=;
        b=Hhmfae99oGEB6/X5NU5gF08CM8Uzkx5DgPVxCTrYJz9FiGb5AJvSVkDfC6r6PMQa9t
         UfO/7t3O41dWwmxp9jaKbeLBoI3gHr0+qDVcU2N2zF7yIikok3DeEfPb9FcvgjOBW007
         JUU6KCNXU3XVogm1Xvx/X2Dhx9BBTKpCAFjNnWr/4l1VpoKdr2OEWuPOt+yLWNWSqXui
         uNScPYCVe2Q/rzIjEqitFBF5As/R0KQ3QfjG5pkTD/iraeBk8HlUBlHc+Um4CBJArSye
         ikcSwiSqTMsCLOzc7MtIL1Ncfv+o0FZhf2d4psiOb9ZhsXVV5mOeE8UInsECQfHqwmaZ
         sj2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l91si2738387qva.115.2018.12.04.06.23.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 06:23:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUBc4-0006LE-CW
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 09:23:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gUBZM-0004Qa-8X
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:21:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gUBZH-0006o3-70
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:21:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50826)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gUBZG-0006nW-TZ; Tue, 04 Dec 2018 09:20:55 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E97789AE3;
	Tue,  4 Dec 2018 14:20:53 +0000 (UTC)
Received: from localhost (ovpn-112-31.ams2.redhat.com [10.36.112.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29B1F5C6BF;
	Tue,  4 Dec 2018 14:20:40 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  4 Dec 2018 18:20:06 +0400
Message-Id: <20181204142023.15982-3-marcandre.lureau@redhat.com>
In-Reply-To: <20181204142023.15982-1-marcandre.lureau@redhat.com>
References: <20181204142023.15982-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 04 Dec 2018 14:20:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.2 v5 02/19] qom: make interface types
 abstract
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
Cc: Peter Maydell <peter.maydell@linaro.org>, ehabkost@redhat.com,
	Corey Minyard <minyard@acm.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	"open list:PReP" <qemu-ppc@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	imammedo@redhat.com, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sq6yiODthnUz

Interfaces don't have instance, let's make the interface type really
abstract to avoid confusion.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/acpi/acpi_dev_interface.h | 6 +-----
 include/hw/arm/linux-boot-if.h       | 5 +----
 include/hw/fw-path-provider.h        | 4 +---
 include/hw/hotplug.h                 | 6 +-----
 include/hw/intc/intc.h               | 4 +---
 include/hw/ipmi/ipmi.h               | 4 +---
 include/hw/isa/isa.h                 | 4 ----
 include/hw/mem/memory-device.h       | 4 +---
 include/hw/nmi.h                     | 4 +---
 include/hw/stream.h                  | 4 +---
 include/hw/timer/m48t59.h            | 4 +---
 include/qom/object_interfaces.h      | 6 +-----
 include/sysemu/tpm.h                 | 4 +---
 target/arm/idau.h                    | 4 +---
 tests/check-qom-interface.c          | 4 +---
 15 files changed, 14 insertions(+), 53 deletions(-)

diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_=
dev_interface.h
index dabf4c4fc9..43ff119179 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -25,11 +25,7 @@ typedef enum {
      INTERFACE_CHECK(AcpiDeviceIf, (obj), \
                      TYPE_ACPI_DEVICE_IF)
=20
-
-typedef struct AcpiDeviceIf {
-    /* <private> */
-    Object Parent;
-} AcpiDeviceIf;
+typedef struct AcpiDeviceIf AcpiDeviceIf;
=20
 void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event);
=20
diff --git a/include/hw/arm/linux-boot-if.h b/include/hw/arm/linux-boot-i=
f.h
index aba4479a14..7bbdfd1cc6 100644
--- a/include/hw/arm/linux-boot-if.h
+++ b/include/hw/arm/linux-boot-if.h
@@ -16,10 +16,7 @@
 #define ARM_LINUX_BOOT_IF(obj) \
     INTERFACE_CHECK(ARMLinuxBootIf, (obj), TYPE_ARM_LINUX_BOOT_IF)
=20
-typedef struct ARMLinuxBootIf {
-    /*< private >*/
-    Object parent_obj;
-} ARMLinuxBootIf;
+typedef struct ARMLinuxBootIf ARMLinuxBootIf;
=20
 typedef struct ARMLinuxBootIfClass {
     /*< private >*/
diff --git a/include/hw/fw-path-provider.h b/include/hw/fw-path-provider.=
h
index 050cb05d92..5df893a3d8 100644
--- a/include/hw/fw-path-provider.h
+++ b/include/hw/fw-path-provider.h
@@ -30,9 +30,7 @@
 #define FW_PATH_PROVIDER(obj) \
      INTERFACE_CHECK(FWPathProvider, (obj), TYPE_FW_PATH_PROVIDER)
=20
-typedef struct FWPathProvider {
-    Object parent_obj;
-} FWPathProvider;
+typedef struct FWPathProvider FWPathProvider;
=20
 typedef struct FWPathProviderClass {
     InterfaceClass parent_class;
diff --git a/include/hw/hotplug.h b/include/hw/hotplug.h
index 1a0516a479..6321e292fd 100644
--- a/include/hw/hotplug.h
+++ b/include/hw/hotplug.h
@@ -23,11 +23,7 @@
 #define HOTPLUG_HANDLER(obj) \
      INTERFACE_CHECK(HotplugHandler, (obj), TYPE_HOTPLUG_HANDLER)
=20
-
-typedef struct HotplugHandler {
-    /* <private> */
-    Object Parent;
-} HotplugHandler;
+typedef struct HotplugHandler HotplugHandler;
=20
 /**
  * hotplug_fn:
diff --git a/include/hw/intc/intc.h b/include/hw/intc/intc.h
index 27d9828943..fb3e8e621f 100644
--- a/include/hw/intc/intc.h
+++ b/include/hw/intc/intc.h
@@ -15,9 +15,7 @@
     INTERFACE_CHECK(InterruptStatsProvider, (obj), \
                     TYPE_INTERRUPT_STATS_PROVIDER)
=20
-typedef struct InterruptStatsProvider {
-    Object parent;
-} InterruptStatsProvider;
+typedef struct InterruptStatsProvider InterruptStatsProvider;
=20
 typedef struct InterruptStatsProviderClass {
     InterfaceClass parent;
diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h
index 0affe5a4d8..99661d2bf0 100644
--- a/include/hw/ipmi/ipmi.h
+++ b/include/hw/ipmi/ipmi.h
@@ -114,9 +114,7 @@ uint32_t ipmi_next_uuid(void);
 #define IPMI_INTERFACE_GET_CLASS(class) \
      OBJECT_GET_CLASS(IPMIInterfaceClass, (class), TYPE_IPMI_INTERFACE)
=20
-typedef struct IPMIInterface {
-    Object parent;
-} IPMIInterface;
+typedef struct IPMIInterface IPMIInterface;
=20
 typedef struct IPMIInterfaceClass {
     InterfaceClass parent;
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index b9dbab24b4..e62ac91c19 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -43,10 +43,6 @@ static inline uint16_t applesmc_port(void)
 #define ISADMA(obj) \
     INTERFACE_CHECK(IsaDma, (obj), TYPE_ISADMA)
=20
-struct IsaDma {
-    Object parent;
-};
-
 typedef enum {
     ISADMA_TRANSFER_VERIFY,
     ISADMA_TRANSFER_READ,
diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-devic=
e.h
index e904e194d5..0293a96abb 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -25,9 +25,7 @@
 #define MEMORY_DEVICE(obj) \
      INTERFACE_CHECK(MemoryDeviceState, (obj), TYPE_MEMORY_DEVICE)
=20
-typedef struct MemoryDeviceState {
-    Object parent_obj;
-} MemoryDeviceState;
+typedef struct MemoryDeviceState MemoryDeviceState;
=20
 /**
  * MemoryDeviceClass:
diff --git a/include/hw/nmi.h b/include/hw/nmi.h
index d092c684a1..ad857f3832 100644
--- a/include/hw/nmi.h
+++ b/include/hw/nmi.h
@@ -34,9 +34,7 @@
 #define NMI(obj) \
      INTERFACE_CHECK(NMI, (obj), TYPE_NMI)
=20
-typedef struct NMIState {
-    Object parent_obj;
-} NMIState;
+typedef struct NMIState NMIState;
=20
 typedef struct NMIClass {
     InterfaceClass parent_class;
diff --git a/include/hw/stream.h b/include/hw/stream.h
index c370ba0c66..15774f07ab 100644
--- a/include/hw/stream.h
+++ b/include/hw/stream.h
@@ -14,9 +14,7 @@
 #define STREAM_SLAVE(obj) \
      INTERFACE_CHECK(StreamSlave, (obj), TYPE_STREAM_SLAVE)
=20
-typedef struct StreamSlave {
-    Object Parent;
-} StreamSlave;
+typedef struct StreamSlave StreamSlave;
=20
 typedef void (*StreamCanPushNotifyFn)(void *opaque);
=20
diff --git a/include/hw/timer/m48t59.h b/include/hw/timer/m48t59.h
index db5e43a8da..6f8db04fce 100644
--- a/include/hw/timer/m48t59.h
+++ b/include/hw/timer/m48t59.h
@@ -13,9 +13,7 @@
 #define NVRAM(obj) \
     INTERFACE_CHECK(Nvram, (obj), TYPE_NVRAM)
=20
-typedef struct Nvram {
-    Object parent;
-} Nvram;
+typedef struct Nvram Nvram;
=20
 typedef struct NvramClass {
     InterfaceClass parent;
diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfa=
ces.h
index 4d513fb329..652a16d2ba 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -16,11 +16,7 @@
      INTERFACE_CHECK(UserCreatable, (obj), \
                      TYPE_USER_CREATABLE)
=20
-
-typedef struct UserCreatable {
-    /* <private> */
-    Object Parent;
-} UserCreatable;
+typedef struct UserCreatable UserCreatable;
=20
 /**
  * UserCreatableClass:
diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index 17a97ed77a..5b541a71c8 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -33,9 +33,7 @@ typedef enum TPMVersion {
 #define TPM_IF(obj)                             \
     INTERFACE_CHECK(TPMIf, (obj), TYPE_TPM_IF)
=20
-typedef struct TPMIf {
-    Object parent_obj;
-} TPMIf;
+typedef struct TPMIf TPMIf;
=20
 typedef struct TPMIfClass {
     InterfaceClass parent_class;
diff --git a/target/arm/idau.h b/target/arm/idau.h
index cac27b95fa..7c0e4e3776 100644
--- a/target/arm/idau.h
+++ b/target/arm/idau.h
@@ -38,9 +38,7 @@
 #define IDAU_INTERFACE_GET_CLASS(obj) \
     OBJECT_GET_CLASS(IDAUInterfaceClass, (obj), TYPE_IDAU_INTERFACE)
=20
-typedef struct IDAUInterface {
-    Object parent;
-} IDAUInterface;
+typedef struct IDAUInterface IDAUInterface;
=20
 #define IREGION_NOTVALID -1
=20
diff --git a/tests/check-qom-interface.c b/tests/check-qom-interface.c
index f87c9aaa8a..2177f0dce5 100644
--- a/tests/check-qom-interface.c
+++ b/tests/check-qom-interface.c
@@ -23,9 +23,7 @@
 #define TEST_IF(obj) \
      INTERFACE_CHECK(TestIf, (obj), TYPE_TEST_IF)
=20
-typedef struct TestIf {
-    Object parent_obj;
-} TestIf;
+typedef struct TestIf TestIf;
=20
 typedef struct TestIfClass {
     InterfaceClass parent_class;
--=20
2.20.0.rc1

