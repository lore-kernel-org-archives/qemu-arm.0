Received: by 10.25.44.15 with SMTP id s15csp175503lfs;
        Fri, 28 Jul 2017 01:42:41 -0700 (PDT)
X-Received: by 10.237.63.67 with SMTP id q3mr10227346qtf.280.1501231361723;
        Fri, 28 Jul 2017 01:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501231361; cv=none;
        d=google.com; s=arc-20160816;
        b=Bz3wCHgUuk12I8UmZdi8Ql/6KlCJXLB2QNdEf2H+8wwqbCq8CMZ2VVQpN65w6ZHONd
         TvSRJahn/6zNAMLqYX1DhDUfY7UKHWHkvNnj0yV6dq7uuF5Iv/mKC+Lz9SB4pdhsTMF6
         pT4LMZBKpUMGPK6Y/tTL8KkAZpwoPAR+RFuZvo0xQDOaBq8gsDEfwOf6s9v4fSlHjKWK
         58E9AYXV8PEzM6B1s4NazNmaWyB0XV57EFJnHDo15ugzrilhleVoeeTRxm81atH36R8a
         lpYWnzl3eSpUbWHKq9wjKjDaYyJPntaTfYMKRc4RT7XS6HztklVz6iLODr00Sd0Q71XB
         kpFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=dqsgIsKOUXHuZ93cCqkQyVGgpDI91i16AhoHUZ/BIY8=;
        b=pdJ9u8aXmyxfLIw3crINZqM0JlYa/9rIy0pzVk0nSwIkVcKxPhZ8FAcoKfRvDMwxtL
         0FWtSqDZmpslhCQcqG/PJIoamRQbuUdSaev+OKr0FFOjQky3948NxS33cgU1EMSnfiw/
         URB3qI///KZUCd0mwIOoZlbA8i6ZRAQehqskPJGKPi636A8zfTKFLA7DkZ9YEneXGxim
         oR3jOucMMMje8DHkk1xc4HuvmTakj1C+FcwXiK/ZUEWgveN67OH3vkOVk/GL5TjbDkJ4
         XwN2vaZ6BJvuAW1JBZ8R+3rAhme7pGskUkqxWm5qWn5UQbHOnTvY3P5VXBDQguwyBplJ
         p9Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=DDdofCQM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k188si17140377qkc.178.2017.07.28.01.42.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Jul 2017 01:42:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=DDdofCQM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1db0r1-0001gn-0P
	for alex.bennee@linaro.org; Fri, 28 Jul 2017 04:42:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1db0qx-0001ga-MB
	for qemu-arm@nongnu.org; Fri, 28 Jul 2017 04:42:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1db0qw-0004IG-G9
	for qemu-arm@nongnu.org; Fri, 28 Jul 2017 04:42:35 -0400
Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f]:34348)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1db0qw-0004Ha-B1
	for qemu-arm@nongnu.org; Fri, 28 Jul 2017 04:42:34 -0400
Received: by mail-wr0-x22f.google.com with SMTP id 12so152566074wrb.1
	for <qemu-arm@nongnu.org>; Fri, 28 Jul 2017 01:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dqsgIsKOUXHuZ93cCqkQyVGgpDI91i16AhoHUZ/BIY8=;
	b=DDdofCQMQFTY5yhJm/04CPqohz02VO9Lw4QpjhPSoo3yijvh1O2C+qlVVBbDnQsRKn
	xilL1TnLYI17vFE80zjYQ0Yt01olLeUgf1ynkHWkzTbf9H9gIhMyukkytCvnVW77pcz0
	aYMLVYz8UNDM6lq1LHuOs6xfbKDdxftdmWtuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dqsgIsKOUXHuZ93cCqkQyVGgpDI91i16AhoHUZ/BIY8=;
	b=KqswVB76AFGM3rQaJP243bcWYq26vGuUTgFxQjOBi4EQV/YhT/IgrV13IxcZfZdWhn
	uoH5E4gip0PpUBBNijk4Wy6dXZquo5L99ndcZIt7tKcwypWApHMwszDITDZMePJGHeq3
	P3vrFFfZWq1nMz9aX+7uX+4kv0Pqr4UImiTTfK17lcV1YZACOhwS/AZLpB3iskPk/h4e
	JRGeJCAypyieHpl9ccWmeh038rIOUaRm9UaIB4ORea1GKGKOG+b/5XOL7LhZH//7eSZM
	jV7Q2LldkoLhKPhWe/xdcIBvAKzJQYyBaghfd7ooUf0Nni7xqEo/GSK7mcmVpPxj9Pp0
	PiPg==
X-Gm-Message-State: AIVw113aCDUIqAkh7ZAMqi/srM8EdhcBilZdnj8i9/oZ8uJ7GvDIDwZK
	vJe5enFT5uyHWpCBDJ27ghBItqXVsGQm
X-Received: by 10.223.160.229 with SMTP id n34mr6243165wrn.117.1501231353170; 
	Fri, 28 Jul 2017 01:42:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Fri, 28 Jul 2017 01:42:12 -0700 (PDT)
In-Reply-To: <122bfaa5-7192-056b-541c-b5f37f871bfc@amsat.org>
References: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
	<1501153150-19984-4-git-send-email-peter.maydell@linaro.org>
	<5aff6da7-4ad1-64af-6445-98b8d7520b4c@amsat.org>
	<122bfaa5-7192-056b-541c-b5f37f871bfc@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jul 2017 09:42:12 +0100
Message-ID: <CAFEAcA-D4puOE5qPOGEd9mEdQFVqpA16997ZmHf4C5Nq_gEnAg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22f
Subject: Re: [Qemu-arm] [PATCH for-2.10 3/5] target/arm: Rename cp15.c6_rgnr
 to pmsav7.rnr
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
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iTbl6CJTGPsf

On 27 July 2017 at 23:58, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> On 07/27/2017 07:43 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>
>> On 07/27/2017 07:59 AM, Peter Maydell wrote:
>
> [...]
>>>
>>> -    u32p +=3D env->cp15.c6_rgnr;
>>> +    u32p +=3D env->pmsav7.rnr;
>>>       tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
>>>       *u32p =3D value;
>>>   }
>>> @@ -2447,7 +2447,7 @@ static const ARMCPRegInfo pmsav7_cp_reginfo[] =3D=
 {
>>>         .readfn =3D pmsav7_read, .writefn =3D pmsav7_write, .resetfn =
=3D
>>> pmsav7_reset },
>>>       { .name =3D "RGNR", .cp =3D 15, .crn =3D 6, .opc1 =3D 0, .crm =3D=
 2, .opc2 =3D
>>> 0,
>>
>>
>> "RGNR" -> "RNR"
>
>
> Ah "RGNR" for -R and "RNR" for -M hmmm... still better keep the name
> matching the field, "rnr".

It's a bit awkward, yes -- we're going to get a mismatch one way
or the other.

In this patch I wanted only to change the field name, not
anything else (it's already a bit borderline for 2.10).

thanks
-- PMM
