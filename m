Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2413820wrv;
        Thu, 18 Jul 2019 08:33:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyN/CJF2FuP3LOcqsIVrcZMVQ65VP1ttvH1K87MXVHN4XOBgH19OTlDFUnHfd9ClOY8tIym
X-Received: by 2002:a50:940b:: with SMTP id p11mr42110234eda.194.1563464013771;
        Thu, 18 Jul 2019 08:33:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563464013; cv=none;
        d=google.com; s=arc-20160816;
        b=FUKMSw1AX1be2doye140r0j0JlryQUNFGMAKt1XbTjo1QWPd9Am3v/XAhyfUnyQOPa
         8ric/P5pxBpd6f/DuPgvdRES7q09Ja3mLEEj0JGFdmmZGcFo54T2/xQjT3Y0qqYc8E4j
         8oy0F26EVxxK7izgq1QI3BACagXx7na7yxvESSd0gnJlB0SlLyVYwdQ5VQc2N8Eit9f+
         jbtRHpLjA3iUa1Kff9fr6N83nNfx2mo9Z7xz/HpwgkVLuA5O1wkym1cRUusj2/cN2iWV
         /QRYBnf98DUg7tUS1ndyTYuQk7IvvRu8aC+gvNytE5fUNHnqG29xkgtaiG7RyhkDGNGt
         EUxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=klx9LNwsHI+HyfJS5DEmG6V6fmRWPe1Lm+XglBN3+Qo=;
        b=jXSWg6SCfRY6spfom+BBIDrI0K7hxffGM3FovabGLeEOIJ5wL6dhQBKvlx6AVsvNa4
         l7JaBYKgE7TeNdc1XIu05gNgxjLCgpK/BmeEILLDjiG4z2TAUgL9VhrlL+Y7ddsOukFM
         XfkNM2D+rKuYhwh0SH7cWo/QF6M/ut6jMwyPC9O3+YheUpdvH36YcLdmMTs0PEIbSATD
         e28dP+mR6gpEyKohw7I34e8TtBItFZgWrQPwUoi3tUHnIG0afOxatW/74eMxY+Lmk8CA
         Et8RQKij7HPkeme3WfLSR1gBvJSJN9q6JgQpIqtZoPb/yWVEZyxfYrTBjMXpS6fsAMKL
         /JYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b52si52567ede.326.2019.07.18.08.33.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2019 08:33:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ho8PU-0006xt-St
	for alex.bennee@linaro.org; Thu, 18 Jul 2019 11:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49534)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1ho8PS-0006vm-90
 for qemu-arm@nongnu.org; Thu, 18 Jul 2019 11:33:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ho8PR-0007y4-AX
 for qemu-arm@nongnu.org; Thu, 18 Jul 2019 11:33:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64805)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1ho8PR-0007xS-3g; Thu, 18 Jul 2019 11:33:29 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D227430860D5;
 Thu, 18 Jul 2019 15:33:27 +0000 (UTC)
Received: from gondolin (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31E4819C5B;
 Thu, 18 Jul 2019 15:33:11 +0000 (UTC)
Date: Thu, 18 Jul 2019 17:33:08 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190718173308.224f01a9.cohuck@redhat.com>
In-Reply-To: <a88a7f65-60c2-22a8-5523-faedabc06b44@redhat.com>
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
 <50befb09-d381-4362-9cd1-6fb11c96a719@linux.ibm.com>
 <633cc3f7-eb20-1bfe-03d2-e481be188eb1@redhat.com>
 <87f07cd0-ebbc-3569-9070-5700e47d4af8@linux.ibm.com>
 <a88a7f65-60c2-22a8-5523-faedabc06b44@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 18 Jul 2019 15:33:28 +0000 (UTC)
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
 Helge Deller <deller@gmx.de>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "open
 list:S390" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>, "open
 list:RISC-V" <qemu-riscv@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bLK1gTFFH/gn

On Wed, 17 Jul 2019 17:04:54 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 17/07/19 16:54, Collin Walling wrote:
> > PCI host plugging will check for the MSI-X capability on the
> > PCI device. If the MSI-X cap is missing, we fail device plugging.
> > We do not check for MSI. Only MSI-X.
> > 
> > Specifically, the capability is represented by PCI_CAP_ID_MSIX
> > in pci_regs.h  
> 
> The code in Linux says that single MSIs are supported too:
> 
>        if (type == PCI_CAP_ID_MSI && nvec > 1)
>                return 1;

Interestingly, the check for MSI-X in QEMU seems to have been
introduced in 857cc71985dc ("s390x/pci: merge msix init functions"),
but that commit does not give a rationale (maybe it just referred to the
existing code structure?)

A quick look through the code suggests that single MSIs should be
supportable; can someone with access to the details verify?
