Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4369546wrm;
        Mon, 21 Oct 2019 03:24:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzPz/w1EnLTtYerbyUnpXnA7WR6iiPNZ4c1oyaH/N3OkP69dVNuQkrlskIqtUls+o0I2DOi
X-Received: by 2002:a17:906:6bd5:: with SMTP id t21mr21182008ejs.277.1571653480828;
        Mon, 21 Oct 2019 03:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571653480; cv=none;
        d=google.com; s=arc-20160816;
        b=S9DO7v6+4tx7qzY/iYLnkNxT07t8sWFYuTSCAREeTjuBtKYZSPXgvovawCHmTey8am
         pHbgDzo4S1ZIHnGxUXIh35S/0zc3RmPnheOzuoa3lZH/8wG5bNVaxY1vSvDU4lpUKnJQ
         wHyqsT2qblq5sRBeP96q+4MJGJZjJxWVB2VtsfUtt3FXeDZ+d+k6q2A5byWLpJedf95F
         GWaz/9BOtHiU2oQZAEzbDMusu+euZ7RlZWbWEILGKtoGwstIALizGbj6PIEP02Ult+hk
         FmzTw3QasVW/MmPbLF7fik6NIc4oRFPvCJ4eO6TjgSbrRDOcKReZswaWfiQQqwA+lHTL
         nQ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=h8ZlWihgsznWLPsbuk4ZisxirI6eNviejnMaeGdLp4E=;
        b=gfB9ynymJf3e3mEVFXMdY3motH0wmENSwSbQ0Y3Hu34SCzdA2KbdIJenLv61nKvevH
         p1fAYrL7QOe++YdpTyvfslRZcDJGSlIGC9gNl1LIxG4ld16jk/UgfRUCWVXXTTCAvf4y
         EhjZBVE7V1ZD22u6AVllH5ct/y846dbkz2yGNXm4Kvn6+LD7L5x1QGNH72aW1XjHypFj
         yBEE23jrqFf67A9pTFo6zfABavMsvg/mep9tj2f1cSZ7xDRpFQ7WN36lUDE2LRrRPDHE
         GEk6bXdYaiKCZt4IWtss1eLFjcZRwcdPkLpMqJFqJA7KZIB9HX6TGilxFHkO9eXOw39n
         FwKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z47si4570685edd.280.2019.10.21.03.24.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:24:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMUrf-00022Z-R6
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 06:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42231)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMUrM-0001oz-PY
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 06:24:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMUrK-00087f-C9
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 06:24:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48200)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMUrK-00087A-4K
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 06:24:18 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A360185550
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 10:24:16 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id o10so7009200wrm.22
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2019 03:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y6lgkEMeo/P5YqhO22xBujs9RBLH4RZsExzcJGqQ9hg=;
 b=C07xa+YsQye9jCDYxOKzMXSzhMpmFwxDTh4vE0fTrpCXg3aWKUhko22zrnjtbu1jhf
 28NjSuhKKmaoe/S+6JaQAen6EAFhMQPCAQlhIbFzbq57YWN4tfo0XoXNmX9PnCsBPvcm
 Zol6dbSSIsfeblzi52pNLmeJ4jP3BaT1qKAEpWW5y62wrtgqQ+sUy4YBULYyWxICD4nM
 Gry+tfBCtu1ggvgTlLNIgNhVJWicK/qCHh9PBzvGL5sy/KHwaDFKbbPIYvXD9Xdaqmoa
 5d1q7iX/6VsYwz9iFxVq+Rm5fnhWad45L9oqtMCw/cW2vu5XclFS7RLFTXNWgQz+V7fj
 sEsA==
X-Gm-Message-State: APjAAAUwQ/b6UKaHGbxUG2FmamsqNt+C7g0Y1ss7E/B7x8z3vbSP9bZd
 fpJu5yHXhml9n+jB21qidOwM6rbY6mLyX8tLMzuZYa9997uPNhTb3+N8lb14PmCsfuNpgv6bOgr
 BeBgbEig4Z85q
X-Received: by 2002:adf:b1d1:: with SMTP id r17mr4572340wra.201.1571653455395; 
 Mon, 21 Oct 2019 03:24:15 -0700 (PDT)
X-Received: by 2002:adf:b1d1:: with SMTP id r17mr4572271wra.201.1571653454929; 
 Mon, 21 Oct 2019 03:24:14 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id n205sm1642696wmf.22.2019.10.21.03.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2019 03:24:14 -0700 (PDT)
Subject: Re: [PATCH 12/21] hw/arm: Let the machine be the owner of the system
 memory
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-13-philmd@redhat.com>
 <CAFEAcA8bhP9X-2AaTus9=GtEAqmnNA9me6hv8U=vXYwjQp_CnA@mail.gmail.com>
 <42944bea-4b15-7bdf-61a7-f1c73f5f7c2b@redhat.com>
 <CAFEAcA8hJ7bQeQNdWB6Rg4P7RzYmcXZmQKm7pnDAOutADHe9jA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <20804096-7b34-9d79-1d93-fa9a31bbfd66@redhat.com>
Date: Mon, 21 Oct 2019 12:24:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8hJ7bQeQNdWB6Rg4P7RzYmcXZmQKm7pnDAOutADHe9jA@mail.gmail.com>
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
 KONRAD Frederic <frederic.konrad@adacore.com>, Rob Herring <robh@kernel.org>,
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
 David Gibson <david@gibson.dropbear.id.au>, patchew-devel@redhat.com,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RJ/sV1kDyBaU

Cc'ing Paolo/David.

On 10/21/19 11:39 AM, Peter Maydell wrote:
> On Mon, 21 Oct 2019 at 10:34, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
>>
>> On 10/21/19 11:22 AM, Peter Maydell wrote:
>>> On Mon, 21 Oct 2019 at 00:01, Philippe Mathieu-Daud=C3=A9 <philmd@red=
hat.com> wrote:
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>> ---
>>>
>>>>    hw/arm/virt.c             | 2 +-
>>>
>>> I think from a quick code scan that this is ok, but did
>>> you test that migration compat from old to new still works?
>>> I vaguely recall that there are some cases when adding an
>>> owner to a memory region changes the name string used for
>>> identifying the ramblock in migration.
>>
>> It seems to still works:
>>
>> $ make check-qtest-aarch64 V=3D1
>=20
>> This test migrate the virt machine.
>>
>> Is this enough?
>=20
> No, you need to test migration from a QEMU binary without
> this patchset to a QEMU binary that has it. Otherwise you're
> only checking that the new version can migrate from itself
> to itself. I find the easiest way to test this is just to
> use the 'savevm' command to save a state snapshot to a
> qcow2 disk image while running the old binary, and then run
> 'loadvm' with the new binary and check it restored OK.

I did not think if this case.

I followed your blog post [*] and tested the migration works OK.

Paolo, now thinking about regular testing, we should add this testing to=20
patchew too. Something like:

- when mainstream/master is updated, patchew build QEMU (it should be=20
already mostly ccached) and generate some vm dumps with 'savevm'.

- build/test the series

- if series succeeded testing, run 'loadvm' tests

[*]=20
https://translatedcode.wordpress.com/2015/07/06/tricks-for-debugging-qemu=
-savevm-snapshots/
