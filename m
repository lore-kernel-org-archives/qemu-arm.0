Received: by 10.25.208.211 with SMTP id h202csp456351lfg;
        Thu, 17 Mar 2016 06:55:58 -0700 (PDT)
X-Received: by 10.140.40.138 with SMTP id x10mr14248735qgx.2.1458222958612;
        Thu, 17 Mar 2016 06:55:58 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j32si7920145qga.91.2016.03.17.06.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 06:55:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agYP8-0007Ue-6w
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 09:55:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas.hanson@linaro.org>) id 1agYOG-0006FT-2X
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 09:55:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thomas.hanson@linaro.org>) id 1agYOC-0001dV-0w
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 09:55:04 -0400
Received: from mail-ob0-x236.google.com ([2607:f8b0:4003:c01::236]:35673)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas.hanson@linaro.org>) id 1agYOB-0001bw-Po
	for qemu-devel@nongnu.org; Thu, 17 Mar 2016 09:54:59 -0400
Received: by mail-ob0-x236.google.com with SMTP id fp4so84540859obb.2
	for <qemu-devel@nongnu.org>; Thu, 17 Mar 2016 06:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=Ieg+HWQvYgh73JcEQTPmi+4AkDKPrQxCnI1u/ixQuJ8=;
	b=NaWsTpnr5Arh6WhAz6rPyZQc385j7TvEtlrLqHN4crUKYrKi3MchMtRFVuq07ADJYB
	yx3XOnbOyaMedAB9d33ihV5XTHcN1VHY4YrmvyufdfktcNbKiHOs+SWxg/q72WhryUXe
	ImnI0ckVYvF9cJcm1KBHrbhVwZuRt9i0G1rZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=Ieg+HWQvYgh73JcEQTPmi+4AkDKPrQxCnI1u/ixQuJ8=;
	b=iUVBVz6abxoVpnhBD3EVl+R6liMK+sE9fV4KbSYP+VlZzm5YLntfsAMmp9z3N3UiLB
	9ezwUJJ6FDBkP1zKgWIaC3ypMOT7dq9casASMhXE/Oa5hu8br85sdIukUFGYp69W9DgY
	ypvtxXLyCHj2nYQDod1e8bc4gz/AaKH8+R/uDkRa/qEa5drGwY1vLHFQt2PEShpp4/N+
	BwYp6bHNOEgZJ5GJ2eK1PJZOJu0jeOgbUQCZLQUfZXhyZjVRv96NtBVIUWGd+ikDrrVB
	px4qRAxZ2xrXLnSCGdGVrdga2evCc2PjY4o7zVKxjXccr2AR+iUteS9Ln+/RWGbOHrbC
	qX+Q==
X-Gm-Message-State: AD7BkJIdFZkPtlfieEORmaPTji5Zo61wx/lDltibI0+8fSYcuoff0wX7IiIEREE6nXlU+pir2xLEv9FSGn9SQP9U
MIME-Version: 1.0
X-Received: by 10.182.107.137 with SMTP id hc9mr6038557obb.74.1458222896720;
	Thu, 17 Mar 2016 06:54:56 -0700 (PDT)
Received: by 10.157.16.20 with HTTP; Thu, 17 Mar 2016 06:54:56 -0700 (PDT)
In-Reply-To: <CAFEAcA_T_Bfiv_ESnM5wTVUeP8S2Pk-RLz6xpvPYACm1hj4E9A@mail.gmail.com>
References: <1458210790-6621-1-git-send-email-peter.maydell@linaro.org>
	<CAA8zJ3CYn+Pjp8RphPR7+L=CeOZ3nDfosjF6yPZeefSj1utBag@mail.gmail.com>
	<CAFEAcA_T_Bfiv_ESnM5wTVUeP8S2Pk-RLz6xpvPYACm1hj4E9A@mail.gmail.com>
Date: Thu, 17 Mar 2016 07:54:56 -0600
Message-ID: <CAA8zJ3AvbqKBSMECUMA8=p36-Rx-OrbGwNbwv=Pq6in3T5wAfw@mail.gmail.com>
From: Thomas Hanson <thomas.hanson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::236
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Antonio_Huete_Jim=C3=A9nez?= <tuxillo@quantumachine.net>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] hw/arm/bcm2836: Wire up CPU
	timer interrupts correctly
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: b8Gz8feDKuxW

On 17 March 2016 at 07:46, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 17 March 2016 at 13:37, Thomas Hanson <thomas.hanson@linaro.org> wrote:
>>
>> On Mar 17, 2016 4:33 AM, "Peter Maydell" <peter.maydell@linaro.org> wrote:
>>>
>>> Wire up the CPU timer interrupts in the right order, with the
>>> nonsecure physical timer on cntpnsirq, the hyp timer on cnthpirq,
>>> and the secure physical timer on cntpsirq. (We did get the
>>> virt timer right, at least.)
>
>> What drives the order?
>
> This is modelling the hardware:
> https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2836/README.md
>
> The interrupt controller has 4 lines named CNTPSIRQ, CNTPNSIRQ, etc,
> and we need to hook the lines from the CPU up to the interrupt
> controller appropriately. The names we ended up with in QEMU's
> CPU model (GTIMER_PHYS, etc) don't match the signal names that
> a hardware A7 uses, which is slightly irritating, but not a big deal.
>
> The A7 TRM lists which timer is which signal:
> http://infocenter.arm.com/help/topic/com.arm.doc.ddi0464f/BABBABDJ.html
> (though you can pretty much guess from the signal names).
>
> thanks
> -- PMM

Ah, thanks.  I was thinking time-order. It's still early...
