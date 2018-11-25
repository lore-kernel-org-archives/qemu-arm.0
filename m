Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4726860wrt;
        Sun, 25 Nov 2018 13:16:49 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Xx2/IuSOAFUUWDUbibHNFBmO5QZo3Zvm/OgrpUIfv9Ex8UBpD726KSy6oN70kZfUCjkeXV
X-Received: by 2002:a25:a287:: with SMTP id c7-v6mr25244697ybi.418.1543180609825;
        Sun, 25 Nov 2018 13:16:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543180609; cv=none;
        d=google.com; s=arc-20160816;
        b=RCDVtNrSKF8cy8EG96zbgjHfWU7ulQ1T7tcb0rySJU2pcXTliByr1mCmacpFRL6Dyp
         ueviFznwPijByiUBAoVJTgBCs1MXbvEK8kN/gBLlekhI9PqD+kF8XukR82rVnYINE3iw
         bNbC4MZoV8GhEN+Jj61wF/AkNCOULiFHSv8j0h+dc2ZaZq/weag8Bcro6NlBWIDGpqwR
         Fn1Vhomhu80XKtNv46ip39hzRcZg3DQKXSCbbbUaFEOSnxPhTt7acSUe9QGW9fstL9Yj
         mH7ZPMo0Fg6AwFjtin0efGISzFbTih7IDUgYKz2kfzaOye9U8HyXQ6ypszPU3B2bsmzZ
         f8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=KQIaSPkG6tLj0SqBEOlWs3aKmyQyyZoGO8dDXx+z4aw=;
        b=l/GYir33pGgGkBCbL+FsT2GdIS3EsAJH80XBQ714HqPSiQeNVOMnN8JDMfqDKPwpZ1
         r5tcBAJUGzZQ4i+opk9OD8lT2wmE1WAKTMPGHm8eO/ln42TFszJIEqQw9HvboFcmyczr
         SJI7i0EvL1OmtuOxGMn9ZbSQ82sn4l0JG0cYStmdiMCs9ieX+kZn6GqiREXJvQGBxV6U
         bioN/RemXqigv6Owtw4RJxwOs+zF829kM5txjRqLbg6+sLnJ4+0CGkdxeQ5dI3ZZyfVl
         O+QK/C2wQiMF7/nKsqK3tdo44p6PmyLLZcipUBoGtb/NLgIrOxdoViaSGHh59K1LDENd
         PZxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x40-v6si17687330ybd.467.2018.11.25.13.16.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Nov 2018 13:16:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gR1lp-0007Hs-4M
	for alex.bennee@linaro.org; Sun, 25 Nov 2018 16:16:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1Tn-0006uX-13
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 15:58:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1Ti-0002HL-Q6
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 15:58:10 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38199)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gR1Ti-0002Ge-Kp
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 15:58:06 -0500
Received: by mail-wr1-f66.google.com with SMTP id v13so13391390wrw.5
	for <qemu-arm@nongnu.org>; Sun, 25 Nov 2018 12:58:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KQIaSPkG6tLj0SqBEOlWs3aKmyQyyZoGO8dDXx+z4aw=;
	b=CYBolD9LeW2vECuPqJNbIY+doPl+js4GfWBLSm4TG5LdzPpmiiaN6WtHGZAyFI6MxI
	h6pv3rfzMhzgGL7HKEWU3YSDopcElV/2FsUMyqRMyl8SDjm1365gUKdYvU3ilJUl5Vct
	mBGnusD3FmnaPG3a5ynt4XueQvSdLzg3COIbnrJ9I8dJMb9zEq6QlIXHHheySix4z9h9
	T8lLVu7dE/o2g6rHS1qdurJ3PQT9342tUOc5+1UiWZfqurkrepmve6bHGOQvNXzJ97il
	HqDymJ3w/cmlfzighIj6NqL6xW5k14dla+mNN4X6eawHQEjQ2J1STDoDUbuBbyghQjRZ
	28wg==
X-Gm-Message-State: AA+aEWaubGJqMY57C5mc5IK/P2temICdGYan1FWqBXbbXNqps2y/8LDY
	F80o7D2bNT/SwJ2DV6xUhd8dGahtJ1c=
X-Received: by 2002:adf:a357:: with SMTP id d23mr22055086wrb.195.1543179485287;
	Sun, 25 Nov 2018 12:58:05 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	g198sm16669466wmd.23.2018.11.25.12.58.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Nov 2018 12:58:04 -0800 (PST)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-3-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c9b126f0-2f2b-3fee-49f0-b04f11dac041@redhat.com>
Date: Sun, 25 Nov 2018 21:58:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181123091729.29921-3-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 02/16] gdbstub: introduce GDB
 processes
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
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9fUaErcY11GU

