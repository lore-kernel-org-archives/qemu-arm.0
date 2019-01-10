Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1935530wrt;
        Thu, 10 Jan 2019 07:26:07 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4wcYQ61mc9JImHJFn4Iabbv7VKgT4l2wI2Jv2AQdcMQkrNGEeMUTIqq8AXUuc/wATpNZ9q
X-Received: by 2002:a5d:65ce:: with SMTP id e14mr9365268wrw.150.1547133967093;
        Thu, 10 Jan 2019 07:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547133967; cv=none;
        d=google.com; s=arc-20160816;
        b=ArSX8tmhfrd+LSO5u3u+5LSYWPOjq9S+drkS5JJ4hH2UhnlITUwQ/js3KqxbuqJzeQ
         LQz2Vd5zddW+2QHAaBvcc3Nk8Et/Z5Xkc4Uy0bsx2p0kL3E1+CKhyTlE3wZZumFtJQUL
         gL9K8uh5rLD1WQwrIlncvvZ5A7RTPJy0XXbgIAKrlzuwJqs63gjGWxEalVyDd7pYcUVM
         HUguRe8GRXDEdh+9LGREH2Z71/qugZiEsNU0oxp0vqB6xMJ88jUoLURmDRiGoiE+xX4e
         cDFRXPatthurVknupKaTgaEhyTiA87Q4/MNP9/WOf0Pvf/IOSe1whHg170O+AlrXYLFo
         zPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=FiQdQvzunlinmBJ9/mfrmXpi6O7Emi6v/Lrm2pEzToA=;
        b=pwChy00+gRVIRfpYXjtUNhWrV5aYMgJjc9ux08xMrPPROl/izRwQ/IeOGWghPHvwEV
         EiZQPbTV7vGrePmlyuVIIdyUcSXBvoSAYOH6qzEaPHJpefio5UQkTp7NctlzTbJkNowE
         w5OVLtb1lZt+0VM0bxRyZ6/b+oIj0+tBPpohY0GFOFf7dy8TRBOSdw2P327Ogupm7Tgz
         34kuis1+jRjeR4QTECm90IqolLIvGuEUpayrhTuF1yGavd2+fNo6WYtoL1gd5KjuNsRu
         1wT6hXmXqz0rFqfVvI80S535r7HdfCI0ZBPxeqdC3GhI8aK1+fxVJ4FTT6+wa8u6oey1
         KOfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=vpkCenxs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14si11682476wmd.139.2019.01.10.07.26.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Jan 2019 07:26:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=vpkCenxs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:50211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghcDe-00018d-6g
	for alex.bennee@linaro.org; Thu, 10 Jan 2019 10:26:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ghcDT-00018E-Vs
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 10:25:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1ghcDR-0004dI-Iu
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 10:25:54 -0500
Received: from ip135.ip-5-135-226.eu ([5.135.226.135]:53406
	helo=beetle.greensocs.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1ghcDQ-0004Xj-9q; Thu, 10 Jan 2019 10:25:53 -0500
Received: from [172.16.11.100] (tiramisu.bar.greensocs.com [172.16.11.100])
	by beetle.greensocs.com (Postfix) with ESMTPS id 6FB0497065;
	Thu, 10 Jan 2019 15:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=greensocs.com; s=mail;
	t=1547133359; bh=39a7jUKJtwxjGHmGty1AI/YJV0IOq7W6Lld2bqARUP8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=vpkCenxskVqh+Ro4WD0mW5Y6shC33YljinLS0V+3kSb8VI8+ZGQ+GWWvegtFCDLC6
	yhCtrPlEqg6dfkjSWruXlYPaKC4qNN+DmzSXQPdQhV4bnfGGOUTqAa5ob1KnNvSVw/
	69X5Rq6m7Sx6bnHbWZBrKuLb5RZNsLgcnD9pqa3Q=
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190108163008.7006-1-peter.maydell@linaro.org>
	<20190108163008.7006-5-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <ff365022-d3da-adc9-efcd-b8d013835b44@greensocs.com>
Date: Thu, 10 Jan 2019 16:15:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <20190108163008.7006-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/4] gdbstub: Simplify
 gdb_get_cpu_pid() to use cpu->cluster_index
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s1w2g74pkIOi

On 1/8/19 5:30 PM, Peter Maydell wrote:
> Now we're keeping the cluster index in the CPUState, we don't
> need to jump through hoops in gdb_get_cpu_pid() to find the
> associated cluster object.
Aah better :-)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>
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
> 
