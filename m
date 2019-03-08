Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8658994wrx;
        Fri, 8 Mar 2019 10:00:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqyShO/W3rcKB4KPqhSfBPGOOZcUnoGWmrxy+vB1prHxaB2Ps5TeZ1kqG5SMRrqzLXD7ODo/
X-Received: by 2002:a81:524d:: with SMTP id g74mr15427222ywb.461.1552068007332;
        Fri, 08 Mar 2019 10:00:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552068007; cv=none;
        d=google.com; s=arc-20160816;
        b=DVoLG5eetZGY6N0tQvvjDun+DhlM5yAT2BiRkQduae6MoI0hRXEo8a/KJ5UWEx61W/
         bHhBQaO52HBY4HIMILnV51/mavvLutm/k53gHHzlcx7Nsboj/0b5qNkzdIFLAPchs7hz
         fStJGq7COYLn7d8/pXPCbZgaSmOUKcbWHEB3IZbym5AIEW6mlny7EMeX2ShgEyyGew0T
         cD9HxJGYr0FBNoBAum1yuVil5NwPgAZddWD6Qc6j76ey+S6Qq8WgRhIXHUMiB8bVJSZ6
         wp4g/BAyrPZl53GS/YihuPyuPpUNHgNhXq47hCGdaQ7UWZ5N5fk/dYe4cxLmJOE7zccs
         SyKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Yu2v8GiyUhMXWK14LJHqbGtqqQxctjK68/rG0ZPKftU=;
        b=GNXfKdw52evOwRnSlbA4tgWB0xe1eUt4rAs7kZMJ3fpNfj4OxX6xJdDb4dpqhbQyHd
         r5O4xB5MsAZq9enqKTeCikRgRazt+XPD/Phk2RfZ/2MFQpfe7/5NbmWBhpGYDJcNIL1j
         BU5fc4xe6KU/n62E+Q6fIUYmZAzgtOdXTGSigjZbY9JRjTe+Qp9AaTbbfjNKqZgxQZYH
         UPaQTIp3Qqf4JMncg+yCQ4M9SKJlQcj3LxGiq+gzUJ9tti5ftNG03IhJaicQQHsZiiRf
         UxslIUEknd7inq24YWLFBa0vLH/tuHbQ2f4lgcpcFaB9t1m9dM63bJKO3VquXC3ktUO8
         s+Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si4707586ybp.230.2019.03.08.10.00.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 10:00:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:47820 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Jmw-0002jG-Q6
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 13:00:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2Jmk-0002is-50
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 12:59:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2Jmj-0007iY-0N
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 12:59:54 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39636)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1h2Jmi-0007hY-MX
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 12:59:52 -0500
Received: by mail-wr1-f65.google.com with SMTP id l12so5847747wrp.6
	for <qemu-arm@nongnu.org>; Fri, 08 Mar 2019 09:59:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Yu2v8GiyUhMXWK14LJHqbGtqqQxctjK68/rG0ZPKftU=;
	b=nThAOm8ylbsfgBO6tW8b2oQ+/hh+WU07JA/2wdnUtq///tAc4EecE9uS5CmDHVb/KM
	pt0IKX9/j+65cFrYbKDgjCt/WdimvEnnU1IU7U15WUWXuqcz6dLgASnFjB4aDj7pSyr7
	W/KgclQ2kU8WvfQVI/KPvF9QoaLlCGISgGLbmiXN2s8nX4QFQDU5B8fImqWk8zyx2uGJ
	zyu0Xn/W16HVgKVeSEHrwSQYh/MfcUe8QqBBX9actY0kgW7G1/Tnv+uuIj+w2swjW151
	yzexhO1SejNTkR3U8eIIPanDkDUpgXefJarMJN66vsL0dDASmSrZFnYJ3qs3AG0uvgeX
	UN8w==
X-Gm-Message-State: APjAAAVs25xN4akNMrzJ2ME2u07mQM6zhLYOVvJW8x1hUk6w0KubSPtl
	3Bh8OVHqBqHgH8M78h0IYpdVcA==
X-Received: by 2002:a5d:4b06:: with SMTP id v6mr6320515wrq.151.1552067991481; 
	Fri, 08 Mar 2019 09:59:51 -0800 (PST)
Received: from [192.168.1.40] (43.red-88-25-181.staticip.rima-tde.net.
	[88.25.181.43]) by smtp.gmail.com with ESMTPSA id
	a24sm12859930wmm.1.2019.03.08.09.59.50
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 09:59:50 -0800 (PST)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com,
	david@redhat.com, 
	pbonzini@redhat.com, ehabkost@redhat.com, richard.henderson@linaro.org, 
	sbhat@linux.ibm.com
References: <20190308152511.10882-1-eric.auger@redhat.com>
	<20190308152511.10882-2-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4dbd1705-af66-6152-d865-5bdfeb290178@redhat.com>
Date: Fri, 8 Mar 2019 18:59:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190308152511.10882-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [PATCH v3 1/2] nvdimm: Rename AcpiNVDIMMState into
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
X-TUID: qcE6eSgGaYQc

