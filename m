Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2256551ejf;
        Mon, 26 Feb 2024 11:21:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUJu5wei3YAG3ehsi4ZgO4DYAmoasA29i8iN9lPvxeeAmyU94K8ZaVu1Kvs7AxmkSsZevQOxd2QXvtYbxgXrFtotqJHgnpx
X-Google-Smtp-Source: AGHT+IF899QK6gwVqUc8MjpaRJPoJ6x5tlLIbsVNBJEfqo+YthbL3LKZqWWtY8QT0PWSSsZrIpQW
X-Received: by 2002:a05:620a:5592:b0:787:22a5:99d3 with SMTP id vq18-20020a05620a559200b0078722a599d3mr11584qkn.78.1708975319292;
        Mon, 26 Feb 2024 11:21:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708975319; cv=none;
        d=google.com; s=arc-20160816;
        b=Th2RcAOuAoaEu5ENEYyIM3FnVpSZffa2BgU3NSAABNwNZA7soRkJ6DrGhDoO9PyOy9
         0IKh0oHJJkOeIrslnAA53KPgcJRFEGdLis3YlZtqm4YOuwNHATyY0IGti1RnT5cYztoI
         368S/nSDzvleSvMy0ibCmm0j8h6bD7AJeGc9WYH7n87wL3Z43zRlGv7MuLS/6xThBZxV
         T3gsnD3nYLlHmV3Cd+hCS0/W0hps4TU7ktwnPDm0fJycrjeTJwBoHv4t8zqM/T+W31vk
         qgMY5rXy4iQDkuz4HAGksoBs0dea/mYTSOPrVF6CrEJ0Oawdjdu+2NVJU9CMgLmN0aFt
         eWXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:thread-index:thread-topic
         :content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:dkim-signature:dkim-filter;
        bh=4uvaVrQNANaeOAQL9gbBxiiGQLnwiZu+4kYwOUO39Sk=;
        fh=7MyzgaXMkpkPNBrrlx8I9qAuaV2BdTnxcHrZcLEQ8Fg=;
        b=VtN2F0INdH39FMhBbsLzf2QkmfCDhgAsFP0MXe9ooO6JonB/5Q0/qB7DGZ2vPIGlm9
         M5GL5y34UU26o0mZAPXwZT+OVQulgKYV86w9dVFzhj6URdfpkcXqQv9CqXryGfpDTwqv
         iCWoeQurG4e/gXBCmJPe+RlV7s7EW+pRTwc/LaUGSSDONJWlL/BbI2OKQm9rp67UDw1K
         HBtzKLFKlhYYvX8zYp6DJU5hVSPvvm0e1yhxprCJUmzWX4dInlGIQy8MK7x5yb0a5fsq
         zP36E6VYfZZrnsDdC9MphUrjd/6dC2/kahPPnmoPANlOyrcAZ3V4LQT+CY0sejQ8j64R
         Ry+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=OEA7pxfP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wi12-20020a05620a570c00b00787b3fdbbcasi5674910qkn.446.2024.02.26.11.21.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 11:21:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=OEA7pxfP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1regXu-0003bB-BM; Mon, 26 Feb 2024 14:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aminier-21@enst.fr>)
 id 1regXs-0003ae-T7; Mon, 26 Feb 2024 14:21:48 -0500
Received: from zproxy3.enst.fr ([2001:660:330f:2::de])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aminier-21@enst.fr>)
 id 1regXk-0007Wn-I9; Mon, 26 Feb 2024 14:21:48 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id E0E0EA05AE;
 Mon, 26 Feb 2024 20:21:34 +0100 (CET)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id APJCoxjSUhGu; Mon, 26 Feb 2024 20:21:34 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 4C7A7A05B0;
 Mon, 26 Feb 2024 20:21:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr 4C7A7A05B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1708975294;
 bh=4uvaVrQNANaeOAQL9gbBxiiGQLnwiZu+4kYwOUO39Sk=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=OEA7pxfPbjqSWKagmJ3TmnTd78XwMsW6F4L1A2erzDoJr4jAvmMq+SZ1a6U1TQmyY
 qc0qkcJfuOP3ND+r7X9SYpaKJgWCM7f9icfGAdGeiNXNY7C7VYFsXdu19ZPD2d0RED
 wGd/NRxNYw36yMJNsvsLDYfr+GwsaBfxTng/741c=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id abmwjfA8ol8x; Mon, 26 Feb 2024 20:21:34 +0100 (CET)
Received: from zmail-tp1.enst.fr (zmail-tp1.enst.fr [137.194.2.198])
 by zproxy3.enst.fr (Postfix) with ESMTP id F10DFA05AE;
 Mon, 26 Feb 2024 20:21:33 +0100 (CET)
