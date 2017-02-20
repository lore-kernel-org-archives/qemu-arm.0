Received: by 10.25.0.147 with SMTP id 141csp151768lfa;
        Mon, 20 Feb 2017 11:11:58 -0800 (PST)
X-Received: by 10.55.48.140 with SMTP id w134mr19963643qkw.253.1487617918398;
        Mon, 20 Feb 2017 11:11:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k33si13527468qtk.242.2017.02.20.11.11.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Feb 2017 11:11:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40582 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cftNN-0000dt-SA
	for alex.bennee@linaro.org; Mon, 20 Feb 2017 14:11:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cftMp-0008J3-JJ
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 14:11:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cftMo-00083X-C6
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 14:11:23 -0500
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:33599)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cftMo-000830-4m
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 14:11:22 -0500
Received: by mail-wr0-x229.google.com with SMTP id 35so29484577wrw.0
	for <qemu-arm@nongnu.org>; Mon, 20 Feb 2017 11:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O5bYuattbNdHhAXo0wqttQoU6SPExZh+noF8uONsGWs=;
	b=gUvjTURDevq+1c8Aq5ALOYNKOeW9CUtNxKiZPsrdjBLo9C1sPUoo+g7zxx0Z4/bY2X
	Qoa3x2wKd16NlBsoi5wLPeZZ1nW0JKPOkGF9SFaGzCy1sTrZIDqOZIcbCzbJfD9PtNhX
	wFoM7lgp7YWfTTKCjyw+htlnOIdycthMwBMAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O5bYuattbNdHhAXo0wqttQoU6SPExZh+noF8uONsGWs=;
	b=H/W/5p1wXgJ4qC1urpajjc0LRplkxUxVV14vF1HvOgd3U0bcC9N/IvO9h8l/uB9oCr
	3KqfOUFLBaNvMD9R/F3SUHZukxExtP/lj/HdiCSlgwu5ZsvldnpC7A3avNT+nYJHXmTN
	m/N9BHTtxanOLXbVC3My1YpYXQUlr1ibxfzZR7ua2Rm1Xlrd8ub22nLMSqTRzth9VeQC
	ikoRhKHoo+7Nf3nwBsKUOoDxnhvbMh/DxH3a640pSY3tri58o3UXI1wgzcCD7Kk5+PEV
	QIE+iilS7GvUO0YZcl3TK28j8sdabYSLOAkK8K9LtLYau3lbGhuCc21u6GWaM+D8pdHA
	n7jg==
X-Gm-Message-State: AMke39kIbIcSLzaxuzv98STUoVRmC3Sd5oHChBbu7HPrB+buoJDTTqp0ToJ7zuqQzL8hGHf6eAhl3cs2CHCy2kcD
X-Received: by 10.223.169.76 with SMTP id u70mr7293214wrc.187.1487617880895;
	Mon, 20 Feb 2017 11:11:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Mon, 20 Feb 2017 11:11:00 -0800 (PST)
In-Reply-To: <20170220195500.332a4844@nial.brq.redhat.com>
References: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
	<CAFEAcA9JWzUEmGa2Wxd5xPE4dVknOKBkt=wMda7CAgxzrgOc+w@mail.gmail.com>
	<20170220195500.332a4844@nial.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2017 19:11:00 +0000
Message-ID: <CAFEAcA-VAY8LM+8jE4B-L=0QdcY5FLvwmwGVbUhcXjnC9-AW+w@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-arm] [RFC 0/3] generalize parsing of cpu_model
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k0qmWFCLyW5i

On 20 February 2017 at 18:55, Igor Mammedov <imammedo@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> wrote:
>> This API seems a little awkward for the SoC case, where
>> the board model doesn't actually know what the default
>> CPU model or the valid CPU models are, because it just
>> wants to say "create me a BCM2836 SoC" and let the SoC
>> object deal with determining whether it's always a cortex-a15
>> or if it might allow some user configurability either in
>> cpu choices or in optional flags.
>> Any thoughts about that use case?
>
> I've probably been too aggressive trying to force
> conversion of all boards, assuming that all boards support
> "-cpu CLI" option, currently option could be specified for
> any board but it is ignored if board doesn't care
> about it explicitly.

I think the conversion in this patchset is OK for
the boards you've touched. It's the ones that it
doesn't touch that I need to think a little more about.

>  "-cpu cpu_name,feat_str" handling is always based on
>  availability of base CPU type supported by target as
>  it's needed both for
>    - translating cpu_name to QOM CPU type
>        cpu_class_by_name(typename, name)
>    - converting feat_str into set of global properties
>      for matching QOM CPU type
>        cc->parse_features(object_class_get_name(oc), featurestr, &err);

> Boards that don't care/need '-cpu' support won't need
> to do anything as we can skip cpu_name,feat_str parsing
> if MachineClass::base_cpu_type isn't set (NULL by default),
> that way we won't break ignored CLI if we care.
> And currently we don't have convenient way to disable
> feat_str parsing, but machine could be extended
> with flag to [en|dis]able it explicitly.
>
> The goal of this series is generalizing/consolidating
> parsing of '-cpu' for boards that use it, removing
> code duplication scattered around codebase and trying
> normalize default cpu_model initialization.

Yeah, I definitely like the cleanup to avoid all the
duplicate parse calls.

> For SoC with fixed CPU type it would be better to use
> directly CPU type names directly but that hits legacy
> cpu_init()/cpu_foo_init() wall, which is currently
> cpu_model based and would be a lot of re-factoring.
> I would convert cpu_init(cpu_model) to cpu_init(cpu_type)
> and call '-cpu' handling logic from generic
> machine/user_[bsd|linux] code (3 places in total).
>
>> (The stm32f205 SoC object has a "cpu-model" QOM property
>> that the board sets, but I think that's as much because
>> we somewhat awkwardly need to pass it into armv7m_init()
>> as a deliberate design choice.)

> its sole user netduino2 board has cpu_model hardcodded
> at board level which could be left alone or converted
> to this API.

I think this may be for the benefit of the not-yet-in-tree
netduinoplus2 board, which is a very similar SoC but
with a cortex-m4. There are likely other ways we could
model that, though.

> Using API would make code more consistent
> at the cost of more code for default/valid callbacks.

Mmm, we could have the board code just forward the
default/valid callbacks through to the SoC (which
would then either implement them or forward them again).
But I think we should definitely see if we can make
the code for handling "the CPU is actually inside some
other object" as clean as we can, because I think
that's by far the most common case. Machines like
the x86 pc and the ARM virt board where the CPU is
instantiated directly in the board code are the
non-standard cases I think. We have a lot of boards
where we do instantiate the CPU in the board code
just for legacy reasons where we don't properly
model the SoC the CPU is inside. But hardware that
really has the CPU as a top level pluggable object
is rare.

thanks
-- PMM
