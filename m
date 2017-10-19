Received: by 10.223.197.9 with SMTP id q9csp7040160wrf;
        Thu, 19 Oct 2017 10:17:39 -0700 (PDT)
X-Received: by 10.55.128.66 with SMTP id b63mr2986553qkd.67.1508433459241;
        Thu, 19 Oct 2017 10:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508433459; cv=none;
        d=google.com; s=arc-20160816;
        b=zkBli2x5F5MKLfFXTzX/YCbcuXRMGFi3T10lHuUFVkJAi7LAYM/fVre9Z0LAYmpX7D
         djVkR5nVAiaDGUH9dPZTrp3pViUYn4LT6ykLDUZyyMh7G7oXHS9qgex49NXFWdn/2Wvy
         LbzNC3KdEQZsiJgIl0IoKSdLeJ8VeXqXAh6PJUgj5VFThd7C0ttDkOW8eh1YgVN815Za
         7ljmClzL0K3jwFcyYFecx/KUNCSzQZkrKyGD9GfNKv2Wo4yNST2p0VfsLVY9BLgNc+nR
         du5AvXn62JoAHA9PIGOLjaResD1obqrogkPJe2aNdT5r4XLtT6StuVXYbbqBXJxfeCoJ
         e2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=wIXPgPJ5d3kssTL0/RKkJmFjpSelxKbWI6QouHfVK9U=;
        b=BRjzkHv0MWTCtN90X3Q2c4SYjm8ODIc7O0UeIDBUv5DHS+PfgKPHAwoqnYoJPVH+YC
         MF8tmMWlTGIwRZylnChHRhzsAprJKxA+jJCWoxsP1qDNETPSMNRzxPblll21N2H8VwLe
         fph41QyvRjX3CXZ+QtSLnrgtApWWLxMGSJ/fu+3HVWDP9qs2S4JfQWUY3j7Jufwn6xCG
         rX6mo0Bh9Wp5AZYJGE7w3Dxdv4DXENuVxoqrdKjm3CfniiMjhth3PmBAM2HTCjjj+UZd
         CNzsRox0HFSwAtvY8mq6+3/laP7vF6kgT1tigLSTcf6shnz36gt4KySztVuFKiqE4G3w
         AsWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PIj2mVXs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q128si3389101qkb.335.2017.10.19.10.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 10:17:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PIj2mVXs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5ERs-0002Vy-SY
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 13:17:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5EQD-0001RR-1i
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 13:15:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5EQ7-00069q-78
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 13:15:53 -0400
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:52722)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e5EQ7-00069a-0g
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 13:15:47 -0400
Received: by mail-wm0-x22c.google.com with SMTP id k4so17775778wmc.1
	for <qemu-devel@nongnu.org>; Thu, 19 Oct 2017 10:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wIXPgPJ5d3kssTL0/RKkJmFjpSelxKbWI6QouHfVK9U=;
	b=PIj2mVXsDPvFox8PSOsi4l4GhwnuSlyfMhwF1jyEVXs3RW5ofwAVigIs23hONeCAd+
	0EOM+hZc8QJIJlIYY8nGKPVJL1/APuWJoFliL504unhMSIPbkFGYpliIT1PnnWm6uL3l
	Jjtyvgvtxi35i8duvyza8V25inxjCzjT/ShSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wIXPgPJ5d3kssTL0/RKkJmFjpSelxKbWI6QouHfVK9U=;
	b=DTMc8JfbbwMsxF6pQtSR3DfJSR7zEi26uS68kRGMToAEtc7RZGpGol5gQKVBwDujka
	n71T5EBmrgrgpqsnj6euXrLRSTiurGpzgqqFRpjKvR8nq73mIFeftdmCj9dHyfrYP9Zn
	tFbG6hciE1nnF2skjone1Xk9VvTYYkiY9M4h9BfjPJ/t5XYMh/wlUggS1MbpkSOoouBb
	8wOCyhkaNZzWNS+wlKepu8Lpq358xGm3UhNYZyRzLE1VE0ygHGBvu/4C6RZ1tvgfUY2P
	GpjOseXI+REbA18eTgO4lQ3rgHhwEjou2Z0tyFLRAr0Z23YyaqO1b2B3/5NX6sDJESuL
	2UAw==
X-Gm-Message-State: AMCzsaXsCH1IvIVo/7uqe4oWcAVhnD1U9SFjrJLjrWuv3Rn0gNm53Wn7
	zL2JcUJeEFJA1sj4zIJBG9vyHjUOPTGWamBBN0x9Wg==
X-Google-Smtp-Source: ABhQp+RTl1w4kLgr9jz8JwiswwDKinTLeuccXyOWcAGTL5VTGpSO4CySUYdlp+IOO8SZaCZPv6WTc1OivU9lQTUJL/M=
X-Received: by 10.28.145.197 with SMTP id t188mr2188461wmd.136.1508433345983; 
	Thu, 19 Oct 2017 10:15:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 19 Oct 2017 10:15:25 -0700 (PDT)
In-Reply-To: <MWHPR21MB0159A19F056CEE571E0397009E420@MWHPR21MB0159.namprd21.prod.outlook.com>
References: <20171018001608.8388-1-Andrew.Baumann@microsoft.com>
	<CAFEAcA-6saNdT9k9Oo+cMoPWR-miaDq08EhN=3pbVzbadwzOwA@mail.gmail.com>
	<MWHPR21MB0159A19F056CEE571E0397009E420@MWHPR21MB0159.namprd21.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 18:15:25 +0100
Message-ID: <CAFEAcA-=gSFmV+teOKtuwOc--Kd4Nd=DQL+b8+5XEE8BOY6qVQ@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-devel] [RFC PATCH] arm: implement cache/shareability
 attribute bits for PAR registers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hbrigvE+wmmy

On 19 October 2017 at 18:04, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
>> From: Peter Maydell [mailto:peter.maydell@linaro.org]
>> Sent: Thursday, 19 October 2017 09:51
>>
>> On 18 October 2017 at 01:16, Andrew Baumann
>> <Andrew.Baumann@microsoft.com> wrote:
>> Hi; thanks for this patch. Looks like you forgot to add your
>> signed-off-by line.
>
> Thanks for the review!
>
> I didn=E2=80=99t sign the patch, because it wasn't ready to go in, and my=
 (limited)
> understanding of the protocol is that that's one of the things you're
> certifying in a signature.

Usually the way we do it is that if you have something that isn't
ready to go in, you mark it as [RFC], but you leave your signed-off-by
tag on it. That way if you should (hypothetically) disappear without
having time to update the RFC to a working version, somebody else
can start with the code you posted to the list and work on it.

Signed-off-by is really saying "I did this work and it's ok for this
to be distributed under the project's license", rather than a claim
about the quality of the code.

>> So you want the page table walk functions to directly fill in
>> the information about cacheability and shareability, including
>> doing lookups in MAIR registers (or PRRR/NMRR registers, which
>> QEMU stores in the same CPUState fields, but they have a different
>> format.)
>
> I agree. FWIW, the original reason for doing it here was that I
> didn't want to slow down the normal page-table walk with additional
> logic to compute the attributes, which isn't necessary for a TLB
> fill. If we're adding extra out parameters to the walker, then I
> can make those optional and skip computing them when the parameter
> is NULL.

Sure, though I think that if we've got to the point of having to
do a page table walk then we're already very much in the slow path,
so I don't mind if we just fill out the attributes every time.

thanks
-- PMM
