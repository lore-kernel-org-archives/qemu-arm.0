Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp216693wrq;
        Wed, 11 Jul 2018 06:33:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfX2nb4GGnfpJvtqA3UR4qUJldkz7UL4RdumUxIcwGK2DjMsrbxl8al9eCUqZHu1mWe66iS
X-Received: by 2002:a37:5f87:: with SMTP id t129-v6mr16407192qkb.23.1531315983455;
        Wed, 11 Jul 2018 06:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531315983; cv=none;
        d=google.com; s=arc-20160816;
        b=enTU2fgprWb4GblkA4xMNQZEQ4qhqUsxu7JUlRSbAII3myJtfwIz/ZO8n1J7meQ0nq
         a/xFMBKNEWoySRXrMgRoOEHE3dyya6HX0FNU+3TkV+v6aqDpf1CfUE9WznCDHgS61gvo
         VRW1qkKUcLCxwNJGV5Sb+S1VYPkpWTDCTshp+cA1eRmAwX9yuUhUzdpaP0/OvnxKIGrW
         pwMO5VmpodQ3lVYUQNJFBVExCUW+cyXME5545QjlWNqp/Ucu36sGOENDw1Dllazjl2e1
         jjnAjiz8dADuozCz9sgPnfOER43Axav4UYG3J86VN+IqEnlr2VO/iyariBlEm2cFgcGH
         CtQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tgxuG7h2AeDxA2Xb7o+G3EyLuJ7Lz6SzMzzzz7W8aqw=;
        b=adtDFD7i6pGcjuPnXabW+wMAa3+AGF40eYIfF+RhBqacDn1WiyjUrx+YQfiBEqpg4e
         Kz5COPhmqSd0ohHE4323CxqNQym+q0wz0ivQiqLqOYSTGvh6U+q1TvTBH7qBe46ZyzRl
         LsVLESbwN0gllo6BCJM8GfqbVO0ZJTBTxDx2Eh1R6A14aHlbpIY5PEnSI43I0mkJbjgT
         PCNxZshx4Ze6mILFL5wX2FldTVtYX6oV3VdYJ0O67g92qWGcoeNey1bnTpJqVRNoT/KU
         y7JGrXOQ0iFRdFow2B5i0Vxe5BDk1Vqp0fXi1r8WsTgkyKSoqxSlZ4qOnHH8YnFtGzi/
         osFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OgxoR9gi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w15-v6si6096958qtj.276.2018.07.11.06.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jul 2018 06:33:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OgxoR9gi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdFEs-0002fE-Qe
	for alex.bennee@linaro.org; Wed, 11 Jul 2018 09:33:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdFEZ-0002d4-Nd
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 09:32:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdFEY-0008UU-RZ
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 09:32:43 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:33224)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdFEY-0008Tl-LG
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 09:32:42 -0400
Received: by mail-oi0-x241.google.com with SMTP id l10-v6so2540163oii.0
	for <qemu-arm@nongnu.org>; Wed, 11 Jul 2018 06:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tgxuG7h2AeDxA2Xb7o+G3EyLuJ7Lz6SzMzzzz7W8aqw=;
	b=OgxoR9giSLkVzN1pBG/1qNJ8cnjc6Qmh/xtN24y3DcQujzgqRZooj+Ocx2/7VAKA2Z
	wEmi/wkpCJscLTHvZhLB0/Tf455HI3IFj4x5/IqZIOIW92ZojaV8m64Ii69LmCeQJm1v
	t+iEwQzN2yGmE/DP7HkGSRISzqKfbBeldy86Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tgxuG7h2AeDxA2Xb7o+G3EyLuJ7Lz6SzMzzzz7W8aqw=;
	b=Km+Y4P1SCbAv1r5hjqZU207bAQ9wb8IRgvvIDc9IXVtsXbHDk785u7OvGcXwjDqpYP
	ZH12a/Xkq9+PMmax5cqHO8wrzxFxsTesIKYsG0yCkqxXn/wbgr6pkKEOxBwpSn+H9CTD
	Qpf5Ry8E9m+qeVeNWibVlmagafBeXGL1z45CV99iT5dGaSuSl071JW5rQlz6lM/ULJPg
	lYRxhxI+S6mp06JmEQtZn/CMCXOfnk5ySJnbVIJUZm2/mN0/DqzqZt/Dz7RwEUuKhWGw
	7ONcbbZFC2jabHBoDwh9+KxCVB9cXIEcXuWIv0GbIoLEyn34plCfmdrq7+0Y9ymK957l
	Z/fQ==
X-Gm-Message-State: APt69E0ngsmeMb2bS4uWp0MRvyhrVlj4Ur/RbVisVsxqhUcwQ4hfx4VP
	FRiCbcHSqJtJid8ZdjugI9gFYF3j9EkCHUIokB78O4PE
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr32852740oie.80.1531315961953; 
	Wed, 11 Jul 2018 06:32:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Wed, 11 Jul 2018 06:32:21
	-0700 (PDT)
In-Reply-To: <20180711125112.GF31228@stefanha-x1.localdomain>
References: <20180630091343.14391-1-stefanha@redhat.com>
	<20180630091343.14391-2-stefanha@redhat.com>
	<CAFEAcA-boywojdasSCZ5EnnGMtETMH7JZw30fOR7fepMQaqctQ@mail.gmail.com>
	<CAFEAcA8AzjD3f44U+He1Y10p8iNR8EaWODdv3XRUQtQiDdCotg@mail.gmail.com>
	<20180711125112.GF31228@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Jul 2018 14:32:21 +0100
Message-ID: <CAFEAcA_JBFS+e_vu35kAwfQUsyjhvYRV9YZ6vmyVkYPzdSLuBQ@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/3] hw/arm: extract ARM M
 Profile base class from ARMv7-M
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fv9pICScDngZ

On 11 July 2018 at 13:51, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Thu, Jul 05, 2018 at 04:49:22PM +0100, Peter Maydell wrote:
>> On 5 July 2018 at 16:45, Peter Maydell <peter.maydell@linaro.org> wrote:
>> > On 30 June 2018 at 10:13, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>> >> The ARMv7-M code is largely similar to what other M Profile CPUs need.
>> >> Extract the common M Profile aspects into the ARMMProfileState base
>> >> class.  ARMv6-M will inherit from this class in the following patch.
>> >>
>> >> It might be possible to make ARMv6-M the base class of ARMv7-M, but it
>> >> seems cleaner to have an M Profile base class instead of saying an
>> >> "ARMv7-M is an ARMv6-M".
>> >>
>> >> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> >
>> > This makes sense, I guess (though it currently leaves us in the
>> > odd position that we have separate a object for v6m, but the v7m
>> > object handles both v7m and v8m...)
>>
>> ...though I guess the counter-argument is that the only thing that
>> the v7m object is doing that v6m doesn't want is creating
>> the bitbanding device, and in fact bitbanding is optional in v7m
>> (you can configure a Cortex-M3 without it). So maybe we should
>> instead just have a QOM property to let you turn off the
>> bitbanding ?
>
> Okay, we can do that.  So how about a single ARMMProfileState class for
> v6, v7, and v8?

Yes, I think that makes sense. (A lot of our code says 'v7m' when
it really means 'm profile in general' for historical reasons. I'm
not too worried about trying to tidy that up.)

thanks
-- PMM
