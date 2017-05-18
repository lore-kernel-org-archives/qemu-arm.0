Received: by 10.25.0.6 with SMTP id 6csp596379lfa;
        Thu, 18 May 2017 00:47:52 -0700 (PDT)
X-Received: by 10.55.145.71 with SMTP id t68mr2775050qkd.80.1495093672086;
        Thu, 18 May 2017 00:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495093672; cv=none;
        d=google.com; s=arc-20160816;
        b=GHsL8K98NStLY/6G8e9O6kIx9+bZ5uAa00R1SyHdVBr4fXuzm9Tt79Lp3uU4SS8bU7
         HFRfIBo5o7K6P1zBKHUxZGgjWo4C/515mUxKR5VXGaZ86vtbhn8RGMsu2gI2F4WCkq0w
         oFSgVjMNS3UXwJNkvoCkZ6ecFslZ/akiNxWBHhZvP5m8gQEkqutJWYlKPvJdYuPFufyM
         laR01kw2ypSkoO9GuvcqyO3LH99qO0sA1+oZdLS65e4xxi0l6/t0WNHEZG525RMe/eK6
         5QJYQoHo2ADaTjD8G3tvXtlXwajWbNfMgSzpXlle5/rPM+vFuHgIIdWSu+nDxcnm3NM8
         NKEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=N1Ce7xWTRV76FcTAurULXQBc95x1Jqqx/D093dgEfOc=;
        b=piIB02CAJ2jQuoniQzSiMG+yyxFQGgDhs8lQ9PwodMw0FHCEAmVSpRkBVFRUUfp7FQ
         36oAu6dPBoZzZwNy2Qg+csf8SJYHHPMIN46tZ8F/a3YbMuK9A29XApr13qBaB02CnYkh
         f/6Cl+/vJ2VvNkhR0qYmLnnQOpaxpjsqzakavUmydgamjTWTO3dKkEGdVoyTy+1r+iZg
         A1c99eQyeBgpqus3kl9X/tl576tPicVy3Rxc1jConaWolUq2nxPyBPvW5CaLb+LokyvL
         qFEFhG52d7x0j2A9a50NtWj1agtyQczh8PVJEL4Iq1FloaFztoB/Po/3XkKhZccARqpX
         9N4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p70si4715508qka.105.2017.05.18.00.47.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 May 2017 00:47:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBGA3-0002mr-CI
	for alex.bennee@linaro.org; Thu, 18 May 2017 03:47:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dBG9w-0002l1-QE
	for qemu-arm@nongnu.org; Thu, 18 May 2017 03:47:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dBG9q-0002Wn-Gb
	for qemu-arm@nongnu.org; Thu, 18 May 2017 03:47:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52698)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dBG9q-0002VU-87; Thu, 18 May 2017 03:47:38 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6BA168046E;
	Thu, 18 May 2017 07:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6BA168046E
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6BA168046E
Received: from blackfin.pond.sub.org (ovpn-116-54.ams2.redhat.com
	[10.36.116.54])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6FAB5C461;
	Thu, 18 May 2017 07:47:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 544F21138647; Thu, 18 May 2017 09:47:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <684185116.2952708.1495044580181.ref@mail.yahoo.com>
	<684185116.2952708.1495044580181@mail.yahoo.com>
	<3293e70a-71ac-2e6d-433f-06346ad253c9@redhat.com>
	<107015620.2969780.1495046091978@mail.yahoo.com>
	<5a2b9e50-1444-af4a-dc89-021a4beca0f4@redhat.com>
	<1832071588.99743.1495054408073@mail.yahoo.com>
	<bcff9cd4-3ec2-0757-02e0-96f0e0a7747e@redhat.com>
	<968647832.156883.1495056309814@mail.yahoo.com>
	<d7324134-4eb5-0ca2-2a13-6fd5c5479b49@redhat.com>
Date: Thu, 18 May 2017 09:47:34 +0200
In-Reply-To: <d7324134-4eb5-0ca2-2a13-6fd5c5479b49@redhat.com> (Eric Blake's
	message of "Wed, 17 May 2017 16:55:41 -0500")
