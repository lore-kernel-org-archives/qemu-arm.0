Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp590170lff;
        Fri, 10 Jan 2020 03:57:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqzFFJRWXv1DYZ6GWBGjjGzJY0Vzct3yeqnJKGcssx5qbJVT9gAHzc7yC2t7pb/vZg3a3hxt
X-Received: by 2002:a05:6402:1595:: with SMTP id c21mr3130772edv.32.1578657442597;
        Fri, 10 Jan 2020 03:57:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578657442; cv=none;
        d=google.com; s=arc-20160816;
        b=V6IduzTuobkrCj1erT1WLrldgk5NM21ioFnIWn7hyl3U3771bkZ/y1ywxs+0PysMpM
         Sawn/miMzKL4kDMjIohdTl5dK/GGBLnDQBrQVd6A3b82nbp6PcTP3mLrgfcm6BiW3Tn3
         ywquLoFBWgIeP3DiT7zh3WnPpx40nkd4LCcEd+mg38XbZ7aGgxMRpCSW4HI56eBvctPW
         FyGUrq2L6VA6jIk4bckH9umDZTV/y1KIVfU2spU30yOjXMRVHGOqrhanfRjIk3H1WvEE
         LCquaEVwHB6qmiI9+GQD0pdc1HWYWgX2I30SSloCbtYevgE5NmITIRGZHS+0MWgrSKMU
         ZycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=+YD6UKXsxNHSLBMvwDvR1Ze3/D3ShqQ1TkwvjHGgxoY=;
        b=SeqvSWmRQOKb/Op5yJHVDob9ocqeu9Nd3l3D+qHfssE9w5yT+Rs7tF0FXl1visqSU5
         UYBpmURp+7atJMILRwFgcZsoI9VfOK6YQppCDHwVBa/p+kJhYwiNr0Y27O1DV7mOtg/d
         Kw7Nxzx+y2k6kPuthKlZo7EWAzA4Ay7SG3zjPanH7dIUmc0PNAAYPLEgw7PVmOe272EM
         +w5LQSm3G6j3amgZa976RCTm8HpOyUJxnNPJuG/P1lttwuV/l+yjlMS/L6HF1b9fz4/j
         wskLOajUPI6eumEFcxkyk/lo0biKaRsC3EGCQny7tUth9Eg3eegUiPceaW6n7FHDgrm8
         3qDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8si1389214edv.38.2020.01.10.03.57.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 03:57:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipsun-0006kn-8G
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 06:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48619)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ipsub-0006ir-4q
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 06:57:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ipsuZ-0005R3-Ka
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 06:57:08 -0500
Received: from 7.mo173.mail-out.ovh.net ([46.105.44.159]:34708)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ipsuY-0005MB-CX
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 06:57:07 -0500
Received: from player690.ha.ovh.net (unknown [10.108.54.237])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id B5B7712C301
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2020 12:57:02 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id B54D3DF37D5B;
 Fri, 10 Jan 2020 11:56:56 +0000 (UTC)
Subject: Re: [PATCH 2/5] hw/arm: ast2600: Wire up the eMMC controller
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200107073423.30043-1-clg@kaod.org>
 <20200107073423.30043-3-clg@kaod.org>
 <a7c45303-e624-d7aa-df6f-e03f26b3cba7@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <901d2dc7-f8ed-bbca-b587-19fce5fed631@kaod.org>
Date: Fri, 10 Jan 2020 12:56:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <a7c45303-e624-d7aa-df6f-e03f26b3cba7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7389844039592151872
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeifedgfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeltddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.44.159
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Wyi6WWQskWC

>> +
>> +=C2=A0=C2=A0=C2=A0 sysbus_init_child_obj(obj, "emmc", OBJECT(&s->emmc=
), sizeof(s->emmc),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 TYPE_ASPEED_SDHCI);
>> +
>> +=C2=A0=C2=A0=C2=A0 object_property_set_int(OBJECT(&s->emmc), 1, "num-=
slots", &error_abort);
>> +
>> +=C2=A0=C2=A0=C2=A0 sysbus_init_child_obj(obj, "emmc[*]", OBJECT(&s->e=
mmc.slots[0]),
>=20
> Single block, so use "emmc" instead.

Andrew, how should we call the objects in the slots ? "sdhci" ?=20

Thanks,

C.=20
