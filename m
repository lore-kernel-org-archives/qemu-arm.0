Received: by 10.25.21.156 with SMTP id 28csp1779668lfv;
        Fri, 5 Aug 2016 05:15:47 -0700 (PDT)
X-Received: by 10.200.50.199 with SMTP id a7mr12409970qtb.43.1470399347167;
        Fri, 05 Aug 2016 05:15:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l2si8771583qke.304.2016.08.05.05.15.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Aug 2016 05:15:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVe2U-0006mh-JC
	for alex.bennee@linaro.org; Fri, 05 Aug 2016 08:15:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bVe2N-0006jc-13
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 08:15:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bVe2K-0002Hr-LM
	for qemu-arm@nongnu.org; Fri, 05 Aug 2016 08:15:37 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:33400)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bVe2F-0002FV-2S; Fri, 05 Aug 2016 08:15:31 -0400
Received: by mail-wm0-x244.google.com with SMTP id o80so3542740wme.0;
	Fri, 05 Aug 2016 05:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=pYvd64D1FrEVQhlU/HEjO9Ei+i2zguMNFrERf2wEEu4=;
	b=hcvXDJOiOhk5YfNjLwzF/zMhFbZY62J2pthGhfeNxPzQS+q2JmIhE3v6dr3CYBaoZo
	QszIHM+VvOIVG2rkctgsfG5yrywiz9VJ1rPiwqcC7/4lCXmwCDRy8DTZ0tJSBa5PLCve
	2MKj+djL+Bc1j/ASRvG6Ej1lhN1Jvyl2QMu7LjL7V8cOGFYR3KuDYk9fxO+VzD7o9hBV
	c7eXcGbCi50+PnzMTNAaGUzDiAMXORSguBzGzkREnChAw1LP3WNBrznnyivJYF0b4Q26
	uWWtBLvqBCpBDuAwDDspcXzXGR7WfymJpvHeeo4cJS53cM24O1baeeQlkHSoP+7oIdwg
	TdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=pYvd64D1FrEVQhlU/HEjO9Ei+i2zguMNFrERf2wEEu4=;
	b=QIVoeoiprG0Z1HYPzTXPjlUYHI7tf5gzwz7ePuprxQBsaNikpxR0e0XfeBK5AjW/Ra
	GpnK0Iasu+80yOCTNztNdWB4QNAaQ6ggzu5xbWoKA0JH2f81mJ9ynDf83nF8+tGmcNSm
	Qb/zgGebjdaUjhqVZWgmGL2is2NEHwFs7xM/tKWpxtf17qTfHQX4mEyd9zGkbJW5w7Q+
	17krE7LYQUof2UxL+QpzYeurrT2ACYNwCh/LsrWHmQhh3y5sT+SM9RQHe/nOz4adglmA
	qxlh2cJHrMuHaTkIdxXOiDZmm32XPaCZzc4b9uG4Re4/aOa1P7s+EooXRiUBnQ18vnFw
	n/FQ==
X-Gm-Message-State: AEkoouu/xGxH6yE8XmArV4/GwiRDuy7ymxaJj71G37uSBGeXtzUhXfOmX5Al1zNy7DX6Wg==
X-Received: by 10.28.31.147 with SMTP id f141mr2986871wmf.69.1470399330159;
	Fri, 05 Aug 2016 05:15:30 -0700 (PDT)
Received: from [192.168.10.165] (94-39-152-88.adsl-ull.clienti.tiscali.it.
	[94.39.152.88]) by smtp.googlemail.com with ESMTPSA id
	p23sm8390243wme.8.2016.08.05.05.15.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Aug 2016 05:15:28 -0700 (PDT)
To: Lv Zheng <lv.zheng@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
References: <24044757332cd427e378053739e6f49980e0ac5d.1470392366.git.lv.zheng@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <92ca7f37-9417-e122-a3cf-d3d85a1b89f7@redhat.com>
Date: Fri, 5 Aug 2016 14:15:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <24044757332cd427e378053739e6f49980e0ac5d.1470392366.git.lv.zheng@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Lv Zheng <zetalog@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RjQQocVCxZEO



On 05/08/2016 12:19, Lv Zheng wrote:
> Changing debugcon port to 0x402 allows the seabios AML table pre-defined
> DBUG() control method to be able to dump the AML debugging information to
> the re-directed debugging console.
> 
> If the debug port number is configurable, users can further specify a
> proper IO port number for it to make external BIOS's debugging
> facility functioning.
> 
> Signed-off-by: Lv Zheng <lv.zheng@intel.com>

You can do this with

   -global isa-debugcon.iobase=0x402

Paolo

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
> 
