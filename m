Received: by 10.223.183.22 with SMTP id l22csp1974587wre;
        Thu, 17 Aug 2017 03:42:54 -0700 (PDT)
X-Received: by 10.200.22.157 with SMTP id r29mr1904123qtj.23.1502966574380;
        Thu, 17 Aug 2017 03:42:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502966574; cv=none;
        d=google.com; s=arc-20160816;
        b=njz3j6ygcGGNTwoygvSFdeUECELaUjgfijcomEgsyogpCUc/RYnNE4XMvcqhEaoj8L
         x1iJgvAep5YOj4fPTKATX5tWM2ij3FHNH7bNTIYs7oU99nU9ULYBvYSDvtdXWn8mPOee
         E9pPd365HnUo1QVpu5ioW93AA6v6KreSN1ixgWMYNPDrmpc8AcsZsDLsJ1rnJwxne6SI
         jKaeJMQ3oePYL8kxGVZ866QAIZWboy5Q2Hg85eJhwGDZ8eBGlVuJmX2VNk8L2eimt50z
         hFChFIYP1bR8OmWyOHZ64tlXqbHZgSLb4F0gD7zXkrEyiDIZhR3rr5P7h/ZGbnFi0BLB
         8IsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=HQ826KJNO2ja6qiiNyV7Pj8xorLqNPX8q4MG4UD5C7U=;
        b=OImwu7Vu+5ZB0F/OM3LLjgVX4V3xQ7sK4UcFwVjEhuUtQGi8MtLxjx6oLwvnw4JHAt
         PrPnSvA2d4Ib3HD3XrLM+Hl1uvOGQofnspyD3oFjDZGisKqDWgmqPAlTFHq5XGQ4TEMQ
         f4x771epGmWfoQpHfxbydev2sX+QnPhy15bMHsY/VIT9DdiBdmMImsySGTYbQT3B0Ohl
         pzwFcu2zvsnWmWd0+wy3y4+tZ2uvre8nrSbs1nj0J10238msbOME3l3l2wnGY6N5P4aR
         oMh0w4k0nK4Myv251H6KsbBoJrZWFc0yk+Nm/MFhMwX7n+t8sIqI2b1RP/qkw9T+btN9
         hg/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NCf+oR/o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y2si2911767qty.466.2017.08.17.03.42.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Aug 2017 03:42:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NCf+oR/o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1diIGJ-0003mC-Qu
	for alex.bennee@linaro.org; Thu, 17 Aug 2017 06:42:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1diIGF-0003ks-7U
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 06:42:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1diIGE-0005Jv-D5
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 06:42:47 -0400
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:37391)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1diIGE-0005JW-6N
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 06:42:46 -0400
Received: by mail-wr0-x229.google.com with SMTP id z91so30579441wrc.4
	for <qemu-arm@nongnu.org>; Thu, 17 Aug 2017 03:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HQ826KJNO2ja6qiiNyV7Pj8xorLqNPX8q4MG4UD5C7U=;
	b=NCf+oR/ocEDKPFR/Rb6Kpjo3Q9q8aumzrH/E4OkJq41a/Kf+fH7DBGddLeArvIlxUb
	m5SqoVqiFdv2cJkeLTXKoEJ9vzh5/cgYYUDDYUyj1Jsmv59Jf++0m4qxHE3FyxtWsbD/
	BeynUo0JWoH8UuDg4o5sVNGvP5hvaN8Gs0SRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HQ826KJNO2ja6qiiNyV7Pj8xorLqNPX8q4MG4UD5C7U=;
	b=b2RgfmixSmdozxF2gHX3UGEFSWzRDwOp5E/PMTnWilyANAE1+58IhOYho8w2mF+eCy
	1uFSCOkm+mhbAvX1pqkBXs2Js3oZPSwOoMo50AobZyIwMASL6UWSFkEEq418NLMaqBOd
	wl+9oB8Z8G9uH9poQnencsh+gjDgNGZS4MfWYSmkjyNn+t0WPlaruDCXnuFoa5CgA+Qr
	SfBc6Tjtmpa0InlIfS5uJN7pGMKkefWLYtys8V5PiG9TjeQXmabU6RDIJPw7qUbLnJwT
	PcXeozFYy4iLFIb3jLYeByzE3gd0Xsfj2DIeSxx+P191hbnGCz6OInEI1T1yzsI/Pcu+
	tqIQ==
X-Gm-Message-State: AHYfb5gZlEf4fJUFFC97NZXyIzc7aJ8/EgTxZQBRQVyOTPOBIhSFlsj6
	xvhQEcDTLGTJX0UKEHQUNFJufNCa8raC
X-Received: by 10.28.55.4 with SMTP id e4mr1124311wma.37.1502966565097; Thu,
	17 Aug 2017 03:42:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Thu, 17 Aug 2017 03:42:24 -0700 (PDT)
In-Reply-To: <CAFEAcA9bb3YTVQvK5qoN8jEqEpAsP-a7hoGjSoYeqwTGzs7jng@mail.gmail.com>
References: <20170717133010.12784-1-f4bug@amsat.org>
	<CAFEAcA_rhoCup57nYYW4HN6Qsz3sp-cxY-OwsK-x=fYtfJ31aQ@mail.gmail.com>
	<b48b8728-7cb3-3d6e-745f-1aee5c2038e6@amsat.org>
	<CAFEAcA9bb3YTVQvK5qoN8jEqEpAsP-a7hoGjSoYeqwTGzs7jng@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Aug 2017 11:42:24 +0100
Message-ID: <CAFEAcA8GYUHvOE7wnmETj6peME225rY-4osM1882c-9duriEKw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-arm] [PATCH] hw/arm: use defined type name instead of
 hard-coded string
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
Cc: Rob Herring <robh@kernel.org>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6jwJvxkMvsOE

On 31 July 2017 at 13:09, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 27 July 2017 at 14:48, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
>> On 07/27/2017 09:36 AM, Peter Maydell wrote:
>>>
>>> On 17 July 2017 at 14:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>> ---
>>>>
>>>> Hi Peter, this patch is waiting the IDE queue to enters since it depen=
ds
>>>> of
>>>> commit de09efcc7b67ada3593354711b12a03dea23a9d0 to fix AHCI includes.
>>>
>>>
>>> There's no commit with that hash in master -- do you have
>>> a commit subject or something that I can use to find out
>>> whether it's landed or not?
>>
>>
>> Oops I guess the IDE queue was rebased between this patch and the merge,=
 or
>> I messed my copy/paste :)
>>
>> The dependent commit is 70e2337030f and has how entered /master, do you =
want
>> me to send an v2 with fixed message? Anyway I delayed this patch for 2.1=
1
>> since this is not a bugfix.
>
> You don't need to resend, I'll just keep it on my list of things
> to deal with after 2.11. (Anything below the '---' isn't really
> in the commit message anyway, it gets stripped out when the
> patch is applied.)

Patch now in target-arm.next ready for post-2.11 pullreq.

thanks
-- PMM
