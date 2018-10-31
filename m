Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp80472wro;
        Wed, 31 Oct 2018 16:48:25 -0700 (PDT)
X-Google-Smtp-Source: AJdET5c3iuYOBtn2fdfU+6pQdcvwX+5Y+75PlQBlHgOR0cNkkZ7JtvVAid7eAb9mQjET6CC7m0pt
X-Received: by 2002:ac8:1289:: with SMTP id y9-v6mr14833qti.47.1541029705363;
        Wed, 31 Oct 2018 16:48:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541029705; cv=none;
        d=google.com; s=arc-20160816;
        b=M4vhlBAq0n13DCPw0KxQ/XVzTvkUu9QkDPyP7zGo9SOUIIMTEVkZFcO+xw1VTOeekJ
         /+hcRvZEgBc2enZRSqMt94p031qKJ/8KWRVnJIgJPVP1ZiPX0CqOGm6VrxCAME0rMn2Y
         ZS1mqCl2qKj3V3AG83FUECHy0zH5P68BwafjlRa4/uXRnVHPwX/WZp8l+zrF0HkUIe1i
         wz4kjGoMAjmLMRPnA31Q47hI0r24pt2MaYHViALAPm4InM2d+DI4U4Ba/zN1cT3pB51k
         z+CsoT0DV90MnfE4mYem5zABT6E8k62fOkmjBVPF3cCjI/CVwRsfbn8DHpr2OfMmMMtz
         RwcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=kaPG4amynBZa8WeWE/JMGhbNBumbogMiswRfeOzbFbg=;
        b=zoI7wwBdjktVCRW7WVU9P8A7nHxTzVlIq9hfeCYePZN2yuCqp7fdTGQ+QZiElGSK8i
         MYp8m1LjhEzH5Fmfu2ia9guHVNcpmUZ6GKBvXplSSO3cmdeJUVmR1vJJDPRe4JScSkEg
         yuyD/xmwKdwFY2DBW4XYTXl+sG7+BBv6+HDGGJYbvTdFU/VfCAf7ZfTcCz8fJ70axak2
         dxqIDCu5Vl/YVN4J9m7JRvHdM+Gv6L2uf9uQsr8OdCEbXiJzUlyb98A+WbPOz/cNNj5Q
         23gWUHcC+5q6GNwxWHRJc60q7qjoRXbYdqV+I4V389nyZvl+laswMtxgquokhzzVXsms
         ua4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uQIWbVka;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y39-v6si4191590qth.357.2018.10.31.16.48.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 Oct 2018 16:48:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uQIWbVka;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34055 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gI0Do-00047e-Rj
	for alex.bennee@linaro.org; Wed, 31 Oct 2018 19:48:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gI0Dc-00041A-Fs
	for qemu-arm@nongnu.org; Wed, 31 Oct 2018 19:48:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gI0DY-0006vL-Sv
	for qemu-arm@nongnu.org; Wed, 31 Oct 2018 19:48:12 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35254)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gI0DY-0006uA-Jg; Wed, 31 Oct 2018 19:48:08 -0400
Received: by mail-pf1-x444.google.com with SMTP id z2-v6so5798825pfe.2;
	Wed, 31 Oct 2018 16:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=kaPG4amynBZa8WeWE/JMGhbNBumbogMiswRfeOzbFbg=;
	b=uQIWbVkaXHi8HJ7Xb/Xu7cq1uW0YgJouX/wNrAO8eDwOLq1mS12K4881aU2/hvIhe0
	nW3Z4niPnaeWO6Jjcvr8lTIdYCgtYE+AXZGRR5Vqj6tc7WHIOgV4nTQhyzTJ0aE9kT5O
	dywysDv6ShJX2/mNLLojHfVQhghkMk+ILDM8kZ/6g7tCLfcPOoaca1OVfO6uxN3jdMTc
	v7FY36yTKTXALdzFAoP+NbtU9+SuEDRHdsr+Oz98PBQD3Nd10Y2mPGnUX4kXvKLAAZSC
	ccX93kPKaZKSQOCr8VuztrTrsqiMmFQR840hqcVzCGmNTjrsPLXMe2xQvuKVDcJwB3Mn
	eLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kaPG4amynBZa8WeWE/JMGhbNBumbogMiswRfeOzbFbg=;
	b=tYUVcoAO/8V4X2VqL4xCvAkuso7LMLOaSHPbfHdWYnZMycflOPoyufUr3xJZ+R+QUr
	/AFaOW0vx2x23lbYuEz2rWzUpB/wczl5Ef4BQ6ZFQA5brg9VMLswJZN/PJ5BAAfXJd29
	qZaOlLYZP2xolknoB/759yX0LLtl0rziEXGlmqIjWnUogdvfz5fO1MTtM+mdX8jxBJdj
	yWYpQRFy+I47nLxfikWuEXeqlzDE+1a/vNKv0rPt2ZCfhp9u7rp3yHdkSGsWMdtwGDIe
	szgz9tLev1RaPNSB1t4fTgnHZ/rFMdnNAWfx7CzMmsHkKTYMuv+0bHtgrdUEmJgsTf+n
	9WAw==
