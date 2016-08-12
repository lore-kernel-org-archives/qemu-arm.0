Received: by 10.25.21.156 with SMTP id 28csp385354lfv;
        Thu, 11 Aug 2016 17:47:33 -0700 (PDT)
X-Received: by 10.237.36.252 with SMTP id u57mr14817670qtc.39.1470962853315;
        Thu, 11 Aug 2016 17:47:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x34si3146315qtx.14.2016.08.11.17.47.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 17:47:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51041 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bY0dI-0003Fw-OX
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 20:47:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bY0dA-0003Cf-BV
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 20:47:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bY0d7-0001yI-H0
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 20:47:23 -0400
Received: from mga09.intel.com ([134.134.136.24]:41541)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>)
	id 1bY0d0-0001w8-Ja; Thu, 11 Aug 2016 20:47:15 -0400
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Aug 2016 17:47:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,507,1464678000"; d="scan'208";a="1034165281"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2016 17:47:09 -0700
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
	FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 11 Aug 2016 17:47:07 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
	FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 11 Aug 2016 17:47:07 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.8]) by
	SHSMSX152.ccr.corp.intel.com ([169.254.6.107]) with mapi id
	14.03.0248.002; Fri, 12 Aug 2016 08:47:05 +0800
From: "Zheng, Lv" <lv.zheng@intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [PATCH v5 2/2] ACPI: Add -acpitable fadt= to allow FADT
	revision changes
Thread-Index: AQHR87PqpWpibtH/7Eqcyw5l6DvWpaBDLg2AgAFLK8A=
Date: Fri, 12 Aug 2016 00:47:04 +0000
Message-ID: <1AE640813FDE7649BE1B193DEA596E883BC0D4AC@SHSMSX101.ccr.corp.intel.com>
References: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
	<cover.1470907810.git.lv.zheng@intel.com>
	<f59fb42c320294fdf3e140aeaa6dd3aba95d837f.1470907810.git.lv.zheng@intel.com>
	<20160811144213.6e4c9267@nial.brq.redhat.com>
In-Reply-To: <20160811144213.6e4c9267@nial.brq.redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODczNzVkNGYtMzc5My00Y2U2LThjZDUtNTIzZjIxNjM1ZTkxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6InZnWWZJRXFKXC9YaWpzbGV0VGp0NzVtQXVEXC9KN3JHZFJRWnVEV2Y5K3ZHZz0ifQ==
x-ctpclassification: CTP_IC
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Lv
	Zheng <zetalog@gmail.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f7w5+JQDqY0l

Hi, Igor

Thanks for the review.

> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Subject: Re: [PATCH v5 2/2] ACPI: Add -acpitable fadt=3D to allow FADT
> revision changes
>=20
> On Thu, 11 Aug 2016 17:36:45 +0800
> Lv Zheng <lv.zheng@intel.com> wrote:
>=20
> > This patch allows FADT to be built with different revisions. When the
> revision
> > is greater than 1.0, 64-bit address fields may also be filled.
> >
> > Note that FADT revision 2 has never been defined by the ACPI
> specification. So
> > this patch only adds an option -acpitable fadt=3D to allow revision 1,3=
,5 to
> be
> > configured by the users.
> >
> > 1. Tested by booting a linux image, the 64-bit addresses are correctly
> filled
> >    in the dumped FADT.
> > 2. Tested by booting a Windows image, no boot failure can be seen.
>=20
> series still doesn't say why do you need 64-bit addresses in FADT,
> current Seabios/OVMF allocates tables below 4Gb and gpe/pm
> register blocks are below 4gb as well so there is no point in
> accepting theses patches and adding extra CLI options as these
> patches do.
[Lv Zheng]=20
This patch is used by us to probe Windows FADT behavior.
Current known behavior includes:
1. On x86, Windows requires BIOS to have 2 FADTs, 1 is in RSDT, and probabl=
y is a v1 table, the other is in XSDT, and probably is a v3+ table.
2. v2 FADT never exists in the spec, it is used in very early years, by IA6=
4 prototype machines.
3. If the FADT in RSDT takes effective, then Windows actually ignores 64-bi=
t GAS fields, but uses 32-bit register fields.
But there are still many uncertainties:
1. What if the FADT in XSDT takes effective?
2. What's the behavior on IA64/ARM platforms?
If we could have an option here, we could continue the probing work, trying=
 every combination.=20

Thus the original purpose of this commit is - probing de-facto standard beh=
avior.

