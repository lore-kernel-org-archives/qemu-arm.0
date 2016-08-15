Received: by 10.25.21.156 with SMTP id 28csp1266657lfv;
        Sun, 14 Aug 2016 22:25:52 -0700 (PDT)
X-Received: by 10.200.47.253 with SMTP id m58mr31405332qta.60.1471238752900;
        Sun, 14 Aug 2016 22:25:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 38si12581331qtq.133.2016.08.14.22.25.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 14 Aug 2016 22:25:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35044 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZAPI-000542-9k
	for alex.bennee@linaro.org; Mon, 15 Aug 2016 01:25:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bZAPB-00051S-5Z
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 01:25:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bZAP8-0001aH-Ku
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 01:25:44 -0400
Received: from mga02.intel.com ([134.134.136.20]:45272)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>)
	id 1bZAP3-0001Zi-23; Mon, 15 Aug 2016 01:25:37 -0400
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2016 22:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,523,1464678000"; d="scan'208";a="748783667"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Aug 2016 22:25:31 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
	FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Sun, 14 Aug 2016 22:25:20 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Sun, 14 Aug 2016 22:25:18 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.8]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.150]) with mapi id
	14.03.0248.002; Mon, 15 Aug 2016 13:23:35 +0800
From: "Zheng, Lv" <lv.zheng@intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [PATCH v5 1/2] ACPI: Cleanup -acpitable option code
Thread-Index: AQHR87PmB5BkmPm3tEOM8IB4Y24zXqBE5F0AgASVYjA=
Date: Mon, 15 Aug 2016 05:23:34 +0000
Message-ID: <1AE640813FDE7649BE1B193DEA596E883BC0DDAF@SHSMSX101.ccr.corp.intel.com>
References: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
	<cover.1470907810.git.lv.zheng@intel.com>
	<596008a543fe75e5c91db0cf7fd0cf4b2a6a2ca1.1470907810.git.lv.zheng@intel.com>
	<20160812165100.7fc99c64@nial.brq.redhat.com>
In-Reply-To: <20160812165100.7fc99c64@nial.brq.redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjljNzgzNWEtMTcyZi00OWRhLTk3ODYtNzljZmQ4MzE2Y2MwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6IkRjXC9pS0RVYzdEOTkzQTkzcDZuY3FyQUQ1RHlRZFwvaDloQnNEcGhQSUdsQT0ifQ==
x-ctpclassification: CTP_IC
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.20
Subject: Re: [Qemu-arm] [PATCH v5 1/2] ACPI: Cleanup -acpitable option code
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
	Zheng <zetalog@gmail.com>, "armbru@redhat.com" <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"eblake@redhat.com" <eblake@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pzIC6miQEbp7

Hi, Igor

> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Subject: Re: [PATCH v5 1/2] ACPI: Cleanup -acpitable option code
>=20
> On Thu, 11 Aug 2016 17:36:38 +0800
> Lv Zheng <lv.zheng@intel.com> wrote:
>=20
> > In -acpitable options, at least/most one data/file sub-option is mandat=
ory,
> > this patch cleans up the code to reflect this in a managed manner so th=
at
> > the follow-up mandatory sub-options can be added to -acpitable.
> >
> > Signed-off-by: Lv Zheng <lv.zheng@intel.com>
> > ---
> >  hw/acpi/core.c   |   32 +++++++++++++++++++++++---------
> >  qapi-schema.json |   26 +++++++-------------------
> >  qemu-options.hx  |    7 +++++--
> >  3 files changed, 35 insertions(+), 30 deletions(-)
> >
> > diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> > index e890a5d..85e0e94 100644
> > --- a/hw/acpi/core.c
> > +++ b/hw/acpi/core.c
> > @@ -89,8 +89,6 @@ static int acpi_checksum(const uint8_t *data, int len=
)
> >   * It is valid to call this function with
> >   * (@blob =3D=3D NULL && bloblen =3D=3D 0 && !has_header).
> >   *
> > - * @hdrs->file and @hdrs->data are ignored.
> > - *
> unrelated change?

