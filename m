Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3867477lfp;
        Mon, 3 Feb 2020 04:09:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqziEdh4bj4ksZ+QCfofhhC46fuxElAYNttPdKIJwUHB5WVIibY/F09OWjLSbL4NFiuQ5byK
X-Received: by 2002:a37:582:: with SMTP id 124mr23252864qkf.257.1580731773554;
        Mon, 03 Feb 2020 04:09:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580731773; cv=none;
        d=google.com; s=arc-20160816;
        b=HRnAA/ln7GZtC3f8Xmmo3OaUfFby9dYsZYxPrDVfUZWdKi7yr8uq8AwVcJ6dC7gFBU
         VTqdiObOv1FnseX354g32rFPfwp70D0kBNbB4oGr27TdyqrgwVXws48xP4TreipVGWqG
         BGRda8P5dpSG+fFMVG4sV2cXDLZeBj8Iavt6AI4IBKWGzJxHnoSv7ZZ6cevq6h3xJbhP
         +7uETLY36ZZ1aOTVT5gHmDBt+S6wuL0Qy12h4EfgLP6bh5ss+o1lx9DzfNbaAh4UNnB1
         7rzoX/iWq/rDmSkU+oSGsYRtFHBIom78OWo049z10DUa46lCTnRr5GaulSvpfEl56paX
         yljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=d2Vi1xDuX/gFJh7zRcobZSL0PtFIJhZnK14ZrqT7Qx4=;
        b=irSp3iQWwTHfmq1NK6eMdGESZh1OgZdpQwPE8tCFetYY0tpW0aiYEY8c81Ap8egxCm
         Pa4Dj/utZY6DHMYkgSdLzEF7R0vhfnNsAGbLvsNQq6VgHF1yJIN+9Xwny1D7TZsxHqeH
         YFUlCE2ByNba6ZhlLuIewekFY4bzV6Jm8GsN0NoXlmlsLNwVVbYYrbed28j6v3aDbvXU
         1Eo7SeJnd/uu/3nWBUbnKozSJJgxmfbQo+AxWsdCY0ndAgNa2ziXa9SgBfPG+eq3X1oD
         xwkrHf9Am6/cfmHNZI/4Agc4TdLPu0+iN9WIJXazpnjHJYxkj0wyVh1IU+BA6F5NjfyJ
         jVDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NnpC3ISY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8si11059998qvs.93.2020.02.03.04.09.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 04:09:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NnpC3ISY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyaXk-0006v4-Ve
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 07:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47073)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iyaXc-0006uT-Kx
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 07:09:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iyaXb-0002Ri-3Q
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 07:09:24 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46698
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iyaXb-0002R0-09
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 07:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580731762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d2Vi1xDuX/gFJh7zRcobZSL0PtFIJhZnK14ZrqT7Qx4=;
 b=NnpC3ISYvkDULxWYGhfJMFxyIy7R7i9309nzy5S1FcyK0WQoriDEg08sHFAYs+u6kgKOLh
 U9wTuNqmPQONuKhD8blBesOu0EQ5SgSc4B/OtODp4DGpQLlwRoOwBcQZFdA45VhzyPdJTv
 rPcfj768Hh3q5Z51N94JDiwMlR9jtls=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-hFzCU-OSM7WcLRVLu-OE3A-1; Mon, 03 Feb 2020 07:09:04 -0500
Received: by mail-wr1-f70.google.com with SMTP id n23so1579547wra.20
 for <qemu-arm@nongnu.org>; Mon, 03 Feb 2020 04:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H8DX1PeyL1BIsOQfdq2upYmkDOkFIPyHF5fU3dbzCCk=;
 b=PYJeXWQOx8SrxmpZRD19lZVhT57jGqw5xj6Z5eE47ErcXfSdWXWIRdnibshFaYel7f
 um0sSwmWGs7QELXVTAGbJ+U5RRLOyQ6M9ilj57aGsBPF8yErh7MkoG4AmphO1F7NnMat
 7zwF3o2bsKk8L6mUHn05gxyvsxSKfnsvwBYC2bQh/asQIMqvxyXcvtHaQb1KLxCT+eTa
 pu8TD2cgdUZkUBhrSBHKALXsGrAZjKmOTEgPdppAUTf9nix8gPo9zPKZP99eFLHyuVzq
 laIhDfKR4br5AYxZMptycVsuGvIJarAO71ZXnjVw2RMknjcBWlnsaX75hhsSaNe2MxlT
 Jk7g==
