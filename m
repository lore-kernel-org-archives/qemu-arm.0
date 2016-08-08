Received: by 10.25.21.156 with SMTP id 28csp2856234lfv;
        Sun, 7 Aug 2016 18:36:44 -0700 (PDT)
X-Received: by 10.200.35.169 with SMTP id q38mr25840626qtq.4.1470620204841;
        Sun, 07 Aug 2016 18:36:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n132si16017028qke.10.2016.08.07.18.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 Aug 2016 18:36:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54437 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bWZUi-0002jN-9D
	for alex.bennee@linaro.org; Sun, 07 Aug 2016 21:36:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bWZUe-0002j7-IA
	for qemu-arm@nongnu.org; Sun, 07 Aug 2016 21:36:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bWZUb-00028r-6C
	for qemu-arm@nongnu.org; Sun, 07 Aug 2016 21:36:40 -0400
Received: from mga09.intel.com ([134.134.136.24]:14359)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>)
	id 1bWZUa-00028O-Qx; Sun, 07 Aug 2016 21:36:37 -0400
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 07 Aug 2016 18:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,487,1464678000"; d="scan'208";a="1036860176"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
	by fmsmga002.fm.intel.com with ESMTP; 07 Aug 2016 18:36:33 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
	FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Sun, 7 Aug 2016 18:36:30 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.8]) by
	SHSMSX103.ccr.corp.intel.com ([169.254.4.181]) with mapi id
	14.03.0248.002; Mon, 8 Aug 2016 09:36:29 +0800
From: "Zheng, Lv" <lv.zheng@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Thread-Topic: [PATCH] debugcon: Add -debugport option to allow changing
	debug console port number
Thread-Index: AQHR7wL4V1YYDepyhEaeEKGeQ9GwZKA8ffYAgAHN7DA=
Date: Mon, 8 Aug 2016 01:36:28 +0000
Message-ID: <1AE640813FDE7649BE1B193DEA596E883BC0AF08@SHSMSX101.ccr.corp.intel.com>
References: <24044757332cd427e378053739e6f49980e0ac5d.1470392366.git.lv.zheng@intel.com>
	<20160807085907-mutt-send-email-mst@kernel.org>
In-Reply-To: <20160807085907-mutt-send-email-mst@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTVmOGYyYzQtZDA5Yy00NDhmLWEyYmQtMjMzMTdlNmFmNDc4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6IktSM2c2QTRLeUk3Mmd5V1ZKN0VQeXRcL2Z5ZytjSlZuT040MjdMaE4yK21RPSJ9
x-ctpclassification: CTP_IC
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: Re: [Qemu-arm] [PATCH] debugcon: Add -debugport option to allow
 changing debug console port number
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
Cc: Igor Mammedov <imammedo@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>, Lv Zheng <zetalog@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DQyJ6T7R/AqT

Hi, Michael

> From: Michael S. Tsirkin [mailto:mst@redhat.com]
> Subject: Re: [PATCH] debugcon: Add -debugport option to allow changing
> debug console port number
>=20
> On Fri, Aug 05, 2016 at 06:19:39PM +0800, Lv Zheng wrote:
> > Changing debugcon port to 0x402 allows the seabios AML table pre-
> defined
> > DBUG() control method to be able to dump the AML debugging
> information to
> > the re-directed debugging console.
> >
> > If the debug port number is configurable, users can further specify a
> > proper IO port number for it to make external BIOS's debugging
> > facility functioning.
> >
> > Signed-off-by: Lv Zheng <lv.zheng@intel.com>
>=20
> This doesn't look like a reasonable interface.
>=20
> How will user know which io ports are safe to use,
> to avoid e.g. conflicts with pci devices?
>=20
[Lv Zheng]=20
OK, I'll just correct the acpi-build.c.

Thanks
Lv

