Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6454123wrt;
        Mon, 21 Jan 2019 12:28:44 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7yHa8NlarEAvmRcQXQ3th7t7mxzIvCeHZYwr5qD8YhT6Vw8+B5dD9sUhprdveqwE1fQQ3+
X-Received: by 2002:adf:f550:: with SMTP id j16mr29254963wrp.258.1548102524231;
        Mon, 21 Jan 2019 12:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548102524; cv=none;
        d=google.com; s=arc-20160816;
        b=ES90cz6q/JYRjsB7I28VStMAU9jLgzRNVD0uVabRsmpTnC0m08KjlqFtajvi6yg+bd
         EdWJFc9AjADfAOypq2aqdPooOp3lP29YhffqTaiqvMugBQZo0HpLCRWMzmm27uZdUuqz
         Rdd8N419+8ZT6bcC3bAQVD7qZN9OGiBRMIJj/uVw0L69fHoogbroky1pDIRz67YQVTkd
         4Dq1JM12PYvwY66JryJ8d8n2iOWa/d05wyjshUquVcDr0pzubB3DciASJ/MTSC2NvseS
         jCa5975mLpRPQ90kJ/brwJm7iGYX0JRUytk7kQhaqjiavWCKzOFyyowY7gV4QFYNaVKw
         Sg6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=An5+TEqiNM2hiyMHO8TAbISzMZ+fLzZ2LIb0ZqRNDdk=;
        b=uM0IRxZMN4yTU3O9vl+/cWPFL0tPn0YheKOcBZUOSXy6CGTa+TwHGhPVly8AzV6itZ
         QNmTUTByPO0OyUclvBdAZ3KXjLJzWQP7VWU8/P6MyoIehrrcaPSYl4a/ahRZ4G7aSC4R
         +LPLOey2lcBiLIPNvyMWmB7V3Jy+EONtMK1wdv10kelOhhwiS5ReqePe0I+t6Gw0TvDc
         WeNXcjNeta6umnmuLxJ9D2zcLr3z4MeQlp9fSrh/Miw1iyGUYeVnzI2S4eS1P8WHHIws
         H5hw01Vk2tsERBenht9x3kuDJXXXqH71ZVl/G/GgD3n8/z5Sdkvrv0VG1g6iR6DLakXb
         ZQOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eynRSBQU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5si66648166wrs.105.2019.01.21.12.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 12:28:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eynRSBQU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:59497 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glgBX-0006zz-6R
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 15:28:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1glg98-0005lR-Cn
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 15:26:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1glg96-00047i-JR
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 15:26:14 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:37915)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1glg94-00045k-AZ; Mon, 21 Jan 2019 15:26:10 -0500
Received: by mail-ed1-x541.google.com with SMTP id h50so17563946ede.5;
	Mon, 21 Jan 2019 12:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=An5+TEqiNM2hiyMHO8TAbISzMZ+fLzZ2LIb0ZqRNDdk=;
	b=eynRSBQUMwz/A7V9vLsPpB4f02FaUUpeHz2MfYeKNLLt34klMZoDMPdxFBhjrYinZf
	iw6Lf/WwNNby3+FhdvaNm2iI6pBhRrhKbpSSreH33t1tTFkl8WRm4r3XyIYyMoOPTNqN
	Irq09tJEYlfoOWiO1lZWcRp/2mfbkUy0NwyjJMP9J68GmZ+24PqRNAlcZwElblZ0pav9
	jhCcUnESTTPNzA7N7lKKl6BClsmpDx4ak+0rmCVe0gU/3332b46cN/C8BICqIxjCDFK1
	CBhWDzVY+dj0pw3pC2Hb5xxVNNKnCObPCjbqy0pHkXB94zNQjARW9W454byd/KG238fc
	W9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=An5+TEqiNM2hiyMHO8TAbISzMZ+fLzZ2LIb0ZqRNDdk=;
	b=PEIsegasRND6dIgv5NEcZ1y49Ne73Q61W61navsScLvTFADG/tiGCecvFnyPGuguXa
	0CKVJJzmPYng2eUEHgW2snD1g5qqlV9N0wHvBVeFmvR4P8XvyqPC5iOSQPr/iJNFrw92
	YV19ICvbE27n3/acLCBGCwHQCLs1ytycKvsVRHNUrEy/QVDUjHCv4GFX2Rhv9+5oYuq2
	DY17Fn6cufejDB3hqPvfPDAhQ5jxjqYh5+91aGSSIa23jEOj5iHo9Q/ZAwkDQP36tFs/
	tQK+D+Li1Eo0HhXBs3BVUYVhC+V3qYjVTWPMdnLdaaswkjExXT1M4jACWnaIi8bGjh5h
	pJ3g==
