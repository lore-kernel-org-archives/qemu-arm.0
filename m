Received: by 10.25.21.156 with SMTP id 28csp1208235lfv;
        Sun, 14 Aug 2016 18:47:41 -0700 (PDT)
X-Received: by 10.55.220.132 with SMTP id v126mr30847657qki.127.1471225661069;
        Sun, 14 Aug 2016 18:47:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q30si10856376qkq.30.2016.08.14.18.47.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Aug 2016 18:47:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZ708-0002y4-JY
	for alex.bennee@linaro.org; Sun, 14 Aug 2016 21:47:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1bZ703-0002xK-Ay
	for qemu-arm@nongnu.org; Sun, 14 Aug 2016 21:47:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1bZ6zy-0003cF-VL
	for qemu-arm@nongnu.org; Sun, 14 Aug 2016 21:47:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53392)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1bZ6zy-0003cA-Mq; Sun, 14 Aug 2016 21:47:30 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B0454E330;
	Mon, 15 Aug 2016 01:47:30 +0000 (UTC)
Received: from redhat.com (vpn1-7-178.ams2.redhat.com [10.36.7.178])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u7F1lPXE015686; Sun, 14 Aug 2016 21:47:26 -0400
Date: Mon, 15 Aug 2016 04:47:24 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zheng, Lv" <lv.zheng@intel.com>
Message-ID: <20160815044051-mutt-send-email-mst@kernel.org>
References: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
	<cover.1470907810.git.lv.zheng@intel.com>
	<f59fb42c320294fdf3e140aeaa6dd3aba95d837f.1470907810.git.lv.zheng@intel.com>
	<20160811144213.6e4c9267@nial.brq.redhat.com>
	<1AE640813FDE7649BE1B193DEA596E883BC0D4AC@SHSMSX101.ccr.corp.intel.com>
	<20160812030702.2iiu46wv4wwwepkd@redhat.com>
	<1AE640813FDE7649BE1B193DEA596E883BC0DC83@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1AE640813FDE7649BE1B193DEA596E883BC0DC83@SHSMSX101.ccr.corp.intel.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 15 Aug 2016 01:47:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 2/2] ACPI: Add -acpitable fadt= to allow
 FADT revision changes
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Lv Zheng <zetalog@gmail.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SSEHiZ/G6UyJ

On Mon, Aug 15, 2016 at 01:33:41AM +0000, Zheng, Lv wrote:
> Hi,
> 
> > From: Michael S. Tsirkin [mailto:mst@redhat.com]
> > Subject: Re: [PATCH v5 2/2] ACPI: Add -acpitable fadt= to allow FADT
> > revision changes
> > 
> > On Fri, Aug 12, 2016 at 12:47:04AM +0000, Zheng, Lv wrote:
> > > Hi, Igor
> > >
> > > Thanks for the review.
> > >
> > > > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > > > Subject: Re: [PATCH v5 2/2] ACPI: Add -acpitable fadt= to allow FADT
> > > > revision changes
> > > >
> > > > On Thu, 11 Aug 2016 17:36:45 +0800
> > > > Lv Zheng <lv.zheng@intel.com> wrote:
> > > >
> > > > > This patch allows FADT to be built with different revisions. When the
> > > > revision
> > > > > is greater than 1.0, 64-bit address fields may also be filled.
> > > > >
> > > > > Note that FADT revision 2 has never been defined by the ACPI
> > > > specification. So
> > > > > this patch only adds an option -acpitable fadt= to allow revision 1,3,5
> > to
> > > > be
> > > > > configured by the users.
> > > > >
> > > > > 1. Tested by booting a linux image, the 64-bit addresses are correctly
> > > > filled
> > > > >    in the dumped FADT.
> > > > > 2. Tested by booting a Windows image, no boot failure can be seen.
> > > >
> > > > series still doesn't say why do you need 64-bit addresses in FADT,
> > > > current Seabios/OVMF allocates tables below 4Gb and gpe/pm
> > > > register blocks are below 4gb as well so there is no point in
> > > > accepting theses patches and adding extra CLI options as these
> > > > patches do.
> > > [Lv Zheng]
> > > This patch is used by us to probe Windows FADT behavior.
> > > Current known behavior includes:
> > > 1. On x86, Windows requires BIOS to have 2 FADTs, 1 is in RSDT, and
> > probably is a v1 table, the other is in XSDT, and probably is a v3+ table.
> > 
> > What does "requires" mean here? It seems to work fine without.
> 
> Let me reword:
> Windows requires BIOS to provide 2 FADTs when both RSDT and XSDT are provided.

