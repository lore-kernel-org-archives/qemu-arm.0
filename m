Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4065503wrt;
        Mon, 1 Oct 2018 10:01:18 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62aQxj2YE8e1CEWMU/1CujGmuyNlAs0seb2NaWLhdXVMmRMdccSQpgXYWdYRmX/hTTFGwSK
X-Received: by 2002:a0c:b178:: with SMTP id r53-v6mr4783647qvc.3.1538413277973;
        Mon, 01 Oct 2018 10:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538413277; cv=none;
        d=google.com; s=arc-20160816;
        b=W4jLR7Ky0m+u3n7W74AVm8y53WBra0yn6uoolz1aB/IxHXohTgGtdt+by0qKj+1F9i
         n+w8Nftb/3YdklRmtb7andwtDlDqEbXdI4V4Q0RcDrLtBdGl2ecmrTR/TzyNITeOehOS
         qgujqtt77ZLURl3uECO0HONnOS6aAGUARXnd1xxuvj6IYZKdVmb7g34GdKjEoSa+VsLI
         bY76yBR7zxeQ6XR68oLDlZoQiJZY8+dzghv9fnSCnjBKTpEFdhohiaBzxQzkvPNepbbB
         tj8WXxeg55XCxSTCFbR5aXehVrAHWai3ev/vOX8V+jjHMSGfHN+arOYK7DQK0aT3kYja
         RenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=2uvUf0yGUIUC3QyktPZmaggZZeEHBtK+moEtK83CqSc=;
        b=woD/Aj8okPXUjROdcvO31A1PfepthOgbGL1/ChdxTSXN3wnTEKGVjWf+BEWHl9A223
         MDQrcXUUOpYULUQ/XxMfTj3jK10E9lB1vLQelSRimI2vBo93WWXoVNI9gxKgVxCaFqMF
         pv41nXmMrCE4fkes5AW4zUe/m6CXfXMWq+wEwNme4mOW3IWFMVFADTzPOj8ViIiezwX8
         IKfJn62lqcoXKnD4Ssa9h4F3BRNzc3pFG+i5jTuyiIihZ9F7r0GjwktmUZjpAWgG+ciE
         XuJsJtMyeIdZD4NDjwE4eSN1GQGGeazSov5EDxDx0JNYo7Oedo8f3uXJNavU084zuUf4
         oO4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z18-v6si1840148qka.151.2018.10.01.10.01.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 10:01:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g71ZN-00076l-H4
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 13:01:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g71Yb-0006yV-2V
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 13:00:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g71YN-0006CR-5H
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 13:00:23 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44698)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g71YM-0006Bx-GR
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 13:00:14 -0400
Received: by mail-wr1-f67.google.com with SMTP id 63-v6so7522955wra.11
	for <qemu-devel@nongnu.org>; Mon, 01 Oct 2018 10:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2uvUf0yGUIUC3QyktPZmaggZZeEHBtK+moEtK83CqSc=;
	b=Tw+S4HzT0oinKOxqpbPv1iKkRDeQUjII1YhTusF/1gFqrDB+Wd/VRKggesfZUo1KDm
	DRpSBXyoRWYAhvT646UtPnc07nHFm/EYsF/l+JisIp3bxtPSkqPD5ihP5nxC0XkUHqws
	8JTWZA17+DdkLqw4WcYV3q0jDZNVzBFk6Yxpy+8uwSuLRHEq6S7FK7Whz0CwFjg3HhiK
	Jy+qgiFoFrOsZctz7wLLgHgJbPXw/YSkLtVH73dT/5/veL2tzdVaX1Yx/iNrMeV4z42D
	8gbrfpPf3ufQQyketkKPmhj+emWs0wwGW7HWbQeEnjm/vbve9IMC9LLwH5hvMpb9cJ82
	1B9Q==
X-Gm-Message-State: ABuFfoiUYpr79ZnFIJA67HVszGxGcsGF4HhAzPdmJ9S0vfgYmK51apkP
	O5utG2hGxs8DJomhh9OjqYTLog==
X-Received: by 2002:adf:e0c9:: with SMTP id
	e9-v6mr8065830wri.199.1538413212483; 
	Mon, 01 Oct 2018 10:00:12 -0700 (PDT)
Received: from [192.168.2.71] ([80.31.72.241])
	by smtp.gmail.com with ESMTPSA id
	p9-v6sm17514743wrt.10.2018.10.01.10.00.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Oct 2018 10:00:11 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-5-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8da43fa4-0e8e-4e40-232c-6fd45b07a790@redhat.com>
Date: Mon, 1 Oct 2018 19:00:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181001115704.701-5-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PATCH v2 04/15] gdbstub: add multiprocess support
 to vCont packets
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
X-TUID: eqH8W+ym2sJB

