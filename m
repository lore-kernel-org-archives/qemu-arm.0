Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2979869lfg;
        Wed, 26 Feb 2020 03:58:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqzDDqo3jprpR/1cSBRUIsE8aKDzbBXMsYc0yJIBmubVVKXhyYTBr8HCHhfGI/ctgAOZMdDA
X-Received: by 2002:a37:7746:: with SMTP id s67mr5263855qkc.127.1582718306730;
        Wed, 26 Feb 2020 03:58:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582718306; cv=none;
        d=google.com; s=arc-20160816;
        b=KoGw1nXwEvwglJa8d9xGuk++t2jESe9diUMH7+WXHHp8CNVJYO2zSQjIwdHyXSTlMb
         s053UalqNKCsDWQwFwsfphDH0/07ERQGR+nHpOH4FbVtK69NasH+G4mKdorNVyzmT3Lj
         mlNs8SuYsAbloQu7O3/PSBD8Qsymlq1Z+FU8yWTq0VPTRNE1SAuY6RS0kcK81E0pyx7+
         WYjlVmnz5EaQ9XyDwJCVW3gLSQmlnwhJ/BqB99jJgB2bmm3GgjdsJhPJXtdiMbozr25Y
         FrkIVpcRMxSwMSfRZOcsGPqTLTptKGt/6ym3Uvmwwvx7YZGFkkc5JmmhcYsZiNgx9lcG
         VFeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NBDRsQwNUbNzP+QooB1eTn8YugDawSHkcwRNbopfuqw=;
        b=Id8Wx3TL2MPg+eG1wqptd66ZvnTYYc8mo6ofmD25HHyLQ35idClQcWaXZ2YfeMJhcE
         3fMWohg9k+/4UHsdpGtfjN8M4v1gQR9MH+IaqnOxra8/Br0iv/y9OEoWqlug0ZuI2wVJ
         pEcCjB4Izw38fduJXi/B97qCiXeP1OjPYQrPlUrzP/zbb202oSYpKA5onHiwUD2RkOxd
         QLVDFbJ0J40x20J4+Ezt4FPMYo5VuWO0TmEmPUlXhXxA4QC6qjxzPjzUg3tceoNBF7+p
         exZzjLaWhsZZUdbIRDByfIuYj8rn65BjjLVNlTE8+zPUX7a1/eYAhuMjOb9/X33rIJc8
         JypA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fkvBX5OJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k123si296353qke.150.2020.02.26.03.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 03:58:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fkvBX5OJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6vKc-0000Ew-4k
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 06:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39587)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j6vKT-00009z-EA
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 06:58:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j6vKS-0001Xu-GE
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 06:58:17 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55423
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j6vKS-0001WB-BD
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 06:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582718296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NBDRsQwNUbNzP+QooB1eTn8YugDawSHkcwRNbopfuqw=;
 b=fkvBX5OJKGyhpCXqdZi+Pk6ICN3iD05c91x8oNL++JOgz3/MfGHj2aHroY3rTA36V7c8oJ
 duFROl+adWBtIOjt2FmBTjGx3fUNEbleaL4sQhbIBJpRIeKc+KwbobJiY8qhneXdIxVSEc
 XBRwW2lrcFg4g2eczJyXDv61oz2wM/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-gTVWxw8PNmebnr5z8nVNzQ-1; Wed, 26 Feb 2020 06:58:14 -0500
X-MC-Unique: gTVWxw8PNmebnr5z8nVNzQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FEDC1005514;
 Wed, 26 Feb 2020 11:58:13 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B68A1100164D;
 Wed, 26 Feb 2020 11:58:11 +0000 (UTC)
Subject: Re: [PATCH] hw/intc/arm_gic_kvm: Don't assume kernel can provide a
 GICv2
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20200225182435.1131-1-peter.maydell@linaro.org>
 <20200226085209.ni7oph6odt24warq@kamzik.brq.redhat.com>
 <CAFEAcA-Bhuy+2dU3joZoip5=tOkiTSoC+LzdNzyd+urUnoRNXw@mail.gmail.com>
 <20200226091750.mqkbqffod247bori@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <85d78328-0843-3f11-7a79-6010aea3d3dd@redhat.com>
Date: Wed, 26 Feb 2020 12:58:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200226091750.mqkbqffod247bori@kamzik.brq.redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iMDZ4jd9AEWM

Hi Peter,

On 2/26/20 10:17 AM, Andrew Jones wrote:
> On Wed, Feb 26, 2020 at 08:56:03AM +0000, Peter Maydell wrote:
>> On Wed, 26 Feb 2020 at 08:52, Andrew Jones <drjones@redhat.com> wrote:
>>> Although, many QEMU command line users still won't know what to do
>>> without an explicit "Try -machine gic-version=host" hint, so that
>>> might be nice to add too.
>>
>> In the GIC code we don't know if the machine even has a
>> gic-version property, so we're not in the right place to try to
>> produce that message.
>>
> 
> Ah yes, we use qdev_init_nofail() in virt::create_gic(), so there's
> no chance to append another hint at the machine level.
> 
> And what about when machine.gic-version is not provided and KVM is
> in use? Shouldn't we try version '2', as we do now, but then also
> '3', if '2' fails, before erroring out?

In case of KVM accelerated mode we could effectively probe v2 first and
if not supported choose v3, as mentioned by Drew.

Couldn't kvm_arm_vgic_probe() return a bitmap by calling
kvm_create_device on both versions in dryrun mode?

Thanks

Eric

> 
> Thanks,
> drew
> 
> 

