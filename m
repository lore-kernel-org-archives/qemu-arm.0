Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp900206wrw;
        Fri, 16 Nov 2018 13:55:01 -0800 (PST)
X-Google-Smtp-Source: AJdET5euZ+Zrmu4PKBTx8ARq4Cs9ea5emlo7QT4fAT5So9Hze80DMQDFxnjA8sZWpm41kiUZELhm
X-Received: by 2002:ac8:2881:: with SMTP id i1mr12355670qti.382.1542405301132;
        Fri, 16 Nov 2018 13:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542405301; cv=none;
        d=google.com; s=arc-20160816;
        b=oQO/S0Y+TAZusn8SPk6xii83Cmu5T5HU4t/TkB/Zi21L3Yi4LqUEQiaqqCboVZGJT5
         ckbLGVvqz9qPdzkausOvbg3jjoR2tgQVbKxPL7xdQDhtjMAKQYS+8FZEKt472kjRtwGR
         kVuYX4WfohqWNHjbwhfsL3EOtNubPM05HXOxijMYi4OpsQCJRawKHoKoEV24vherBpww
         o+lGH9+IAGpk7jleWLqrT1waqGNhYFx//CVJO5nOwpaYE7zkdDjpod71/Bo0mDb8n4xK
         DMEK8BXDFvypy7SsDRnv4dB/gam/kb3CJUecOzWummtshhX+bMdjcqd9yhcYj/JaepnG
         qHVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=6oeVnmzdJyYQzvKTBienukarLIdhUbGv1lhXs4fiYP0=;
        b=vnoOfAuHuLw8/JwJs1JAM/ZAc50GlKt+sqh0sOwP3FjgA8ZUjeWbWkN5hLOWalSD39
         Jwe/XdK2jJoQiqW1hIuM2aw3QILjzVWlMyAmkS0SLqCdgt+L96BtzyS+RXdDSNU3k2aR
         3L0vlQ+1zAW3RL2q4S8+5KS2XusukL6o3gK5jDB5+shVeeox7dzcAxkZGX1qjqMbeYT2
         EqaH3fjvhLuTcYa4fhoQMKpZ2wTJlRvLocaSORh0yAwzyV2fM0qowPRf26JI/hSG8D6A
         lghP6ji7cP/dBjXGsukh+8bRjCtvs0Jn+QYlhtmEf6sQ7WO4dTWRU2eGZDlyEBCo/Mxp
         WOwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LfKzcxjZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d8si192565qtk.102.2018.11.16.13.55.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 13:55:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LfKzcxjZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNm4q-0002Zz-Ei
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 16:55:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gNm4f-0002Zp-S5
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 16:54:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gNm4c-0003iO-NP
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 16:54:49 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:44289)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gNm4c-0003hO-Cv; Fri, 16 Nov 2018 16:54:46 -0500
Received: by mail-pg1-x544.google.com with SMTP id t13so2498567pgr.11;
	Fri, 16 Nov 2018 13:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6oeVnmzdJyYQzvKTBienukarLIdhUbGv1lhXs4fiYP0=;
	b=LfKzcxjZpunGN/UJYFUgAOQYNfw/bM8f4sWbi5jQxGv8Twy2dwSinqtJi7zeDxFJ4s
	5OG0M2Y5dIAZPJ5lGMGJtdsdn1QreX0mzHwXz5Goso51QyQ+GvLlK6x5iHHeYpenK0tE
	8Xj5HZ+lBLsi/cArHu89Ir3w4JEf7HC9ElJuPIO2GnANQ3OgcNe9eZaaAANEP1YR6lKt
	ayA5DHLbKWxOGFtrZMcjT7uzSBfmnePfu4zYgLUDkNfv2Jv3FN7DDUJvGV4tIGM17cug
	vY3x2uAsovl0qQ+CBC8sR5r/3FWQqO6S40UZc6ZjsfX1ft0yhC5faPWH+22rSmFQ0jCc
	cwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6oeVnmzdJyYQzvKTBienukarLIdhUbGv1lhXs4fiYP0=;
	b=NEsts9kWlOJpvGcSAn3FImLwTWczAcs2UOlOdkVbO4WM54YaiJ+JRm5GlDEFRo0WPM
	9TJuYrbFxWgmXzwSh/4wF6EIxRvVOMUqmkhqW1IooLS0cbEmXYyOVbU9qMU5+gEpniSN
	fqQTMaUCqAyihTMsjwd5UOtiAlIypeqF8bunpKBJnFlLinaulYBFqirUcUacaS/h5h0n
	cj5sBhPO5E1CPWJnM7WTWprAvb/188Ob9dH5viK//E+p+v4mP17tte14ec/1edh5xx9N
	oyfaZ4f/QkfkKoX5i/iVGaMbsv3ZOpqtG+3YZ/3/CrvW+eN7GAAmNPD0YzpREovfD4tW
	uBEQ==
