Received: by 10.223.172.38 with SMTP id v35csp7113882wrc;
        Tue, 12 Sep 2017 07:11:12 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAI8NaGk/aHyQUhh4zR91hzconBxdU7Vw5+Aa1PWuuG4PG63+MXqJnR5SqrQZKzNjFhMCWC
X-Received: by 10.55.48.8 with SMTP id w8mr21097833qkw.139.1505225472146;
        Tue, 12 Sep 2017 07:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505225472; cv=none;
        d=google.com; s=arc-20160816;
        b=m046lbFGeWseo15xLqCdvpHyw9FlQzXrfXn0TE7BK/pCdlu7Pvrb3dcNaz6qiQfwPG
         A0staKDpnDPhAFheSufdI/dgBmmdlgO/lUNO3S1E8ECoIfKLpyXWO/FceUFooImFUPSD
         ZKVDJJL+hCEiHkiLtPZjDWtUpcDanGVjpp7t+M2qeih0T6ZQS4NVFzsu326wRinLNkxd
         KjbvDifVhnhk67TYo5SMAAxvw0DJFzrokrlC53SiOvcQL7o4AgvsLOg2lgpP/MKw9+RK
         /l2VjnXmYncQg9RMk+5uZsJZL1Cd1aEXyWNpTC351Bo7UZ/3l9hJfu6f8/thBLbpOkRZ
         +LHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=nkhPPl5EknMDD6azQKFSXFkzQ3yJgxae5wU0TBYtyF4=;
        b=Z7W0cu1uOwUIp0vUya11SFbBM3CNNRetkyUWa37kLvqhw0gf+ODgh6vvHchVa/vOzg
         1QuYleDxEOB70eL/19fBkjTMRl5b1iNqTZbY/dXJA9wBMsE7JspzMlOwmdHnb+CNj1mO
         2FdeWdiciKXSZasgKfcYDAYUTlJuNCrI6943xIaYKbYQYX2H7RcES7Dc0eptmP2WW8ZS
         I5skRuT0a6Zt3wg64ik3ZhL3ZpyTHRH71XYNw3aQsL3WruP8Y7+1nfH0r2Vrk52VZBpi
         Xlv4BTI/YzJkEp7Un0VUU9K9jN/9EtY1phzO9OSHQmppQU3gh5TDcEY5iMv62lAi/zCu
         gtnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k3si11936301qke.460.2017.09.12.07.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 07:11:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36116 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drlu9-0005i0-QO
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 10:11:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1drlu1-0005gi-6b
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:11:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1drltv-0001lI-JX
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:11:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1drltv-0001kF-DN; Tue, 12 Sep 2017 10:10:55 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B1A4267D8;
	Tue, 12 Sep 2017 14:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7B1A4267D8
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.40.204.137] (ovpn-204-137.brq.redhat.com [10.40.204.137])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D86F966835;
	Tue, 12 Sep 2017 14:10:50 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912140149.7692-2-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <01253a14-2254-dc47-c4ac-dbcb87bfd5ad@redhat.com>
Date: Tue, 12 Sep 2017 16:10:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170912140149.7692-2-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 12 Sep 2017 14:10:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 1/3] hmp: fix "dump-quest-memory" segfault
 (ppc)
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
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M2uDv3v2vA5z

On 12.09.2017 16:01, Laurent Vivier wrote:
> Running QEMU with
>     qemu-system-ppc64 -M none -nographic -m 256
> and executing
>     dump-guest-memory /dev/null 0 8192
> results in segfault
> 
> Fix by checking if we have CPU, and exit with
> error if there is no CPU:
> 
>     (qemu) dump-guest-memory /dev/null
>     this feature or command is not currently supported
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  target/ppc/arch_dump.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
> index 8e9397aa58..95b9ab6f29 100644
> --- a/target/ppc/arch_dump.c
> +++ b/target/ppc/arch_dump.c
> @@ -224,8 +224,15 @@ typedef struct NoteFuncDescStruct NoteFuncDesc;
>  int cpu_get_dump_info(ArchDumpInfo *info,
>                        const struct GuestPhysBlockList *guest_phys_blocks)
>  {
> -    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
> -    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
> +    PowerPCCPU *cpu;
> +    PowerPCCPUClass *pcc;
> +
> +    if (first_cpu == NULL) {
> +        return -1;
> +    }
> +
> +    cpu = POWERPC_CPU(first_cpu);
> +    pcc = POWERPC_CPU_GET_CLASS(cpu);
>  
>      info->d_machine = PPC_ELF_MACHINE;
>      info->d_class = ELFCLASS;
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>