When file/data become mandatory sub-options,
AcpiTableOptions doesn't have to contain file/data/has_file/has_data.
Because the value of the sub-option "file" or "data" has already been obtai=
ned in acpi_table_add() by invoking qemu_opt_get().
Thus I made this change.
And passed the sub-option value via new "const char *file" parameter.

>=20
> >   * SIZE_MAX is considered "infinity" in this function.
> >   *
> >   * The number of tables that can be installed is not limited, but the =
16-bit
> > @@ -229,7 +227,8 @@ static void acpi_table_install(const char unsigned =
*blob, size_t bloblen,
> >                                        ACPI_TABLE_PFX_SIZE, acpi_payloa=
d_size);
> >  }
> >
> > -void acpi_table_add(const QemuOpts *opts, Error **errp)
> > +static void acpi_table_from_file(bool has_header, const char *file,
> > +                                 const QemuOpts *opts, Error **errp)
> >  {
> >      AcpiTableOptions *hdrs =3D NULL;
> >      Error *err =3D NULL;
> > @@ -249,12 +248,8 @@ void acpi_table_add(const QemuOpts *opts, Error **=
errp)
> >      if (err) {
> >          goto out;
> >      }
> > -    if (hdrs->has_file =3D=3D hdrs->has_data) {
> > -        error_setg(&err, "'-acpitable' requires one of 'data' or 'file=
'");
> > -        goto out;
> > -    }
> >
> > -    pathnames =3D g_strsplit(hdrs->has_file ? hdrs->file : hdrs->data,=
 ":", 0);
> > +    pathnames =3D g_strsplit(file, ":", 0);
> >      if (pathnames =3D=3D NULL || pathnames[0] =3D=3D NULL) {
> >          error_setg(&err, "'-acpitable' requires at least one pathname"=
);
> >          goto out;
> > @@ -291,7 +286,7 @@ void acpi_table_add(const QemuOpts *opts, Error **e=
rrp)
> >          close(fd);
> >      }
> >
> > -    acpi_table_install(blob, bloblen, hdrs->has_file, hdrs, &err);
> > +    acpi_table_install(blob, bloblen, has_header, hdrs, &err);
> >
> >  out:
> >      g_free(blob);
> > @@ -301,6 +296,25 @@ out:
> >      error_propagate(errp, err);
> >  }
> >
> > +void acpi_table_add(const QemuOpts *opts, Error **errp)
> > +{
> > +    const char *val;
> > +
> > +    val =3D qemu_opt_get((QemuOpts *)opts, "file");
> > +    if (val) {
> > +        acpi_table_from_file(true, val, opts, errp);
> > +        return;
> > +    }
> > +
> > +    val =3D qemu_opt_get((QemuOpts *)opts, "data");
> > +    if (val) {
> > +        acpi_table_from_file(false, val, opts, errp);
> > +        return;
> > +    }
> > +
> > +    error_setg(errp, "'-acpitable' requires one of 'data' or 'file'");
> > +}
> > +
> >  static bool acpi_table_builtin =3D false;
> >
> >  void acpi_table_add_builtin(const QemuOpts *opts, Error **errp)
> > diff --git a/qapi-schema.json b/qapi-schema.json
> > index 5658723..75b8b3b 100644
> > --- a/qapi-schema.json
> > +++ b/qapi-schema.json
> > @@ -3597,17 +3597,17 @@
> >  ##
> >  # @AcpiTableOptions
> >  #
> > -# Specify an ACPI table on the command line to load.
> > +# Specify ACPI table options for the table loaded on the command line.
> >  #
> > -# At most one of @file and @data can be specified. The list of files s=
pecified
> > -# by any one of them is loaded and concatenated in order.
>=20
>=20
> > -# If both are omitted, @data is implied.
> You are removing this bit of documentation, which is still true

I shouldn't remove it.

It seems this implication is still working after applying my changes.
I booted qemu with -acpitable ssdt-local.aml,sig=3DSSDT and it worked same =
as -acpitable file=3Dssdt-local.aml.
ssdt-local.aml is loaded as an SSDT table.

How is this implication achieved in the code?

>=20
>=20
> > +# ACPI table can be loaded via 'file' and 'data' options. At most one =
of
> > +# 'file' and 'data' can be specified. The list of files specified by a=
ny one
> > +# of them is loaded and concatenated in order.
> >  #
> >  # Other fields / optargs can be used to override fields of the generic=
 ACPI
> >  # table header; refer to the ACPI specification 5.0, section 5.2.6 Sys=
tem
> >  # Description Table Header. If a header field is not overridden, then =
the
> > -# corresponding value from the concatenated blob is used (in case of @=
file), or
> > -# it is filled in with a hard-coded value (in case of @data).
> > +# corresponding value from the concatenated blob is used (in case of '=
file'),
> > +# or it is filled in with a hard-coded value (in case of 'data').
> >  #
> >  # String fields are copied into the matching ACPI member from lowest a=
ddress
> >  # upwards, and silently truncated / NUL-padded to length.
> > @@ -3628,16 +3628,6 @@
> >  # @asl_compiler_rev: #optional revision number of the utility that cre=
ated the
> >  #                    table (4 bytes)
> >  #
> > -# @file: #optional colon (:) separated list of pathnames to load and
> > -#        concatenate as table data. The resultant binary blob is expec=
ted to
> > -#        have an ACPI table header. At least one file is required. Thi=
s field
> > -#        excludes @data.
> > -#
> > -# @data: #optional colon (:) separated list of pathnames to load and
> > -#        concatenate as table data. The resultant binary blob must not=
 have an
