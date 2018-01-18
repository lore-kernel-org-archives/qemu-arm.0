Received: by 10.28.173.206 with SMTP id w197csp6978091wme;
        Thu, 18 Jan 2018 12:33:51 -0800 (PST)
X-Google-Smtp-Source: ACJfBouhjQPxQfWifASsdarjbADoN3Uf0bamRcuOvSU5g9XrwjBk2RYOspAr9iAZCh8eNyMwT3jX
X-Received: by 10.129.153.147 with SMTP id q141mr6436093ywg.107.1516307631837;
        Thu, 18 Jan 2018 12:33:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516307631; cv=none;
        d=google.com; s=arc-20160816;
        b=R4yyX0i9aOR2uDLMJWrbXRY5wajgEUc+rFl3KKz9cx5n8m9kboQI3ibr1QR2sjEUs4
         Ic7EmfFkLeE9OS72loTIuFMkUzf5/bpoVtzESA057H3gdslybwEUcC0L9ctUnYrNFZKu
         4AtIz/AQryz2+oYVYqtlJr0UHyEefIpX7nNDpwkiHY/mseJLipIIBauH5724NatRAHwS
         iwvckZgmTWHtucj7uQcZSsiUaDnqVfrs35wCRk1FmWiVf2dz403VWOqR4D8S6P2UaLqT
         Pd9ppMW1N9fUWkcxflKS/UiOew9/aNnKWrAoV1CTiSeXT+xLlxHO0GLAeUG1uWUsnh7z
         poDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=B6uNErhgw9OqcPYSL5jTwhnwc05m57mBmFa8CPZH8CE=;
        b=kYdLTazCS0o8AiSKXAAUtvmk5W9Hs3O2uFhlC3y377K2BngT9CT4pulT3gJSNLTDuo
         D8P1psfrkNd+4n+OMYv9Do/oiRMusFEcMnonw5jKPSzDUrTZa3RshMFqnmJ/DOv73m0/
         +ojtiPubBm/P+R5VpMnvXb7l2qvFL4ZI1i80Z2IwxF2mkN+QnfqA2HKEdraRMTehkOl0
         58CfqqcA+k0ah/c4pGH+RBttYHtJrh8upQKkO9f3rC/1FyLOFSZyGnrOSMHNL1qGQsCT
         GqT6h0k1zs9kSUdmfHDXTQHMop31kZWaclVxtm7i29iHxOw3fCe1OTWY8FprUnrrVdbd
         BF4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v134si1888294ywa.442.2018.01.18.12.33.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 12:33:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53355 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecGsh-0005h3-9N
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 15:33:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ecGsZ-0005g0-7S
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 15:33:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ecGsW-0002Z4-4x
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 15:33:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50190)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ecGsV-0002Yk-VK; Thu, 18 Jan 2018 15:33:40 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA91C62E8D;
	Thu, 18 Jan 2018 20:33:38 +0000 (UTC)
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6422460BE2;
	Thu, 18 Jan 2018 20:33:38 +0000 (UTC)
Date: Thu, 18 Jan 2018 18:33:37 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180118203337.GE5292@localhost.localdomain>
References: <1516296842-136976-1-git-send-email-imammedo@redhat.com>
	<1516296842-136976-4-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1516296842-136976-4-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 18 Jan 2018 20:33:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v2 3/5] linux-user: prepare for switching to
 cpu_create() API
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jlgT3++8jJHt

On Thu, Jan 18, 2018 at 06:34:00PM +0100, Igor Mammedov wrote:
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
> +    cpu_create(cpu_type);
> +#else
>      cpu = cpu_init(cpu_model);
> +    cpu_type = object_class_get_name(object_get_class(OBJECT(cpu)));

Will the final version of this series require the temporary
#ifdefs?

I'd prefer to first apply patches adding the CPU_RESOLVING_TYPE
defines and then patches adding the code without any #ifdef at
all.

> +#endif
>      env = cpu->env_ptr;
>      cpu_reset(cpu);
>  
> -- 
> 2.7.4
> 

-- 
Eduardo
