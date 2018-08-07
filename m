Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4040373wru;
        Tue, 7 Aug 2018 03:35:33 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcVO7Yh6qGeAybBfvqtTa4YmZIhpuGdwCykz3rvvKIQth5pNPU+yAoXF4nxf1FGMBfOyxLw
X-Received: by 2002:a37:de1a:: with SMTP id h26-v6mr17379135qkj.442.1533638133524;
        Tue, 07 Aug 2018 03:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533638133; cv=none;
        d=google.com; s=arc-20160816;
        b=J49kZAJZDMlgFbFjhbxOpdh6ub6n/47jdkOyr3PFOMhSQVohqS9LkADQazsKMW8Axf
         X3C4rUmv6G4YFUWX5CugfEgfE9vGdZaBjNvoSsiTIKBmkRyP/mA6mAx3qCKV+H44I2QR
         VDgmtQNS9PKnRDWsI//7E4UpHq2HUJF5lyppS/VKAgNUbc3i2wE6nmuRb2UxZdrTWX9i
         66fp9tT8VKj6L5BarJwSpYcN9QqQ1Fw1rT/DT4R5aGW3hpVrbqRkOO2FNGCiorKo80em
         jlI/v03NeUaQkw/ynGcHAZ/5kgTeXrzYCmxgpk7rIQGmkSjwpyzdolmTNo6+MkDZyk52
         VzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from
         :arc-authentication-results;
        bh=7qjpRkdi3ct8YEsKB23zpcf+tQv+o7dCzp5ufJusIBs=;
        b=tkuExq11P4sdo+EOywMzDYCNxNIEOICY4MxE7AKA+xTc9e7nWtDxU9c2zmrGEnzg+n
         xXk38/hqXkg4QBBim6jvSDuR8aQenEByXzJVNE/XIM1B5CWEe4vByvdR8bb7p99TfXFY
         125byV2hmOjnLHxH4yRs8fzoVH+i9Q1xnHmgOxAhJtm5POO51QLk7HlkHp2kMA0IO+TE
         c276ZyTuJfNbyraYWe8AAfRsp1XzEYXuxEmcE1PLhfIRIqejEMXHt+eryb9KJvn3VPFa
         GmwU5KWGPaWcAtN2YwnTvtvmpGov0f0EIkwawyeHL1h1V//mrxoBpvfcCu0SjB1Yxsg8
         HuLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a6-v6si874931qtn.281.2018.08.07.03.35.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 03:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmzKv-0003pN-25
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 06:35:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fmzJK-0003BT-1I
	for qemu-devel@nongnu.org; Tue, 07 Aug 2018 06:33:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fmzJG-0006gW-UH
	for qemu-devel@nongnu.org; Tue, 07 Aug 2018 06:33:54 -0400
Received: from 5.mo3.mail-out.ovh.net ([87.98.178.36]:57118)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fmzJG-0006gC-NU
	for qemu-devel@nongnu.org; Tue, 07 Aug 2018 06:33:50 -0400
Received: from player772.ha.ovh.net (unknown [10.109.160.217])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 2741C1C2EA3
	for <qemu-devel@nongnu.org>; Tue,  7 Aug 2018 12:33:49 +0200 (CEST)
Received: from zorba.kaod.org (ARennes-657-1-237-83.w2-11.abo.wanadoo.fr
	[2.11.96.83]) (Authenticated sender: postmaster@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id EC9987400A6;
	Tue,  7 Aug 2018 12:33:42 +0200 (CEST)
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20180807075757.7242-1-joel@jms.id.au>
	<20180807075757.7242-7-joel@jms.id.au>
	<e8ca4c53-a0d0-65bb-69f2-05a5201e4bf6@kaod.org>
Message-ID: <9053cce7-a3b9-420b-3623-9827e1b614f8@kaod.org>
Date: Tue, 7 Aug 2018 12:33:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <e8ca4c53-a0d0-65bb-69f2-05a5201e4bf6@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 8470145000040467264
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrtddtgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.178.36
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 6/7] aspeed: add a max_ram_size
 property to the memory controller
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6REvUZqK/tVL

On 08/07/2018 12:29 PM, C=C3=A9dric Le Goater wrote:
> On 08/07/2018 09:57 AM, Joel Stanley wrote:
>> From: C=C3=A9dric Le Goater <clg@kaod.org>
>>
>> This will be used to construct a memory region beyond the RAM region
>> to let firmwares scan the address space with load/store to guess how
>> much RAM the SoC has.
>=20
> This is in another patch I can send later on.

I now see that you have merged two patches. This is fine then.


Thanks,

C.

