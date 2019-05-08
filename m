Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4864666wrh;
        Wed, 8 May 2019 06:59:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyO/tNhCVD8CViT1MTtInZOB1nU8QQJ+vE/K9IAEmg15SJSGYDH7ofwVqcg9QGt8u/GwLFK
X-Received: by 2002:a5d:6983:: with SMTP id g3mr10826447wru.89.1557323998328;
        Wed, 08 May 2019 06:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557323998; cv=none;
        d=google.com; s=arc-20160816;
        b=oMXn33zGtXW+wQc3AgnEhD70YVjFTxSiXtXYrGPvyyqSsQct9inmpUaW1vhcq0GwYb
         vTdCzazhQjJDQwBz4RGfGpoejEDheOOv9cvYKTZ1iyiVYfcVmOrTC9LmgHVif52n6mW6
         gNDEDicQIRyohZdllAzUddPQMmrJnGCEvVDMz5Jux/TMnEfdF4d6OnsSj59gtaJ8ryqn
         xxm0bNszi0SbsveN72CphKKQf2ArFxGqJ+08T1CQ3266g3KXgezirNfQxYCHUqbOz86+
         5e8gwcCOleIfL+h909hHDYe6t5puYWwfS+Q3sBeLtM5z+WtnSL0DtymB1RHMr+6+cv+S
         p6Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=kV6zoDvkT+G/YQ6qO7JsAz5Z1pR//0gUFPmrHUTv5oE=;
        b=CeDOcea/ptQSoh01LcVDnUg2sso/1saEncHtQzbQU1neHrcqY8A7kLrktlT1X9gzxV
         rAJvs5F/n5/7FhkQP/mgfKrrwf1As8t1iV0cRipf3Ysl38z7dqJaPJqj7eJMLVtZKpbN
         vE+1B/gWdA4ipMUsYqtMgn0xk4pV29gypelKR7IjyUCVwknilkDE0q939OgUO26jOKFg
         NyNd8+CRpOV7VQT5rAs+I36eR8artSywBg7GpEHW1EJ2Lm7JVm/mi5JS63wZvudE6ngg
         904x4NQaf/MN1fnVxxMYDuTYaDfMpryLWXSRSfgZ6e8KdcUUJfJLg9qZWdUvOW13fJqp
         zBLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si12347803wrs.74.2019.05.08.06.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 06:59:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37709 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hON6z-0005Cn-Gb
	for alex.bennee@linaro.org; Wed, 08 May 2019 09:59:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hON6n-0005Ce-68
	for qemu-arm@nongnu.org; Wed, 08 May 2019 09:59:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hON6l-0000eB-6F
	for qemu-arm@nongnu.org; Wed, 08 May 2019 09:59:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44544)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hON6j-0000cY-8S; Wed, 08 May 2019 09:59:42 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BBD830832E1;
	Wed,  8 May 2019 13:59:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DDA31001E6F;
	Wed,  8 May 2019 13:59:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 840911132B35; Wed,  8 May 2019 15:59:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1555560291-3415-1-git-send-email-hongbo.zhang@linaro.org>
	<1555560291-3415-3-git-send-email-hongbo.zhang@linaro.org>
	<CAFEAcA-poCxPqPtfhx4mUJ5pcOjn1Hz-WNxEt29f=JgpFMi4Kg@mail.gmail.com>
Date: Wed, 08 May 2019 15:59:32 +0200
In-Reply-To: <CAFEAcA-poCxPqPtfhx4mUJ5pcOjn1Hz-WNxEt29f=JgpFMi4Kg@mail.gmail.com>
	(Peter Maydell's message of "Tue, 30 Apr 2019 15:16:59 +0100")
Message-ID: <87mujxavy3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 08 May 2019 13:59:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 2/2] hw/arm: Add arm SBSA
 reference machine, devices part
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s7rR6vmk4LRH

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 18 Apr 2019 at 05:05, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>>
>> Following the previous patch, this patch adds peripheral devices to the
>> newly introduced SBSA-ref machine.
>>
>> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>> ---
>>  hw/arm/sbsa-ref.c | 451 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 451 insertions(+)
>
> Some fairly minor comments on this one.
>
>> +static void create_flash(const SBSAMachineState *vms,
>> +                         MemoryRegion *sysmem,
>> +                         MemoryRegion *secure_sysmem)
>> +{
>> +    /*
>> +     * Create one secure and nonsecure flash devices to fill SBSA_FLASH
>> +     * space in the memmap, file passed via -bios goes in the first one.
>> +     */
>> +    hwaddr flashsize = vms->memmap[SBSA_FLASH].size / 2;
>> +    hwaddr flashbase = vms->memmap[SBSA_FLASH].base;
>> +
>> +    create_one_flash("sbsa-ref.flash0", flashbase, flashsize,
>> +                     bios_name, secure_sysmem);
>> +    create_one_flash("sbsa-ref.flash1", flashbase + flashsize, flashsize,
>> +                     NULL, sysmem);
>> +}
>
> I think Markus might have an opinion on the best way to create
> flash devices on a new board model. Is "just create two flash
> devices the way the virt board does" the right thing?

Short answer: create flash devices the way the ARM virt board does now,
after commit e0561e60f17, merged into master today.  Possibly less
backward compatibility stuff you don't need.  As is, your patch creates
them the way the ARM virt board did before commit e0561e60f17.  Please
consider updating.

Longer answer:

The old way to configure block backends is -drive.

The newer -blockdev is more flexible.  Libvirt is in the process of
transitioning from -drive to -blockdev entirely.  Other users with
similar needs for flexibility may do the same.  We hope to deprecate
-drive eventually.

The traditional way to configure onboard flash is -drive if=pflash.
Works, but we need a way to configure with -blockdev for full
flexibility, and to support libvirt ditching -drive entirely.

I recently improved the i386 PC machine types (commit ebc29e1beab) and
the ARM virt machine types (commit e0561e60f17) to support flash
configuration with -blockdev.

I recommend new boards support flash configuration with -blockdev from
the start.

Questions?
