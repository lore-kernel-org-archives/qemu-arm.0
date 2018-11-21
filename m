Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1479361wrt;
        Tue, 20 Nov 2018 22:25:40 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VN9Y3G2s+2awTUaITcYwrjEmwqLF7I+vcEGBCgBg5Z2+86M3a7Otm2jkGFwnmLw4AXEFCW
X-Received: by 2002:a25:3813:: with SMTP id f19-v6mr4879722yba.237.1542781540008;
        Tue, 20 Nov 2018 22:25:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542781540; cv=none;
        d=google.com; s=arc-20160816;
        b=VNaeUeLVMfWxf+eRsOFDAxlBcgGUnwdC0Hg4QW/db3BSeHDsPPP1GtFdCwiL2vA4Id
         1t1/dqwlCN6V6aygcdFGf6DNGw8O+NQmdbtg+BgP9q0lgUmCHc+P4oWu3+L1JVO/HXTD
         EJt5WFcGxeWZGirENin9UbEOL/Ps0g/BflsGnrXcfzmMlAHJxBy8YdOWHMv78tznnTQl
         JTyvu0g3ogOpY/01SSzbHVLTBBn/CVdZdJuDwhxKwCvAPbInhvMpNZhkBoFAfdrHVoer
         987DlDAO278yn2oWvqxU74C98YR92EOv1e4WGROAis48lXtRughXgu25QnHvXnb+W6sE
         ElMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=H4xewBiefxcvwuryrSRBpyCdAqj/wbW5TG6Q6/P+9E0=;
        b=QYfkyKEGtyRcBbv9o5dOamLLHhTpbdOTQ01zSM48k4tBrFBkhCxm6P69GUNIXm3Egd
         ZpNT7E8O0LOTiPcluk/VQlnB1w5fI1VKLhbE/grPdR4o7yP72QSr1sDATovUj2mPvMLL
         3B1DfcxAGloZMz627rzi5sbic3n+i+fpkfZawjlrlrcI16chLSxh2DJSX37Kt49p8v4v
         i6bbzew3BLjc6oDAGq9nBdXLwB3Y/ygOjzQeyv7Dv8Kdk0wUhsgVcDtZF6G4EEDRFBDX
         4zItpWB/danewmlfoaa+MLgceBl4ETiIBMlorGa3OqnpRnQX4/Dmyg1Gbj79FAI9h5NP
         7tWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r26si9676468ywa.463.2018.11.20.22.25.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 22:25:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPLxD-0002A4-Do
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 01:25:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gPLx2-00029x-26
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 01:25:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gPLwy-0002xF-83
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 01:25:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51268)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gPLwy-0002wp-0q; Wed, 21 Nov 2018 01:25:24 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E616E3084242;
	Wed, 21 Nov 2018 06:25:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-140.ams2.redhat.com [10.36.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6EDCB60A9C;
	Wed, 21 Nov 2018 06:25:17 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <1542735761-16176-1-git-send-email-thuth@redhat.com>
	<3bfff029-f88a-ef68-846c-1cacd0800d26@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <297db2f1-e817-c155-337e-4d34553061f0@redhat.com>
Date: Wed, 21 Nov 2018 07:25:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3bfff029-f88a-ef68-846c-1cacd0800d26@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 21 Nov 2018 06:25:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] MAINTAINERS: Assign some
 more files in the hw/arm/ directory
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
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v7hELL+ze0F3

On 2018-11-20 21:23, Philippe Mathieu-Daud=C3=A9 wrote:
> On 20/11/18 18:42, Thomas Huth wrote:
>> I apparently missed some more files and even a complete machine (the
>> "imx25-pdk") in my previous patch... but now we should hopefully have
>> a completely coverage for all available ARM boards.
>>
>> Fixes: 95a5db3ae5698b49c63144610ad02913e780c828
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>> =C2=A0 v2: Dropped smmu* files from this patch
>>
>> =C2=A0 MAINTAINERS | 14 ++++++++++++++
>> =C2=A0 1 file changed, 14 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 1032406..36ffc01 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -533,6 +533,18 @@ L: qemu-arm@nongnu.org
>> =C2=A0 S: Odd Fixes
>> =C2=A0 F: hw/arm/gumstix.c
>> =C2=A0 +i.MX25 PDK
>> +M: Peter Maydell <peter.maydell@linaro.org>
>> +R: Jean-Christophe Dubois <jcd@tribudubois.net>
>> +L: qemu-arm@nongnu.org
>> +S: Odd Fixes
>> +F: hw/arm/fsl-imx25.c
>> +F: hw/arm/imx25_pdk.c
>> +F: hw/misc/imx25_ccm.c
>> +F: include/hw/arm/fsl-imx25.h
>> +F: include/hw/misc/imx25_ccm.h
>=20
>> +F: tests/ds1338-test.c
>=20
> This last entry is weird alone (at least without the hw/timer/ds1338.c
> device listed).
>=20
> This RTC is also used by the aspeed/realview/versatilepb boards.

You're right. I've added it since the test uses "-machine imx25-pdk",
but the correct way is likely to add a separate section for the timer
device instead. I'll remove this line in v3.

>> +
>> =C2=A0 i.MX31 (kzm)
>> =C2=A0 M: Peter Chubb <peter.chubb@nicta.com.au>
>> =C2=A0 M: Peter Maydell <peter.maydell@linaro.org>
>> @@ -615,6 +627,7 @@ R: Andrew Baumann <Andrew.Baumann@microsoft.com>
>> =C2=A0 R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> =C2=A0 L: qemu-arm@nongnu.org
>> =C2=A0 S: Odd Fixes
>> +F: hw/arm/raspi.c
>> =C2=A0 F: hw/arm/raspi_platform.h
>> =C2=A0 F: hw/*/bcm283*
>> =C2=A0 F: include/hw/arm/raspi*
>> @@ -641,6 +654,7 @@ F: hw/arm/z2.c
>> =C2=A0 F: hw/*/pxa2xx*
>> =C2=A0 F: hw/misc/mst_fpga.c
>> =C2=A0 F: include/hw/arm/pxa.h
>> +F: include/hw/arm/sharpsl.h
>=20
> I think hw/gpio/zaurus.c goes there too.

Well spotted. I'll add it in v3.

And I think we should add hw/display/tc6393xb.c here as well.

 Thomas
