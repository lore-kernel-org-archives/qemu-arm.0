Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp98820nji;
        Thu, 11 Jul 2024 04:14:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMkZ43vxpxroChI6O9qWEbCxu40gFlZH1Wlooz+yc4qWoq9WcvN+Luzx7Iy06zsNE0tEnAFpj6Tv/UXSU4wCsMvxeeTKp3
X-Google-Smtp-Source: AGHT+IHMtn8EPWoz/4YubWBqzqyiyjGCAG2PIws6xhm/5PdVh6U4QUy4a/qDBS2oaimQJEgzd5K8
X-Received: by 2002:a05:6808:ec8:b0:3d9:2861:7489 with SMTP id 5614622812f47-3d93c03d986mr9261260b6e.30.1720696444283;
        Thu, 11 Jul 2024 04:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720696444; cv=none;
        d=google.com; s=arc-20160816;
        b=1EvBgBuP6lQD+A1xXrPqMizqqwdQplLieFRJfWZHDlAZ121n7UX549jY4Txcz/T0BR
         MKSVCTNcSgnOD0VTv1aYEJ6wuERXv6FHtYYmxn5wpi285sv/a7u/Ew0fVRayfA64aI0i
         n799rz6s/afG8tu0r1PUzN7rdPYQjGXJXtmVqP1jLWnLvGiG+4Fmgeapk9QPOjRv/P6y
         4tOth84ad8+yCYzBup3o6xse8qeiEgoE+1GFUSOS5Iaz30Ya24BDuiXS37EZFZLv1zmh
         GdOjx5lL9cWpclLxq1Q9IX8O/mXXBZyUY/OW46vD4cxnw7HQebSycDaafl2o0DY7Bt2W
         F8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=awvhj1eI1SLrWuTnl02QzGs/zpijLw4w3qPrPyKN+zE=;
        fh=WBEAwz1vUYDL9aZuRbFZntcQbM4042auU7j1nqerSSw=;
        b=ql1OsKmYOvgkUBXOgA7zzS+YqswMHI53qninQYrO3UnGa1AYW2lg7MaDaviItjR/H2
         RGNOajf0im2WXXruMMs+j/fnpfF36FW7BfHV5UnEjDj5RubB2VARN8qaYJpYBiKsiilJ
         yq0OTEOC3iOARF76J+yVBeEO+l7Bv3A9SjouHNIACxe+PdDZjTj3hWeDODkdwxK1Xy0B
         4N5Yn9x1angOYhVZzmdb43Z1REylWoqFDCf/3hVO1QLqGTAbm1+BP6KmKUfy7EHganBM
         FRA1ufIRO4tvuPytKH0twUUiOpYPg8en/695g3MvcYwHpXMbC7YDFGZLCiKzoUimV8py
         ftOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aywME+39;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f19029286si670601685a.162.2024.07.11.04.14.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2024 04:14:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aywME+39;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRrk9-0003a1-EX; Thu, 11 Jul 2024 07:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sRrk7-0003TA-QN
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 07:13:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sRrk5-0005xd-VD
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 07:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720696420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awvhj1eI1SLrWuTnl02QzGs/zpijLw4w3qPrPyKN+zE=;
 b=aywME+39WC6HVCcCQZYU+DuLIvqsY81IArCZmeibge4BYofAw3QzWBOtuGSSDTq+zOgEFa
 6lAQhDSg2GsK27lGjYucegbWmyz+UqCjz0BZT98ejPzoawNd3fysmQAwSHa2rQP3MO827u
 7LGKvBBpGb8M/mpPKj9AKI6oCaQUPMQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-r4xMtVihOQeREGEiFTaNkw-1; Thu, 11 Jul 2024 07:13:34 -0400
X-MC-Unique: r4xMtVihOQeREGEiFTaNkw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-58d6fdee657so804277a12.2
 for <qemu-arm@nongnu.org>; Thu, 11 Jul 2024 04:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720696413; x=1721301213;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=awvhj1eI1SLrWuTnl02QzGs/zpijLw4w3qPrPyKN+zE=;
 b=A6O6RgIKHNiYgTxGp7hezgvAjZ+HKEZkaLss+St5NlgjFmBLWuagj5KqR+uUKJJy8x
 203ZiwuV3/tGBEKYja45KAy8Nk3rvsEyVZq9B6lV6VxpvbeNkFlwUwRZdkiZHr4bgI04
 OoxHZk7XcYC+SlXBX/l8eIjCI68GTukXB6uelT73dNZKsdzpleKlA8cuVEGoXN2jpsM2
 YEL4SM7i7L2AYZyc9iFxkWgtGsJhMp3X034DGhYzIapBDVocz5TTL2lku6AQYbXsWTn3
 uICd8DTfidqZ5OQOyH1/8OcuxIEjYdcoT3HzSZr3AtXMZ7go3cdJ5GII2g+5nTs/MLkG
 hrjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzitIZPsgSwz1iqWCy2hgSSvxUHaGp4qqdsmTnDzEpLXf3ylP3RS9BK7hQM/c5DQurUNu4moI4Rt8h9HdHMVoDtqVV
