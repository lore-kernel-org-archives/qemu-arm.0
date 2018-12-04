Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8025409wrt;
        Tue, 4 Dec 2018 04:48:05 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Uu469uMeQ2v8Rzm/zhnK9uPTn+BI+wTvvWzhAWxH6G77BDUfYtShSLOlISUu9WVACpM/Gf
X-Received: by 2002:aed:37e3:: with SMTP id j90mr19068571qtb.332.1543927685837;
        Tue, 04 Dec 2018 04:48:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543927685; cv=none;
        d=google.com; s=arc-20160816;
        b=d6x3i+/UQs6kLM7aOb8Lf5CDA7ODzc4eDL/89wFQovxBfPTNS5LC3PLlfj1buFl1Ft
         luW3CQkrabdwfbhTzeMK31g23oP48iUcPNNBkhbboh1qRY9ieDLHv0G2l4dUGtePaeOq
         twZ2Kzn6MCkvCJQ/luFPajLovBaqivDi9rHJ8iicLCVBHysJOz3nW731mDRofk8L80ij
         Ocjmc1xADUTkijch/9jvIVdBcooWDD7e22kfPAzhB8C3ehAj8CpWKSFGHvjmFITxE6mn
         7Kxx+Yk2ljrZGY24poBfuGlWe0vTh+0Z3yGWznMJLo3O7iDQvWgFWqayMzVWn1lup4Nn
         0wsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date;
        bh=2aioZCjKxib2oiJ49wzC9kqI+mf9ChA3dB9bFE8qu04=;
        b=KIYeUuCh3OC840RWCHe6SXR/f3rSllVkb1TAwlt8U0UuYaAG4CLXM8zUywfwYQ+5LA
         zrLW1kBjA+PJhpuZ276a3/TIbt5AYESLRgGKaRpsbiqNvZt9LNnaff8E2iGb4aFlveRA
         8wBHOo/V6Nhc3GnlW0setdiHMdlRHW4OxO3t/kRCDc8QrUgV1AcL9GjfpmPfeN4/1EaB
         vMsEu1EaKHI2lD8IUKPg1MayfdG57ycE4w2NadrLfoVlDJbJodJN/4f4MfTcMeidJ4v6
         MaGl32cPMeDi+Xk1n2/NPjsSb7ZqyCvZzQROOd4F10kf4MlRbYodY7KwbNsAnunucoAw
         NhgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g34si2380135qte.104.2018.12.04.04.48.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 04:48:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUA7R-000615-Cl
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 07:48:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gUA7D-0005uM-Tm
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 07:47:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gUA7A-0003Wy-4B
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 07:47:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52838)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gUA79-0003Wf-Sm; Tue, 04 Dec 2018 07:47:48 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15FF081F0B;
	Tue,  4 Dec 2018 12:47:47 +0000 (UTC)
Received: from redhat.com (ovpn-112-67.ams2.redhat.com [10.36.112.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 341BE600C7;
	Tue,  4 Dec 2018 12:47:41 +0000 (UTC)
Date: Tue, 4 Dec 2018 12:47:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181204124739.GA17825@redhat.com>
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
	<CAFEAcA-oFFz-NtfwHmORxQd4rHsfKa1=tV1kyvPuGQoOZwDB3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-oFFz-NtfwHmORxQd4rHsfKa1=tV1kyvPuGQoOZwDB3A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 04 Dec 2018 12:47:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V11 0/8] add pvpanic mmio support
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>, Peng Hao <peng.hao2@zte.com.cn>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XavXnGWnTuJ4

On Mon, Dec 03, 2018 at 06:50:03PM +0000, Peter Maydell wrote:
> On Mon, 3 Dec 2018 at 11:04, Peng Hao <peng.hao2@zte.com.cn> wrote:
> >
> > The first patches are simple cleanups:
> >      - patch 1 move the pvpanic device with the 'ocmmon objects' so we compile
> >                it once for the x86/arm/aarch64 archs,
> >      - patch 2 simply renames ISA fields/definitions to generic ones.
> >
> >      Then instead of add/use the MMIO pvpanic device in the virt machine in an
> >      unique patch, I split it in two distinct patches:
> >      - patch 3 uses Peng Hao's work, but add the MMIO interface to the existing
> >         device (no logical change).
> >      - patch 4 is Peng Hao's work in the virt machine (no logical change).
> >      - patch 5 add pvpanic device in acpi table in virt machine
> >      v2 from Peng Hao is:
> >      https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg03433.html
> 
> I would still prefer to see a more detailed examination of whether
> we can do this with a PCI device before we commit to taking the
> MMIO version into the virt board.

The original design rational for using an I/O port is mentioned here,
though it is quite brief:

  http://lists.gnu.org/archive/html/qemu-devel/2012-10/msg04361.html

[quote]
We have three solutions to implement this feature:
1. use vmcall
2. use I/O port
3. use virtio-serial.

We have decided to avoid touching hypervisor. The reason why I choose
choose the I/O port is:
1. it is easier to implememt
2. it does not depend any virtual device
3. it can work when starting the kernel
[/quote]

Later postings then exposed the port via ACPI

  http://lists.nongnu.org/archive/html/qemu-devel/2013-03/msg02293.html

After it had merged there were some changes and the question of turning
it into a PCI device was raised. Paolo was concerned that the guest OS
is in an unknown state (arbitrary locks held, data structures corrupt,
etc) when panic is fired, so simplicity of the I/O port was desirable:

  https://lists.gnu.org/archive/html/qemu-devel/2013-08/msg03309.html

Anthony countered that even a PCI device could simply do an outb() in
config space:

  https://lists.gnu.org/archive/html/qemu-devel/2013-08/msg03325.html

So it is not clear using a PCI device is in fact a problem in terms of
reliability at time of firing.


Perhaps more relevant is the question of how easily it can be initialized,
as that affects whether it can be used for panics during very early boot,
or from firmware:

  https://lists.gnu.org/archive/html/qemu-devel/2013-08/msg03296.html

Finally, there is also the point that PCI slots are precious, and this
is something to be enabled out of the box on all VMs, so you'd be removing
one extra PCI slot from general usage. Thus mgmt apps would need to start
adding PCI bridges sooner. Not a blocker but something to bear in mind
when weighing up options.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
