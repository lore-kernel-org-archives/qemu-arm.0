Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp76813wro;
        Wed, 31 Oct 2018 16:44:00 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cxyIAFXAU4ie8df8Fixw6ZAscwk1aVo5nqMqOXZNM4HrbgcYdQReDtseIgbez2PxRTERuh
X-Received: by 2002:ac8:4912:: with SMTP id e18-v6mr4767811qtq.34.1541029440652;
        Wed, 31 Oct 2018 16:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541029440; cv=none;
        d=google.com; s=arc-20160816;
        b=fHbh4dXXlii+jQVqza0X2oU3sIjAFX0jszdK53erjuahXjuVTIQznegQAcaKJvJsld
         ZP+XE26T7BmWWQcGn0leNdgykNrv2C5bxDHALYAfrKYhGMUpvwrXfeyopp5Mn8ZQqOae
         JKwTwH9opAhpYoqBJ/DsL608I2+XBne8ZSqDyGBvyy5TJFvl3t/ve0CZWJ+4AFJ3E9AR
         LdXmSpaYaLU0o622KpBAB4/VW+54ZCFHI3hYdeYo7CaUSKBsXu2yaRoe2mOq/C0i7Spf
         X3CnlM45vGJ37xnAfwE2HGfDtW8tOyWHj46NJHLjnJ9s/jogl2EY4cgakECgAcGKECCQ
         bLOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=eQ+VjDb0i92Wr+IAUZ7tL2KSpEQEPqCKguVAXSZLqc4=;
        b=PvIRXtyAEggRpTJO/tSowOyn1ACh1vpdnnFb56LB80AHzL+rb7dEZqaDaJx/tpT4xP
         VIhmcVQqK7e6YXnNhwPgLw4Jw+o0+GNawfeY8MvmsaVjsv4CzUNRZok0y0U6mdCHiRiI
         YFTtQKmZkBU/yR4pzAhj54WyK+xyaG5qwqYiY5ml8BL2uV+IMnfzWBtnZottOsaCM5cM
         pGTzmbDpXMtnWno1muk4fPUzRXLs1AluBYgGh3nKNy4COmNolOu2Ad23l40lr5PvhsgZ
         8G3SrB5MqqszDE/8ZQiVQ0GanwInaUP7FxtRZ8MEcRlBxnZVi4lzirjIexZ4K/H75wrM
         LrXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ONKhlA+R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2-v6si2473442qtg.51.2018.10.31.16.44.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 Oct 2018 16:44:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ONKhlA+R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gI09Y-0002AN-4Y
	for alex.bennee@linaro.org; Wed, 31 Oct 2018 19:44:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gI09M-0002AG-BI
	for qemu-arm@nongnu.org; Wed, 31 Oct 2018 19:43:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gI09I-0004Tv-AN
	for qemu-arm@nongnu.org; Wed, 31 Oct 2018 19:43:48 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:39530)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gI09H-0004Te-VH; Wed, 31 Oct 2018 19:43:44 -0400
Received: by mail-pg1-x543.google.com with SMTP id r9-v6so8120488pgv.6;
	Wed, 31 Oct 2018 16:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=eQ+VjDb0i92Wr+IAUZ7tL2KSpEQEPqCKguVAXSZLqc4=;
	b=ONKhlA+RqluLI0sBY6/sznQl2YAmVYqSYQ9vI9nPDpm8Yh+Vi2fJJb9Tk8mpDL7/x6
	ZVX9Qu4h79q2+ADH+Gxes+e5xiRIFAyRlgdFO6kkZBwxFfj/Rw7jPhmR6Wz+1J7+kvjw
	rcxxEYK1fYtWSAVXHUrv+tDd6fsJoVj4whoXAZIYhWkfwcsHeX4P7AkdTMsoUzbQ4bgq
	IJ+xhtTpL1LH5gp9FsmA7hPRmhlKXrLrJxxSXdItiOEekGsShWuoLadqMbuKqD0ArC1c
	tQF1MGz+5pHrDQoiwxHD7WUNGy5O0lThR/DHtS7r5xPbkAVwTdsdAYh99EP8K/7ZQ5Mx
	wTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eQ+VjDb0i92Wr+IAUZ7tL2KSpEQEPqCKguVAXSZLqc4=;
	b=lGmtwhb2KpZgm/DB9V8eaa16DPbuXlpeneIELaSK7Ilbt+i5q4jNAzlBLDWFS6zPP8
	926frNU4+02HpNMbr5tjgZIaPk9x2H15EVGGKJMU5SQM8h+y4GTJQQBfOCXhJjJ8xXn9
	/qrfZd2BFjTGP11+JpbOuHXFpZXFsBsu50jjZWauvgrSDXa65DJyzpNE9ON7C5U+kY7/
	shg2j1+qH++QRseJy2PvxH8RxmbaDMuKrN7TsDnbI5G7+F4ZKZlObPyvs4LfNAYaVI1F
	Qz9wstB/j3uXQPxhZYrb+C481rE0OcWbRUc8G+A4K1cwRO3WCo6wv6YuuvGw/Lx4/3cH
	py9Q==
X-Gm-Message-State: AGRZ1gKizeGPxjkzmX27lGEToJ6z1JhuPYH7l7wX4UlPQxLz/H9UVJGO
	MHZqcSf8aoTBVB4ks633hk8nRHmF
