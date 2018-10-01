Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4082031wrt;
        Mon, 1 Oct 2018 10:15:57 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62JcfhH85uT3N9Sa8YXkwYQNvHTMLpphqm7qCKmGQU+ebGy/28CdawIAAM5iq9/XLM1ixQ8
X-Received: by 2002:ac8:6917:: with SMTP id e23-v6mr4792165qtr.104.1538414157023;
        Mon, 01 Oct 2018 10:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538414157; cv=none;
        d=google.com; s=arc-20160816;
        b=JkG3+6JXgXVD6l3NT2INrIRADgRT9Q+rXZn1x9kcQnV+lqb1fAoPg++Y5xtf3bssGr
         tfGeG8XLzIOglCJkeZ0Tn3UVxnFXy6H3RlI8TfXi3YGggZXfJ/cLJzs2e+x+N3xodNLq
         xPf2jydOb7UVh30wbIZisD5mWLwahl2Gm3BJEu3eLzU/VSKD47L0otoBL4LQrfaAKO1B
         WDHNo8rKtWMO4rik0sc3vnQ02A8ePnRo5p4MqudCXfnAkY94dpN22yy2RpPetA9RMdQd
         mCooy4BgXBBoguVW6Z6m+ek79MKJ6iR97ZRAMl7GZV/UjxCovWL2hYT84qC4BqQ7tVjW
         5Xcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=C2hFx90k5Do/Xn2bcNC3HLNx/JLh/10avUd4HOTZpc0=;
        b=aGphd+yNwYc9AfV291Vj2DWZhvzU2irwrPtr60NeR/AxK0Ghy9xATVkBDvFRUtu0Cg
         Nciv1TaWEWdIuiOjWf/Ii89phFdw8SMHnRFRXwPe/WB3wM/NwAE0L3B630QDzHF6X45Z
         6iaFgm0QlxLsNNZK5IaapPaOj5pnrm/8RW9MHsjB+YBr0Xf3RmgVIhy0kp8VYbC1SahD
         W7r9ThPcSiReWRUrVOdHFu95AAv0hDSsAxIGY8R347VkdARV3lnuxCt7owZt4K5K/mzX
         I6ma2hVgOaHJt2XoFboSPi87T5IUw8gqwL6STOnMDlD3/zN5ac1gEvwDCkxzo8sPQ4ZW
         /fVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o128-v6si10115649qkc.166.2018.10.01.10.15.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 10:15:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39754 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g71nY-0000JZ-Dr
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 13:15:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g71nG-0000JI-6G
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 13:15:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g71nB-0003qC-Vz
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 13:15:37 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36690)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g71nB-0003pk-OG
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 13:15:33 -0400
Received: by mail-wm1-f65.google.com with SMTP id n23-v6so9549251wmc.1
	for <qemu-devel@nongnu.org>; Mon, 01 Oct 2018 10:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=C2hFx90k5Do/Xn2bcNC3HLNx/JLh/10avUd4HOTZpc0=;
	b=HxWsYxkf6Ox5zRTpnk2wlsjcvY2LAEPWnyisIhjHF5Sy8Y0cmH/iRWzEz3e2+Q7gVZ
	PkWnUNOFGHhUYchwVXtAMHpo2rcKUtOc5dQamQx+kytvJBk6GAj9SB5iuJ8iQ9iy7rvj
	PUpnQp5QbBYMRsvqFhmaS7WmmS/z/cPR7UMyhK9VGmouFqsoqjeM8aBP1T+hh46u3UDQ
	beihfZsma9DuKomVvV7z25re4cRZsu4x14gVK1TJRceGGsAHE5q+n3jpqF2xS0O1xwM7
	wXHXRwfQyn0DbLaRunu0BAZ05c4U56KhN0DqF1eh2P9qMwRqcmETBQ+hNuewJhTtfpQz
	nbOg==
X-Gm-Message-State: ABuFfoiZe8adPEunP8xJuUB+u3RES+oJOYyiINJmhKpridujNkupAZ/O
	UiJDlQ4X9RIzP3R+1g6JR3xx5A==
X-Received: by 2002:a1c:f4e:: with SMTP id 75-v6mr9376746wmp.79.1538414132596; 
	Mon, 01 Oct 2018 10:15:32 -0700 (PDT)
