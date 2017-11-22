Received: by 10.223.159.82 with SMTP id f18csp625382wrg;
        Wed, 22 Nov 2017 12:34:59 -0800 (PST)
X-Google-Smtp-Source: AGs4zMY+8mMLn1G3V5yF8WhmQtxxZM3mDPtLKGtUUKq7hYIRGBWvMy1Xwx/wUnKCN34r1t6TMn3k
X-Received: by 10.37.185.15 with SMTP id x15mr13867131ybj.171.1511382899401;
        Wed, 22 Nov 2017 12:34:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511382899; cv=none;
        d=google.com; s=arc-20160816;
        b=fN6W15rtp8aVjoukzxdYu2zWnS1PdF+8vMEzIRxpJljQ1fgdtyThPQ3xkLFpDgFav+
         HhrmjaIOsIyGQtSKtEo1xm/pvj050x/RnlpDbQiHvQj15QbBqUgA1tEkGiNQNhdeWGHc
         y66z7jJqGlBNiPaarpAZx/ee3lr84qdA375TdbDftOFDLY3aqvegl8WWEgf9B9ssAdH1
         MmEwkkon89CCSMkkVCt3ACqybVIyrr9JIv4oKDapdxgqWokrfOwCcUpLAGdDrBkqLKMr
         u3rluwjmqauE+50t2sVcqT0JpmgF/EAxVuE8iP/wQTcp1Z/kbcKIXWLW0D19j5otUskP
         vrzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=cnFq1+zpoBNkdWQ2/cNr5vdAJdG5MQmVQQYCjT2Prog=;
        b=rD+1ryyu5pTgBb0tOElGY7W0X5oToEz2PqaPaq+RMe1OiYteDMGqIz5zYl2+JXMGVP
         MM6WDSrBhUNXBZWM2hDUdvGOPp8bnj+JOPP76IaBy6iZrXgO/vat9DBlvQr4xL3v5cRG
         UWWAzFdlnFuknenZ3h7OTm9YdA4DFgLTfMukbFRPJLLSAYzaffIIgbPIjpcFh0i/Jz0C
         0bDHkT8WdvthRdwQhTfrDkPDzjHkX9dGU0tTXbQYHzLMFRgWVoUjz8hF2eqqgdn36fBa
         NiPNP1TGaqdr4j9sdEW3ICNrl0dwikTqM6aeJ0TFtOOW8+rjy5cMBQdk5EVS1RkbxX1Y
         5ukQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RXJdjZjr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2si3570338ywm.775.2017.11.22.12.34.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Nov 2017 12:34:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RXJdjZjr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41214 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHbjW-0005ib-Rw
	for alex.bennee@linaro.org; Wed, 22 Nov 2017 15:34:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHbjQ-0005iU-5p
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 15:34:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHbjP-00029v-5O
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 15:34:52 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:37713)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eHbjP-00029m-1I; Wed, 22 Nov 2017 15:34:51 -0500
Received: by mail-qk0-x241.google.com with SMTP id 136so18444410qkd.4;
	Wed, 22 Nov 2017 12:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cnFq1+zpoBNkdWQ2/cNr5vdAJdG5MQmVQQYCjT2Prog=;
	b=RXJdjZjrYZNlcWYoTXOuuErEaWkPeEIWpQtYricILhHmhSCceGi3r3wYcvPzf5xqNM
	L/njtEPk9pS97w+0znAZ16b04ukkuOOCQZ3AFGiOJlAWg7ZzpRVz16BSS+m9pR5jjVfK
	N2d9LZuXC1lGl2VS2Xs2Ac5062+b1qFO+vbwJKsVmoebnD4qKBxcfEsBicJfadXWkAPD
	7JTVS9vZNzDl6h4K1Pg5qghcY4N9qHxdy/F/NdiYCRA6gvlo2TIkw5l3s2FCJfzEmN5j
	xjNq4OOoVl6uOkX5EjuITePZfo0nPtAas2prk1pu6wn5TcvDmcb5upCOgUJU1xfO0Nsk
	z0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cnFq1+zpoBNkdWQ2/cNr5vdAJdG5MQmVQQYCjT2Prog=;
	b=HH6kurSa7fl7DqcqnFzxmBC/ZPLnfz5oMqzR9mq1Oft6Mqicl79jO3O6nN+QhAfzaG
	HxQa6A8lj5eiUl/hd1sBxvRyUp83rVA0XYqUdFDu1jeQxWUIlUFK0OBzuvLk0l+EU5Kp
	FldEgX15ik+y+dzTGWEw37R5y9qgdnbWODGDJfGw95/PZyFLXgViti4wNxmjd/6f7cyD
	hpJMutAhP+RmplYJPg09zF7kiwDs9UaDeKMpVY8d2PwSBdK579sWga4z3plqwwuHg2Ct
	da+L72y9yEnits28eOmauED63Ecwk2HVKeYDfSB/XmrHS716vjFJuExLagUFz5TTw6nR
	UXgA==
