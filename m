Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp747044lfp;
        Thu, 13 Feb 2020 07:34:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyLgaEvizp5gO/UBJ4NZpVHTvte/1HJgMcbCE17KjXX5K1dpLmYNue6/Kq6A/iYFLtsUd7N
X-Received: by 2002:aed:2ac5:: with SMTP id t63mr23689285qtd.315.1581608061060;
        Thu, 13 Feb 2020 07:34:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581608061; cv=none;
        d=google.com; s=arc-20160816;
        b=1FUDn8VksOdi0rT5o2DJy2WvJaLaMjnUYe+yWAsHyVCVo5ITb0Ir3sB3Riqwtw7J7N
         bpNViVi+dnbC/xKFK/SYeaNJYD78uS67sDxgUzuqyAc5F9gQRsIan4lX7DV8GDapfs3s
         mKbIMsxS9BcxQRD4B6ocBssrn3YbB3S+/QGTuy2gzBUoJstkFP0v4YNoY1Sj7k8BcJWA
         7n9SToWURTQbnvKvp12kdh+8ypK/xrjrQobk7AFIrG//j2+FbJYC78aw2TtPl65duRJ6
         ykXixJl8CqRiJbCZ7KQ/ePkn2zZxHugP+eMP55qdZrX725yWfpJDubjiHtx9JBhAZMH0
         5Qpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GDWid6/iq8siU8ZHevmjU4sE5uKGLFLX3QyEuxy3bsw=;
        b=yBwDogh1noWzZU8yDsnO8Z2jI8QZV4rzEOPezPta1zU9PJgFyyY5f7PEwcjGRFMxM6
         19v/VZD/Q1wrLM53GsZiZQtMpZShR2jKA92s/UwHy6kQWAx+QTRAhKl2r93uRUlZs8d+
         xridFR4BnDU0bq07vkufRN8469omUmc2GvVWxiPVt6lqmA7GT+EBbbbF9fgBQC7cLMfN
         WYjkg9wb5D6iF/ghKReNZnHJFxDKryZ+QjM6IUOq6+3YaYqEuuRr3HOOpilCWCSBNJJx
         cCtuWMex8vTgYXxxGajKTH/0Vxd3Jkvlblt9/nwGOPe4G7eYRFabaaN3Ky/catNOOFTk
         j+cA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T9eg25rn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si1305064qta.62.2020.02.13.07.34.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 07:34:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T9eg25rn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2GVQ-0007Yr-Gw
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 10:34:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45671)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j2GV0-0007XS-Ah
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 10:33:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j2GUx-0006uW-TL
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 10:33:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32049
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j2GUx-0006p0-Pe
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 10:33:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581608027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GDWid6/iq8siU8ZHevmjU4sE5uKGLFLX3QyEuxy3bsw=;
 b=T9eg25rn3stouRthBz3gI7Qw2OdkJL+zx/p/PeBU2PI3WcNlurfRbu8XDgj5o2WKFKq92n
 +lJTq/4v0OaqrRA+3ZIgqP+rOiJfAxdw5ostuWROcThJlpX5qjzKc57O/FpXb7TJNbVhgw
 P+C0GbiJb+2V0JqgfEu/6lySDg2lEd8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-Ns1QpATzMSS4KoxeSDZ42g-1; Thu, 13 Feb 2020 10:33:40 -0500
Received: by mail-wr1-f69.google.com with SMTP id d8so2464170wrq.12
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2020 07:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lnyI72nC5aJyDHvLxnHY68BclaJOoav9SKihz+lhs3s=;
 b=o4XrEiLrECHO5kYoJepIjBMQZ/RTF4TaOnKBUudypXEg/S9eVSVyycsCx9KZxMZ4Zz
 Ie+QTf2gdLO1a/+eX7AqIWwrBLxteEJoPYnAIOPxBcJfSYn9eZEvLfz334hIArMCvQsM
 6/FwbXdK/r1kh3UBJud0FjtaNBnBKeU/TZ8SVFnWKoY9pO7H/4V26aNm1AUI5LvGnWyb
 aFSfzdFUPws4MTz0FWeRmrA+IGcaNMScd05B2fbjyKPJZiw4A9NEblFi04C3bSpyMI8W
 Xzcj6H4/M+wx8KCjI9B5ajKt8MQypPGoXTx1I7v5U95+kn+Uv6oLaTXxG60/U1T2c/Fg
 bkIw==
X-Gm-Message-State: APjAAAVPl8KvvbmzWa4BISfClB8jUqL8/3gsImF7aWkewmLGBSlo8eE1
 Aq+yixepUvwJWz41SpCV3BKf9A1MSsDYTyqqsXGpdhHjVIhNYTER3OcFTyVTAEBq7lk8qMxpKI5
 I1h09OcAKB47U
X-Received: by 2002:adf:fe50:: with SMTP id m16mr23495892wrs.217.1581608019535; 
 Thu, 13 Feb 2020 07:33:39 -0800 (PST)
X-Received: by 2002:adf:fe50:: with SMTP id m16mr23495868wrs.217.1581608019289; 
 Thu, 13 Feb 2020 07:33:39 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id t128sm3618227wmf.28.2020.02.13.07.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 07:33:38 -0800 (PST)
Subject: Re: [PATCH v3 12/13] hw/arm/raspi: Use a unique
 raspi_machine_class_init() method
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
 <20200208165645.15657-13-f4bug@amsat.org>
 <CAFEAcA8e4NqwKPM6qx=vKm6NOz__=S90trhUuhaSNe_yJ8GeXg@mail.gmail.com>
 <0d72fad3-3eef-66ff-2162-f0c07ba01ff2@redhat.com>
 <CAFEAcA9x6=Hxqwjacc3ZXUJy1P0xxKt-oqiZf1Fm=f1d8f63xQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d3e9caeb-345c-4596-eff1-059a8cc94a8e@redhat.com>
Date: Thu, 13 Feb 2020 16:33:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9x6=Hxqwjacc3ZXUJy1P0xxKt-oqiZf1Fm=f1d8f63xQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: Ns1QpATzMSS4KoxeSDZ42g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sCCaJxig5uZB

On 2/13/20 3:32 PM, Peter Maydell wrote:
> On Thu, 13 Feb 2020 at 14:16, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>> On 2/13/20 2:59 PM, Peter Maydell wrote:
>>> The natural way to implement this is to have the .class_data
>>> be a pointer to a struct which is in an array and defines
>>> relevant per-class stuff, the same way we do in
>>> bcm2836_register_types(). That way the struct can indicate
>>> both the board revision number and also "is this a legacy
>>> board that needs transaction-failures disabled?".
>>
>> IIUC Igor insists explaining that he doesn't accept anymore a
>> ".class_data pointer to a struct which is in an array and defines
>> relevant per-class stuff" and we should not use this pattern anymore.
>=20
> Huh? How else would you do this? I'm kinda dubious about the
> pattern this patch series uses of just stuffing a 32-bit board
> ID number into the class_data field, to be honest -- I let that
> pass partly not to hold up the series but partly because I
> expect that we'll need to turn it back into a proper pointer
> to a data struct soonish.

https://www.mail-archive.com/qemu-devel@nongnu.org/msg678305.html

Igor> we sometimes use .class_data when creating many
       derived types (typical example CPU types (x86))
       where it's impractical to code leaf class_init
       functions. I'd use .class_data in cases where I
       can't get away with explicit .class_init

Which I understand as:

- avoid .class_data (pointers to structures)
- explicitly set ObjectClass::fields in .class_init()
   by open-coding all.

