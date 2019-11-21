Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp3330705lfc;
        Thu, 21 Nov 2019 03:08:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqxMVWv1HHhfurle3583RxGEgwdbVw14rkwgh7Z4XxvogiV2kHFIWJIP1A3I8J6f6inZe0nL
X-Received: by 2002:a0c:d09b:: with SMTP id z27mr7607266qvg.168.1574334524428;
        Thu, 21 Nov 2019 03:08:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574334524; cv=none;
        d=google.com; s=arc-20160816;
        b=hpbhQcGzLUFVcp3rxV1ct8cb+QacNKrMRz+uclHADrxQtNkmFKQ2WfIaUQCzCzs/4a
         WFByzcPBCvzIpC+mMGiSp7/8kMIB1+jXL2WP+cBTGyKf90/mTjUK9vbvXSgwZkIPaozL
         9HTOBTtz50fVuK1nufYuBT7T0D/tTQJdt1AUljZg/JMSzazOWj0pLJZT67P5EGLY94qe
         Rm4jtlkE/z8bTQmLrosv5YMrPEl1Z5gc0IpHJybnpCVHRPNehj2qI73S6eCKj033Z8nM
         L10NrhGA1J5yLhlxAZmlYLhXURpMyXp9WEZy+ukNLwHVbpODhyZ1TiWZijVCBNHLUk0O
         5n5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=iHL0UO7MAK8copWACF50qrbewMiXFvk5XnmjfwV6jmk=;
        b=bi3705uj+Oi04Y21+EpBNLlBT6R0X0NmPQNnc+G5IUp55KbbyX84OCY7QGb5wAboco
         HOPZfEe5uTub1TauAkbMT7/519avK1BRUVmvM4KPz3Q1Xwl4FOgp7sUodOyh/q9TDRVw
         7VqjVbPdumAswSaT26PYRT2E3Yd/ZCV+ztiiP8AmeGZfoupU0l9GDg26ScAEKsttKbcc
         1W5yGxmjdaQK0d3+//SHaxcIzmqi3/27IH16dVA/8oLc7RUL7iAgPu8WIx4Q1ahtOrxL
         J+TO5n9RCc2QVVANe+E6dJalH6fJUKriazeb67iWui9tzJ7N6vw2ZsGavySZlCgSyVzj
         aeMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ElXh0kXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o28si106811qtj.191.2019.11.21.03.08.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 03:08:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ElXh0kXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXkKJ-0007wA-Pk
	for alex.bennee@linaro.org; Thu, 21 Nov 2019 06:08:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50654)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iXkK9-0007rh-P7
 for qemu-arm@nongnu.org; Thu, 21 Nov 2019 06:08:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iXkK8-0002QX-LW
 for qemu-arm@nongnu.org; Thu, 21 Nov 2019 06:08:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38505
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iXkK8-0002Pu-IP
 for qemu-arm@nongnu.org; Thu, 21 Nov 2019 06:08:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574334511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iHL0UO7MAK8copWACF50qrbewMiXFvk5XnmjfwV6jmk=;
 b=ElXh0kXnpEUfsMoD4OoCl0VqLWkFf7w6GuMLKbf6siHSkIm5opyYQgZ6I4pQNhfDoPGRUS
 AwlseUPrbiHh0bZkfxeYx2mfNc0HjMQTBHkwt5Tp08DbW0QB5c3QJAZNnI9g5uKjifOFow
 ClR7WHcKuzDZBzcHdB5phef08EhZPjs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-wJJhSaJGMgyu8b3xZxVTWg-1; Thu, 21 Nov 2019 06:08:30 -0500
