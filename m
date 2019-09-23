Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2285707wrp;
        Sun, 22 Sep 2019 22:44:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwx/s4xf5D4PjSSJ3JeTvspX3PcDcW1knUZ8mgZuypykac3VLu+9egkq08n+Mw7SM+/djHT
X-Received: by 2002:ac8:550d:: with SMTP id j13mr15984747qtq.338.1569217471254;
        Sun, 22 Sep 2019 22:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569217471; cv=none;
        d=google.com; s=arc-20160816;
        b=Mz3QweovKv9mVLKP74UNVdGg2tXbNSHSqRYHdskaDKU+P5Nd1Ac7DEK6Bjqs5UNem2
         PrctzuRWYLdn082aZOzuGupP3oGnaDMPJYnn8vSTZBEghvRRQBviVeS9heEBsPgoQtxs
         4TaS+GNO7VU4QvFTaF8wgCassQX/gcF7gSnzd2WN7eCl+Q8p8TiSX1AmgXMSsF9iszX8
         YD4964tjmbOK+uoYfhsg02kONUcvPRuoiq6klLDWQsGv0TP6IFO9bzhrSNXIfhmnG24D
         66n6/a0fC7SWd+njUL04KW+5Okb+5tYGB33zrwzdp/pqX95BOYgTRJy8Oov4lIZI7/WT
         d45g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=en0csYdDVQpbj7LHVpfTB/OAKwzqkTH9PBRvCslsKDA=;
        b=WtqEovfLZXS6Pdh1N+GSfebGQTiPs653VAloPhxIfQMXF9JN9QJnqOUwleebQYqnDr
         wS4K/1j3IXeIWqL6ap47GDTEV4gBiLwdhHqQ3o4Mvcmvadn7uWUrk4s0Aimxby+o+Gd0
         nV/pc9DUNN1BOZAF+k1jns30UIVIm1AuMbM1YoQBpGRpcrLPAOk8oOXd2X/FuBDMDADS
         5H7qKdJ21sKb/QY+mzORKUQYCru45FL9ibykSy5jLVPiN2q8lFpaxfuSpE6NraQM4IuL
         tuHINNBDYdHOm0Axw07hE0yfJe5OF9Ncw33GW1BCrUs5iy7FWRG4w02avwHeklF7/qM3
         i00A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14si8247811qkv.230.2019.09.22.22.44.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Sep 2019 22:44:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCH9C-00070s-LX
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 01:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49769)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iCH92-00070U-D7
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 01:44:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iCH91-0003vu-71
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 01:44:20 -0400
Received: from 7.mo7.mail-out.ovh.net ([46.105.43.131]:40110)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iCH91-0003uh-0t
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 01:44:19 -0400
Received: from player794.ha.ovh.net (unknown [10.109.159.7])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id EB85812F624
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 07:44:16 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player794.ha.ovh.net (Postfix) with ESMTPSA id E0DB0A1041F6;
 Mon, 23 Sep 2019 05:44:11 +0000 (UTC)
Subject: Re: [PATCH 03/21] hw: aspeed_scu: Add AST2600 support
To: Joel Stanley <joel@jms.id.au>
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-4-clg@kaod.org>
 <139c3f7e-465e-4efb-b6c7-213dcd2ec6b7@www.fastmail.com>
 <2a267d68-2463-ae0d-00d0-d9a33ba845b2@kaod.org>
 <CACPK8Xd2aR9tJKfVjNn7ZCnNw1XK4X7A+fe-5Z62N_HyCOiAWQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3d4e0b9c-f658-bebb-e0f5-6c513c5434cf@kaod.org>
Date: Mon, 23 Sep 2019 07:44:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd2aR9tJKfVjNn7ZCnNw1XK4X7A+fe-5Z62N_HyCOiAWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 6606780653786532672
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdejgddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.43.131
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BE7foEkDs2mJ

On 21/09/2019 06:37, Joel Stanley wrote:
> On Fri, 20 Sep 2019 at 15:15, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>
>> On 20/09/2019 06:10, Andrew Jeffery wrote:
>>>
>>>
>>> On Thu, 19 Sep 2019, at 15:19, C=C3=A9dric Le Goater wrote:
>>>> From: Joel Stanley <joel@jms.id.au>
>>>>
>>>> The SCU controller on the AST2600 SoC has extra registers. Increase
>>>> the number of regs of the model and introduce a new field in the cla=
ss
>>>> to customize the MemoryRegion operations depending on the SoC model.
>>>>
>>>> +    switch (reg) {
>>>> +    case AST2600_PROT_KEY:
>>>> +        s->regs[reg] =3D (data =3D=3D ASPEED_SCU_PROT_KEY) ? 1 : 0;
>>>> +        return;
>>>> +    case AST2600_HW_STRAP1:
>>>> +    case AST2600_HW_STRAP2:
>>>> +        if (s->regs[reg + 2]) {
>>>> +            return;
>>>> +        }
>>>> +        /* fall through */
>>>> +    case AST2600_SYS_RST_CTRL:
>>>> +    case AST2600_SYS_RST_CTRL2:
>>>> +        /* W1S (Write 1 to set) registers */
>>>> +        s->regs[reg] |=3D data;
>>>> +        return;
>>>> +    case AST2600_SYS_RST_CTRL_CLR:
>>>> +    case AST2600_SYS_RST_CTRL2_CLR:
>>>> +    case AST2600_HW_STRAP1_CLR:
>>>> +    case AST2600_HW_STRAP2_CLR:
>>>> +        /* W1C (Write 1 to clear) registers */
>>>> +        s->regs[reg] &=3D ~data;
>>>
>>> This clear should respect the protection register for each strap case=
.
>>
>> Joel,
>>
>> You are the expert ! :)
>=20
> Someone could implement this if they wanted to. In the future it might
> be useful to create a detailed model for the OTP and secure boot
> behavior, and that can affect the strapping.
>=20
> However it is not critical for running guests under qemu. I think we
> should defer it until there is some guest code that needs the detailed
> behavior.

ok. It think we could trap the invalid writes with a simple mask
array at the beginning of the write op .

Thanks,

C.=20

