Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4316877wrm;
        Mon, 21 Oct 2019 02:34:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyE2V1LbW0qyNCwQE1036P3w3M8TYChE0mL2bLhIpo4/yE2xluQQcVE+bPOflfPR+RqILHU
X-Received: by 2002:a37:61c5:: with SMTP id v188mr21154730qkb.46.1571650461630;
        Mon, 21 Oct 2019 02:34:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571650461; cv=none;
        d=google.com; s=arc-20160816;
        b=HxGm6lU6KHXILCU/gAlZlaG8Oq/qIgu+B46UMFUZwrjStWen7cixU6rHuHw0CqiHV8
         fhZxV1e4hQ7SvyQIdLcyWNgtGDrF5LLIkMz4qY2GemA1jN+i8tTCFKw3UfmShqVT+APO
         GR6lCeypfHtiF0vH7tfe0RxwfU5kRw59myFS/kf25z3LMqRdoP6427u5UqF7qdbxDgcp
         +w8jPIdfpDb7iTz8L7kBX968hzuOsU5GV9aw/dT56Z/c38S1KZJqpHJCJXBeofuNcTAV
         8+gL2zEeSxVFGFqt+H8F7KWR+kj8Q4ml+0t47vSbHC3R9F+OPcGNBIH7zD5Wxi2xGnFi
         gzrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=lq1klLZedFlF7xfyKaDvVvqYHvNsNJSQkkoJGkYqW1M=;
        b=d0JDNvXE43dkQBIF0FS3naMKrqEuWk8I/yrWgeRkHuybk7Q1Tmy8GaY3JRdsDxKxkT
         TPJ60ZT5xtJ5/MyYZfbIs+zUJT7rjAVlbwIeRwDeoTVIKw76i7ZVDhHupP0oAJhHR1q6
         9IQ1L2X3VV4knpiel2GOApLzEwtrMxO8e2RKpYidzErC5ixfT/Yo8vIFiIw/RPoayu9X
         qMOUvLmw2jrLq1n7764KFpoXciYFQSDND/+N+88aM3wy6HxcSOqH6R5iMEebFc/kD0Ek
         IwVn4mh3EtOyO54jWvW25x8L861bY/s5ecJiVCqobaTaoVE/8uOND3rw4bTMsHi99R+D
         VMgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18si12312236qkl.303.2019.10.21.02.34.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 02:34:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMU4z-00074J-0V
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 05:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36148)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMU4m-00070T-88
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 05:34:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMU4h-0006My-8r
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 05:34:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43258)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMU4h-0006MJ-1N
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 05:34:03 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 33C4EC057867
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 09:34:01 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id o10so6938037wrm.22
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 02:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cDZe1+pi/7RJL1XV5KYr6L0zAgLFTBHD3z+IBh9RMyQ=;
 b=lfVL7sxDbioGBBKd84EOMMCCq/kIbYikDYj9hbx3xrH9vHl/0Zxdvb5drnesk0Rsyt
 ddG6jRSrP4gkH50PPyPQUelx4XhKsmTlQieWd+jmy2EkBKIbdxiJAr1mqecjLuDIEiiL
 KPOCz0kaM5wryh/P9Bf4Cl7WVtwHa3zKTgZI8p9ibMCR2Li4q737v0TVv60rg2KT4ncv
 wGv5lKgi+KslJIVTzodPzM6AazLg2L6W6cceuYWrL7vVettyLrbL6GViloVhdUehMfrt
 TOLUGZUCqeti7OfK+eHTgAO2v3dfjoay8jnsowy2n2n9l6YMNQK/eIny9YlROX8iUyHd
 euSQ==
X-Gm-Message-State: APjAAAVSEpSnVPQNENR8PE/FRRHyAQuPWvpg1eJ5EW1leoeJ0pJ2ODIz
 rOuPPEnyth7jodBO+cx5cdMsq/H+U2jfzh1zdl5lQN+GmnaMif32SJ+h8NI+NGuaxxGcqufemnh
 SdJTQ42NkKyjL
X-Received: by 2002:a05:6000:114e:: with SMTP id
 d14mr18169168wrx.47.1571650439972; 
 Mon, 21 Oct 2019 02:33:59 -0700 (PDT)
X-Received: by 2002:a05:6000:114e:: with SMTP id
 d14mr18169107wrx.47.1571650439670; 
 Mon, 21 Oct 2019 02:33:59 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id h17sm12430971wmb.33.2019.10.21.02.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2019 02:33:58 -0700 (PDT)
Subject: Re: [PATCH 12/21] hw/arm: Let the machine be the owner of the system
 memory
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-13-philmd@redhat.com>
 <CAFEAcA8bhP9X-2AaTus9=GtEAqmnNA9me6hv8U=vXYwjQp_CnA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <42944bea-4b15-7bdf-61a7-f1c73f5f7c2b@redhat.com>
Date: Mon, 21 Oct 2019 11:33:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8bhP9X-2AaTus9=GtEAqmnNA9me6hv8U=vXYwjQp_CnA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Paul Burton <pburton@wavecomp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WdiqqWivL1Uy

On 10/21/19 11:22 AM, Peter Maydell wrote:
> On Mon, 21 Oct 2019 at 00:01, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>=20
>>   hw/arm/virt.c             | 2 +-
>=20
> I think from a quick code scan that this is ok, but did
> you test that migration compat from old to new still works?
> I vaguely recall that there are some cases when adding an
> owner to a memory region changes the name string used for
> identifying the ramblock in migration.

It seems to still works:

$ make check-qtest-aarch64 V=3D1
QTEST_QEMU_BINARY=3Daarch64-softmmu/qemu-system-aarch64=20
QTEST_QEMU_IMG=3Dqemu-img tests/migration-test -m=3Dquick -k --tap <=20
/dev/null | ./scripts/tap-driver.pl --test-name=3D"migration-test"
PASS 1 migration-test /aarch64/migration/deprecated
PASS 2 migration-test /aarch64/migration/bad_dest
PASS 3 migration-test /aarch64/migration/fd_proto
PASS 4 migration-test /aarch64/migration/validate_uuid
PASS 5 migration-test /aarch64/migration/validate_uuid_error
PASS 6 migration-test /aarch64/migration/validate_uuid_src_not_set
PASS 7 migration-test /aarch64/migration/validate_uuid_dst_not_set
PASS 8 migration-test /aarch64/migration/auto_converge
PASS 9 migration-test /aarch64/migration/postcopy/unix
PASS 10 migration-test /aarch64/migration/postcopy/recovery
PASS 11 migration-test /aarch64/migration/precopy/unix
PASS 12 migration-test /aarch64/migration/precopy/tcp
PASS 13 migration-test /aarch64/migration/xbzrle/unix

This test migrate the virt machine.

Is this enough?

Regards,

Phil.
