Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8499492wrx;
        Fri, 8 Mar 2019 07:25:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqyzgUALyVPT5boi5tG7ELUSXd5I3VPpTrfSrM869bahriIx5S9CfG6JRXNStxI8uLThNDtY
X-Received: by 2002:a25:6d46:: with SMTP id i67mr16614384ybc.384.1552058750718;
        Fri, 08 Mar 2019 07:25:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552058750; cv=none;
        d=google.com; s=arc-20160816;
        b=fzmfnVhu6efHM9nswXlENKYx3fKmynggTCB4o0O/m5/Jw3svg9nTchkpWLoUnybWOC
         aNuI1c7PbyiCa1Zt8sH6kKloCo0PoRNKSFucilC4I99t3OWwUhB6O6tph3KUS6uTGslE
         2EoTPgoWwYkvrX5wcHBHpVqIzoigzxk6gWiNn+2NpEoqSlTsziEV4LvDYgSOfnYKZBVD
         udl3gwGTAYssdg55wholzC2opWmPphOKTv5SGdRs6GQCVaUCMXDVDc3oWkN9PKe0muZZ
         QJVQeTNXjMGAgzEbLMrBi8x1Gq0/UnW2Bx/jTIY72vlitX87EaPapnAi2fnhWtPPoXuV
         iiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=o4Iwm0HmnL9b+G7s7ZlBwZzttk7lCVEhD+gRDYJWYS0=;
        b=CAmzZgrV4wCczckPgrrYU55oy3Zc3cjBwZpE050K6uFfsolvm8lZrg6NUtv5E9drmz
         38m7SDDOI4iJlymU/4EGPKyYDaUUBRWp93PN8r9F0jmcAhnazwHdEvXCdA/zCIKfE/fJ
         3737GdprxcbIm8jJicyeHh2o8Bla1iUaphZKj71loEaA9KQna3kUn8HlOLtehsweoMDx
         6eUv567siM3XzpH554Ra3YhzR4MLP6nq7Ugl+uW5w7DJSHNMhVNcR6sr8Xo4nnnVcswK
         J/pJMn1CPuQBdiVEgC3shkcxFO4KNtze+Bu4a8CaKb1Bgg16fQGN2/785W+CxGcgXGOw
         oTyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7si5115107ywe.315.2019.03.08.07.25.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 07:25:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45584 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2HNe-0001Ce-4s
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 10:25:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h2HNP-0001B9-24
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 10:25:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h2HNO-0003SA-0E
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 10:25:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35656)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h2HNN-0003OP-L4; Fri, 08 Mar 2019 10:25:33 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C9019C002962;
	Fri,  8 Mar 2019 15:25:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C20785D704;
	Fri,  8 Mar 2019 15:25:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com,
	david@redhat.com, pbonzini@redhat.com, ehabkost@redhat.com,
	richard.henderson@linaro.org, sbhat@linux.ibm.com, philmd@redhat.com
Date: Fri,  8 Mar 2019 16:25:10 +0100
Message-Id: <20190308152511.10882-2-eric.auger@redhat.com>
In-Reply-To: <20190308152511.10882-1-eric.auger@redhat.com>
References: <20190308152511.10882-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 08 Mar 2019 15:25:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 1/2] nvdimm: Rename AcpiNVDIMMState into
 NVDIMMState
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MuQJXpPcpOH2

As we intend to migrate the acpi_nvdimm_state into
the base machine with a new dimms_state name, let's
also rename the datatype.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/nvdimm.c        | 18 +++++++++---------
 hw/i386/pc.c            |  2 +-
 include/hw/i386/pc.h    |  2 +-
 include/hw/mem/nvdimm.h | 10 +++++-----
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index e53b2cb681..f73cfb9d90 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -382,7 +382,7 @@ nvdimm_build_structure_caps(GArray *structures, uint3=
2_t capabilities)
     nfit_caps->capabilities =3D cpu_to_le32(capabilities);
 }
=20
-static GArray *nvdimm_build_device_structure(AcpiNVDIMMState *state)
+static GArray *nvdimm_build_device_structure(NVDIMMState *state)
 {
     GSList *device_list =3D nvdimm_get_device_list();
     GArray *structures =3D g_array_new(false, true /* clear */, 1);
@@ -416,7 +416,7 @@ static void nvdimm_init_fit_buffer(NvdimmFitBuffer *f=
it_buf)
     fit_buf->fit =3D g_array_new(false, true /* clear */, 1);
 }
=20
-static void nvdimm_build_fit_buffer(AcpiNVDIMMState *state)
+static void nvdimm_build_fit_buffer(NVDIMMState *state)
 {
     NvdimmFitBuffer *fit_buf =3D &state->fit_buf;
=20
@@ -425,12 +425,12 @@ static void nvdimm_build_fit_buffer(AcpiNVDIMMState=
 *state)
     fit_buf->dirty =3D true;
 }
