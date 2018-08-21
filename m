Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2004761wrd;
        Tue, 21 Aug 2018 07:51:08 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbN2+6YY9jxrIkVceXJ6TP6yZtnoZwM5M5ekRehe/rHgU+NZi/KXL4QdTplXYDVRI/sN7WM
X-Received: by 2002:a37:cf45:: with SMTP id e66-v6mr5625095qkj.299.1534863068763;
        Tue, 21 Aug 2018 07:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534863068; cv=none;
        d=google.com; s=arc-20160816;
        b=qy9lCGW5cCXoI2LSw/FWIolp3MJ9QExHHtSYR6cBvimONBhUvUdqktjzFxj9UFRW4y
         SkhWsfTzZ37FLr25fgu1MVJSX4MRpcMeDo/U2LOqXOaZQZCNOOqQpYtVJJBbNyZPyJLt
         RxiF2swIceDg+Wx67W5kxpN0dpMag8tSwSGtUmhBNlG7k2h6+k7nq1YdMy/tg2ZTXQ79
         DZwWgZH1hsS+LYZgXD0Slq3KKWFRkd8m6vm9sanb900C5mfyEL/jnCf+MBjAN7ZPhWHL
         dedQFcDWxiBuNu3E8pfdYUyXZ1DwK+/zWWsJ7/q+/mkJccxQo13wkI2ZDVfQ/32YKFGN
         GrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=qgE/zDU+imDWDZU9bgmvR/zqJcXwkzlcSuzP6ZOmz+I=;
        b=KifZOOcM5mrQ1TUc+/D8Yc1TJngDRsj6uWxwjFVcQ5ufSh254tRWotGOikgRbus/5U
         1tZXW5TWtWaTKo0aFR/9v7yOca/u+uJ909mhXBMW9U1skU+kbVf43gvWAqbgXKxJvQqM
         /gNOLdqy+bHe09JfXpjJMO7Ss128nBdOZLUtXSM3a/CWebtSppcJrdM54XDhjhEiw6L/
         vDs1IHgBKCky2kXKdDZUsRet4urlVNvnMSul8D6cgq7LOT52aydnv5pdn6hoXQROZsR8
         zPQl2+PuFHk5GVThyiG6vZifVPFga20tATRMfC0Z0t+n10JKP7VzKDzvNcTYJ/UM7Yhy
         kuUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a80bJBWe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k1-v6si9703141qvf.138.2018.08.21.07.51.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 07:51:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a80bJBWe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs7zw-0004Ip-64
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 10:51:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fs7zK-0004HD-9S
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 10:50:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fs7zI-0003TF-It
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 10:50:30 -0400
Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d]:33611)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fs7zC-0003N3-Lo
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 10:50:25 -0400
Received: by mail-oi0-x22d.google.com with SMTP id 8-v6so32531520oip.0
	for <qemu-devel@nongnu.org>; Tue, 21 Aug 2018 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qgE/zDU+imDWDZU9bgmvR/zqJcXwkzlcSuzP6ZOmz+I=;
	b=a80bJBWevGEh2NfgGFn0Pr6E+xVJP+4D6YRHv0+loiVf3Z8fxlkZwIERIaSJdlpoiO
	woDg4Tn+w95AxvcahYbFwCP6QwRX+ceR/MIJ47IU5RpgscTwPPa9qp23xCwAr/lFvLiR
	wXPa6G5qv1O9zCESTWcMcy7uT6ED+f63w+Ygw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qgE/zDU+imDWDZU9bgmvR/zqJcXwkzlcSuzP6ZOmz+I=;
	b=KodoCljXcJGxvcvvCCZDaRtK/wpAt5RTdwk4YHldSxxEf+7r0gu1SzzZAJ2D/hl0gj
	uoWQkb4Q2ZzT4qVsr4lsEv9MRmA5JyVieYKIraGOkD69ppeizY1qZm3EnTLK5Z1T3/rM
	PYz1b2cXfCinFQ/7lz4hSoHFCIWOXEfrPvhCrXnuIGxQmfFJP5a8ZFS4Bl/yfXJ4+q8v
	Fh8E9FycacEGprbBWsircHPax3yi9+yFHT1w14H1jAHuZOok/WirZ6LVu7iKApEVBnp3
	7pvOXcbLrgmLqVAhnyFbgAOTHGb0p2kguwN37H3AxJaTNHHMNtwxuts3NVV5n5tR8cIA
	cwhA==
X-Gm-Message-State: AOUpUlH+zPDnP9c2TnkKjGMoxWvt/wjds6nQQwGXWF/HYVeS+vsreBnS
	StBcmbQf/rAjR60jDI3j+wI/hspf05gWqekztEd32A==
X-Received: by 2002:aca:4204:: with SMTP id
	p4-v6mr17639491oia.242.1534863021644; 
	Tue, 21 Aug 2018 07:50:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 21 Aug 2018 07:50:01
	-0700 (PDT)
In-Reply-To: <6c13fca2-6f16-adb0-1072-7601abefd18d@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
	<20180811090836.4024-7-contrib@steffen-goertz.de>
	<CAFEAcA_=8r_X_rLfwJovEkusBb6hmaG5Ns8YQxQMLL4z0KpHXw@mail.gmail.com>
	<6c13fca2-6f16-adb0-1072-7601abefd18d@steffen-goertz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Aug 2018 15:50:01 +0100
Message-ID: <CAFEAcA91fZpidh1XefoB3v1monJBQFhdZAKVUpMvw6Pw6+fMiQ@mail.gmail.com>
To: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22d
Subject: Re: [Qemu-devel] [PATCH 6/7] arm: Instantiate nRF51 peripherals
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PZb2daLSjYWL

On 21 August 2018 at 12:43, Steffen G=C3=B6rtz <mail@steffen-goertz.de> wro=
te:
> Hi Peter,
>>> +
>>> +static uint64_t clock_read(void *opaque, hwaddr addr, unsigned int siz=
e)
>>> +{
>>> +    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
>>> +                  __func__, addr, size);
>>> +    return 1;
>>> +}
>>> +
>>> +static void clock_write(void *opaque, hwaddr addr, uint64_t data,
>>> +                        unsigned int size)
>>> +{
>>> +    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " =
[%u]\n",
>>> +                  __func__, addr, data, size);
>>> +}
>>> +
>>> +static const MemoryRegionOps clock_ops =3D {
>>> +    .read =3D clock_read,
>>> +    .write =3D clock_write
>>> +};
>>
>> You don't need to roll your own "do nothing but log" device:
>> you can use the TYPE_UNIMPLEMENTED_DEVICE to do this.
>>
> Until we have a more proper STUB for POWER/CLOCK/MPU peripherals we actua=
lly need this,
> because the unimplemented device will return 0 on reads which will cause =
guest code to stall.

Oh, I see. I hadn't noticed that it was doing read-as-all-ones.

thanks
-- PMM
