Received: by 10.182.158.201 with SMTP id ww9csp4384240obb;
        Wed, 23 Dec 2015 15:59:26 -0800 (PST)
X-Received: by 10.140.25.169 with SMTP id 38mr39624327qgt.73.1450915166358;
        Wed, 23 Dec 2015 15:59:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d204si42304488qkb.109.2015.12.23.15.59.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Dec 2015 15:59:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBtJW-00037T-5F
	for alex.bennee@linaro.org; Wed, 23 Dec 2015 18:59:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aBtJT-00034C-U3
	for qemu-arm@nongnu.org; Wed, 23 Dec 2015 18:59:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aBtJS-00082r-Vh
	for qemu-arm@nongnu.org; Wed, 23 Dec 2015 18:59:23 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:36939)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aBtJQ-00082J-Qb; Wed, 23 Dec 2015 18:59:20 -0500
Received: by mail-wm0-x22a.google.com with SMTP id p187so166222772wmp.0;
	Wed, 23 Dec 2015 15:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cwRLXk+royoEfI7SM+zsOX0RTHZes6Yzcio5UZ5sakM=;
	b=kGe3vUb2kSAuHgcbKS1sCAezvFKb9J+9kQjxTLfLRpY7ANVBQ8wiIZM76bBX5j7sWR
	e1C1lEO6vSNxZVE1kiH+IASIwwdj7flFvQ18COufV/o6Hoe+pVqczs5eswJlX2k9kIWG
	K5ZE5X20GeJLkaJyQV7CEXB4VmLwWLhtLUu0d0j+/cjuMuZN5WnzMoJdwkIamQVvTziR
	yBIJ3JMal/BU01AjTjayQl5iR1ppvEOJgqiL9ZTGeH4HL33QkarXB4htT+fIcbhPpyWD
	QnUv91xHPJQz9LSCpkJ+4woMkHCLsmTxG/XSd0P4yuJzY5IYOQRXWWqAN/OkyoiFCttM
	9MUA==
MIME-Version: 1.0
X-Received: by 10.194.204.166 with SMTP id kz6mr36778968wjc.174.1450915160113; 
	Wed, 23 Dec 2015 15:59:20 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Wed, 23 Dec 2015 15:59:20 -0800 (PST)
In-Reply-To: <567B04FA.2030903@redhat.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=rGg5pG_XFL0c6C-i-Mkobzd+D-KgrUE1bdt1RBsD3bGg@mail.gmail.com>
	<BLUPR0301MB20345C0D49B62FE27C9BB9439EE40@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=owo1JtwWzDneGm9b+xe708eRDLXDQGgvVm1kkSLMo-hg@mail.gmail.com>
	<567B04FA.2030903@redhat.com>
Date: Wed, 23 Dec 2015 15:59:20 -0800
Message-ID: <CAPokK=rX7pxfhP7GcoZpDGpgOATYa1PHvMbh9F3_eYg6vT-Ecw@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 1/8] bcm2835_sbm: add BCM2835 mailboxes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: v+49kKDWjBvQ

On Wed, Dec 23, 2015 at 12:32 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 22/12/2015 00:33, Peter Crosthwaite wrote:
>>>> >>
>>>> >> case 0x80..0x8c
>>> >
>>> > Woah! Is that standard C?
>>> >
>> Yes, its probably one of the more recent language standards though.
>> QEMU does use to more modern features liberally.
>
> It's actually "case 0x80 ... 0x8c:".
>
>>> Notice that this file comes from Linux. I know it's not pretty, but

Where in Linux exactly? I am actually having trouble finding the
original source. Grepping around linux-next, there is no mach
bcm-2708. I can see this mach in an rPI specific fork, but I don't see
it in upstream Linux.

Is it the case that Gregory did this work some time ago now, and that
original source has been refactored away to something different
anyway?

In the grepping I also notice that you are defining the regspecs in
header for the SP804 timer, which we already model and manages its own
defs. Those should be in an sp804 specific header, and Linux does the
same:

$ git grep TIMER_CTRL_DIV1
drivers/clocksource/timer-integrator-ap.c:              ctrl |= TIMER_CTRL_DIV16
drivers/clocksource/timer-integrator-ap.c:              ctrl |= TIMER_CTRL_DIV16
drivers/clocksource/timer-sp.h:#define TIMER_CTRL_DIV1          (0 << 2)
drivers/clocksource/timer-sp.h:#define TIMER_CTRL_DIV16 (1 << 2)        /* ACVR

>>> can we please keep it as-is, for comparison purposes? I'm not sure
>>> there's much value in cleaning it up locally...
>>
>> It looks very autogenerated and seems pretty nasty on the repetition.
>>
>> As implementers of the hardware, it is much rarer to need these
>> repetitious defs than the software users on the other side. "Do
>> something specific with CPU#3's Mbox#5" is going to appear in
>> software, but hardware implementers generally don't have a choice to
>> implement things specifically and it usually ends up being looped and
>> the exploded defs are never used. If there are only a handful of
>> genuinely single defs needed, can they be fished out?
>
> I see your point and I'm definitely in favor of rewriting headers from
> scratch when practical, but any cleanup made is a recipe for unwanted
> changes and bugs, especially if the source is full of repetitions.
>

If this is from Linux, and we want this to be immutable, then
shouldn't we be managing it via our existing linux-headers import
scripts?

Regards,
Peter

> Paolo
