Received: by 10.25.150.194 with SMTP id y185csp2029875lfd;
        Mon, 28 Nov 2016 15:08:24 -0800 (PST)
X-Received: by 10.55.40.229 with SMTP id o98mr20765754qko.260.1480374504837;
        Mon, 28 Nov 2016 15:08:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k38si25870329qtb.196.2016.11.28.15.08.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Nov 2016 15:08:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33591 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBV28-00071M-6R
	for alex.bennee@linaro.org; Mon, 28 Nov 2016 18:08:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cBV22-0006zZ-L1
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 18:08:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cBV20-0003AO-UF
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 18:08:18 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:33473)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cBV1x-00037f-NR; Mon, 28 Nov 2016 18:08:13 -0500
Received: by mail-oi0-x243.google.com with SMTP id f201so15982481oib.0;
	Mon, 28 Nov 2016 15:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=1O2B9rgS7g/PLliIuqehNK3YibOpZ357J0reBTwGtHY=;
	b=b0x+0RAI0oXFdxEXaRwo2QHO4f2Tb9jGuD0fgM8PCitu7GeGI3gNNdxXQeTLWK2nmI
	4FHXpdMmVU1Hs18XEOxbYiLYziAB2OOqLIfWjH2oLiS/AruVBFWR6kFBHcDql0u64Kky
	6ummj68r4+6tB3UV/ntECTHOKh8/nPNGJd98tQrtChzWAh+P1HWT12g/4Rb8szg6Q2DA
	rJFSpcL42TXj1w+JfDd1srupxOZPHd99IUAyVsyLULQ+6EgrAjG/vPAj1dKeFIXMitGV
	/BfH+KyBAaoJNo0TNPFvH1MxueatXQoDkINduG5kGzxgINg5amSodx8bdzqs3i1zBxDK
	3JDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=1O2B9rgS7g/PLliIuqehNK3YibOpZ357J0reBTwGtHY=;
	b=AQk2783hqsB1vjMy8AV0fzz1kmXiQUPKz8X9t/htDPPU0EZs7cO/5/OKgshK8ng+EY
	vuTjmPNIuylAxa2GQP2k4LTH4MrcZmL+QjUIwR/I8ZDYvpGGTb3HzW5TBkozxoYgEDNQ
	LnfNMa5a5+9HEIA8CszR36LRo+LnIdQ8HLR5RfE+kw96Zukfq3I3Dhgj25QOEnyFrzsG
	SEEP34mN5oeeJQg+xXfKU1u07txIS0b09KJzFuF2yqvuNNUJ5VSkatm3DZPn9pQ5VCLf
	dJ7ncrHeModvYGUzATu29AmMobEjirO18324Upk43a5Nip9iiaoTfLMoXThdsxbky5aj
	vCdA==
X-Gm-Message-State: AKaTC00vmooFZ+dlS9pGaTJ2+e274m3AnPaiYWzj3cPT6xTAqVhBaJb/7ct2MaSA+JHtCfIorbB8/K4XPKAI7w==
X-Received: by 10.202.80.149 with SMTP id e143mr11768805oib.93.1480374492318; 
	Mon, 28 Nov 2016 15:08:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.122.34 with HTTP; Mon, 28 Nov 2016 15:07:41 -0800 (PST)
In-Reply-To: <20161128195701.24912-2-lersek@redhat.com>
References: <20161128195701.24912-1-lersek@redhat.com>
	<20161128195701.24912-2-lersek@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 28 Nov 2016 15:07:41 -0800
X-Google-Sender-Auth: yByb0F09-jNTCeYJHAQd4LpN_tc
Message-ID: <CAKmqyKPhVHHor=BEHx-G7UOg8Lck7ki=tf7B_hh_xYpo3o25Rg@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.8 1/2] loader: fix
 handling of custom address spaces when adding ROM blobs
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu devel list <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UAH4HnW4MR1M