X-Gm-Message-State: APjAAAVFjiz5SEPtKrfZxcQy0ip2jM4Y3gTpcrrhLzofWCmUlEeTxNTN
 qO0tcOGp4AC1k+8GxACz59q70ZOfwsBFK2kK2PESF3hxjR7Ga5oZZIOD37ziN+kDs7HFkOIN/iU
 1ustT+ix4CVrk
X-Received: by 2002:a1c:e2c3:: with SMTP id z186mr28841096wmg.70.1580731743557; 
 Mon, 03 Feb 2020 04:09:03 -0800 (PST)
X-Received: by 2002:a1c:e2c3:: with SMTP id z186mr28841054wmg.70.1580731743174; 
 Mon, 03 Feb 2020 04:09:03 -0800 (PST)
Received: from [192.168.1.35] (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id n3sm24580933wrs.8.2020.02.03.04.09.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2020 04:09:02 -0800 (PST)
Subject: Re: [PATCH] bcm2835_dma: Fix TD mode
To: Rene Stange <rsta2@o2online.de>
References: <5099495.CBsx362VbF@desktop2>
 <9d885f77-0bb2-2ab6-cf46-400a0bc2deb8@redhat.com>
 <2852675.bWBgnKVUkk@desktop2>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0882149e-b88d-80c9-0b2b-92b88f000cfc@redhat.com>
Date: Mon, 3 Feb 2020 13:09:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2852675.bWBgnKVUkk@desktop2>
Content-Language: en-US
X-MC-Unique: hFzCU-OSM7WcLRVLu-OE3A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yl04NoPSxqQw

Hi Rene,

On 1/27/20 12:20 PM, Rene Stange wrote:
> Hi Philippe,
>=20
> I'm running an example program for my Circle bare metal framework for the
> Raspberry Pi using the LittlevGL graphics library. It uses the TD DMA mod=
e to
> transfer pixel data to the screen buffer (10 lines at a time). Without th=
e
> given patch applied to QEMU only the first pixel line of each transfer is
> shown in TigerVNC viewer, after applying it, a solid image is shown.
>=20
> You can reproduce the problem on a 64-bit Linux machine as follows. The "=
sed"
> command modifies the example program, so that it doesn't try to access th=
e
> (not available) USB HCI controller of the Raspberry Pi 3.
>=20
> Regards,
>=20
> Rene
>=20
>=20
> cd
> mkdir dma-test
> cd dma-test/
> wget https://developer.arm.com/-/media/Files/downloads/gnu-a/8.3-2019.03/=
binrel/gcc-arm-8.3-2019.03-x86_64-aarch64-elf.tar.xz
> tar xJf gcc-arm-8.3-2019.03-x86_64-aarch64-elf.tar.xz
> git clone https://github.com/rsta2/circle.git
> cd circle
> git submodule update --init
> echo "AARCH =3D 64" > Config.mk
> echo "RASPPI =3D 3" >> Config.mk
> echo "PREFIX64 =3D ~/dma-test/gcc-arm-8.3-2019.03-x86_64-aarch64-elf/bin/=
aarch64-elf-" >> Config.mk
> ./makeall
> cd addon/littlevgl/
> make
> cd sample/
> sed -i -e "s/bOK =3D m_USBHCI/\/\/bOK =3D m_USBHCI/" kernel.cpp
> make
> qemu-system-aarch64 -M raspi3 -kernel kernel8.img
>=20
>=20
> On Monday, 27 January 2020, 09:29:59 CET, Philippe Mathieu-Daud=E9 <philm=
d@redhat.com> wrote:
>> Hi Rene,
>>
>> On 1/24/20 6:55 PM, Rene Stange wrote:
>>> TD (two dimensions) DMA mode did not work, because the xlen variable ha=
s
>>> not been re-initialized before each additional ylen run through in
>>> bcm2835_dma_update(). Furthermore ylen has to be increased by one after
>>> reading it from the TXFR_LEN register, because a value of zero has to
>>> result in one run through of the ylen loop. Both issues have been fixed=
.

So we have 2 fixes in 1 patch. I'd rather see 2 different commits:

1: Fix the ylen loop

-- >8 --
--- a/hw/dma/bcm2835_dma.c
+++ b/hw/dma/bcm2835_dma.c
@@ -70,14 +70,14 @@ static void bcm2835_dma_update(BCM2835DMAState *s,=20
unsigned c)
          ch->stride =3D ldl_le_phys(&s->dma_as, ch->conblk_ad + 16);
          ch->nextconbk =3D ldl_le_phys(&s->dma_as, ch->conblk_ad + 20);

+        ylen =3D 1;
          if (ch->ti & BCM2708_DMA_TDMODE) {
              /* 2D transfer mode */
-            ylen =3D (ch->txfr_len >> 16) & 0x3fff;
+            ylen +=3D (ch->txfr_len >> 16) & 0x3fff;
              xlen =3D ch->txfr_len & 0xffff;
              dst_stride =3D ch->stride >> 16;
              src_stride =3D ch->stride & 0xffff;
          } else {
-            ylen =3D 1;
              xlen =3D ch->txfr_len;
              dst_stride =3D 0;
              src_stride =3D 0;
---

2: re-initialized xlen:

-- >8 --
--- a/hw/dma/bcm2835_dma.c
+++ b/hw/dma/bcm2835_dma.c
@@ -54,7 +54,7 @@
  static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
  {
      BCM2835DMAChan *ch =3D &s->chan[c];
-    uint32_t data, xlen, ylen;
+    uint32_t data, xlen, xlen_td, ylen;
      int16_t dst_stride, src_stride;

      if (!(s->enable & (1 << c))) {
@@ -82,6 +82,7 @@ static void bcm2835_dma_update(BCM2835DMAState *s,=20
unsigned c)
              dst_stride =3D 0;
              src_stride =3D 0;
          }
+        xlen_td =3D xlen;

          while (ylen !=3D 0) {
              /* Normal transfer mode */
@@ -117,6 +118,7 @@ static void bcm2835_dma_update(BCM2835DMAState *s,=20
unsigned c)
              if (--ylen !=3D 0) {
                  ch->source_ad +=3D src_stride;
                  ch->dest_ad +=3D dst_stride;
+                xlen =3D xlen_td;
              }
          }
          ch->cs |=3D BCM2708_DMA_END;
---

What do you think? If this sounds good to you, do you mind sending a v2=20
with the 2 patches?

Thanks,

Phil.

>>
>> What were you running, how can we reproduce?
>>
>>>
>>> Signed-off-by: Rene Stange <rsta2@o2online.de>
>>> ---
>>>    hw/dma/bcm2835_dma.c | 9 +++++----
>>>    1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
>>> index 1e458d7fba..0881c9506e 100644
>>> --- a/hw/dma/bcm2835_dma.c
>>> +++ b/hw/dma/bcm2835_dma.c
>>> @@ -54,7 +54,7 @@
>>>    static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
>>>    {
>>>        BCM2835DMAChan *ch =3D &s->chan[c];
>>> -    uint32_t data, xlen, ylen;
>>> +    uint32_t data, xlen, xlen_td, ylen;
>>>        int16_t dst_stride, src_stride;
>>>   =20
>>>        if (!(s->enable & (1 << c))) {
>>> @@ -72,13 +72,13 @@ static void bcm2835_dma_update(BCM2835DMAState *s, =
unsigned c)
>>>   =20
>>>            if (ch->ti & BCM2708_DMA_TDMODE) {
>>>                /* 2D transfer mode */
>>> -            ylen =3D (ch->txfr_len >> 16) & 0x3fff;
>>> -            xlen =3D ch->txfr_len & 0xffff;
>>> +            ylen =3D ((ch->txfr_len >> 16) & 0x3fff) + 1;
>>> +            xlen_td =3D xlen =3D ch->txfr_len & 0xffff;
>>>                dst_stride =3D ch->stride >> 16;
>>>                src_stride =3D ch->stride & 0xffff;
>>>            } else {
>>>                ylen =3D 1;
>>> -            xlen =3D ch->txfr_len;
>>> +            xlen_td =3D xlen =3D ch->txfr_len;
>>>                dst_stride =3D 0;
>>>                src_stride =3D 0;
>>>            }
>>> @@ -117,6 +117,7 @@ static void bcm2835_dma_update(BCM2835DMAState *s, =
unsigned c)
>>>                if (--ylen !=3D 0) {
>>>                    ch->source_ad +=3D src_stride;
>>>                    ch->dest_ad +=3D dst_stride;
>>> +                xlen =3D xlen_td;
>>>                }
>>>            }
>>>            ch->cs |=3D BCM2708_DMA_END;
>>>
>>
>>
>=20
>=20
>=20

