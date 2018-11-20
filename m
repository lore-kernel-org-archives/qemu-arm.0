Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp428312wrt;
        Tue, 20 Nov 2018 03:11:48 -0800 (PST)
X-Google-Smtp-Source: AJdET5d3t1PNBSF2b1MPNC8xw6EzlsP73WbiXn96wsF3wf4F4vWlt/uAJLr2JJYw2YesWgnTitvH
X-Received: by 2002:a25:bc8b:: with SMTP id e11-v6mr1286750ybk.126.1542712308708;
        Tue, 20 Nov 2018 03:11:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542712308; cv=none;
        d=google.com; s=arc-20160816;
        b=p5suihdP0TxMWD1Xp4qXFxzdtoMO/3+z72f/TLdMor5mvmskcBy9IL70ixQLrKhFgl
         tLjFm9V9mA36kUFQ3E5c3pxy3++N4Bj3MJBHcy2wtJGUMGveIF3He7npntFkASMKhrJP
         olEbospEUjzNWGcwZdeaWSFrH9kXc0Lg29R0B5tQNBh8jVAelrRyRDcuVvJEARncn1SV
         j5gfuTq3M+tIRMLh3a2sL3EaQEzmaNuElH4bsBGGMFpbAJibP5h9048dIo4eFbb2qyzN
         qbem8Pw8yfJ5Fo24lYJN9lpVLhu5yZnfVEg3ezWepAiTZ1I5aaF72Yh1z32X4Gx704+c
         AJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=5J67nj/+G+Y1H8VoQyII8Mg9r0A8p1nzdAnUSEWkqn4=;
        b=zuwAqMAo8d4si+CTakJv61otXHxgOv5JDMtLB8gQ+PsXPMI72Z4VMQl9PdBhROEKyQ
         YRuUngN7a/fRnbPV5h55M9In+sgT+kcS6zgnkJ99slSZWKpIj4a+l8uOxnrNccWEIx7W
         2SzL8VpSlWoCQ8Usgf3GtW6NZ4bSSyXrZQ3oZy/CO29jQ3l/x30oR6AYwnn9MESzBLuU
         fq9/WvIbkKGLmnR60DCSEHKbhBNbcJyNkbNfOdtjSxxV6VqP72JVf2pKA0BWEpk1kPzU
         TQtmKlMA41wsrK9hFDrdx2MOghjL/vUHPf8nfw774qWN/chxJzR3yLD99qskd0Q6teX1
         wkdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h35-v6si17744196ybi.355.2018.11.20.03.11.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 03:11:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP3wZ-00017P-SU
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 06:11:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gP3qN-0003tM-CT
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 06:05:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gP3qM-0006Zc-9F
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 06:05:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33246)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gP3qM-0006Wh-1i; Tue, 20 Nov 2018 06:05:22 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 430B4308123E;
	Tue, 20 Nov 2018 11:05:21 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-127.ams2.redhat.com [10.36.116.127])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4FCB5C261;
	Tue, 20 Nov 2018 11:05:14 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
References: <1542657473-9196-1-git-send-email-thuth@redhat.com>
	<CAFEAcA_xhYf0VNaq1gM1OWWCkms5sTpn3kdqSHN0AZ3cH1f8Dw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <27dd52ce-1cd6-0a92-635c-20ce1c9d5c2b@redhat.com>
Date: Tue, 20 Nov 2018 12:05:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_xhYf0VNaq1gM1OWWCkms5sTpn3kdqSHN0AZ3cH1f8Dw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 20 Nov 2018 11:05:21 +0000 (UTC)
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
X-TUID: lDuckF9IdhI7

On 2018-11-20 11:19, Peter Maydell wrote:
> On 19 November 2018 at 19:57, Thomas Huth <thuth@redhat.com> wrote:
>> I apparently missed some more files and even a complete machine (the
>> "imx25-pdk") in my previous patch... but now we should hopefully have
>> a completely coverage for all available ARM boards.
>=20
> Hi; looks like you forgot to cc qemu-devel.

Oops, sorry about that.

>> Fixes: 95a5db3ae5698b49c63144610ad02913e780c828
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  MAINTAINERS | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 1032406..ac20dc8 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -533,6 +533,18 @@ L: qemu-arm@nongnu.org
>>  S: Odd Fixes
>>  F: hw/arm/gumstix.c
>>
>> +i.MX25 PDK
>> +M: Peter Maydell <peter.maydell@linaro.org>
>> +R: Jean-Christophe Dubois <jcd@tribudubois.net>
>> +L: qemu-arm@nongnu.org
>> +S: Odd Fixes
>> +F: hw/arm/fsl-imx25.c
>> +F: hw/arm/imx25_pdk.c
>> +F: hw/misc/imx25_ccm.c
>> +F: include/hw/arm/fsl-imx25.h
>> +F: include/hw/misc/imx25_ccm.h
>> +F: tests/ds1338-test.c
>> +
>>  i.MX31 (kzm)
>>  M: Peter Chubb <peter.chubb@nicta.com.au>
>>  M: Peter Maydell <peter.maydell@linaro.org>
>> @@ -615,6 +627,7 @@ R: Andrew Baumann <Andrew.Baumann@microsoft.com>
>>  R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>  L: qemu-arm@nongnu.org
>>  S: Odd Fixes
>> +F: hw/arm/raspi.c
>>  F: hw/arm/raspi_platform.h
>>  F: hw/*/bcm283*
>>  F: include/hw/arm/raspi*
>> @@ -641,6 +654,7 @@ F: hw/arm/z2.c
>>  F: hw/*/pxa2xx*
>>  F: hw/misc/mst_fpga.c
>>  F: include/hw/arm/pxa.h
>> +F: include/hw/arm/sharpsl.h
>>
>>  SABRELITE / i.MX6
>>  M: Peter Maydell <peter.maydell@linaro.org>
>> @@ -686,7 +700,9 @@ M: Peter Maydell <peter.maydell@linaro.org>
>>  L: qemu-arm@nongnu.org
>>  S: Maintained
>>  F: hw/arm/virt*
>> +F: hw/arm/smmu*
>>  F: include/hw/arm/virt.h
>> +F: include/hw/arm/smmu*
>=20
> The SMMU files aren't part of the virt board, they're
> the SMMUv3 device model. They should go in a section
> that lets us mark Eric Auger as their maintainer.

Ok, I'll send a v2 without the smmu* files. Eric, could you please take
care of sending a patch for a new SMMU section?

 Thomas
