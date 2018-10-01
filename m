Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3958197wrt;
        Mon, 1 Oct 2018 08:21:26 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61xAt+MoW+hIp6IAYxjh5Gc3llL6ta8bxByZgoF9g4gyrb/4qJKMKFXICiqUJ6J9EM56TE8
X-Received: by 2002:a37:10a7:: with SMTP id 39-v6mr8469543qkq.131.1538407286391;
        Mon, 01 Oct 2018 08:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538407286; cv=none;
        d=google.com; s=arc-20160816;
        b=Zf4HNluDmWlROpWHmSbHj42naQYMlpA0S1yjWsdXpjzkbhGBsob0i0yTxqF8quFthD
         tBCKyat/u4fPpd0nPVD53ujE+bO0dhRkzhTthwIpXbX6RlweCRqiZqQIZjxbd35UFl7J
         LzaB2vbevYk96Wtx10L2eVksAI1FOp9U4snWX+ODm7KAVfgMF+as6yKhfPgkTyy37Q/L
         9xks+PH8qqanmGZpBNYtzMbKOHfpDZXKlLNROGyq6hWS0Hp5U8KsclzERMW/ELPPdlAS
         jsNH1URxS8HSiBOfIesbUdWS0+jJxz6QbncmUupp2UBeeK9KHjUBXPDvncuX/aWBGw1g
         BHOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=qmH3230rH2Xr2qEEDMl34ji0y71itYde00tYYTap+jQ=;
        b=iSVVOzrMqs63xEu1qJ5yrKT9mN1YE7Ss8H94p6SgEhhobAuSa5AR/VhC8yGsuy+oqm
         Squa1XeVeMgiH1xZkL1pu+Al2TttCMAPTDygCbJa3QCWTTt1K0DmRCbBbortJCPkG/pc
         uSglIb1AM70VvzpxHUrvAi58aW2ynaBsdi8tePDwCYNYtpoWe9vtjKkcl/BQ7glksPFr
         5hOeTo2Wv2HUnix7ihEDG8hka9a+7IhBQnnuLpfQr08l/9yMd7ANQumm5L5xT3QoMs9c
         QfZ76IdRACZt3HS4Wooph4QU+llbNDgNUAHocdR5Uaa1mlnTKwCn7RJKDsUE9F5DlZWI
         nlVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r6-v6si9301920qvb.185.2018.10.01.08.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 08:21:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g700j-0004pf-UI
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 11:21:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g6zza-0004WT-Qa
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 11:20:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g6zzV-0001dE-R3
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 11:20:14 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53832)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g6zzV-0001bl-Jq
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 11:20:09 -0400
Received: by mail-wm1-f68.google.com with SMTP id b19-v6so9214368wme.3
	for <qemu-devel@nongnu.org>; Mon, 01 Oct 2018 08:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qmH3230rH2Xr2qEEDMl34ji0y71itYde00tYYTap+jQ=;
	b=LkMT4qjZgBS+LsrCDt0jIprGJUXLbTyCqpWdJBU/y3LC7uklRJtyAaWeHybpUkh6dM
	gexU+UWQwHZ4uMYGFqVLCMXxb2O12/cmFc0N5WQ7wTHfzEuu35kEgO9H0MLcylzmp2ci
	SutTwPa7FrFlrmfZXZ6z8IXGSQ3xGsc1JizV2X2pyUE5N64UQdB4TZWqogw2wvU6JdQ4
	rbXbKXBTdxTudBjNDNUC8NBTWMVfLFfKq0UtPf2A1JOFf+wus3lhKukt+hkREVPHRwig
	OGGWZ7x8rCBBnmY3dUoRhoNuRQXkXT6IoJ7TKLV818PGYZo7wlxXnJfyeeCbk4R2vNTA
	f+MA==
X-Gm-Message-State: ABuFfoiYhoR5QOY9ESVBPRW5noXVrYstoBFs7xqGJflvorM+786pWRqI
	or/tYHls4NM4HYnyjUHwZhUSzg==
X-Received: by 2002:a1c:b157:: with SMTP id
	a84-v6mr8824518wmf.18.1538407208438; 
	Mon, 01 Oct 2018 08:20:08 -0700 (PDT)
