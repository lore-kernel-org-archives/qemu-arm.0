Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4033294wrt;
        Mon, 1 Oct 2018 09:29:42 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63qXbxjL77LdS1HxTdATjZdmbxoWEiK/3OnzwxHYFaCntJTLV21lr38o3Qf/KxfztKOn8ep
X-Received: by 2002:a37:19cd:: with SMTP id 74-v6mr8798092qkz.253.1538411382505;
        Mon, 01 Oct 2018 09:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538411382; cv=none;
        d=google.com; s=arc-20160816;
        b=xAcPCl6SPfQoBw4mCA25tSkgSwfHF1kYANKpi7U8U7ElH9hJBzkpvCFIsVILHB8alj
         ESyux/YPGK2PmnJSk9e1ixrwo2AHeRP8ksEn/n2uf/rf4Hf3xg+ds/WkdLUb+G/xuGVH
         ey2bRE4nsoHMHA6Kh+jqPKtaA/NX43kNx7nJF1uLCM+L8g7AvSH3EyJ4m+C/1Pme37GF
         dkGkhVFp55pFvAg6Obl9gHid6919L9FZwsOYUBqq8Kk7iX93/MPfAoBCojbqt93SBI8+
         wP9agGFiv65gz9ZubhA1y2ktNb+Z4rVeLfI+X6EjLaZhwH7MA6oeoVlELJkyPeMKGo65
         mZOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=hnCWcKDB+SOeBvBkBkJP4Cxdi4HiN/MB8kZpqHsrPYg=;
        b=KskhwK8RJgNqASd38Pci6DhYZVct9bAnFzP2Z3B+NiG3VBEvfzsyVtZ9wpc8gqYIU3
         eTd0EqH9bnfArFfP57iPXc8vDK4WSUHg9TwDHT4R59eN/1rL04eX8Q/OEaD1SEmfyx0K
         YO7FLa0pZ1kbkvJW5lOtVvRVHRsXm/omWLKdybOjeyQH2rd+vafSxelsti6F+ylpvmuq
         59eOdZhvC5Nyz+VRpZW4ASfr4iM9ZYnzLTJagDr053lX+brAdsypxeiaIR8sH1mcTgr6
         ZXw2j6OuRRqJOH/XHcz+sh2G1bwQrjrLrBl4FkpZNLHy56RJu5jsPSr8BxbxE2i295Dd
         g5QA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d6-v6si529145qvb.143.2018.10.01.09.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 09:29:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g714o-0007nY-2y
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 12:29:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g713j-0007QK-DK
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 12:28:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g713g-0004Di-86
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 12:28:35 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53692)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g713f-0004DS-Tt
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 12:28:32 -0400
Received: by mail-wm1-f65.google.com with SMTP id b19-v6so9449711wme.3
	for <qemu-devel@nongnu.org>; Mon, 01 Oct 2018 09:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hnCWcKDB+SOeBvBkBkJP4Cxdi4HiN/MB8kZpqHsrPYg=;
	b=SRMZ9JMQDwOrO2AHjbG7yWnUDZ/reN71FDf4XEBqbuQJvxBuoLEGhUFSe7s04JYTuj
	CzZgm+H/FVSAFOk4B00AcGXLXDoLzNxISQOEXV0AAIUEGGmmtnYjhs4EEQKquE7fOabp
	mU0qTG/Dj4i+Cgzv5VtzUVsiUsc3iES0NnTsMXFIRC3JZ841GhgujLfsLkCxKDoxVJXV
	cKAqfroOz2MGzaL3kVmKPd5jk9oMZnxNaAgtPTM/p01qBkeSWa0IO4VnylIXIUKuu3MF
	8SiB4csfLCwoKVgbeNkHkyr5NKc5vnHKeDQfxVSF52TPcd4ez+719OE4vfdWlTD+9U4Q
	6/HQ==
X-Gm-Message-State: ABuFfoj+VlZQ6hsyRJFw4AZfSqNW/0sjCvSxn3f2/IvHWY+3S428Y8C6
	4Wq8WePTAZDY1SyFFwqjHsVJdQ==
X-Received: by 2002:a1c:1250:: with SMTP id 77-v6mr5757995wms.70.1538411310350;
	Mon, 01 Oct 2018 09:28:30 -0700 (PDT)
Received: from [192.168.2.71] ([80.31.72.241])
	by smtp.gmail.com with ESMTPSA id
	o3-v6sm340422wrw.93.2018.10.01.09.28.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Oct 2018 09:28:29 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-8-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e29f006b-f407-2a59-1815-f33d8b7e5d34@redhat.com>
Date: Mon, 1 Oct 2018 18:28:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181001115704.701-8-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH v2 07/15] gdbstub: add multiprocess support
 to Xfer:features:read:
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
X-TUID: SIMMF20bapy4

Hi Luc,

