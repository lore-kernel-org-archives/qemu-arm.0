Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4731528wrt;
        Sun, 25 Nov 2018 13:22:53 -0800 (PST)
X-Google-Smtp-Source: AJdET5cpRMHgEKVhKLfFueFW1bKeVMpR8kL08motQpvRGFQ13pUHCFBU2lf6MzTHVZNNCl/ygJ47
X-Received: by 2002:a81:a40d:: with SMTP id b13-v6mr25416615ywh.345.1543180973625;
        Sun, 25 Nov 2018 13:22:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543180973; cv=none;
        d=google.com; s=arc-20160816;
        b=yI6K69vz8XTEqrw7Q7nwIwQgqgzK7ouLvOY4YDwBHQR9rxtqnqYgLNu5WyO6qnb8AK
         8c1JiVH+msyXKWopH/mAOpGL7CqTrgW6WHtzyjyp0FX4Gjmhgo2sfM4hO1WD2j9FOz94
         TbO2QyLDiT9zZy+NMawk+n9kMvJSdmiKfNg0ptCW4nFm/w3qvZ/HnJ08nooyn4Lmp7JY
         Zh/1R+KbM+RGTufoEVpHAh5dzeVmCMmrWpfhpPSqB1Mju/kBcXXjqyGjafaxG4YW/Iff
         87D9ZPcLSEBf/w44kkftX9xtIpKmd/J/O/TYB1MXYhhpokw029odjbjGvZ/xW4iNRofU
         ibrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=mN7BTJgADa49z/qc0LK5Bcbyhm3cG15hnAaSOrbOUGg=;
        b=Y1FA1cF8s1SO1EtOZEfen0/FZXir18JiZfFnn7e8g3LGIe9WeYNMAzhkCbKcdRvJNm
         Tj52HyDr5xV23NpaQBPsBzhEpzIvAUmTcFUoJHLGYYAyWjUt5kTYzbJh7EFkZ1dIn3he
         BbU/bf9Xff5WFtNzmEeYgKMjiwDegN69cJ1Rva62/MyqjM3Hr2pdN+CVryNYu7KN0dTH
         hulhhIU610N+t2W2JtlHXQBu4Nc4KGY0H/2R/Z4xWOFwj7xE4WA6hEBbGab5Cfq4HZme
         11XFO22c2ADGf9PKVL3KZWGXt9piZSu94MnKmTCnN4HGqB/WJUZouVA49JzLXB3MGK/7
         EI3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u190-v6si3312267ybg.326.2018.11.25.13.22.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Nov 2018 13:22:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gR1rh-0003cC-2E
	for alex.bennee@linaro.org; Sun, 25 Nov 2018 16:22:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1rE-0003ZR-Te
	for qemu-devel@nongnu.org; Sun, 25 Nov 2018 16:22:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1rB-0007Io-L3
	for qemu-devel@nongnu.org; Sun, 25 Nov 2018 16:22:24 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36073)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gR1rB-0007IU-Em
	for qemu-devel@nongnu.org; Sun, 25 Nov 2018 16:22:21 -0500
Received: by mail-wm1-f67.google.com with SMTP id s11so16417145wmh.1
	for <qemu-devel@nongnu.org>; Sun, 25 Nov 2018 13:22:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mN7BTJgADa49z/qc0LK5Bcbyhm3cG15hnAaSOrbOUGg=;
	b=DGFU6JO3wFegWw85hv/qiY/lzN9QYgk5WHTwoLc6sUgUiPkG99+elPEjJy/6RAlphZ
	PUOhfGkyjfZ+Zczbttkm4j7kyCvgGTBHpA79RxSYwyABkWFni5HqGuX3MT4YhdrozPbR
	N1QehjyLuhkrPFzBoxFsmKzoZs4/BrAVYG3Gn/Ob+TsS/lIrF6qBxYYO8tC7sn3eMqcL
	vnOPemKskOQv2hv6V/E6cstIuglx4kot7GZA3CHBpJnkaS/eW6DuB9V1nZui2XyB+FZ9
	TJPIPJoKYsbpAQ5evwOFEJB9/t0AUDVRQ9zEEkI0muHHze4Bg6kUyDl1qDktEOTsQWDt
	ZDjw==
X-Gm-Message-State: AGRZ1gJ4QIqPndtCwdn0Zz0gJ9dWXpyH4B6dutDK3HjjCzb4M1H8omcL
	2KjP+HRo8vtT6TwyAfRwV9SpuQ==
X-Received: by 2002:a1c:ce0e:: with SMTP id e14mr22356786wmg.53.1543180940371; 
	Sun, 25 Nov 2018 13:22:20 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id g2sm8070093wrw.78.2018.11.25.13.22.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Nov 2018 13:22:19 -0800 (PST)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-4-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <970cc3ab-f93b-75c2-f3f0-86a1ddc75ca7@redhat.com>
Date: Sun, 25 Nov 2018 22:22:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181123091729.29921-4-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH v7 03/16] gdbstub: add multiprocess support
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LcRSaC/HrVoK

Hi Luc,

On 23/11/18 10:17, Luc Michel wrote:
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
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  gdbstub.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 26f5a7449a..4fbc05dfe3 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -638,10 +638,52 @@ static int memtox(char *buf, const char *mem, int len)
>          }
>      }
>      return p - buf;
>  }
>  
> +static uint32_t gdb_get_cpu_pid(const GDBState *s, CPUState *cpu)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    gchar *path, *name;

Setting ...

       gchar *path, *name = NULL;

> +    Object *obj;
> +    CPUClusterState *cluster;
> +    uint32_t ret;
> +
> +    path = object_get_canonical_path(OBJECT(cpu));
> +    name = object_get_canonical_path_component(OBJECT(cpu));

... we might move this line ...

> +
> +    if (path == NULL) {
> +        ret = s->processes[0].pid;
> +        goto out;
> +    }

... here:

       name = object_get_canonical_path_component(OBJECT(cpu));

> +
> +    /*
> +     * Retrieve the CPU parent path by removing the last '/' and the CPU name
> +     * from the CPU canonical path. */
> +    path[strlen(path) - strlen(name) - 1] = '\0';

Can we get there with path != NULL && name == NULL?

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

[*]

> +    return s->processes[0].pid;
> +#endif
> +}
> +
>  static const char *get_feature_xml(const char *p, const char **newp,
>                                     CPUClass *cc)
>  {
>      size_t len;
>      int i;
> @@ -907,10 +949,23 @@ static CPUState *find_cpu(uint32_t thread_id)
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
> @@ -1018,22 +1073,23 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
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

Is this comment still relevant?

If so, wouldn't it be better placed in [*]?

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