=20
-void nvdimm_plug(AcpiNVDIMMState *state)
+void nvdimm_plug(NVDIMMState *state)
 {
     nvdimm_build_fit_buffer(state);
 }
=20
-static void nvdimm_build_nfit(AcpiNVDIMMState *state, GArray *table_offs=
ets,
+static void nvdimm_build_nfit(NVDIMMState *state, GArray *table_offsets,
                               GArray *table_data, BIOSLinker *linker)
 {
     NvdimmFitBuffer *fit_buf =3D &state->fit_buf;
@@ -570,7 +570,7 @@ nvdimm_dsm_no_payload(uint32_t func_ret_status, hwadd=
r dsm_mem_addr)
 #define NVDIMM_QEMU_RSVD_HANDLE_ROOT         0x10000
=20
 /* Read FIT data, defined in docs/specs/acpi_nvdimm.txt. */
-static void nvdimm_dsm_func_read_fit(AcpiNVDIMMState *state, NvdimmDsmIn=
 *in,
+static void nvdimm_dsm_func_read_fit(NVDIMMState *state, NvdimmDsmIn *in=
,
                                      hwaddr dsm_mem_addr)
 {
     NvdimmFitBuffer *fit_buf =3D &state->fit_buf;
@@ -619,7 +619,7 @@ exit:
 }
=20
 static void
-nvdimm_dsm_handle_reserved_root_method(AcpiNVDIMMState *state,
+nvdimm_dsm_handle_reserved_root_method(NVDIMMState *state,
                                        NvdimmDsmIn *in, hwaddr dsm_mem_a=
ddr)
 {
     switch (in->function) {
@@ -863,7 +863,7 @@ nvdimm_dsm_read(void *opaque, hwaddr addr, unsigned s=
ize)
 static void
 nvdimm_dsm_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
 {
-    AcpiNVDIMMState *state =3D opaque;
+    NVDIMMState *state =3D opaque;
     NvdimmDsmIn *in;
     hwaddr dsm_mem_addr =3D val;
=20
@@ -925,7 +925,7 @@ void nvdimm_acpi_plug_cb(HotplugHandler *hotplug_dev,=
 DeviceState *dev)
     }
 }
=20
-void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
+void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
                             FWCfgState *fw_cfg, Object *owner)
 {
     memory_region_init_io(&state->io_mr, owner, &nvdimm_dsm_ops, state,
@@ -1319,7 +1319,7 @@ static void nvdimm_build_ssdt(GArray *table_offsets=
, GArray *table_data,
 }
=20
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
-                       BIOSLinker *linker, AcpiNVDIMMState *state,
+                       BIOSLinker *linker, NVDIMMState *state,
                        uint32_t ram_slots)
 {
     GSList *device_list;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 42128183e9..0338dbe9da 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2571,7 +2571,7 @@ static void pc_machine_set_nvdimm_persistence(Objec=
t *obj, const char *value,
                                                Error **errp)
 {
     PCMachineState *pcms =3D PC_MACHINE(obj);
-    AcpiNVDIMMState *nvdimm_state =3D &pcms->acpi_nvdimm_state;
+    NVDIMMState *nvdimm_state =3D &pcms->acpi_nvdimm_state;
=20
     if (strcmp(value, "cpu") =3D=3D 0)
         nvdimm_state->persistence =3D 3;
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 54222a202d..94fb620d65 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -45,7 +45,7 @@ struct PCMachineState {
     OnOffAuto vmport;
     OnOffAuto smm;
=20
-    AcpiNVDIMMState acpi_nvdimm_state;
+    NVDIMMState acpi_nvdimm_state;
=20
     bool acpi_build_enabled;
     bool smbus_enabled;
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index c5c9b3c7f8..523a9b3d4a 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -123,7 +123,7 @@ struct NvdimmFitBuffer {
 };
 typedef struct NvdimmFitBuffer NvdimmFitBuffer;
=20
-struct AcpiNVDIMMState {
+struct NVDIMMState {
     /* detect if NVDIMM support is enabled. */
     bool is_enabled;
=20
@@ -141,13 +141,13 @@ struct AcpiNVDIMMState {
     int32_t persistence;
     char    *persistence_string;
 };
-typedef struct AcpiNVDIMMState AcpiNVDIMMState;
+typedef struct NVDIMMState NVDIMMState;
=20
-void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
+void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
                             FWCfgState *fw_cfg, Object *owner);
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
-                       BIOSLinker *linker, AcpiNVDIMMState *state,
+                       BIOSLinker *linker, NVDIMMState *state,
                        uint32_t ram_slots);
-void nvdimm_plug(AcpiNVDIMMState *state);
+void nvdimm_plug(NVDIMMState *state);
 void nvdimm_acpi_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev);
 #endif
--=20
2.20.1

