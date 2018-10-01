Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4034687wrt;
        Mon, 1 Oct 2018 09:31:03 -0700 (PDT)
X-Google-Smtp-Source: ACcGV605J3U94egKmdNCXgnFewtZr5K1TlSlvH8y36zCdKuzOaBjH+8GQpoVMvleNGAnw0BYCvDa
X-Received: by 2002:a37:a70a:: with SMTP id q10-v6mr9020907qke.110.1538411463009;
        Mon, 01 Oct 2018 09:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538411463; cv=none;
        d=google.com; s=arc-20160816;
        b=hxVm17V8Abw3UZLBFxEKBvfqJ86w9agL2WSNgzy0Lm4rMsl2dvucZqPKvb0g+ruius
         RVgv75Mt/KQ20mPE3Mm1V/cNEcEtdZ1bd55G/QvMZj98PZXlQ8QG7vnwDgCSjDIrD5j6
         HU/i5k6mQBPWb4YXMMNDeEQ6Vz1sbSlgWZGfziZJJIQ2tzuiAIhBPHRaudzNGcSS5o2L
         xxO70bTbJbMKBNLVB2EFFuePMIoVnX59/5QkrU0iRb9GgODkmAkI5dkwXHQiBQMqD0d2
         NrkxVZjiVaU/CqihIJgSiJNbH+aL/Lr0+jUwFIKcQwn3G0pA3zD36N7wUJWJuvcH4FIN
         LJtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=cMymcKBY/kwhwXJpDnl/OaGht5Ujphhrrm1/cusfNe8=;
        b=uu1xCYALANdGB5YD8F/ZCNGzaJlYGC3L+iSsEzLU55DyPGcvXZ3RlAxLMyhFq9u50n
         i6l8wJnOQuiGavlgTVI9c3BlEGP3J9DGucYny7wTDqRrki6kbSlo0H4gGxbDIPWhE0N7
         Z9Byl2hxhBsysaRuCIs1TFClwKCLeqTZVyA4w8uK0RpKv5jozjhPBRecGSvaQy6ont4j
         eJpem5csW0eYWpLgSfaT/ffT2dfozo6I8YONVsHkqGdJSBtTaSzW87n1Fi4bvDHQpvZT
         VmlzeAUvctXEoR97ZNw+t21YAQsOq3XwHEHTS4aaQW71a+ZhuyPbRQzXyRPBdsNrSJTL
         8PqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i31-v6si3880635qtd.282.2018.10.01.09.31.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 09:31:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7166-0008Fv-9l
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 12:31:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g715n-0008Ea-1P
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 12:30:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g715j-0006RW-RR
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 12:30:42 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40287)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g715j-0006RD-GF
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 12:30:39 -0400
Received: by mail-wr1-f67.google.com with SMTP id y8-v6so14696599wrh.7
	for <qemu-devel@nongnu.org>; Mon, 01 Oct 2018 09:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cMymcKBY/kwhwXJpDnl/OaGht5Ujphhrrm1/cusfNe8=;
	b=gQLZOM0kSHiT56g7wKJyBHjb4XfyCJkP8ObXH4jNPl4QkswgdgMtJfNIHJEpDQSfXW
	Sv5WgcHc8Tnkz9HJStynX9HO8xbo1eP/QetSwNJ3iImvQ7j5i6/ONDR1lBoAf6oZb2T8
	VxZsf+oOahqDQUkC6B288k+w5t4b/4d8XG/4/s9fB2l4vFznuuSlbsTPVCMsJ3kIVGy7
	+Gc2W+Gm8tTfqmZsJNFh4ifOXSclwH9SI1y0wkLdqp8LOtIvIZ+7tOqgt+7RxdIb/+K3
	VqKTMmWaay7/a+ct5tQatq0djEW++cKO4E9p8cFBPXywG0ZcogjfhCn3TBKBIiZHp9Eo
	/6RQ==
