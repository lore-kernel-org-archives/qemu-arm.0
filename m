Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3900174lff;
        Sun, 15 Dec 2019 16:15:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqz7ZJPc6IS5WutHWxDooI0jHecO/XxLtmsmJfBHjXEhpE0EYEAM2brEYVTtCRQ+SsCofPv7
X-Received: by 2002:a37:e112:: with SMTP id c18mr24131076qkm.481.1576455305267;
        Sun, 15 Dec 2019 16:15:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576455305; cv=none;
        d=google.com; s=arc-20160816;
        b=FH3Jbmi5ku7QMyJARW3fUkgpEhM20tokMD8IEWjRgYDFXeTwCWniOe1gG17/X0kVch
         RFcDI6GVaxP7b9kPIC0HNpni04yW9f+0iiuKc41dCWI9r6ccY+3Vr3bCilrB40SvN4AW
         leDTz6Pa0wV9YVEeK/QMl2GPiqW8MVnJ4unlgaRiMPcyzR+NXMhujb+C8WLbXuwQV5qQ
         m0owny7c3qdFznpXYkzdXdqCDkvkUUFe29nN759yHhqlDVMi3ySVWG6kYIYMY4NMWAfA
         KRDz1MjITa0ush2V7c5ps9Ckqsfvnoqv/eABkBh04hbhAdPq70drWMdoatf4UGrUOBki
         QceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=y0LLlI99L0EqdKViDjBQTUbG2sepIaYjbw6/dDJrf+k=;
        b=aokwmQT2l1hGoimRF94roYebeK/qYDOsR0ubI0H4NpvSFzr2r9tm9q58lyuLu4VdV1
         VrVTq7In5qCsLk/a6CVsJmuttBPx4A3KFrjf5ksuk1Kp4BOrUf5rz1WbstzfB4mXecjw
         vWueng+sbp8BDG0c3HAooPPz01CTj+7PLHH+n746bqnGOCAyKEZiG11PPAKBUbrJ0DSa
         xt2OeKQ8aCk4E9aZ5dEWiINT9LT8r1nwfqYPWjyz1NQlApplTu2fk6n0oTT0UqcQRT/g
         z3Mw12lbfNPY00xg+yupI50GWahfXjBfDmEqlNOdAMu50H8h5Mvq48WTnFyDkFM1pKE5
         qxMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZAEVfRoj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si9037063qti.21.2019.12.15.16.15.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 16:15:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZAEVfRoj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ige2S-0003ik-CS
	for alex.bennee@linaro.org; Sun, 15 Dec 2019 19:15:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55367)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ige2D-0003iK-Aw
 for qemu-arm@nongnu.org; Sun, 15 Dec 2019 19:14:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ige2A-0005jB-7q
 for qemu-arm@nongnu.org; Sun, 15 Dec 2019 19:14:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20111
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ige29-0005eA-Kv
 for qemu-arm@nongnu.org; Sun, 15 Dec 2019 19:14:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576455284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y0LLlI99L0EqdKViDjBQTUbG2sepIaYjbw6/dDJrf+k=;
 b=ZAEVfRojekbo7h8hrY4VFMxuj3N1pJeX4k9/PDW6x0IAAlwgKZaNSrhpAgyfRUZTh0NIl0
 enchKIL8btoaqPLMcGKMfD12iknB8vU7VQ645XRkAPpiQ4IkYb0zFCcLUKEdsCko1L04/e
 p+nkN5anL5EbY/V4XhNHYagtI1rw4Xk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-BnCMseBrNS-nM023lJJMtA-1; Sun, 15 Dec 2019 19:14:42 -0500
Received: by mail-wr1-f70.google.com with SMTP id o6so1688928wrp.8
 for <qemu-arm@nongnu.org>; Sun, 15 Dec 2019 16:14:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zEZZPFMofCKGRcBsQV1uHg9KBmUQ1xCItM4qKpPBjjc=;
 b=Jve0GFLaaILpxzqK3ijrEPjyGPS9ZAC/3Ea3O/tuKeXPN2e7EFTSr1l72u19ww5lPr
 cl3vc+5qfpoXQR20L6ZNkZ3UZ7uQEy8j8E2EE11cB0C3xI1latHZJhf46W20n8DLexVS
 8Src5HzIKbich0drWqGGw92LegI4A0lmgGODwyRlVlfb9jqK1QfpfU9VBTTQoTDU51YY
 gzMUc9rOpLY/FbxJb01lB/UOcpvUyRXSdHYMPyAKAq61GcDnt6YmlNV9i0cB4mh3MWzg
 PKR0vGPk8EL2lvFJu1hCAUfXgobKvjAnA3YXKQBWfEzLsmBQ+M8MGovIEpo9NvebOyxK
 04FQ==
X-Gm-Message-State: APjAAAWdkz9Ik3yBnRSVGiW0VKFoWLB8EMOdZkujhc9Gr+sbs5PgbDas
 djufQpYgV9wm4bIkh9MGUqzgL6IAFI0f38chJHHklesOfpYBXgT8qtMHp9Oeytxzf52SZ6IJ58t
 RqwC44rWsfQss