X-Received: by 2002:a63:b218:: with SMTP id x24mr4834664pge.223.1541029422093; 
	Wed, 31 Oct 2018 16:43:42 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	f68-v6sm67491096pfe.143.2018.10.31.16.43.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 16:43:40 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181026081653.24602-1-luc.michel@greensocs.com>
	<20181026081653.24602-3-luc.michel@greensocs.com>
From: Alistair <alistair23@gmail.com>
Message-ID: <0881ef95-2a1d-9956-655d-1706f7e9dd6c@gmail.com>
Date: Wed, 31 Oct 2018 16:43:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181026081653.24602-3-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 02/16] gdbstub: introduce GDB
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
X-TUID: ZH/U49/qC+f+

On 10/26/18 1:16 AM, Luc Michel wrote:
> Add a structure GDBProcess that represent processes from the GDB
> semantic point of view.
> 
> CPUs can be split into different processes, by grouping them under
> different cpu-cluster objects.  Each occurrence of a cpu-cluster object
> implies the existence of the corresponding process in the GDB stub. The
> GDB process ID is derived from the corresponding cluster ID as follows:
> 
>    GDB PID = cluster ID + 1
> 
> This is because PIDs -1 and 0 are reserved in GDB and cannot be used by
> processes.
> 
> When no such container are found, all the CPUs are put in a unique GDB
> process (create_unique_process()). This is also the case when compiled
> in user mode, where multi-processes do not make much sense for now.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>   gdbstub.c | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index c4e4f9f082..096ac8e99c 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -27,10 +27,11 @@
>   #include "monitor/monitor.h"
>   #include "chardev/char.h"
>   #include "chardev/char-fe.h"
>   #include "sysemu/sysemu.h"
>   #include "exec/gdbstub.h"
> +#include "hw/cpu/cluster.h"
>   #endif
>   
>   #define MAX_PACKET_LENGTH 4096
>   
>   #include "qemu/sockets.h"
> @@ -294,10 +295,15 @@ typedef struct GDBRegisterState {
>       gdb_reg_cb set_reg;
>       const char *xml;
>       struct GDBRegisterState *next;
>   } GDBRegisterState;
>   
> +typedef struct GDBProcess {
> +    uint32_t pid;
> +    bool attached;
> +} GDBProcess;
> +
>   enum RSState {
>       RS_INACTIVE,
>       RS_IDLE,
>       RS_GETLINE,
>       RS_GETLINE_ESC,
> @@ -322,10 +328,13 @@ typedef struct GDBState {
>       int running_state;
>   #else
>       CharBackend chr;
>       Chardev *mon_chr;
>   #endif
> +    bool multiprocess;
> +    GDBProcess *processes;
> +    int process_num;
>       char syscall_buf[256];
>       gdb_syscall_complete_cb current_syscall_cb;
>   } GDBState;
>   
>   /* By default use no IRQs and no timers while single stepping so as to
> @@ -1749,10 +1758,24 @@ void gdb_exit(CPUArchState *env, int code)
>   #ifndef CONFIG_USER_ONLY
>     qemu_chr_fe_deinit(&s->chr, true);
>   #endif
>   }
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
>   #ifdef CONFIG_USER_ONLY
>   int
>   gdb_handlesig(CPUState *cpu, int sig)
>   {
>       GDBState *s;
> @@ -1846,10 +1869,11 @@ static bool gdb_accept(void)
>       }
>   
>       s = g_malloc0(sizeof(GDBState));
>       s->c_cpu = first_cpu;
>       s->g_cpu = first_cpu;
> +    create_unique_process(s);
>       s->fd = fd;
>       gdb_has_xml = false;
>   
>       gdbserver_state = s;
>       return true;
> @@ -2002,10 +2026,57 @@ static const TypeInfo char_gdb_type_info = {
>       .name = TYPE_CHARDEV_GDB,
>       .parent = TYPE_CHARDEV,
>       .class_init = char_gdb_class_init,
>   };
>   
> +static int find_cpu_clusters(Object *child, void *opaque)
> +{
> +    if (object_dynamic_cast(child, TYPE_CPU_CLUSTER)) {
> +        GDBState *s = (GDBState *) opaque;
> +        CPUClusterState *cluster = CPU_CLUSTER(child);
> +
> +        s->processes = g_renew(GDBProcess, s->processes, ++s->process_num);
> +
> +        GDBProcess *process = &s->processes[s->process_num - 1];

Variables shouldn't be declared mid code.

Otherwise:

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +
> +        /* GDB process IDs -1 and 0 are reserved */
> +        process->pid = cluster->cluster_id + 1;
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
>   int gdbserver_start(const char *device)
>   {
>       trace_gdbstub_op_start(device);
>   
>       GDBState *s;
> @@ -2058,15 +2129,19 @@ int gdbserver_start(const char *device)
>                                      NULL, &error_abort);
>           monitor_init(mon_chr, 0);
>       } else {
>           qemu_chr_fe_deinit(&s->chr, true);
>           mon_chr = s->mon_chr;
> +        cleanup_processes(s);
>           memset(s, 0, sizeof(GDBState));
>           s->mon_chr = mon_chr;
>       }
>       s->c_cpu = first_cpu;
>       s->g_cpu = first_cpu;
> +
> +    create_processes(s);
> +
>       if (chr) {
>           qemu_chr_fe_init(&s->chr, chr, &error_abort);
>           qemu_chr_fe_set_handlers(&s->chr, gdb_chr_can_receive, gdb_chr_receive,
>                                    gdb_chr_event, NULL, NULL, NULL, true);
>       }
> 
