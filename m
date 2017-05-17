Received: by 10.25.0.6 with SMTP id 6csp425008lfa;
        Wed, 17 May 2017 14:29:27 -0700 (PDT)
X-Received: by 10.200.48.98 with SMTP id g31mr844338qte.119.1495056567065;
        Wed, 17 May 2017 14:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495056567; cv=none;
        d=google.com; s=arc-20160816;
        b=JWYCojFZnHbad1xpI773OpwIUGYL+CLoLiBIZkHSTAo0UfajvDEOdTGVD3rpVWO2AR
         dRqH2JWkJLsKtfBbJZc8M4ELTBgJZJilHhNc2sTcuk6Enz18ZIpMuDxBFq0xcWvbWytc
         oWxAeZadWsVHgQklTl42w9z3Hg4OxBpcoCIdnP4bu5EBHnuWmO0sUrygNhlw2DKWOM1h
         w6nkS2MfEWG1os+Lztk9i3Bk7MyFv+5ZPEGWVgMsln7EQS+WHsOmiuG0680zyrc7hHDW
         UFBTBhfEe+ZP1YDVktD0lMwNuXIIE8/WQ8NxMriEVoB0LTSou2IATWG8LTQRnMWEFof9
         zr3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :content-length:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:to:date:dkim-signature
         :arc-authentication-results;
        bh=CuK0kqEiH6G44WYFf4q+YZHF24glQB+XWsyZo83WmWU=;
        b=n+NJ5u9onsVWISN7MR3lIyrTxhg0jtjJt8BZAgue6TlmVyuwURsns2zNBglPt946D/
         8PZ2gqgDRfUur7ZZhphZvaKE07yFpkNxsbmOgwSgNVrQB19tYdqSg3ZzN/aRauVHPgY8
         nAFYUGs5u0BP+ex4uc38KqD7F6W0Tdwlu2l6caLK8LSS+a4AlcItxpqmwNaqEgnYMFFe
         q3FZCnrdEWWmJk6Ajbx1vulgueUvXb+xtfzi1wQsRp9X+PRu8ujKNWMjq63aWTHy+ZsW
         RJPk06NXNCQdagwh9tXLY4vDUSM4InMIs8hLPzOkV6mjvIf7L3kLkoEM9uDRFFz2KkmA
         OwtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@yahoo.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b186si3383931qkd.191.2017.05.17.14.29.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 May 2017 14:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yahoo.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dB6Va-0003Eg-Cs
	for alex.bennee@linaro.org; Wed, 17 May 2017 17:29:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dB6VQ-0003CO-8p
	for qemu-arm@nongnu.org; Wed, 17 May 2017 17:29:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dB6VN-00009D-4e
	for qemu-arm@nongnu.org; Wed, 17 May 2017 17:29:16 -0400
