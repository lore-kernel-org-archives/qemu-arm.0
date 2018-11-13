Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4226397wrw;
        Tue, 13 Nov 2018 03:04:06 -0800 (PST)
X-Google-Smtp-Source: AJdET5fgkTHhYiBuJjleCqmv7/YXzISTBLhNUEy4zHbvL3dAm/epBsynB/eyhjHZ3dwjpTmRdUia
X-Received: by 2002:a37:2808:: with SMTP id o8mr4247515qkh.14.1542107046080;
        Tue, 13 Nov 2018 03:04:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542107046; cv=none;
        d=google.com; s=arc-20160816;
        b=Ahz+SsmpSi8sQcw7LG6673htW1Z6qI6z1oUJsPKdSjfJUuTfVDCth1uIaf70QTBirL
         i0R9KgCDuAScavoAYV1nItN56eHvHwgYzLK7q/KOlmo5yyENvY3LFIM/vaMIPqksNYc5
         DcPl0EskDOeTRryQN3kG0epY5//ArdtlCziAqM/XUIRuHmXywqy6DaJWFfrQKDIJW9pw
         mRWJOva09Q5ClR3wtwrRyKgC/rmBdsXd/Y4lVzpABWZ45yw43KNBj/glEK8XH7/OORb4
         iYKMeYJUdImwUjpYguz/IAh6Hd36LxPnmQx4HbZC3EDfEgMrRv2C+ZYxwbdqq6Tu1aYY
         FyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=ifzJpYZtM9qgeEacVzqcfYTqfdf1imygUmXSCONyUA0=;
        b=diyS2SoV1SaCcVkac1T/1BdiGqXtttYldzcNvKVGn7mnAoTUUtqPEB0kQLQYFSFcBA
         knVHpOabpsDk5mXhefq+0g6MU1+DMUu937WEnb5UPRyjbv+4wLPkt8Px2+OaKdJ9+cBZ
         mwlbilNVofN8NTQdev494/USc9FeeFLvOasMAGCbqg+POwBkxhm4xKRShZTbfL3ChpIe
         WeMZBZHnA57nYH/hRL1z6De4wVNDr/R+EcfLxyrfuRWjgBchgK3324yg55zQfy3Xhtia
         YEL6vLOR541AKnFWGnYs7rFkBHmLtFa06JI9jn/GLPhEcFa55pY1eauy/fVtAuHBQ8I9
         9ICw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="GoZBA2L/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f57si8480642qtf.362.2018.11.13.03.04.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 03:04:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="GoZBA2L/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53147 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMWUH-0006J7-GF
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 06:04:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gMWU4-0005S7-Jg
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 06:03:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gMWJB-0000PD-1d
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 05:52:40 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:40033)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gMWIw-0000Jj-6a; Tue, 13 Nov 2018 05:52:22 -0500
Received: by mail-lj1-x241.google.com with SMTP id t22-v6so10383706lji.7;
	Tue, 13 Nov 2018 02:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ifzJpYZtM9qgeEacVzqcfYTqfdf1imygUmXSCONyUA0=;
	b=GoZBA2L/cHG9qhanGlWA+PTChdIatO8G3PYHrawQ79i/GWKnmHkTXQjjstO8E+/+Ba
	Vn1308m4OxlzcIed6MsIeWQkcVQEMKVxO2pkXaqSH4vVQQI/VZWZQaS02QW9FxoMHOeQ
	b1oGDlFoh5YJ5zEIinzJWLTS1qTZsuatRkr8K1IzrOiug8Mb4k/DnSXK1MZfTnr/3n5N
	lkagHNQvt3zVxlvtwbxup427lZsqvPIJvRDODV8yqyndbV9d8xVfMOj+rrrCVwVmB3cm
	wCocKRC/WZr9FUYIduHHRFszo6KPwxkjszLS22A1RRRktG990t6UibXhfC7RtoQj8Ax0
	LYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ifzJpYZtM9qgeEacVzqcfYTqfdf1imygUmXSCONyUA0=;
	b=hlTpHSRrcoKaxrHFL7WZNdINrXU2PmdvlCR7iAiC90MipnBknAxPohPebPhVJGrjE5
	lu4KwDNx2jAnvkRrkcThb+d3I942gjT7UEe9fOpGJS4vtyHwnxx0TKW7e0h6T7SyLzb2
	MiH/qQ29I5li3YqswsdgOfAXkFWD1DxuuXPfR47/BTu4v9iZhvjetyNP3X7NvcEB9alT
	nDRkD2ae+af3s9UDFMLJ2YxyZyPEz1pceudxz0+XtfdGMaGValVbGS3ygoLfPDA0RZ6B
	Bps2FvJB22IGuT8jkJa0y4/01WfqoU15aCpCn0Ad7Br7x59mpiKHnHK9NN6bmwomRPQe
	OkWg==
X-Gm-Message-State: AGRZ1gKEqR/j2ukOYxrUFuh+LI7xd0r5gx/Jn2KbBLM6SPJUcDYyDS47
	tpAjZ9avYZc2It8Bo7H3bIM=
X-Received: by 2002:a2e:568b:: with SMTP id
	k11-v6mr2852857lje.105.1542106338567; 
	Tue, 13 Nov 2018 02:52:18 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	j17sm3392058lfi.43.2018.11.13.02.52.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 02:52:17 -0800 (PST)
Date: Tue, 13 Nov 2018 11:52:16 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181113105216.GG1148@toto>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
	<20181110081147.4027-3-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181110081147.4027-3-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v5 02/16] gdbstub: introduce GDB processes
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
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I7Pww5AhdN6p

On Sat, Nov 10, 2018 at 09:11:33AM +0100, Luc Michel wrote:
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
> ---
>  gdbstub.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index c4e4f9f082..0d70b89598 100644
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
> @@ -2002,10 +2026,58 @@ static const TypeInfo char_gdb_type_info = {
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
> +        /* GDB process IDs -1 and 0 are reserved */
> +        process->pid = cluster->cluster_id + 1;

This may be theoretical but since both pid and cluster_id are uint32_t
you may end up with 0 here.

You may want to limit cluster_id's to something like the range 0 - INT32_MAX.



> +        process->attached = false;
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
> +    return pa->pid - pb->pid;

Similarly here, is this safe?
e.g:
pa->pid = 1
pb->pid = 0x80000002


Otherwise:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



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
> @@ -2058,15 +2130,19 @@ int gdbserver_start(const char *device)
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
> -- 
> 2.19.1
> 
> 
