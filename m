Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4688171wrm;
        Mon, 21 Oct 2019 07:58:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxcrKjwZ51egqKTVq6HjjePu2BGsVVW4MilEFg2hLc8iDXJ5pyttSfgB4hksHWzrrfvQlib
X-Received: by 2002:ac8:117:: with SMTP id e23mr6737423qtg.82.1571669924642;
        Mon, 21 Oct 2019 07:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571669924; cv=none;
        d=google.com; s=arc-20160816;
        b=qVsik0lad2rGbsWMVYHg/dIWICGaMfdGKgF62yG/anbbdVLhv+aE6IM79ymlxICgrd
         Rd6taunbRdvABAhAB51s1pWdzSr+ijIObgWHl3GP4Kkb1xgc5ARAbefjApyucmZY4nbq
         Mp6ipvpfcwsPhalGhMoWrJRGMTMoRjHXFW8VPdtRp2mTIhobMyoTuWS1JaLlGD79KTtl
         CZQv6KLFxX+Oglz6V/QZUNYAJrQn5wpIp2HIFxraqt4kRLsuX4ZndjQI9d+a++20wokz
         vyYg9SxmuD3Ix0malVPzryA8mMeMvJCqLuRFEa3pSFCR/TyPFLx1HEryuBIgcLGb3Mnp
         uqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=6abUmKP/NmKNmjhVzPa7Sp7wiDwQ32hBBylFGoOY8wk=;
        b=j1lglK0QOO28jdai9UDw+9iw4uWYfRxMRYkmxTz6VtTg8qvS0hwJrAmRBK/Em4Jd8v
         VAELwtoLdgweYvOmMd+ByhbXsIfP0SL1HKwhuNs7p7wr2Ke07W/9A6ACwktvvUULvQk7
         utoTF3Kav+pkAENJpb0liIPZYc7I+KzAyaRz79XF7q9vwSVrfay3iUCew9FrS5dW8OkH
         TobYqeEYeGp73zW6K0eISYbTjksdB8kMIy1Px1L5LGxR7rBmZxaKruA43Z7jopOp2LQa
         Vu7n+tR48JA45DOZpN7VnoqJq6bU5ucxV1OkNAWJbVofKLMDbPEW29Hxbhsa15jSGtmt
         meaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LAWMQQ10;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y128si13158211qke.369.2019.10.21.07.58.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 07:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LAWMQQ10;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMZ8t-0005uo-Vn
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 10:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53345)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iMZ8i-0005qD-6A
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 10:58:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iMZ8g-0004pN-Fe
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 10:58:31 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47688
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iMZ8g-0004pA-Ay
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 10:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571669909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6abUmKP/NmKNmjhVzPa7Sp7wiDwQ32hBBylFGoOY8wk=;
 b=LAWMQQ10FejlKicVZ8ltaO2SY45Yi/caa5U1SO7+Icot0jKYIlaC2iQ2PclQsroz4qdAks
 cfM+d3IJy/U87+ib854vDqqpfrgX8/46053Bgf7evwtQNKuwGkVqkdFHCMmB14uqGyRO+c
 Pw+85Ps6kp4mgKqnYnn8vXVgWSWpjl4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-kfAcDzWyOuik_j-T6uwnuw-1; Mon, 21 Oct 2019 10:58:26 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1943F107AD31;
 Mon, 21 Oct 2019 14:57:56 +0000 (UTC)
Received: from work-vm (ovpn-117-232.ams2.redhat.com [10.36.117.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C4184B5;
 Mon, 21 Oct 2019 14:57:31 +0000 (UTC)
Date: Mon, 21 Oct 2019 15:57:29 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 12/21] hw/arm: Let the machine be the owner of the system
 memory
Message-ID: <20191021145729.GC5837@work-vm>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-13-philmd@redhat.com>
 <CAFEAcA8bhP9X-2AaTus9=GtEAqmnNA9me6hv8U=vXYwjQp_CnA@mail.gmail.com>
 <42944bea-4b15-7bdf-61a7-f1c73f5f7c2b@redhat.com>
 <CAFEAcA8hJ7bQeQNdWB6Rg4P7RzYmcXZmQKm7pnDAOutADHe9jA@mail.gmail.com>
 <20804096-7b34-9d79-1d93-fa9a31bbfd66@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20804096-7b34-9d79-1d93-fa9a31bbfd66@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: kfAcDzWyOuik_j-T6uwnuw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Leif Lindholm <leif.lindholm@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Jan Kiszka <jan.kiszka@web.de>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
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
X-TUID: KKnQmu4AT3pN

* Philippe Mathieu-Daud=E9 (philmd@redhat.com) wrote:
> Cc'ing Paolo/David.
>=20
> On 10/21/19 11:39 AM, Peter Maydell wrote:
> > On Mon, 21 Oct 2019 at 10:34, Philippe Mathieu-Daud=E9 <philmd@redhat.c=
om> wrote:
> > >=20
> > > On 10/21/19 11:22 AM, Peter Maydell wrote:
> > > > On Mon, 21 Oct 2019 at 00:01, Philippe Mathieu-Daud=E9 <philmd@redh=
at.com> wrote:
> > > > >=20
> > > > > Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > > > > ---
> > > >=20
> > > > >    hw/arm/virt.c             | 2 +-
> > > >=20
> > > > I think from a quick code scan that this is ok, but did
> > > > you test that migration compat from old to new still works?
> > > > I vaguely recall that there are some cases when adding an
> > > > owner to a memory region changes the name string used for
> > > > identifying the ramblock in migration.
> > >=20
> > > It seems to still works:
> > >=20
> > > $ make check-qtest-aarch64 V=3D1
> >=20
> > > This test migrate the virt machine.
> > >=20
> > > Is this enough?
> >=20
> > No, you need to test migration from a QEMU binary without
> > this patchset to a QEMU binary that has it. Otherwise you're
> > only checking that the new version can migrate from itself
> > to itself. I find the easiest way to test this is just to
> > use the 'savevm' command to save a state snapshot to a
> > qcow2 disk image while running the old binary, and then run
> > 'loadvm' with the new binary and check it restored OK.
>=20
> I did not think if this case.
>=20
> I followed your blog post [*] and tested the migration works OK.
>=20
> Paolo, now thinking about regular testing, we should add this testing to
> patchew too. Something like:
>=20
> - when mainstream/master is updated, patchew build QEMU (it should be
> already mostly ccached) and generate some vm dumps with 'savevm'.
>=20
> - build/test the series
>=20
> - if series succeeded testing, run 'loadvm' tests
>=20
> [*] https://translatedcode.wordpress.com/2015/07/06/tricks-for-debugging-=
qemu-savevm-snapshots/

Avocado certainly already has an option for specifying source and
destination qemu separately; I've used that for testing
cross version in the past.

The challenge is finding a command line/set of devices for each
architecture that's expected to be stable.
You want a command line with as big a set of devices as possible (for
coverage) yet really is tied to machine type.

Dave

--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

