Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4586065wrt;
        Tue, 8 Jan 2019 05:23:18 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4jJ/sc5ahUQnNr9KSkcr80K5yW51aBplmo0AFPfuilNJod3mgnvcMdP+R6yyurkwE6R23T
X-Received: by 2002:a1c:5a42:: with SMTP id o63mr1757026wmb.88.1546953798588;
        Tue, 08 Jan 2019 05:23:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546953798; cv=none;
        d=google.com; s=arc-20160816;
        b=cfvP+uwSvGOHxNc/Jrllkmbgz7rCNDXMXAXn6DaRQ6gM50fXGKSFaAG9cRbbFzwcx6
         Yw+s4XyzhM54vsyFSG11Xr3JkiSJURhnv5bYSOByyl1bLGsUAzwtTMT58/+QMrn/RqvJ
         6+JpHcDAe7zDh8abSZ7QaerG++QFl3MLeIr6HU2LWbVviyenm1ehXbe5QMnYzX0dpY1l
         9OYVQ5RlJemsA+mDNUMjvYfHBNbtIIWnRxj6SEHirvwCcYnNwx4sAYCml/FQt3/FAsH5
         tFZEa0zOx5XOjss7eraik0NKnf3OBekDCztULhQCtvMbBSh2gN7i6T38GukTdOZYfVfN
         5lMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=bofire7/xHks2EZMYKMdibkkwF2jW7AZhfV45yHoP9w=;
        b=ZGogFzRAbVKPMWK8GkZHzwi6ApeObLqiN3SFZ+Caf61pjcgHypeuaNQ+Q0mszi1Tjb
         L8JKJU1NpzFRo3+KV6kQBtOpAUnuJrZWLQNCbEMlksdl9/2o3XXgOExLjz7k1gqj9O36
         sI9Q5HNBYEOxUv8X0Dcv9bi29H5p1GozDVMcNp/k0HBKNUNNx0ZFhhjZdFj2WP109EJ7
         6eIsMpnf47qgEmBOADwLQ8QIj9KefS5LShkMgc05/6Ly3P9sR3vOsnuwGPH/bPOUQU2f
         ZHOHPq0gXMIzNfXktjUFg/muYjNG+rx3fLXeAygKYjwAHayk1IuNK1NILH/CId42Sh8I
         vvvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="HELfx/g2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si6856952wmk.68.2019.01.08.05.23.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Jan 2019 05:23:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="HELfx/g2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:32849 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggrLe-0000Nm-1j
	for alex.bennee@linaro.org; Tue, 08 Jan 2019 08:23:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ggrLR-0000Mu-9v
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 08:23:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ggrLQ-00029O-HJ
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 08:23:01 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43047)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1ggrLJ-0001UU-12; Tue, 08 Jan 2019 08:22:53 -0500
Received: by mail-wr1-x444.google.com with SMTP id r10so3998793wrs.10;
	Tue, 08 Jan 2019 05:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bofire7/xHks2EZMYKMdibkkwF2jW7AZhfV45yHoP9w=;
	b=HELfx/g2sIEjyJuLbCvOoUwfWML0uMMWKVJeGIxYb/MfHFr/rnlHMhqVsLRZvfvWan
	MVWSBxJC2NboJsdgnFzU7Cv7F6oZwxMNd4/HvyTEtKxiuaOmIFT1kfnm9/RkwxwqBWwf
	LRtQF6uUXNigXPuiJv2J4R9itUSRxaRzdbRzLVOaGdpCK/qfKlBnbxLSJioHgREPUkgx
	tnt87VeJ5oDq9l9jxdpJDhFl3CRMQMSv7SmRuw2lko2VfHgUOSZNFUgbFzhXusrondIi
	2/pgoc4mF7OE5ZzC0Y4C8IDlRJsd/gsNg+mgCLr1o4mGHBV/Kkt+NKVp9g7cfzTBYjBZ
	Opvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bofire7/xHks2EZMYKMdibkkwF2jW7AZhfV45yHoP9w=;
	b=bfHQCmkBd+mPj+yq+4tVMGV6E8hF0ATfyqbs1hso1TK30xRbBRDIkZRWs5729qaVCW
	HUWgPLSPoB+nNwt+UNk9ia5bdY+ZQkhRk2tDpix0wXDlUHI2HRUarrtNnvYACnnxaT4d
	7/qTaXHI15qs5Rvl6dm2kSE2QNE06GmeuGB0+OLkVoCuCwSWxm/K3W9gRoUEMjDSClkj
	TOCAaSm16RGtl7+4UiC5yToBu9s5jeVYGmz8zfmjCTeEWmd4X5oKA6wpRUl/k84y+e1v
	WllJbcCbeXduJmv6dFwXSHQRrR5i4P8U5QwAU5ivHFHP94W5t09CiOCTZ8KwKrqbTYAS
	M32w==
