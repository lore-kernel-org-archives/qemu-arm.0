Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18C2E9A04A
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 13:42:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt4IV-0004cE-CD; Thu, 19 Feb 2026 08:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vt4IU-0004bz-Ht
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 08:42:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vt4IS-00009I-Ld
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 08:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771508543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nlU0gqQ7SSFkTN645v6q6gveTl0ygqWw34OGv2frntg=;
 b=H4ygIxMJXxiuzs4AnU83Rb53mSfl6DwO+dB79nqgIP07N4fr1hZ9OADNgzlUhJqMslCoTH
 Z1HZey3tI6FimYdO12brHsO7Zurxza+qNY8A1h1RWmdVdfqOKxv3EG1swP5eCNQAFyrMby
 vzCp5PeBTS6mvibSnXj2Iy1LrQCbNAQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-YpBtvYK0PzObY-0KQBkT2w-1; Thu, 19 Feb 2026 08:42:22 -0500
X-MC-Unique: YpBtvYK0PzObY-0KQBkT2w-1
X-Mimecast-MFC-AGG-ID: YpBtvYK0PzObY-0KQBkT2w_1771508541
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4836fbfa35cso5904615e9.1
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 05:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771508541; x=1772113341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MJimJpf/jwlPEGTqFFiFulNWpE0P5w7dCdYaKuIjWlM=;
 b=IHllrW/uCnL17i4to8L256AJ2uDwTopXPHiIX3fkOJKuRZMgOKyux1lOejYW5m1jOi
 qf25fKjiNNgESdxJ8olimC+uUfYSNtNwErBrSMLHs7wsB+Ondp7rj/VCOQmFDuc41Yvc
 y5Hj6M58AZfgPsON5CR0C6J6/Yl8ULQoBWZMK1nUchx5IsTDjE5JmbsJWDAlG0b1mgQK
 6k7RtPL9fqf/ZF8RZnKeOhNnEtuKvQGFIHCfNXD5D225ObDvXsKoICZhiiIvXVdVopDL
 4kDMnCrgYZ/MpLsJ2RKeCSFPLzIeKglzlBm6BR9qFc4OsHkC8ChA1FSmxRLovcLf6ZST
 CDzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU29yzTRKX2e8/3I5gWCNnOg4k11fgs9G7mQmhpxcaSItmobzdbTwWcHyJzySGS1Cd8Hzw/rFZ84g==@nongnu.org
X-Gm-Message-State: AOJu0YyhYYaGoukKUQq5yn7pWLAZgbV0qTHWT5Yehde5r5mS05fuKPH4
 aEumFsvd/lqSPuirYuEE7/eM4o6NaU/elkvovRIggtnaNpJBPVdf7Us03LPQdUGfgTqrY4ICByg
 IyelKtkaGfawBHeJalWMx6DX0IQ3pehSbPeJOi06Zp9lbAA5jPilQCA==
X-Gm-Gg: AZuq6aIT5UrMKvfrtxyQ8FFXKzYx2u5oMfu5UaQO2a8pHx5zL7HDi/tUOCkMdiyPADc
 VvSJ/SNx8uPf0TNNcisXDFzi1Z8ZtvAmnPrN9FxPlOkYKQIsabI8pAXJ66YxPNlNnyrlNHBelQN
 O0bTWMKC4UtM3TTHD37hgg3aR08qQ1A5mSRY8vp4zhnyaL9mUkm5NDsK0oUTebw0EGAsBtm9YvK
 wPUeUAFPc6gjI1yFKwqBt7USo3jOZQiFgwZo4p52SuhRfTGWrjfWDMkx4DMgRFVTtAYLjO5Zq+u
 nIEi8pY7k+sGrPkt03KRth11Cs4wzaiCWH1H3GdAjY9afk/1q5qdc3FiNhh0AxOIW58bMblp61x
 VXIC0rQ==
X-Received: by 2002:a05:600c:4e54:b0:483:75f1:54f with SMTP id
 5b1f17b1804b1-4839e668ac0mr45432815e9.31.1771508540947; 
 Thu, 19 Feb 2026 05:42:20 -0800 (PST)
X-Received: by 2002:a05:600c:4e54:b0:483:75f1:54f with SMTP id
 5b1f17b1804b1-4839e668ac0mr45432325e9.31.1771508540370; 
 Thu, 19 Feb 2026 05:42:20 -0800 (PST)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31c7774sm4176445e9.10.2026.02.19.05.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 05:42:19 -0800 (PST)
Date: Thu, 19 Feb 2026 14:42:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Li Chen <me@linux.beauty>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Song Gao <gaosong@loongson.cn>, Bibo Mao
 <maobibo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Sunil V L
 <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair
 Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>
Subject: Re: [PATCH v7 1/1] acpi/virt: suppress SPCR when UART0 has no
 serial backend
Message-ID: <20260219144217.0b755810@imammedo>
In-Reply-To: <20260219130403.810220-1-me@linux.beauty>
References: <20260219130403.810220-1-me@linux.beauty>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GEcvti3dWEPdkv531SV1sD4dg-ERpKva3U3Y-oHcwUE_1771508541
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 19 Feb 2026 21:04:02 +0800
Li Chen <me@linux.beauty> wrote:

> From: Li Chen <chenl311@chinatelecom.cn>
>=20
> virt machines always instantiate a PL011/16550 UART at slot 0 and describ=
e
> it in ACPI (DSDT and optional SPCR table). When the command line disables
> the serial backend (e.g. "-serial none"), SPCR still points at UART0 and
> the guest may pick it as the preferred console even though it is not
> usable.
>=20
> Only generate SPCR when UART0 has a chardev backend attached. Keep the
> UART device description in DSDT unchanged so the guest-visible UART
> topology does not change.
>=20

I've though consensus was, if device (frontend) exists,
we should keep it described in ACPI (regardless of backend state).

> The bios-tables-test qtests use "-serial null" to keep SPCR enabled while
> discarding firmware serial output, avoiding TAP stdout corruption.

It's tests issue, I'd say fix it there.
See for more below.

=20
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
> v6 -> v7:
>   Do not gate DSDT UART devices on serial_hd(0); only gate SPCR.
>   Drop the serial_exists() helper added by v6.
>   Keep bios-tables-test using "-serial null" (comment wording update).
>=20
> v5 -> v6:
>   Fix TAP parsing errors by using "-serial null" in bios-tables-test.
>=20
> v4 -> v5:
>   Also suppress UART device & SPCR when guest has no serial hardware on
>   loongarch.
>   Rename serial_exist to serial_exists.
>   Fix style issues.
>=20
>  hw/arm/virt-acpi-build.c       | 3 ++-
>  hw/loongarch/virt-acpi-build.c | 2 +-
>  hw/riscv/virt-acpi-build.c     | 3 ++-
>  tests/qtest/bios-tables-test.c | 7 +++++--
>  4 files changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index c145678185..1411f98ea1 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -64,6 +64,7 @@
>  #include "hw/virtio/virtio-acpi.h"
>  #include "target/arm/cpu.h"
>  #include "target/arm/multiprocessing.h"
> +#include "system/system.h"
> =20
>  #define ARM_SPI_BASE 32
> =20
> @@ -1291,7 +1292,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBui=
ldTables *tables)
> =20
>      acpi_add_table(table_offsets, tables_blob);
> =20
> -    if (ms->acpi_spcr_enabled) {
> +    if (ms->acpio_spcr_enabled && serial_hd(0)) {

if you really need to disable spcr,
add a knob to do so instead of gating it on backend state.

Having serial console configured and sent to /dev/null
is a legit config (ex: testing that writes to console do not explode machin=
e,
but not really caring where writes end up) =20
=20
>          spcr_setup(tables_blob, tables->linker, vms);
>      }
> =20
> diff --git a/hw/loongarch/virt-acpi-build.c b/hw/loongarch/virt-acpi-buil=
d.c
> index 54ac94e17d..dc8bbb9fdc 100644
> --- a/hw/loongarch/virt-acpi-build.c
> +++ b/hw/loongarch/virt-acpi-build.c
> @@ -546,7 +546,7 @@ static void acpi_build(AcpiBuildTables *tables, Machi=
neState *machine)
>      build_srat(tables_blob, tables->linker, machine);
>      acpi_add_table(table_offsets, tables_blob);
> =20
> -    if (machine->acpi_spcr_enabled)
> +    if (machine->acpi_spcr_enabled && serial_hd(0))
>          spcr_setup(tables_blob, tables->linker, machine);
> =20
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
> =20
>  #define ACPI_BUILD_TABLE_SIZE             0x20000
>  #define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
> @@ -890,7 +891,7 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBu=
ildTables *tables)
> =20
>      acpi_add_table(table_offsets, tables_blob);
> =20
> -    if (ms->acpi_spcr_enabled) {
> +    if (ms->acpi_spcr_enabled && serial_hd(0)) {
>          spcr_setup(tables_blob, tables->linker, s);
>      }
> =20
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index e489d94331..37f2b72d83 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -825,10 +825,13 @@ static char *test_acpi_create_args(test_data *data,=
 const char *params)
>          /*
>           * TODO: convert '-drive if=3Dpflash' to new syntax (see e33763b=
e7cd3)
>           * when arm/virt boad starts to support it.
> +         * NOTE: Explicitly add "-serial null" to keep SPCR enabled whil=
e
> +         *       discarding firmware serial output (avoid corrupting TAP
> +         *       stdout).
>           */
>          if (data->cd) {
>              args =3D g_strdup_printf("-machine %s%s %s -accel tcg "
> -                "-nodefaults -nographic "
> +                "-nodefaults -serial null -nographic "
>                  "-drive if=3Dpflash,format=3Draw,file=3D%s,readonly=3Don=
 "
>                  "-drive if=3Dpflash,format=3Draw,file=3D%s,snapshot=3Don=
 -cdrom %s %s",
>                  data->machine, data->machine_param ?: "",
> @@ -836,7 +839,7 @@ static char *test_acpi_create_args(test_data *data, c=
onst char *params)
>                  data->uefi_fl1, data->uefi_fl2, data->cd, params ? param=
s : "");
>          } else {
>              args =3D g_strdup_printf("-machine %s%s %s -accel tcg "
> -                "-nodefaults -nographic "
> +                "-nodefaults -serial null -nographic "
>                  "-drive if=3Dpflash,format=3Draw,file=3D%s,readonly=3Don=
 "
>                  "-drive if=3Dpflash,format=3Draw,file=3D%s,snapshot=3Don=
 %s",
>                  data->machine, data->machine_param ?: "",