>=20
>=20
> > ---
> >  hw/char/debugcon.c      |    4 ++++
> >  hw/i386/acpi-build.c    |    3 ++-
> >  include/sysemu/sysemu.h |    1 +
> >  qemu-options.hx         |    9 +++++++++
> >  vl.c                    |   15 +++++++++++++++
> >  5 files changed, 31 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
> > index e7f025e..f966a09 100644
> > --- a/hw/char/debugcon.c
> > +++ b/hw/char/debugcon.c
> > @@ -105,6 +105,10 @@ static void debugcon_isa_realizefn(DeviceState
> *dev, Error **errp)
> >          error_propagate(errp, err);
> >          return;
> >      }
> > +    if (debug_port !=3D 0xe9) {
> > +        qdev_prop_set_uint32(dev, "iobase", debug_port);
> > +        qdev_prop_set_uint32(dev, "readback", debug_port);
> > +    }
> >      memory_region_init_io(&s->io, OBJECT(dev), &debugcon_ops, s,
> >                            TYPE_ISA_DEBUGCON_DEVICE, 1);
> >      memory_region_add_subregion(isa_address_space_io(d),
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index a26a4bb..14c6224 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1442,7 +1442,8 @@ static void build_dbg_aml(Aml *table)
> >      Aml *idx =3D aml_local(2);
> >
> >      aml_append(scope,
> > -       aml_operation_region("DBG", AML_SYSTEM_IO, aml_int(0x0402),
> 0x01));
> > +       aml_operation_region("DBG", AML_SYSTEM_IO,
> > +                            aml_int(debug_port), 0x01));
> >      field =3D aml_field("DBG", AML_BYTE_ACC, AML_NOLOCK,
> AML_PRESERVE);
> >      aml_append(field, aml_named_field("DBGB", 8));
> >      aml_append(scope, field);
> > diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> > index ee7c760..9e0a30b 100644
> > --- a/include/sysemu/sysemu.h
> > +++ b/include/sysemu/sysemu.h
> > @@ -167,6 +167,7 @@ extern uint8_t qemu_extra_params_fw[2];
> >  extern QEMUClockType rtc_clock;
> >  extern const char *mem_path;
> >  extern int mem_prealloc;
> > +extern uint32_t debug_port;
> >
> >  #define MAX_NODES 128
> >  #define NUMA_NODE_UNASSIGNED MAX_NODES
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index a71aaf8..05aedce 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -3123,6 +3123,15 @@ The default device is @code{vc} in graphical
> mode and @code{stdio} in
> >  non graphical mode.
> >  ETEXI
> >
> > +DEF("debugport", HAS_ARG, QEMU_OPTION_debugport, \
> > +    "-debugport n     Specify debug IO port number\n",
> > +    QEMU_ARCH_ALL)
> > +STEXI
> > +@item -debugport @var{n}
> > +@findex -debugport
> > +Specify the debug IO port number, default is 0xe9.
> > +ETEXI
> > +
> >  DEF("pidfile", HAS_ARG, QEMU_OPTION_pidfile, \
> >      "-pidfile file   write PID to 'file'\n", QEMU_ARCH_ALL)
> >  STEXI
> > diff --git a/vl.c b/vl.c
> > index e7c2c62..710e14d 100644
> > --- a/vl.c
> > +++ b/vl.c
> > @@ -178,6 +178,7 @@ bool boot_strict;
> >  uint8_t *boot_splash_filedata;
> >  size_t boot_splash_filedata_size;
> >  uint8_t qemu_extra_params_fw[2];
> > +uint32_t debug_port =3D 0xe9;
> >
> >  int icount_align_option;
> >
> > @@ -2584,6 +2585,17 @@ static int debugcon_parse(const char
> *devname)
> >      return 0;
> >  }
> >
> > +static void debugcon_parse_port(const char *arg)
> > +{
> > +    uint32_t port;
> > +
> > +    port =3D strtoul(arg, NULL, 0);
> > +    if (port) {
> > +        printf("Re-assign debug console to port 0x%08x.\n", port);
> > +        debug_port =3D port;
> > +    }
> > +}
> > +
> >  static gint machine_class_cmp(gconstpointer a, gconstpointer b)
> >  {
> >      const MachineClass *mc1 =3D a, *mc2 =3D b;
> > @@ -3580,6 +3592,9 @@ int main(int argc, char **argv, char **envp)
> >              case QEMU_OPTION_debugcon:
> >                  add_device_config(DEV_DEBUGCON, optarg);
> >                  break;
> > +            case QEMU_OPTION_debugport:
> > +                debugcon_parse_port(optarg);
> > +                break;
> >              case QEMU_OPTION_loadvm:
> >                  loadvm =3D optarg;
> >                  break;
> > --
> > 1.7.10