X-Gm-Message-State: AJcUukcbxIoz1e/yrieK08UbfSpXf7kNeTJPzMdSLHcU7ZTEPwg+KH5O
	OJeca4wVxll082HIE91GxDbXAEHC5FFqUjGWcmA=
X-Received: by 2002:adf:9246:: with SMTP id 64mr1582924wrj.130.1546953769021; 
	Tue, 08 Jan 2019 05:22:49 -0800 (PST)
MIME-Version: 1.0
References: <20190105144429.8702-1-stefanha@redhat.com>
	<CAFEAcA_NiH6Gj1_R6yUXKsgRjhnpqkYJ=84Ugd9t_mPd+af5Wg@mail.gmail.com>
In-Reply-To: <CAFEAcA_NiH6Gj1_R6yUXKsgRjhnpqkYJ=84Ugd9t_mPd+af5Wg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 8 Jan 2019 13:22:37 +0000
Message-ID: <CAJSP0QUn+S8vDsTF+Ww12kN4x7PsVOSbujy9HVMuMfnFbV17GA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] arm: Stub out NRF51 TWI
 magnetometer/accelerometer detection
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rrtXmhDeryI9

On Tue, Jan 8, 2019 at 11:57 AM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> On Sat, 5 Jan 2019 at 15:02, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> >
> > Recent microbit firmwares panic if the TWI magnetometer/accelerometer
> > devices are not detected during startup.  We don't implement TWI (I2C)
> > so let's stub out these devices just to let the firmware boot.
> >
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Based-on: <20190103091119.9367-1-stefanha@redhat.com>
> > ---
> > Steffen: Please post your Signed-off-by.  I did some minor cleanups so
> > your patch can be merged.  Thanks!
> >
> >  include/hw/arm/nrf51.h     |  1 +
> >  include/hw/arm/nrf51_soc.h |  1 +
> >  hw/arm/nrf51_soc.c         | 62 ++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 64 insertions(+)
>
> >
> > +/* Two-Wire Interface (TWI) is not implemented but the microbit-dal fi=
rmware
> > + * panics if the TWI accelerometer and magnetometer WHO_AM_I registers=
 cannot
> > + * be read.  Stub out this read sequence so microbit-dal starts up.
> > + */
> > +static uint32_t twi_read_sequence[] =3D {0x5A, 0x5A, 0x40};
> > +static uint32_t twi_regs[0x1000 / 4];
> > +
> > +static uint64_t twi_read(void *opaque, hwaddr addr, unsigned int size)
> > +{
> > +    static int i;
> > +    uint64_t data =3D 0x00;
> > +
> > +    switch (addr) {
> > +    case NRF51_TWI_EVENT_STOPPED:
> > +        data =3D 0x01;
> > +        break;
> > +    case NRF51_TWI_EVENT_RXDREADY:
> > +        data =3D 0x01;
> > +        break;
> > +    case NRF51_TWI_EVENT_TXDSENT:
> > +        data =3D 0x01;
> > +        break;
> > +    case NRF51_TWI_REG_RXD:
> > +        data =3D twi_read_sequence[i];
> > +        if (i < ARRAY_SIZE(twi_read_sequence)) {
> > +            i++;
> > +        }
> > +        break;
> > +    default:
> > +        data =3D twi_regs[addr / 4];
> > +        break;
> > +    }
> > +
> > +    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u] =3D %" PRIx3=
2 "\n",
> > +                  __func__, addr, size, (uint32_t)data);
> > +
> > +
> > +    return data;
> > +}
> > +
> > +static void twi_write(void *opaque, hwaddr addr, uint64_t data,
> > +                      unsigned int size)
> > +{
> > +    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " =
[%u]\n",
> > +                  __func__, addr, data, size);
> > +    twi_regs[addr / 4] =3D data;
> > +}
> > +
> > +static const MemoryRegionOps twi_ops =3D {
> > +    .read =3D twi_read,
> > +    .write =3D twi_write
> > +};
>
> Can you put this in its own device in its own source file,
> please? This is too much device-specific code to have
> in the SoC's source file.

Sure, will send v2.  It should also be hooked up by the microbit
machine type instead of being hardcoded into the nRF51 SoC.

Stefan