>=20
> If we'd ever need to bump FADT revision, I'd first try to increase it
> unconditionally and test/see if it would not upset legacy guests
> Windows starting from XP, RHEL4/5/6
> If it works then these patches are not necessary,
> (this approach worked  just fine for bumping up DSDT revision to 2
> it would be possible to use 64-bit math in ASL/AML).
>=20
> if it doesn't, I still won't do it this way but rather:
>  - make new revision used by default
>  - add compat property to piix4_pm/ich9-lpc to force legacy revision
>  - turn on legacy revision for old machine types using added above
> property
>=20
> That way we won't regress existing setups as old machines will stay
> the same and only new machine types will be affected. And users that
> actually want to play with legacy revision on new machine types could
> force it by using above property.
>=20
[Lv Zheng]=20
But it seems the code in this commit contains useful stuffs for qemu.

As I said previously, it seems Windows requires 2 FADTs.
So having a revision parameter for build_fadt() seems to be necessary.
Because if qemu wants to increase FADT revision, qemu may do this in this w=
ay:
1. Invoke build_fadt() with revision 1, and put it into RSDT;
2. Invoke build_fadt() with latest revision, and put it into XSDT.
Also we know latest revision FADT is useful, it contains reduced hardware s=
upport.
And some of new ACPI features rely this model.

So I'm sure that this commit contains useful stuffs for qemu to do future e=
xtension.

But I don't know if you want to keep the new -acpitable fadt=3D option.
Let me ask:
1. Are there any issues in PATCH 01? Maybe my understanding of qemu option =
code is not correct.
2. IMO, this option should be useful for a long period because we need it t=
o help probing Windows behavior, so can we have it upstreamed?

Best regards
Lv

