Received: by 10.223.159.82 with SMTP id f18csp323694wrg;
        Wed, 22 Nov 2017 07:34:46 -0800 (PST)
X-Google-Smtp-Source: AGs4zMY7Btxp266P4lkm/KxJT+1WNq6trxLMV5VsrJPKrjWPGDoOSRBNZsDSvlXlPHfxefhSyEpS
X-Received: by 10.37.178.129 with SMTP id k1mr13833743ybj.176.1511364886870;
        Wed, 22 Nov 2017 07:34:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511364886; cv=none;
        d=google.com; s=arc-20160816;
        b=g6xG1Z6KQPuhRkqKju/rJ6rlFbdSJHVbBs/NiBvfEyJbIr6Un43TBa4BilEF1hmtUJ
         WYyM9E6A2GN2iDCRdHsl4eUZQFbZsZFReG/+aSUexLQkkRFnteocOxumv3UsnWJBHe43
         omYDkz2vc3mZvcD3yKjw9SMiJQqro8cHSC1iM/zJQ1b9KVoIY0G8KK/IboJgwdIvs2er
         jfeIfHU+5KwSze/Ep4Dhstb7c5nTeuwey9BbfQVUnjB4gg1jgwtnF7YMvGhzp+M1rtIg
         a8Y1KGp0fkRitYseBnpJc6XlJOH7UosFXMtVDzHCNW0WAdcIPtaEqSyw8Cq/op3DHsDc
         puyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=MJy5o/KJ9oa4c/Hn/r0S63OriFIZvr3M76ZV8BzKJqY=;
        b=GL9Mk7QAQVn1sppRyYjRwghcBGk5siSSiKL8I5gO3t4NaAF+s4hJvebiJAoXNtXFPj
         B4Unv8k19noCODGamSDSvz/u3tsi3IefPlg/t9grenr1vN1G+UYmCQ4gvYu32sA5Avl0
         VqoflivaS1r88DQYER3E7huE34zO6z7KE9tO7pemElElDjaderJZvbG3iMMzVsrC6dfu
         D0/L7Kw3s1ySd6966t6yx8JCqeVhxq8HzNXxb4f/vq5+JUeYuZR+auY2QYDXEVa5Yy86
         6tdgnNrNKAMSlhp6yKvb4f7XwDJTuwp9rYvzBXwflsi9Zuarz24vMMdMQkdcY1xL3h2p
         0yoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 201si3420028ywe.1.2017.11.22.07.34.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Nov 2017 07:34:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40053 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHX30-0000Kd-B2
	for alex.bennee@linaro.org; Wed, 22 Nov 2017 10:34:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eHX2p-0000KW-8o
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 10:34:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eHX2l-00018K-9I
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 10:34:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53346)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1eHX2l-000183-3i; Wed, 22 Nov 2017 10:34:31 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 087A0C056827;
	Wed, 22 Nov 2017 15:34:30 +0000 (UTC)
Received: from localhost (unknown [10.43.2.134])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 389885D9C8;
	Wed, 22 Nov 2017 15:34:28 +0000 (UTC)
Date: Wed, 22 Nov 2017 16:34:26 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Message-ID: <20171122163426.13f3ed3f@redhat.com>
In-Reply-To: <20171106154813.19936-30-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-30-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 22 Nov 2017 15:34:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 29/30] i.MX: Add i.MX7 SOC
 implementation.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cAsFB4epom6n

On Mon,  6 Nov 2017 07:48:12 -0800
Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> The following interfaces are partially or fully emulated:
>=20
>     * up to 2 Cortex A9 cores (SMP works with PSCI)
>     * A7 MPCORE (identical to A15 MPCORE)
>     * 4 GPTs modules
>     * 7 GPIO controllers
>     * 2 IOMUXC controllers
>     * 1 CCM module
>     * 1 SVNS module
>     * 1 SRC module
>     * 1 GPCv2 controller
>     * 4 eCSPI controllers
>     * 4 I2C controllers
>     * 7 i.MX UART controllers
>     * 2 FlexCAN controllers
>     * 2 Ethernet controllers (FEC)
>     * 3 SD controllers (USDHC)
>     * 4 WDT modules
>     * 1 SDMA module
>     * 1 GPR module
>     * 2 USBMISC modules
>     * 2 ADC modules
>     * 1 PCIe controller
>=20
> Tested to boot and work with upstream Linux (4.13+) guest.
>=20
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
...
> +
> +static void fsl_imx7_init(Object *obj)
> +{
> +    BusState *sysbus =3D sysbus_get_default();
> +    FslIMX7State *s =3D FSL_IMX7(obj);
> +    char name[NAME_SIZE];
> +    int i;
> +
> +    if (smp_cpus > FSL_IMX7_NUM_CPUS) {
> +        error_report("%s: Only %d CPUs are supported (%d requested)",
> +                     TYPE_FSL_IMX7, FSL_IMX7_NUM_CPUS, smp_cpus);
> +        exit(1);
> +    }
> +
> +    for (i =3D 0; i < smp_cpus; i++) {
> +        object_initialize(&s->cpu[i], sizeof(s->cpu[i]),
> +                          "cortex-a7-" TYPE_ARM_CPU);
pls reuse ARM_CPU_TYPE_NAME() macro here

> +        snprintf(name, NAME_SIZE, "cpu%d", i);
> +        object_property_add_child(obj, name, OBJECT(&s->cpu[i]),
> +                                  &error_fatal);
> +    }
