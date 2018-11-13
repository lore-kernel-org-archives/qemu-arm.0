Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4229644wrw;
        Tue, 13 Nov 2018 03:07:08 -0800 (PST)
X-Google-Smtp-Source: AJdET5f/VqvNE/pzNBq/50HGIheL9dX7HWET5vE3lQltYMocacjR4feJAUC6tkBxbvXhD/VUFgNM
X-Received: by 2002:ac8:2eeb:: with SMTP id i40mr4567678qta.300.1542107228113;
        Tue, 13 Nov 2018 03:07:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542107228; cv=none;
        d=google.com; s=arc-20160816;
        b=OZzW3tycQhtV1oDtyxHMeCeRKLWj8kYWfKirLshnoMuohyMJIEcyFk/eW1itu7oRsK
         H2tN3tZ8cx66C9O9ika1EHtYCSSVNWxeeKx4B3u+5iKBHdrrJTRvvLV/FnCScLNRgFns
         hlS0xDOWk5KD6rbHnaTEgOk7utsls/nvZxYmGyq6mkZFMVHXzD6PtU0Gk4mVseNLftbX
         oSEtXEmruDf8JoZRGsQKsQNA2JGotIzkUb7o7omrdHYuZGhxy/haw1xMrQ/KlvPBuQnq
         bQhbc+ko8yBYPYAjhC2QW13xmRZJ+KxzDrIDUx5Fiz3FFq+pIQcCLqKJvz2dkv1i525s
         z3Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=F4WVXGPjjjHqzqyEheHwK2n4ieSfVRdjZ22078KCOZk=;
        b=npOFMkEfAAov12xPN3YxUkk5ayGQmvZeM+UajACjyrNyuynSP9BLg0NnVVhovrAlLm
         nfL71eZJ8vZpzd910aL762BK5O5BIBYoxAm6Nk+sGbPoja+mUX9oJRLbwRT43w2YMsix
         JVhhCreDuSromZpL9q2BSech48cYOMne3wDz9jrHCYpVa5g0TkciUQzmxzHBdx3h9cjn
         q9LiI9Aqo9tyLsYkaqUCug6QkxrLkmRYGu69RkkEkWYTkn9ctR0k1PONz5t4rD6RAGnJ
         J/yVpzllNPDvVc0dSASB3lhfZ5qUljFyCuofoOUsMYQGd/ekpTNm+4E2cEJUM7CYhLa6
         2iaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p2nBjqcA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v60si6514232qtd.31.2018.11.13.03.07.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 03:07:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p2nBjqcA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53176 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMWXD-00085v-GO
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 06:07:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gMWWw-00085U-Nw
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 06:06:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gMWWl-0008Bk-UB
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 06:06:46 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:37845)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gMWWl-0008BG-Hu; Tue, 13 Nov 2018 06:06:39 -0500
Received: by mail-lj1-x243.google.com with SMTP id e5-v6so10442124lja.4;
	Tue, 13 Nov 2018 03:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=F4WVXGPjjjHqzqyEheHwK2n4ieSfVRdjZ22078KCOZk=;
	b=p2nBjqcATfEmDXL0zlI+uJbmsTWC03U+SNHO31qFDdiIuf3T6pw9uQ7S3tepmSgL75
	ajovEJMZdMYRGyiSe/3R1KWLm0nwoB/P/Kh1AbugzRVISp/40gPY76dW6QX/u+MC/tNq
	E0OZ+/YjCXz169/NAnu2L/Lj9R4feUkS2UD1cVzKScGhOvE8YMNFAfBeV3j169YFUzXL
	oOUEmzW1jVH45ROWR8fmE1D6pga+LBxAhwpL558nmUrA+F9t4bVg24zn2uuCJsvsShHA
	DcDoKwatE5cdThrrWDTLDh+EK8/YJJBShv7P5sA7/JIdGYtpCBzwO9rUYdTw67RckG/D
	K23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=F4WVXGPjjjHqzqyEheHwK2n4ieSfVRdjZ22078KCOZk=;
	b=Iv0m+Y4jNIBcdyZvpAZaQdAt4aA0Uu1LLkPuW++TH1pOJNWFeXEa78CcCsMTvKD2gv
	Hcivg4FgAQDAJlwd0l1aTgM71cBSxyXTu2P/aOveS7k7gq4iXyJmh6JajzNFbKoREB7i
	ltUZvTkQv/HAUcRhdoS4LfbOwjLLlNlg38hjoh9YRHCIJpcxXG++qUP5jGffYHpczU2j
	r6495VKzLZ1vb3jtvMyPS8cHyNpDlQuChxyOemQMutdnDLeQajM/gETN1OJMy6BBsV1n
	vP+SESlax9OGr0D/nBG6B8KJaXUKxGXspRjxNWlGcsE1ePWyR90YpwLppRoMNOZvSt8t
	bthA==
X-Gm-Message-State: AGRZ1gKNJkkFokN6Mg7FIocoAN1agVcCH4eZkv06cOFC6isegfhJYV6q
	5faM+oi2n4Y3jv4GarAlA5k=
X-Received: by 2002:a2e:824c:: with SMTP id
	j12-v6mr2766228ljh.168.1542107197962; 
	Tue, 13 Nov 2018 03:06:37 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	1-v6sm2021368lju.61.2018.11.13.03.06.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 03:06:36 -0800 (PST)
Date: Tue, 13 Nov 2018 12:06:36 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Message-ID: <20181113110636.GH1148@toto>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
	<20181110081147.4027-4-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181110081147.4027-4-luc.michel@greensocs.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v5 03/16] gdbstub: add
 multiprocess support to '?' packets
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
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tnQi8l60whqY

On Sat, Nov 10, 2018 at 09:11:34AM +0100, Luc Michel wrote:
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


This is also theoretical but:
When looking at this, it seems like you could have lazily created
the s->processes array entries (if you find a cluster but the
no valid entry in s->processes). Then we could perhaps eliminate the
scan of all objects at startup and also support CPU/Cluster hotplug.

Anyway, this looks good to me!
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Cheers,
Edgar


> ---
>  gdbstub.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 0d70b89598..d26bad4b67 100644
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
> +    /*
> +     * Retrieve the CPU parent path by removing the last '/' and the CPU name
> +     * from the CPU canonical path. */
> +    path[strlen(path) - strlen(name) - 1] = '\0';
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
> -        snprintf(buf, sizeof(buf), "T%02xthread:%02x;", GDB_SIGNAL_TRAP,
> -                 cpu_gdb_index(s->c_cpu));
> +        snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
> +                 gdb_fmt_thread_id(s, s->c_cpu, thread_id, sizeof(thread_id)));
>          put_packet(s, buf);
>          /* Remove all the breakpoints when this query is issued,
>           * because gdb is doing and initial connect and the state
>           * should be cleaned up.
>           */
> -- 
> 2.19.1
> 
> 
