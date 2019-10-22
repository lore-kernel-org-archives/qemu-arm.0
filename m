Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp203414wrq;
        Tue, 22 Oct 2019 10:27:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybkt24iYzYeZIo/WHC+keeTs/ge7VCiMM+srupHSVgsbwSTjFx56dLVWNmHBsd21qmkxHF
X-Received: by 2002:ad4:51cc:: with SMTP id p12mr4260295qvq.243.1571765233160;
        Tue, 22 Oct 2019 10:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571765233; cv=none;
        d=google.com; s=arc-20160816;
        b=KA6T3ZTX5LfMhWXIGsJkJ5E/zZN4sisl5OhWgM53WRB2oZADg0FovmzcCJ8mAHbHsL
         d7NYGw5K+oHF8a3+awF1A+f55774XoGz30D9W1qDm9lE6TdLEhkgaEQDul06ZweU9itK
         gd9KpYyVdUEbR1FzN1pCNLInSzNjcZ6/UqzZwP+yhcGVVysfz8nsqTPeu78LOZ46KODE
         m+q/6PZFfjitnD5qcPcN6RB2frTYgKlGa0P58T2eIVpLMsAKxOrhBkQS8lMfAJzucgkr
         Sb0VQm0Py0hdZToniOfC0v/yHHgJp0RdwpXP24rpd6RgMm8NQZlyRh9Pvi/jYQzye7CS
         7g3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=+Mxs7rjMMY7J84kK2X+ZSADrev/+TfY2iDPeg6vVQz0=;
        b=M4D3dK/Gw5X2qv8zHYs0Fmsxgcv9DkWPzW6Rii2QVbvEPf+FmybVclswU84VmZsobD
         SaWVg74c1/AcHC8DiXPINGCpFL5EafTUQazfaT3WQvDFH3wpPi5RkSyHQRvSRtVJbdVW
         m8gw0toQVqKT/xTMF6Jc6laaq+wE1ZNJht6kClvLLPKD2HZTYZwQtP0ipkIpXk/Wss6k
         Aay0J1yrllUvRqXpaneG3UQkC15BDajyvD5UjG7RbfHbJAAr5bI82+c9egyK1yD8Ul49
         tb8FhEhU/kEpiZKvC2QzlefffsUa3ynXA4wYZJqYniTZVkswzPpQ4x8oY4H1WvS2P+IV
         0fcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u35si8406437qtb.390.2019.10.22.10.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 10:27:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMxw8-0003Q7-Kp
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 13:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iMxls-0001Lt-Qo
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 13:16:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iMxlq-0000GP-Sx
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 13:16:36 -0400
Received: from 8.mo69.mail-out.ovh.net ([46.105.56.233]:52975)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iMxlp-0000Ez-Ew
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 13:16:34 -0400
Received: from player738.ha.ovh.net (unknown [10.108.57.140])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 0C8026CFDC
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 19:16:28 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player738.ha.ovh.net (Postfix) with ESMTPSA id 0E711B65F0EB;
 Tue, 22 Oct 2019 17:16:17 +0000 (UTC)
Subject: Re: [PATCH] aspeed: Add an AST2600 eval board
To: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20191016090745.15334-1-clg@kaod.org>
 <CACPK8XdT0_JCxzfxd4dCafK0Ae9+18ZWcusuXV+d4eEmwwBnkA@mail.gmail.com>
 <CAFEAcA_6yxaanT2N6Twos_FxjJNgvVKShwgq=pR4fqmcZUsQFA@mail.gmail.com>
 <CAFEAcA8py1obBXc1o02wTRkXms9NwCnCT6Q9ZZ-4W=NzNocLrQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a0b2779c-bcd5-0fe9-ff3f-d4254aba8805@kaod.org>
Date: Tue, 22 Oct 2019 19:16:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8py1obBXc1o02wTRkXms9NwCnCT6Q9ZZ-4W=NzNocLrQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 4137682159691664192
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeejgdduudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.56.233
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o/G4NE5UN/+s

On 22/10/2019 18:43, Peter Maydell wrote:
> On Thu, 17 Oct 2019 at 14:54, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>>
>> On Thu, 17 Oct 2019 at 07:33, Joel Stanley <joel@jms.id.au> wrote:
>>>
>>> On Wed, 16 Oct 2019 at 09:08, C=C3=A9dric Le Goater <clg@kaod.org> wr=
ote:
>>>>
>>>> Define the board with 1 GiB of RAM but some boards can have up to 2
>>>> GiB.
>>>>
>>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>>>> ---
>>>>
>>>>  Changes since AST2600 patchset:
>>>>
>>>>  - lowered the RAM size to 1 GiB as it was breaking the tests on som=
e
>>>>    hosts.
>>>
>>> Peter,
>>>
>>> After chatting with C=C3=A9dric I agree we should merge this patch.
>>>
>>> As it turns out the EVBs have differing amounts of RAM; his has 1GB
>>> while mine has 2GB. So we are not being inaccurate by setting 1GB as
>>> the default here.
>>
>> That's convenient, means we don't have to figure out how to
>> special-case the test infrastructure for it :-)
>=20
> This is now OK on the 32-bit boxes, but still fails 'make check'
> on my OSX system:
>=20
> manooth$ QTEST_QEMU_BINARY=3Daarch64-softmmu/qemu-system-aarch64
> tests/qom-test -p /aarch64/qom/ast2600-evb
> /aarch64/qom/ast2600-evb: Broken pipe
> /Users/pm215/src/qemu-for-merges/tests/libqtest.c:149: kill_qemu()
> detected QEMU death from signal 6 (Abort trap: 6)
> Abort trap: 6
>=20
> Dropping from the pullreq again :-(

It will be back !


Is it time for me to install an OSX system for dev and tests or is there=20
a way to reproduce the issue ? no errors spotted in valgrind.

Thanks,

C.