X-Gm-Message-State: ABuFfogJls+zgf27pOR3dlavHqxJpt6a/rdIOzPNvutAK4aURxzS9MdJ
	JcpVVMrBf9NFjeYDuwRLwq3Mmg==
X-Received: by 2002:adf:d4c6:: with SMTP id
	w6-v6mr2338928wrk.119.1538411438389; 
	Mon, 01 Oct 2018 09:30:38 -0700 (PDT)
Received: from [192.168.2.71] ([80.31.72.241])
	by smtp.gmail.com with ESMTPSA id
	q16-v6sm11832397wrn.41.2018.10.01.09.30.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Oct 2018 09:30:37 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-9-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <76691be8-e054-ba95-ade5-895919aefae6@redhat.com>
Date: Mon, 1 Oct 2018 18:30:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181001115704.701-9-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PATCH v2 08/15] gdbstub: add multiprocess support
 to gdb_vm_state_change()
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
X-TUID: n+ZBw6ZIOf6y

On 01/10/2018 13:56, Luc Michel wrote:
> Add support for multiprocess extension in gdb_vm_state_change()
> function.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  gdbstub.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 9065e8e140..c1a02c34cd 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1692,10 +1692,11 @@ void gdb_set_stop_cpu(CPUState *cpu)
>  static void gdb_vm_state_change(void *opaque, int running, RunState state)
>  {
>      GDBState *s = gdbserver_state;
>      CPUState *cpu = s->c_cpu;
>      char buf[256];
> +    char thread_id[16];
>      const char *type;
>      int ret;
>  
>      if (running || s->state == RS_INACTIVE) {
>          return;
> @@ -1703,10 +1704,18 @@ static void gdb_vm_state_change(void *opaque, int running, RunState state)
>      /* Is there a GDB syscall waiting to be sent?  */
>      if (s->current_syscall_cb) {
>          put_packet(s, s->syscall_buf);
>          return;
>      }
> +
> +    if (cpu == NULL) {
> +        /* No process attached */
> +        return;
> +    }
> +
> +    gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_id));
> +
>      switch (state) {
>      case RUN_STATE_DEBUG:
>          if (cpu->watchpoint_hit) {
>              switch (cpu->watchpoint_hit->flags & BP_MEM_ACCESS) {
>              case BP_MEM_READ:
> @@ -1720,12 +1729,12 @@ static void gdb_vm_state_change(void *opaque, int running, RunState state)
>                  break;
>              }
>              trace_gdbstub_hit_watchpoint(type, cpu_gdb_index(cpu),
>                      (target_ulong)cpu->watchpoint_hit->vaddr);
>              snprintf(buf, sizeof(buf),
> -                     "T%02xthread:%02x;%swatch:" TARGET_FMT_lx ";",
> -                     GDB_SIGNAL_TRAP, cpu_gdb_index(cpu), type,
> +                     "T%02xthread:%s;%swatch:" TARGET_FMT_lx ";",
> +                     GDB_SIGNAL_TRAP, thread_id, type,
>                       (target_ulong)cpu->watchpoint_hit->vaddr);
>              cpu->watchpoint_hit = NULL;
>              goto send_packet;
>          } else {
>              trace_gdbstub_hit_break();
> @@ -1763,11 +1772,11 @@ static void gdb_vm_state_change(void *opaque, int running, RunState state)
>          trace_gdbstub_hit_unknown(state);
>          ret = GDB_SIGNAL_UNKNOWN;
>          break;
>      }
>      gdb_set_stop_cpu(cpu);
> -    snprintf(buf, sizeof(buf), "T%02xthread:%02x;", ret, cpu_gdb_index(cpu));
> +    snprintf(buf, sizeof(buf), "T%02xthread:%s;", ret, thread_id);
>  
>  send_packet:
>      put_packet(s, buf);
>  
>      /* disable single step if it was enabled */
> 