X-Gm-Message-State: AJcUukcNLCx9dQpsJVzzHz0JkiDY7p1XhcMQTtaHYzsKYvH8L+RhV1Yn
	bjMQTQbKau7WW/8Jtci7B9Y=
X-Received: by 2002:a50:9a01:: with SMTP id o1mr28840643edb.82.1548102368784; 
	Mon, 21 Jan 2019 12:26:08 -0800 (PST)
Received: from localhost ([149.199.80.131]) by smtp.gmail.com with ESMTPSA id
	p36sm9378487edc.78.2019.01.21.12.26.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Jan 2019 12:26:08 -0800 (PST)
Date: Mon, 21 Jan 2019 12:25:36 -0800
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190121202536.GC21062@toto>
References: <20190121152218.9592-1-peter.maydell@linaro.org>
	<20190121152218.9592-5-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190121152218.9592-5-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-devel] [PATCH v3 4/4] gdbstub: Simplify gdb_get_cpu_pid()
 to use cpu->cluster_index
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	"Emilio G . Cota" <cota@braap.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tZ0h1Yn/P44o

On Mon, Jan 21, 2019 at 03:22:18PM +0000, Peter Maydell wrote:
> Now we're keeping the cluster index in the CPUState, we don't
> need to jump through hoops in gdb_get_cpu_pid() to find the
> associated cluster object.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Luc Michel <luc.michel@greensocs.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  gdbstub.c | 48 +++++-------------------------------------------
>  1 file changed, 5 insertions(+), 43 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index bfc7afb5096..5d6cbea9d35 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -644,50 +644,12 @@ static int memtox(char *buf, const char *mem, int len)
>  
>  static uint32_t gdb_get_cpu_pid(const GDBState *s, CPUState *cpu)
>  {
> -#ifndef CONFIG_USER_ONLY
> -    gchar *path, *name = NULL;
> -    Object *obj;
> -    CPUClusterState *cluster;
> -    uint32_t ret;
> -
> -    path = object_get_canonical_path(OBJECT(cpu));
> -
> -    if (path == NULL) {
> -        /* Return the default process' PID */
> -        ret = s->processes[s->process_num - 1].pid;
> -        goto out;
> -    }
> -
> -    name = object_get_canonical_path_component(OBJECT(cpu));
> -    assert(name != NULL);
> -
> -    /*
> -     * Retrieve the CPU parent path by removing the last '/' and the CPU name
> -     * from the CPU canonical path.
> -     */
> -    path[strlen(path) - strlen(name) - 1] = '\0';
> -
> -    obj = object_resolve_path_type(path, TYPE_CPU_CLUSTER, NULL);
> -
> -    if (obj == NULL) {
> -        /* Return the default process' PID */
> -        ret = s->processes[s->process_num - 1].pid;
> -        goto out;
> -    }
> -
> -    cluster = CPU_CLUSTER(obj);
> -    ret = cluster->cluster_id + 1;
> -
> -out:
> -    g_free(name);
> -    g_free(path);
> -
> -    return ret;
> -
> -#else
>      /* TODO: In user mode, we should use the task state PID */
> -    return s->processes[s->process_num - 1].pid;
> -#endif
> +    if (cpu->cluster_index == UNASSIGNED_CLUSTER_INDEX) {
> +        /* Return the default process' PID */
> +        return s->processes[s->process_num - 1].pid;
> +    }
> +    return cpu->cluster_index + 1;
>  }
>  
>  static GDBProcess *gdb_get_process(const GDBState *s, uint32_t pid)
> -- 
> 2.20.1
> 