On 3/8/19 4:25 PM, Eric Auger wrote:
> As we intend to migrate the acpi_nvdimm_state into
> the base machine with a new dimms_state name, let's
> also rename the datatype.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/acpi/nvdimm.c        | 18 +++++++++---------
>  hw/i386/pc.c            |  2 +-
>  include/hw/i386/pc.h    |  2 +-
>  include/hw/mem/nvdimm.h | 10 +++++-----
>  4 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index e53b2cb681..f73cfb9d90 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -382,7 +382,7 @@ nvdimm_build_structure_caps(GArray *structures, uint32_t capabilities)
>      nfit_caps->capabilities = cpu_to_le32(capabilities);
>  }
>  
> -static GArray *nvdimm_build_device_structure(AcpiNVDIMMState *state)
> +static GArray *nvdimm_build_device_structure(NVDIMMState *state)
>  {
>      GSList *device_list = nvdimm_get_device_list();
>      GArray *structures = g_array_new(false, true /* clear */, 1);
> @@ -416,7 +416,7 @@ static void nvdimm_init_fit_buffer(NvdimmFitBuffer *fit_buf)
>      fit_buf->fit = g_array_new(false, true /* clear */, 1);
>  }
>  
> -static void nvdimm_build_fit_buffer(AcpiNVDIMMState *state)
> +static void nvdimm_build_fit_buffer(NVDIMMState *state)
>  {
>      NvdimmFitBuffer *fit_buf = &state->fit_buf;
>  
> @@ -425,12 +425,12 @@ static void nvdimm_build_fit_buffer(AcpiNVDIMMState *state)
>      fit_buf->dirty = true;
>  }
>  
> -void nvdimm_plug(AcpiNVDIMMState *state)
> +void nvdimm_plug(NVDIMMState *state)
>  {
>      nvdimm_build_fit_buffer(state);
>  }
>  
> -static void nvdimm_build_nfit(AcpiNVDIMMState *state, GArray *table_offsets,
> +static void nvdimm_build_nfit(NVDIMMState *state, GArray *table_offsets,
>                                GArray *table_data, BIOSLinker *linker)
>  {
>      NvdimmFitBuffer *fit_buf = &state->fit_buf;
> @@ -570,7 +570,7 @@ nvdimm_dsm_no_payload(uint32_t func_ret_status, hwaddr dsm_mem_addr)
>  #define NVDIMM_QEMU_RSVD_HANDLE_ROOT         0x10000
>  
>  /* Read FIT data, defined in docs/specs/acpi_nvdimm.txt. */
> -static void nvdimm_dsm_func_read_fit(AcpiNVDIMMState *state, NvdimmDsmIn *in,
> +static void nvdimm_dsm_func_read_fit(NVDIMMState *state, NvdimmDsmIn *in,
>                                       hwaddr dsm_mem_addr)
>  {
>      NvdimmFitBuffer *fit_buf = &state->fit_buf;
> @@ -619,7 +619,7 @@ exit:
>  }
>  
>  static void
> -nvdimm_dsm_handle_reserved_root_method(AcpiNVDIMMState *state,
> +nvdimm_dsm_handle_reserved_root_method(NVDIMMState *state,
>                                         NvdimmDsmIn *in, hwaddr dsm_mem_addr)
>  {
>      switch (in->function) {
> @@ -863,7 +863,7 @@ nvdimm_dsm_read(void *opaque, hwaddr addr, unsigned size)
>  static void
>  nvdimm_dsm_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>  {
> -    AcpiNVDIMMState *state = opaque;
> +    NVDIMMState *state = opaque;
>      NvdimmDsmIn *in;
>      hwaddr dsm_mem_addr = val;
>  
> @@ -925,7 +925,7 @@ void nvdimm_acpi_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev)
>      }
>  }
>  
> -void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
> +void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
>                              FWCfgState *fw_cfg, Object *owner)
>  {
>      memory_region_init_io(&state->io_mr, owner, &nvdimm_dsm_ops, state,
> @@ -1319,7 +1319,7 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
>  }
>  
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
> @@ -2571,7 +2571,7 @@ static void pc_machine_set_nvdimm_persistence(Object *obj, const char *value,
>                                                 Error **errp)
>  {
>      PCMachineState *pcms = PC_MACHINE(obj);
> -    AcpiNVDIMMState *nvdimm_state = &pcms->acpi_nvdimm_state;
> +    NVDIMMState *nvdimm_state = &pcms->acpi_nvdimm_state;
>  
>      if (strcmp(value, "cpu") == 0)
>          nvdimm_state->persistence = 3;
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 54222a202d..94fb620d65 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -45,7 +45,7 @@ struct PCMachineState {
>      OnOffAuto vmport;
>      OnOffAuto smm;
>  
> -    AcpiNVDIMMState acpi_nvdimm_state;
> +    NVDIMMState acpi_nvdimm_state;
>  
>      bool acpi_build_enabled;
>      bool smbus_enabled;
> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> index c5c9b3c7f8..523a9b3d4a 100644
> --- a/include/hw/mem/nvdimm.h
> +++ b/include/hw/mem/nvdimm.h
> @@ -123,7 +123,7 @@ struct NvdimmFitBuffer {
>  };
>  typedef struct NvdimmFitBuffer NvdimmFitBuffer;
>  
> -struct AcpiNVDIMMState {
> +struct NVDIMMState {
>      /* detect if NVDIMM support is enabled. */
>      bool is_enabled;
>  
> @@ -141,13 +141,13 @@ struct AcpiNVDIMMState {
>      int32_t persistence;
>      char    *persistence_string;
>  };
> -typedef struct AcpiNVDIMMState AcpiNVDIMMState;
> +typedef struct NVDIMMState NVDIMMState;
>  
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
> 
