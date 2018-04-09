Received: by 10.28.71.155 with SMTP id m27csp2717066wmi;
        Mon, 9 Apr 2018 08:57:05 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+eBPQlicHZo7YhBPdHFL0r89QlSfP46OainPlCVFOTJ623JcESrK5mLUs/hsnl1HP4TbIH
X-Received: by 10.237.38.101 with SMTP id z92mr50720074qtc.303.1523289425777;
        Mon, 09 Apr 2018 08:57:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523289425; cv=none;
        d=google.com; s=arc-20160816;
        b=nGci9yvtVisZs1qywTl1yhWcXToZCmK2Th/FBVsPnL7nP1kn4m8H0Q+foqViUB347Y
         XEXcBkCS6M+XqEUXHt5UaoNaKUKi5rWv2efb9HTV6qhULkzisH0S38b1h1BD3Mk4jAxi
         8psUfWYI4NG18GBBOF9rp4Re7PNBamV1Gutiut+aONtPz7+Syeky4BQEMhk89z+P3pCM
         fBhBgDKe/+AmmhPSoMUX29TDmCx7ongc/7W8GqvUbVudsblyqu00wFQwIZYisSuH1Hj8
         WtU7Lv6iWAukzerH7JKokROzrRpJZGo1x9y0Ozj8JgHEL2uujzlPInRQFrs2Ru7WYrhs
         +jEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:arc-authentication-results;
        bh=AiHWzmaRBA5+0nGxF5XiPOOKHI2rAs1EfJ8T3+AGLqw=;
        b=mIMkwRVI2tisqY4XuLt75DTQi5S7Ssg2nzJPx/SxhCdmsAp2iqHcGOhHaVnYZiM2HF
         avLQ88ckVDAtBe93sOw21tSOIYpS4DGRf11RlGHA/XYoU6Ypax4QjehIp9oEJJghh1HB
         S+7auGXSpUlaH25iJRTf3hN3df6UWmgbY5ThMM8XGGAYaMTfT8Uh2IzJzy8IV7pY4bE5
         wUOpy9xKtIoOED6eOfVV2csInBNuxCTcjVgma/JnJOogfyCou6bI7bFOCH8z41SkJuOF
         TK4s1r/O1Gt0sqTpkg0XIN9C8a1NR8NIY1DnbdPCLmthdoo+sbihWZKK+MTKRldX7e2q
         JkAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g88si737432qkh.342.2018.04.09.08.57.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 08:57:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48339 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5ZAH-0006ZA-6w
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 11:57:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f5ZA4-0006Wz-KE
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 11:56:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f5ZA0-0001qP-N5
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 11:56:52 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50130 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1f5ZA0-0001q6-HO; Mon, 09 Apr 2018 11:56:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 041AD40201A3;
	Mon,  9 Apr 2018 15:56:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CF40111DCFF;
	Mon,  9 Apr 2018 15:56:36 +0000 (UTC)
Date: Mon, 9 Apr 2018 16:56:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20180409155634.GO18283@redhat.com>
References: <20180409154921.29906-1-wei@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180409154921.29906-1-wei@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 09 Apr 2018 15:56:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 09 Apr 2018 15:56:44 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] mach-virt: Change default
 cpu and gic-version setting to "max"
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, abologna@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B7XeMEXey0p2

On Mon, Apr 09, 2018 at 10:49:21AM -0500, Wei Huang wrote:
> Running mach-virt machine types (i.e. "-M virt") on different systems can
> result in various misleading warnings if -cpu and/or gic-version not specified.
> For KVM, this can be solved mostly by using "host" type. But the "host" type
> doesn't work for TCG. Compared with "host", the "max" type not only supports
> auto detection under KVM mode, but also works with TCG. So this patch set
> "max" as the default types for both -cpu and gic-version.

Hmm, generally we aim for the config provided by a machine type to be stable
across QEMU versions.

By specifying "max", the machine type will potentially change if new QEMU
turns on new features in the "max" CPU model, as well as also varying
depending on what the host OS supports.

This is a general conceptual problem with the "host" CPU model for all
target arches and is unfixable by design. This is fine if you accept
the caveats with using "-cpu host" and opt-in to using it knowing the
tradeoffs. I'm just not convinced it is reasonable to make "-cpu host"
be the default value for a machine type out of the box.


> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 94dcb125d3..1a9d68b8d5 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1555,7 +1555,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      mc->minimum_page_bits = 12;
>      mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
> -    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
>  }
>  
> @@ -1609,13 +1609,13 @@ static void virt_2_12_instance_init(Object *obj)
>                                      "Set on/off to enable/disable using "
>                                      "physical address space above 32 bits",
>                                      NULL);
> -    /* Default GIC type is v2 */
> -    vms->gic_version = 2;
> +    /* Default GIC type is max */
> +    vms->gic_version = -1;
>      object_property_add_str(obj, "gic-version", virt_get_gic_version,
>                          virt_set_gic_version, NULL);
>      object_property_set_description(obj, "gic-version",
> -                                    "Set GIC version. "
> -                                    "Valid values are 2, 3 and host", NULL);
> +                                    "Set GIC version. Valid values are 2, 3, "
> +                                    "host, and max", NULL);
>  
>      if (vmc->no_its) {
>          vms->its = false;
> -- 
> 2.14.3
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
