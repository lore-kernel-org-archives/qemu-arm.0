Received: by 10.223.159.82 with SMTP id f18csp617315wrg;
        Wed, 22 Nov 2017 12:25:41 -0800 (PST)
X-Google-Smtp-Source: AGs4zMY7PFlgEFE94+kBZo5T7E5Qk9Qtz9WU2Dq0msUu2+Y4SkI/bdzYz2yuKt1nJNVfn+AE/Z8F
X-Received: by 10.129.61.13 with SMTP id k13mr14205863ywa.493.1511382341666;
        Wed, 22 Nov 2017 12:25:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511382341; cv=none;
        d=google.com; s=arc-20160816;
        b=IWERLHkqSodMaifP3koytt+mMUb9DwJ/WzjFhKmeat4hCIsZPfA4qFsddYH5PQxFeW
         EKBOBoN7rWqKgxgqUqjlqZtkp66BOTwTArtiNqxJ0MdUfHWqfvOqNgoiW7cvWD/zJoUl
         3Eoc1gW1NdKB3UfJxuP0pNIlfINPkJkPA74G4MBiXpofNaKG14uIXwV6xMddAZxejuvc
         qCwbJX+bbnVQKXuwxo66cmqqfuAufIn+orERz5rBgHn48pT1pluY4R8sXNbTFyNbIOIT
         4E3G0fu+7xIFZBT1P+Zcy3BDf4rbVfiES33aQhoPqNwSKmZ0IrVkuGEDjt5U+HV+mpGR
         B8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=sQMlIvVJrnDj7Ht1aKIaAJ7TNeUPHQ8CyjkmRTo+2aI=;
        b=Bi3EdY40i/VP4Ts5olPx+SJORs0f6Nu8SbZ+0HmyGC/yUIFErXvH4TKYj/u9vQEnxa
         oQdMKFT8rr7d+tmk1XNjEzZsBJS69kD+uifSC7xxeStn7dlZO6LwoQdR7SNmsp/5cOji
         KK3Wvzgp5out/360YafDcWwtkoD2IImcycs1+cYxB2+BW1dafo+xCcZfjRVWuWV3xai6
         oYOoVqtkOFYVz+4E1TQDCcwZI9cPtzbuzwK1imJ8h7UzOnbeLwDRHD6gStTD0e6LHRGW
         McMc37Eqeane/nv/akdWsR8SebIDzKnogIQoIK6/LHmlhidesKXq3NmJ00ffOW4ZdB82
         UzZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u8ZXGR5Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a64si3661468ywf.483.2017.11.22.12.25.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Nov 2017 12:25:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u8ZXGR5Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHbaX-0002YL-4u
	for alex.bennee@linaro.org; Wed, 22 Nov 2017 15:25:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHbaO-0002Xz-HL
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 15:25:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHbaN-0006Z9-BA
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 15:25:32 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:40771)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eHbaN-0006Z0-61; Wed, 22 Nov 2017 15:25:31 -0500
Received: by mail-qt0-x242.google.com with SMTP id u42so25369834qte.7;
	Wed, 22 Nov 2017 12:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=sQMlIvVJrnDj7Ht1aKIaAJ7TNeUPHQ8CyjkmRTo+2aI=;
	b=u8ZXGR5ZokAqwBoIt+Wox9HKgsy+MxzQzobHEhoKPfpgh3V683WWSIeUdW/fVLQAIZ
	HbMJ6cpHLnEa/NapS9le8dnOFdb+RQq61cmGGzAUEqKRfyWZtOaFe0ka5Ql4iCG6ZJ+g
	ftmf1YktPQTNdMwX2nO/uL75Ht5bpykFWbM1qE9FPWGzEC7sTxRwF1bF8+z6MOcQ7q6H
	fotIr+IYUiSzW/c4/nrAwdMgtNfrvuHYd7ou5K0dGYfvKMrxFgMk3p7QSUPfL8AsQDqb
	iMbjMotDHl7qfxDBRHi+KTBfLCgKL6MzZfa4SrbUIpYtpm+A6z5S4rNHmKbFM6loZYel
	zujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=sQMlIvVJrnDj7Ht1aKIaAJ7TNeUPHQ8CyjkmRTo+2aI=;
	b=R926swig9Jy/mCZH+5cCp/Wh1tGsAnxa72VFPnLcsQx+8FllvTiQoE0tlom+B1fRKm
	mtngNXSaDgBIafW5mZUoSozv3Sg+edDoXR6PGWB5oBARVyCCkea/4YCRgdIjwHthy/Or
	IxhfowTPLvGFxU0mJVErqBRI6Jks/ey6XEIMamTQZ4uokd7V1rTf4P0ZvK2sEhqc1hOx
	S9AOmnEu/tTD/xqfYWiZHwFahNh76w6kdwCTuo5/qgFYIAkekrTy+O0Y3nrKGa4P6tjT
	iGOnFsV0CYSjVZE/FQQ1N8Q0vS0jDkIwVMQ5aiYZZAV5ld1hrmVU4IB/UmCiffwmJQMy
	W7eQ==
