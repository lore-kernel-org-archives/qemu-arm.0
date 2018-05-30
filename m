Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4702074wre;
        Wed, 30 May 2018 05:47:31 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLeK0QNKVWI9CCK29NS3Dw2bcR1ZjHNiDJm8p3RfRUaW5SmLEB1lupzljk85Df/VUthPCbv
X-Received: by 2002:a37:9a95:: with SMTP id c143-v6mr2176676qke.378.1527684451886;
        Wed, 30 May 2018 05:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527684451; cv=none;
        d=google.com; s=arc-20160816;
        b=vlZ/RIaGFx2mhoKt96sM8skLben5zgId4/1sdraHyMfXvK/uWRBJkFkyhFCVn+aN2G
         DNn6seisclrc+GXaqoIODlHW4iAkXEwf8igyOMNVkM/Rpqin/BBfwHoI85ODb87Y07uJ
         JLEnTi7HSn5mPhfeMyTsupwzhNDHWM56iBFhY0YrpYCzgDT36IgjoH+dWVeUcGK8sflL
         KWCBt58NFNEtYH4RjDDmdzIHEJzZVKDD+YD//9pEJAXvzpnP4PK1PW12ocDB2jOS1FJF
         h3woTckZhdIkzJAUgPrKTE5F3OmDxZXmnFlPedTVd+8Pl2huIQey2F9L6Mn15ZeOOlsn
         0T1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=c65MKlCEU5M08RwH+ipNyYELjq8gIQUwJgHx8kH6Xsk=;
        b=HGx9e0lS5K7fuAWwbi/seh5ctigoCT2+6f+JbkD6CzJVEFmmZivW2n3GqA/L2GoAs/
         q8ht9nOqQB5mdLf4L8WmS/Mu6HwTCHe0JXLmMAAo4Te75aQ0qyCrPqnGAEbzltvBzmP+
         ezShBRGnYfCjda7+AVVVqYz8VJhaC0JlnXf7DYUxigwO3ujfxmBF1+xsB7LfxU4a3num
         i+M9yZolGARm/Tk+X+K25uP4Wameb9JQ5FI1vz7oU0JRAjeHLQ+p+5caPO1DncGMHQsT
         IZrheSPdONbJpf7yC6cxMe8OoqUn3my/S3YocwkgD3hZJGUpTygqyjIiBPfOawAqTKg8
         GNXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x92-v6si1599101qte.261.2018.05.30.05.47.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 05:47:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38465 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO0Vn-0007b9-Ax
	for alex.bennee@linaro.org; Wed, 30 May 2018 08:47:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fO0Vb-0007Yy-UY
	for qemu-arm@nongnu.org; Wed, 30 May 2018 08:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fO0VX-0008NA-84
	for qemu-arm@nongnu.org; Wed, 30 May 2018 08:47:17 -0400
Received: from 6.mo179.mail-out.ovh.net ([46.105.56.76]:39934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fO0VX-0008LB-2B
	for qemu-arm@nongnu.org; Wed, 30 May 2018 08:47:15 -0400
Received: from player734.ha.ovh.net (unknown [10.109.122.59])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 2D803C9B55
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 14:47:09 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player734.ha.ovh.net (Postfix) with ESMTPSA id A1D1A2800AF;
	Wed, 30 May 2018 14:47:03 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180530075002.4618-1-clg@kaod.org>
	<CAFEAcA_a+nduAKWhLiwoKvoybL+cKN=51xV5M9f-VatPdbnf6w@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ffdef472-0cd0-25f1-9972-47a96e159766@kaod.org>
Date: Wed, 30 May 2018 14:47:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_a+nduAKWhLiwoKvoybL+cKN=51xV5M9f-VatPdbnf6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 11334434362282707895
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedriedtgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.56.76
Subject: Re: [Qemu-arm] [PATCH 0/4] aspeed: add MMIO exec support to the FMC
 controller
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
	Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kFJxBrD3HHiS

On 05/30/2018 02:40 PM, Peter Maydell wrote:
> On 30 May 2018 at 08:49, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> Hello,
>>
>> When MMIO execution support is active, these changes let the Aspeed
>> SoC machine boot directly from CE0. As there is still some
>> issues, the feature is disabled by default and should be activated
>> with :
>>
>>         -global driver=3Daspeed.smc,property=3Dmmio-exec,value=3Dtrue
>=20
> I'd really rather not add another mmio-exec device until
> we've sorted out making it actually work properly...

OK. I will keep it for later. The FW of the witherspoon machine is=20
a very good mmio-exec torture test.=20

Thanks,

C.=20

