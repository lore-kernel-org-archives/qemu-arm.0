Received: by 10.25.208.211 with SMTP id h202csp1912339lfg;
        Tue, 8 Mar 2016 04:51:30 -0800 (PST)
X-Received: by 10.140.249.6 with SMTP id u6mr37898930qhc.83.1457441490397;
        Tue, 08 Mar 2016 04:51:30 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z203si2829305qka.44.2016.03.08.04.51.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 04:51:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:34203 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adH6n-0002EL-TG
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 07:51:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1adH5k-0000vk-7P
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 07:50:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1adH5j-0005oI-Bv
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 07:50:24 -0500
Received: from mail-ig0-x232.google.com ([2607:f8b0:4001:c05::232]:36815)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1adH5i-0005nw-UZ
	for qemu-devel@nongnu.org; Tue, 08 Mar 2016 07:50:23 -0500
Received: by mail-ig0-x232.google.com with SMTP id vs8so47146581igb.1
	for <qemu-devel@nongnu.org>; Tue, 08 Mar 2016 04:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=sQ2IeGlYiaKcMdAmFBzjuhp3TbQ9AGbMwBwr6EyGDjY=;
	b=BZlkPukn9pX4CuBZ+8NLSTzb2CzzWx2+Q3q17lDgOWgbUcXBvSxORHrpQ/gQbxH6Ox
	aQUStmB84AnU96Ir907zmPad1Oi/fBm8TNv7z5FAkX2H4cuVwuW1xD2oPNjHIu1i/ZbB
	evHCIfMoKB2YaCL6YCLlMpx3UY6j+BquhTnQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=sQ2IeGlYiaKcMdAmFBzjuhp3TbQ9AGbMwBwr6EyGDjY=;
	b=ct9et9GkD3ewoKtsizU1V93y8/n/lVx7ETBdZkJtDjmdYKm7aiVHQtnojMqJlnd6G7
	RK2+B9snmFb1pQ1g41BP8m7fFRPAWMraSrNKnbMutvzggNE2ljdIJFQVU31nqEk9iWVh
	qzCr8JX1QE2hP7B+LXUeVkPXHXPdnGLSUNNqMcfA/h2bIpb7k6kE3TihzVYStriwJ3Vf
	tY6veR5ffuZrqrHB/jMVOAGsTlc4JwhaGGQmaUZMQc6sQeA61c9q0Uii8kQInzRhcwzl
	4jIzzPUbjnQKTbbuYxrNklnuYO/JZMkIBQe1VV0OMlC69VJuJtnQcP7LIkdoTtscTQyj
	AsDg==
X-Gm-Message-State: AD7BkJIOGYqOp5gdyJ3fhP5K4EE2LFWikTcNg+OD5hQJJusn2OdJp3S3p0MoHE2QowO94dffA7GbQ/NdEM5SXZ0e
MIME-Version: 1.0
X-Received: by 10.50.13.102 with SMTP id g6mr16987094igc.71.1457441422024;
	Tue, 08 Mar 2016 04:50:22 -0800 (PST)
Received: by 10.36.29.6 with HTTP; Tue, 8 Mar 2016 04:50:21 -0800 (PST)
In-Reply-To: <56DEC860.1060707@redhat.com>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
	<56DD9C58.7050306@redhat.com>
	<CAFEAcA8C2VzkD=87W5Jn7X523cFZLZL6onxjKDoOcZsCPMQxZw@mail.gmail.com>
	<56DEBF6A.6070809@redhat.com>
	<CAKv+Gu9LzTTzdw5CSCDfpCyjSgB2h6+KawTTJQXSqJ7mhV_YdQ@mail.gmail.com>
	<CAKv+Gu8OgSK5+X71GLrvWLkcGcQ9=MuwOuFAsQroQTa3bWbHNA@mail.gmail.com>
	<56DEC234.70907@redhat.com>
	<CAKv+Gu-joM8MqtM=G_F7NLZEwpxLBMPeqimDwZv7yivTjYBFVQ@mail.gmail.com>
	<56DEC860.1060707@redhat.com>
Date: Tue, 8 Mar 2016 19:50:21 +0700
Message-ID: <CAKv+Gu91CH9WURYaLFtP7HHEm7Z18FMk19HXEWaj1=LBqM6mCQ@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c05::232
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 0/4] virt: provide secure-only RAM and
	first flash
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
X-TUID: Acn+3+hBwb+1

On 8 March 2016 at 19:41, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 08/03/2016 13:16, Ard Biesheuvel wrote:
>> > > > As far as this QEMU port is concerned, having some flash in secure and
>> > > > some in non-secure is going to be useful regardless, and 64 MB is
>> > > > plenty for both the code and the data. So if users of the Trustzone
>> > > > port (which is disjoint from the KVM port in any case) can tolerate
>> > > > having the code and the variables in the same pflash file, I could
>> > > > simply move the code into the second flash, and we could reserve the
>> > > > first flash for secure (so it sits at physical address 0x0
>> > >
>> > > Uhm, actually, the code is not even in the flash to begin with. So
>> > > having the second bank be non-secure only makes perfect sense imo
>> >
>> > Interesting, where is the code?
>>
>> The UEFI code is loaded into DRAM by the secure firmware, and
>> relocated and executed from there.
>
> And if (as in the closed source implementations) UEFI had access to
> TrustZone, would the privileged parts of the code be moved to secure DRAM?
>

Yes. There are various ways imaginable to implement this on ARM/arm64,
either based on ARM Trusted Firmware, or on a full PI implementation
that owns all privileged exception levels and the secure side.
However, this is an unsolved problem on ARM, i.e., the [S]MM support
is in the paper phase, sadly.

> Still, the UEFI code must still be protected from tampering, so it
> should also reside in secure flash.
>

Yes. We have a fairly good picture of how we should implement it if
there were such things as an SMM runtime and other things that could
help us implement the plumbing below the UEFI Runtime Services in a
way where all the reasoning about the authenticity of the variable
updates occurs in the secure world. The same applies for having tamper
proof flash to put the code. The problem is that none of that has been
specified yet, so while we have some proof of concept draft stuff,
there is no point yet in taking this much further until the architects
make their minds up.

Note that, for KVM, it is unlikely that we will ever support all of
this inside the guest. It makes *much* more sense to lock down the
emulated flash, and implement the UEFI Runtime Services using a thin
layer in UEFI that hooks up to interfaces exposed to the guest by
QEMU.