> >
> > Signed-off-by: Lv Zheng <lv.zheng@intel.com>
> > ---
> >  hw/acpi/core.c         |   20 ++++++++++++-
> >  hw/i386/acpi-build.c   |   76
> ++++++++++++++++++++++++++++++++++++++++++------
> >  include/hw/acpi/acpi.h |    1 +
> >  qemu-options.hx        |    8 ++++-
> >  4 files changed, 94 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> > index 85e0e94..832c86b 100644
> > --- a/hw/acpi/core.c
> > +++ b/hw/acpi/core.c
> > @@ -19,6 +19,7 @@
> >   * GNU GPL, version 2 or (at your option) any later version.
> >   */
> >  #include "qemu/osdep.h"
> > +#include "qemu/cutils.h"
> >  #include "sysemu/sysemu.h"
> >  #include "hw/hw.h"
> >  #include "hw/i386/pc.h"
> > @@ -54,6 +55,7 @@ static const char unsigned
> dfl_hdr[ACPI_TABLE_HDR_SIZE - ACPI_TABLE_PFX_SIZE] =3D
> >
> >  char unsigned *acpi_tables;
> >  size_t acpi_tables_len;
> > +uint8_t acpi_fadt_rev =3D 1;
> >
> >  static QemuOptsList qemu_acpi_opts =3D {
> >      .name =3D "acpi",
> > @@ -312,7 +314,23 @@ void acpi_table_add(const QemuOpts *opts,
> Error **errp)
> >          return;
> >      }
> >
> > -    error_setg(errp, "'-acpitable' requires one of 'data' or 'file'");
> > +    val =3D qemu_opt_get((QemuOpts *)opts, "fadt");
> > +    if (val) {
> > +        unsigned long rev;
> > +        int err;
> > +
> > +        err =3D qemu_strtoul(val, NULL, 10, &rev);
> > +        if (err ||
> > +            (rev !=3D 1 && rev !=3D 3 && rev !=3D 5)) {
> > +            error_setg(errp, "Unsupported FADT revision %s, "
> > +                       "please specify 1,3,5", val);
> > +            return;
> > +        }
> > +        acpi_fadt_rev =3D rev;
> > +        return;
> > +    }
> > +
> > +    error_setg(errp, "'-acpitable' requires one of 'data','file' or 'f=
adt'");
> >  }
> >
> >  static bool acpi_table_builtin =3D false;
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index ce7cbc5..8be6578 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -276,8 +276,22 @@ build_facs(GArray *table_data, BIOSLinker
> *linker)
> >      facs->length =3D cpu_to_le32(sizeof(*facs));
> >  }
> >
> > +/* GAS */
> > +static void
> > +build_gas(struct AcpiGenericAddress *gas, uint8_t space_id,
> > +          uint8_t bit_width, uint8_t bit_offset,
> > +          uint8_t access_width, uint64_t address)
> > +{
> > +    gas->space_id =3D space_id;
> > +    gas->bit_width =3D bit_width;
> > +    gas->bit_offset =3D bit_offset;
> > +    gas->access_width =3D access_width;
> > +    gas->address =3D address;
> > +}
> > +
> >  /* Load chipset information in FADT */
> > -static void fadt_setup(AcpiFadtDescriptorRev1 *fadt, AcpiPmInfo *pm)
> > +static void fadt_setup(AcpiFadtDescriptorRev5_1 *fadt, AcpiPmInfo
> *pm,
> > +                       uint8_t revision)
> >  {
> >      fadt->model =3D 1;
> >      fadt->reserved1 =3D 0;
> > @@ -309,6 +323,25 @@ static void fadt_setup(AcpiFadtDescriptorRev1
> *fadt, AcpiPmInfo *pm)
> >          fadt->flags |=3D cpu_to_le32(1 <<
> ACPI_FADT_F_FORCE_APIC_CLUSTER_MODEL);
> >      }
> >      fadt->century =3D RTC_CENTURY;
> > +
> > +    /* Build ACPI 2.0 (FADT version 3+) GAS fields */
> > +    if (revision >=3D 3) {
> > +        /* EVT, CNT, TMR register matches hw/acpi/core.c */
> > +        build_gas(&fadt->xpm1a_event_block, AML_SYSTEM_IO,
> > +                  32, 0, 0, cpu_to_le64(pm->io_base));
> > +        build_gas(&fadt->xpm1a_control_block, AML_SYSTEM_IO,
> > +                  16, 0, 0, cpu_to_le64(pm->io_base + 0x04));
> > +        build_gas(&fadt->xpm_timer_block, AML_SYSTEM_IO,
> > +                  32, 0, 0, cpu_to_le64(pm->io_base + 0x08));
> > +        build_gas(&fadt->xgpe0_block, AML_SYSTEM_IO,
> > +                  pm->gpe0_blk_len << 3, 0, 0, cpu_to_le64(pm->gpe0_bl=
k));
> > +    }
> > +
> > +    /* Build dummy ACPI 5.0 fields */
> > +    if (revision >=3D 5) {
> > +        build_gas(&fadt->sleep_control, AML_SYSTEM_MEMORY, 0, 0, 0,
> 0);
> > +        build_gas(&fadt->sleep_status, AML_SYSTEM_MEMORY, 0, 0, 0, 0);
> > +    }
> >  }
> >
> >
> > @@ -316,11 +349,21 @@ static void
> fadt_setup(AcpiFadtDescriptorRev1 *fadt, AcpiPmInfo *pm)
> >  static void
> >  build_fadt(GArray *table_data, BIOSLinker *linker, AcpiPmInfo *pm,
> >             unsigned facs_tbl_offset, unsigned dsdt_tbl_offset,
> > -           const char *oem_id, const char *oem_table_id)
> > +           const char *oem_id, const char *oem_table_id, uint8_t revis=
ion)
> >  {
> > -    AcpiFadtDescriptorRev1 *fadt =3D acpi_data_push(table_data,
> sizeof(*fadt));
> > -    unsigned fw_ctrl_offset =3D (char *)&fadt->firmware_ctrl - table_d=
ata-
> >data;
> > -    unsigned dsdt_entry_offset =3D (char *)&fadt->dsdt - table_data->d=
ata;
> > +    AcpiFadtDescriptorRev5_1 *fadt;
> > +    unsigned fw_ctrl_offset;
> > +    unsigned dsdt_entry_offset;
> > +    unsigned fadt_len;
> > +
> > +    if (revision =3D=3D 1) {
> > +        fadt_len =3D sizeof(AcpiFadtDescriptorRev1);
> > +    } else {
> > +        fadt_len =3D sizeof(AcpiFadtDescriptorRev5_1);
> > +    }
> > +    fadt =3D acpi_data_push(table_data, fadt_len);
> > +    fw_ctrl_offset =3D (char *)&fadt->firmware_ctrl - table_data->data=
;
> > +    dsdt_entry_offset =3D (char *)&fadt->dsdt - table_data->data;
> >
> >      /* FACS address to be filled by Guest linker */
> >      bios_linker_loader_add_pointer(linker,
> > @@ -328,13 +371,28 @@ build_fadt(GArray *table_data, BIOSLinker
> *linker, AcpiPmInfo *pm,
> >          ACPI_BUILD_TABLE_FILE, facs_tbl_offset);
> >
> >      /* DSDT address to be filled by Guest linker */
> > -    fadt_setup(fadt, pm);
> >      bios_linker_loader_add_pointer(linker,
> >          ACPI_BUILD_TABLE_FILE, dsdt_entry_offset, sizeof(fadt->dsdt),
> >          ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
> >
> > -    build_header(linker, table_data,
> > -                 (void *)fadt, "FACP", sizeof(*fadt), 1, oem_id, oem_t=
able_id);
> > +    if (revision > 2) {
> > +        fw_ctrl_offset =3D (char *)&fadt->Xfacs - table_data->data;
> > +        dsdt_entry_offset =3D (char *)&fadt->Xdsdt - table_data->data;
> > +
> > +        /* FACS address to be filled by Guest linker */
> > +        bios_linker_loader_add_pointer(linker,
> > +            ACPI_BUILD_TABLE_FILE, fw_ctrl_offset, sizeof(fadt->Xfacs)=
,
> > +            ACPI_BUILD_TABLE_FILE, facs_tbl_offset);
> > +
> > +        /* DSDT address to be filled by Guest linker */
> > +        bios_linker_loader_add_pointer(linker,
> > +            ACPI_BUILD_TABLE_FILE, dsdt_entry_offset, sizeof(fadt->Xds=
dt),
> > +            ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
> > +    }
> > +
> > +    fadt_setup(fadt, pm, revision);
> > +    build_header(linker, table_data, (void *)fadt, "FACP", fadt_len,
> > +                 revision, oem_id, oem_table_id);
> >  }
> >
> >  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> > @@ -2681,7 +2739,7 @@ void acpi_build(AcpiBuildTables *tables,
> MachineState *machine)
> >      fadt =3D tables_blob->len;
> >      acpi_add_table(table_offsets, tables_blob);
> >      build_fadt(tables_blob, tables->linker, &pm, facs, dsdt,
> > -               slic_oem.id, slic_oem.table_id);
> > +               slic_oem.id, slic_oem.table_id, acpi_fadt_rev);
> >      aml_len +=3D tables_blob->len - fadt;
> >
> >      acpi_add_table(table_offsets, tables_blob);
> > diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
> > index 7b3d93c..63df38d 100644
> > --- a/include/hw/acpi/acpi.h
> > +++ b/include/hw/acpi/acpi.h
> > @@ -173,6 +173,7 @@ void acpi_update_sci(ACPIREGS *acpi_regs,
> qemu_irq irq);
> >
> >  /* acpi.c */
> >  extern int acpi_enabled;
> > +extern uint8_t acpi_fadt_rev;
> >  extern char unsigned *acpi_tables;
> >  extern size_t acpi_tables_len;
> >
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 5fe7f87..d61dd92 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -1497,7 +1497,10 @@ DEF("acpitable", HAS_ARG,
> QEMU_OPTION_acpitable,
> >      "             [,sig=3Dstr][,rev=3Dn]\n"
> >      "             [,oem_id=3Dstr][,oem_table_id=3Dstr][,oem_rev=3Dn]\n=
"
> >      "             [,asl_compiler_id=3Dstr][,asl_compiler_rev=3Dn]\n"
> > -    "                ACPI table description\n", QEMU_ARCH_I386)
> > +    "                ACPI table description\n"
> > +    "-acpitable fadt=3Dn\n"
> > +    "                Configure FADT revision\n",
> > +    QEMU_ARCH_I386)
> >  STEXI
> >  @item -acpitable
> data=3D@var{file1}[:@var{file2}]...[,sig=3D@var{str}][,rev=3D@var{n}][,oe=
m_id=3D@
> var{str}][,oem_table_id=3D@var{str}][,oem_rev=3D@var{n}]
> [,asl_compiler_id=3D@var{str}][,asl_compiler_rev=3D@var{n}]
> >  @findex -acpitable
> > @@ -1511,6 +1514,9 @@ If a SLIC table is supplied to QEMU, then the
> SLIC's oem_id and oem_table_id
> >  fields will override the same in the RSDT and the FADT (a.k.a. FACP), =
in
> order
> >  to ensure the field matches required by the Microsoft SLIC spec and th=
e
> ACPI
> >  spec.
> > +
> > +@item -acpitable fadt=3D@var{n}
> > +Configure FADT revision to 1, 3, 5, default 1.
> >  ETEXI
> >
> >  DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,

