Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691FAC56204
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Feb 2026 14:51:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vtRqa-0005Fj-Vf; Fri, 20 Feb 2026 09:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vtRqY-0005FT-D7
 for qemu-arm@nongnu.org; Fri, 20 Feb 2026 09:51:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vtRqV-00073v-HB
 for qemu-arm@nongnu.org; Fri, 20 Feb 2026 09:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771599066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPE7YVXm6kmKoX5gNXtVv79J5+rpVhQqdDj3rcJZruQ=;
 b=YkJ/HQKa3tg+SCAiCunWuK4bcfdGleEDAKwvs/LR6YrCN2NxzomfJ3esek1ZHKLOWfhtR9
 lLOCrld9RwyNX7Qzrt3f3Z8umogr0kZWpJpchcOJfhXdRRJp0qbSacr9PkIod2zY+8c4FR
 WcPM6JO/9hYYZW3p2d70uAomXI2tDUY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-pZGYLvVjNEeQw-QluWwCmA-1; Fri, 20 Feb 2026 09:51:03 -0500
X-MC-Unique: pZGYLvVjNEeQw-QluWwCmA-1
X-Mimecast-MFC-AGG-ID: pZGYLvVjNEeQw-QluWwCmA_1771599062
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-4358f90fe8dso1837987f8f.0
 for <qemu-arm@nongnu.org>; Fri, 20 Feb 2026 06:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771599062; x=1772203862;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uPE7YVXm6kmKoX5gNXtVv79J5+rpVhQqdDj3rcJZruQ=;
 b=cC3nj33tDqBvlXdJPu13gRc3AvlBiWdApnkpv5wTBN64/s6w+cVg139RsiTiDBsXHJ
 aH8Mn/KZ+AKO9dYYgqZotUFo5kWJC3/fXQ/6whN4h2VLcZ2i2UJVaN0DbzCWJgMFgyDB
 mj84v1y6sSy7wq/N8g++KWYlPU7i9NKk54Cy1T3K22foWcJRsrCMKD/db9Fdhi8Oqq0z
 T6edw7t3Uf2qNnZXzayXz+9m53LdWyLaPDc3u0tBCAbYx03rm+U5ISiGgebcof98uP/G
 8kqZNE2/pJZCZxaeceecixVA8feF+nRmydDD8ZTykAu3GbyRswnSf+KPQEHAThP2tQgz
 Li8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwGC6NU6DY+b3u+b/2km7gWIJ62Lmr0aCQOBYnDpOE1h8xmHoJQfWXOlGd9PN4Tooa/5X3O7Mq8w==@nongnu.org
X-Gm-Message-State: AOJu0YybjumUHPEXIeuzSbbmDkmsDTPJDeF+AZ/FQNcY3n2pdMfAvkUg
 Od+sFXlr2ukO4QQfDHTfb29fnEuB00BszYtTQzijCNMA19puI3py6aDQQZmB00nCLDzyGcMWu75
 cMtbydHXzToFelvaIrMdNIp0DTmBOzpb6XysOhif2e8YUpY9/1BwYKg==
X-Gm-Gg: AZuq6aLYQ2+Gw4MRLev6FI40xiP0/6vYtKPcaeu0yGQS/qsFh2cHoTmmtEmVQF6Fu4a
 ZyeDCpDS2zcSa0Hg0OhsTg9+8z7WXq49xvAVB4i1BMQQ/GR4BskBsnxnOymw/8EDxpu4/Q9Pu8B
 sECxkdgm4c31rEYt/wqdaj8wnND+6YDnUP4RaQI+7Pn3Z4RrqHXKj2jC0lKwAIkwDMiFiHPLVqc
 qg0SaCrdMCSDcvPyXeaSNUKn4bUYAX5pelz+zUn1NLPBsR8dD0GcO3jqRJjU11+TPX4Nmm/737D
 5C1pFJA/cD1/ygN6qKKS1e5EIDzvRbRMOE0vIp949zDj3sp/cM/u0lT0SFdxm+4hUDpafMNyn7n
 Cy3EDjovy7aYC7JtBPqk+igH8gS1wumsDsQug0PJyIwWNag==
X-Received: by 2002:a05:6000:40cc:b0:435:bcbd:cb29 with SMTP id
 ffacd0b85a97d-439625c9bbbmr11626356f8f.2.1771599061858; 
 Fri, 20 Feb 2026 06:51:01 -0800 (PST)
X-Received: by 2002:a05:6000:40cc:b0:435:bcbd:cb29 with SMTP id
 ffacd0b85a97d-439625c9bbbmr11626297f8f.2.1771599061272; 
 Fri, 20 Feb 2026 06:51:01 -0800 (PST)
