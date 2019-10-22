Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp176278wrq;
        Tue, 22 Oct 2019 10:04:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyTxIcY5xG4LlFITcCD6fuUHQPO5gPJBD63iuZtYvlX1fviJ4vbpppqzbQ6ESRlQLGqbma5
X-Received: by 2002:a37:85c1:: with SMTP id h184mr3975450qkd.195.1571763873114;
        Tue, 22 Oct 2019 10:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571763873; cv=none;
        d=google.com; s=arc-20160816;
        b=DbfXLY6E6NB5ljTYLYlTVnVDpwdPLWZUBDMALsoBk77pl6LkXbdWh7S8rLBDEGKRg0
         Wj+2kRYRlapRIgI/w7ByXKYi82A8qFcHTIf1gjDqbmbdc7b1g7j0vGvcX1oWKtSKog5q
         Ok9C+zSm6I1XvCvbT7gl/qbEo/omMlWT0Et2D4A5F3umUFjPKBc1z8/gh0xTylri+jtu
         ZsbY0FWCqBPQkaj88tTGq25NOchWaYMXN4HSM/+Q7c3EyxojUFicHosSug+e+JcIOWB6
         z0Thc9UaYIeHSEiKNJ1ws4ZVgsVfJ3DfEHxdOvTzBJXcveIeHdAR2BHb7q6uYdu3cBRC
         2znw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3rbLX8hyHjXvC0RWsfQyJiuqcLKv+R/GgI5pEEIOve0=;
        b=ZatvKKSMxY6m9KBKH1dsbVO5bUR23eSdI1oZ+7tPUnU5WBDEG7sP5m5f0z4WGZEV/I
         cgenJYQOMVOl4AmCxchJKEcvHyGYrPRRBVMFHascx40ohDdR1dUoSIYrSLerZQO62BVS
         je/tEYpQFIkqeKKCDSyPv/0qeKFaPIWPUBErqT8d09G/1upF7sQ/n+xqFVYgLJKmqrku
         zelJ41i8MO2FTErPmHlSLiYMhSoU7Cq17ZdRmcDGWWG0JAPRmyFtiYOw/f+YQ57kLPsZ
         EtHVWiQPH6DBlxtL9OWC3QR/o5pgDhHwX2IOYIUzk9xQfqT8zMjmAOmqScxyGdiwahqp
         9Rgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yuhdHhHE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f91si4166173qtd.341.2019.10.22.10.04.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 10:04:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yuhdHhHE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMxaB-0005Su-PT
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 13:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43391)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMxMe-0005dV-3C
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:50:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMxMc-0002XF-83
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:50:31 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:37605)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMxMX-0002Uv-Ba
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:50:28 -0400
Received: by mail-il1-x144.google.com with SMTP id l12so16089672ilq.4
 for <qemu-arm@nongnu.org>; Tue, 22 Oct 2019 09:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3rbLX8hyHjXvC0RWsfQyJiuqcLKv+R/GgI5pEEIOve0=;
 b=yuhdHhHEonv2R7nvjZMd/z8YNvHQJ0qji0VX6sqJ27SUOcXuEWHub47WlFQXe9+gQw
 a7Ze5mc696/xXbY7XIHYYhAyT9eVWlxdmkE5QsTKs7yT3Pf2UpnEUVpmtDmQkdHLQ6Av
 O27SDyQ4XQtqb/n65RNtulQkpbpPTG+Lsvg5nTCBVPLtlfefuaOR4bXF8qr8WZl0YNpK
 q61dCUNLFJWMJSioX25i1aw9iU7hTw6czYWoBkZyv0IBDT+hxczWa1p9SEG5EXllFCBI
 l9TCm4yzshu436aP6WWAw5y/cprhoKkBD82/42gtEFasHimmTCXeQGGODpq/W8iwyG4B
 RsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3rbLX8hyHjXvC0RWsfQyJiuqcLKv+R/GgI5pEEIOve0=;
 b=BUSnt0qhiRWmL0iPpMG7j+39FpOVSOXPWeQGn7GD9cBpkFvAS691CeI/BGUW4hEwFw
 m5FQfjFIyo5Dh8BEUpr/hMBpWMLUUwP3t4FEG088bTH3Br2RYVWJy0tqtIKtcCrYq3Io
 Uzu6XJuia6e8wpOlTj+WQgYjL8JT1y/Bar8nQbvRoPlhqR5VdZWQbkrbwDtVbgigBR/y
 d/Zlh88ILs/G8E3poDCaYcLEPV5/ABmiYe2Xrx+HFNzuxWe5bzRVmgTdJw9Qzw7qSAAa
 FJHglroJcHgcgKSC9FyNYQht05Q1qEMXftiHr7ZnUuo7kXkRzftkxph3qhcvVg1PkJXs
 Waiw==
X-Gm-Message-State: APjAAAUfCIu4/p9K9fHgcGqlf1Lw1QnOOIxn55C6ysEpzQAbuLB/9MSP
 0n53i6vRhEmXgjFAhDRGauflu0xc7Oev1dbFV9ewOA==
X-Received: by 2002:a92:8dd9:: with SMTP id w86mr31836132ill.93.1571763024655; 
 Tue, 22 Oct 2019 09:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20191022162137.27161-1-marcandre.lureau@redhat.com>
 <20191022162137.27161-11-marcandre.lureau@redhat.com>
 <CAFEAcA-5DkdB-iUHBRONB0SHO6rYmU7ZzdojJd5iZbQdLHswTQ@mail.gmail.com>
 <CAMxuvaxTdPyODFAofKWURq8_zJNQtxiX7Xj8dogB1iFPqgbj4A@mail.gmail.com>
In-Reply-To: <CAMxuvaxTdPyODFAofKWURq8_zJNQtxiX7Xj8dogB1iFPqgbj4A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Oct 2019 17:50:13 +0100
Message-ID: <CAFEAcA_QEdzo2usdkfaJGsVjeLcSM1bxVN4APVWAUvcB7oj0zw@mail.gmail.com>
Subject: Re: [PATCH v2 10/28] serial: add "base" property
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::144
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rPSqp3w/TW1Q

On Tue, 22 Oct 2019 at 17:42, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> On Tue, Oct 22, 2019 at 6:32 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
> >
> > On Tue, 22 Oct 2019 at 17:23, Marc-Andr=C3=A9 Lureau
> > <marcandre.lureau@redhat.com> wrote:
> > Devices shouldn't have properties to set their MMIO base
> > address -- instead the memory-mapped serial device should
> > be a child of TYPE_SYSBUS_DEVICE, and should provide
> > a sysbus mmio region, which users of the device can
> > map at the address they want to map the registers.
>
>
> Can we make serial a sysbus device? It seems to be embedded from
> various places, in various buses. Not sure that makes sense, please
> advise me :)

You want the SerialMMState to be is-a sysbus-device, and to
has-a SerialState, I think.

> "base" is mostly needed to set qdev_set_legacy_instance_id(), I should
> have added a commit comment. Otherwise, it can be passed to
> serial_mm_connect() directly.

serial_mm_connect() shouldn't exist at all, though -- we
want to end up with a normal sysbus device whose users
create it and wire up its MMIO and IRQ in the same way they
do any other sysbus device.

thanks
-- PMM
