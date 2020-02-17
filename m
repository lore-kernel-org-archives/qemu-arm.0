Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4585699lfp;
        Sun, 16 Feb 2020 18:59:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqx4lvBVtQNWJCksfG/oAiggg4Wk3LYFu14call5klGkCchF7aavCAWFvM8PnlYKmFs2oVxB
X-Received: by 2002:ad4:5144:: with SMTP id g4mr11011830qvq.179.1581908395450;
        Sun, 16 Feb 2020 18:59:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581908395; cv=none;
        d=google.com; s=arc-20160816;
        b=EBFObfWseIl9XgBoGdnP9PQCBaxCFAJXYhbGKkv1SJIcWMQvOMv38zmnSyXwSrv5Ap
         tHBmuhtQnRsYXDWxOBdAhIlrmyssLeHzrWr4a9GwmuY5KJTKbes1GwzwcsbYHA0/Unbx
         kwmIoX/SLbXtbk8yld+JJcaIlNc8EJH6c7CZltvSxI48zJ4DebQRQT7DpR+MWuQULQIJ
         Id2OWBO5Nmyx9uBhI3GKCwcMpJPXP2sUYiFZe73X21Vhgn9NkXEwloQk4OI1SaPz6d81
         xwgz/bO2hkA1dnUsCHygKC1FEER93qkYWMtm5MweYYBWZ+oRFZHMUyYxeMJR9LwdjnOa
         tJRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=LmoFYXdBrijMVhWal0NtASQS/e7GPwjMxtjYpYKVCWE=;
        b=MZhhh4mqaVo/ahOQ5u3IaABK6vm3X8EwoZTEokHQQBecu9NAkw+Sw9H8CHk5vYxGQz
         r8SpyXqklIVNdfHEIQoCfLqIA8BSh6tSl/hP0PpyCs9ZVhyKBdiKHjSKzs55AjaMWKQT
         W0reS0FaCOh/HW0bRu4nSpq8De3hnkp7MB9BS6ehG+zyfnRcdEgkUM8wVhIIfHBFzUH1
         O+9W9jpnPEydX9Nzsz4s+/ZeUQI67zpefddv6LYB4T2l0xEJc/tUKSPkR4qz+p+h/yOS
         7Zl7SOv5AaYaWUJPLOCZocG7ID/3SvYKLAmcZLqNCerSq7lz+qR1B1WPZ7ojREXDmOl4
         ibgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WRcXByH1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si6636781qkj.14.2020.02.16.18.59.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2020 18:59:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WRcXByH1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3WdW-0002mz-T9
	for alex.bennee@linaro.org; Sun, 16 Feb 2020 21:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44748)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1j3WdO-0002mK-HJ
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 21:59:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1j3WdM-00037U-F5
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 21:59:45 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27041
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1j3WdL-00035z-Qi
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 21:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581908382;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LmoFYXdBrijMVhWal0NtASQS/e7GPwjMxtjYpYKVCWE=;
 b=WRcXByH1Zsxw8AkznIq7BG6Z1pzAGBga2SR2Gg+oAw6knbEfZUNQLtVIBKM92JQUTtR/rU
 mEmutExo0G1aAp0vTLGcHFljgIO7Q0/O3/W718/5MlVx/sh0GrOr7SkPWp3oX/31FljNND
 7ferlMGSVaUQsQ6eeZpBczKAejJspQw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-EJgOa8qaOI-bGgQ4_QemAQ-1; Sun, 16 Feb 2020 21:59:41 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA72114E1;
 Mon, 17 Feb 2020 02:59:39 +0000 (UTC)
Received: from localhost.localdomain (vpn2-54-16.bne.redhat.com [10.64.54.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B99AC5C241;
 Mon, 17 Feb 2020 02:59:33 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] target/arm: Support SError injection
To: Marc Zyngier <maz@kernel.org>
References: <20200214055950.62477-1-gshan@redhat.com>
 <20200214055950.62477-2-gshan@redhat.com>
 <27b9c2a363d69911c003fcbaed958a5a@kernel.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <37c5a2c3-4ca8-1717-6672-2712161076ed@redhat.com>
Date: Mon, 17 Feb 2020 13:59:31 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <27b9c2a363d69911c003fcbaed958a5a@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: EJgOa8qaOI-bGgQ4_QemAQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, jthierry@redhat.com,
 aik@ozlabs.ru, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: he1ize7x4Sde

Hi Marc,

On 2/16/20 11:34 PM, Marc Zyngier wrote:
> On 2020-02-14 05:59, Gavin Shan wrote:
>> This supports SError injection, which will be used by "virt" board to
>> simulating the behavior of NMI injection in next patch. As Peter Maydell
>> suggested, this adds a new interrupt (ARM_CPU_SERROR), which is parallel
>> to CPU_INTERRUPT_HARD. The backend depends on if kvm is enabled or not.
>> kvm_vcpu_ioctl(cpu, KVM_SET_VCPU_EVENTS) is leveraged to inject SError
>> or data abort to guest. When TCG is enabled, the behavior is simulated
>> by injecting SError and data abort to guest.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>> =A0target/arm/cpu.c=A0=A0=A0=A0=A0 | 69 ++++++++++++++++++++++++++++++++=
+++--------
>> =A0target/arm/cpu.h=A0=A0=A0=A0=A0 | 17 ++++++-----
>> =A0target/arm/helper.c=A0=A0 |=A0 6 ++++
>> =A0target/arm/m_helper.c |=A0 8 +++++
>> =A04 files changed, 81 insertions(+), 19 deletions(-)
>>
>=20
> [...]
>=20
>> @@ -656,7 +682,8 @@ static void arm_cpu_set_irq(void *opaque, int irq,
>> int level)
>> =A0=A0=A0=A0=A0=A0=A0=A0 [ARM_CPU_IRQ] =3D CPU_INTERRUPT_HARD,
>> =A0=A0=A0=A0=A0=A0=A0=A0 [ARM_CPU_FIQ] =3D CPU_INTERRUPT_FIQ,
>> =A0=A0=A0=A0=A0=A0=A0=A0 [ARM_CPU_VIRQ] =3D CPU_INTERRUPT_VIRQ,
>> -=A0=A0=A0=A0=A0=A0=A0 [ARM_CPU_VFIQ] =3D CPU_INTERRUPT_VFIQ
>> +=A0=A0=A0=A0=A0=A0=A0 [ARM_CPU_VFIQ] =3D CPU_INTERRUPT_VFIQ,
>> +=A0=A0=A0=A0=A0=A0=A0 [ARM_CPU_SERROR] =3D CPU_INTERRUPT_SERROR,
>=20
> I'm a bit concerned with this. It makes sense for a host, but doesn't
> allow the SError signal to be virtualised (there should be a VSError
> signal in this list that can be injected via HCR_EL2.VA, just like
> VIRQ is injected by HCR_EL2.VI).
>=20
> Given that people use QEMU as a development platform for hypervisors,
> I'd really like this functionality to be supported from day-1.
>=20
> There is also the whole RAS stuff which quite a lot of work, but let's
> start at least with the full ARMv8.0 semantics.
>=20

Thanks for the comments. Yes, I think it's reasonable to support virtual
SError as well. Lets have a separate patch to support it in v4. I think
you were talking about HCR_EL2.VSE, which is defined as below in target/arm=
/cpu.h:

#define HCR_VSE       (1ULL << 8)

Thanks,
Gavin

