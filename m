Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp570860wrt;
        Mon, 11 Mar 2019 05:10:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkSzZruzkAdLXPlesaii3q39ssYtzdhjcOE9thn/39FyUKcZ9CZoOnA0+i1b5u8sCUhF7D
X-Received: by 2002:a81:e4e:: with SMTP id 75mr25331572ywo.149.1552306252987;
        Mon, 11 Mar 2019 05:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552306252; cv=none;
        d=google.com; s=arc-20160816;
        b=Ve3aE6frI23fp/JJFG9cQ993yLTPJIIzbmWddibjdyL3k9tL9At8FuiGZkiVYmkv0E
         coL+YTTtiIKEIbcMyqH/aDnznuEGXu8D5A4YaJxNuo67inQnODacjD4wFmSxnozSXDIt
         60WyFJB6VsrKJ7Aue0k4rgU+PsNkLWdSykFUfxTL0qKTaP3Qx8qBe248elWV9a38MF/9
         PEnuPEzMeqCqtoUj1YWV5qIz5FpO0CCv6EMbBPCd7khwQvG7o1n+/83QXwDm2O5Y0Hq5
         ySmQD8ZYjY3FYMB6e/NljwEQltlr8/5Q8cUj+DZw47GyEGdn14E5WTm7dTjL35dMSQNP
         AWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=SmKkVQg52oxx7qjZWjqqOqkg+M8xcxKT50JvTZGBNPU=;
        b=LlHMpWipV4diRxFYYdZoZpAw6yWijetXlaLyAbe4GWAfdmMN6qaItIq1k0RaiIkgsQ
         MA15Op+nLD1JpR6I2W+17j6ZAhOTK7BrjDH8iEXXieEs/jL2QGdcWAe1/79L+k1PxSyh
         7jcPNyv9yzp1C5aGOhvzvZr+Hy3/bD4AyeFBwWV6FkWi0sa3lCqa7ZPlduWzuZOi6Eyi
         pqbQiR2VfnjmlfNKtNKOYS9TlFUaBH3PIVcFw1FUcedEX3mcZ/+ic+weQ0ECubu5n54D
         vyuEp8SdTfR1QjJ2b+PoJUn8JQwKMctYoqaT4m1dBgDRuvefVGXIUyL4AC5kZwdRhrWc
         FdkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si2139059ybk.352.2019.03.11.05.10.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 05:10:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3Jlc-0006XI-CH
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 08:10:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h3JlO-0006Wv-Ew
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 08:10:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h3JlN-0000JI-AN
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 08:10:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60798)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h3JlM-0000IW-Rd; Mon, 11 Mar 2019 08:10:37 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 562C0308425C;
	Mon, 11 Mar 2019 12:10:35 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC14E1001DDB;
	Mon, 11 Mar 2019 12:10:24 +0000 (UTC)
Date: Mon, 11 Mar 2019 13:10:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190311131023.18849710@redhat.com>
In-Reply-To: <20190308182053.5487-2-eric.auger@redhat.com>
References: <20190308182053.5487-1-eric.auger@redhat.com>
	<20190308182053.5487-2-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 11 Mar 2019 12:10:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 1/2] nvdimm: Rename AcpiNVDIMMState into
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, sbhat@linux.ibm.com,
	david@redhat.com, richard.henderson@linaro.org,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, philmd@redhat.com,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /0HGfT4FkOwe

