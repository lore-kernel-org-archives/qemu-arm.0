Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3902441lff;
        Sun, 15 Dec 2019 16:17:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqyzDZraf+OX4l3rkeGjODW/6cUSSf0VIzFxboO28B6AR/QZ96cWeaZHUZMxQ5TKkWVHOzFo
X-Received: by 2002:a9d:22:: with SMTP id 31mr27636769ota.173.1576455472565;
        Sun, 15 Dec 2019 16:17:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576455472; cv=none;
        d=google.com; s=arc-20160816;
        b=eBL2VTV2X3ujijj5HUQfFZZ0p6BGJ8GCBbMmfwyvNGR7ywqNryK0RmZT3puKzQgTOL
         XtxWe6AsyMg0rc5HG5SgCxuqlQw9jml5adQj8YMge5VzL5fK8aXi2g5CeYsHZOmLYR80
         LH37tYXP74E/SU72c2r8KCCwpNPvQ6xMKYu19G0jxmnmLVhNscn94YyWp5wscOxEOLsw
         /4Vy+sbp64H+JGSHEU3PibuLl87Mgh9Efw4QTKJKF+vQifRH6hyRCOyClUHZCDLM1gyj
         spokNBZoU5KgaVe6hhJtxl+U+Kb/3x3hwkSlieTOfSaRBebODfXxhJJhOsj5HItktl4o
         knOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QWhUBUeBgK04x4i3sIhcg+DM1+J6iHEFt5qdOjm9s60=;
        b=PjP04TBxEoSyEDKeZzkSK0uBuIKeJIm+te/0lspGk8L6gVSehdPBlAbT2L9xQx/wNK
         Yums8ZLw57bwseW84Xdmr2ADvNHKubJZgSwDDTRMgLD//9cc0MrdWHPxalEFcRJ87Q+b
         LItbYZy074oHl+a390casLUykO/Nc/TG9tqC9/6cZqzWwIcudqrLsiejrbvbK6WXmBjn
         nQLf0t1X7hZUBFeLwxisTuIWbq/WW9vHSEOOagKgt+UZEz4sLMgkytwnSAbl7fcMwvmh
         FMDAxQyCiL/6fIvhgIIMak+BB2V0Tus7O5lm5qyNE1iGeFje2p55pApWpdHKU9cfvYNR
         aTjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aY8eaFaS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17si9532948oiw.238.2019.12.15.16.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 16:17:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aY8eaFaS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ige59-0004sU-Kh
	for alex.bennee@linaro.org; Sun, 15 Dec 2019 19:17:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56835)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ige4y-0004rg-At
 for qemu-arm@nongnu.org; Sun, 15 Dec 2019 19:17:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ige4x-0006Aq-7R
 for qemu-arm@nongnu.org; Sun, 15 Dec 2019 19:17:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51985
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ige4x-00066z-4P
 for qemu-arm@nongnu.org; Sun, 15 Dec 2019 19:17:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576455458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWhUBUeBgK04x4i3sIhcg+DM1+J6iHEFt5qdOjm9s60=;
 b=aY8eaFaSVfU3QWlTi91gxUXu0MKDDMjCOy+w1ddOvVm3ceDwnaGooOSVSMJrmFYKX2JPvc
 TYG/U21xz+kiFvyK86QKvR3Oq9gmbrAK9omNSd59emIgXBUwHm7u/9+dxztpaWNfpCBfWe
 o/eqJMuJQ3U9MFX/52J30UYOpIyPMCU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-GHd6BL2zPYGf05p9ogYWQA-1; Sun, 15 Dec 2019 19:17:35 -0500
Received: by mail-wr1-f69.google.com with SMTP id w6so2787453wrm.16
 for <qemu-arm@nongnu.org>; Sun, 15 Dec 2019 16:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1e9AidJmNHbOJw5LwOfFSsNm7euHiS3mPs7opbkr410=;
 b=YSbP3SVsi05kSUhXr0qfK9pGJr3hkj5RAXTEDZielbqa4YLZXtS4s7lUWxs74czWEu
 QO511HeVah2tC0S3KAZ3R2gzw742B5stZk3LACYAWcMDB1S9kANpWpLYNUgaDMpXqSoC
 +KNJ0QX0fIll3ZMdkbCyanwUtYA265gOxRgWMTJrFJIvR+r9LMk5HuYK83NlrElHftJC
 wQBE9ztfwlVRDIowTWBuwCo6vKH01/cltnADLtkm9k5DfLKZW6OzpEyu30WXu06LEcuJ
 wDE6Mwb19pOQfxy5EnJY5GK4e5vYj4Ht2Na3tXdkjhCbMRHEt0oAYW5GX47cJeYkIbkm
 iBLg==
X-Gm-Message-State: APjAAAURiVpjoxWy/72es7J/8YsAmT1dZReD+2ZvFH6AB6iw2ipBEF1X
 8aUdhwJcXHh18qiRuTTYFdfWf5LUfkhXVdMWL0cgWFV83uuX2algjn5Ghc4sY2s6aTew/P0pvlv
 m2iyLDHWhm12o
X-Received: by 2002:a1c:5419:: with SMTP id i25mr27618575wmb.150.1576455454055; 
 Sun, 15 Dec 2019 16:17:34 -0800 (PST)
X-Received: by 2002:a1c:5419:: with SMTP id i25mr27618559wmb.150.1576455453818; 
 Sun, 15 Dec 2019 16:17:33 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id e12sm19457469wrn.56.2019.12.15.16.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Dec 2019 16:17:33 -0800 (PST)
Subject: Re: [PATCH 05/10] arm: allwinner-h3: add System Control module
To: Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-6-nieklinnenbank@gmail.com>
 <949aec5f-fd92-9fb2-25f4-803cd1bbf601@redhat.com>
 <CAPan3WpC2AiSGJsMmbQgJkucEDRg_os418rY_B6B8b8D2WM31A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <25c838e3-af9a-d742-6946-056c431a8805@redhat.com>
Date: Mon, 16 Dec 2019 01:17:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPan3WpC2AiSGJsMmbQgJkucEDRg_os418rY_B6B8b8D2WM31A@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: GHd6BL2zPYGf05p9ogYWQA-1
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
X-TUID: VNKAeNfINXaA

On 12/16/19 12:27 AM, Niek Linnenbank wrote:
> On Fri, Dec 13, 2019 at 1:09 AM Philippe Mathieu-Daud=C3=A9=20
> <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
>=20
>     On 12/2/19 10:09 PM, Niek Linnenbank wrote:
[...]
>      > +static const MemoryRegionOps allwinner_h3_syscon_ops =3D {
>      > +=C2=A0 =C2=A0 .read =3D allwinner_h3_syscon_read,
>      > +=C2=A0 =C2=A0 .write =3D allwinner_h3_syscon_write,
>      > +=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,
>      > +=C2=A0 =C2=A0 .valid =3D {
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4,
>=20
>     Can you point me to the datasheet page that says this region is
>     restricted to 32-bit accesses? Maybe you want .valid -> .impl instead=
?
>=20
> Hehe well here I can only give the same answer as for the SD/MMC driver:=
=20
> the datasheet
> only provides the base address and register offsets, but nothing=20
> explicitely mentioned about alignment.
> I do see that also for this device the registers are 32-bit aligned.
>=20
> Does that mean I should change MemoryRegionOps to . impl instead?

No, keep them, but add ".impl.min_access_size =3D 4" (see answer to SD/MMC=
=20
model patch).