Received: from [192.168.2.71] ([80.31.72.241])
	by smtp.gmail.com with ESMTPSA id
	u5-v6sm2480266wru.16.2018.10.01.10.15.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Oct 2018 10:15:31 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-7-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <300b2d3b-c1b4-7612-7336-0b50494d5315@redhat.com>
Date: Mon, 1 Oct 2018 19:15:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181001115704.701-7-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH v2 06/15] gdbstub: add multiprocess support
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PjnOLygtuhKi



On 01/10/2018 13:56, Luc Michel wrote:
> Change the thread info related packets handling to support multiprocess
> extension.
> 
> Add the CPUs class name in the extra info to help differentiate
> them in multiprocess mode.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  gdbstub.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 3242f0d261..63d7913269 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1248,11 +1248,10 @@ out:
>  static int gdb_handle_packet(GDBState *s, const char *line_buf)
>  {
>      CPUState *cpu;
>      CPUClass *cc;
>      const char *p;
> -    uint32_t thread;
>      uint32_t pid, tid;
>      int ch, reg_size, type, res;
>      uint8_t mem_buf[MAX_PACKET_LENGTH];
>      char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
>      char thread_id[16];
> @@ -1540,30 +1539,43 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>              snprintf(buf, sizeof(buf), "QC%s",
>                       gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_id)));
>              put_packet(s, buf);
>              break;
>          } else if (strcmp(p,"fThreadInfo") == 0) {
> -            s->query_cpu = first_cpu;
> +            s->query_cpu = gdb_first_cpu(s);
>              goto report_cpuinfo;
>          } else if (strcmp(p,"sThreadInfo") == 0) {
>          report_cpuinfo:
>              if (s->query_cpu) {
> -                snprintf(buf, sizeof(buf), "m%x", cpu_gdb_index(s->query_cpu));
> +                snprintf(buf, sizeof(buf), "m%s",
> +                         gdb_fmt_thread_id(s, s->query_cpu,
> +                                       thread_id, sizeof(thread_id)));
>                  put_packet(s, buf);
> -                s->query_cpu = CPU_NEXT(s->query_cpu);
> +                s->query_cpu = gdb_next_cpu(s, s->query_cpu);
>              } else
>                  put_packet(s, "l");
>              break;
>          } else if (strncmp(p,"ThreadExtraInfo,", 16) == 0) {
> -            thread = strtoull(p+16, (char **)&p, 16);
> -            cpu = find_cpu(thread);
> +            read_thread_id(p + 16, &p, &pid, &tid);

Check similar to patch #3:

        if (read_thread_id(p, &p, &pid, &tid) == GDB_READ_THREAD_ERR) {
            put_packet(s, "E22");
            break;
        }

With equivalent change:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +            cpu = gdb_get_cpu(s, pid, tid);
>              if (cpu != NULL) {
>                  cpu_synchronize_state(cpu);
> -                /* memtohex() doubles the required space */
> -                len = snprintf((char *)mem_buf, sizeof(buf) / 2,
> -                               "CPU#%d [%s]", cpu->cpu_index,
> -                               cpu->halted ? "halted " : "running");
> +
> +                if (s->multiprocess && (s->process_num > 1)) {
> +                    /* Print the CPU model in multiprocess mode */
> +                    ObjectClass *oc = object_get_class(OBJECT(cpu));
> +                    const char *cpu_model = object_class_get_name(oc);
> +                    len = snprintf((char *)mem_buf, sizeof(buf) / 2,
> +                                   "CPU#%d %s [%s]", cpu->cpu_index,
> +                                   cpu_model,
> +                                   cpu->halted ? "halted " : "running");
> +                } else {
> +                    /* memtohex() doubles the required space */
> +                    len = snprintf((char *)mem_buf, sizeof(buf) / 2,
> +                                   "CPU#%d [%s]", cpu->cpu_index,
> +                                   cpu->halted ? "halted " : "running");
> +                }
>                  trace_gdbstub_op_extra_info((char *)mem_buf);
>                  memtohex(buf, mem_buf, len);
>                  put_packet(s, buf);
>              }
>              break;
> 