X-Gm-Message-State: AGRZ1gILFrDyM6NwhCdwPzLfuOMuzuB8T38GURwfq6/r3T5JFESP5L5e
	ioTf9WTMtzx2krlVYFOph+N8RNxj
X-Received: by 2002:a62:13c3:: with SMTP id 64mr12866810pft.93.1542405284293; 
	Fri, 16 Nov 2018 13:54:44 -0800 (PST)
Received: from [10.86.55.164] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id b2sm33860197pfm.3.2018.11.16.13.54.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 13:54:43 -0800 (PST)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-9-luc.michel@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Message-ID: <68d1155c-7df8-4c95-343b-b84cae661796@gmail.com>
Date: Fri, 16 Nov 2018 13:54:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181115094207.22846-9-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 08/16] gdbstub: add
 multiprocess support to Xfer:features:read:
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
X-TUID: G7cmmB13lLNW

On 15/11/2018 1:41 am, Luc Michel wrote:
> Change the Xfer:features:read: packet handling to support the
> multiprocess extension. This packet is used to request the XML
> description of the CPU. In multiprocess mode, different descriptions can
> be sent for different processes.
> 
> This function now takes the process to send the description for as a
> parameter, and use a buffer in the process structure to store the
> generated description.
> 
> It takes the first CPU of the process to generate the description.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   gdbstub.c | 47 +++++++++++++++++++++++++++--------------------
>   1 file changed, 27 insertions(+), 20 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 292dee8914..4cbc81ae5b 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -298,10 +298,12 @@ typedef struct GDBRegisterState {
>   } GDBRegisterState;
>   
>   typedef struct GDBProcess {
>       uint32_t pid;
>       bool attached;
> +
> +    char target_xml[1024];
>   } GDBProcess;
>   
>   enum RSState {
>       RS_INACTIVE,
>       RS_IDLE,
> @@ -804,55 +806,57 @@ static CPUState *gdb_first_cpu(const GDBState *s)
>       }
>   
>       return cpu;
>   }
>   
> -static const char *get_feature_xml(const char *p, const char **newp,
> -                                   CPUClass *cc)
> +static const char *get_feature_xml(const GDBState *s, const char *p,
> +                                   const char **newp, GDBProcess *process)
>   {
>       size_t len;
>       int i;
>       const char *name;
> -    static char target_xml[1024];
> +    CPUState *cpu = get_first_cpu_in_process(s, process);
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>   
>       len = 0;
>       while (p[len] && p[len] != ':')
>           len++;
>       *newp = p + len;
>   
>       name = NULL;
>       if (strncmp(p, "target.xml", len) == 0) {
> +        char *buf = process->target_xml;
> +        const size_t buf_sz = sizeof(process->target_xml);
> +
>           /* Generate the XML description for this CPU.  */
> -        if (!target_xml[0]) {
> +        if (!buf[0]) {
>               GDBRegisterState *r;
> -            CPUState *cpu = first_cpu;
>   
> -            pstrcat(target_xml, sizeof(target_xml),
> +            pstrcat(buf, buf_sz,
>                       "<?xml version=\"1.0\"?>"
>                       "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
>                       "<target>");
>               if (cc->gdb_arch_name) {
>                   gchar *arch = cc->gdb_arch_name(cpu);
> -                pstrcat(target_xml, sizeof(target_xml), "<architecture>");
> -                pstrcat(target_xml, sizeof(target_xml), arch);
> -                pstrcat(target_xml, sizeof(target_xml), "</architecture>");
> +                pstrcat(buf, buf_sz, "<architecture>");
> +                pstrcat(buf, buf_sz, arch);
> +                pstrcat(buf, buf_sz, "</architecture>");
>                   g_free(arch);
>               }
> -            pstrcat(target_xml, sizeof(target_xml), "<xi:include href=\"");
> -            pstrcat(target_xml, sizeof(target_xml), cc->gdb_core_xml_file);
> -            pstrcat(target_xml, sizeof(target_xml), "\"/>");
> +            pstrcat(buf, buf_sz, "<xi:include href=\"");
> +            pstrcat(buf, buf_sz, cc->gdb_core_xml_file);
> +            pstrcat(buf, buf_sz, "\"/>");
>               for (r = cpu->gdb_regs; r; r = r->next) {
> -                pstrcat(target_xml, sizeof(target_xml), "<xi:include href=\"");
> -                pstrcat(target_xml, sizeof(target_xml), r->xml);
> -                pstrcat(target_xml, sizeof(target_xml), "\"/>");
> +                pstrcat(buf, buf_sz, "<xi:include href=\"");
> +                pstrcat(buf, buf_sz, r->xml);
> +                pstrcat(buf, buf_sz, "\"/>");
>               }
> -            pstrcat(target_xml, sizeof(target_xml), "</target>");
> +            pstrcat(buf, buf_sz, "</target>");
>           }
> -        return target_xml;
> +        return buf;
>       }
>       if (cc->gdb_get_dynamic_xml) {
> -        CPUState *cpu = first_cpu;
>           char *xmlname = g_strndup(p, len);
>           const char *xml = cc->gdb_get_dynamic_xml(cpu, xmlname);
>   
>           g_free(xmlname);
>           if (xml) {
> @@ -1258,10 +1262,11 @@ out:
>   }
>   
>   static int gdb_handle_packet(GDBState *s, const char *line_buf)
>   {
>       CPUState *cpu;
> +    GDBProcess *process;
>       CPUClass *cc;
>       const char *p;
>       uint32_t pid, tid;
>       int ch, reg_size, type, res;
>       uint8_t mem_buf[MAX_PACKET_LENGTH];
> @@ -1639,18 +1644,19 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>           }
>           if (strncmp(p, "Xfer:features:read:", 19) == 0) {
>               const char *xml;
>               target_ulong total_len;
>   
> -            cc = CPU_GET_CLASS(first_cpu);
> +            process = gdb_get_cpu_process(s, s->g_cpu);
> +            cc = CPU_GET_CLASS(s->g_cpu);
>               if (cc->gdb_core_xml_file == NULL) {
>                   goto unknown_command;
>               }
>   
>               gdb_has_xml = true;
>               p += 19;
> -            xml = get_feature_xml(p, &p, cc);
> +            xml = get_feature_xml(s, p, &p, process);
>               if (!xml) {
>                   snprintf(buf, sizeof(buf), "E00");
>                   put_packet(s, buf);
>                   break;
>               }
> @@ -2323,10 +2329,11 @@ static int find_cpu_clusters(Object *child, void *opaque)
>            * runtime, we enforce here that the machine does not use a cluster ID
>            * that would lead to PID 0. */
>           assert(process->pid != UINT32_MAX);
>           process->pid = cluster->cluster_id + 1;
>           process->attached = false;
> +        process->target_xml[0] = '\0';
>   
>           return 0;
>       }
>   
>       return object_child_foreach(child, find_cpu_clusters, opaque);
> 

