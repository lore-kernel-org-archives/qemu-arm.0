Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4001077wrv;
        Mon, 15 Jul 2019 03:57:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqzpVwcaGO1nNagElEbnWcNTWx1RZguo4cfvanr6tJ4hGsJfqDZrsOUrYpdDH7GAiIDWjg
X-Received: by 2002:a17:906:914:: with SMTP id i20mr19939434ejd.213.1563188238446;
        Mon, 15 Jul 2019 03:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563188238; cv=none;
        d=google.com; s=arc-20160816;
        b=EYXJS5xvYMW5xbJl7a6A9O/SsA+kk+4itpfK83yRp9bwB82IbWeHSMgSjc4b83PESW
         uzRjHWTVEdwySauAT1qj0yWNU8E+xiZQZC1DyGE2ceN76RL7oEehOZ54vOHH7x2EUWad
         8UY97jtXLBY0ULVPohr3jDiaNbtpGRRV+DAJ5VZH6qr02wCvSMgpIbJrLJpawfeAKAw0
         pe/ktK0HuSHU6ANGz8+nQbV7M/7a4bQZ/19Oh/HTJKJz6GzwuG6QZ9BKBOOWfsAIk4B+
         NVJOImBAU6VAV9SfVRdfBQ8S1qwbtb3h1JO92Xb10p2xhA31bWuLttEPDeVgMVznIHsc
         AFCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=s4ctch656x6ipdB5ORnAvcmBWzm1HVpe5ngSQP8feBI=;
        b=sHkCyhKyiWWIRRsEZgXbZmxQiwjBmwMg8UWMjGv4uh5lWftieZe45Jua0k7jFFz4Ze
         aP3kKz7df3h0pheKxLt2Pkhfc/30MtE0RYkoYafrc6x+aHnZrmqrT9V9O9Q/yqlHfrW4
         FuFVV7Q5AiKzVSrDfPPlYBS59UnTByv1BULu8CZE6behKCyBMN0LD94k8QDgtzf66W1A
         hBE5W4VbLT93Y9ZriAV3gDCG8VXsv0XfQajpU75kbXWh2LB9CHo7XfSlf+BzScBE4JFn
         qDJcOjUj/PVL0ZCSn2J0zrQAcTzXn+k/WAcoZ1VnJCf5yluwXCCumZgyJ/uVAjxxcqaP
         qooQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16si10153011edb.209.2019.07.15.03.57.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2019 03:57:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmyfV-0006QH-Fo
	for alex.bennee@linaro.org; Mon, 15 Jul 2019 06:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42827)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hmyfR-0006QA-TN
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 06:57:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hmyfQ-00080w-Vv
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 06:57:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37200)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hmyfQ-000805-Qa; Mon, 15 Jul 2019 06:57:12 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 14ECB307CDD1;
 Mon, 15 Jul 2019 10:57:11 +0000 (UTC)
Received: from gondolin (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 363555D9D2;
 Mon, 15 Jul 2019 10:56:56 +0000 (UTC)
Date: Mon, 15 Jul 2019 12:56:53 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190715125653.6e65d575.cohuck@redhat.com>
In-Reply-To: <6d69e8ad-d720-ce04-20f2-a03193903078@redhat.com>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
 <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
 <6d69e8ad-d720-ce04-20f2-a03193903078@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 15 Jul 2019 10:57:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [qemu-s390x] [RFC PATCH 1/3] hw/Kconfig: PCI bus
 implies PCI_DEVICES
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
 Collin Walling <walling@linux.ibm.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "open list:S390" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DAiR+GSjKifC

On Mon, 15 Jul 2019 12:48:55 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 15/07/2019 12.19, Peter Maydell wrote:
> > On Mon, 15 Jul 2019 at 11:15, Thomas Huth <thuth@redhat.com> wrote: =20
> >>
> >> On 15/07/2019 11.55, Philippe Mathieu-Daud=C3=A9 wrote: =20
> >>> If a controller device provides a PCI bus, we can plug any PCI
> >>> daughter card on it.
> >>>
> >>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >>> --- =20
> >  =20
> >>> diff --git a/hw/pci/Kconfig b/hw/pci/Kconfig
> >>> index 77f8b005ff..0f7267db35 100644
> >>> --- a/hw/pci/Kconfig
> >>> +++ b/hw/pci/Kconfig
> >>> @@ -1,5 +1,6 @@
> >>>  config PCI
> >>>      bool
> >>> +    imply PCI_DEVICES =20
> >>
> >> No, please don't change this. This was done on purpose, since almost a=
ll
> >> PCI_DEVICES do not work on s390x (so s390x does *not* imply PCI_DEVICE=
S). =20
> >=20
> > But that means that every board that provides PCI has to have an
> > "imply PCI_DEVICES" line, which is pretty clunky just to work
> > around an s390x limitation.
> >=20
> > Is there some way in the Kconfig syntax for s390x to say
> > "no PCI_DEVICES" so we can have the corner-case be handled
> > by the s390x Kconfig in one place rather than in 20 places
> > affecting everywhere except s390x? =20
>=20
> IIRC the problem on s390x are the legacy IRQs. s390x has only MSIs. So I
> guess the correct way to fix this would be to introduce some
> PCI_LEGACY_IRQ switch and let all old devices that do not work with MSI
> depend on it.

s/MSI/MSI-X/, IIRC. Not sure how far 'legacy' would stretch.

cc:ing Collin in case there's something else.
