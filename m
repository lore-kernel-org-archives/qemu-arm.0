Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3003782wrs;
        Mon, 19 Aug 2019 11:26:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwTn/9/lVZSdo4UrYIZZ10fRp30lLtAhE9N0Wf39KWdJ4GZlZxUkG+chS/c0EgxQOcmYpFP
X-Received: by 2002:a50:f4b6:: with SMTP id s51mr27023834edm.204.1566239213932;
        Mon, 19 Aug 2019 11:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566239213; cv=none;
        d=google.com; s=arc-20160816;
        b=Ane5QMYzMvX46z/OiWpeNM0lZf1/QGQI2/cOBlcQ+uL2Qtj3u/PJqBvLsj55AJOXqQ
         EzAtgW8I+pyJdUmTE/ISN1HTbblw15Z1PrKN9r11xx7i/9x8hXLeysORKM2OUtcNQlPO
         oXlJIEExU4O1Dqek+pzybEKA0K95sYWwJ+YBHu/1Rn9Hc/si1ilem68beQFA9gwp9PdV
         y0spDYlSHHyCrn/xRF9ahX8Ilg2Go5iZItlrRXB8iaAt1jfpTgOERquO54Sgz9SgU3Ub
         Nj7YbSvO/xLJsEe573hvxJ6f7pjTu6upQ/J0dASrogh82PC6S8iG+ktUt8fRIvn5SZPB
         U0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=JR4bpAGpwBYCF+LWdDioSt751eLbZbnVvLcGoVLM9Ak=;
        b=MieZ75gZ6S9zEmLMoTgZARTm9zrrM/ff+7DYd1Ay3v9NWuzJ/x7oKhm6fpWyN5fkgq
         j6L8iqfhj17BAwxHsSluF91W+JjtEHvKWmUGAGNGZUL+/1U5znP/RD1nJZj9ek8XeJWQ
         4exFyAO+0Mo13hQvw279/oYi5q1BJJGjIiAAeXT+hTvrBhXPoHzvaU6rMkdZ3zmjq+OX
         0EZTOy6xo6rEQEFiGGZ4fG5fLiKGNbj2FbsZaVLCED6O/f5mxwMweTAX5MJYe6rz04DM
         h1oCZEsrgXlKFpsNx/aEk1mGa5a9tWAe8g7h499fUitGsuy7KCN89llD5hyJNa709oI2
         wJoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19si3376059edd.148.2019.08.19.11.26.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 11:26:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzmMm-0000WN-JK
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 14:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56890)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1hzmMa-0000VR-Qc
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 14:26:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hzmMZ-0004Z5-Jx
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 14:26:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39800)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hzmMZ-0004Ye-CH
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 14:26:39 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4DACE3C916
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 18:26:38 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id a17so5644392wrr.10
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 11:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Es2ujF4TQs/L1dGPbqNiort7s9yCy3mx7V8CuxWsAc=;
 b=SxD6CsWSvVIn2x6a2qEvOjE2p4vBrS7FADMb1GUiHG0ioatN5yanxA+LWID9SqznoV
 HC4axpc/kzqcKq4QF6HEBn3ZB1L29DjJ32XUmI//6fES5M94rNYwhCkT+XvyBPJJFdnh
 ZcevoUEgimJW2w6U+EakeISu4GpLdcUPNvGDUs6oza1AfaN+2hWqN26kRvEwx8ImRAdz
 fIfySFw2UUi+EJOIdC1B/WfSzhUyTUcj7ZhInJYPW2yu0ACkSc6Xr1kOjeolF8i/U+/P
 F7fNlhDHUi9OdHyTkuYAWXrRX7YbOMGtCnRXW+gHpgtgvYxoG1fSoIfJG1rziSkpZo27
 zdkw==
