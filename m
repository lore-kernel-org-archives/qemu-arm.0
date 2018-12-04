Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8442990wrt;
        Tue, 4 Dec 2018 11:10:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UMjuMaO9U/PEymqjUx5vvdNrnfuKF9U+5SPQa3E8oCYpxpxP1EynBzEJXKWxJO7Ef2NDta
X-Received: by 2002:ac8:3065:: with SMTP id g34mr21304703qte.136.1543950653416;
        Tue, 04 Dec 2018 11:10:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543950653; cv=none;
        d=google.com; s=arc-20160816;
        b=nHxJmAZFf8JtGljBwL1eeHob8KJ2iAfNqGBlB68po4WUAP434sluVnFDXx/z2JEDeW
         P9KY3PbGGmnnCOHalxGX2NG44QwTFVl/KlA2b6/JNuE+pyGEED40mmlkdlEG8Szo+8+g
         ZJu4ACBIDU8dfBcZ2Wv2zR0X+VA634mexw8ZMwiH0LIXbEapFtmC4M5KWNuwY2N6+SuH
         l0rEMZWqXAK0fZEro693zxw0o1XuZWqgB8/5iSg6bzArbM2nbI0BtccbvFcTWYktWb0i
         2iT0zlzBa/G4jPxISChUtzvvzyqEDN64Dd7d5mQAwPhnm6SGZ3SRWZ+M97kLqTloJ9i9
         Qahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=4ykUOUaB4DVIq9evg7r1qeAppCJA5mC8erz5CAEVDjU=;
        b=l0Ym+BQhmgtoLBzGqlB/fs2qna2voSadIcp56iqpPsg8MfFLMA5AC6XScToGeMro6v
         +2w6wyUN9ypFo50KRNa3NvC+PtbEAESpA+xYVuodU/oolvotSbgZJm9JeKghF93iEKQF
         FMWHZfo9VkflqKZlLE1rPKD4reEDrvU4U7yAHlNvhbIOAHqXaPN7oL2PZRPE7a52gtDZ
         sqQvCDfb+vw61js0J6yZhdta7QamcB3OEeSW0PjF16byjTO/y2sxbjaaBqENYkBOhe/V
         Aze67m031ENvzyjxH6ciL+O9Lkj94LpAD3JuYnjylIEHeXS+AAP3E/wCx4FD+hsdWbkB
         g2QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o5si143468qkc.148.2018.12.04.11.10.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 11:10:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58632 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUG5t-0003ps-0t
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 14:10:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gUG5j-0003pk-JE
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 14:10:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gUG5g-0007ZA-S6
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 14:10:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53634)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gUG5g-0007YC-L0; Tue, 04 Dec 2018 14:10:40 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95BB5308403D;
	Tue,  4 Dec 2018 19:10:39 +0000 (UTC)
Received: from redhat.com (ovpn-125-67.rdu2.redhat.com [10.10.125.67])
	by smtp.corp.redhat.com (Postfix) with SMTP id 436EC100034B;
	Tue,  4 Dec 2018 19:10:36 +0000 (UTC)
Date: Tue, 4 Dec 2018 14:10:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20181204140755-mutt-send-email-mst@kernel.org>
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
	<CAFEAcA-oFFz-NtfwHmORxQd4rHsfKa1=tV1kyvPuGQoOZwDB3A@mail.gmail.com>
	<20181204124739.GA17825@redhat.com>
	<CAFEAcA_ovMgKPPjtYVASFqhzM7MX79EJYMZuFY4-FGRh4oqN8A@mail.gmail.com>
	<9ad451bd-7eb1-902f-6023-4b48bb84249c@redhat.com>
	<CAFEAcA-tzZVVXk+vV=uWOeL6dU3EnFiFRzLu8KR69Ju4PsPrJg@mail.gmail.com>
	<149484eb-c59f-2b22-aa45-d4e5f0abac07@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <149484eb-c59f-2b22-aa45-d4e5f0abac07@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 04 Dec 2018 19:10:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V11 0/8] add pvpanic mmio support
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Peng Hao <peng.hao2@zte.com.cn>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LNwjiFiV0xt6

On Tue, Dec 04, 2018 at 02:53:26PM +0100, Paolo Bonzini wrote:
> On 04/12/18 14:43, Peter Maydell wrote:
> > The point about PCI is that it is the same everywhere and
> > discoverable, and easy for the user to add to the system or not.
> > MMIO requires extra work for every board model that we want to
> > put the device into, plus extra on both kernel and QEMU side
> > for every system description mechanism (ACPI, dtb, whatever
> > some future architecture might use), even if we have the basic
> > "mmio pvpanic" device code already.
> 
> Looks like dtb is becoming a standard?  Even RISC-V switched from their
> own system description to device tree.  Anyway, this is not too
> important.  I agree with you about discoverability, on the other hand if
> we could have something defined by the vendor rather than QEMU it would
> be even better.  (Even better would be something that distro kernels
> already have support for, but that would be asking too much probably).
> 
> >> Also, while reusing code in general is nice, sometimes there are
> >> platform-specific ways to do it.  For ARM, for example, would it make
> >> sense to use an HVC/SMC that "extends" the PSCI, and pass the number in
> >> the PSCI device tree node?
> > 
> > If you want a hypercall then these days the arm HVC calling convention
> > includes mechanisms for discoverably determining whether a particular
> > hypercall is supported, so you wouldn't need to pass anything in the
> > ACPI or dtb. But I didn't get the impression that anybody wanted a
> > hypercall for this particularly.
> 
> Not for x86, where each hypervisor has its own hypercall number and even
> its calling convention.  But for ARM it already makes more sense.
> 
> >> Related to this, is there a more or less "standard" watchdog device on
> >> ARM that could be added to virt?  There is the SBSA watchdog, but it's
> >> ugly for implementation in KVM because it counts down with frequency
> >> equal to CNTFRQ (which I'm not sure if QEMU has access too, and also it
> >> doesn't play well with live migration).
> > 
> > The i6300esb is PCI, presumably that would work?
> 
> Yeah, I was wondering if there was something in PrimeCell.  I found
> SP805 exists now.
> 
> >>> I notice also that there's a mention in that thread that the pvpanic
> >>> ACPI table entry on x86 resulted in unhelpful Windows notifications
> >>> about new devices it didn't understand. Is that going to be an issue
> >>> for Arm with this mmio pvpanic ?
> >>
> >> Yes, it is probably the same as for x86.
> > 
> > I guess we need to find out if that is a problem before we can
> > merge this, then.
> 
> As long as the pvpanic device is not added by default it's okay.
> 
> Paolo

It isn't too bad, you just include a driver and then it's happy.

Isn't a device just for panic going too far though?
Should it be some kind of PV device that we
can use to add more pv stuff in the future, with
a panic option?

-- 
MST
