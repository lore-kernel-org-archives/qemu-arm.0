Received: by 10.80.166.35 with SMTP id d32csp196909edc;
        Wed, 26 Oct 2016 10:58:36 -0700 (PDT)
X-Received: by 10.176.3.195 with SMTP id 61mr2229992uau.9.1477504716270;
        Wed, 26 Oct 2016 10:58:36 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a4si1280317uab.182.2016.10.26.10.58.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 10:58:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36493 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzSTD-0003H4-Ex
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 13:58:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzSSE-0003FE-C4
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 13:57:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzSSD-0003Oa-Lu
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 13:57:34 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:34736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bzSSD-0003OI-Hz
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 13:57:33 -0400
Received: by mail-vk0-x233.google.com with SMTP id p81so8545864vkd.1
	for <qemu-devel@nongnu.org>; Wed, 26 Oct 2016 10:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IKKCV53SymHZ7++1UJOdwgybVZ3ZDp2KvZDL1D4WS7k=;
	b=O65/XUUVJ9lG1jpZ7RR6dRKv/u+jp/oEdxOu4k9EsUor9jiyjxH3VuWWgv/JvKC6PP
	v7Z1zshBCo82TOo9r1TiOUpwZqbeK5Y9WtpL+ax1MUoDBh0d8svl2eQdWBGO/Qz85OMd
	gcKE0ZRRLXuyjWavrOfXyzjZGwJWaweNxfFA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IKKCV53SymHZ7++1UJOdwgybVZ3ZDp2KvZDL1D4WS7k=;
	b=SXpv6sM8+Zi4DoW7KRIjAr0QS7wrr6jhKYgunffShx6d/jMyMHHWA5PdHpoVYJ+XEs
	vjirJFCZh6YtQ9u17kBDfdpwe0DmJqgdL3cGL1DMaKhP/fmm7NHLLuvXqef9SC8eVO+I
	pSqlpRRKh+/lFz/mitBmYNtqGokxDl7Jhthe0QTDj2OgRtiYPTog1pIe003qkYVnAL9c
	3TCCXMMvhEEZJbpW67dtbHf9S2pVXpnIzdXC4QKtutCNoaz6soWkrRLEkVWVRWAoPeT7
	a9thpwBOURNTUO6MmCXoN9voKSkzmjvCykynR5bCm9xaeHUuvH1t6be9CLaTXy9fngra
	krog==
X-Gm-Message-State: ABUngvcjiDuy2Lpy3ZfNmiF5Uh3h7yDfmNf1og/oBLdo8FT16C9GLcEzU0pn7ZCtQaVZEKtclQShJ6EqsmFin+7o
X-Received: by 10.31.16.73 with SMTP id g70mr2288925vki.175.1477504652782;
	Wed, 26 Oct 2016 10:57:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 26 Oct 2016 10:57:12 -0700 (PDT)
In-Reply-To: <20161026165753.GC5057@thinpad.lan.raisama.net>
References: <1477499426-9550-1-git-send-email-ehabkost@redhat.com>
	<1477499426-9550-9-git-send-email-ehabkost@redhat.com>
	<CAFEAcA9cr63HyXR+USsXJcF5txwJy0t2pw7NenCTHAAH=pRnUw@mail.gmail.com>
	<20161026165753.GC5057@thinpad.lan.raisama.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Oct 2016 18:57:12 +0100
Message-ID: <CAFEAcA885YFMCE=ZFbo=7iitwRuc1nyUzyJK38=T+KLOw46mNg@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Subject: Re: [Qemu-devel] [PATCH v3 8/8] qdev: Warning about using
 object_class_property_add() in new code
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8VFZd7cxip8i

On 26 October 2016 at 17:57, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Wed, Oct 26, 2016 at 05:48:03PM +0100, Peter Maydell wrote:
>> On 26 October 2016 at 17:30, Eduardo Habkost <ehabkost@redhat.com> wrote:
>> > The only remaining user of object_class_property_add() is
>> > arm_cpu_post_init(), but removing it may take some work. While we
>> > don't change it, warn people to not use the function in new code.
>>
>> This is about the third time I've seen this commit
>> message go past, but:
>>
>>   git grep object_class_property_add target-arm   => no hits
>
> Erm. I meant qdev_property_add_static(). Sorry.
> Commit message needs to be rewritten as:
>
>     qdev: Warning about using qdev_property_add_static() in new code
>
>     The only remaining user of qdev_property_add_static() is
>     arm_cpu_post_init(), but removing it may take some work. While we
>     don't change it, warn people to not use the function in new code.

Can we say what the recommended replacement function is?

thanks
-- PMM
