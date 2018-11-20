Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp436828wrt;
        Tue, 20 Nov 2018 03:20:52 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UH/n7X8qPtkPNCgqN7CDWPQyUfKv1nt8IQe7zY17NaentxfVkWmUGM76OW+JPCxvtO08g4
X-Received: by 2002:a25:2e44:: with SMTP id b4-v6mr1282539ybn.216.1542712852723;
        Tue, 20 Nov 2018 03:20:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542712852; cv=none;
        d=google.com; s=arc-20160816;
        b=Fg09l5PC7i8K6SJVDxrzM0H7XaD1kh40iOpc4v4I4pZ12Esz+pwKoUhWWJDTzzasFc
         hJPFHvAGSvm9IaIL0oQRRHr4yZoJMKv2zgfpb105PAMajtsUiU7rnE++pkYw7bRCX0bu
         nNh3DtHPg9yEIs8hRaB1wk+8Lhu3O33bnu5fkHbo89nuzQya61kl/U7XrpxCYVtlELXm
         4dIfZodpgLTDvPoWqGaWyxn8ld+qwS3PNin3Xg6t7Ow8RxoCRLTaK0zSsWBF5q8liyGi
         7oVdxH9x0hOlZNhkUlsSp17MhdPDc/kHTIcoNPTuWtdAcfX/FWsOt4rcVsAcYnG+sW6G
         hlcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Je17gziwVxsWdbuu39MofBRirFWrZkJPfYsePy95qMw=;
        b=wjsZR8wLi2dTRbARffILLhRGAwpMn1wtNJO94z/fXBMK/E8Cjn6JQeZ2t3QzPjkfb7
         5G4Pu+NoSC0mvXM3Ps7ebccIuZ5qS9yNcORb1Yrmb+vOpRhOihVr1G96f6qkJEjWp6HA
         r7VSKfKNyI6efmMEv2HvCi+98bmGgpvK7sV0r3Cuk/Lrz2WBn7BCu7+oEE0EfiiPzMwV
         Axt04VzLeh5LWCbUasqMZ5yhEFlQdfnrs+fklNLFQqsikKvDek48afoYGoqDcTFCxdWb
         82ePDAr5eChHQl/B8R0HIgOhWxoKaDH20hKvMxY2CTnbbRRpiRHSKwHymdJMKcfqSp1w
         z1aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y79si10875336ywy.114.2018.11.20.03.20.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 03:20:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP45M-0008Eb-47
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 06:20:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gP45E-0008E9-4D
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 06:20:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gP45A-0000TM-9k
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 06:20:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40024)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gP45A-0000NB-2P; Tue, 20 Nov 2018 06:20:40 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4ADA9309EA7B;
	Tue, 20 Nov 2018 11:20:38 +0000 (UTC)
Received: from [10.36.116.185] (ovpn-116-185.ams2.redhat.com [10.36.116.185])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E03445C6C2;
	Tue, 20 Nov 2018 11:20:36 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1542657473-9196-1-git-send-email-thuth@redhat.com>
	<CAFEAcA_xhYf0VNaq1gM1OWWCkms5sTpn3kdqSHN0AZ3cH1f8Dw@mail.gmail.com>
	<27dd52ce-1cd6-0a92-635c-20ce1c9d5c2b@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <62488962-e0bc-e116-cc2d-699c4cd1cbe7@redhat.com>
Date: Tue, 20 Nov 2018 12:20:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <27dd52ce-1cd6-0a92-635c-20ce1c9d5c2b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 20 Nov 2018 11:20:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] MAINTAINERS: Assign some more
 files in the hw/arm/ directory
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
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YLiq5kEtoBPO

Hi Thomas,

On 11/20/18 12:05 PM, Thomas Huth wrote:
> On 2018-11-20 11:19, Peter Maydell wrote:
>> On 19 November 2018 at 19:57, Thomas Huth <thuth@redhat.com> wrote:
>>> I apparently missed some more files and even a complete machine (the
>>> "imx25-pdk") in my previous patch... but now we should hopefully have
>>> a completely coverage for all available ARM boards.
>>
>> Hi; looks like you forgot to cc qemu-devel.
>=20
> Oops, sorry about that.
>=20
>>> Fixes: 95a5db3ae5698b49c63144610ad02913e780c828
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  MAINTAINERS | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 1032406..ac20dc8 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -533,6 +533,18 @@ L: qemu-arm@nongnu.org
>>>  S: Odd Fixes
>>>  F: hw/arm/gumstix.c
>>>
>>> +i.MX25 PDK
>>> +M: Peter Maydell <peter.maydell@linaro.org>
>>> +R: Jean-Christophe Dubois <jcd@tribudubois.net>
>>> +L: qemu-arm@nongnu.org
>>> +S: Odd Fixes
>>> +F: hw/arm/fsl-imx25.c
>>> +F: hw/arm/imx25_pdk.c
>>> +F: hw/misc/imx25_ccm.c
>>> +F: include/hw/arm/fsl-imx25.h
>>> +F: include/hw/misc/imx25_ccm.h
>>> +F: tests/ds1338-test.c
>>> +
>>>  i.MX31 (kzm)
>>>  M: Peter Chubb <peter.chubb@nicta.com.au>
>>>  M: Peter Maydell <peter.maydell@linaro.org>
>>> @@ -615,6 +627,7 @@ R: Andrew Baumann <Andrew.Baumann@microsoft.com>
>>>  R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>  L: qemu-arm@nongnu.org
>>>  S: Odd Fixes
>>> +F: hw/arm/raspi.c
>>>  F: hw/arm/raspi_platform.h
>>>  F: hw/*/bcm283*
>>>  F: include/hw/arm/raspi*
>>> @@ -641,6 +654,7 @@ F: hw/arm/z2.c
>>>  F: hw/*/pxa2xx*
>>>  F: hw/misc/mst_fpga.c
>>>  F: include/hw/arm/pxa.h
>>> +F: include/hw/arm/sharpsl.h
>>>
>>>  SABRELITE / i.MX6
>>>  M: Peter Maydell <peter.maydell@linaro.org>
>>> @@ -686,7 +700,9 @@ M: Peter Maydell <peter.maydell@linaro.org>
>>>  L: qemu-arm@nongnu.org
>>>  S: Maintained
>>>  F: hw/arm/virt*
>>> +F: hw/arm/smmu*
>>>  F: include/hw/arm/virt.h
>>> +F: include/hw/arm/smmu*
>>
>> The SMMU files aren't part of the virt board, they're
>> the SMMUv3 device model. They should go in a section
>> that lets us mark Eric Auger as their maintainer.
>=20
> Ok, I'll send a v2 without the smmu* files. Eric, could you please take
> care of sending a patch for a new SMMU section?
Yes sure.

Thanks

Eric
>=20
>  Thomas
>=20