X-Gm-Message-State: AOJu0Yx/qTtReOmGS4GnhSSQ/WhRlL/SrVmoGkF304OGvllyBVWqppcG
 ULEL/QVhilRSac3vdvDjYkp2d/McQ8Ct6V0/NimjvTGkhTpzslJcHR8jFOZhtV596EMKL0sHa16
 +RI9j3flT6jKWvGM74WvKAvfZxb3XdC1djHbdscGTsBtusD5Flg==
X-Received: by 2002:a17:906:1d50:b0:a77:d1ea:ab26 with SMTP id
 a640c23a62f3a-a780b89dd5bmr543064266b.65.1720696413114; 
 Thu, 11 Jul 2024 04:13:33 -0700 (PDT)
X-Received: by 2002:a17:906:1d50:b0:a77:d1ea:ab26 with SMTP id
 a640c23a62f3a-a780b89dd5bmr543062666b.65.1720696412513; 
 Thu, 11 Jul 2024 04:13:32 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:761e:f82:fc9a:623b:3fd1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6dc57bsm245099966b.49.2024.07.11.04.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:13:31 -0700 (PDT)
Date: Thu, 11 Jul 2024 07:13:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, philmd@linaro.org,
 wangyanan55@huawei.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, anisinha@redhat.com, qemu-arm@nongnu.org
Subject: Re: [PATCH] smbios: make memory device size configurable per Machine
Message-ID: <20240711071054-mutt-send-email-mst@kernel.org>
References: <20240711074822.3384344-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240711074822.3384344-1-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6WskUdg3voP1

