Received: by 10.28.71.27 with SMTP id u27csp4319619wma;
        Tue, 6 Feb 2018 14:10:16 -0800 (PST)
X-Google-Smtp-Source: AH8x227U1OQLkSuLWugOQG1ANeC8cMB4RSqby7ywvkRRt1UjNEGVsx5JRMdQ4jTUVtjtGNF1buVS
X-Received: by 10.37.219.133 with SMTP id g127mr2569643ybf.425.1517955016359;
        Tue, 06 Feb 2018 14:10:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517955016; cv=none;
        d=google.com; s=arc-20160816;
        b=xOP5yuIXea0BDIqE2hJwrSqS3uq5hpa24ou/HmGz7iBZKs6Pcppl7XanYyxjqqKggL
         nMOOJgOZ34J5Q0zSzWMf5A80Cke1k+BjUrG5LRlBbBUSquNVtCPJ8fvZYb5Aonkin139
         HdWX7yaCIz/qdq5eh4W66rwMRZpDV7n+k0tBWXyFkCVxycntgkQ4oLXV6opVSTzKaiMY
         ZTmBIKLrKPiHqDOeMyqVSJb4spby/FTpSGlqA6ASuZc0UQ/z43SSF5vsNOq1ZvJkazJh
         I4iHKSmgAw7g1vbGdcu0ikc7h+QjQiG3Y1n1eiNTiFmMdPRfpxcmSGTFKawNInKUG8pi
         pjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=epe8wa0FrSARR5do/XFcCsDhAj9KxbOc9wgahGXLY6Q=;
        b=LTKyQjDUMZ54e1swtktyk6juGGovdFJlcOHmdHG3UOt+1PMVHEaDlSHjZIGZBN5BZJ
         ZaRgHXhPqyelpwNkGcOGoar9haPHQLVilwIuBa4rGKMFTC3FtuSxuLKkI/SgYv5ak77p
         yOtPaxlIC1q7xKG4/N2VcFnaRUpXZKFfssGZBOtTZomjVG2tk7uXKbNDnYDV26xzUB0k
         5mifyh8OugatWn8/wFPsQGCtilojOiyoRYUahIZLIQKjl9+oKgAZEyW0+TWWwnkcDq85
         gOohNJmJXB3h9U+elqEzR2f+HEuwc+0f6v3dD3XhACNMtOk16whSMJYZosJLtK7IcnlD
         OKmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g200si3475ybf.532.2018.02.06.14.10.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 14:10:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42159 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejBRP-0001Xz-OQ
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 17:10:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ejBRC-0001W8-7y
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 17:10:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ejBR7-0004Uo-9S
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 17:10:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42540)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ejBR7-0004UF-3e; Tue, 06 Feb 2018 17:09:57 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD028861A;
	Tue,  6 Feb 2018 22:09:55 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E90C15C20B;
	Tue,  6 Feb 2018 22:09:54 +0000 (UTC)
Date: Tue, 6 Feb 2018 20:09:53 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180206220953.GA13301@localhost.localdomain>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
	<1516694904-64879-2-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1516694904-64879-2-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 06 Feb 2018 22:09:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 01/25] nios2: 10m50_devboard:
 replace cpu_model with cpu_type
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
	qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3AtjbtrR9gNj

On Tue, Jan 23, 2018 at 09:08:00AM +0100, Igor Mammedov wrote:
> use cpu_create() instead of being removed cpu_generic_init()
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: Chris Wulff <crwulff@gmail.com>
> CC: Marek Vasut <marex@denx.de>
> ---
>  hw/nios2/10m50_devboard.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
> index e4007f6..42053b2 100644
> --- a/hw/nios2/10m50_devboard.c
> +++ b/hw/nios2/10m50_devboard.c
> @@ -75,7 +75,7 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
>                                  phys_ram_alias);
>  
>      /* Create CPU -- FIXME */
> -    cpu = NIOS2_CPU(cpu_generic_init(TYPE_NIOS2_CPU, "nios2"));
> +    cpu = NIOS2_CPU(cpu_create(TYPE_NIOS2_CPU));

Matches what nios2_cpu_class_by_name() does.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
