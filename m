Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp47932njg;
        Tue, 17 Sep 2024 02:04:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrL8APKr63zt2my0MyPve5DqZWrah017ADcJmbLy2uoI1NASIR+HlIgmCH8jY2wyZxMvJemnXMQEoLTg==@linaro.org
X-Google-Smtp-Source: AGHT+IGLAHCsu3QFSCnBjmHGw+CrYlkXhlJ+ME/KNcSRCoTjUpTFmaL7gHF2d6/W6iKycEVf+lhW
X-Received: by 2002:a05:6214:5bc9:b0:6c1:8663:e8f0 with SMTP id 6a1803df08f44-6c57df5fc87mr238560386d6.28.1726563862224;
        Tue, 17 Sep 2024 02:04:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726563862; cv=none;
        d=google.com; s=arc-20240605;
        b=Gj9W44vVKVKuOpUS0yD3O5PQPlRFc9wSGJuPklSH4fKTDdB7v404ev4OqyPvwor41N
         gGzfGLhvaS4NDnmTbCjqr1Sj0kribUFSNv5xtjCJXByshukk4junVHU3thYX5YGf9Wlj
         bm/RD2K2c4J3CDpf67N404H9MhbBv4XV2l85mSWy4UgHPDdJu+W0StzMhLhsJPgs7QQQ
         58jZbgbug7sWED34ocA83HOiE9VSvpAZLTyv6o0nPxOPt48vGUulue7/OlLQgo8KmXye
         n7aVNwHOFn8sSsv6x7DIjjECETBPppdozWnVx1u5QJO9wjL1YKJwAU4qloVyEFiL3a+3
         yINA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=X1ZF6Dnn/S7K1sptevxsBbHlA1Am2fEgJoTIq25gz3I=;
        fh=dbPOytNbOkdq8qp06r3hjwdPVmPt9aOCupv4/AsbEa4=;
        b=GCSNUP+uaZEJ+4k+uAhFc1caK0cdXAtegAPRkl0syPPzVLQLt0h8OsWlqSZ93zW7US
         9fnwkAdCt28TeKF9fi5Vm/jJ9G5Z5DAw3tONuo7ojzctUH2MSaOZXAbW5OwDmZs2feQW
         +yiJ1P9xW0KTxsgAUKaXSQUd2P2SkB6M7VPaWXY0VGngYHYSjOxR72mbQfi5tvkV8PwI
         +WJaBacfQ7LcCwy/p2o9yLOlNdGsMyxnTEDvqkNVyHRjR4vwvUPelvuvE0D9HSmNWIq/
         dlvXqLZtuF6GuxgO16Baq3zgCOrjHXf3m7isPY2KLo7wrHXYuKV9htN3M+9rhI/0XKuT
         CBiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="a6Xs/mMi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c58c621094si76739956d6.115.2024.09.17.02.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2024 02:04:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="a6Xs/mMi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sqU7i-0001St-Tv; Tue, 17 Sep 2024 05:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sqU7f-0001Ql-L1
 for qemu-arm@nongnu.org; Tue, 17 Sep 2024 05:03:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sqU5z-0001ej-9x
 for qemu-arm@nongnu.org; Tue, 17 Sep 2024 05:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726563707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1ZF6Dnn/S7K1sptevxsBbHlA1Am2fEgJoTIq25gz3I=;
 b=a6Xs/mMiYbWKWx9N2NDZnP6SndVrYaYgpv614rUVhYcRkQ9PKpqFCwINlGENEi/2lIDuW7
 IOywoRI73jEsHBCcrCdp5DlVLZbLY/CbFhF6VBo52mNUMciv94Oszxoxz2F5txZCgWVIGD
 //K7G6Lww8SyQ2mqEGHP/DuGIm06L4c=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-RhYCNuahP_KEZEltlde6mw-1; Tue, 17 Sep 2024 05:01:45 -0400