Message-ID: <87bmqqvc6h.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 18 May 2017 07:47:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] Add Markus Armbrusters code for
 Broadcom Perhiperals for ARM.
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
Cc: John Bradley <flypie1@yahoo.com>, Laurent Vivier <lvivier@redhat.com>,
	Geert Martin Ijewski <gm.ijewski@web.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Bradley <flypie@rocketmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x4T+FQqXyY/0

IANAL, this wouldn't be legal advice even if I was one, yadda, yadda,
here goes anyway:

Eric Blake <eblake@redhat.com> writes:

> On 05/17/2017 04:25 PM, John Bradley wrote:
>> Well unfortunately Eric. I don't understand your "top posted" slang.
>
> To learn what top-posting is:
> http://lmgtfy.com/?q=what+is+top-posting
>
> and why we don't like it on technical lists:
> http://www.caliburn.nl/topposting.html
>
> Or more humorously:

Seconded.

> A: Yes.
>> >Q: Are you sure?
>>> >>A: Because it reverses the logical flow of conversation.
>>>> >>>Q: Why is top posting frowned upon?
>
>> 
>> As for his "intent", it is quite irrelevant as I have gone over the code line by line and what every he intended to do, he has succeed, as far as I can tell , in matching you standards, to such an extent that I am happy that 
>
> You are correct that the GPL gives us legal rights to use Andrew's code
> without his permission.  And yes, YOU can fork qemu, and take whatever
> GPL patches you want without attribution, and you are probably still
> just fine legally (as long as you still abide by the GPL in that you
> distribute sources to anyone that has your binary).
>
> But our project rules do not allow us to live by just GPL (in part,
> because the license of qemu is sometimes tricky to determine due to a
> mix of GPLv2-only code and non-GPL code, even though most new code is
> GPLv2+).  Also, if we ever had a reason to change license (supposing it
> is even possible, although it might require ripping out or
> reimplementing portions of the code base), having S-o-b means that we
> cannot be accused of applying a license that someone did not agree to.
>
> Therefore, it is easier, pragmatically, even if not legally necessary,
> to enforce proper chain of authorship by getting Signed-off-by: tags on
> ALL patches, especially where a patch asserts a copyright owner, insofar
> as the original copyright owner is still alive and able to assent to the
> action.  It is not just about legalities, it is also about risk-avoidance.
>
> It may sound like we are being hard-nosed (and so be it), but there's a
> reason that we list proper Signed-off-by: rules as our number 1 item on
> the SubmitAPatch page.
> http://wiki.qemu.org/Contribute/SubmitAPatch

Yes, we require patch submitters to provide their Signed-off-by.

We encourage documenting a patch's provenance in full by having every
author provide their S-o-b, whenever practical.  But we don't require
it.

The core purpose of the S-o-b is "to improve tracking of who did what"
by making patch authors formally certify that they "wrote it or
otherwise have the right to pass it on as a open-source patch"[2].  Note
"improve" and "have the right to pass it on".

One of the (many) reasons we're making software free is to help our
neighbor[1] by letting him use our creation on a quid pro quo basis.
Always requiring all author's S-o-b could make incorporating otherwise
free code impractical, and thus would conflict with this mission.

When obtaining an S-o-b is impractical, documenting provenance in other
ways has to do.

John wrote upthread:

    Andrew Baumann has and others have release the code under GNU
    General Public License version 2 (GPLv2), the same as QEMU that
    allows me to added it to QEMU as it is under the same license, by
    signing it off this is what I am certifying.

I agree with the reasoning "if free software compatible with the GPLv2,
then I can incorporate it into QEMU as long as I certify by signing
off".

John, thank you for your contribution to QEMU.  I'm sorry your patch got
side-tracked into this non-technical swamp, and hope you understand why
we're rather careful when it comes to protecting the freedom of our
software.  I futher hope that we can put than behind us (along with
top-posting *grin*), and move on to the fun part.


[1] See "The four essential freedoms"
https://www.gnu.org/philosophy/free-sw.en.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/Documentation/process/submitting-patches.rst
