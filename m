Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2313350wrd;
        Fri, 7 Sep 2018 16:31:43 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ5hoHUwTmT2sibYrrMHrAhXKV2j2hlMPhPoenMXOx5F07Gyoc0rccNO4mcGhfwaVXeYzs6
X-Received: by 2002:a37:b12:: with SMTP id 18-v6mr5735452qkl.167.1536363103443;
        Fri, 07 Sep 2018 16:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536363103; cv=none;
        d=google.com; s=arc-20160816;
        b=xM8Fv4kvXCeNSarL3oFUm6GesS9kiqwTmy+fXqjRbctmZ/3DHNjHbD+Eou8pUT9xXD
         5chZm8MGY+WoJhRUoKzdwxbeF9z3fxokdYsGhWAAEfUW9czzvddeXaCHkheqrODRhx5y
         ufE6OPpfl/AR5WaJftCM/VABx3rTiLGyEmZk8BEn/LVScTEqOgAVyJ9A3aOpbWzHFvNa
         xH7noQ5Doe/lbH0TH9nMXLcQQEaz6tbpr9akYkxFfTzo22Y05EbCMKgLM4BZzw3T4X/C
         /ZXmCl/2CaB7uCqjn6ZAn9Od3wftwiddHLturEqucowTKCE8mLcdDHSvCebF0tVW67OD
         jRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature;
        bh=diVrYyr4jAwNRRGGSumq02T1DdSCzxO+Kec2U3O9P+s=;
        b=q65nJmSEj6wQl5f0DCXOPKGdWhn0EaXqZ/00ldTFEueKzwMsFcUVMzqQ6Bo8hqWSv8
         jXwH5sTJ3KrovxZoFUHiu2JtJx7jeEpRgBCaaelLjyBJKSNoWmDk91h5q9HCPeAtgRWa
         +UEEjokXZS92ySNZxCoIvRadxYP9vcZtHb2IOQjfJjS9EMfohjmkDUxRY5T++c8Tw4no
         ikL2ZCAanNGwthHMQWIh61aYGKRJkxVeoJDNzgJHqn9kWdA9TCr8nJSQnKCwdutMqO31
         DMgqh54iy3IHwK/LMlnwb+DqKsRRpRyonPQ4OOR7X+1Aue9NrH7tAgz9dgupP04D+kRS
         YF6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UzM7t56K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11-v6si6882603qvo.110.2018.09.07.16.31.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Sep 2018 16:31:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UzM7t56K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fyQE2-0005Cp-Un
	for alex.bennee@linaro.org; Fri, 07 Sep 2018 19:31:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyQDu-0005BO-4l
	for qemu-arm@nongnu.org; Fri, 07 Sep 2018 19:31:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyQDq-0008Q9-OY
	for qemu-arm@nongnu.org; Fri, 07 Sep 2018 19:31:34 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fyQDq-0008Mr-ED; Fri, 07 Sep 2018 19:31:30 -0400
Received: by mail-wr1-x443.google.com with SMTP id s14-v6so7444250wrw.6;
	Fri, 07 Sep 2018 16:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=diVrYyr4jAwNRRGGSumq02T1DdSCzxO+Kec2U3O9P+s=;
	b=UzM7t56K5hLGeucqO6swberpUNJBGyz8rn1jfSzpLo9rf+/+wF9j2pQdjBmKr1/Zji
	ap8N8iG/iA5jDQbCu0Jjbsf9vB0bq3zgRqat8DidKOA4ChVhWexCuDJJG5PcZajNiMF1
	t0Omw9fw9yftMMhq0l89jRXDJ97mA7HetfXj8TU9ZPII14N1cDRkhWOGiTnD5pGdpSKR
	dLZqFmmfAtbgM43c1n9aS29zD3c3l+fbEudEF4Wwj9rJWEgapW2hqdPlsO4UShsyXwfY
	ldN7Ty3EsRbox31/g+gVYK7LtfxwFPnjOhKXhbE8ZmdiAyAC60EuMCvwqBlJuSuvZeBC
	oEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=diVrYyr4jAwNRRGGSumq02T1DdSCzxO+Kec2U3O9P+s=;
	b=A/dQ0Fakk87jMChXrt+PfRcw8CF0wnTQ3ZV3raa5QF0/nq8hrKSwZ2+ks4tWkjWTSj
	kSqaXK6GVbphwXvFvbpHIiBdxfDqzFASDTpz6vhVxFT4PUfbYvXHmWxykvgDg3hzQbqA
	N673XYDqwrpPXzDRBTZv/Zi64qvXXpzwZ1jTQQsXrPqkdB1EtQEKAsIIqxsvhi+pnvJE
	Sx5VwM9IOwXx8VkbD+qp8ZVZs+IosThQusXzNwqTRF6ZI3mSdg8YGrPYuSmIAxQ9no0W
	ApM+a5F9kZaPa/Glkn8d9dDnUnw8Er2MvTGJaF4RZjnuDoBZDJg1a9Lw+L932AcFFpo/
	e48A==
