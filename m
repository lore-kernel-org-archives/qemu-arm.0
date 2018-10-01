Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4074067wrt;
        Mon, 1 Oct 2018 10:08:39 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60IQXP2LDlr9gaQqfMY06YmDB4LcbPUZidHZLBBw6NmNetspQkPzaaOlDt/Iy69Ff0DJYhD
X-Received: by 2002:a37:5ac2:: with SMTP id o185-v6mr9052483qkb.115.1538413719703;
        Mon, 01 Oct 2018 10:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538413719; cv=none;
        d=google.com; s=arc-20160816;
        b=NU9RI2ZJ1gagA4+xFjgYPG3Tm7RIomeUvc68FH29hfMdBpC7w60J3A/lzH2e1tWUh/
         PGW3onHZyzoxcLgo0yl6GgU7VQpjlCqL+yCEH1D1QMAtcEwwJWCb5dJwkviv55bjJwfP
         TLZIHH8yiJKcGJEhH7TWPpwIrOQTl3qwX4ruwvdDXL7aCeEDVaQQuq3psJzpvmaOprGQ
         fTwptUoRNQjYxYgCjlrEIYo4L2jaXnVtFJVKqT0PWSHZNFz4gTk/nIIewvMAZ9akvRyq
         REvfr6oF/eENSBLoFwJF5O90iiHPQFFYc6CO9HJ/zh8aWjSz8i62ENIfhdpQ0jBpIT+Y
         B3kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=DYLJDcqOciKHSIiQu9Gf7URGxmV/cF9qHDBacNGg++c=;
        b=Lp4XDLl973Rcn4h2ZNgwTTnqvbUmmw9rQsWDeEc60HmzGBE7pPxZ1+B2+TzSZ9t1Od
         LS7/zl8Yb5Kfaf6h/3V3dWGXfj2htswn+nvjJf2OGUTcsVCyY/9sqwX+bop/CnExB8lQ
         U/JWwdqBbmSzbmVsJrvMZstrCl3smqQc58I1cD+GziQkbCahG/v7z3ZYPNNdDeYJwHoe
         Wb9h06dZcxSq/LkMKpkfR+6tRnkLf9RA5+CM0MXWWrN7Wjwe5x/IJjIXCO7Kr7jSh1W2
         BSF9FS0hxEGcLiTBYUySpWyPbUg8VRcg7pGfHUpl2I7hugiWET2DC+hVDY/b99/yd/XB
         JgNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1-v6si515237qtd.127.2018.10.01.10.08.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 10:08:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g71gV-0007RY-5a
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 13:08:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g71fn-0007RM-LL
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 13:07:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g71fj-0006Ir-Mr
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 13:07:55 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40584)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g71fj-0006IS-G6
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 13:07:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id y8-v6so14823247wrh.7
	for <qemu-devel@nongnu.org>; Mon, 01 Oct 2018 10:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DYLJDcqOciKHSIiQu9Gf7URGxmV/cF9qHDBacNGg++c=;
	b=LBiCcvmVrNZaVEQ5lkPzVJB8xV/CoBcLGY0yNkNgPQI4FbESkN5/+bb7R9KvoBEAX2
	jP+YQ7ZeYbks+V8DCmESl8edd7U7d+c89YmMmtCmJ3FtcuBrwOLnju0XMF4HIuxe7vMv
	CjYVR8bjLeLfGo3KqxpaAlnnAcB7Ai/qDV5OcB+96cngK8UVVqxBQPSKTxRSj4dbGB4D
	rqZljco3wGQu9l6s8nbtDBMA4F670jtnyunBJ6mibYLhkS5C3M4Tf0xoIvpnf4X41UZB
	9vQeAs1YRFd4nBNhQS5AppdfNu2YFphRrf2ueI0hkHMxwScN2iYeSeKV5G13HfPL7Jit
	VMsA==
X-Gm-Message-State: ABuFfog2tHLw9t+Vb8ANQfmKMkEKB29HFRDdpLoscz2KWpQhnX72o87+
	E7rtg6x7H1hE/oWci8LAN3xnrQ==
