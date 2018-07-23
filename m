Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5592923wru;
        Mon, 23 Jul 2018 05:22:44 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeOhibNE9mfC5ctS4tAChhN3LPlMVBz6+OwV21jqcmQgH76OlivUYLfyutIYQ3Y2+BgBpZy
X-Received: by 2002:a0c:d44a:: with SMTP id r10-v6mr10781260qvh.248.1532348564508;
        Mon, 23 Jul 2018 05:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532348564; cv=none;
        d=google.com; s=arc-20160816;
        b=ChfanXSnhCaTESWKaFSoxhP0Hq7n2ssjc1FdTuJFYSk1sSdwkddBTuUvsnNdkR9lLM
         R0KMVDjyOgaHET72i72laOFaJ15wgo+HtyHht1Vis/CqmsGBKWGHE55DcvCvwWXXXs3b
         KGhwZQD+nUCyFwz0NJ07oDQI0mUwKBi/WfkS09lC+h2dZkaUBluGU5tnE7VZtj1uThn7
         n9oaqUHiNmgNAg+K7n7jbPa3mp34mw4drdjuY4f2PYGJKuIVPsRR6Jd0R40SqcSDKlBo
         Xo0pq/1c8jpZClEQCHRX68OEfqdgz4I2d2WPC/pMzRwwtFZqfTAMIQz12L2sG05fvqKk
         xwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=pz+9+wn+XEEnecvntpy8tisoTx8S0qQ6/38McqCg4xM=;
        b=NRGggTFEUMRBcjcKbpbliAKPb699v70/BFXM2oRXL8rJHZyBapSq78tnOYaO3MYxn3
         CPJlhBG25OWZYxYT6j4udsZNWBlfVPQV9TMmbaTnmMBbmcwtVGyrIGx4irc45XXapFRd
         5plAShxwVmdJ36Que9kPnFxtUwTnuyWZX9YIaEJWcKXIjN0y6E6EGA5h1bWGDWgwNAwr
         oSHFH9/ZEYjljfR72V6jpIxtjPcgN8usZbalFQWcnTgf54MAHJBA59t9hVKW6MQhhpkd
         XcEDZZNuJ4tySoLnNsk/r/pnmzYkUOvJc8tFqKlpuewZSN3s2ODCNbX3c3mWV8YTBB2c
         O/4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j26-v6si3201643qvj.26.2018.07.23.05.22.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jul 2018 05:22:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34334 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhZrQ-0001Kr-21
	for alex.bennee@linaro.org; Mon, 23 Jul 2018 08:22:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fhZrD-0001Ic-Bc
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 08:22:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fhZr9-0007wY-Eq
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 08:22:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48618 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fhZr9-0007wQ-8Q; Mon, 23 Jul 2018 08:22:27 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 74BF9401DEA8;
	Mon, 23 Jul 2018 12:22:26 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 69CD52166BA0;
	Mon, 23 Jul 2018 12:22:25 +0000 (UTC)
Date: Mon, 23 Jul 2018 14:22:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20180723142224.11e912ec@redhat.com>
In-Reply-To: <20180704124923.32483-2-drjones@redhat.com>
References: <20180704124923.32483-1-drjones@redhat.com>
	<20180704124923.32483-2-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 23 Jul 2018 12:22:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 23 Jul 2018 12:22:26 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC PATCH 1/6] hw/arm/virt: Add virt-3.1 machine
 type
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A1GwZZQak8pj

On Wed,  4 Jul 2018 14:49:18 +0200
Andrew Jones <drjones@redhat.com> wrote:

> Signed-off-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 281ddcdf6e26..880441275031 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1757,10 +1757,7 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> -#define VIRT_COMPAT_2_12 \
> -    HW_COMPAT_2_12
> -
> -static void virt_3_0_instance_init(Object *obj)
> +static void virt_3_1_instance_init(Object *obj)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> @@ -1830,10 +1827,24 @@ static void virt_3_0_instance_init(Object *obj)
>      vms->irqmap = a15irqmap;
>  }
>  
> +static void virt_machine_3_1_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(3, 1)
> +
> +static void virt_3_0_instance_init(Object *obj)
> +{
> +    virt_3_1_instance_init(obj);
> +}
> +
>  static void virt_machine_3_0_options(MachineClass *mc)
>  {
> +    virt_machine_3_1_options(mc);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(3, 0)
> +DEFINE_VIRT_MACHINE(3, 0)
> +
> +#define VIRT_COMPAT_2_12 \
> +    HW_COMPAT_2_12
>  
>  static void virt_2_12_instance_init(Object *obj)
>  {