On Fri,  8 Mar 2019 19:20:52 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> As we intend to migrate the acpi_nvdimm_state into
> the base machine with a new dimms_state name, let's
> also rename the datatype.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/nvdimm.c        | 18 +++++++++---------
>  hw/i386/pc.c            |  2 +-
>  include/hw/i386/pc.h    |  2 +-
>  include/hw/mem/nvdimm.h | 10 +++++-----
>  4 files changed, 16 insertions(+), 16 deletions(-)
>=20
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index e53b2cb681..f73cfb9d90 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -382,7 +382,7 @@ nvdimm_build_structure_caps(GArray *structures, uint3=
2_t capabilities)
>      nfit_caps->capabilities =3D cpu_to_le32(capabilities);
>  }
> =20
> -static GArray *nvdimm_build_device_structure(AcpiNVDIMMState *state)
> +static GArray *nvdimm_build_device_structure(NVDIMMState *state)
>  {
>      GSList *device_list =3D nvdimm_get_device_list();
>      GArray *structures =3D g_array_new(false, true /* clear */, 1);
> @@ -416,7 +416,7 @@ static void nvdimm_init_fit_buffer(NvdimmFitBuffer *f=
it_buf)
>      fit_buf->fit =3D g_array_new(false, true /* clear */, 1);
>  }
> =20
> -static void nvdimm_build_fit_buffer(AcpiNVDIMMState *state)
> +static void nvdimm_build_fit_buffer(NVDIMMState *state)
>  {
>      NvdimmFitBuffer *fit_buf =3D &state->fit_buf;
> =20
> @@ -425,12 +425,12 @@ static void nvdimm_build_fit_buffer(AcpiNVDIMMState=
 *state)
>      fit_buf->dirty =3D true;
>  }
> =20
> -void nvdimm_plug(AcpiNVDIMMState *state)
> +void nvdimm_plug(NVDIMMState *state)
>  {
>      nvdimm_build_fit_buffer(state);
>  }
> =20
> -static void nvdimm_build_nfit(AcpiNVDIMMState *state, GArray *table_offs=
ets,
> +static void nvdimm_build_nfit(NVDIMMState *state, GArray *table_offsets,
>                                GArray *table_data, BIOSLinker *linker)
>  {
>      NvdimmFitBuffer *fit_buf =3D &state->fit_buf;
> @@ -570,7 +570,7 @@ nvdimm_dsm_no_payload(uint32_t func_ret_status, hwadd=
r dsm_mem_addr)
>  #define NVDIMM_QEMU_RSVD_HANDLE_ROOT         0x10000
> =20
>  /* Read FIT data, defined in docs/specs/acpi_nvdimm.txt. */
> -static void nvdimm_dsm_func_read_fit(AcpiNVDIMMState *state, NvdimmDsmIn=
 *in,
> +static void nvdimm_dsm_func_read_fit(NVDIMMState *state, NvdimmDsmIn *in,
>                                       hwaddr dsm_mem_addr)
>  {
>      NvdimmFitBuffer *fit_buf =3D &state->fit_buf;
> @@ -619,7 +619,7 @@ exit:
>  }
> =20
>  static void
> -nvdimm_dsm_handle_reserved_root_method(AcpiNVDIMMState *state,
> +nvdimm_dsm_handle_reserved_root_method(NVDIMMState *state,
>                                         NvdimmDsmIn *in, hwaddr dsm_mem_a=
ddr)
>  {
>      switch (in->function) {
> @@ -863,7 +863,7 @@ nvdimm_dsm_read(void *opaque, hwaddr addr, unsigned s=
ize)
>  static void
>  nvdimm_dsm_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>  {
> -    AcpiNVDIMMState *state =3D opaque;
> +    NVDIMMState *state =3D opaque;
>      NvdimmDsmIn *in;
>      hwaddr dsm_mem_addr =3D val;
> =20
> @@ -925,7 +925,7 @@ void nvdimm_acpi_plug_cb(HotplugHandler *hotplug_dev,=
 DeviceState *dev)
>      }
>  }
> =20
> -void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
> +void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
>                              FWCfgState *fw_cfg, Object *owner)
>  {
>      memory_region_init_io(&state->io_mr, owner, &nvdimm_dsm_ops, state,
> @@ -1319,7 +1319,7 @@ static void nvdimm_build_ssdt(GArray *table_offsets=
, GArray *table_data,
>  }
> =20
>  void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
> -                       BIOSLinker *linker, AcpiNVDIMMState *state,
> +                       BIOSLinker *linker, NVDIMMState *state,
>                         uint32_t ram_slots)
>  {
>      GSList *device_list;
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 42128183e9..0338dbe9da 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -2571,7 +2571,7 @@ static void pc_machine_set_nvdimm_persistence(Objec=
t *obj, const char *value,
>                                                 Error **errp)
>  {
>      PCMachineState *pcms =3D PC_MACHINE(obj);
> -    AcpiNVDIMMState *nvdimm_state =3D &pcms->acpi_nvdimm_state;
> +    NVDIMMState *nvdimm_state =3D &pcms->acpi_nvdimm_state;
> =20
>      if (strcmp(value, "cpu") =3D=3D 0)
>          nvdimm_state->persistence =3D 3;
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 54222a202d..94fb620d65 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -45,7 +45,7 @@ struct PCMachineState {
>      OnOffAuto vmport;
>      OnOffAuto smm;
> =20
> -    AcpiNVDIMMState acpi_nvdimm_state;
> +    NVDIMMState acpi_nvdimm_state;
> =20
>      bool acpi_build_enabled;
>      bool smbus_enabled;
> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> index c5c9b3c7f8..523a9b3d4a 100644
> --- a/include/hw/mem/nvdimm.h
> +++ b/include/hw/mem/nvdimm.h
> @@ -123,7 +123,7 @@ struct NvdimmFitBuffer {
>  };
>  typedef struct NvdimmFitBuffer NvdimmFitBuffer;
> =20
> -struct AcpiNVDIMMState {
> +struct NVDIMMState {
>      /* detect if NVDIMM support is enabled. */
>      bool is_enabled;
> =20
> @@ -141,13 +141,13 @@ struct AcpiNVDIMMState {
>      int32_t persistence;
>      char    *persistence_string;
>  };
> -typedef struct AcpiNVDIMMState AcpiNVDIMMState;
> +typedef struct NVDIMMState NVDIMMState;
> =20
> -void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
> +void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
>                              FWCfgState *fw_cfg, Object *owner);
>  void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
> -                       BIOSLinker *linker, AcpiNVDIMMState *state,
> +                       BIOSLinker *linker, NVDIMMState *state,
>                         uint32_t ram_slots);
> -void nvdimm_plug(AcpiNVDIMMState *state);
> +void nvdimm_plug(NVDIMMState *state);
>  void nvdimm_acpi_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev);
>  #endif