X-Gm-Message-State: APjAAAWHnC8V3teMeaiCfvyY+5lVJC+Lpkv3xQYmOPHilwHHyeN4kUsc
 zI+ZsCGU58aMv7T+6NOpml05UfOGFA6l3jhla+UQVkPOmm7DFgi8HYBTfa4JMjQm9brVyCusNfU
 BEuEzcEiTQ6CH
X-Received: by 2002:adf:dd88:: with SMTP id x8mr30951667wrl.331.1566239196752; 
 Mon, 19 Aug 2019 11:26:36 -0700 (PDT)
X-Received: by 2002:adf:dd88:: with SMTP id x8mr30951570wrl.331.1566239196446; 
 Mon, 19 Aug 2019 11:26:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:399c:411e:1ccb:f240?
 ([2001:b07:6468:f312:399c:411e:1ccb:f240])
 by smtp.gmail.com with ESMTPSA id k124sm36671949wmk.47.2019.08.19.11.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2019 11:26:35 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565940884636.2215@bt.com> <989277a4-7f07-aaaf-f963-ee769e0efd00@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <1ac89581-d52a-cdce-3c5a-786d4cb0d9c1@redhat.com>
Date: Mon, 19 Aug 2019 20:26:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <989277a4-7f07-aaaf-f963-ee769e0efd00@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 25/42] hw/misc: Declare
 device little or big endian
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, sagark@eecs.berkeley.edu, mst@redhat.com,
 green@moxielogic.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, kraxel@redhat.com, claudio.fontana@suse.com,
 mreitz@redhat.com, pburton@wavecomp.com, marex@denx.de, robh@kernel.org,
 hare@suse.com, gxt@mprc.pku.edu.cn, berto@igalia.com, proljc@gmail.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 david@redhat.com, magnus.damm@gmail.com, yuval.shaia@oracle.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, hpoussin@reactos.org,
 joel@jms.id.au, marcel.apfelbaum@gmail.com, anthony.perard@citrix.com,
 marcandre.lureau@redhat.com, david@gibson.dropbear.id.au, balrogg@gmail.com,
 jasowang@redhat.com, atar4qemu@gmail.com, antonynpavlov@gmail.com,
 jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org, jcd@tribudubois.net,
 sw@weilnetz.de, alistair@alistair23.me, chouteau@adacore.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 sstabellini@kernel.org, jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 imammedo@redhat.com, xen-devel@lists.xenproject.org, shorne@gmail.com,
 andrew.smirnov@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, xiaoguangrong.eric@gmail.com,
 qemu-riscv@nongnu.org, andrew@aj.id.au, lersek@redhat.com, crwulff@gmail.com,
 laurent@vivier.eu, Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com,
 i.mitsyanko@gmail.com, michael@walle.cc, paul.durrant@citrix.com,
 qemu-ppc@nongnu.org, huth@tuxfamily.org, amarkovic@wavecomp.com,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, peter.chubb@nicta.com.au,
 aurelien@aurel32.net, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q/E0CHy0pZE7

On 16/08/19 12:04, Philippe Mathieu-Daud=C3=A9 wrote:
>> diff --git a/hw/misc/a9scu.c b/hw/misc/a9scu.c
>> index 4307f00..3de8cd3 100644
>> --- a/hw/misc/a9scu.c
>> +++ b/hw/misc/a9scu.c
>> @@ -94,7 +94,7 @@ static void a9_scu_write(void *opaque, hwaddr offset=
,
>> =C2=A0static const MemoryRegionOps a9_scu_ops =3D {
>> =C2=A0 =C2=A0 =C2=A0.read =3D a9_scu_read,
>> =C2=A0 =C2=A0 =C2=A0.write =3D a9_scu_write,
>> - =C2=A0 =C2=A0.endianness =3D DEVICE_NATIVE_ENDIAN,
>> + =C2=A0 =C2=A0.endianness =3D DEVICE_LITTLE_ENDIAN,
> Uh, I doubt that.
>=20

... why? :)

Remember that BE32 and BE8 ARM OSes still are "natively" little-endian.

Paolo