Received: from redhat.com (IGLD-80-230-79-166.inter.net.il. [80.230.79.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5d156sm61280027f8f.5.2026.02.20.06.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 06:51:00 -0800 (PST)
Date: Fri, 20 Feb 2026 09:50:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Li Chen <me@linux.beauty>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v7 1/1] acpi/virt: suppress SPCR when UART0 has no serial
 backend
Message-ID: <20260220094834-mutt-send-email-mst@kernel.org>
References: <20260219130403.810220-1-me@linux.beauty>
MIME-Version: 1.0
In-Reply-To: <20260219130403.810220-1-me@linux.beauty>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8nXD2fuUWvjH1X_Fg8xJKJCeazujvlhn2haWsZZA0Fc_1771599062
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Feb 19, 2026 at 09:04:02PM +0800, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> virt machines always instantiate a PL011/16550 UART at slot 0 and describe
> it in ACPI (DSDT and optional SPCR table). When the command line disables
> the serial backend (e.g. "-serial none"), SPCR still points at UART0 and
> the guest may pick it as the preferred console even though it is not
> usable.
> 
> Only generate SPCR when UART0 has a chardev backend attached. Keep the
> UART device description in DSDT unchanged so the guest-visible UART
> topology does not change.
> 
> The bios-tables-test qtests use "-serial null" to keep SPCR enabled while
> discarding firmware serial output, avoiding TAP stdout corruption.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

So -serial null gives a device -serial none hides it from guest.
Sensible. And yet, out of abundance of caution, maybe keep
the legacy behaviour for existing machine types. No?


> v6 -> v7:
>   Do not gate DSDT UART devices on serial_hd(0); only gate SPCR.
>   Drop the serial_exists() helper added by v6.
>   Keep bios-tables-test using "-serial null" (comment wording update).
> 
> v5 -> v6:
>   Fix TAP parsing errors by using "-serial null" in bios-tables-test.
> 
> v4 -> v5:
>   Also suppress UART device & SPCR when guest has no serial hardware on
>   loongarch.
>   Rename serial_exist to serial_exists.
>   Fix style issues.
> 
>  hw/arm/virt-acpi-build.c       | 3 ++-
>  hw/loongarch/virt-acpi-build.c | 2 +-
>  hw/riscv/virt-acpi-build.c     | 3 ++-
>  tests/qtest/bios-tables-test.c | 7 +++++--
>  4 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index c145678185..1411f98ea1 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -64,6 +64,7 @@
>  #include "hw/virtio/virtio-acpi.h"
>  #include "target/arm/cpu.h"
>  #include "target/arm/multiprocessing.h"
> +#include "system/system.h"
>  
>  #define ARM_SPI_BASE 32
>  
> @@ -1291,7 +1292,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  
>      acpi_add_table(table_offsets, tables_blob);
>  
> -    if (ms->acpi_spcr_enabled) {
> +    if (ms->acpi_spcr_enabled && serial_hd(0)) {
>          spcr_setup(tables_blob, tables->linker, vms);
>      }
>  
> diff --git a/hw/loongarch/virt-acpi-build.c b/hw/loongarch/virt-acpi-build.c
> index 54ac94e17d..dc8bbb9fdc 100644
> --- a/hw/loongarch/virt-acpi-build.c
> +++ b/hw/loongarch/virt-acpi-build.c
> @@ -546,7 +546,7 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      build_srat(tables_blob, tables->linker, machine);
>      acpi_add_table(table_offsets, tables_blob);
>  
> -    if (machine->acpi_spcr_enabled)
> +    if (machine->acpi_spcr_enabled && serial_hd(0))
>          spcr_setup(tables_blob, tables->linker, machine);
>  
>      if (machine->numa_state->num_nodes) {
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index f1406cb683..29080d1125 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -39,6 +39,7 @@
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "system/reset.h"
> +#include "system/system.h"
>  
>  #define ACPI_BUILD_TABLE_SIZE             0x20000
>  #define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
> @@ -890,7 +891,7 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
>  
>      acpi_add_table(table_offsets, tables_blob);
>  
> -    if (ms->acpi_spcr_enabled) {
> +    if (ms->acpi_spcr_enabled && serial_hd(0)) {
>          spcr_setup(tables_blob, tables->linker, s);
>      }
>  
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index e489d94331..37f2b72d83 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -825,10 +825,13 @@ static char *test_acpi_create_args(test_data *data, const char *params)
>          /*
>           * TODO: convert '-drive if=pflash' to new syntax (see e33763be7cd3)
>           * when arm/virt boad starts to support it.
> +         * NOTE: Explicitly add "-serial null" to keep SPCR enabled while
> +         *       discarding firmware serial output (avoid corrupting TAP
> +         *       stdout).
>           */
>          if (data->cd) {
>              args = g_strdup_printf("-machine %s%s %s -accel tcg "
> -                "-nodefaults -nographic "
> +                "-nodefaults -serial null -nographic "
>                  "-drive if=pflash,format=raw,file=%s,readonly=on "
>                  "-drive if=pflash,format=raw,file=%s,snapshot=on -cdrom %s %s",
>                  data->machine, data->machine_param ?: "",
> @@ -836,7 +839,7 @@ static char *test_acpi_create_args(test_data *data, const char *params)
>                  data->uefi_fl1, data->uefi_fl2, data->cd, params ? params : "");
>          } else {
>              args = g_strdup_printf("-machine %s%s %s -accel tcg "
> -                "-nodefaults -nographic "
> +                "-nodefaults -serial null -nographic "
>                  "-drive if=pflash,format=raw,file=%s,readonly=on "
>                  "-drive if=pflash,format=raw,file=%s,snapshot=on %s",
>                  data->machine, data->machine_param ?: "",
> -- 
> 2.52.0