X-Gm-Message-State: AGRZ1gIe03cTlljq4dHQBN1GwR6EhlEDKwmZeiKMHT+0ngJWLZ1hw++n
	qRSdVRiTFOJsET9mP6e5wWMTC9bU
X-Received: by 2002:a63:4450:: with SMTP id t16mr4973178pgk.102.1541029686753; 
	Wed, 31 Oct 2018 16:48:06 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	d187-v6sm39775095pfc.60.2018.10.31.16.48.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 16:48:05 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181026081653.24602-1-luc.michel@greensocs.com>
	<20181026081653.24602-4-luc.michel@greensocs.com>
From: Alistair <alistair23@gmail.com>
Message-ID: <3b5854a8-66d5-a8ea-4f60-8e2534d5e0d5@gmail.com>
Date: Wed, 31 Oct 2018 16:48:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181026081653.24602-4-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 03/16] gdbstub: add
 multiprocess support to '?' packets
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
X-TUID: hSxVRWn4CWG3

On 10/26/18 1:16 AM, Luc Michel wrote:
> The gdb_get_cpu_pid() function does the PID lookup for the given CPU. It
> checks if the CPU is a direct child of a CPU cluster. If it is, the
> returned PID is the cluster ID plus one (cluster IDs start at 0, GDB
> PIDs at 1). When the CPU is not a child of such a container, the PID of
> the first process is returned.
> 
> The gdb_fmt_thread_id() function generates the string to be used to identify
> a given thread, in a response packet for the peer. This function
> supports generating thread IDs when multiprocess mode is enabled (in the
> form `p<pid>.<tid>').
> 
> Use them in the reply to a '?' request.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>   gdbstub.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 096ac8e99c..9ca743a4c6 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -638,10 +638,49 @@ static int memtox(char *buf, const char *mem, int len)
>           }
>       }
>       return p - buf;
>   }
>   
> +static uint32_t gdb_get_cpu_pid(const GDBState *s, CPUState *cpu)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    gchar *path, *name;
> +    Object *obj;
> +    CPUClusterState *cluster;
> +    uint32_t ret;
> +
> +    path = object_get_canonical_path(OBJECT(cpu));
> +    name = object_get_canonical_path_component(OBJECT(cpu));
> +
> +    if (path == NULL) {
> +        ret = s->processes[0].pid;
> +        goto out;
> +    }
> +
> +    path[strlen(path) - strlen(name) - 1] = '\0';

Can you add a comment here of what you are doing and why you are 
removing the name?

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +
> +    obj = object_resolve_path_type(path, TYPE_CPU_CLUSTER, NULL);
> +
> +    if (obj == NULL) {
> +        ret = s->processes[0].pid;
> +        goto out;
> +    }
> +
> +    cluster = CPU_CLUSTER(obj);
> +    ret = cluster->cluster_id + 1;
> +
> +out:
> +    g_free(name);
> +    g_free(path);
> +
> +    return ret;
> +
> +#else
> +    return s->processes[0].pid;
> +#endif
> +}
> +
>   static const char *get_feature_xml(const char *p, const char **newp,
>                                      CPUClass *cc)
>   {
>       size_t len;
>       int i;
> @@ -907,10 +946,23 @@ static CPUState *find_cpu(uint32_t thread_id)
>       }
>   
>       return NULL;
>   }
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
>   static int is_query_packet(const char *p, const char *query, char separator)
>   {
>       unsigned int query_len = strlen(query);
>   
>       return strncmp(p, query, query_len) == 0 &&
> @@ -1018,22 +1070,23 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>       const char *p;
>       uint32_t thread;
>       int ch, reg_size, type, res;
>       uint8_t mem_buf[MAX_PACKET_LENGTH];
>       char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
> +    char thread_id[16];
>       uint8_t *registers;
>       target_ulong addr, len;
>   
>       trace_gdbstub_io_command(line_buf);
>   
>       p = line_buf;
>       ch = *p++;
>       switch(ch) {
>       case '?':
>           /* TODO: Make this return the correct value for user-mode.  */
> -        snprintf(buf, sizeof(buf), "T%02xthread:%02x;", GDB_SIGNAL_TRAP,
> -                 cpu_gdb_index(s->c_cpu));
> +        snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
> +                 gdb_fmt_thread_id(s, s->c_cpu, thread_id, sizeof(thread_id)));
>           put_packet(s, buf);
>           /* Remove all the breakpoints when this query is issued,
>            * because gdb is doing and initial connect and the state
>            * should be cleaned up.
>            */
> 