Received: by mail-wm1-f71.google.com with SMTP id y14so1637770wmi.4
 for <qemu-arm@nongnu.org>; Thu, 21 Nov 2019 03:08:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c4/qmxm5dqKJV3NK8SjSOV5dRQJhUqjY8Y5afRnTv2w=;
 b=hr9/X65Y1aB+eVMCX0y0iVr7R06SPjrprY4qJlmjKR8ChCx+4qNDyOKBt1Di8XgxJL
 Cvx70UXsb9pnHUHlN74MPo8d/3L51TUH2WRxjizoJx68ckm7u7EtIzDoEAGlVJjr4EiU
 E9laKyh2lULNZCcj0r9fOUE0IooYqGLwILtKMFfjeag38euYoosWe46eP3KcytUjJp5X
 VlFHV/1LEAYekvSpQp7rpRffF5Ra+y1dlbDW7meHcc0U3F/eRIxobW67UQEmvuxrkkIz
 F9MVB68P1QRcXIPBMmrH4aF5eE9Hnfm/Us0FxkNElWtqdRLj66nuxFadjPJgQk09Ld+Z
 goKw==
X-Gm-Message-State: APjAAAW4onVYepFoW5zQV/FFlMLJmwqw89Npw/lkkhCIhA49GBluiPLP
 n5YNlEBpnYw4f6K/SYztLhHqqCXUpb4c4lSSP3B5GAgbm71nKV6k4j6UaoT0cfdU3qKIdCHplQH
 4+j2Z65/khrFv
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr10185422wrm.359.1574334509337; 
 Thu, 21 Nov 2019 03:08:29 -0800 (PST)
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr10185382wrm.359.1574334509028; 
 Thu, 21 Nov 2019 03:08:29 -0800 (PST)
Received: from [192.168.1.35] (131.red-88-21-102.staticip.rima-tde.net.
 [88.21.102.131])
 by smtp.gmail.com with ESMTPSA id m13sm2523687wmc.41.2019.11.21.03.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2019 03:08:28 -0800 (PST)
Subject: Re: [PATCH v2] exynos4210_gic: Suppress gcc9 format-truncation
 warnings
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org
References: <20191121013859.287372-1-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <80635d08-4546-9f14-b664-f8f79cf5ec19@redhat.com>
Date: Thu, 21 Nov 2019 12:08:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191121013859.287372-1-david@gibson.dropbear.id.au>
Content-Language: en-US
X-MC-Unique: wJJhSaJGMgyu8b3xZxVTWg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n8M598NsOyWE

On 11/21/19 2:38 AM, David Gibson wrote:
> exynos4210_gic_realize() prints the number of cpus into some temporary
> buffers, but it only allows 3 bytes space for it.  That's plenty:
> existing machines will only ever set this value to EXYNOS4210_NCPUS
> (2).  But the compiler can't always figure that out, so some[*] gcc9
> versions emit -Wformat-truncation warnings.
>=20
> We can fix that by hinting the constraint to the compiler with a
> suitably placed assert().
>=20
> [*] The bizarre thing here, is that I've long gotten these warnings
>      compiling in a 32-bit x86 container as host - Fedora 30 with
>      gcc-9.2.1-1.fc30.i686 - but it compiles just fine on my normal
>      x86_64 host - Fedora 30 with and gcc-9.2.1-1.fc30.x86_64.
>=20
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
 >

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

--- <- here goes the separator I suppose

> Changes since v1:
>   * Used an assert to hint the compiler, instead of increasing the
>     buffer size.
>=20
> ---
>   hw/intc/exynos4210_gic.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>=20
> diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
> index a1b699b6ba..ed4d8482e3 100644
> --- a/hw/intc/exynos4210_gic.c
> +++ b/hw/intc/exynos4210_gic.c
> @@ -314,6 +314,14 @@ static void exynos4210_gic_realize(DeviceState *dev,=
 Error **errp)
>               EXYNOS4210_EXT_GIC_DIST_REGION_SIZE);
>  =20
>       for (i =3D 0; i < s->num_cpu; i++) {
> +        /*
> +         * This clues in gcc that our on-stack buffers do, in fact
> +         * have enough room for the cpu numbers.  gcc 9.2.1 on 32-bit
> +         * x86 doesn't figure this out, otherwise and gives spurious
> +         * warnings.
> +         */
> +        assert(i <=3D EXYNOS4210_NCPUS);
> +
>           /* Map CPU interface per SMP Core */
>           sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
>           memory_region_init_alias(&s->cpu_alias[i], obj,
>=20