X-Gm-Message-State: APzg51DoAccCoFkZRSkFVGndjikCfiz3NQz+GlyzzpZ6UlAP8qGa2YCH
	kx2g2d7jPpz6v9UYPAwtAhqjFAJM
X-Received: by 2002:adf:9e93:: with SMTP id
	a19-v6mr7938786wrf.70.1536363088950; 
	Fri, 07 Sep 2018 16:31:28 -0700 (PDT)
Received: from [192.168.43.186] (dynggepcrak-122-5-66-105.inwitelecom.net.
	[105.66.5.122]) by smtp.gmail.com with ESMTPSA id
	184-v6sm16157194wmv.6.2018.09.07.16.31.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 16:31:28 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20180901124639.19735-1-luc.michel@greensocs.com>
	<20180901124639.19735-10-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBAgA/AhsPBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJbkphvBQkm
	loU1AAoJEOPjLCzercDeTLIP/3pzTBotxvkddIREaw2j/6RoxN1lj5hnCx/XHGF7QxAlO4uV
	7eB6hcZxAqlt4AyNX5jcsSxNMfVNGnZ+u4ni6VdRRLUOw/QPXKGV8siK2E1zOG1GwZSCJ5zb
	ol7gpXNnOG/+ZXDfvkfSNnpim0ahNIPX8WAaZ/qN7I1qsPGupK2JrlCot561TfIOT7KNZFAZ
	m66Hf8MeNr8HQtn+oDk6j7g6WuIYZiqvF1MladikIZXndDMCsopXsjOikMXtoVuC/df7BlwS
	UaM+DT47onbIfXOtsWQGd2dJhu07Kxphqlz1Uh3YA7IHsFzZkX+S9waPBEzC8YB39dkZKA2E
	XbObk/ZTtCBLb39KTN2L7bv3Agm6wYO/hw3DQJQV3/07vW1EJd4fglQB5IY2A3eQ/ZSuRVm1
	E1GyFszjLXKUQIKx1938zoLrUDDdWQH7bhhSvG7JWk1BKmJrIXDTDx1tvTOW2pYZuO1PNx+p
	EhJraVuu3jtSbEfH+uPeoWtJtqSRkz1fLqp+dbha24ldPeKw4ija/YTviOem5baUlf/iNgS+
	a0s0eoRiJFrGZFCKLGKgZYoJe1rccQR6JKKd8JpoaIQuzptcHZD4+qn8W8FUlkNWGfpTQrsN
	iPLZt2EFOFkbjoZ2EoEByCs9nZ8ro91+lq7QfH9RFcldKLZfPEWwHPrchQ42
Message-ID: <46d0f4cc-4f5f-f55f-4a13-11c79bcfc3ac@amsat.org>
Date: Fri, 7 Sep 2018 20:31:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180901124639.19735-10-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-arm] [PATCH 09/15] gdbstub: add multiprocess support to
 'D' packets
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bITOuw2lTnLm

Hi Luc,

On 9/1/18 9:46 AM, Luc Michel wrote:
> 'D' packets are used by GDB to detach from a process. In multiprocess
> mode, the PID to detach from is sent in the request.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  gdbstub.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 48 insertions(+), 7 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 4ccd1153ce..af8864e251 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1025,24 +1025,39 @@ static int gdb_breakpoint_remove(target_ulong addr, target_ulong len, int type)
>      default:
>          return -ENOSYS;
>      }
>  }
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
>  static void gdb_breakpoint_remove_all(void)
>  {
>      CPUState *cpu;
>  
>      if (kvm_enabled()) {
>          kvm_remove_all_breakpoints(gdbserver_state->c_cpu);
>          return;
>      }
>  
>      CPU_FOREACH(cpu) {
> -        cpu_breakpoint_remove_all(cpu, BP_GDB);
> -#ifndef CONFIG_USER_ONLY
> -        cpu_watchpoint_remove_all(cpu, BP_GDB);
> -#endif
> +        gdb_cpu_breakpoint_remove_all(cpu);
>      }
>  }
>  
>  static void gdb_set_cpu_pc(GDBState *s, target_ulong pc)
>  {
> @@ -1318,13 +1333,39 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>          /* Kill the target */
>          error_report("QEMU: Terminated via GDBstub");
>          exit(0);
>      case 'D':
>          /* Detach packet */
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
> +            qemu_strtoul(p + 1, &p, 16, &lpid);

You forgot to check for EINVAL/ERANGE.

The rest is OK, so once fixed:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
>          put_packet(s, "OK");
>          break;
>      case 's':
>          if (*p != '\0') {
>              addr = strtoull(p, (char **)&p, 16);
> 