X-Received: by 2002:adf:cf12:: with SMTP id o18mr27021286wrj.361.1576455281364; 
 Sun, 15 Dec 2019 16:14:41 -0800 (PST)
X-Received: by 2002:adf:cf12:: with SMTP id o18mr27021259wrj.361.1576455281040; 
 Sun, 15 Dec 2019 16:14:41 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id o15sm19963027wra.83.2019.12.15.16.14.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Dec 2019 16:14:40 -0800 (PST)
Subject: Re: [PATCH 09/10] arm: allwinner-h3: add SD/MMC host controller
To: Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-10-nieklinnenbank@gmail.com>
 <CAPan3WrRKnu5vFz=JvrnD8tewUk7SdwFVYx4xVL353AnfPDgHQ@mail.gmail.com>
 <6bee15d7-7d80-0709-ac90-ef2052b39329@redhat.com>
 <CAPan3WpiWahU85-ZgV4BMPU8mUTxsq2TPn-szOHkHc5+PHUqpw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <03a78f1d-e8fe-5a53-b061-d39de9ed7a9e@redhat.com>
Date: Mon, 16 Dec 2019 01:14:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPan3WpiWahU85-ZgV4BMPU8mUTxsq2TPn-szOHkHc5+PHUqpw@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: BnCMseBrNS-nM023lJJMtA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6XoJpiGFyBLN

On 12/16/19 12:07 AM, Niek Linnenbank wrote:
>=20
>=20
> On Fri, Dec 13, 2019 at 12:56 AM Philippe Mathieu-Daud=C3=A9=20
> <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
>=20
>     Hi Niek,
>=20
>     On 12/11/19 11:34 PM, Niek Linnenbank wrote:
[...]
>      >=C2=A0 =C2=A0 =C2=A0+static uint32_t aw_h3_sdhost_process_desc(AwH3=
SDHostState *s,
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hwaddr desc_addr,
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TransferDescriptor
>     *desc,
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool is_write,
>     uint32_t
>      >=C2=A0 =C2=A0 =C2=A0max_bytes)
>      >=C2=A0 =C2=A0 =C2=A0+{
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 uint32_t num_done =3D 0;
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 uint32_t num_bytes =3D max_bytes=
;
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 uint8_t buf[1024];
>      >=C2=A0 =C2=A0 =C2=A0+
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 /* Read descriptor */
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 cpu_physical_memory_read(desc_ad=
dr, desc, sizeof(*desc));
>=20
>     Should we worry about endianess here?
>=20
>=20
> I tried to figure out what is expected, but the=20
> Allwinner_H3_Datasheet_V1.2.pdf does not
> explicitly mention endianness for any of its I/O devices. Currently it=20
> seems all devices are
> happy with using the same endianness as the CPUs. In the MemoryRegionOps=
=20
> has DEVICE_NATIVE_ENDIAN
> set to match the behavior seen.

OK.

[...]
>      >=C2=A0 =C2=A0 =C2=A0+static const MemoryRegionOps aw_h3_sdhost_ops =
=3D {
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 .read =3D aw_h3_sdhost_read,
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 .write =3D aw_h3_sdhost_write,
>      >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_EN=
DIAN,
>=20
>     I haven't checked .valid accesses from the datasheet.
>=20
>     However due to:
>=20
>      =C2=A0 =C2=A0res =3D s->data_crc[((offset - REG_SD_DATA7_CRC) / size=
of(uint32_t))];
>=20
>     You seem to expect:
>=20
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .impl.min_access_size =3D =
4,
>=20
>     .impl.max_access_size unset is 8, which should works.
>=20
> It seems that all registers are aligned on at least 32-bit boundaries.=20
> And the section 5.3.5.1 mentions
> that the DMA descriptors must be stored in memory 32-bit aligned. So=20
> based on that information,

So you are describing ".valid.min_access_size =3D 4", which is the minimum=
=20
access size on the bus.
".impl.min_access_size" is different, it is what access sizes is ready=20
to handle your model.
Your model read/write handlers expect addresses aligned on 32-bit=20
boundary, this is why I suggested to use ".impl.min_access_size =3D 4". If=
=20
the guest were using a 16-bit access, your model would be buggy. If you=20
describe your implementation to accept minimum 32-bit and the guest is=20
allowed to use smaller accesses, QEMU will do a 32-bit access to the=20
device, and return the 16-bit part to the guest. This way your model is=20
safe. This is done by access_with_adjusted_size() in memory.c.
If you restrict with ".valid.min_access_size =3D 4", you might think we=20
don't need ".valid.min_access_size =3D 4" because all access from guest=20
will be at least 32-bit. However keep in mind someone might find this=20
device in another datasheet not limited to 32-bit, and let's say change=20
to ".valid.min_access_size =3D 2". Without ".impl.min_access_size =3D 4"=20
your model is buggy. So to be safe I'd use:

   .impl.min_access_size =3D 4,
   .valid.min_access_size =3D 4,


> I think 32-bit is a safe choice. I've verified this with Linux mainline=
=20
> and U-Boot drivers and both are still working.

Regards,

Phil.

