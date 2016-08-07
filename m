Received: by 10.25.21.156 with SMTP id 28csp2538542lfv;
        Sat, 6 Aug 2016 23:01:08 -0700 (PDT)
X-Received: by 10.200.35.215 with SMTP id r23mr21791920qtr.140.1470549668586;
        Sat, 06 Aug 2016 23:01:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q65si16609998qtd.25.2016.08.06.23.01.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Aug 2016 23:01:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bWH91-0005tH-SD
	for alex.bennee@linaro.org; Sun, 07 Aug 2016 02:01:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1bWH8y-0005sB-4k
	for qemu-arm@nongnu.org; Sun, 07 Aug 2016 02:01:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1bWH8r-0000Yy-PT
	for qemu-arm@nongnu.org; Sun, 07 Aug 2016 02:01:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56064)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1bWH8r-0000YN-HM; Sun, 07 Aug 2016 02:00:57 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23F39C03070C;
	Sun,  7 Aug 2016 06:00:55 +0000 (UTC)
Received: from redhat.com (vpn1-7-9.ams2.redhat.com [10.36.7.9])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u7760oJA032539; Sun, 7 Aug 2016 02:00:51 -0400
Date: Sun, 7 Aug 2016 09:00:50 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lv Zheng <lv.zheng@intel.com>
Message-ID: <20160807085907-mutt-send-email-mst@kernel.org>
References: <24044757332cd427e378053739e6f49980e0ac5d.1470392366.git.lv.zheng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24044757332cd427e378053739e6f49980e0ac5d.1470392366.git.lv.zheng@intel.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sun, 07 Aug 2016 06:00:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Lv Zheng <zetalog@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sJ/lStKrX10t

On Fri, Aug 05, 2016 at 06:19:39PM +0800, Lv Zheng wrote:
> Changing debugcon port to 0x402 allows the seabios AML table pre-defined
> DBUG() control method to be able to dump the AML debugging information to
> the re-directed debugging console.
> 
> If the debug port number is configurable, users can further specify a
> proper IO port number for it to make external BIOS's debugging
> facility functioning.
> 
> Signed-off-by: Lv Zheng <lv.zheng@intel.com>

This doesn't look like a reasonable interface.

How will user know which io ports are safe to use,
to avoid e.g. conflicts with pci devices?



> ---
>  hw/char/debugcon.c      |    4 ++++
>  hw/i386/acpi-build.c    |    3 ++-
>  include/sysemu/sysemu.h |    1 +
>  qemu-options.hx         |    9 +++++++++
>  vl.c                    |   15 +++++++++++++++
>  5 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
> index e7f025e..f966a09 100644
> --- a/hw/char/debugcon.c
> +++ b/hw/char/debugcon.c
> @@ -105,6 +105,10 @@ static void debugcon_isa_realizefn(DeviceState *dev, Error **errp)
>          error_propagate(errp, err);
>          return;
>      }
> +    if (debug_port != 0xe9) {
> +        qdev_prop_set_uint32(dev, "iobase", debug_port);
> +        qdev_prop_set_uint32(dev, "readback", debug_port);
> +    }
>      memory_region_init_io(&s->io, OBJECT(dev), &debugcon_ops, s,
>                            TYPE_ISA_DEBUGCON_DEVICE, 1);
>      memory_region_add_subregion(isa_address_space_io(d),
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index a26a4bb..14c6224 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1442,7 +1442,8 @@ static void build_dbg_aml(Aml *table)
>      Aml *idx = aml_local(2);
>  
>      aml_append(scope,
> -       aml_operation_region("DBG", AML_SYSTEM_IO, aml_int(0x0402), 0x01));
> +       aml_operation_region("DBG", AML_SYSTEM_IO,
> +                            aml_int(debug_port), 0x01));
>      field = aml_field("DBG", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
>      aml_append(field, aml_named_field("DBGB", 8));
>      aml_append(scope, field);
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index ee7c760..9e0a30b 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -167,6 +167,7 @@ extern uint8_t qemu_extra_params_fw[2];
>  extern QEMUClockType rtc_clock;
>  extern const char *mem_path;
>  extern int mem_prealloc;
> +extern uint32_t debug_port;
>  
>  #define MAX_NODES 128
>  #define NUMA_NODE_UNASSIGNED MAX_NODES
> diff --git a/qemu-options.hx b/qemu-options.hx
> index a71aaf8..05aedce 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3123,6 +3123,15 @@ The default device is @code{vc} in graphical mode and @code{stdio} in
>  non graphical mode.
>  ETEXI
>  
> +DEF("debugport", HAS_ARG, QEMU_OPTION_debugport, \
> +    "-debugport n     Specify debug IO port number\n",
> +    QEMU_ARCH_ALL)
> +STEXI
> +@item -debugport @var{n}
> +@findex -debugport
> +Specify the debug IO port number, default is 0xe9.
> +ETEXI
> +
>  DEF("pidfile", HAS_ARG, QEMU_OPTION_pidfile, \
>      "-pidfile file   write PID to 'file'\n", QEMU_ARCH_ALL)
>  STEXI
> diff --git a/vl.c b/vl.c
> index e7c2c62..710e14d 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -178,6 +178,7 @@ bool boot_strict;
>  uint8_t *boot_splash_filedata;
>  size_t boot_splash_filedata_size;
>  uint8_t qemu_extra_params_fw[2];
> +uint32_t debug_port = 0xe9;
>  
>  int icount_align_option;
>  
> @@ -2584,6 +2585,17 @@ static int debugcon_parse(const char *devname)
>      return 0;
>  }
>  
> +static void debugcon_parse_port(const char *arg)
> +{
> +    uint32_t port;
> +
> +    port = strtoul(arg, NULL, 0);
> +    if (port) {
> +        printf("Re-assign debug console to port 0x%08x.\n", port);
> +        debug_port = port;
> +    }
> +}
> +
>  static gint machine_class_cmp(gconstpointer a, gconstpointer b)
>  {
>      const MachineClass *mc1 = a, *mc2 = b;
> @@ -3580,6 +3592,9 @@ int main(int argc, char **argv, char **envp)
>              case QEMU_OPTION_debugcon:
>                  add_device_config(DEV_DEBUGCON, optarg);
>                  break;
> +            case QEMU_OPTION_debugport:
> +                debugcon_parse_port(optarg);
> +                break;
>              case QEMU_OPTION_loadvm:
>                  loadvm = optarg;
>                  break;
> -- 
> 1.7.10
