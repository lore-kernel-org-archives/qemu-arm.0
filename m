Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2275676njd;
        Tue, 22 Apr 2025 04:20:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUbSU33DelCSm97FqvZtMbEmdrKV8Sv2/J6s25EJYQJeyo6k3xIEFnKlcF0EXLkVi/TI5rcQukvtbZuRw==@linaro.org
X-Google-Smtp-Source: AGHT+IFXcXRT/xM2+p/HvbsBEdkqFUkD0rilkZ4UMOHQyhN85cLaNykrKFRQO5L6Jxg0SFVNN7QK
X-Received: by 2002:a05:620a:2891:b0:7c7:b570:e2b1 with SMTP id af79cd13be357-7c92574db62mr2783731785a.7.1745320813351;
        Tue, 22 Apr 2025 04:20:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745320813; cv=none;
        d=google.com; s=arc-20240605;
        b=Hu8eNq9FcYy7by+8UdRyXRRX2Fx63PCRXNgoQ5QP0Cvpe+g7f9MMeO33Eb2Gt3uTZ5
         1E5CSpz5LWzY0kWPoU3YU1HTyBPEpDrH3X85Xfj+fTorOaGbVV0FuXfsw30ykuVmEFUr
         vBpQxjIUcYKc0krDWEPBsSZ2j/JitsqwPjWYrgQnugRXU61jeJyrtMunHg2FRoe9Fi8L
         0Z4sj2gwhVUFa+FiRIL2ZRFWorapmK7roFuXvQNBOgnye7eDAhnoH2crj8Numj90+KL4
         DS+rcivQ7s0kJSOhCAxquvgB0IbmFnCeqOi0LwLtQL/YSyXTstno/P4rdO53ZZyGHaEX
         Vg1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=lsdmIFtX99VQcGuR1LBZf7rR8W5MrQzqwjTqq52/G6A=;
        fh=6LleCsWAL+s0MhhNTUtqLsBR3KThBu3OShyYDU6oGzA=;
        b=UHn1a9Ilty/34un/76d84fyTImMB29jERnSq2XcipWIgQZboBtsC/Oyra8xnsoJBl+
         FPOKk+N07idOu8mPRglEtY9ZOsQ0oifQLsLR5atHUjmWQOoFPfJEv954XhbRX+yClfEC
         52t7raM03xWNzTTdSU1ZCuEUm/27DjTIwOR2UGfdCJ0h5ouLYRe+dv2nzOpBkxgm6cQW
         hgTN8XqmyLzcI9Qs4RdJqloM0qZa9HwphD0DmNRKpoe1O6ZSH0glrp4t71/oSqIMk83Z
         qdn1CNV1sWpXed7s/Ir2HbuOFbkpAcpi0GC1+ycHkUl1ah0zjtb626WJGvk1B5YvVyXq
         5rZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aiTx3zlo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c925c0006dsi1076277485a.641.2025.04.22.04.20.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 04:20:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aiTx3zlo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7BfA-00026K-JF; Tue, 22 Apr 2025 07:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1u7Bf8-00025v-82
 for qemu-arm@nongnu.org; Tue, 22 Apr 2025 07:19:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1u7Bf3-0005iL-N3
 for qemu-arm@nongnu.org; Tue, 22 Apr 2025 07:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745320772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lsdmIFtX99VQcGuR1LBZf7rR8W5MrQzqwjTqq52/G6A=;
 b=aiTx3zloH7oEYIqjp+lXZB/NTlckuRBHQlXSmnEA2U3cuJ2Ge1Blnzq6yVhU9JBxRMITby
 WwvJo8IWhrTABO3uBrQqEUfB6GJ9Adz7iHoDhr6KIFSn14RxudukB1etZI+edJLn97I6go
 dtOSKyzwYtmn0jnPXjRi1HFqD/Vqd3k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-3YN0gescPwmaiwzgEbiKbA-1; Tue, 22 Apr 2025 07:19:29 -0400
