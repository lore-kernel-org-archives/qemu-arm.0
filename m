Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp904288wrw;
        Fri, 16 Nov 2018 14:00:50 -0800 (PST)
X-Google-Smtp-Source: AJdET5cG11GPnCUwC4usek+H1ZKR3sV0qVq+qGnXxLRMpcmmiWKRGUgWKV4VqVLiFQx7dl4FVK0a
X-Received: by 2002:ac8:788:: with SMTP id l8mr11911932qth.384.1542405650032;
        Fri, 16 Nov 2018 14:00:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542405650; cv=none;
        d=google.com; s=arc-20160816;
        b=Y0gSe875qrUGPIzEFKLW+DahzArLAYg+O2mMBoqlsPF8Ern3GTIw0GBKRo7bFBje1W
         ihwbi2i3j0w7KcAtcPNL8qTIHGYo7kfJ2wUWjz/c1r0eo5/KkeG1KVewClBn5Qj9ytbR
         5f5feFLfk7MSp7MlqFP1685qc06nT80MPDDMGCHlnH6tU2rglgYLQXVKrdjRw3ciOyng
         scaFinJ4v1xZMkEdnszDjVt1cNv85NWblNjjxUcVgm4qwj78wvwH7f8Lw6iMnzKNFu8T
         9qVG0o9y/PGHvjrm/47rFQ2hcGt14tEwBfkPGKIRnK8Hu888oAtyir5qhbIQPwi+PZL0
         pI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=LN3NIBF8Ap220Pi74P82gt+s2b+inP+HUePWQ2W/+xg=;
        b=BwIYVkEXQqTcpB/gWWB4b6cLHlIXa60boX0ZrioYo9vZnCUpkwiJrfjcShBm1KH1hd
         Zi/Gzcj1hbwD7o+feQF4EvshEMrD1nCDb3tuBkV5QobZRbPTQ6FYh6iUDG8+1AGmTkxh
         lWhQ3483b3vCKTXtR7xoPNBAXSOSIxmSDBuA2L2FXa85W6ktP7q7Aw8R0BV5z9ctTiyp
         zlB2k+0BBzPYzrBC2dkVsix/wRcIb61gEcOI9PSEWWC6XZlNleLS8ZHLziAJdsoWNOlN
         g5+pExG2SUTVtu+BwxZUu7RgDEgXVKzqk45ezJsnkDRO56tPCvUKtFgTLdfV8h9G3M/v
         ssUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ukxRrNpA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m13si5018067qvk.140.2018.11.16.14.00.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 14:00:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ukxRrNpA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNmAS-0005QR-V3
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 17:00:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gNmAJ-0005QM-CI
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 17:00:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gNmA3-0007MO-Og
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 17:00:28 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43255)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gNmA0-0006jE-H8; Fri, 16 Nov 2018 17:00:21 -0500
Received: by mail-pf1-x444.google.com with SMTP id w73so2679403pfk.10;
	Fri, 16 Nov 2018 14:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=LN3NIBF8Ap220Pi74P82gt+s2b+inP+HUePWQ2W/+xg=;
	b=ukxRrNpAMfmjbSrDT9kSNcXIESw/GR1KAQs7ZHsmIJ2f3vRjWxGX1k4Ag2PRfMersa
	a2n7GnTZrqfteTqpN0veVonid128q+Y3/MPbrq5IPl3ue53b2zQzLACucUefZN8+zMXY
	S8CLehnDOLUxmKoNUKPYsS4KDNzWsRrFwQDuzLo4bu0+t3XtuJWWslTLSI4NNUhBHla2
	XyqVqOEZ3jR0iBXF8We6cVQiCbDE0nr6HV3/ZvUncEZKXjfOefVv/ox7jJzbk0mBVEd/
	ZhM63/ENxMA0ARqqDNVnF2Wl0in3rx9AfMvxCEu0ieCyBnbLx5ZXzVqSsp0aJfg8ZaKu
	AI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LN3NIBF8Ap220Pi74P82gt+s2b+inP+HUePWQ2W/+xg=;
	b=Eqh3lpOEMvtmid4JkTPIqaTwaXfJGBuFM6RH/Vg3T4xKtOvte9dcE39AbRN0fbUJgs
	SBnE/Z3PAMIlMRGVw4wDALMSZnU8m2GYcw2VMF1LVXrPJQgrk8PE++mbczxWLxwjgqZJ
	ZJ0EQ9adDeteTyABNI1170itr6sSPB2O+IijMdxM+Uvlq7+ExZJeaV/OcpcS34a8MF3Q
	p0QeF+ky0EJhK0Tabam+0Y90Jj6SAQmTH+dn3US7RovDPUO1tDgo/NKtsMaDVwdIaGCB
	yHEhiJxNKers9IN8alTPRM0EJj94BxYKTMCUIjKq2RvidCg8kPqPQYBdYMoNm2BMiRMZ
	8Ieg==