X-Gm-Message-State: AJaThX7ZkcymEqdY8464SdCGJBoe/g8WNZS0OTPSraizBh+5NU989Pzq
	gVLZVtoKWRu1yMC4KXrhiM/sS/JbOGX9Qd9wkXc=
X-Received: by 10.200.20.152 with SMTP id l24mr23883993qtj.31.1511382330592;
	Wed, 22 Nov 2017 12:25:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Wed, 22 Nov 2017 12:25:30 -0800 (PST)
In-Reply-To: <CAFEAcA8H=tSbr4hdz5eDqHPkmDx0qvuRNdttim3m1JB0YqPUnQ@mail.gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-8-andrew.smirnov@gmail.com>
	<CAFEAcA8H=tSbr4hdz5eDqHPkmDx0qvuRNdttim3m1JB0YqPUnQ@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 22 Nov 2017 12:25:30 -0800
Message-ID: <CAHQ1cqEVbbKzRD6O9SU2idMeRwi+tqB2h1eVz=QOyH1+e76=9Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH v3 07/30] imx_fec: Add support for multiple
 Tx DMA rings
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SXYsFkqUJjrm

On Tue, Nov 21, 2017 at 9:44 AM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wr=
ote:
>> More recent version of the IP block support more than one Tx DMA ring,
>> so add the code implementing that feature.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>
>>  static const VMStateDescription vmstate_imx_eth =3D {
>>      .name =3D TYPE_IMX_FEC,
>> -    .version_id =3D 2,
>> -    .minimum_version_id =3D 2,
>> +    .version_id =3D 3,
>> +    .minimum_version_id =3D 3,
>>      .fields =3D (VMStateField[]) {
>>          VMSTATE_UINT32_ARRAY(regs, IMXFECState, ENET_MAX),
>>          VMSTATE_UINT32(rx_descriptor, IMXFECState),
>> -        VMSTATE_UINT32(tx_descriptor, IMXFECState),
>> -
>> +        VMSTATE_UINT32_ARRAY(tx_descriptor, IMXFECState, ENET_TX_RING_N=
UM),
>> +        VMSTATE_UINT32(tx_ring_num, IMXFECState),
>>          VMSTATE_UINT32(phy_status, IMXFECState),
>>          VMSTATE_UINT32(phy_control, IMXFECState),
>>          VMSTATE_UINT32(phy_advertise, IMXFECState),
>
> tx_ring_num is constant for any particular instantiation of the device,
> so you don't need to put it in the vmstate.
>
> It's pretty trivial to make this vmstate compatible with the old
> ones for the existing single-tx-descriptor devices, so we might as well:
>
> /* Versions of this device with more than one TX descriptor
>  * save the 2nd and 3rd descriptors in a subsection, to maintain
>  * migration compatibility with previous versions of the device
>  * that only supported a single descriptor.
>  */
> static bool txdescs_needed(void *opaque) {
>     IMXFECState *s =3D opaque;
>
>     return s->tx_ring_num > 1;
> }
>
> static const VMStateDescription vmstate_imx_eth_txdescs =3D {
>     .name =3D "imx.fec/txdescs",
>     .version_id =3D 1,
>     .minimum_version_id =3D 1,
>     .needed =3D txdescs_needed,
>     .fields =3D (VMStateField[]) {
>          VMSTATE_UINT32(tx_descriptor[1], IMXFECState),
>          VMSTATE_UINT32(tx_descriptor[2], IMXFECState),
>          VMSTATE_END_OF_LIST()
>     }
> };
>
> and then add this to the vmx_state_eth at the end:
>     .subsections =3D (const VMStateDescription*[]) {
>          &vmstate_imx_eth_txdescs,
>          NULL
>     }
>
> Then you don't need to bump version_id/minimum_version_id on the
> vmstate_imx_eth struct.
>

Cool, sounds good. Will add that to the patch in v4.

>> @@ -791,6 +821,7 @@ static void imx_eth_write(void *opaque, hwaddr offse=
t, uint64_t value,
>>                             unsigned size)
>>  {
>>      IMXFECState *s =3D IMX_FEC(opaque);
>> +    const bool single_tx_ring =3D s->tx_ring_num !=3D 3;
>
> This looks odd -- I would have expected "single_tx_ring =3D
> s->tx_ring_num =3D=3D 1" ...

AFAIK the HW that's out there will have either 3 or 1 Tx ring, so
that's why I wrote it this way. I'll change the logic to the way your
suggest to avoid surprising the reader.

Thanks,
Andrey Smirnov
