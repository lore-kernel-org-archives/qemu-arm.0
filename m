Received: by 10.28.71.27 with SMTP id u27csp4537501wma;
        Mon, 26 Feb 2018 23:42:03 -0800 (PST)
X-Google-Smtp-Source: AH8x227i2kJMgtATM8j3fykozXiSAwcH9gsKitzznTBcuUknT736cfHeuEZNdpIlhRRlES2ozmds
X-Received: by 10.129.35.6 with SMTP id j6mr8436181ywj.278.1519717323610;
        Mon, 26 Feb 2018 23:42:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519717323; cv=none;
        d=google.com; s=arc-20160816;
        b=VnMcvxpddHuSl23/Mi175aRZpRIZRB5S5RpTdk36++qOQx7aZQBdq0OoIPdKircgEh
         nqXzm7/79tjhus8dp3j3jUjuymEIrhZOM3DaQmc90NFkErx5rSASH7phzAtCXe61ppF2
         3Q9F8Wc0wjLGMmYH4OleBFBWYtR/e9bv/sX0SMaKsmaFSVtd7Fnwuh1NRvr4lCITsSYf
         68AQqY4NJpoEXcmUPcXL9Hgu8NdKpk4cxnp+5KLQzqFJCQjiWctJOTNvJAaq14/Nmit9
         h54cOmjvu8OBr7466ce0bu3FXGRBnypmWF00zqtGjh1daFvBBgXtpfTJYFJxH9UqE9yu
         aElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=Dx6XV+ELR4hgyBUSRnsIUgLH3UCwhlPoGjZdVO+vzJQ=;
        b=V/FkFZGkpzDJ6dl3OMO52SVALPD+IFGcpmquFiyO2yiQlednm3lAGoatnNqWIP8vfE
         QBMZN7xX9wcLMValF9Zb9wr5r9z3IgcfPwMbqTS078tjqz2WdLIaWIDRZONVWSW312jI
         xLiVav8odD6wRwstNEDCd8UZfo9D2SQrfbTUP68c8JJIyhM/u6qWoL73XwdR4JhhNRLB
         rHNEhsGi6oIunczzsTJmhuSNwEfok4HuNW4+vbTmhowcDubgpvg1Y+qUnIpdPSd0U0Ce
         /XQyy5OwcsUsBA1Z/m70gCTKicUX3KbVXGdSVrpywXeuU0jFJtmRiy0cjt3hOdRcb1zB
         QDeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BU81NOEu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63si1810655ywb.21.2018.02.26.23.42.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Feb 2018 23:42:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BU81NOEu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqZtj-0003B0-2P
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 02:42:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eqZtZ-00039h-Cd
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 02:41:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eqZtY-00028p-Bp
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 02:41:53 -0500
Received: from mail-io0-x22a.google.com ([2607:f8b0:4001:c06::22a]:36353)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1eqZtY-00028J-6o
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 02:41:52 -0500
Received: by mail-io0-x22a.google.com with SMTP id e30so9667445ioc.3
	for <qemu-arm@nongnu.org>; Mon, 26 Feb 2018 23:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Dx6XV+ELR4hgyBUSRnsIUgLH3UCwhlPoGjZdVO+vzJQ=;
	b=BU81NOEuFh/CsY6zG1x9g/u1pTXZFCDe8Ijny1asGPCRZVBcxq+3YcSkOiBohoEwYp
	IIhpJxXlQaNUSPnFdQKPTKcxzQ2aq+rBkJUOIoqgIUhcTW79WE678WKm1oiLUzFx5hvh
	ZmC+eAjg16E1l1OxdBw/GydIxSYJfAhjdMEOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Dx6XV+ELR4hgyBUSRnsIUgLH3UCwhlPoGjZdVO+vzJQ=;
	b=pldjWxx77ITviDU2nVmdMFQrEvKDBS/w3wp1OGYcrv6Dx/AFCZvtf9y2rlohXIdiIW
	lNN/1YPVVPEgVOWgXUuypJO5JEw1Ibryw8IczK/lU4+8epkIyU6y3ArTm0/0YKWglfO5
	4hYm00Hyv0BtFOZ9Lql5wAOOpyyqosY75xHIOWfib5DOZD2p264thwdnFKHe2HRUkdlT
	6XWjKTI8RkhO0OY9l1HQC1jYNw9Xy3EeJV750zurFuURJS3tS7jXxv+9NKRbPSa4JfQp
	9C6phlkaMxpqes2Nutz5Pnc0rZrnN+cQQmA2C+mssieG57XPSvHQl6p7RwffJnIfCxQE
	Wz8g==
X-Gm-Message-State: APf1xPApLOQIshUwlm+smj3HhZKe6w5GQ39hMZ0zqg9xohDOhiMmlDZs
	rV7qBkgR1qkn1oGVJf3NuoaIbtiMESV770wiIbOTzw==
X-Received: by 10.107.151.74 with SMTP id z71mr13989876iod.277.1519717310079; 
	Mon, 26 Feb 2018 23:41:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.230.25 with HTTP; Mon, 26 Feb 2018 23:41:49 -0800 (PST)
In-Reply-To: <eff4f015-38ad-60e1-e1de-886bb4f93328@amsat.org>
References: <20180217140051.22731-1-linus.walleij@linaro.org>
	<20180217140051.22731-2-linus.walleij@linaro.org>
	<eff4f015-38ad-60e1-e1de-886bb4f93328@amsat.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 27 Feb 2018 08:41:49 +0100
Message-ID: <CACRpkdZLwbVr2O5__GpHt+y0pqpk3-j_AXD_qv5JQc3JZNRm7A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::22a
Subject: Re: [Qemu-arm] [PATCH 2/3] hw/sii9022: Add support for Silicon
 Image SII9022
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uXPpSMUrKOLF

On Sat, Feb 17, 2018 at 7:32 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:

> [Me]
>> +#define DEBUG_SII9022 0
>> +
>> +#define DPRINTF(fmt, ...) \
>> +    do { \
>> +        if (DEBUG_SII9022) { \
>> +            printf("sii9022: " fmt, ## __VA_ARGS__); \
>> +        } \
>> +    } while (0)
>
> Can you replace DPRINTF() by trace events?

Absolutely but which ones?

I do not feel senior enough to also invent new trace events
for displays or I2C devices...

Yours,
Linus Walleij