X-Gm-Message-State: AGRZ1gL6OPlod5bJ2GZHImhrqabT5SKaiYks8gImtloZF26zFOs0etSt
	ktm6IFsdipSFFccIQ8T8Gdf+QSys
X-Received: by 2002:a63:8043:: with SMTP id j64mr11747894pgd.405.1542405607943;
	Fri, 16 Nov 2018 14:00:07 -0800 (PST)
Received: from [10.86.55.164] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	n73sm4846313pfj.148.2018.11.16.14.00.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 14:00:07 -0800 (PST)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-11-luc.michel@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Message-ID: <c9e2e058-a91d-1b60-17e8-9b49ead54b7c@gmail.com>
Date: Fri, 16 Nov 2018 14:00:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181115094207.22846-11-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 10/16] gdbstub: add
 multiprocess support to 'D' packets
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
X-TUID: QCnRe8L7gaFH

On 15/11/2018 1:42 am, Luc Michel wrote:
> 'D' packets are used by GDB to detach from a process. In multiprocess
> mode, the PID to detach from is sent in the request.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   gdbstub.c | 60 ++++++++++++++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 53 insertions(+), 7 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 5df9929f92..eec1cf0d09 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1039,24 +1039,39 @@ static int gdb_breakpoint_remove(target_ulong addr, target_ulong len, int type)
>       default:
>           return -ENOSYS;
>       }
>   }
>   
> +static inline void gdb_cpu_breakpoint_remove_all(CPUState *cpu)
> +{
> +    cpu_breakpoint_remove_all(cpu, BP_GDB);
> +#ifndef CONFIG_USER_ONLY
> +    cpu_watchpoint_remove_all(cpu, BP_GDB);
> +#endif
> +}
> +
> +static void gdb_process_breakpoint_remove_all(const GDBState *s, GDBProcess *p)
> +{
> +    CPUState *cpu = get_first_cpu_in_process(s, p);
> +
> +    while (cpu) {
> +        gdb_cpu_breakpoint_remove_all(cpu);
> +        cpu = gdb_next_cpu_in_process(s, cpu);
> +    }
> +}
> +
>   static void gdb_breakpoint_remove_all(void)
>   {
>       CPUState *cpu;
>   
>       if (kvm_enabled()) {
>           kvm_remove_all_breakpoints(gdbserver_state->c_cpu);
>           return;
>       }
>   
>       CPU_FOREACH(cpu) {
> -        cpu_breakpoint_remove_all(cpu, BP_GDB);
> -#ifndef CONFIG_USER_ONLY
> -        cpu_watchpoint_remove_all(cpu, BP_GDB);
> -#endif
> +        gdb_cpu_breakpoint_remove_all(cpu);
>       }
>   }
>   
>   static void gdb_set_cpu_pc(GDBState *s, target_ulong pc)
>   {
> @@ -1331,13 +1346,44 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>           /* Kill the target */
>           error_report("QEMU: Terminated via GDBstub");
>           exit(0);
>       case 'D':
>           /* Detach packet */
> -        gdb_breakpoint_remove_all();
> -        gdb_syscall_mode = GDB_SYS_DISABLED;
> -        gdb_continue(s);
> +        pid = 1;
> +
> +        if (s->multiprocess) {
> +            unsigned long lpid;
> +            if (*p != ';') {
> +                put_packet(s, "E22");
> +                break;
> +            }
> +
> +            if (qemu_strtoul(p + 1, &p, 16, &lpid)) {
> +                put_packet(s, "E22");
> +                break;
> +            }
> +
> +            pid = lpid;
> +        }
> +
> +        process = gdb_get_process(s, pid);
> +        gdb_process_breakpoint_remove_all(s, process);
> +        process->attached = false;
> +
> +        if (pid == gdb_get_cpu_pid(s, s->c_cpu)) {
> +            s->c_cpu = gdb_first_cpu(s);
> +        }
> +
> +        if (pid == gdb_get_cpu_pid(s, s->g_cpu)) {
> +            s->g_cpu = gdb_first_cpu(s);
> +        }
> +
> +        if (s->c_cpu == NULL) {
> +            /* No more process attached */
> +            gdb_syscall_mode = GDB_SYS_DISABLED;
> +            gdb_continue(s);
> +        }
>           put_packet(s, "OK");
>           break;
>       case 's':
>           if (*p != '\0') {
>               addr = strtoull(p, (char **)&p, 16);
> 

