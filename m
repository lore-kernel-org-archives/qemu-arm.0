Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5216058wrt;
        Tue, 2 Oct 2018 08:52:01 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63ZgazYOwkfST6mI5eyUIwaNPcjLlyyIoc1ZU9C4BGYrrSDUfzAIe8/en3ey+WkTOYWkVeX
X-Received: by 2002:a37:b546:: with SMTP id e67-v6mr12770681qkf.237.1538495521624;
        Tue, 02 Oct 2018 08:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538495521; cv=none;
        d=google.com; s=arc-20160816;
        b=1F6xuxieH88SqBH/1uo/ofcODkRI2GVeSOc0r/qb7xdEF+Q1VYciRk8ACKbxjKjH3R
         6hxrgO5871SD6eUtx2F+d4AGpFfg/9cnbTPMl2MbIUzi6w38DSorYRoMFS0F+e6BjzLr
         lSv1OZ7OXCkAWQn7xSWCDRODed4w052aBqu131ejNQqRxdtIONd3xmA8llb4fk3HDBhW
         fnVlb3aZt72XsjUrQkaPHQRT2GCdFTrzA4QI2SlRgu9ceNifJxIU5iGN4r+5WAHm0jhj
         UQP2UQ18HpwLvQHrxSpRnEFtpD7Ba+0X5bT+fgXg86NFic5VmXM3k6in+QrYyevSUOuZ
         SMdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=JvyMNt5M1+jPa9E4TrnUEg/go7AU9U6G9Z7PWCqY/Do=;
        b=rg2rIhl3N+DbCyI/WyX2MhxMixANCbNVkN/rIWSQxPp+nonZagft1+05VuVDXnxsGU
         r3gXvLXqJ/VXZZ4YJhkvpqa7qo5pfj1oSVDXTFuqNUsIALnVS4ZyqvhFe0vr2OtAINxM
         vEgkjSJkMV0C5KMIddNdK53fY8JHJ1x9s3iWkddPqnbfiEIFEq/VOsu3eP9MZFtGDCZo
         oiBruAD16lqXSfoWbu5fwCP3Nr+tzFxbOC2/6RqnUDdapO1Q81riRmkBDf9fB9D2hA6Z
         YoXXsWrs1dciAsCnJ7MmBYmyKbBcGkhuP3D8W5v/5A+2uvLGMdngWHlpVmdyF7LWdYvc
         Cmog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i188-v6si3560861qkc.187.2018.10.02.08.52.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 08:52:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7Mxt-00061L-0F
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 11:52:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g7Mva-0004CX-K6
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:49:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g7MvU-0007EI-Of
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:49:36 -0400
Received: from 2.mo177.mail-out.ovh.net ([178.33.109.80]:57387)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g7MvR-0007Bc-RI
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 11:49:32 -0400
Received: from player693.ha.ovh.net (unknown [10.109.160.239])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id C0767CC461
	for <qemu-arm@nongnu.org>; Tue,  2 Oct 2018 17:49:19 +0200 (CEST)
Received: from zorba.kaod.org (unknown [145.131.95.179])
	(Authenticated sender: postmaster@kaod.org)
	by player693.ha.ovh.net (Postfix) with ESMTPSA id 7DF4E4400C4;
	Tue,  2 Oct 2018 17:49:11 +0200 (CEST)
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180921161939.822-1-clg@kaod.org>
	<20180921161939.822-5-clg@kaod.org>
	<CAFEAcA_NmJO1OiE51ypZXek6D-_hqtBX+Gi2=kzEBtZ5fzo_Mg@mail.gmail.com>
Message-ID: <b3cbd561-8c23-8dd1-ff66-9c9f8a3ad4bf@kaod.org>
Date: Tue, 2 Oct 2018 17:49:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_NmJO1OiE51ypZXek6D-_hqtBX+Gi2=kzEBtZ5fzo_Mg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10628213647079082948
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrtddtgdeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.109.80
Subject: Re: [Qemu-arm] [PATCH v2 04/11] hw/arm/aspeed: add a
 'execute-in-place' property to boot directly from CE0
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: znhadeT6Qnqj

On 10/2/18 12:49 PM, Peter Maydell wrote:
> On 21 September 2018 at 17:19, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
>> The overhead for the OpenBMC firmware images using the a custom U-Boot
>> is around 2 seconds, which is fine, but with a U-Boot from mainline,
>> it takes an extra 50 seconds or so to reach Linux. A quick survey on
>> the number of reads performed on the flash memory region gives the
>> following figures :
>>
>>   OpenBMC U-Boot      922478 (~ 3.5 MBytes)
>>   Mainline U-Boot   20569977 (~ 80  MBytes)
>>
>> QEMU must be trashing the TCG TBs and reloading text very often. Some
>> addresses are read more than 250.000 times. Until we find a solution
>> to improve boot time, execution from MMIO is not activated by default.
>>
>> Setting this option also breaks migration compatibility.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>


The DRAM training in mainline u-boot is also significantly slower on=20
real HW. I haven't spotted the exact area but the code is jumping back
and forth.  This patch should help tracking the culprit.
  =20
Thanks,

C.
