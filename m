Received: by 10.28.71.27 with SMTP id u27csp706549wma;
        Fri, 26 Jan 2018 05:29:42 -0800 (PST)
X-Google-Smtp-Source: AH8x225G9aj8MgZ/HAFrPoTVZfCnoZzXzvXmW6pAy8/RtOS6Sz0barI6JdDbn9Ai6Ec00+WUQGQF
X-Received: by 10.129.78.143 with SMTP id c137mr11371675ywb.28.1516973382427;
        Fri, 26 Jan 2018 05:29:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516973382; cv=none;
        d=google.com; s=arc-20160816;
        b=AbHHGVZd+qr6tcjAnH4lUPneMNEznuEP4xJtcuvHbBh71xJ0dPsl94nd0Qk0ugTLXd
         +IHEwwYZe+aR77MI/ciH9/RIQFG9uWfUKm5h8OBSnMjQNHGU52YB7yXYTVe207r+4EOJ
         GNW3Cqp+G/K5pq9SuoBMPF9gZqcvyHku/tckr0yj4kIDR/5rCCH7QN8YjDle4J7tB56C
         4NF6ZDESAD9/5yiEp/Fe47jzH87O8t1fULKmfD5FQsy73/UPXN7AHyeYtRdUwVSz8Mrw
         io4sEs0SFlaZ03QbhdLOkQhELyrjshLciV50NWve3RqkMWSka6dJe+zoHGT+p3cKewRu
         PZwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=SO+04yc6/pzwr5oCCBazkVqG7iiPjI+8NHyOuRx4RZo=;
        b=bPim7cnkfmu2K7w2HKWfz0KVoOqB4fZaZBAo42ZGVqwTz8wo9DXFzSUKd1Q7YGh+6E
         p4fmMPk3Hn/baOTdmoSQ7/aeBLcNxkRa/gPhBePfX0YIgXI1DOGrqUA+ssJb2B5fMpTe
         rHKPIgyWDU1qkDhqMGRE9rs/ZRRjpBlWq8OMh3reSU3WZXcdBYAjRd1F17njRy9j8rzH
         wciXOpfcjCLgcUgHsjjUO9+A4qQYg/Ezv3N+5hnr0D9AgtRKAHebY+Auq31KTz1HUE2e
         pwEfGgAgnr8LBGa0uNM+T/3txJtLJSQMgPOXPqKoTvBNmgH31rAqkG4S7bJAYqFhN6Zb
         05PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I4+y/Wyo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a133si3672000ybg.788.2018.01.26.05.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 05:29:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I4+y/Wyo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55732 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef44b-0003Jb-Qv
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 08:29:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef44M-0003Gc-Iw
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 08:29:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef44L-0000CX-Gb
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 08:29:26 -0500
Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236]:36054)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ef44I-0000Ac-Gb
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 08:29:25 -0500
Received: by mail-oi0-x236.google.com with SMTP id w135so303768oie.3
	for <qemu-arm@nongnu.org>; Fri, 26 Jan 2018 05:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SO+04yc6/pzwr5oCCBazkVqG7iiPjI+8NHyOuRx4RZo=;
	b=I4+y/WyoBVSdEN8SuqSNkWhuSJRRahpavi5bAlSQ1xBt9OU2D4zPJxZ1bh9polr0wA
	WWkvGrIOOafRQ7VjzXSbWem+fq5Qms6v8+T28igrCqE9rKLashuKuppCvtfe1he7taj8
	c85im1gdGAPfPGezg482h+Qn6q5dlc/3UKZgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SO+04yc6/pzwr5oCCBazkVqG7iiPjI+8NHyOuRx4RZo=;
	b=AhlrWigLgaG/6XYsP3PKhpRia+vSfCtkcQZep+BI1iLQSpJO1qtjzsn0+7Dsb6T8qz
	Z3Y+8OJDemJUH7n3X/JM2mFqAoCK/AT9uX6YrVyxusrfiFw4MdFfQqRt/jcXdWMbAK3a
	ihyWRLuaFt1OKRnpSh0FZEq9n+bvagZ5fB64TfRgGiKIaxKlakAl7NFVYGHBoVbMlLo+
	DcYgTlWn3NAh0ISyCLSlS3lbH7moeNvPYIHHJLQPiSgRfRlGk+truImumzK2BZkd+9X5
	rByRSNlmiXofcJZlu6+mtx4L+paopfcaP9SGZ3PyE31KILFAGu4mUYXdTwnFwHb4n+Hm
	MWlQ==
