Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4499888wrt;
        Tue, 8 Jan 2019 03:53:17 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5bjvmIVzkMuhP7oNI6+ZF5VNhCBbs8lQMIF0GOFSTDbKbWMoVn5vmAxtHweGl4Q6rkut54
X-Received: by 2002:a5d:40c1:: with SMTP id b1mr1280295wrq.133.1546948397503;
        Tue, 08 Jan 2019 03:53:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546948397; cv=none;
        d=google.com; s=arc-20160816;
        b=W5HOoB7hs8l9eEUvLcp1Z8uy8Dn12U1CXoNhryd8Ppqh+hQ+PFzOp5z89FwdGmNXi2
         0MTvTauTCucWjWhutuzV5ay4L5mTNbYFGqenW7wPufFtsz80uMcsLeRpMmeGJ0BW0/Ud
         M/J1cpBAFmZ+GAWTAKoepHL/psCdHTfAUNZ8Bj2MPBloen5fbXjsGcbqKRTIon9LUBNg
         uEqfUt4/CKzdjLgcLv8q7aWxP9FzLgq71xK5NacXnNs7TBg4u+JQ4Ny6g2hvtr47Usk8
         tGwR3PW5bRDCevjAO9tFFoHlkkuvdvDPU1gjOF7ZTmNI2AsrFgSvtANQMqm1821pTE6i
         F+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=pNQ8r1DFcc89NhM6egdsCEB8nQILlP3WwTd2XDAQ2NQ=;
        b=qjL5yx6Ae1qKJ4m/l2sBfXxg42MYy58Fkz2a41Qxlv3jrWpssozC+Q1bXqh/9L7919
         J5um9GKQCpxsrtFxFciD/cLNYqHUh50ld62BXvhxWruRRzfbMqNO/5l+YOrPy9CU/Ttv
         /ytO5W5eedyOkp1+C9icsc8gcNR3LxnltzuvGP9kj72BAZBu00/FEUbENFdUXu16ZVF0
         ugQkon52KB5NGrpkC4JNsjEdVOLAiu7zajuFDLyL4/GbFsSkaa0Bo3pbwPJmfmc53lrA
         Vz0CJdY1tzAGmane4e1eHD8CfwPyoKmm7rz+9ZkSC8mJUu6sTl4CmgZ+HfjMbeQC1DxY
         PNCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZrGKuDMC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si37526588wrm.131.2019.01.08.03.53.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Jan 2019 03:53:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZrGKuDMC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:49244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggpwa-0002yE-1K
	for alex.bennee@linaro.org; Tue, 08 Jan 2019 06:53:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggpwH-0002uX-FX
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 06:52:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggpwG-0006Oo-Ms
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 06:52:57 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ggpwG-0006HW-IE
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 06:52:56 -0500
Received: by mail-ot1-x341.google.com with SMTP id e12so3232456otl.5
	for <qemu-arm@nongnu.org>; Tue, 08 Jan 2019 03:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pNQ8r1DFcc89NhM6egdsCEB8nQILlP3WwTd2XDAQ2NQ=;
	b=ZrGKuDMCaxu682sOPGCG/9VZtBHiDSFC+9Dspzz7d/7+15o0IrHDOR5XMTbfD7gJbR
	qqfwNQb84RO41U5SkDWxNSWb3X77t8+AuvdJArLwv7U768Y/PCmAHf9DD3VHIrzpy+rP
	eP/myei1VKdd+JIpVK6bYXxLr83O2YirHWcD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pNQ8r1DFcc89NhM6egdsCEB8nQILlP3WwTd2XDAQ2NQ=;
	b=ncxExN/PUtwJuYFh4ja/zxWR1kZNVauCR+HCHWTLWDjuZzC3H7RyYPW3Ab6iJjKfCI
	BLHYBiHod6Li/rtB1KvYfZ1MAUQmBo5PNkiaTKUNz2p/BJGxmQWEF7qeMFsbPQoox/XN
	ixjlnyUdDPK10VqEDrwG4rnrfQSM2cKjkWqvvVTQO31CuLTQf4a1p2ubCiSESmv8p0Wx
	A7f9RjsXSrOmVwOuiGz6J0EIiAwCKoHBZVov4AHh+kfl7aV6Y1YyTKkwS4g9C0TQBdzE
	q6/zAgPkthjc9otrZRyAr0+O0mDw+7chre+Tq0jfr+Nl6qWAJNECqvd6ZyWdKkfp38/P
	jUvw==