X-Received: by 2002:a5d:5501:: with SMTP id
	b1-v6mr7518527wrv.228.1538413670412; 
	Mon, 01 Oct 2018 10:07:50 -0700 (PDT)
Received: from [192.168.2.71] ([80.31.72.241])
	by smtp.gmail.com with ESMTPSA id
	184-v6sm20994391wmv.6.2018.10.01.10.07.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Oct 2018 10:07:49 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-4-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d46c39b0-6d56-6a4c-b56f-78447244a1f0@redhat.com>
Date: Mon, 1 Oct 2018 19:07:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181001115704.701-4-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH v2 03/15] gdbstub: add multiprocess support
 to 'H' and 'T' packets
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vaseggBRtM+Y

On 01/10/2018 13:56, Luc Michel wrote:
> Add a couple of helper functions to cope with GDB threads and processes.
> 
> The gdb_get_process() function looks for a process given a pid.
> 
> The gdb_get_cpu() function returns the CPU corresponding to the (pid,
> tid) pair given as parameters.
> 
> The read_thread_id() function parses the thread-id sent by the peer.
> This function supports the multiprocess extension thread-id syntax.  The
> return value specifies if the parsing failed, or if a special case was
> encountered (all processes or all threads).
> 
> Use them in 'H' and 'T' packets handling to support the multiprocess
> extension.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  gdbstub.c | 149 +++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 131 insertions(+), 18 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index ac9d540fda..a21ce3ca18 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -667,10 +667,74 @@ static uint32_t gdb_get_cpu_pid(const GDBState *s, CPUState *cpu)
>      }
>  
>      return pid + 1;
>  }
>  
> +static GDBProcess *gdb_get_process(const GDBState *s, uint32_t pid)
> +{
> +    uint32_t process_idx;
> +
> +    if (!pid) {
> +        /* 0 means any process, we take the first one */
> +        pid = 1;
> +    }
> +
> +    /* GDB PIDs are in the range [1;n] */
> +    process_idx = pid - 1;
> +
> +    if (process_idx >= s->process_num) {
> +        return NULL;
> +    }
> +
> +    return &s->processes[process_idx];
> +}
> +
> +static GDBProcess *gdb_get_cpu_process(const GDBState *s, CPUState *cpu)
> +{
> +    return gdb_get_process(s, gdb_get_cpu_pid(s, cpu));
> +}
> +
> +static CPUState *find_cpu(uint32_t thread_id)
> +{
> +    CPUState *cpu;
> +
> +    CPU_FOREACH(cpu) {
> +        if (cpu_gdb_index(cpu) == thread_id) {
> +            return cpu;
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
> +static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_t tid)
> +{
> +    GDBProcess *process;
> +    CPUState *cpu = find_cpu(tid);
> +
> +    if (!tid) {
> +        /* 0 means any thread, we take the first one */
> +        tid = 1;
> +    }
> +
> +    if (cpu == NULL) {
> +        return NULL;
> +    }
> +
> +    process = gdb_get_cpu_process(s, cpu);
> +
> +    if (process->pid != pid) {
> +        return NULL;
> +    }
> +
> +    if (!process->attached) {
> +        return NULL;
> +    }
> +
> +    return cpu;
> +}
> +
>  static const char *get_feature_xml(const char *p, const char **newp,
>                                     CPUClass *cc)
>  {
>      size_t len;
>      int i;
> @@ -923,23 +987,10 @@ static void gdb_set_cpu_pc(GDBState *s, target_ulong pc)
>  
>      cpu_synchronize_state(cpu);
>      cpu_set_pc(cpu, pc);
>  }
>  
> -static CPUState *find_cpu(uint32_t thread_id)
> -{
> -    CPUState *cpu;
> -
> -    CPU_FOREACH(cpu) {
> -        if (cpu_gdb_index(cpu) == thread_id) {
> -            return cpu;
> -        }
> -    }
> -
> -    return NULL;
> -}
> -
>  static char *gdb_fmt_thread_id(const GDBState *s, CPUState *cpu,
>                             char *buf, size_t buf_size)
>  {
>      if (s->multiprocess) {
>          snprintf(buf, buf_size, "p%02x.%02x",
> @@ -949,10 +1000,64 @@ static char *gdb_fmt_thread_id(const GDBState *s, CPUState *cpu,
>      }
>  
>      return buf;
>  }
>  
> +typedef enum GDBThreadIdKind {
> +    GDB_ONE_THREAD = 0,
> +    GDB_ALL_THREADS,     /* One process, all threads */
> +    GDB_ALL_PROCESSES,
> +    GDB_READ_THREAD_ERR
> +} GDBThreadIdKind;
> +
> +static GDBThreadIdKind read_thread_id(const char *buf, const char **end_buf,
> +                                      uint32_t *pid, uint32_t *tid)
> +{
> +    unsigned long p, t;
> +    int ret;
> +
> +    if (*buf == 'p') {
> +        buf++;
> +        ret = qemu_strtoul(buf, &buf, 16, &p);
> +
> +        if (ret) {
> +            return GDB_READ_THREAD_ERR;
> +        }
> +
> +        /* Skip '.' */
> +        buf++;
> +    } else {
> +        p = 1;
> +    }
> +
> +    ret = qemu_strtoul(buf, &buf, 16, &t);
> +
> +    if (ret) {
> +        return GDB_READ_THREAD_ERR;
> +    }
> +
> +    *end_buf = buf;
> +
> +    if (p == -1) {
> +        return GDB_ALL_PROCESSES;
> +    }
> +
> +    if (pid) {
> +        *pid = p;
> +    }
> +
> +    if (t == -1) {
> +        return GDB_ALL_THREADS;
> +    }
> +
> +    if (tid) {
> +        *tid = t;
> +    }
> +
> +    return GDB_ONE_THREAD;
> +}
> +
>  static int is_query_packet(const char *p, const char *query, char separator)
>  {
>      unsigned int query_len = strlen(query);
>  
>      return strncmp(p, query, query_len) == 0 &&
> @@ -1057,16 +1162,18 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>  {
>      CPUState *cpu;
>      CPUClass *cc;
>      const char *p;
>      uint32_t thread;
> +    uint32_t pid, tid;
>      int ch, reg_size, type, res;
>      uint8_t mem_buf[MAX_PACKET_LENGTH];
>      char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
>      char thread_id[16];
>      uint8_t *registers;
>      target_ulong addr, len;
> +    GDBThreadIdKind thread_kind;
>  
>      trace_gdbstub_io_command(line_buf);
>  
>      p = line_buf;
>      ch = *p++;
> @@ -1270,16 +1377,22 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>          else
>              put_packet(s, "E22");
>          break;
>      case 'H':
>          type = *p++;
> -        thread = strtoull(p, (char **)&p, 16);
> -        if (thread == -1 || thread == 0) {
> +
> +        thread_kind = read_thread_id(p, &p, &pid, &tid);
> +        if (thread_kind == GDB_READ_THREAD_ERR) {
> +            put_packet(s, "E22");
> +            break;
> +        }
> +
> +        if (thread_kind != GDB_ONE_THREAD) {
>              put_packet(s, "OK");
>              break;
>          }
> -        cpu = find_cpu(thread);
> +        cpu = gdb_get_cpu(s, pid, tid);
>          if (cpu == NULL) {
>              put_packet(s, "E22");
>              break;
>          }
>          switch (type) {
> @@ -1295,12 +1408,12 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>               put_packet(s, "E22");
>               break;
>          }
>          break;
>      case 'T':
> -        thread = strtoull(p, (char **)&p, 16);
> -        cpu = find_cpu(thread);
> +        read_thread_id(p, &p, &pid, &tid);

This part can now be safer too:

           thread_kind = read_thread_id(p, &p, &pid, &tid);
           if (thread_kind == GDB_READ_THREAD_ERR) {
               put_packet(s, "E22");
               break;
           }

With this change:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +        cpu = gdb_get_cpu(s, pid, tid);
>  
>          if (cpu != NULL) {
>              put_packet(s, "OK");
>          } else {
>              put_packet(s, "E22");
> 