That's good to know, thanks.
Do you see a reason to have both at the moment?

> > 
> > > 2. v2 FADT never exists in the spec, it is used in very early years, by IA64
> > prototype machines.
> > > 3. If the FADT in RSDT takes effective, then Windows actually ignores 64-
> > bit GAS fields, but uses 32-bit register fields.
> > > But there are still many uncertainties:
> > > 1. What if the FADT in XSDT takes effective?
> > > 2. What's the behavior on IA64/ARM platforms?
> > > If we could have an option here, we could continue the probing work,
> > trying every combination.
> > >
> > > Thus the original purpose of this commit is - probing de-facto standard
> > behavior.
> > 
> > Nice, but why do we need PATCH 2 upstream? Is it hard for you to
> > maintain
> > out of tree?
> 
> Not hard.
> I just may encounter problems if I want to put a document in Linux kernel related to FADT support and Windows behavior proofs.
> I'll remove this option.
> 
> > 
> > > >
> > > > If we'd ever need to bump FADT revision, I'd first try to increase it
> > > > unconditionally and test/see if it would not upset legacy guests
> > > > Windows starting from XP, RHEL4/5/6
> > > > If it works then these patches are not necessary,
> > > > (this approach worked  just fine for bumping up DSDT revision to 2
> > > > it would be possible to use 64-bit math in ASL/AML).
> > > >
> > > > if it doesn't, I still won't do it this way but rather:
> > > >  - make new revision used by default
> > > >  - add compat property to piix4_pm/ich9-lpc to force legacy revision
> > > >  - turn on legacy revision for old machine types using added above
> > > > property
> > > >
> > > > That way we won't regress existing setups as old machines will stay
> > > > the same and only new machine types will be affected. And users that
> > > > actually want to play with legacy revision on new machine types could
> > > > force it by using above property.
> > > >
> > > [Lv Zheng]
> > > But it seems the code in this commit contains useful stuffs for qemu.
> > >
> > > As I said previously, it seems Windows requires 2 FADTs.
> > > So having a revision parameter for build_fadt() seems to be necessary.
> > > Because if qemu wants to increase FADT revision, qemu may do this in
> > this way:
> > > 1. Invoke build_fadt() with revision 1, and put it into RSDT;
> > > 2. Invoke build_fadt() with latest revision, and put it into XSDT.
> > > Also we know latest revision FADT is useful, it contains reduced
> > hardware support.
> > > And some of new ACPI features rely this model.
> > >
> > > So I'm sure that this commit contains useful stuffs for qemu to do future
> > extension.
> > >
> > > But I don't know if you want to keep the new -acpitable fadt= option.
> > > Let me ask:
> > > 1. Are there any issues in PATCH 01? Maybe my understanding of qemu
> > option code is not correct.
> > 
> > Didn't review yet, I'll let Igor review first.
> > 
> > > 2. IMO, this option should be useful for a long period because we need it
> > to help probing Windows behavior, so can we have it upstreamed?
> > 
> > ATM PATCH 2 does not seem generally useful.
> 
> OK. I see.
> 
> Thanks
> Lv
> 
> > 
> > >
> > > Best regards
> > > Lv
> > >
> > > > >
> > > > > Signed-off-by: Lv Zheng <lv.zheng@intel.com>
> > > > > ---
> > > > >  hw/acpi/core.c         |   20 ++++++++++++-
> > > > >  hw/i386/acpi-build.c   |   76
> > > > ++++++++++++++++++++++++++++++++++++++++++------
> > > > >  include/hw/acpi/acpi.h |    1 +
> > > > >  qemu-options.hx        |    8 ++++-
> > > > >  4 files changed, 94 insertions(+), 11 deletions(-)
> > > > >
> > > > > diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> > > > > index 85e0e94..832c86b 100644
> > > > > --- a/hw/acpi/core.c
> > > > > +++ b/hw/acpi/core.c
> > > > > @@ -19,6 +19,7 @@
> > > > >   * GNU GPL, version 2 or (at your option) any later version.
> > > > >   */
> > > > >  #include "qemu/osdep.h"
> > > > > +#include "qemu/cutils.h"
> > > > >  #include "sysemu/sysemu.h"
> > > > >  #include "hw/hw.h"
> > > > >  #include "hw/i386/pc.h"
> > > > > @@ -54,6 +55,7 @@ static const char unsigned
> > > > dfl_hdr[ACPI_TABLE_HDR_SIZE - ACPI_TABLE_PFX_SIZE] =
> > > > >
> > > > >  char unsigned *acpi_tables;
> > > > >  size_t acpi_tables_len;
> > > > > +uint8_t acpi_fadt_rev = 1;
> > > > >
> > > > >  static QemuOptsList qemu_acpi_opts = {
> > > > >      .name = "acpi",
> > > > > @@ -312,7 +314,23 @@ void acpi_table_add(const QemuOpts
> > *opts,
> > > > Error **errp)
> > > > >          return;
> > > > >      }
> > > > >
> > > > > -    error_setg(errp, "'-acpitable' requires one of 'data' or 'file'");
> > > > > +    val = qemu_opt_get((QemuOpts *)opts, "fadt");
> > > > > +    if (val) {
> > > > > +        unsigned long rev;
> > > > > +        int err;
> > > > > +
> > > > > +        err = qemu_strtoul(val, NULL, 10, &rev);
> > > > > +        if (err ||
> > > > > +            (rev != 1 && rev != 3 && rev != 5)) {
> > > > > +            error_setg(errp, "Unsupported FADT revision %s, "
> > > > > +                       "please specify 1,3,5", val);
> > > > > +            return;
> > > > > +        }
> > > > > +        acpi_fadt_rev = rev;
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    error_setg(errp, "'-acpitable' requires one of 'data','file' or 'fadt'");
> > > > >  }
> > > > >
> > > > >  static bool acpi_table_builtin = false;
> > > > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > > > index ce7cbc5..8be6578 100644
> > > > > --- a/hw/i386/acpi-build.c
> > > > > +++ b/hw/i386/acpi-build.c
> > > > > @@ -276,8 +276,22 @@ build_facs(GArray *table_data, BIOSLinker
> > > > *linker)
> > > > >      facs->length = cpu_to_le32(sizeof(*facs));
> > > > >  }
> > > > >
> > > > > +/* GAS */
> > > > > +static void
> > > > > +build_gas(struct AcpiGenericAddress *gas, uint8_t space_id,
> > > > > +          uint8_t bit_width, uint8_t bit_offset,
> > > > > +          uint8_t access_width, uint64_t address)
> > > > > +{
> > > > > +    gas->space_id = space_id;
> > > > > +    gas->bit_width = bit_width;
> > > > > +    gas->bit_offset = bit_offset;
> > > > > +    gas->access_width = access_width;
> > > > > +    gas->address = address;
> > > > > +}
> > > > > +
> > > > >  /* Load chipset information in FADT */
> > > > > -static void fadt_setup(AcpiFadtDescriptorRev1 *fadt, AcpiPmInfo
> > *pm)
> > > > > +static void fadt_setup(AcpiFadtDescriptorRev5_1 *fadt, AcpiPmInfo
> > > > *pm,
> > > > > +                       uint8_t revision)
> > > > >  {
> > > > >      fadt->model = 1;
> > > > >      fadt->reserved1 = 0;
> > > > > @@ -309,6 +323,25 @@ static void
> > fadt_setup(AcpiFadtDescriptorRev1
> > > > *fadt, AcpiPmInfo *pm)
> > > > >          fadt->flags |= cpu_to_le32(1 <<
> > > > ACPI_FADT_F_FORCE_APIC_CLUSTER_MODEL);
> > > > >      }
> > > > >      fadt->century = RTC_CENTURY;
> > > > > +
> > > > > +    /* Build ACPI 2.0 (FADT version 3+) GAS fields */
> > > > > +    if (revision >= 3) {
> > > > > +        /* EVT, CNT, TMR register matches hw/acpi/core.c */
> > > > > +        build_gas(&fadt->xpm1a_event_block, AML_SYSTEM_IO,
> > > > > +                  32, 0, 0, cpu_to_le64(pm->io_base));
> > > > > +        build_gas(&fadt->xpm1a_control_block, AML_SYSTEM_IO,
> > > > > +                  16, 0, 0, cpu_to_le64(pm->io_base + 0x04));
> > > > > +        build_gas(&fadt->xpm_timer_block, AML_SYSTEM_IO,
> > > > > +                  32, 0, 0, cpu_to_le64(pm->io_base + 0x08));
> > > > > +        build_gas(&fadt->xgpe0_block, AML_SYSTEM_IO,
> > > > > +                  pm->gpe0_blk_len << 3, 0, 0, cpu_to_le64(pm-
> > >gpe0_blk));
> > > > > +    }
> > > > > +
> > > > > +    /* Build dummy ACPI 5.0 fields */
> > > > > +    if (revision >= 5) {
> > > > > +        build_gas(&fadt->sleep_control, AML_SYSTEM_MEMORY, 0, 0,
> > 0,
> > > > 0);
> > > > > +        build_gas(&fadt->sleep_status, AML_SYSTEM_MEMORY, 0, 0,
> > 0, 0);
> > > > > +    }
> > > > >  }
> > > > >
> > > > >
> > > > > @@ -316,11 +349,21 @@ static void
> > > > fadt_setup(AcpiFadtDescriptorRev1 *fadt, AcpiPmInfo *pm)
> > > > >  static void
> > > > >  build_fadt(GArray *table_data, BIOSLinker *linker, AcpiPmInfo *pm,
> > > > >             unsigned facs_tbl_offset, unsigned dsdt_tbl_offset,
> > > > > -           const char *oem_id, const char *oem_table_id)
> > > > > +           const char *oem_id, const char *oem_table_id, uint8_t
> > revision)
> > > > >  {
> > > > > -    AcpiFadtDescriptorRev1 *fadt = acpi_data_push(table_data,
> > > > sizeof(*fadt));
> > > > > -    unsigned fw_ctrl_offset = (char *)&fadt->firmware_ctrl -
> > table_data-
> > > > >data;
> > > > > -    unsigned dsdt_entry_offset = (char *)&fadt->dsdt - table_data-
> > >data;
> > > > > +    AcpiFadtDescriptorRev5_1 *fadt;
> > > > > +    unsigned fw_ctrl_offset;
> > > > > +    unsigned dsdt_entry_offset;
> > > > > +    unsigned fadt_len;
> > > > > +
> > > > > +    if (revision == 1) {
> > > > > +        fadt_len = sizeof(AcpiFadtDescriptorRev1);
> > > > > +    } else {
> > > > > +        fadt_len = sizeof(AcpiFadtDescriptorRev5_1);
> > > > > +    }
> > > > > +    fadt = acpi_data_push(table_data, fadt_len);
> > > > > +    fw_ctrl_offset = (char *)&fadt->firmware_ctrl - table_data->data;
> > > > > +    dsdt_entry_offset = (char *)&fadt->dsdt - table_data->data;
> > > > >
> > > > >      /* FACS address to be filled by Guest linker */
> > > > >      bios_linker_loader_add_pointer(linker,
> > > > > @@ -328,13 +371,28 @@ build_fadt(GArray *table_data,
> > BIOSLinker
> > > > *linker, AcpiPmInfo *pm,
> > > > >          ACPI_BUILD_TABLE_FILE, facs_tbl_offset);
> > > > >
> > > > >      /* DSDT address to be filled by Guest linker */
> > > > > -    fadt_setup(fadt, pm);
> > > > >      bios_linker_loader_add_pointer(linker,
> > > > >          ACPI_BUILD_TABLE_FILE, dsdt_entry_offset, sizeof(fadt->dsdt),
> > > > >          ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
> > > > >
> > > > > -    build_header(linker, table_data,
> > > > > -                 (void *)fadt, "FACP", sizeof(*fadt), 1, oem_id,
> > oem_table_id);
> > > > > +    if (revision > 2) {
> > > > > +        fw_ctrl_offset = (char *)&fadt->Xfacs - table_data->data;
> > > > > +        dsdt_entry_offset = (char *)&fadt->Xdsdt - table_data->data;
> > > > > +
> > > > > +        /* FACS address to be filled by Guest linker */
> > > > > +        bios_linker_loader_add_pointer(linker,
> > > > > +            ACPI_BUILD_TABLE_FILE, fw_ctrl_offset, sizeof(fadt->Xfacs),
> > > > > +            ACPI_BUILD_TABLE_FILE, facs_tbl_offset);
> > > > > +
> > > > > +        /* DSDT address to be filled by Guest linker */
> > > > > +        bios_linker_loader_add_pointer(linker,
> > > > > +            ACPI_BUILD_TABLE_FILE, dsdt_entry_offset, sizeof(fadt-
> > >Xdsdt),
> > > > > +            ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
> > > > > +    }
> > > > > +
> > > > > +    fadt_setup(fadt, pm, revision);
> > > > > +    build_header(linker, table_data, (void *)fadt, "FACP", fadt_len,
> > > > > +                 revision, oem_id, oem_table_id);
> > > > >  }
> > > > >
> > > > >  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> > > > > @@ -2681,7 +2739,7 @@ void acpi_build(AcpiBuildTables *tables,
> > > > MachineState *machine)
> > > > >      fadt = tables_blob->len;
> > > > >      acpi_add_table(table_offsets, tables_blob);
> > > > >      build_fadt(tables_blob, tables->linker, &pm, facs, dsdt,
> > > > > -               slic_oem.id, slic_oem.table_id);
> > > > > +               slic_oem.id, slic_oem.table_id, acpi_fadt_rev);
> > > > >      aml_len += tables_blob->len - fadt;
> > > > >
> > > > >      acpi_add_table(table_offsets, tables_blob);
> > > > > diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
> > > > > index 7b3d93c..63df38d 100644
> > > > > --- a/include/hw/acpi/acpi.h
> > > > > +++ b/include/hw/acpi/acpi.h
> > > > > @@ -173,6 +173,7 @@ void acpi_update_sci(ACPIREGS *acpi_regs,
> > > > qemu_irq irq);
> > > > >
> > > > >  /* acpi.c */
> > > > >  extern int acpi_enabled;
> > > > > +extern uint8_t acpi_fadt_rev;
> > > > >  extern char unsigned *acpi_tables;
> > > > >  extern size_t acpi_tables_len;
> > > > >
> > > > > diff --git a/qemu-options.hx b/qemu-options.hx
> > > > > index 5fe7f87..d61dd92 100644
> > > > > --- a/qemu-options.hx
> > > > > +++ b/qemu-options.hx
> > > > > @@ -1497,7 +1497,10 @@ DEF("acpitable", HAS_ARG,
> > > > QEMU_OPTION_acpitable,
> > > > >      "             [,sig=str][,rev=n]\n"
> > > > >      "             [,oem_id=str][,oem_table_id=str][,oem_rev=n]\n"
> > > > >      "             [,asl_compiler_id=str][,asl_compiler_rev=n]\n"
> > > > > -    "                ACPI table description\n", QEMU_ARCH_I386)
> > > > > +    "                ACPI table description\n"
> > > > > +    "-acpitable fadt=n\n"
> > > > > +    "                Configure FADT revision\n",
> > > > > +    QEMU_ARCH_I386)
> > > > >  STEXI
> > > > >  @item -acpitable
> > > >
> > data=@var{file1}[:@var{file2}]...[,sig=@var{str}][,rev=@var{n}][,oem_id=@
> > > > var{str}][,oem_table_id=@var{str}][,oem_rev=@var{n}]
> > > > [,asl_compiler_id=@var{str}][,asl_compiler_rev=@var{n}]
> > > > >  @findex -acpitable
> > > > > @@ -1511,6 +1514,9 @@ If a SLIC table is supplied to QEMU, then
> > the
> > > > SLIC's oem_id and oem_table_id
> > > > >  fields will override the same in the RSDT and the FADT (a.k.a. FACP),
> > in
> > > > order
> > > > >  to ensure the field matches required by the Microsoft SLIC spec and
> > the
> > > > ACPI
> > > > >  spec.
> > > > > +
> > > > > +@item -acpitable fadt=@var{n}
> > > > > +Configure FADT revision to 1, 3, 5, default 1.
> > > > >  ETEXI
> > > > >
> > > > >  DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
