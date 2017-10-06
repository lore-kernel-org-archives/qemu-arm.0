Received: by 10.223.197.9 with SMTP id q9csp1755225wrf;
        Fri, 6 Oct 2017 08:13:24 -0700 (PDT)
X-Received: by 10.55.31.163 with SMTP id n35mr36855670qkh.279.1507302804337;
        Fri, 06 Oct 2017 08:13:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507302804; cv=none;
        d=google.com; s=arc-20160816;
        b=a43Z2m9lvPkkARbraCpoC5t3QIWHMSH5IWD7Ffp060Qlxuvz6xWbhdSbt1l5suX/TU
         wt2ys3rppC79tW1+W396SabKQz1cjjOdwIJY3YucYXWhzOyLXsK6YD/x7/OTk3gsBCUt
         M9jaIGPwPD4xh3RTJNoqyppAmHlhBzoNIqr0UF4RkQA1KkVcIpfJeLn0v4i4E+cAPMhj
         2FrBsfjSJ8/jh7PY5CPaXQcRE9ushJ6GlCsW9QSPefqAsr+YDPJDKeWYz15tJ3weEcT0
         uwLoUHESz6ls30expEEoWn30cINF2+wCsVOzATmf1r2MEMOmG+TZPlpFjW3kilPICQKT
         fXKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=Yltg+2shbtuQB5Ot2XsSyRsYrhqMtxxns5ezWUJ1kPU=;
        b=jELC60fEe4Wd1zrEeK9VXl8fukgUj7nxo8mnZWvzgCnWZp4DYvFDMERoHirC/pdkWD
         X1ydkVP0FskMTUdHp1I3EWPKAb0s1cNpKFUmqnntUQJyAqXmLDDNBS9gbiyaYhPGH0Ar
         EP+RN5NqKADqr8wzSYRsVGZWE2/no8FA4Z1MmpMj2mSuYUX6W3G6+GGyGSj4JAAsL1+c
         MJivqzuGY7uIEwFPh4vRJxGa7bSd0ONKE884ijhlEsooKs7PxXINfySM6uM9k2SYdBCC
         LRZNFYHZShBZdWsNHtGFqajjV8inS+Rz/xV8M9jfldRIrynektFaSLsxXrByO+FaHt30
         EKkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b4tSHDY/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n66si1396425qka.457.2017.10.06.08.13.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 08:13:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b4tSHDY/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0UJX-0001mf-Qa
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 11:13:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0UJO-0001mG-NM
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 11:13:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0UJM-0004xP-Uz
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 11:13:14 -0400
Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f]:50342)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0UJM-0004vk-Oy
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 11:13:12 -0400
Received: by mail-wr0-x22f.google.com with SMTP id b21so13253080wrg.7
	for <qemu-arm@nongnu.org>; Fri, 06 Oct 2017 08:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Yltg+2shbtuQB5Ot2XsSyRsYrhqMtxxns5ezWUJ1kPU=;
	b=b4tSHDY/gRrPMv6+r09WEnXy+G6ZLAKITNf6D67GGOEhcNqfWKSB4nI0SPfOLj6R2n
	qknvfcP8hFbBh7OtNW5YlIgHt/3fqHM7d/x3eThmPuCiLuPtJWE4Yc99bFo0xNScFaod
	Isn0A3NbQ7lJ/GvX1hjdlhSiVpEnOUqV9OQIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Yltg+2shbtuQB5Ot2XsSyRsYrhqMtxxns5ezWUJ1kPU=;
	b=g1PsJ/vFV9yW0ex+t06QyHcx/rP5CqX3FDZvPk/I8e1Go5MpVAwXHnkijo5wGQe6Kd
	xP14Me6egerMxlUk3zhQY4HNq6BPYJcS5UDw0ILSpjlOVz52zRO2ysEb+C2iQ7K3gB4O
	+Z1PWUnbaBIhcHJ+t0uIn843HcdyX8cASO/ZGTz/l1r+qCstcJzkabrCZpv7ilFf0/4J
	56/OzkcAbhrumNiPRJv/J4B8xIfAcLqkZf8IXYsyAVRQT568kGYaqXArzx4VMG1Nwu3q
	1dgmpj3QMQoLKe/i07gRmIgMozRaa4OZbPSoKtG7JcbTeW2B/1c3L7wTJaLuBela0519
	iXRQ==
X-Gm-Message-State: AMCzsaU+dXB1zNKCgh8p4T7i8fMwFMIdp5aUlEQY0NIv83/wOLB8ftlE
	ijKQdoa/jdA4Ue3yDzYo9ZEFe8VBNr/IopC7wrtxTg==
X-Google-Smtp-Source: AOwi7QBn/csxtiDLnfjRJlLZcYIs0OGdgj6ThY67RzgvqOvS7K8IryKLbkuhBOeDUW/9o5eiHe7/ELi5oWyN+93znFI=
X-Received: by 10.223.175.56 with SMTP id z53mr2615464wrc.177.1507302791733;
	Fri, 06 Oct 2017 08:13:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 08:12:51 -0700 (PDT)
In-Reply-To: <20170920070135.31379-6-clg@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-6-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 16:12:51 +0100
Message-ID: <CAFEAcA-AnBaHadyHaOuS4648b3W3AXngMs9k9hCCDXyXBSLvTg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22f
Subject: Re: [Qemu-arm] [PATCH v2 5/6] misc: add pca9552 LED blinker model
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nclcZS0RU1OT

On 20 September 2017 at 08:01, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Specs are available here :
>
>   https://www.nxp.com/docs/en/data-sheet/PCA9552.pdf
>
> This is a simple model supporting the basic registers for led and GPIO
> mode. The device also supports two blinking rates but not the model
> yet.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>


> --- /dev/null
> +++ b/include/hw/misc/pca9552.h
> @@ -0,0 +1,32 @@
> +/*
> + * PCA9552 I2C LED blinker
> + *
> + * Copyright (c) 2017, IBM Corporation.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later. See the COPYING file in the top-level directory.
> + */
> +#ifndef PCA9552_H
> +#define PCA9552_H
> +
> +#include "hw/i2c/i2c.h"
> +
> +#define TYPE_PCA9552 "pca9552"
> +#define PCA9552(obj) OBJECT_CHECK(PCA9552State, (obj), TYPE_PCA9552)
> +
> +
> +#define PCA9552_NR_REGS 10
> +
> +typedef struct PCA9552State {
> +    /*< private >*/
> +    I2CSlave i2c;
> +    /*< public >*/
> +
> +    uint8_t len;
> +    uint8_t pointer;
> +    uint8_t buf[1]; /* just to remember how to handle a larger buffer */

Changing this later is going to be a migration compatibility break
(or at least a bit painful to keep compat).
Do we know how big the buffer is supposed to be? If so it would
be best to make it the correct size to start with.

> +
> +    uint8_t regs[PCA9552_NR_REGS];
> +} PCA9552State;

thanks
-- PMM
