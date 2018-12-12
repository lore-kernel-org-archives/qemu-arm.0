Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2078487wrt;
        Wed, 12 Dec 2018 09:36:59 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XfLqgDlr1rjNj9VIOf+ywA2teQSnjQUxHYXVbPJoc+KK7OC192oc8gPU6LVThjEvFasanD
X-Received: by 2002:a37:ba06:: with SMTP id k6mr19060717qkf.115.1544636219536;
        Wed, 12 Dec 2018 09:36:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544636219; cv=none;
        d=google.com; s=arc-20160816;
        b=X8TDkWR0S/AIXwQU03IcRnIZm1qoRb1gccRwF2fifTR5QdYUkLZz/+DAmRf4YOT3ie
         Rf6aJVIxrCl7/nCyzyCsC1e1bnRBw5ujMuMCY5HsL5AUR/EJpNtVj84FFffEGyEiEV5S
         HucU0TBovFnT7WgrLTBxe1m5BOlJs1W/KLBeIcBP2bqO8Ic1OFGsSddRUtHwm93glz0K
         ggI5qJBs0KScT0OS/UOx5t4fGY/tnTKLDO1XmKbBYpMbLo0m+jX8EOFQksdIVW6HxHxO
         VckHp1J43IhDMcFIXJEQzox/MX2jH+du2aakEkqslbOFFlbHtw7sn594uNz0dgz3eO9w
         y6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=vljcdUifzxZaUkkDUsV46AGQcCUCzqiUJijzc79kmn8=;
        b=kupArH1jzgMrmT8WT+yK+zIM9tQnwf7KNBnAHnkxWy9c0ziFjdPzsE/DlNLNCHDT+T
         aSluLql9Ej8eIi76mTaCxtIXFvc+iiz5Z9gBSTi362DqqSHhvyGwGlA3J286qU2DAeWg
         tT0pI5IlgFeTOkuEdsnyOnpTBN6bL6utdyud3j0JZ5ieE5Hnxfd14ltkSx6Pbw/Sqr5f
         S2v24HxVQ93kdtf1EqIXJTrdJzFX//ke89uI6dpoDecwb8U5KTxspVhTrTWUVtxgOcRe
         /Q14lkIwxEDfc0gzMDh4hPsrzFCfzYAf5IzCYzhI6C1VvnamdJHmffv/b+agEXGz2lf/
         Grlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kQfqouyp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j1si11501032qkj.111.2018.12.12.09.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Dec 2018 09:36:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kQfqouyp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gX8RO-0002hO-MY
	for alex.bennee@linaro.org; Wed, 12 Dec 2018 12:36:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gX8QJ-0002f9-EA
	for qemu-devel@nongnu.org; Wed, 12 Dec 2018 12:35:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gX8QI-0005kL-39
	for qemu-devel@nongnu.org; Wed, 12 Dec 2018 12:35:51 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:39345)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gX8QD-0005WI-FA; Wed, 12 Dec 2018 12:35:45 -0500
Received: by mail-pg1-x543.google.com with SMTP id w6so8637462pgl.6;
	Wed, 12 Dec 2018 09:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vljcdUifzxZaUkkDUsV46AGQcCUCzqiUJijzc79kmn8=;
	b=kQfqouypxJ7B3cLhtyjRU41FnvcyOdXD0XpGumQRU6B1LQkd81UOcRiS20eetaWGxp
	Z8/GFDJzdCYcgshV5GyX6CiQC2N0chqfV21tT4qAGmtam8LBaTc2QqlDN6doKf9J8iEG
	FWQuRtuZJm2/eCMCX2gURbNbJH3rjvzjj/l2T+EGTqADOAC5k6qcxdvuJMWl4RjNqWPf
	/anl9yKqBqW9vcKIdHNNOUr8MRLzAT9H4/OWv3prGFNbg5TDVSbFSRx/wM33F8dTArVL
	ASXnQXgzyl2ctuT8q/aiibX+iqPUaznTWyo/m4os5ywnGdhaU8lsX+uH2mliI8k9ZJAt
	XYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vljcdUifzxZaUkkDUsV46AGQcCUCzqiUJijzc79kmn8=;
	b=FNlZLxmgx5mbYMttnegsJuTeFFNCZStxRc94iUqDH4VE9HxKFpfmY8Lf0Wv1NaI1jZ
	gILOtMh0FnLiOuF+Pug2UaW9JxCv9x61ctvXunjorBFcle4zQ99XPAtOPvPrl15iMjnj
	qHRTUlmGBQTt7UfGop5e+NIoaA3RzXL9iD8/xZM8a68dPAnoHhz0B7A+/fJQIXXd0hpG
	uYdiVqXJoT/MZk6j1A2GlTx5WJbVmjKLnWsAyVocyMHWpaB62Us4ESyP5R2oCx734RjH
	Gp5dGnAOZJQeeb9/8KhvHhxxqsO9XpIiC5aGug4TvRCusF84XHzS11vgNhzVhfKXcCPg
	yeMA==