Received: from sonic319-5.consmr.mail.ir2.yahoo.com ([77.238.179.196]:44471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dB6VM-000095-S3
	for qemu-arm@nongnu.org; Wed, 17 May 2017 17:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1495056550; bh=CuK0kqEiH6G44WYFf4q+YZHF24glQB+XWsyZo83WmWU=;
	h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
	b=n1Y4pfSIpNrjp+PMSZG0wtGioaST0gxkBHdVsbnMQJCcLoOF1tI+TAnFh2GmQtRijVImzfPBRsumA4JYL/E6+BjhQiyRFIDYzey7hmjWqJMip3O3601dghx12Ic6beESPSOJ+qWd08YVRb1wTUSV/yKSKc8PUwvA5Z91bWusxmOIKoFg/V3qdO0bQj8V0pc67E31xPm22hAakYSTa1i9W5RGen6YBYQlQfJhh43U+ONsPPX0g+uNAs+WE6xw4jeIjUFqxHDUNF+Tn7vSNAkim9qm5DG7sQ4YyNl5Avq+Dah3J9q58Ab2lKtKxphaI4lSqZJycXT4B/LUZThGcIHyag==
X-YMail-OSG: qRFsOXUVM1lOyLpRfnEWbxjMtVHHRnbMXIidI8ns6b13fNTHPJMaBj1a_2vbfPd
	PkPU174sTdMxU7EM_5fgAOTruwD7S5ivHrm8VqgsvUikv_J2qeCE5UV22J5e7N.182JsygtvjhjB
	x8RW1GB9A3eBNPZnmXkvHhFWoDKyzEwhr8lfJkbj4rVPDdNyQ0BLAeQpWrD9sRHP1JnwYheX94p5
	jUA9_37ge948sOPLqcPc9XWXMK4evcpI7JLYv.UB01DipCTy3c0yOkK.aaNwbwREL.3eouNCaQ_j
	rfaAjqdTspf39ONZ.fMJabgd1Ssf1.XPsDsn6_gxQ6yoDzT5nhXTVkKZflK5b488pyu.gZfOc7D9
	VN4NrWXRTDjYjy1PppnhylBIAIenntWnK_E5GsYA_i0cw1ksbV69PbufCDPBtWrGkz20iV6Edcze
	0pOb95jdty4S45q9_Fwt1OgWcG02faXIj4NGnkd78a5ciP0OwVWACWGonYoDlN.LEk1WAwe1l2ul
	qzWsdcJDaPLCuelSCn7f.LXbw0cHo1ERcqctotww0xxRwDyh.snQ1BTMTdSs-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic319.consmr.mail.ir2.yahoo.com with HTTP;
	Wed, 17 May 2017 21:29:10 +0000
Date: Wed, 17 May 2017 21:25:09 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <968647832.156883.1495056309814@mail.yahoo.com>
In-Reply-To: <bcff9cd4-3ec2-0757-02e0-96f0e0a7747e@redhat.com>
References: <684185116.2952708.1495044580181.ref@mail.yahoo.com>
	<684185116.2952708.1495044580181@mail.yahoo.com>
	<3293e70a-71ac-2e6d-433f-06346ad253c9@redhat.com>
	<107015620.2969780.1495046091978@mail.yahoo.com>
	<5a2b9e50-1444-af4a-dc89-021a4beca0f4@redhat.com>
	<1832071588.99743.1495054408073@mail.yahoo.com>
	<bcff9cd4-3ec2-0757-02e0-96f0e0a7747e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.9679 YahooMailNeo Mozilla/5.0 (Windows NT 10.0; WOW64;
	rv:53.0) Gecko/20100101 Firefox/53.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 77.238.179.196
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
From: John Bradley via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: John Bradley <flypie1@yahoo.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Geert Martin Ijewski <gm.ijewski@web.de>,
	John Bradley <flypie@rocketmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dD5mnVdnciqr

Well unfortunately Eric. I don't understand your "top posted" slang.

As for his "intent", it is quite irrelevant as I have gone over the code line by line and what every he intended to do, he has succeed, as far as I can tell , in matching you standards, to such an extent that I am happy that 


 
John Bradley
Tel: 07896 839635
Skype: flypie125
125B Grove Street
Edge Hill 
Liverpool L7 7AF


On Wednesday, 17 May 2017, 22:15, Eric Blake <eblake@redhat.com> wrote:



On 05/17/2017 03:53 PM, John Bradley wrote:
> Andrew Baumann has and others have release the code under GNU General Public License version 2 (GPLv2), the same as QEMU that allows me to added it to QEMU as it is under the same license, by signing it off this is what I am certifying. 

See this document linked from the SubmitAPatch link (it describes the
kernel meaning of S-o-b tags, although the qemu meaning is the same):

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297

Yes, your Signed-off-by: asserts that you are okay releasing your
portions of the patch (bullets a, d) and that you chased down that
portions that you did not write are properly licensed (bullet b), but
what you are missing is that when you modify someone else's patch, we
also need that someone's assertion of intent that their work (whether or
not modified by you) meets the same standards (bullet c).  In other
words, when modifying a patch, S-o-b lines should be additive in nature,
rather than replacing his by yours (or, if his is missing in the source
you originally copied from, then we really need to Andrew to chime in
and add one); this is so that there is a full chain of custody on who
wrote portions of the commit.


>  John BradleyTel: 07896 839635Skype: flypie125 125B Grove StreetEdge Hill Liverpool L7 7AF 

Your mailer is sending very poor formatting when rendered as plain text
(and we frown on html mail on this list).

> 
>     On Wednesday, 17 May 2017, 20:11, Eric Blake <eblake@redhat.com> wrote:
>  
> 
>  On 05/17/2017 01:34 PM, John Bradley wrote:
>> This is especial true as I meant Andrew Baumann 0xabu (Andrew Baumann)
> 
> Top-posting is not nice on technical lists.

And yet, in spite of me mentioning it, you still top-posted. :(


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



Well unfortunately Eric. I don't understand your "top posted" slang.

As for 
his "intent", it is quite irrelevant as I have gone over the code line 
by line and what every he intended to do, he has succeed, as far as I 
can tell , in matching you standards, to such an extent that I am happy 
that he has succeeded in reaching your standards and am happy to certify that he has.

As for my mailer it is Yahoos and again as far as I can tell it is full RFC822 compliant, so perhaps you should adjust you obviously defective mail reader.