On 23/11/18 10:17, Luc Michel wrote:
> Add a structure GDBProcess that represent processes from the GDB
> semantic point of view.
> 
> CPUs can be split into different processes, by grouping them under
> different cpu-cluster objects.  Each occurrence of a cpu-cluster object
> implies the existence of the corresponding process in the GDB stub. The
> GDB process ID is derived from the corresponding cluster ID as follows:
> 
>   GDB PID = cluster ID + 1
> 
> This is because PIDs -1 and 0 are reserved in GDB and cannot be used by
> processes.
> 
> When no such container are found, all the CPUs are put in a unique GDB
> process (create_unique_process()). This is also the case when compiled
> in user mode, where multi-processes do not make much sense for now.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  gdbstub.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index c4e4f9f082..26f5a7449a 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -27,10 +27,11 @@
>  #include "monitor/monitor.h"
>  #include "chardev/char.h"
>  #include "chardev/char-fe.h"
>  #include "sysemu/sysemu.h"
>  #include "exec/gdbstub.h"
> +#include "hw/cpu/cluster.h"
>  #endif
>  
>  #define MAX_PACKET_LENGTH 4096
>  
>  #include "qemu/sockets.h"
> @@ -294,10 +295,15 @@ typedef struct GDBRegisterState {
>      gdb_reg_cb set_reg;
>      const char *xml;
>      struct GDBRegisterState *next;
>  } GDBRegisterState;
>  
> +typedef struct GDBProcess {
> +    uint32_t pid;
> +    bool attached;
> +} GDBProcess;
> +
>  enum RSState {
>      RS_INACTIVE,
>      RS_IDLE,
>      RS_GETLINE,
>      RS_GETLINE_ESC,
> @@ -322,10 +328,13 @@ typedef struct GDBState {
>      int running_state;
>  #else
>      CharBackend chr;
>      Chardev *mon_chr;
>  #endif
> +    bool multiprocess;
> +    GDBProcess *processes;
> +    int process_num;
>      char syscall_buf[256];
>      gdb_syscall_complete_cb current_syscall_cb;
>  } GDBState;
>  
>  /* By default use no IRQs and no timers while single stepping so as to
> @@ -1749,10 +1758,24 @@ void gdb_exit(CPUArchState *env, int code)
>  #ifndef CONFIG_USER_ONLY
>    qemu_chr_fe_deinit(&s->chr, true);
>  #endif
>  }
>  
> +/*
> + * Create a unique process containing all the CPUs.
> + */
> +static void create_unique_process(GDBState *s)
> +{
> +    GDBProcess *process;
> +
> +    s->processes = g_malloc0(sizeof(GDBProcess));

good place to use:

       s->processes = g_new0(GDBProcess, 1);

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +    s->process_num = 1;
> +    process = &s->processes[0];
> +
> +    process->pid = 1;
> +}
> +
>  #ifdef CONFIG_USER_ONLY
>  int
>  gdb_handlesig(CPUState *cpu, int sig)
>  {
>      GDBState *s;
> @@ -1846,10 +1869,11 @@ static bool gdb_accept(void)
>      }
>  
>      s = g_malloc0(sizeof(GDBState));
>      s->c_cpu = first_cpu;
>      s->g_cpu = first_cpu;
> +    create_unique_process(s);
>      s->fd = fd;
>      gdb_has_xml = false;
>  
>      gdbserver_state = s;
>      return true;
> @@ -2002,10 +2026,69 @@ static const TypeInfo char_gdb_type_info = {
>      .name = TYPE_CHARDEV_GDB,
>      .parent = TYPE_CHARDEV,
>      .class_init = char_gdb_class_init,
>  };
>  
> +static int find_cpu_clusters(Object *child, void *opaque)
> +{
> +    if (object_dynamic_cast(child, TYPE_CPU_CLUSTER)) {
> +        GDBState *s = (GDBState *) opaque;
> +        CPUClusterState *cluster = CPU_CLUSTER(child);
> +        GDBProcess *process;
> +
> +        s->processes = g_renew(GDBProcess, s->processes, ++s->process_num);
> +
> +        process = &s->processes[s->process_num - 1];
> +
> +        /*
> +         * GDB process IDs -1 and 0 are reserved. To avoid subtle errors at
> +         * runtime, we enforce here that the machine does not use a cluster ID
> +         * that would lead to PID 0. */
> +        assert(process->pid != UINT32_MAX);
> +        process->pid = cluster->cluster_id + 1;
> +        process->attached = false;
> +
> +        return 0;
> +    }
> +
> +    return object_child_foreach(child, find_cpu_clusters, opaque);
> +}
> +
> +static int pid_order(const void *a, const void *b)
> +{
> +    GDBProcess *pa = (GDBProcess *) a;
> +    GDBProcess *pb = (GDBProcess *) b;
> +
> +    if (pa->pid < pb->pid) {
> +        return -1;
> +    } else if (pa->pid > pb->pid) {
> +        return 1;
> +    } else {
> +        return 0;
> +    }
> +}
> +
> +static void create_processes(GDBState *s)
> +{
> +    object_child_foreach(object_get_root(), find_cpu_clusters, s);
> +
> +    if (!s->processes) {
> +        /* No CPU cluster specified by the machine */
> +        create_unique_process(s);
> +    } else {
> +        /* Sort by PID */
> +        qsort(s->processes, s->process_num, sizeof(s->processes[0]), pid_order);
> +    }
> +}
> +
> +static void cleanup_processes(GDBState *s)
> +{
> +    g_free(s->processes);
> +    s->process_num = 0;
> +    s->processes = NULL;
> +}
> +
>  int gdbserver_start(const char *device)
>  {
>      trace_gdbstub_op_start(device);
>  
>      GDBState *s;
> @@ -2058,15 +2141,19 @@ int gdbserver_start(const char *device)
>                                     NULL, &error_abort);
>          monitor_init(mon_chr, 0);
>      } else {
>          qemu_chr_fe_deinit(&s->chr, true);
>          mon_chr = s->mon_chr;
> +        cleanup_processes(s);
>          memset(s, 0, sizeof(GDBState));
>          s->mon_chr = mon_chr;
>      }
>      s->c_cpu = first_cpu;
>      s->g_cpu = first_cpu;
> +
> +    create_processes(s);
> +
>      if (chr) {
>          qemu_chr_fe_init(&s->chr, chr, &error_abort);
>          qemu_chr_fe_set_handlers(&s->chr, gdb_chr_can_receive, gdb_chr_receive,
>                                   gdb_chr_event, NULL, NULL, NULL, true);
>      }
> 
