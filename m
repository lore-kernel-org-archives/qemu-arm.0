Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp898072wrw;
        Fri, 16 Nov 2018 13:51:55 -0800 (PST)
X-Google-Smtp-Source: AJdET5fuON+lkJEifSydFSi3VaoLHbFBEckh4VEM2jEQB5JTojwzCLwE/yI4SaknL4bwm4dPfwvF
X-Received: by 2002:a37:a1c1:: with SMTP id k184mr11430552qke.166.1542405115370;
        Fri, 16 Nov 2018 13:51:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542405115; cv=none;
        d=google.com; s=arc-20160816;
        b=sW+OMXAb9fUfDX/YdmB73lA9+wwnS0IXfqt0IQWt5N1NwfZmeqC/VhfCnqm+dv+bA3
         vKh5H22dQRoa6K7wVycZjoKyFMtc3LWLx4Hnm5fC4K4KJ2rJvW1DoSmp9E9wzERSvNvc
         H0Na0k5fVQ6v/2G7lV/bpx7vRAKagBmXE+1+/5hXVa62nZJ7Vbza3QRpv753vLW6xB0U
         PsXbMoJqq2ZBQLMOrTYrbMmhS65Pegzq91+TmTeijW2iSc4S5xitgcKQKVzMN7q3KxFb
         1l3gzkuuXK1rJHSLjnZqTaSl9ccgxxWO4yEMEP21CSqPPFqZqmXP3uPi7D92oVThu3OV
         PYhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=6hqChB71/7kZpjaBL9j572kKjjMxQ+3+zx1a7oasSdc=;
        b=ibiqN+quCVOy5kEjfBj0NpoGq4TPxA2+w3kBpc3aIMe2nqkDenJQ1T8tp9/I8iqbpr
         vrGkIfuJ47ZdS7urB2dGdKW4y+zrBVOkw+gh11RShu/Y9gyTnZZ+nAma3vQdp+VvymlO
         uVRuk9/uxh5VqjzvoNBKBjb8g6ii8Zs7fm1kgDGVh935CKg6J8xdw7bApbpkkDX9xpyU
         r6JaHGS9s1XPjUwnCRAzplHQ7F6U7gRV53of1obBzCYo2jjVArBBvab7Y1jWskZKMfU4
         2USUtQhv/JXXqabUNvxAdJWDQ8fWiHGYSP0uPgYsfMtWyThFvi45hl7RT9fEXrWwdFM9
         SbOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JNbjxe63;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y31si4839661qvf.184.2018.11.16.13.51.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 13:51:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JNbjxe63;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47133 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNm1q-0001GD-Mc
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 16:51:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gNm1g-0001FK-Bz
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 16:51:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gNm1c-0001MF-GP
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 16:51:44 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:40507)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gNm1Z-0001I5-Bc; Fri, 16 Nov 2018 16:51:38 -0500
Received: by mail-pl1-x643.google.com with SMTP id b22-v6so6292702pls.7;
	Fri, 16 Nov 2018 13:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6hqChB71/7kZpjaBL9j572kKjjMxQ+3+zx1a7oasSdc=;
	b=JNbjxe636q8Tq7Ww/GpeOPLsuCpwnoG2EnnCGThDk2Y8ADPgdnPaeDgaITZPXhHSpg
	gCi6XqCMSTSerZXxJ/mr4U3WGDyBJamk146RC2LcKN1+vHVvQvriELuMcmdOkdMc//1f
	1jNPr3zbtxGJV3kZlzhM6sTYTpVXKBdFlcUXakj4R6jUoRH2ZCLGc8/JsyxN2tOuX0f6
	7jbmPt9B+BCVX0AU5NsLPN5kkCdrMxKiavL3PQZUxsIppYhzjOu9lDWqlU4BWVkXKR9H
	cxsTiFCjOMFuukQHOpWXWUDW/euzX2pecYMBNf0v/jZvitGBZbu+eIEMRCykvHG/5DxH
	y9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6hqChB71/7kZpjaBL9j572kKjjMxQ+3+zx1a7oasSdc=;
	b=K0NLNzRVzGkHGcQZkfMqjdQ1fRxVuGSunfT7rchAL9AYcBYyeZShEJZ4NdfF9e4bOE
	LbpEqgb2KhhprVlT8I45RrpJ9AymBgkQocNNbpWP3WwVPg5cK2v9Wid1XBEf+RKonUST
	D+RMvdBcYnBsNDnX4+nYrWk3REkWL4dz6nwzMO7ZzgklhRggc0JABZVtlbeYAEH3XAjm
	NLjDUduOw9sPljBz7sZyl2R7zwh8bRLf7Y1/suNRmY5R/iFY4vM8qS3CCbHLtMqYlSqP
	chTf8bibBt7f6EFt7KRo9OVAsRyY2cTSPGpP9Xs25nxLX/ovfjHzpdo1TW7Znnd+OCDN
	rL9Q==