X-MC-Unique: RhYCNuahP_KEZEltlde6mw-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2f761cfa667so35591311fa.3
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2024 02:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726563704; x=1727168504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X1ZF6Dnn/S7K1sptevxsBbHlA1Am2fEgJoTIq25gz3I=;
 b=BYIcHRgFiq8JUKAT4h2z87fHMi4qfl5/aa6tlbXNVxlcIeKNDRb3At9ai8MOsgVRUg
 HV8YlMH5fj/CYfq5jhIZcbSC8bx+iq/3VaYNk/zPB3TRKBtFfCT3DC12tMRxhsoGmoOE
 yJYf4Tnufllmo0NSOAPoT1Hjr0T7FfxjDwAtkAKsuGgMG9ZaDpMj4YHiusqGPLe54Q79
 19NOgZMl/2ITBFunpLA3/2vwSOJtZl4sQAumpT2nwZNVRl5J+GXTtJ++zFvJ7bRH4qlu
 qqEBTOGqOznXJ6r/dDtawWDZ7v8lOMfHmVnGKZPWbdH4Njg8ED/rBxMIEThTAwUrA9Ac
 Xwmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEe/tKatmy8Z3oQv/AQeAQtkHK/y32yQbQzFAv3BuptGLOaVmP1BBLj2nhREYIrw3ON3VK6oN5iw==@nongnu.org
X-Gm-Message-State: AOJu0Yzs9PiB0wOWD6DSU+9GnqsGMrWor0tPAhIoAuENjR1fTGgUlhmS
 GCUzyUFNjCywr1V2o7jUahhYKN3Jz81i1+lYe7NLLs3+9ZBT0O4IvOr+Skcf91KaN81+Vg79zn5
 QVqxI9i3fcdmFYipH5ghtBiLvoN0YacCGmkIG9Adml+dZpeGyIQ==
X-Received: by 2002:a05:651c:2211:b0:2ef:21b3:cdef with SMTP id
 38308e7fff4ca-2f787edd67dmr102350471fa.25.1726563703728; 
 Tue, 17 Sep 2024 02:01:43 -0700 (PDT)
X-Received: by 2002:a05:651c:2211:b0:2ef:21b3:cdef with SMTP id
 38308e7fff4ca-2f787edd67dmr102350181fa.25.1726563703080; 
 Tue, 17 Sep 2024 02:01:43 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e78054cesm8973686f8f.108.2024.09.17.02.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 02:01:42 -0700 (PDT)
Date: Tue, 17 Sep 2024 11:01:41 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v10 05/21] acpi/ghes: better handle source_id and
 notification
Message-ID: <20240917110141.44362795@imammedo.users.ipa.redhat.com>
In-Reply-To: <409491c21021b3cc0b239bb95ca6cc78e6adda10.1726293808.git.mchehab+huawei@kernel.org>
References: <cover.1726293808.git.mchehab+huawei@kernel.org>
 <409491c21021b3cc0b239bb95ca6cc78e6adda10.1726293808.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: YEFU0BQ5Pmro

On Sat, 14 Sep 2024 08:13:26 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> GHES has two fields with somewhat meanings:

if 'somewhat' means similar, than it's not.
type is defining a way OSPM is notified about error
while source_id id fw/hw defined arbitrary number that specify
a concrete error reporting source. One can easily have several source ids
with the same notification type.


> - notification type, which is a number defined at the ACPI spec
>   containing several arch-specific synchronous and assynchronous
>   types;
> - source id, which is a HW/FW defined number, used to distinguish
>   between different implemented hardware report mechanisms.

s/mechanisms/sources/

> The current logic is arm-specific, implementing a single source ID,
> for an armv8-specific synchronous report mechanism (SEA).

regardless, above chunk doesn't seem to be relevant to what patch does.

> Cleanup the code to make easier to add other types and make the
> code portable to non-ARM.
> 
> As a collateral effect of such change, build_ghes_error_table()
> function is now an internal function.

all of above doesn't explain why it's good idea,
commit message should be self sufficient for anyone without prior
knowledge if series history to understand what & why of the patch.

The patch does 2 things
 1. hide build_ghes_error_table()
 2. adds notify to  build_ghes_v2()

it's the best to split these and accompany them with commit messages
explaining why it's needed. 
 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> ---