X-Gm-Message-State: AJcUukdWqcf4R/Eu6JEMUSznh98NZGvZLTxLWZlwatkRfZreP7mxM1Wo
	tAkhwis0ujibvfJI62YFdmCiEP74uA/A/TdKmBpY2A==
X-Received: by 2002:a9d:6e8d:: with SMTP id a13mr943642otr.352.1546948373304; 
	Tue, 08 Jan 2019 03:52:53 -0800 (PST)
MIME-Version: 1.0
References: <20190105144429.8702-1-stefanha@redhat.com>
In-Reply-To: <20190105144429.8702-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jan 2019 11:52:42 +0000
Message-ID: <CAFEAcA_NiH6Gj1_R6yUXKsgRjhnpqkYJ=84Ugd9t_mPd+af5Wg@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH] arm: Stub out NRF51 TWI
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
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jZMs/jU9pyrF

On Sat, 5 Jan 2019 at 15:02, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
>
> Recent microbit firmwares panic if the TWI magnetometer/accelerometer
> devices are not detected during startup.  We don't implement TWI (I2C)
> so let's stub out these devices just to let the firmware boot.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Based-on: <20190103091119.9367-1-stefanha@redhat.com>
> ---
> Steffen: Please post your Signed-off-by.  I did some minor cleanups so
> your patch can be merged.  Thanks!
>
>  include/hw/arm/nrf51.h     |  1 +
>  include/hw/arm/nrf51_soc.h |  1 +
>  hw/arm/nrf51_soc.c         | 62 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 64 insertions(+)

>
> +/* Two-Wire Interface (TWI) is not implemented but the microbit-dal firm=
ware
> + * panics if the TWI accelerometer and magnetometer WHO_AM_I registers c=
annot
> + * be read.  Stub out this read sequence so microbit-dal starts up.
> + */
> +static uint32_t twi_read_sequence[] =3D {0x5A, 0x5A, 0x40};
> +static uint32_t twi_regs[0x1000 / 4];
> +
> +static uint64_t twi_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    static int i;
> +    uint64_t data =3D 0x00;
> +
> +    switch (addr) {
> +    case NRF51_TWI_EVENT_STOPPED:
> +        data =3D 0x01;
> +        break;
> +    case NRF51_TWI_EVENT_RXDREADY:
> +        data =3D 0x01;
> +        break;
> +    case NRF51_TWI_EVENT_TXDSENT:
> +        data =3D 0x01;
> +        break;
> +    case NRF51_TWI_REG_RXD:
> +        data =3D twi_read_sequence[i];
> +        if (i < ARRAY_SIZE(twi_read_sequence)) {
> +            i++;
> +        }
> +        break;
> +    default:
> +        data =3D twi_regs[addr / 4];
> +        break;
> +    }
> +
> +    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u] =3D %" PRIx32 =
"\n",
> +                  __func__, addr, size, (uint32_t)data);
> +
> +
> +    return data;
> +}
> +
> +static void twi_write(void *opaque, hwaddr addr, uint64_t data,
> +                      unsigned int size)
> +{
> +    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%=
u]\n",
> +                  __func__, addr, data, size);
> +    twi_regs[addr / 4] =3D data;
> +}
> +
> +static const MemoryRegionOps twi_ops =3D {
> +    .read =3D twi_read,
> +    .write =3D twi_write
> +};

Can you put this in its own device in its own source file,
please? This is too much device-specific code to have
in the SoC's source file.

thanks
-- PMM