X-Gm-Message-State: AKwxytdnCNv6bGRHM21WLjakI4ts3M9sbTnHo/CZOW5yIYPKZugTmodk
	YtZIGkZDs1fg1CRvbirrSo9I1/81/Lsrh03rflvkrFKd
X-Received: by 10.202.252.73 with SMTP id a70mr12682668oii.256.1516964565556; 
	Fri, 26 Jan 2018 03:02:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Fri, 26 Jan 2018 03:02:24 -0800 (PST)
In-Reply-To: <20180126104247.GF25150@localhost.localdomain>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA-UO5Y_ACSZ2EEQEzgy30wdfEm3u8wUrBrXWaQaE_v+Kw@mail.gmail.com>
	<20171209010811.GJ3037@localhost.localdomain>
	<CAFEAcA9oG=+mJ+jSGTM_z54S09gjHoFowDkOvofdkhJd+g3=Cw@mail.gmail.com>
	<20180122183301.GA31237@localhost.localdomain>
	<CAFEAcA8pGXMs3hMxSs-t7qGfeR__H-CQ1roRVe5NFMCP8R2vjw@mail.gmail.com>
	<20180126104247.GF25150@localhost.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jan 2018 11:02:24 +0000
Message-ID: <CAFEAcA_zU+tAMvcqNHQAaVOEaJrrGOEWPS8RpUi+eZQ3tf1yiQ@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::236
Subject: Re: [Qemu-arm] [PATCH 0/6] arm: support -cpu max (and
 gic-version=max)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R6GYHdZjq4L2

On 26 January 2018 at 10:42, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Thu, Jan 25, 2018 at 02:41:50PM +0000, Peter Maydell wrote:
>> I'm not sure if we actually support command line setting/unsetting
>> of features for Arm CPUs -- is there a command line option to
>> get QEMU to print the features it thinks can be set this way?
>
> Unfortunately -cpu command-line parsing is still a mess (we
> currently have lots of arch-specific parsing hooks).  Once we
> make this uniform across targets, we could make "-cpu ?" print
> all known properties.
>
> But you can look at the list of QOM properties for your CPU
> classes (-cpu options are simply translated to QOM properties).
> e.g.:
>
>   (QEMU) device-list-properties typename=3Dpxa270-a0-arm-cpu
>   {"return": [{"type": "uint32", "name": "midr"}, {"type": "uint64", "nam=
e": "mp-affinity"}, {"type": "child<irq>", "name": "unnamed-gpio-in[0]"}, {=
"type": "uint32", "name": "psci-conduit"}, {"type": "bool", "name": "reset-=
hivecs"}, {"type": "link<qemu:memory-region>", "name": "memory"}, {"type": =
"link<irq>", "name": "unnamed-gpio-out[2]"}, {"type": "link<irq>", "name": =
"unnamed-gpio-out[3]"}, {"type": "int32", "name": "node-id"}, {"type": "boo=
l", "name": "start-powered-off"}, {"type": "link<irq>", "name": "unnamed-gp=
io-out[1]"}, {"type": "link<irq>", "name": "unnamed-gpio-out[0]"}, {"type":=
 "link<irq>", "name": "gicv3-maintenance-interrupt[0]"}, {"type": "bool", "=
name": "cfgend"}, {"type": "child<irq>", "name": "unnamed-gpio-in[2]"}, {"t=
ype": "child<irq>", "name": "unnamed-gpio-in[3]"}, {"type": "child<irq>", "=
name": "unnamed-gpio-in[1]"}]}

None of those are things we'd want to expose to the user, really
(except maybe 'cfgend'): they're all intended for the QEMU board
or SoC code that needs to configure and wire the CPU up. Ideally
there'd be a mechanism for screening them out of the -cpu option
list.

There are some things that we could in theory have as user
settable properties (like "does this CPU have an FPU"), but
we don't currently have QOM properties for them (each CPU
just hardcodes which ARM_FEATURE_* flags it has).

In your other email you write:
> I wrote:
>> Given that the type names don't appear to the user, I think
>> we can go ahead with implementing "-cpu max" for Arm without
>> having to first disentangle this? "max" isn't in any worse
>> a position than the existing "host" and "any" types.
>
>Sounds reasonable to me.

Cool. I think that means that patches 2-6 here don't need
any changes, but I'll rebase, retest and resend just to
avoid confusion.

thanks
-- PMM