On Mon, Nov 28, 2016 at 11:57 AM, Laszlo Ersek <lersek@redhat.com> wrote:
> * Commit 3e76099aacb4 ("loader: Allow a custom AddressSpace when loading
>   ROMs") introduced the "Rom.as" field:
>
>   (1) It modified the utility callers of rom_insert() to take "as" as a
>       new parameter from *their* callers, and set "rom->as" from that
>       parameter. The functions covered were rom_add_file() and
>       rom_add_elf_program().
>
>   (2) It also modified rom_insert() itself, to auto-assign
>       "&address_space_memory", in case the external caller passed -- and
>       the utility caller forwarded -- as=NULL.
>
>   Except, commit 3e76099aacb4 forgot to update the third utility caller of
>   rom_insert(), under point (1), namely rom_add_blob().

I was a little confused by this part. I though you were saying that
it's wrong that I didn't allow rom_add_blob() to add an address space
in that commit.

The idea was that an address space is not required to be set as
rom_insert() will default to address_space_memory if nothing is set.
Although as you mention later it actually did need to be added for the
uimage loading to work as expected.

>
> * Later, commit 5e774eb3bd264 ("loader: Add AddressSpace loading support
>   to uImages") added the load_uimage_as() function, and the
>   rom_add_blob_fixed_as() function-like macro, with the necessary changes
>   elsewhere to propagate the new "as" parameter to rom_add_blob():
>
>     load_uimage_as()
>       load_uboot_image()
>         rom_add_blob_fixed_as()
>           rom_add_blob()
>
>   At this point, the signature (and workings) of rom_add_blob() had been
>   broken already, and the rom_add_blob_fixed_as() macro passed its "_as"
>   parameter to rom_add_blob() as "callback_opaque". Given that the
>   "fw_callback" parameter itself was set to NULL (correctly), this did no
>   additional damage (the opaque arg would never be used), but ultimately
>   it broke the new functionality of load_uimage_as().
>
> * The load_uimage_as() function would be put to use in one of the later
>   patches, commit e481a1f63c93 ("generic-loader: Add a generic loader").
>
> * We can fix this only in a unified patch now. Append "AddressSpace *as"
>   to the signature of rom_add_blob(), and handle the new parameter. Pass
>   NULL from all current callers, except from rom_add_blob_fixed_as(),
>   where "_as" has to be bumped to the proper position.
>
> * Note that rom_add_file() rejects the case when both "mr" and "as" are
>   passed in as non-NULL. The action that this is apparently supposed to
>   prevent is the
>
>     rom->mr = mr;
>
>   assignment (that's the only place where the "mr" parameter is used in
>   rom_add_file()). In rom_add_blob() though, we have no "mr" parameter,
>   and the actions done on the fw_cfg branch:
>
>     if (fw_file_name && fw_cfg) {
>         if (mc->rom_file_has_mr) {
>             data = rom_set_mr(rom, OBJECT(fw_cfg), devpath);
>             mr = rom->mr;
>         } else {
>             data = rom->data;
>         }
>
>   reflect those that are performed by rom_add_file() too (with mr==NULL):
>
>     if (rom->fw_file && fw_cfg) {
>         if ((!option_rom || mc->option_rom_has_mr) &&
>             mc->rom_file_has_mr) {
>             data = rom_set_mr(rom, OBJECT(fw_cfg), devpath);
>         } else {
>             data = rom->data;
>         }
>
>   Hence we need no additional restrictions in rom_add_blob().
>
> * Stable is not affected as both problematic commits appeared first in
>   v2.8.0-rc0.
>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Alistair Francis <alistair.francis@xilinx.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Shannon Zhao <zhaoshenglong@huawei.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> Fixes: 3e76099aacb4dae0d37ebf95305369e03d1491e6
> Fixes: 5e774eb3bd264c76484906f4bd0fb38e00b8090e
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>

Great catch. Sorry about the mistake in there.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  hw/lm32/lm32_hwsetup.h   | 2 +-
>  include/hw/loader.h      | 6 +++---
>  hw/arm/virt-acpi-build.c | 2 +-
>  hw/core/loader.c         | 4 +++-
>  hw/i386/acpi-build.c     | 2 +-
>  5 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/hw/lm32/lm32_hwsetup.h b/hw/lm32/lm32_hwsetup.h
> index b71e6eafba48..23e18784dffd 100644
> --- a/hw/lm32/lm32_hwsetup.h
> +++ b/hw/lm32/lm32_hwsetup.h
> @@ -75,7 +75,7 @@ static inline void hwsetup_create_rom(HWSetup *hw,
>          hwaddr base)
>  {
>      rom_add_blob("hwsetup", hw->data, TARGET_PAGE_SIZE,
> -                 TARGET_PAGE_SIZE, base, NULL, NULL, NULL);
> +                 TARGET_PAGE_SIZE, base, NULL, NULL, NULL, NULL);
>  }
>
>  static inline void hwsetup_add_u8(HWSetup *hw, uint8_t u)
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index 038170624d8f..0c864cfd6046 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -180,7 +180,7 @@ MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
>                             size_t max_len, hwaddr addr,
>                             const char *fw_file_name,
>                             FWCfgReadCallback fw_callback,
> -                           void *callback_opaque);
> +                           void *callback_opaque, AddressSpace *as);
>  int rom_add_elf_program(const char *name, void *data, size_t datasize,
>                          size_t romsize, hwaddr addr, AddressSpace *as);
>  int rom_check_and_register_reset(void);
> @@ -194,7 +194,7 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict);
>  #define rom_add_file_fixed(_f, _a, _i)          \
>      rom_add_file(_f, NULL, _a, _i, false, NULL, NULL)
>  #define rom_add_blob_fixed(_f, _b, _l, _a)      \
> -    rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL)
> +    rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL, NULL)
>  #define rom_add_file_mr(_f, _mr, _i)            \
>      rom_add_file(_f, NULL, 0, _i, false, _mr, NULL)
>  #define rom_add_file_as(_f, _as, _i)            \
> @@ -202,7 +202,7 @@ void hmp_info_roms(Monitor *mon, const QDict *qdict);
>  #define rom_add_file_fixed_as(_f, _a, _i, _as)          \
>      rom_add_file(_f, NULL, _a, _i, false, NULL, _as)
>  #define rom_add_blob_fixed_as(_f, _b, _l, _a, _as)      \
> -    rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, _as)
> +    rom_add_blob(_f, _b, _l, _l, _a, NULL, NULL, NULL, _as)
>
>  #define PC_ROM_MIN_VGA     0xc0000
>  #define PC_ROM_MIN_OPTION  0xc8000
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f953610018c4..d4160dfa7d34 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -809,7 +809,7 @@ static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
>                                         uint64_t max_size)
>  {
>      return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
> -                        name, virt_acpi_build_update, build_state);
> +                        name, virt_acpi_build_update, build_state, NULL);
>  }
>
>  static const VMStateDescription vmstate_virt_acpi_build = {
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 6e022b5ad583..c0d645a87134 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -978,7 +978,8 @@ err:
>
>  MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
>                     size_t max_len, hwaddr addr, const char *fw_file_name,
> -                   FWCfgReadCallback fw_callback, void *callback_opaque)
> +                   FWCfgReadCallback fw_callback, void *callback_opaque,
> +                   AddressSpace *as)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
>      Rom *rom;
> @@ -986,6 +987,7 @@ MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
>
>      rom           = g_malloc0(sizeof(*rom));
>      rom->name     = g_strdup(name);
> +    rom->as       = as;
>      rom->addr     = addr;
>      rom->romsize  = max_len ? max_len : len;
>      rom->datasize = len;
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 45a2ccfc4c60..9708cdc463df 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2936,7 +2936,7 @@ static MemoryRegion *acpi_add_rom_blob(AcpiBuildState *build_state,
>                                         uint64_t max_size)
>  {
>      return rom_add_blob(name, blob->data, acpi_data_len(blob), max_size, -1,
> -                        name, acpi_build_update, build_state);
> +                        name, acpi_build_update, build_state, NULL);
>  }
>
>  static const VMStateDescription vmstate_acpi_build = {
> --
> 2.9.2
>
>
>