Date: Mon, 26 Feb 2024 20:21:33 +0100 (CET)
From: Arnaud Minier <arnaud.minier@telecom-paris.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, 
 =?utf-8?B?SW7DqHM=?= Varhol <ines.varhol@telecom-paris.fr>, 
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, 
 qemu-arm <qemu-arm@nongnu.org>, 
 Alistair Francis <alistair@alistair23.me>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Message-ID: <1459219120.11729362.1708975293687.JavaMail.zimbra@enst.fr>
In-Reply-To: <CAFEAcA_LZ6oGj_y+_9zKDZNVSk8zOb4hQG+OKETXyE3-ezP_Rg@mail.gmail.com>
References: <20240219200908.49551-1-arnaud.minier@telecom-paris.fr>
 <20240219200908.49551-2-arnaud.minier@telecom-paris.fr>
 <CAFEAcA_LZ6oGj_y+_9zKDZNVSk8zOb4hQG+OKETXyE3-ezP_Rg@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] Implement STM32L4x5_RCC skeleton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [::ffff:46.193.4.103]
X-Mailer: Zimbra 9.0.0_GA_4583 (ZimbraWebClient - FF122 (Linux)/9.0.0_GA_4583)
Thread-Topic: Implement STM32L4x5_RCC skeleton
Thread-Index: XLP3jqda8KuviLRcHjsyCVLUd/7+yw==
Received-SPF: pass client-ip=2001:660:330f:2::de;
 envelope-from=aminier-21@enst.fr; helo=zproxy3.enst.fr
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: X7zDiE6oogYk

Thanks Peter for the review,

----- Original Message -----
> From: "Peter Maydell"=20
> To: "Arnaud Minier"=20
> Cc: "qemu-devel" , "Thomas Huth" , "Laurent Vivier" , "In=C3=A8s
> Varhol" , "Samuel Tardieu" , "qemu-arm"
> , "Alistair Francis" , "Paolo Bonzini" , "Alistair
> Francis"=20
> Sent: Friday, February 23, 2024 3:26:46 PM
> Subject: Re: [PATCH v5 1/8] Implement STM32L4x5_RCC skeleton

> On Mon, 19 Feb 2024 at 20:11, Arnaud Minier
>  wrote:
>>
>> Add the necessary files to add a simple RCC implementation with just
>> reads from and writes to registers. Also instanciate the RCC in the
>=20
> "instantiate"

Fixed.

>=20
>> STM32L4x5_SoC. It is needed for accurate emulation of all the SoC
>> clocks and timers.
>>
>> Signed-off-by: Arnaud Minier=20
>> Signed-off-by: In=C3=A8s Varhol=20
>> Acked-by: Alistair Francis=20
>> ---
>=20
>=20
>=20
>> +static const MemoryRegionOps stm32l4x5_rcc_ops =3D {
>> +    .read =3D stm32l4x5_rcc_read,
>> +    .write =3D stm32l4x5_rcc_write,
>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>> +    .valid =3D {
>> +        .max_access_size =3D 4,
>> +        .unaligned =3D false
>> +    },
>> +};
>=20
> What's the .valid.min_access_size ?
> Do we need to set the .impl max/min access size here too ?

I honestly don't really understand the differences between .valid and .impl=
.
However, since all the code assumes that 4-byte accesses are made,
I think we can set all these values to 4 for now.

>=20
>=20
>> +
>> +static const ClockPortInitArray stm32l4x5_rcc_clocks =3D {
>> +    QDEV_CLOCK_IN(Stm32l4x5RccState, hsi16_rc, NULL, 0),
>> +    QDEV_CLOCK_IN(Stm32l4x5RccState, msi_rc, NULL, 0),
>> +    QDEV_CLOCK_IN(Stm32l4x5RccState, hse, NULL, 0),
>> +    QDEV_CLOCK_IN(Stm32l4x5RccState, lsi_rc, NULL, 0),
>> +    QDEV_CLOCK_IN(Stm32l4x5RccState, lse_crystal, NULL, 0),
>> +    QDEV_CLOCK_IN(Stm32l4x5RccState, sai1_extclk, NULL, 0),
>> +    QDEV_CLOCK_IN(Stm32l4x5RccState, sai2_extclk, NULL, 0),
>> +    QDEV_CLOCK_END
>> +};
>=20
> These are input clocks, so they each need a VMSTATE_CLOCK()
> line in the VMStateDescription. (I think only input clocks
> need to be migrated.)

Sure, will add these in the VMStateDescription.

>=20
>> +
>> +
>> +static void stm32l4x5_rcc_init(Object *obj)
>> +{
>> +    Stm32l4x5RccState *s =3D STM32L4X5_RCC(obj);
>> +
>> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
>> +
>> +    memory_region_init_io(&s->mmio, obj, &stm32l4x5_rcc_ops, s,
>> +                          TYPE_STM32L4X5_RCC, 0x400);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
>> +
>> +    qdev_init_clocks(DEVICE(s), stm32l4x5_rcc_clocks);
>> +
>> +    s->gnd =3D clock_new(obj, "gnd");
>> +}
>=20
> Otherwise
> Reviewed-by: Peter Maydell=20
>=20
> thanks
> -- PMM
