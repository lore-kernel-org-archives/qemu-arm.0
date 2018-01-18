Received: by 10.28.173.206 with SMTP id w197csp6897390wme;
        Thu, 18 Jan 2018 11:10:40 -0800 (PST)
X-Google-Smtp-Source: ACJfBosW07qNKrgWFc7SSH31Z6qNrTm4gZ9A6eKDh76R0/GrDw/9dIKCWBzL27Sq31C9iyA4RUko
X-Received: by 10.37.233.13 with SMTP id n13mr24150202ybd.220.1516302640287;
        Thu, 18 Jan 2018 11:10:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516302640; cv=none;
        d=google.com; s=arc-20160816;
        b=CB3VWg9RNLZUH+UORr69j96EuFKPVWs8JIvbFPe0pjBFI3ONSmVwfNJoQAWmS99WbQ
         8SnYjSfkybaCoWlv+mKz5sL2s16xJKgKjU3w+FRwLeYNt6NXFrnHZixowzGEmY64BqMe
         34UzkHk66X+Ytw+XE0ruze0LdSfe8txn6pGSNgcyEuBnDetGOmcuMZo2O0MvwhVLdZ/K
         RwfUOSH7iosgYh3bM73PI/cq+n4q4Zg1vtkyiwiVgcCJYyTIl1jX92Bl3hO2t/PFsZ6z
         PH5U+n1EeTaFlsHFgyok3C7NNov21bhhhsdHaXw5Xsmpk+iU1IwNEwIX57CqTjPWJn7N
         MdZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=9MgfBBQbzveGn/hMXWWlxBdgW/9sK4wIPqP2+Rzw+P8=;
        b=udGKGprmjPMGRFPpzkDHlyPfEOKxL1MU7ax+gIE9Y8abo1QPobPoPViGXAkRDXNdAS
         Vg1oen/eFqKfqdCWHz+RKHyPetFPI2wGi6yjbGk55wqd48LQgJ74Sc17Qd+YCPxVIvkZ
         MAYg+jt6GrJflbyGboVkbZoKwMqMl74MZWuZ/CMxPsLFGB99+TR0UJ6UfniojTjVDqqc
         dJssKVbjn2BwosEWfGGdV5O8s79ZtYeL9PHx/9h2fl1Mkl2OWCgliHN+DtcRRn/zTDuf
         FrQ45oF+SXuDMZzW9+KKFxGVVKEHQ4MbQgbrmUsrhOMVDnNSv4e2oV3MCecIYGpSOOM2
         Lf9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x15si244771ybk.779.2018.01.18.11.10.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 11:10:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecFaB-0002iF-OS
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 14:10:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ecFZz-0002gp-4T
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 14:10:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ecFZv-00012w-Oa
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 14:10:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:65442)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ecFZv-00011P-5n; Thu, 18 Jan 2018 14:10:23 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0BB8122E65;
	Thu, 18 Jan 2018 19:10:22 +0000 (UTC)
Received: from [10.40.204.87] (ovpn-204-87.brq.redhat.com [10.40.204.87])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04B4480D9E;
	Thu, 18 Jan 2018 19:10:09 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
	<1516296842-136976-4-git-send-email-imammedo@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4ce4d727-b010-8cdb-7d45-518265ba519e@redhat.com>
Date: Thu, 18 Jan 2018 20:10:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1516296842-136976-4-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 18 Jan 2018 19:10:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-ppc] [RFC v2 3/5] linux-user: prepare for
 switching to cpu_create() API
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4OvEkeStGY/1

On 18.01.2018 18:34, Igor Mammedov wrote:
> temporarily add #ifdef CPU_RESOLVING_TYPE in linux-user/main.c
> so that  each target could gradually switch to cpu_create() and
> not converted yet could continue to use cpu_init().
> 
> Once all targets are converted
>     temporary ifdefs and cpu_init() API
> will be removed
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  linux-user/main.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 450eb3c..d481e8c 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -44,6 +44,7 @@ static const char *argv0;
>  static int gdbstub_port;
>  static envlist_t *envlist;
>  static const char *cpu_model;
> +static const char *cpu_type;
>  unsigned long mmap_min_addr;
>  unsigned long guest_base;
>  int have_guest_base;
> @@ -3847,7 +3848,7 @@ void init_task_state(TaskState *ts)
>  CPUArchState *cpu_copy(CPUArchState *env)
>  {
>      CPUState *cpu = ENV_GET_CPU(env);
> -    CPUState *new_cpu = cpu_init(cpu_model);
> +    CPUState *new_cpu = cpu_create(cpu_type);
>      CPUArchState *new_env = new_cpu->env_ptr;
>      CPUBreakpoint *bp;
>      CPUWatchpoint *wp;
> @@ -4362,7 +4363,17 @@ int main(int argc, char **argv, char **envp)
>      tcg_exec_init(0);
>      /* NOTE: we need to init the CPU at this stage to get
>         qemu_host_page_size */
> +
> +#ifdef CPU_RESOLVING_TYPE
> +    cpu_type = cpu_parse_cpu_model(CPU_RESOLVING_TYPE, cpu_model);
> +    if (!cpu_type) {
> +        exit(1);
> +    }

That if-statement looks like it should be an assert(cpu_type) instead?

> +    cpu_create(cpu_type);
> +#else
>      cpu = cpu_init(cpu_model);
> +    cpu_type = object_class_get_name(object_get_class(OBJECT(cpu)));
> +#endif
>      env = cpu->env_ptr;
>      cpu_reset(cpu);

 Thomas