On Thu, Jul 11, 2024 at 09:48:22AM +0200, Igor Mammedov wrote:
> Currently SMBIOS maximum memory device chunk is capped at 16Gb,
> which is fine for the most cases (QEMU uses it to describe initial
> RAM (type 17 SMBIOS table entries)).
> However when starting guest with terabytes of RAM this leads to
> too many memory device structures, which eventually upsets linux
> kernel as it reserves only 64K for these entries and when that
> border is crossed out it runs out of reserved memory.
> 
> Instead of partitioning initial RAM on 16Gb chunks, use maximum
> possible chunk size that SMBIOS spec allows[1]. Which lets
> encode RAM in Mb units in uint32_t-1 field (upto 2047Tb).
> As result initial RAM will generate only one type 17 structure
> until host/guest reach ability to use more RAM in the future.
> 
> Compat changes:
> We can't unconditionally change chunk size as it will break
> QEMU<->guest ABI (and migration). Thus introduce a new machine class
> field that would let older versioned machines to use 16Gb chunks
> while new machine type could use maximum possible chunk size.
> 
> While it might seem to be risky to rise max entry size this much
> (much beyond of what current physical RAM modules support),
> I'd not expect it causing much issues, modulo uncovering bugs
> in software running within guest. And those should be fixed
> on guest side to handle SMBIOS spec properly, especially if
> guest is expected to support so huge RAM configs.
> In worst case, QEMU can reduce chunk size later if we would
> care enough about introducing a workaround for some 'unfixable'
> guest OS, either by fixing up the next machine type or
> giving users a CLI option to customize it.
> 
> 1) SMBIOS 3.1.0 7.18.5 Memory Device — Extended Size
> 
> PS:
> * tested on 8Tb host with RHEL6 guest, which seems to parse
>   type 17 SMBIOS table entries correctly (according to 'dmidecode').
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/boards.h |  4 ++++
>  hw/arm/virt.c       |  1 +
>  hw/core/machine.c   |  1 +
>  hw/i386/pc_piix.c   |  1 +
>  hw/i386/pc_q35.c    |  1 +
>  hw/smbios/smbios.c  | 11 ++++++-----
>  6 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index ef6f18f2c1..48ff6d8b93 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -237,6 +237,9 @@ typedef struct {
>   *    purposes only.
>   *    Applies only to default memory backend, i.e., explicit memory backend
>   *    wasn't used.
> + * @smbios_memory_device_size:
> + *    Default size of memory device,
> + *    SMBIOS 3.1.0 "7.18 Memory Device (Type 17)"

Maybe it would be better to just make this a boolean,
and put the spec related logic in smbios.c ?
WDYT?

>   */
>  struct MachineClass {
>      /*< private >*/
> @@ -304,6 +307,7 @@ struct MachineClass {
>      const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
>      int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);
>      ram_addr_t (*fixup_ram_size)(ram_addr_t size);
> +    uint64_t smbios_memory_device_size;
>  };
>  
>  /**
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b0c68d66a3..719e83e6a1 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3308,6 +3308,7 @@ DEFINE_VIRT_MACHINE_AS_LATEST(9, 1)
>  static void virt_machine_9_0_options(MachineClass *mc)
>  {
>      virt_machine_9_1_options(mc);
> +    mc->smbios_memory_device_size = 16 * GiB;
>      compat_props_add(mc->compat_props, hw_compat_9_0, hw_compat_9_0_len);
>  }
>  DEFINE_VIRT_MACHINE(9, 0)
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index bc38cad7f2..3cfdaec65d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1004,6 +1004,7 @@ static void machine_class_init(ObjectClass *oc, void *data)
>      /* Default 128 MB as guest ram size */
>      mc->default_ram_size = 128 * MiB;
>      mc->rom_file_has_mr = true;
> +    mc->smbios_memory_device_size = 2047 * TiB;
>  
>      /* numa node memory size aligned on 8MB by default.
>       * On Linux, each node's border has to be 8MB aligned



All these values really should be documented.
And I feel 



> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 9445b07b4f..d9e69243b4 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -495,6 +495,7 @@ static void pc_i440fx_machine_9_0_options(MachineClass *m)
>      pc_i440fx_machine_9_1_options(m);
>      m->alias = NULL;
>      m->is_default = false;
> +    m->smbios_memory_device_size = 16 * GiB;
>  
>      compat_props_add(m->compat_props, hw_compat_9_0, hw_compat_9_0_len);
>      compat_props_add(m->compat_props, pc_compat_9_0, pc_compat_9_0_len);
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 71d3c6d122..9d108b194e 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -374,6 +374,7 @@ static void pc_q35_machine_9_0_options(MachineClass *m)
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_machine_9_1_options(m);
>      m->alias = NULL;
> +    m->smbios_memory_device_size = 16 * GiB;
>      compat_props_add(m->compat_props, hw_compat_9_0, hw_compat_9_0_len);
>      compat_props_add(m->compat_props, pc_compat_9_0, pc_compat_9_0_len);
>      pcmc->isa_bios_alias = false;
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 3b7703489d..a394514264 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -1093,6 +1093,7 @@ static bool smbios_get_tables_ep(MachineState *ms,
>                         Error **errp)
>  {
>      unsigned i, dimm_cnt, offset;
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>      ERRP_GUARD();
>  
>      assert(ep_type == SMBIOS_ENTRY_POINT_TYPE_32 ||
> @@ -1123,12 +1124,12 @@ static bool smbios_get_tables_ep(MachineState *ms,
>      smbios_build_type_9_table(errp);
>      smbios_build_type_11_table();
>  
> -#define MAX_DIMM_SZ (16 * GiB)
> -#define GET_DIMM_SZ ((i < dimm_cnt - 1) ? MAX_DIMM_SZ \
> -                                        : ((current_machine->ram_size - 1) % MAX_DIMM_SZ) + 1)
> +#define GET_DIMM_SZ ((i < dimm_cnt - 1) ? mc->smbios_memory_device_size \
> +    : ((current_machine->ram_size - 1) % mc->smbios_memory_device_size) + 1)
>  
> -    dimm_cnt = QEMU_ALIGN_UP(current_machine->ram_size, MAX_DIMM_SZ) /
> -               MAX_DIMM_SZ;
> +    dimm_cnt = QEMU_ALIGN_UP(current_machine->ram_size,
> +                             mc->smbios_memory_device_size) /
> +               mc->smbios_memory_device_size;
>  
>      /*
>       * The offset determines if we need to keep additional space between
> -- 
> 2.43.0