On 01/10/2018 13:56, Luc Michel wrote:
> Add the gdb_first_cpu() and gdb_next_cpu() to iterate over all
> the CPUs in currently attached processes.
> 
> Add the gdb_first_cpu_in_process() and gdb_next_cpu_in_process() to
> iterate over CPUs of a given process.
> 
> Use them to add multiprocess extension support to vCont packets.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  gdbstub.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 102 insertions(+), 15 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index a21ce3ca18..779cc8b241 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -704,10 +704,40 @@ static CPUState *find_cpu(uint32_t thread_id)
>      }
>  
>      return NULL;
>  }
>  
> +static CPUState *get_first_cpu_in_process(const GDBState *s,
> +                                          GDBProcess *process)
> +{
> +    CPUState *cpu;
> +
> +    CPU_FOREACH(cpu) {
> +        if (gdb_get_cpu_pid(s, cpu) == process->pid) {
> +            return cpu;
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
> +static CPUState *gdb_next_cpu_in_process(const GDBState *s, CPUState *cpu)
> +{
> +    uint32_t pid = gdb_get_cpu_pid(s, cpu);
> +    cpu = CPU_NEXT(cpu);
> +
> +    while (cpu) {
> +        if (gdb_get_cpu_pid(s, cpu) == pid) {
> +            break;
> +        }
> +
> +        cpu = CPU_NEXT(cpu);
> +    }
> +
> +    return cpu;
> +}
> +
>  static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_t tid)
>  {
>      GDBProcess *process;
>      CPUState *cpu = find_cpu(tid);
>  
> @@ -731,10 +761,41 @@ static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_t tid)
>      }
>  
>      return cpu;
>  }
>  
> +/* Return the cpu following @cpu, while ignoring
> + * unattached processes.
> + */
> +static CPUState *gdb_next_cpu(const GDBState *s, CPUState *cpu)
> +{
> +    cpu = CPU_NEXT(cpu);
> +
> +    while (cpu) {
> +        if (gdb_get_cpu_process(s, cpu)->attached) {
> +            break;
> +        }
> +
> +        cpu = CPU_NEXT(cpu);
> +    }
> +
> +    return cpu;
> +}
> +
> +/* Return the first attached cpu */
> +static CPUState *gdb_first_cpu(const GDBState *s)
> +{
> +    CPUState *cpu = first_cpu;
> +    GDBProcess *process = gdb_get_cpu_process(s, cpu);
> +
> +    if (!process->attached) {
> +        return gdb_next_cpu(s, cpu);
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
> @@ -1069,14 +1130,16 @@ static int is_query_packet(const char *p, const char *query, char separator)
>   * returns -ENOTSUP if a command is unsupported, -EINVAL or -ERANGE if there is
>   *         a format error, 0 on success.
>   */
>  static int gdb_handle_vcont(GDBState *s, const char *p)
>  {
> -    int res, idx, signal = 0;
> +    int res, signal = 0;
>      char cur_action;
>      char *newstates;
>      unsigned long tmp;
> +    uint32_t pid, tid;
> +    GDBProcess *process;
>      CPUState *cpu;
>  #ifdef CONFIG_USER_ONLY
>      int max_cpus = 1; /* global variable max_cpus exists only in system mode */
>  
>      CPU_FOREACH(cpu) {
> @@ -1115,29 +1178,52 @@ static int gdb_handle_vcont(GDBState *s, const char *p)
>          } else if (cur_action != 'c' && cur_action != 's') {
>              /* unknown/invalid/unsupported command */
>              res = -ENOTSUP;
>              goto out;
>          }
> -        /* thread specification. special values: (none), -1 = all; 0 = any */
> -        if ((p[0] == ':' && p[1] == '-' && p[2] == '1') || (p[0] != ':')) {
> -            if (*p == ':') {
> -                p += 3;
> -            }
> -            for (idx = 0; idx < max_cpus; idx++) {
> -                if (newstates[idx] == 1) {
> -                    newstates[idx] = cur_action;
> +
> +        if (*p++ != ':') {
> +            res = -ENOTSUP;
> +            goto out;
> +        }
> +
> +        switch (read_thread_id(p, &p, &pid, &tid)) {
> +        case GDB_READ_THREAD_ERR:
> +            res = -EINVAL;
> +            goto out;
> +
> +        case GDB_ALL_PROCESSES:
> +            cpu = gdb_first_cpu(s);
> +            while (cpu) {
> +                if (newstates[cpu->cpu_index] == 1) {
> +                    newstates[cpu->cpu_index] = cur_action;
>                  }
> +
> +                cpu = gdb_next_cpu(s, cpu);
>              }
> -        } else if (*p == ':') {
> -            p++;
> -            res = qemu_strtoul(p, &p, 16, &tmp);
> -            if (res) {
> +            break;
> +
> +        case GDB_ALL_THREADS:
> +            process = gdb_get_process(s, pid);
> +
> +            if (!process->attached) {
> +                res = -EINVAL;
>                  goto out;
>              }
>  
> -            /* 0 means any thread, so we pick the first valid CPU */
> -            cpu = tmp ? find_cpu(tmp) : first_cpu;
> +            cpu = get_first_cpu_in_process(s, process);
> +            while (cpu) {
> +                if (newstates[cpu->cpu_index] == 1) {
> +                    newstates[cpu->cpu_index] = cur_action;
> +                }
> +
> +                cpu = gdb_next_cpu_in_process(s, cpu);
> +            }
> +            break;
> +
> +        case GDB_ONE_THREAD:
> +            cpu = gdb_get_cpu(s, pid, tid);
>  
>              /* invalid CPU/thread specified */
>              if (!cpu) {
>                  res = -EINVAL;
>                  goto out;
> @@ -1145,10 +1231,11 @@ static int gdb_handle_vcont(GDBState *s, const char *p)
>  
>              /* only use if no previous match occourred */
>              if (newstates[cpu->cpu_index] == 1) {
>                  newstates[cpu->cpu_index] = cur_action;
>              }
> +            break;
>          }
>      }
>      s->signal = signal;
>      gdb_continue_partial(s, newstates);
>  
> 

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