> > -#        ACPI table header. At least one file is required. This field =
excludes
> > -#        @file.
> > -#
> >  # Since 1.5
> >  ##
> >  { 'struct': 'AcpiTableOptions',
> > @@ -3648,9 +3638,7 @@
> >      '*oem_table_id':      'str',
> >      '*oem_rev':           'uint32',
> >      '*asl_compiler_id':   'str',
> > -    '*asl_compiler_rev':  'uint32',
> > -    '*file':              'str',
> > -    '*data':              'str' }}
> > +    '*asl_compiler_rev':  'uint32' }}
> it's probably is not ok to remove fields here
> as it might break existing users that expect them

That's what I don't know and need to ask.

In the current code base, I can only see AcpiTableOptions used in acpi_tabl=
e_install().
While it is commented that hdrs->file/data are useless for acpi_table_insta=
ll().

Are there any external users for AcpiTableOptions?

Thanks and best regards
Lv

>=20
> >
> >  ##
> >  # @CommandLineParameterType:
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index a71aaf8..5fe7f87 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -1493,10 +1493,13 @@ Disable HPET support.
> >  ETEXI
> >
> >  DEF("acpitable", HAS_ARG, QEMU_OPTION_acpitable,
> > -    "-acpitable
> [sig=3Dstr][,rev=3Dn][,oem_id=3Dstr][,oem_table_id=3Dstr][,oem_rev=3Dn][,=
asl_compiler_id=3Dstr][,asl_compiler_rev=3D
> n][,{data|file}=3Dfile1[:file2]...]\n"
> > +    "-acpitable {data|file}=3Dfile1[:file2]...\n"
> > +    "             [,sig=3Dstr][,rev=3Dn]\n"
> > +    "             [,oem_id=3Dstr][,oem_table_id=3Dstr][,oem_rev=3Dn]\n=
"
> > +    "             [,asl_compiler_id=3Dstr][,asl_compiler_rev=3Dn]\n"
> >      "                ACPI table description\n", QEMU_ARCH_I386)
> >  STEXI
> > -@item -acpitable
> [sig=3D@var{str}][,rev=3D@var{n}][,oem_id=3D@var{str}][,oem_table_id=3D@v=
ar{str}][,oem_rev=3D@var{n}]
> [,asl_compiler_id=3D@var{str}][,asl_compiler_rev=3D@var{n}][,data=3D@var{=
file1}[:@var{file2}]...]
> > +@item -acpitable
> data=3D@var{file1}[:@var{file2}]...[,sig=3D@var{str}][,rev=3D@var{n}][,oe=
m_id=3D@var{str}][,oem_table_id=3D@var{
> str}][,oem_rev=3D@var{n}] [,asl_compiler_id=3D@var{str}][,asl_compiler_re=
v=3D@var{n}]
> >  @findex -acpitable
> >  Add ACPI table with specified header fields and context from specified=
 files.
> >  For file=3D, take whole ACPI table from the specified files, including=
 all