X-Gm-Message-State: AGRZ1gKhEkBL5+7tvjs39GhGGRfgrOk/lq1XgHTXJcYn3IRfigTQQl75
	jehd0UX1xKbN6C9A2hpPeNYUlhN6
X-Received: by 2002:a17:902:930b:: with SMTP id
	bc11mr8783999plb.17.1542405094618; 
	Fri, 16 Nov 2018 13:51:34 -0800 (PST)
Received: from [10.86.55.164] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	n23-v6sm54308022pfg.84.2018.11.16.13.51.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 13:51:33 -0800 (PST)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-6-luc.michel@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Message-ID: <c649426c-4c57-749a-0877-fd29eabf11c2@gmail.com>
Date: Fri, 16 Nov 2018 13:51:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181115094207.22846-6-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 05/16] gdbstub: add
 multiprocess support to vCont packets
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
X-TUID: jRQ26tf3AhPE

On 15/11/2018 1:41 am, Luc Michel wrote:
> Add the gdb_first_cpu() and gdb_next_cpu() to iterate over all
> the CPUs in currently attached processes.
> 
> Add the gdb_first_cpu_in_process() and gdb_next_cpu_in_process() to
> iterate over CPUs of a given process.
> 
> Use them to add multiprocess extension support to vCont packets.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   gdbstub.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 102 insertions(+), 15 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index fa2b7077b2..f1ec3481cb 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -716,10 +716,40 @@ static CPUState *find_cpu(uint32_t thread_id)
>       }
>   
>       return NULL;
>   }
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
>   static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_t tid)
>   {
>       GDBProcess *process;
>       CPUState *cpu = find_cpu(tid);
>   
> @@ -743,10 +773,41 @@ static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_t tid)
>       }
>   
>       return cpu;
>   }
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
>   static const char *get_feature_xml(const char *p, const char **newp,
>                                      CPUClass *cc)
>   {
>       size_t len;
>       int i;
> @@ -1081,14 +1142,16 @@ static int is_query_packet(const char *p, const char *query, char separator)
>    * returns -ENOTSUP if a command is unsupported, -EINVAL or -ERANGE if there is
>    *         a format error, 0 on success.
>    */
>   static int gdb_handle_vcont(GDBState *s, const char *p)
>   {
> -    int res, idx, signal = 0;
> +    int res, signal = 0;
>       char cur_action;
>       char *newstates;
>       unsigned long tmp;
> +    uint32_t pid, tid;
> +    GDBProcess *process;
>       CPUState *cpu;
>   #ifdef CONFIG_USER_ONLY
>       int max_cpus = 1; /* global variable max_cpus exists only in system mode */
>   
>       CPU_FOREACH(cpu) {
> @@ -1127,29 +1190,52 @@ static int gdb_handle_vcont(GDBState *s, const char *p)
>           } else if (cur_action != 'c' && cur_action != 's') {
>               /* unknown/invalid/unsupported command */
>               res = -ENOTSUP;
>               goto out;
>           }
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
>                   }
> +
> +                cpu = gdb_next_cpu(s, cpu);
>               }
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
>                   goto out;
>               }
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
>               /* invalid CPU/thread specified */
>               if (!cpu) {
>                   res = -EINVAL;
>                   goto out;
> @@ -1157,10 +1243,11 @@ static int gdb_handle_vcont(GDBState *s, const char *p)
>   
>               /* only use if no previous match occourred */
>               if (newstates[cpu->cpu_index] == 1) {
>                   newstates[cpu->cpu_index] = cur_action;
>               }
> +            break;
>           }
>       }
>       s->signal = signal;
>       gdb_continue_partial(s, newstates);
>   
> 