X-Gm-Message-State: AJaThX6iFKj2QLQGZ8InPPYiS1o68xuR1XtLo2OORHQlOmUvJPGAluDS
	cnTWd+tX7JF+VF42v5C2B1W4+lcuq6ORx2AqgUs=
X-Received: by 10.55.212.16 with SMTP id l16mr34421887qki.209.1511382890334;
	Wed, 22 Nov 2017 12:34:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Wed, 22 Nov 2017 12:34:49 -0800 (PST)
In-Reply-To: <CAFEAcA8CLwzHj9-n+OJKB4GTn1u3D_4secBV_CGdFkR383EAOg@mail.gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-11-andrew.smirnov@gmail.com>
	<CAFEAcA8CLwzHj9-n+OJKB4GTn1u3D_4secBV_CGdFkR383EAOg@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 22 Nov 2017 12:34:49 -0800
Message-ID: <CAHQ1cqHe8yXt2Df_Z0fJ8W5z0_ckt7TvSU4T57y+q+bLh-R2rw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [PATCH v3 10/30] imx_fec: Reserve full 4K page for
 the register file
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RFelbKU512R+

On Tue, Nov 21, 2017 at 9:48 AM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wr=
ote:
>> Some i.MX SoCs (e.g. i.MX7) have FEC registers going as far as offset
>> 0x614, so to avoid getting aborts when accessing those on QEMU, extend
>> the register file to cover 4KB of address space instead of just 1K.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  hw/net/imx_fec.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
>> index 48d012cad6..e236bc933c 100644
>> --- a/hw/net/imx_fec.c
>> +++ b/hw/net/imx_fec.c
>> @@ -1252,7 +1252,7 @@ static void imx_eth_realize(DeviceState *dev, Erro=
r **errp)
>>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>>
>>      memory_region_init_io(&s->iomem, OBJECT(dev), &imx_eth_ops, s,
>> -                          TYPE_IMX_FEC, 0x400);
>> +                          TYPE_IMX_FEC, 0x1000);
>>      sysbus_init_mmio(sbd, &s->iomem);
>>      sysbus_init_irq(sbd, &s->irq[0]);
>>      sysbus_init_irq(sbd, &s->irq[1]);
>> --
>
> I notice that we have an unused #define FSL_IMX25_FEC_SIZE 0x4000 in
> fsl-imx25.h, and the Linux device trees for the imx25 define the size
> of the FEC register block as 0x4000. Should this be 0x4000 ?
>

I think the size reserved for that register file differs between
differen SoC. E.g. it's 16K on i.MX25, as you pointed out, but 64K on
i.MX7. It's all the same to me as long as it's greater than 0x1000.
I'll change the code to use FSL_IMX25_FEC_SIZE since it gets rid of a
magic number.

Thanks,
Andrey Smirnov
