Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1189861lfp;
        Tue, 21 Jan 2020 00:21:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqxvWxjn0eDmKL9s4CBLIGnPSZKCYmQQJWp8nbr8bU4I32yDgAaf+jK8rImvtig3HUnXaXN0
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr3653290qvg.197.1579594863845;
        Tue, 21 Jan 2020 00:21:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579594863; cv=none;
        d=google.com; s=arc-20160816;
        b=vGnsY6iisgmEGvqPQvqzJwAsSzOPkkkyBG5c2BxBFBoo3xvEqbpD3vAbMZUf+jk+wD
         QkxTiZubjuHLZvUyczszHvGRWyzPLemYHpX5ZnaP3i7I7HCZg1y05G5QQWvkV1CtavKF
         nVDumIhWsVDH8Zbfp7Ya8+863DcMXfWzPb/Tzo8MDrVBZbltvOMTllWusLnvwow8glGP
         dOXCJxZgFfjdaXl9aIaFLU9ja7eSDNV4leLmbDlNWM7H67P6wwGQtxOROtAdp+kRbMFa
         EDlshxAbjcjqzKgFHP8v4dtH0D53sy60Nk4719uzT/HT3G/YRxvyWrO3NV2dteAi+Bzj
         0/2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=8PIFPLrHBMdR66uj8dlbraz5UoNwdSC5WoUJuxxA8ug=;
        b=qOOX4uyg85FaV7vNCh4TD1bgRMDPz6/rbPaHcrUaofmLG8jFK+LYVRZGITk8vSMH0A
         6ej0IPjRgo/utC6hN2rV0mkebK3zBhYJ1LoDPrFY5++lCCRqt2KmZ6/u0Pu+KYTajF4q
         7yLU8mTDiKjdJJeDzzcDxFFu75ZTxrrHckyzXL5lYOXMt7A2kNZ6Qbkx2B2i2a2Ej1wP
         a1SMDsfMMnz+8Ehwk5/3TN7EpxVa5Abh2C+fnhsBrT7MqgS8MB85Fi+iG0U4z0Uu3phm
         1g+NXruTqarqt5aCCsDbi6/TZMM0bMRM1By4l15CVCmMeTRL/pvxAVpDzJWAsIeflL3i
         o3ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bIZHYa83;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10si21698967qtt.348.2020.01.21.00.21.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 00:21:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bIZHYa83;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itomV-0002m6-3D
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 03:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51440)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itomJ-0002jb-3K
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 03:20:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itomD-0001Fw-OP
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 03:20:51 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56054
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itomD-0001Fi-LZ
 for qemu-arm@nongnu.org; Tue, 21 Jan 2020 03:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579594845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PIFPLrHBMdR66uj8dlbraz5UoNwdSC5WoUJuxxA8ug=;
 b=bIZHYa83diHU4wREiRb7s7plwqSnkwcIhTFHkZw6Td4qTHhfA68oAlWGGh8WF3j1dOBCHZ
 GwJjy9c2CYTE/gj3dqznRSDVCPhAqfCNu6aDczd2GUHwvmbKmayzFPVxGlTygJwUu2Ywnx
 ugHw47+2u4wlJVSDatCSiClhkprl4O8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-bNtClPrbMvGt_8aSMvbHIQ-1; Tue, 21 Jan 2020 03:20:42 -0500
Received: by mail-wr1-f72.google.com with SMTP id o6so960922wrp.8
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2020 00:20:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zoHOy6LOu+JPJzC1UGAAfYjgpK1PD26/QPFGHErBoeU=;
 b=YjeTzVfJQ1uBYwRnPt+ozFHcGRHQA8uH/2EB0TPYXpWuYShSChCkrtk/9Nql7LcJuy
 nu7vv5u25UVjOJ5odqBTAkqe3UgaTOPm4t72zX4mXNAQsAhDUw6EQJXooXsb1pxs/gJU
 nYIqN17zaHoziDMryg4pKooujszwI9TU9X10KgM5ayt77XuzhZi57oUHnPjlDjZjbybI
 F3mm581XH2O8VOUNUwsDN8p0F1flVFHuVkUcj5gi+7h5tKTKE2IFkIsd8ml87DHNG/7o
 WboJ7ZfiSf2bZMF3XqthwtJByhzmKEBftgZOexdFJgcMWrdU2QymZRtFFz+m2rGqAghN
 CPDg==
