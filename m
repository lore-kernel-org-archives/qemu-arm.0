Received: by 10.103.86.15 with SMTP id k15csp1318746vsb;
        Fri, 16 Dec 2016 04:58:11 -0800 (PST)
X-Received: by 10.237.59.240 with SMTP id s45mr2295408qte.234.1481893091147;
        Fri, 16 Dec 2016 04:58:11 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x16si3090246qta.203.2016.12.16.04.58.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 04:58:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHs5Q-0006rt-UX
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 07:58:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHs4K-000550-WB
	for qemu-devel@nongnu.org; Fri, 16 Dec 2016 07:57:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cHs4J-00044l-Vz
	for qemu-devel@nongnu.org; Fri, 16 Dec 2016 07:57:01 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:33559)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cHs4J-00043j-Hw
	for qemu-devel@nongnu.org; Fri, 16 Dec 2016 07:56:59 -0500
Received: by mail-vk0-x231.google.com with SMTP id 137so88414764vkl.0
	for <qemu-devel@nongnu.org>; Fri, 16 Dec 2016 04:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DqGePcwzQ7FhI6E/rjww+ycN2TVjgIYdbWIfnnKLhCk=;
	b=ia6GMpk6fBDXCLwoKaGkhOEgA7HKjhZJHwKZvfZEEFiKjdMWkOtB1w65yV9T68Xszb
	T/k6AkPpGWpezijxKqQwbYNECIAdShwKjXRb29gURHGf8b9wbfz6+zUtuZZoI7zVXJFv
	EHD8bSWfx2tf/eSEt7CX8i3Vr3i0KVv7z7uo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DqGePcwzQ7FhI6E/rjww+ycN2TVjgIYdbWIfnnKLhCk=;
	b=I7q/h6ZBbY/TnI21axx7t5Ch5vSyYeGkPrtvlOmP313Ua6fZcR5Ok/585Ie8c/T2RG
	EAL9sWP8lMARY4/Yn7E+ptVZYDwKCtFOmwJrFGLhYHCx+fyMpbLUPMzyB4nzHusk35yz
	t6XwpZqsRI4WHfIHzk05dhr2KH3dsfMTccULvVfBLPTezYmkAc8wfDZesC3K90U50d+J
	Sn1EZ2gmeQZsmMhcxFUybPP73PgUKikPM0dhLD5IavZy3wci/bl+by1sSxDmyeXot8Vr
	VJUQJTh+tFSK3LF3X8DIDAoXQ2DoULzKBU0KgpVV3fJgtBp3ddOZ7qKRQsN34tW4BY+c
	LP4w==
X-Gm-Message-State: AIkVDXLF5p8w85z/k/MOiyFt+ArC/i2XzZ3ZpN20vPI0pJPvjDD+DELIbA6CGeLJkvRC864Z2/hE6vzQO+CIjRw7
X-Received: by 10.31.8.8 with SMTP id 8mr1076385vki.173.1481893018518; Fri, 16
	Dec 2016 04:56:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 16 Dec 2016 04:56:38 -0800 (PST)
In-Reply-To: <20161215054812.12602-6-alastair@au1.ibm.com>
References: <20161215054812.12602-1-alastair@au1.ibm.com>
	<20161215054812.12602-6-alastair@au1.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2016 12:56:38 +0000
Message-ID: <CAFEAcA94pqzDmwhJqOehAd7biugqSQH8JWytJGFFus0F92YCAg@mail.gmail.com>
To: "Alastair D'Silva" <alastair@au1.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-devel] [PATCH v4 5/8] hw/i2c: Tidy up NULL check for i2c
 slave init callbacks
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ocPCWeXCJ+v4

On 15 December 2016 at 05:48, Alastair D'Silva <alastair@au1.ibm.com> wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
>
> Remove unnecessary syntax
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  hw/i2c/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index ae3ca94..e40781e 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -262,9 +262,9 @@ static int i2c_slave_qdev_init(DeviceState *dev)
>
>      if (sc->init) {
>          return sc->init(s);
> -    } else {
> -        return 0;
>      }
> +
> +    return 0;
>  }
>
>  DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t addr)

I'll just squash this change into the 'hw/i2c: Add a NULL check for i2c
slave init callbacks' patch since that's still only in target-arm.next.

thanks
-- PMM