X-MC-Unique: 3YN0gescPwmaiwzgEbiKbA-1
X-Mimecast-MFC-AGG-ID: 3YN0gescPwmaiwzgEbiKbA_1745320768
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43947a0919aso37306725e9.0
 for <qemu-arm@nongnu.org>; Tue, 22 Apr 2025 04:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745320768; x=1745925568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lsdmIFtX99VQcGuR1LBZf7rR8W5MrQzqwjTqq52/G6A=;
 b=MB2Su+Ib0WXY63bOMjvy4ahKDG8wu6AiOeQMzRBIOgJ0wvQyIwesBcRw+x0xaN3ABH
 Vt3fY4tfahFBny9nY9OX3MvcfBTqZzIWryiaM8O1UbKvrBHlqoGaIiYxod/Hh6yyH3i8
 ta134fbz1zpJLMbHIjTSGrKlM+yUnFz53+aMTTSKqnbZQYlmM8A9HE0oBR1hR/BFf01J
 GVEJ5Ds2JRI4FnCx3R3psqbMK0TUqtujYx87EhiIgBH6JUsk/SpmSaVOLv627xcKetyj
 UpDh4KCxMYSssIYcm+ftqHFPhj/3biZul10J77Di+nvi36l7jWV1SE0IwLiUtIrLQqib
 J5cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD9+FmrlNd1JxTD36lwSWGvlZcRgVDJ3iiw3vFdA3jI5c/peHqcT9xRPGO5PWei69+Dh/YMW/YsA==@nongnu.org
X-Gm-Message-State: AOJu0YylT9DJnPX1LFITsnf2A0sAnUE9bNV77NvMhnYpiNz0CwlL7hT5
 qtHxJZu2P3j5cXOVjwIQu7wvCxOpeMH4uYMztgRQ3Woc80Zec/MLvh4uzcl/6qrYhxudSWCC6oI
 FqljcOS5CHP2GUp2NtNTyUGoXwC8DemNBITuJvFZl3AJG5npVmA==
X-Gm-Gg: ASbGnctcx8WLKJOrl3qc2oDsJWuuAgrGexyZDcB5E61bdgaa2sqCW8nPSAe2scv7CkR
 ut9Opk2BLWNkQAdosAVhXDKyFWCq6nqpVUcFisDHbxJKNijmamxtjycoBvf1qHkIT5sCaqCYJBf
 USpaY7XvNwRHAssaWjPfE4jRB2/7TcAovivju2tJ/Mpko2wmg1f8skunMm1jeUBxCXTkAk4xTHz
 YmYfHezXCjAxgFZYdqSkVNTBXUAYWon6l+MucGOiPGGs2fDt93coP6H/VO59m//CIiNUufXe+f0
 cdxNxA==
X-Received: by 2002:a05:600c:444e:b0:43c:fe9f:ab90 with SMTP id
 5b1f17b1804b1-4406ac17342mr101370685e9.28.1745320767772; 
 Tue, 22 Apr 2025 04:19:27 -0700 (PDT)
X-Received: by 2002:a05:600c:444e:b0:43c:fe9f:ab90 with SMTP id
 5b1f17b1804b1-4406ac17342mr101370305e9.28.1745320767397; 
 Tue, 22 Apr 2025 04:19:27 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d6db230sm171907035e9.31.2025.04.22.04.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 04:19:26 -0700 (PDT)
Date: Tue, 22 Apr 2025 07:19:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Li Chen <me@linux.beauty>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?=22Philippe_Mathieu-Daud=E9=22?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH] acpi: Add machine option to disable SPCR table
Message-ID: <20250422071902-mutt-send-email-mst@kernel.org>
References: <87a588wsc9.wl-me@linux.beauty>
MIME-Version: 1.0
In-Reply-To: <87a588wsc9.wl-me@linux.beauty>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sZ8SBSSrCUEcC4h06lazUr4_CQ4lKrPS94llWvY050A_1745320768
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 3UtttE552fdo

On Tue, Apr 22, 2025 at 03:47:18PM +0800, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> The ACPI SPCR (Serial Port Console Redirection) table allows firmware
> to specify a preferred serial console device to the operating system.
> On ARM64 systems, Linux by default respects this table: even if the
> kernel command line does not include a hardware serial console (e.g.,
> "console=ttyAMA0"), the kernel still register the serial device
> referenced by SPCR as a printk console.
> 
> While this behavior is standard-compliant, it can lead to situations
> where guest console behavior is influenced by platform firmware rather
> than user-specified configuration. To make guest console behavior more
> predictable and under user control, this patch introduces a machine
> option to explicitly disable SPCR table exposure:
> 
>     -machine spcr=off
> 
> By default, the option is enabled (spcr=on), preserving existing
> behavior. When disabled, QEMU will omit the SPCR table from the guest's
> ACPI namespace, ensuring that only consoles explicitly declared in the
> kernel command line are registered.
> 
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>


