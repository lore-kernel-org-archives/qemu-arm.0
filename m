Received: by 10.223.172.38 with SMTP id v35csp7116368wrc;
        Tue, 12 Sep 2017 07:12:48 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAmRJNG3DxeYS27AGerika5NrKUroO510UEvR2ECCSsVoeVvj/ZryWsRrhG7GNxzEZFXkkt
X-Received: by 10.200.56.57 with SMTP id q54mr18148383qtb.310.1505225568806;
        Tue, 12 Sep 2017 07:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505225568; cv=none;
        d=google.com; s=arc-20160816;
        b=FsqrB63b7HUiOtEiFxA4f6cp8hSRypdosg240m/edneSX6QDaWhtH/2VOWx6qieTct
         Ci57qsYhk6JY+/5b0DoZ85YLxRFmt4DeNeW818RGJs6z85/mMFmsVGU3JttSujT1yQsp
         pp9SlBoKM8aD6xe0h1ZKBGvMc7pQVO32SqeJC2J+ku1plECS7QW8DhWB7/3dsIwdKzH5
         jlhs2u9NbNwFr9IomEjG+5WBGlfZ9Nx+ylXvPslfE4Y7kR+6FcFlyFqAqQrcxTBvAwEd
         pJty3GHsTJg2j828yKSMXMUkpMFuOyWENfyPxNwm5gVU6uNhhDlKYOO6Oaoi3FF8U1y1
         T4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=g7cIV6E98bh1BRh+iVe6CI7/VNr+SaMu2hvijgxubZY=;
        b=dpPsZFgkAzxjOeukDlKbsLpbYen0CuKoOOhfqFnkjB3GsIVuFn6lnhE+JqggH6OyQE
         6PuBxU1KT/xQe1i150qWoICLDK58XqJ8Op1YZIUXmwlq2rqzwaWVPpaqbk6RHUrwGtBX
         TM+cJwZW9i970esollYIX4hm0Le+/KY/48HydZoY1gke/E7g5JBr1A4gsqPyvnH9uZqJ
         gD1UPmNSHilYlP1MFFwHrlkroCkf+cedOhVuWAyGM5rA7vnsy3EL6+R3sjewsg/m0/mx
         LJa/mH9mP4BxBQJQVk5S0SdEMgwgwHJfJ5JpYYf3Abe8A7sum9u41WQg2K3Wnc5qDxA5
         3K7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n44si12660705qta.141.2017.09.12.07.12.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 07:12:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drlvi-0007Gj-H4
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 10:12:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1drluT-00066z-CM
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:11:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1drluO-00028Q-JJ
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:11:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46971)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1drluO-00027y-Cq; Tue, 12 Sep 2017 10:11:24 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 786B25F7AD;
	Tue, 12 Sep 2017 14:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 786B25F7AD
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.40.204.137] (ovpn-204-137.brq.redhat.com [10.40.204.137])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DE1A6FB8E;
	Tue, 12 Sep 2017 14:11:18 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912140149.7692-3-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <13c0f923-dbaa-e458-0544-59cd8e05a7e6@redhat.com>
Date: Tue, 12 Sep 2017 16:11:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170912140149.7692-3-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 12 Sep 2017 14:11:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 2/3] hmp: fix "dump-quest-memory" segfault
 (arm)
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
X-TUID: YWua1HVs5gEx

On 12.09.2017 16:01, Laurent Vivier wrote:
> Running QEMU with
>     qemu-system-aarch64 -M none -nographic -m 256
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
>  target/arm/arch_dump.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
> index 1a9861f69b..9e5b2fb31c 100644
> --- a/target/arm/arch_dump.c
> +++ b/target/arm/arch_dump.c
> @@ -273,11 +273,18 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
>  int cpu_get_dump_info(ArchDumpInfo *info,
>                        const GuestPhysBlockList *guest_phys_blocks)
>  {
> -    ARMCPU *cpu = ARM_CPU(first_cpu);
> -    CPUARMState *env = &cpu->env;
> +    ARMCPU *cpu;
> +    CPUARMState *env;
>      GuestPhysBlock *block;
>      hwaddr lowest_addr = ULLONG_MAX;
>  
> +    if (first_cpu == NULL) {
> +        return -1;
> +    }
> +
> +    cpu = ARM_CPU(first_cpu);
> +    env = &cpu->env;
> +
>      /* Take a best guess at the phys_base. If we get it wrong then crash
>       * will need '--machdep phys_offset=<phys-offset>' added to its command
>       * line, which isn't any worse than assuming we can use zero, but being
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

