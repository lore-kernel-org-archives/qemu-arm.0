Received: by 10.223.172.38 with SMTP id v35csp514819wrc;
        Wed, 13 Sep 2017 23:41:41 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBtfrK+eNbkcMSsflCdWToh0nXzlA4DLFZaJkyUEeysms8AhHth3TNh9vS5ouf4R+Eu6zQs
X-Received: by 10.237.35.244 with SMTP id k49mr21303144qtc.44.1505371287698;
        Wed, 13 Sep 2017 23:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505371287; cv=none;
        d=google.com; s=arc-20160816;
        b=Fi1Kq+ELUtm4ZsEgxb0nAL4WOVJR8dn46JGQSEMUtm9gBvh2Vr6I0VMCsHgkflesyP
         crVJh58xkAsyPjGuFFbH1FW8bmsWscFRJ1GLqWhjDRZmkbVe/OBQ0b9nnfiIjXF0GxvM
         aIx0oV+JdE8Tz8GeepjQ6fV8OD/Ww2tKyZDi7E0ao8mpLvbHe8AWIoBbqsE9KLMdo5wu
         +JnWfmtwO16gr5VqA7JMN3DtaR3KYcU/NlTe2BrHJymmkG5+tHEn9O/8KtCy8hSXw1Ky
         L2QYwealTbImhYM3dOYRuy/MJCwlVNP7flpppTHl+d1Dv3/Grgt9skETXDDaXWBRy6Ih
         SXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=jE/7h8a3WWLQ4nM+36dFaoFVBBcnqDPLGE9GIK8F55A=;
        b=V6rzHM8iQ9MACWn1u8/XlPehWVhpyDqPQHVheVG5/hpH9ug5yZ2cCFZNZnvf6qYe2u
         GGMtGbFANETH/VXLKV3pFNWTsgJSL9UBCXdxY3AXj+V9vGVaIU+dwWIygbEm06E74CHC
         7mJ/4YYSt1mAMuFjiCGYbkm68NzSkBoOMpr7BLo/TvzRRq+fw2FI4CRD8yrZKopV1ffp
         LqMotTQwOQtSejDkLlujPQvNt/VjmolL2xyR3XiYbMkYFtmCNdYH5MaLhgb6yUhWCkpC
         /+GKq01shA3pZA+U8Rfc4/jmyUmevoK9PEx1lqjy4ct9wNOE6DpZoN3KOpkFty/rRb+A
         bmFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a22si12864252qtc.268.2017.09.13.23.41.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 23:41:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsNq1-0003YZ-I6
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 02:41:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dsNps-0003YN-7R
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 02:41:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dsNpo-0005JK-BG
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 02:41:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36808)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dsNpo-0005Ie-4Z; Thu, 14 Sep 2017 02:41:12 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D8214E4D4;
	Thu, 14 Sep 2017 06:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5D8214E4D4
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-117-228.ams2.redhat.com
	[10.36.117.228])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3865B619A8;
	Thu, 14 Sep 2017 06:41:06 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
References: <20170913142036.2469-1-lvivier@redhat.com>
	<20170913142036.2469-3-lvivier@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fa9f15b6-ee5d-19b7-4f5f-67a1465209f2@redhat.com>
Date: Thu, 14 Sep 2017 08:41:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20170913142036.2469-3-lvivier@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 14 Sep 2017 06:41:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 2/4] hmp: fix
 "dump-quest-memory" segfault (arm)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kjzwj2NTebC3

Hi Laurent,

On 13/09/2017 16:20, Laurent Vivier wrote:
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
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

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
