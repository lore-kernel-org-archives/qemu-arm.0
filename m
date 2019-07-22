Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6917158wrv;
        Mon, 22 Jul 2019 06:40:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzdz+9y6BnMMxLhw9DZ0d0uOB9SBK7vqEBUIguIJi9GPEw00V4TbGODG35Jho8ctPbqgTls
X-Received: by 2002:a17:906:d8ab:: with SMTP id qc11mr53787873ejb.219.1563802848632;
        Mon, 22 Jul 2019 06:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563802848; cv=none;
        d=google.com; s=arc-20160816;
        b=ZUv5lFpJUlxKf4GL0BEFbI7nnStOTbiHokhry2rkgAP8UiwQBnPJj3uN9Ow3ZijfZe
         iSO4SZs8+R5zhV0QiZkTTCXOUJALQwqB6njSSnX00nxFidHu9g3lma6zhoW09xwZlUOI
         uwZfrqXFK2dnJWrgii38Ad8fZYVl+qROPUal9aEFQ+VpHDQjH1VmJr+NOmPY6o8mbkb5
         6If71AqmJ4GVEJUr0mg48RzQa1A1+KE68naVib8PmsH7kkm7/63rscHalHLttYq7J9FN
         QN/hVZOnztUwC6Y/cLCd7+uC1EsT86TMhcmXLrsoTHyl0BpWZqUc2WD/u91gABOo896+
         iMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=QZtxKFJHOuFYhGMd4HERDnZ/M3IFhcth9r1KV1PrHwI=;
        b=ndFLZu7z95M31x+2FbwrKBQXtk29nVrwIb+T2NG+fKi6knUlwGb6Q7TJddkpnOd1Oq
         wLK2q7i0eQpK66neb4seuUijCPJGf85BlnE8TZEdlXak+CipISuGAauOeYA/+YUzDGDE
         9I5Wn1PQ02C0RKDmI/d5X6c/eFmnWFqeQeGcGuZ+J12N/mexD7wBVwhce6z3z6eOblIz
         VEeZe/lOoiVLAfLGQ5z9rOSLVemo6Lt9lpU+TWT7SlzSSv8uk69VGOsYDW3aFqsX4fyA
         eLvJbLkGz9AO6tif2fnwU2DHdLuRftbaZzZd2cR4zFXaAvS3QY6CA8xzxFR2OIYumq4+
         9VxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g39si5594339edc.434.2019.07.22.06.40.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 06:40:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hpYYZ-0005jO-Pq
	for alex.bennee@linaro.org; Mon, 22 Jul 2019 09:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54373)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hpYYW-0005j9-5v
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 09:40:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hpYYV-0004ZZ-7q
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 09:40:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49314)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hpYYU-0004Y3-UT; Mon, 22 Jul 2019 09:40:43 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3EF7A3082E1E;
 Mon, 22 Jul 2019 13:40:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-244.ams2.redhat.com
 [10.36.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 046431017E30;
 Mon, 22 Jul 2019 13:40:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6201F113865F; Mon, 22 Jul 2019 15:40:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
 <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
 <6d69e8ad-d720-ce04-20f2-a03193903078@redhat.com>
 <20190715125653.6e65d575.cohuck@redhat.com>
 <c1c68faf-0424-6c7c-e39f-42159457c3ee@redhat.com>
 <20190715130955.4a117388.cohuck@redhat.com>
 <13fce62f-234c-1b13-595f-5910c066bc4f@redhat.com>
 <6c39a198-e951-c0bd-1ddc-5d227afe72ff@redhat.com>
 <87a7dfth4i.fsf@dusky.pond.sub.org>
 <20190715181206.3cb1db93.cohuck@redhat.com>
 <799aa0f5-8850-5caa-5103-e1cf3cdb018f@redhat.com>
 <87h87m2knh.fsf@dusky.pond.sub.org>
 <beb5fe93-991d-ba2b-d2c1-51e01b912dbe@redhat.com>
Date: Mon, 22 Jul 2019 15:40:29 +0200
In-Reply-To: <beb5fe93-991d-ba2b-d2c1-51e01b912dbe@redhat.com> (Thomas Huth's
 message of "Tue, 16 Jul 2019 17:04:24 +0200")
Message-ID: <87wogayype.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 22 Jul 2019 13:40:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [qemu-s390x] [RFC PATCH 1/3]
 hw/Kconfig: PCI bus implies PCI_DEVICES
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
 Helge Deller <deller@gmx.de>, Richard Henderson <rth@twiddle.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "open list:S390" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: //MT0Mp2O+kZ

Thomas Huth <thuth@redhat.com> writes:

> On 16/07/2019 15.06, Markus Armbruster wrote:
[...]
>> 2. We want a way to Kconfig the PCI devices that work, i.e. only the
>>    ones that support MSI or MSI-X.
>> 
>> I don't like calling devices without any MSI capability "classic" or
>> "conventional devices".  I'd rather call them "MSI-capable" or
>> "MSI/MSI-X devices".
>
> But you still need a config switch that you can set to enable the
> non-MSI devices ... what's so wrong with "conventional" if that's even
> the wording from the PCI SIG?

PCI Express Base Specification, rev. 3.0, section Terms and
Acronyms:

    conventional PCI    Behavior or features that conform to the PCI
                        Local Bus Specification.

In other words, "conventional PCI" is non-Express PCI.

A PCI Express device *must* support MSI or MSI-X.  See PCI Express Base
Specification, rev. 3.0, section 7.7. MSI and MSI-X Capability
Structures.

A "conventional" PCI device *may* support MSI or MSI-X.  See PCI Local
Bus Specification Revision 3.0 section 6.8.  Message Signaled
Interrupts.

Conflating MSI-capable with conventional vs. Express is therefore wrong.

[...]