X-Gm-Message-State: APjAAAXFCD2XRYxPYHUyrhASgMlU+tjPB3SUhDEt/ifFZ4JyaozN/C1Z
 BsGKvm6Q8/SIDfWxgz0UaD42rAafVlWNVA4UgWloeEOMhjZqASWy6vswzO1XTlxrVOZH+vYrwNT
 cHL+ucB7e2b6U
X-Received: by 2002:a1c:4c5:: with SMTP id 188mr3059788wme.82.1579594840793;
 Tue, 21 Jan 2020 00:20:40 -0800 (PST)
X-Received: by 2002:a1c:4c5:: with SMTP id 188mr3059749wme.82.1579594840398;
 Tue, 21 Jan 2020 00:20:40 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id n187sm2922935wme.28.2020.01.21.00.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 00:20:39 -0800 (PST)
Subject: Re: [PATCH v4 4/7] python/qemu/machine: Allow to use other serial
 consoles than default
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200120235159.18510-1-f4bug@amsat.org>
 <20200120235159.18510-5-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6542670c-341f-b259-5705-a5374c5b722d@redhat.com>
Date: Tue, 21 Jan 2020 09:20:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200120235159.18510-5-f4bug@amsat.org>
Content-Language: en-US
X-MC-Unique: bNtClPrbMvGt_8aSMvbHIQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4klwu1f4RKII

On 1/21/20 12:51 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Currently the QEMU Python module limits the QEMUMachine class to
> use the first serial console.
>=20
> Some machines/guest might use another console than the first one as
> the 'boot console'. For example the Raspberry Pi uses the second
> (AUX) console.
>=20
> To be able to use the Nth console as default, we simply need to
> connect all the N - 1 consoles to the null chardev.
>=20
> Add an index argument, so we can use a specific serial console as
> default.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v2:
> - renamed 'console_index', added docstring (Cleber)
> - reworded description (pm215)
> ---
>   python/qemu/machine.py | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index 734efd8536..ef9f5b213f 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -241,6 +241,8 @@ class QEMUMachine(object):
>                            'chardev=3Dmon,mode=3Dcontrol'])
>           if self._machine is not None:
>               args.extend(['-machine', self._machine])
> +        for i in range(self._console_index):
> +            args.extend(['-serial', 'null'])

This patch is not sufficient, we have to initialize _console_index in=20
__init__():

-- >8 --
diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index ef9f5b213f..183d8f3d38 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -112,6 +112,7 @@ class QEMUMachine(object):
          self._sock_dir =3D sock_dir
          self._launched =3D False
          self._machine =3D None
+        self._console_index =3D 0
          self._console_set =3D False
          self._console_device_type =3D None
          self._console_address =3D None
---

Else for tests not calling self.set_console() we get:

  'QEMUMachine' object has no attribute '_console_index'

>           if self._console_set:
>               self._console_address =3D os.path.join(self._sock_dir,
>                                                    self._name + "-console=
.sock")
> @@ -527,7 +529,7 @@ class QEMUMachine(object):
>           """
>           self._machine =3D machine_type
>  =20
> -    def set_console(self, device_type=3DNone):
> +    def set_console(self, device_type=3DNone, console_index=3D0):
>           """
>           Sets the device type for a console device
>  =20
> @@ -548,9 +550,14 @@ class QEMUMachine(object):
>                               chardev:console" command line argument will
>                               be used instead, resorting to the machine's
>                               default device type.
> +        @param console_index: the index of the console device to use.
> +                              If not zero, the command line will create
> +                              'index - 1' consoles and connect them to
> +                              the 'null' backing character device.
>           """
>           self._console_set =3D True
>           self._console_device_type =3D device_type
> +        self._console_index =3D console_index
>  =20
>       @property
>       def console_socket(self):
>=20