The patches look ok to me

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> ---
>  hw/arm/virt-acpi-build.c       |  5 ++++-
>  hw/core/machine.c              | 22 ++++++++++++++++++++++
>  hw/loongarch/virt-acpi-build.c |  4 +++-
>  hw/riscv/virt-acpi-build.c     |  5 ++++-
>  include/hw/boards.h            |  1 +
>  qemu-options.hx                |  5 +++++
>  6 files changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3ac8f8e178..f25c3b26ce 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -940,7 +940,10 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      }
>  
>      acpi_add_table(table_offsets, tables_blob);
> -    spcr_setup(tables_blob, tables->linker, vms);
> +
> +    if (ms->enable_spcr) {
> +        spcr_setup(tables_blob, tables->linker, vms);
> +    }
>  
>      acpi_add_table(table_offsets, tables_blob);
>      build_dbg2(tables_blob, tables->linker, vms);
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 63c6ef93d2..d56f44f4e8 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -590,6 +590,20 @@ static void machine_set_nvdimm(Object *obj, bool value, Error **errp)
>      ms->nvdimms_state->is_enabled = value;
>  }
>  
> +static bool machine_get_spcr(Object *obj, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    return ms->enable_spcr;
> +}
> +
> +static void machine_set_spcr(Object *obj, bool value, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);
> +
> +    ms->enable_spcr = value;
> +}
> +
>  static bool machine_get_hmat(Object *obj, Error **errp)
>  {
>      MachineState *ms = MACHINE(obj);
> @@ -1294,6 +1308,14 @@ static void machine_initfn(Object *obj)
>                                          "Table (HMAT)");
>      }
>  
> +    /* SPCR */
> +    ms->enable_spcr = true;
> +    object_property_add_bool(obj, "spcr", machine_get_spcr, machine_set_spcr);
> +    object_property_set_description(obj, "spcr",
> +                                   "Set on/off to enable/disable "
> +                                   "ACPI Serial Port Console Redirection "
> +                                   "Table (spcr)");
> +
>      /* default to mc->default_cpus */
>      ms->smp.cpus = mc->default_cpus;
>      ms->smp.max_cpus = mc->default_cpus;
> diff --git a/hw/loongarch/virt-acpi-build.c b/hw/loongarch/virt-acpi-build.c
> index fced6c445a..0e437bcf25 100644
> --- a/hw/loongarch/virt-acpi-build.c
> +++ b/hw/loongarch/virt-acpi-build.c
> @@ -557,7 +557,9 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      acpi_add_table(table_offsets, tables_blob);
>      build_srat(tables_blob, tables->linker, machine);
>      acpi_add_table(table_offsets, tables_blob);
> -    spcr_setup(tables_blob, tables->linker, machine);
> +
> +    if (machine->enable_spcr)
> +        spcr_setup(tables_blob, tables->linker, machine);
>  
>      if (machine->numa_state->num_nodes) {
>          if (machine->numa_state->have_numa_distance) {
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 1ad6800508..7f6d221c63 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -680,7 +680,10 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
>      build_rhct(tables_blob, tables->linker, s);
>  
>      acpi_add_table(table_offsets, tables_blob);
> -    spcr_setup(tables_blob, tables->linker, s);
> +
> +    if (ms->enable_spcr) {
> +        spcr_setup(tables_blob, tables->linker, s);
> +    }
>  
>      acpi_add_table(table_offsets, tables_blob);
>      {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index f22b2e7fc7..cdf2791a50 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -444,6 +444,7 @@ struct MachineState {
>      SmpCache smp_cache;
>      struct NVDIMMState *nvdimms_state;
>      struct NumaState *numa_state;
> +    bool enable_spcr;
>  };
>  
>  /*
> diff --git a/qemu-options.hx b/qemu-options.hx
> index dc694a99a3..953680595f 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -38,6 +38,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>      "                nvdimm=on|off controls NVDIMM support (default=off)\n"
>      "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
>      "                hmat=on|off controls ACPI HMAT support (default=off)\n"
> +    "                spcr=on|off controls ACPI SPCR support (default=on)\n"
>  #ifdef CONFIG_POSIX
>      "                aux-ram-share=on|off allocate auxiliary guest RAM as shared (default: off)\n"
>  #endif
> @@ -105,6 +106,10 @@ SRST
>          Enables or disables ACPI Heterogeneous Memory Attribute Table
>          (HMAT) support. The default is off.
>  
> +    ``spcr=on|off``
> +        Enables or disables ACPI Serial Port Console Redirection Table
> +        (SPCR) support. The default is on.
> +
>      ``aux-ram-share=on|off``
>          Allocate auxiliary guest RAM as an anonymous file that is
>          shareable with an external process.  This option applies to
> -- 
> 2.49.0

