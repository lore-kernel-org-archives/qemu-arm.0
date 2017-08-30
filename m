Received: by 10.223.188.70 with SMTP id a6csp804941wrh;
        Wed, 30 Aug 2017 05:26:48 -0700 (PDT)
X-Received: by 10.200.55.130 with SMTP id d2mr1722424qtc.65.1504096008312;
        Wed, 30 Aug 2017 05:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504096008; cv=none;
        d=google.com; s=arc-20160816;
        b=WCLK3tbtINjjWCmMUPx8L2SRG5UqoQ9yZuvsz2CDYMtjxZRjvJ7oVvE+UuKB9hxOOo
         9zp3JKQc+pW9k7qYr4hyYMcDajs2qtiGNFa26JYKCrgdBwBUvdbqMR2nQnLRmNaoKU9M
         QTgzT5RKG/lGsSpYB4jFRs6o5sQ71EcBUIlZ5jGNtd8AL1LlysmY+A5cBAHjhI+8sply
         DtFMgCNfCCLD7+pJecaiJj9Wyju/rPPTxEqbvgvFI137GUndzD1JNuaBnteCkKJ4bxTG
         SqODBc8A3jgOSfRVMc0JmrnhPPEwJDxCuOcANsMCXV/m1SSzSGivp3CHHDaUDMhpOwyY
         8cCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=jXHr+IKuv1yS95nGXKo/6DvOBiIBnwQcIBujEx8i9G8=;
        b=YSexxkk7AJaFmHoSff6fe7iMVBpPZiHJPR5gmeODpr7G6lE+Tp0OqJPEa8kWyutdjN
         r95XyhVEAhZJ3yFSp8tChUO++Fs95ZFBYINSF2vqrxwQQgU8rmXelLmCCBYXXtVH97Mn
         wW7fNAMsQJmKk8kWG5IGm3asBsueD2/SSDG/u6fDM5izloNZIrVEZ6+GwgdLVavOlqmP
         DI2/8M8KECuX9sDSxMAdyCfVyFcEnP3Sw4w00hLv0opxkQD7Xkmm57ZqJtjE5eFvyI2j
         29wk3hJJPJvO4lB1mOeQv+C0vFhgP1Rn/gVyZE1/jP/M47q2IVlcaHe7qFLOnuUlJ+l7
         BH7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b3hHJWJF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g4si5500748qkg.206.2017.08.30.05.26.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Aug 2017 05:26:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b3hHJWJF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dn250-00022Y-0M
	for alex.bennee@linaro.org; Wed, 30 Aug 2017 08:26:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dn24p-00021B-Hs
	for qemu-arm@nongnu.org; Wed, 30 Aug 2017 08:26:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dn24o-0003o3-KQ
	for qemu-arm@nongnu.org; Wed, 30 Aug 2017 08:26:35 -0400
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:37390)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dn24o-0003nW-Db
	for qemu-arm@nongnu.org; Wed, 30 Aug 2017 08:26:34 -0400
Received: by mail-wr0-x229.google.com with SMTP id k9so5754928wre.4
	for <qemu-arm@nongnu.org>; Wed, 30 Aug 2017 05:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jXHr+IKuv1yS95nGXKo/6DvOBiIBnwQcIBujEx8i9G8=;
	b=b3hHJWJFpysuKaX46WnLMQ2FzKX7PXejQjLMylKo0fEkbMSYqlSzwXUcfdf746TKfL
	fqT7Ie3va9TZxfky73xsWZKFSgX4WV6Zff+E6CmHw3G/+37MLLTyr2uQHEmYopYPd6mO
	+l5toFCYmtU/6mkItqtIWcwkHopGh1TYISX2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jXHr+IKuv1yS95nGXKo/6DvOBiIBnwQcIBujEx8i9G8=;
	b=EDMhXVKpfg5MRTOEWT8xrPopE99p89ijySs1vq3iBSxwhm2Gd/m+00XMY5Z3TT0a8n
	0InUK5FWNaq0DNB5QMx8g2l5eUPwjwzxRqcOxblWQalRvh6B29GHIEYOppt/ql5uAkld
	I2PazcIBskO9PeB8TiPW7Jqeit7gGRB0++YN/QEofkKWQ2T5KXk8fawcxo7zpNAyM0SJ
	S+YH8kwVHVqF/9VUAil8KNxHc86M8/ODPi/pKmg91lMQ58rCCJOHLYMwz34QVzji+kgw
	2OKaYocHfYvdE0Eej1dEaSVoC/DUr5mLmdhwOMkQFhgWBCyo7CjAdSFMioyRnn6WaLwz
	fCRg==
X-Gm-Message-State: AHYfb5iexX0S4WMcnPDuu694Z55pvQ2OyGTVLLqUxZ9+jjjtKj87vyv2
	5fF8tx6dqyb/p3mbX+W49PiD23i7j6Dn
X-Received: by 10.223.128.39 with SMTP id 36mr934464wrk.11.1504095993324; Wed,
	30 Aug 2017 05:26:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Wed, 30 Aug 2017 05:26:12 -0700 (PDT)
In-Reply-To: <10da5552-c90a-21e6-43ac-829932f64930@amsat.org>
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
	<1503938283-12404-5-git-send-email-sundeep.lkml@gmail.com>
	<10da5552-c90a-21e6-43ac-829932f64930@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Aug 2017 13:26:12 +0100
Message-ID: <CAFEAcA9W=YqbeYKuAxvfNyjfCWGyAXuPdxwFrpLmoezLJ4pm-A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-arm] [Qemu devel v7 PATCH 4/5] msf2: Add Smartfusion2 SoC
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MZQz/LysQfKs

On 30 August 2017 at 03:45, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> I think they might be issues if you start QEMU without -serial and then u=
se
> a firmware polling for an uart, the device won't be mapped and the memory
> accesses are mostly ignored.
>
> I'd rather use:
>
>     for (i =3D 0; i < MSF2_NUM_UARTS && i < MAX_SERIAL_PORTS; i++) {
>         static const char *serial[] =3D {"serial0", "serial1"};
>
>         if (!serial_hds[i]) {
>             serial_hds[i] =3D qemu_chr_new(serial[i], "null");
>
>         }
>
>> +            serial_mm_init(get_system_memory(), uart_addr[i], 2,
>> +                           qdev_get_gpio_in(armv7m, uart_irq[i]),
>> +                           115200, serial_hds[i], DEVICE_NATIVE_ENDIAN)=
;
>> +        }
>> +    }

It would be better to fix serial_mm_init() to handle having
a NULL chardev pointer, because we already have a lot of
SoC code that just passes it serial_hds[] regardless.

I'd leave this code as it is and we can fix serial_mm_init
separately (somebody pointed out this issue for a xilinx
board recently).

thanks
-- PMM