> 
> Changes from v8:
> - Non-rename/cleanup changes merged altogether;
> - source ID is now more generic, defined per guest target.
>   That should make easier to add support for 86.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/acpi/ghes.c           | 31 +++++++++++++++----------------
>  hw/arm/virt-acpi-build.c |  5 ++---
>  include/hw/acpi/ghes.h   |  6 +++---
>  3 files changed, 20 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 17b7d9e10f3e..939e89723a2f 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -234,7 +234,7 @@ static int acpi_ghes_record_mem_error(uint64_t error_block_address,
>   * Initialize "etc/hardware_errors" and "etc/hardware_errors_addr" fw_cfg blobs.
>   * See docs/specs/acpi_hest_ghes.rst for blobs format.
>   */
> -void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
> +static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
>  {
>      int i, error_status_block_offset;
>  
> @@ -285,9 +285,13 @@ void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
>  }
>  
>  /* Build Generic Hardware Error Source version 2 (GHESv2) */
> -static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
> +static void build_ghes_v2(GArray *table_data,
> +                          BIOSLinker *linker,
> +                          enum AcpiGhesNotifyType notify,
> +                          uint16_t source_id)
>  {
>      uint64_t address_offset;
> +
>      /*
>       * Type:
>       * Generic Hardware Error Source version 2(GHESv2 - Type 10)
> @@ -317,18 +321,8 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
>          address_offset + GAS_ADDR_OFFSET, sizeof(uint64_t),
>          ACPI_GHES_ERRORS_FW_CFG_FILE, source_id * sizeof(uint64_t));
>  
> -    switch (source_id) {
> -    case ACPI_HEST_SRC_ID_SEA:
> -        /*
> -         * Notification Structure
> -         * Now only enable ARMv8 SEA notification type
> -         */
> -        build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_SEA);
> -        break;
> -    default:
> -        error_report("Not support this error source");
> -        abort();
> -    }
> +    /* Notification Structure */
> +    build_ghes_hw_error_notification(table_data, notify);
>  
>      /* Error Status Block Length */
>      build_append_int_noprefix(table_data, ACPI_GHES_MAX_RAW_DATA_LENGTH, 4);
> @@ -357,19 +351,24 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
>  }
>  
>  /* Build Hardware Error Source Table */
> -void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
> +void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
> +                     BIOSLinker *linker,
>                       const char *oem_id, const char *oem_table_id)
>  {
>      AcpiTable table = { .sig = "HEST", .rev = 1,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
>  
> +    build_ghes_error_table(hardware_errors, linker);
> +
>      acpi_table_begin(&table, table_data);
>  
> +    /* Beginning at the HEST Error Source struct count and data */
>      int hest_offset = table_data->len;
>  
>      /* Error Source Count */
>      build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
> -    build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
> +    build_ghes_v2(table_data, linker,
> +                  ACPI_GHES_NOTIFY_SEA, ACPI_HEST_SRC_ID_SEA);
>  
>      acpi_table_end(linker, &table);
>  
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f76fb117adff..bafd9a56c217 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -943,10 +943,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      build_dbg2(tables_blob, tables->linker, vms);
>  
>      if (vms->ras) {
> -        build_ghes_error_table(tables->hardware_errors, tables->linker);
>          acpi_add_table(table_offsets, tables_blob);
> -        acpi_build_hest(tables_blob, tables->linker, vms->oem_id,
> -                        vms->oem_table_id);
> +        acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
> +                        vms->oem_id, vms->oem_table_id);
>      }
>  
>      if (ms->numa_state->num_nodes > 0) {
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 5421ffcbb7fa..c9bbda4740e2 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -69,12 +69,12 @@ typedef struct AcpiGhesState {
>      bool present; /* True if GHES is present at all on this board */
>  } AcpiGhesState;
>  
> -void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
> -void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
> +void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
> +                     BIOSLinker *linker,
>                       const char *oem_id, const char *oem_table_id);
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                            GArray *hardware_errors);
> -int acpi_ghes_record_errors(uint8_t notify, uint64_t error_physical_addr);
> +int acpi_ghes_record_errors(uint8_t source_id, uint64_t error_physical_addr);
>  
>  /**
>   * acpi_ghes_present: Report whether ACPI GHES table is present