Received: from [192.168.2.71] ([80.31.72.241])
	by smtp.gmail.com with ESMTPSA id
	e14-v6sm9983933wrv.44.2018.10.01.08.20.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Oct 2018 08:20:07 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-3-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dbb0398c-a952-ac17-0a71-d099d42f2640@redhat.com>
Date: Mon, 1 Oct 2018 17:20:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181001115704.701-3-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH v2 02/15] gdbstub: add multiprocess support
 to '?' packets
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
X-TUID: 8xYEikdBH3lL

On 01/10/2018 13:56, Luc Michel wrote:
> The gdb_get_cpu_pid() function does the PID lookup for the given CPU. It
> checks if the CPU is in a QOM container named after the
> GDB_CPU_GROUP_NAME macro. If found, it returns the correponding PID,
> which is the group ID plus one (group IDs start at 0, GDB PIDs at 1).
> When the CPU is not a child of such a container, PID 1 is returned.
> 
> The gdb_fmt_thread_id() function generates the string to be used to identify
> a given thread, in a response packet for the peer. This function
> supports generating thread IDs when multiprocess mode is enabled (in the
> form `p<pid>.<tid>').
> 
> Use it in the reply to a '?' request.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> 

No need to separate tags with empty line.

> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  gdbstub.c | 45 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 5c86218f49..ac9d540fda 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -640,10 +640,37 @@ static int memtox(char *buf, const char *mem, int len)
>          }
>      }
>      return p - buf;
>  }
>  
> +static uint32_t gdb_get_cpu_pid(const GDBState *s, CPUState *cpu)
> +{
> +    gchar *path;
> +    gchar *cont;
> +    const char *left;
> +    unsigned long pid;
> +
> +    if (!s->multiprocess || (s->process_num == 1)) {
> +        return 1;
> +    }
> +
> +    path = object_get_canonical_path(OBJECT(cpu));
> +    cont = g_strrstr(path, "/" GDB_CPU_GROUP_NAME "[");
> +
> +    if (cont == NULL) {
> +        return 1;
> +    }
> +
> +    cont += strlen("/" GDB_CPU_GROUP_NAME "[");
> +
> +    if (qemu_strtoul(cont, &left, 10, &pid)) {
> +        return 1;
> +    }
> +
> +    return pid + 1;
> +}
> +
>  static const char *get_feature_xml(const char *p, const char **newp,
>                                     CPUClass *cc)
>  {
>      size_t len;
>      int i;
> @@ -909,10 +936,23 @@ static CPUState *find_cpu(uint32_t thread_id)
>      }
>  
>      return NULL;
>  }
>  
> +static char *gdb_fmt_thread_id(const GDBState *s, CPUState *cpu,
> +                           char *buf, size_t buf_size)
> +{
> +    if (s->multiprocess) {
> +        snprintf(buf, buf_size, "p%02x.%02x",
> +                 gdb_get_cpu_pid(s, cpu), cpu_gdb_index(cpu));
> +    } else {
> +        snprintf(buf, buf_size, "%02x", cpu_gdb_index(cpu));
> +    }
> +
> +    return buf;
> +}
> +
>  static int is_query_packet(const char *p, const char *query, char separator)
>  {
>      unsigned int query_len = strlen(query);
>  
>      return strncmp(p, query, query_len) == 0 &&
> @@ -1020,22 +1060,23 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>      const char *p;
>      uint32_t thread;
>      int ch, reg_size, type, res;
>      uint8_t mem_buf[MAX_PACKET_LENGTH];
>      char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
> +    char thread_id[16];
>      uint8_t *registers;
>      target_ulong addr, len;
>  
>      trace_gdbstub_io_command(line_buf);
>  
>      p = line_buf;
>      ch = *p++;
>      switch(ch) {
>      case '?':
>          /* TODO: Make this return the correct value for user-mode.  */
> -        snprintf(buf, sizeof(buf), "T%02xthread:%02x;", GDB_SIGNAL_TRAP,
> -                 cpu_gdb_index(s->c_cpu));
> +        snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
> +                 gdb_fmt_thread_id(s, s->c_cpu, thread_id, sizeof(thread_id)));
>          put_packet(s, buf);
>          /* Remove all the breakpoints when this query is issued,
>           * because gdb is doing and initial connect and the state
>           * should be cleaned up.
>           */
> 