On 01/10/2018 13:56, Luc Michel wrote:
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
> ---
>  gdbstub.c | 44 ++++++++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 20 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 63d7913269..9065e8e140 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -792,55 +792,57 @@ static CPUState *gdb_first_cpu(const GDBState *s)
>      }
>  
>      return cpu;
>  }
>  
> -static const char *get_feature_xml(const char *p, const char **newp,
> -                                   CPUClass *cc)
> +static const char *get_feature_xml(const GDBState *s, const char *p,
> +                                   const char **newp, GDBProcess *process)
>  {
>      size_t len;
>      int i;
>      const char *name;
> -    static char target_xml[1024];

As noted in your patch #2, I'd add GDBProcess::target_xml in this same
patch.

With this change:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +    CPUState *cpu = get_first_cpu_in_process(s, process);
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>  
>      len = 0;
>      while (p[len] && p[len] != ':')
>          len++;
>      *newp = p + len;
>  
>      name = NULL;
>      if (strncmp(p, "target.xml", len) == 0) {
> +        char *buf = process->target_xml;
> +        const size_t buf_sz = sizeof(process->target_xml);
> +
>          /* Generate the XML description for this CPU.  */
> -        if (!target_xml[0]) {
> +        if (!buf[0]) {
>              GDBRegisterState *r;
> -            CPUState *cpu = first_cpu;
>  
> -            pstrcat(target_xml, sizeof(target_xml),
> +            pstrcat(buf, buf_sz,
>                      "<?xml version=\"1.0\"?>"
>                      "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
>                      "<target>");
>              if (cc->gdb_arch_name) {
>                  gchar *arch = cc->gdb_arch_name(cpu);
> -                pstrcat(target_xml, sizeof(target_xml), "<architecture>");
> -                pstrcat(target_xml, sizeof(target_xml), arch);
> -                pstrcat(target_xml, sizeof(target_xml), "</architecture>");
> +                pstrcat(buf, buf_sz, "<architecture>");
> +                pstrcat(buf, buf_sz, arch);
> +                pstrcat(buf, buf_sz, "</architecture>");
>                  g_free(arch);
>              }
> -            pstrcat(target_xml, sizeof(target_xml), "<xi:include href=\"");
> -            pstrcat(target_xml, sizeof(target_xml), cc->gdb_core_xml_file);
> -            pstrcat(target_xml, sizeof(target_xml), "\"/>");
> +            pstrcat(buf, buf_sz, "<xi:include href=\"");
> +            pstrcat(buf, buf_sz, cc->gdb_core_xml_file);
> +            pstrcat(buf, buf_sz, "\"/>");
>              for (r = cpu->gdb_regs; r; r = r->next) {
> -                pstrcat(target_xml, sizeof(target_xml), "<xi:include href=\"");
> -                pstrcat(target_xml, sizeof(target_xml), r->xml);
> -                pstrcat(target_xml, sizeof(target_xml), "\"/>");
> +                pstrcat(buf, buf_sz, "<xi:include href=\"");
> +                pstrcat(buf, buf_sz, r->xml);
> +                pstrcat(buf, buf_sz, "\"/>");
>              }
> -            pstrcat(target_xml, sizeof(target_xml), "</target>");
> +            pstrcat(buf, buf_sz, "</target>");
>          }
> -        return target_xml;
> +        return buf;
>      }
>      if (cc->gdb_get_dynamic_xml) {
> -        CPUState *cpu = first_cpu;
>          char *xmlname = g_strndup(p, len);
>          const char *xml = cc->gdb_get_dynamic_xml(cpu, xmlname);
>  
>          g_free(xmlname);
>          if (xml) {
> @@ -1246,10 +1248,11 @@ out:
>  }
>  
>  static int gdb_handle_packet(GDBState *s, const char *line_buf)
>  {
>      CPUState *cpu;
> +    GDBProcess *process;
>      CPUClass *cc;
>      const char *p;
>      uint32_t pid, tid;
>      int ch, reg_size, type, res;
>      uint8_t mem_buf[MAX_PACKET_LENGTH];
> @@ -1620,18 +1623,19 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>          }
>          if (strncmp(p, "Xfer:features:read:", 19) == 0) {
>              const char *xml;
>              target_ulong total_len;
>  
> -            cc = CPU_GET_CLASS(first_cpu);
> +            process = gdb_get_cpu_process(s, s->g_cpu);
> +            cc = CPU_GET_CLASS(s->g_cpu);
>              if (cc->gdb_core_xml_file == NULL) {
>                  goto unknown_command;
>              }
>  
>              gdb_has_xml = true;
>              p += 19;
> -            xml = get_feature_xml(p, &p, cc);
> +            xml = get_feature_xml(s, p, &p, process);
>              if (!xml) {
>                  snprintf(buf, sizeof(buf), "E00");
>                  put_packet(s, buf);
>                  break;
>              }
> 