X-Gm-Message-State: AA+aEWZFR6W46IrweHKGMzmoujvRfhajcFcFsF1CMMohM9kpGiU6NBaQ
	S8TWAgf3LbXGbAAAqvOaLPx4xnv2
X-Received: by 2002:a63:604f:: with SMTP id u76mr19124879pgb.401.1544636143908;
	Wed, 12 Dec 2018 09:35:43 -0800 (PST)
Received: from ?IPv6:2601:646:8e00:dca:6bcc:38b1:fed7:e746?
	([2601:646:8e00:dca:6bcc:38b1:fed7:e746])
	by smtp.gmail.com with ESMTPSA id
	d129sm28389657pfc.31.2018.12.12.09.35.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Dec 2018 09:35:43 -0800 (PST)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181207090135.7651-1-luc.michel@greensocs.com>
	<20181207090135.7651-8-luc.michel@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Message-ID: <00da96e1-5cfc-05bb-4765-33a71d8aff88@gmail.com>
Date: Wed, 12 Dec 2018 09:35:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181207090135.7651-8-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-devel] [PATCH v8 07/16] gdbstub: add multiprocess support
 to (f|s)ThreadInfo and ThreadExtraInfo
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3N5h9PMFSN3S

On 07/12/2018 1:01 am, Luc Michel wrote:
> Change the thread info related packets handling to support multiprocess
> extension.
> 
> Add the CPUs class name in the extra info to help differentiate
> them in multiprocess mode.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   gdbstub.c | 37 +++++++++++++++++++++++++++----------
>   1 file changed, 27 insertions(+), 10 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index bea0215f30..770915446a 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1267,11 +1267,10 @@ out:
>   static int gdb_handle_packet(GDBState *s, const char *line_buf)
>   {
>       CPUState *cpu;
>       CPUClass *cc;
>       const char *p;
> -    uint32_t thread;
>       uint32_t pid, tid;
>       int ch, reg_size, type, res;
>       uint8_t mem_buf[MAX_PACKET_LENGTH];
>       char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
>       char thread_id[16];
> @@ -1563,30 +1562,48 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>               snprintf(buf, sizeof(buf), "QC%s",
>                        gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_id)));
>               put_packet(s, buf);
>               break;
>           } else if (strcmp(p,"fThreadInfo") == 0) {
> -            s->query_cpu = first_cpu;
> +            s->query_cpu = gdb_first_attached_cpu(s);
>               goto report_cpuinfo;
>           } else if (strcmp(p,"sThreadInfo") == 0) {
>           report_cpuinfo:
>               if (s->query_cpu) {
> -                snprintf(buf, sizeof(buf), "m%x", cpu_gdb_index(s->query_cpu));
> +                snprintf(buf, sizeof(buf), "m%s",
> +                         gdb_fmt_thread_id(s, s->query_cpu,
> +                                       thread_id, sizeof(thread_id)));
>                   put_packet(s, buf);
> -                s->query_cpu = CPU_NEXT(s->query_cpu);
> +                s->query_cpu = gdb_next_attached_cpu(s, s->query_cpu);
>               } else
>                   put_packet(s, "l");
>               break;
>           } else if (strncmp(p,"ThreadExtraInfo,", 16) == 0) {
> -            thread = strtoull(p+16, (char **)&p, 16);
> -            cpu = find_cpu(thread);
> +            if (read_thread_id(p + 16, &p, &pid, &tid) == GDB_READ_THREAD_ERR) {
> +                put_packet(s, "E22");
> +                break;
> +            }
> +            cpu = gdb_get_cpu(s, pid, tid);
>               if (cpu != NULL) {
>                   cpu_synchronize_state(cpu);
> -                /* memtohex() doubles the required space */
> -                len = snprintf((char *)mem_buf, sizeof(buf) / 2,
> -                               "CPU#%d [%s]", cpu->cpu_index,
> -                               cpu->halted ? "halted " : "running");
> +
> +                if (s->multiprocess && (s->process_num > 1)) {
> +                    /* Print the CPU model and name in multiprocess mode */
> +                    ObjectClass *oc = object_get_class(OBJECT(cpu));
> +                    const char *cpu_model = object_class_get_name(oc);
> +                    char *cpu_name =
> +                        object_get_canonical_path_component(OBJECT(cpu));
> +                    len = snprintf((char *)mem_buf, sizeof(buf) / 2,
> +                                   "%s %s [%s]", cpu_model, cpu_name,
> +                                   cpu->halted ? "halted " : "running");
> +                    g_free(cpu_name);
> +                } else {
> +                    /* memtohex() doubles the required space */
> +                    len = snprintf((char *)mem_buf, sizeof(buf) / 2,
> +                                   "CPU#%d [%s]", cpu->cpu_index,
> +                                   cpu->halted ? "halted " : "running");
> +                }
>                   trace_gdbstub_op_extra_info((char *)mem_buf);
>                   memtohex(buf, mem_buf, len);
>                   put_packet(s, buf);
>               }
>               break;
> 

