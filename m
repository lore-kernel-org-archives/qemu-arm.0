Received: by 10.223.197.9 with SMTP id q9csp3524462wrf;
        Tue, 10 Oct 2017 05:54:45 -0700 (PDT)
X-Received: by 10.55.178.65 with SMTP id b62mr14119904qkf.348.1507640085693;
        Tue, 10 Oct 2017 05:54:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507640085; cv=none;
        d=google.com; s=arc-20160816;
        b=G1lqXCMGW0lkZiPhJ1Oo8FL4RM1QXW/A37aQGfur8woWcBQgzExVRxXLfDgIsYKaxL
         2QtyZic1mccCV57b0qPW1QjUbBf4vd3IwcW76r0WwO1sN7dsgFpGe6iFPd9A3Ko2JnGF
         cwzWMXiFRO71bz5Cr8T831UCmgJTmIxGHE7ik4As60mB3eBaYf+s9//0p4CTlue/ZQeS
         SRsHVcxWamO+oM87+F7Q/B6o6NAI800Xsf1Ii7SvqMCYKJdLkY7rXBrbaP5W9jD+/D1h
         8y8HiFUgCqXIp3WKdpWe3hGWK9bwd1giKmXWTe2aqbNYHbzdjvwHq2TqnyYxYuDsa3bG
         pBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=B1sQKbpP7aA/0CX3tP6aAv5d+DNfJ9lX48DGO/TirxI=;
        b=jcT2G3SJLgeP/NtWqZDSGINmhDlB6/B8H8P+l3wIrADL3h86G7wcZezhpen8CkOwOS
         e2Krrj+3jeygo0wDkypaNa859Jq/+p3gP8cpRI5d3Gxgp/Vk1WmlFvXhpkn9KAxYpK9k
         4KAM2xNT98S94McaHvArEbgBcvAG/HetqIHD5zUEc1EuBvTVDeFT0ak2PWsXySjbsYrx
         FQy20kU8qUbtidCH/FjSP/v0vTf8S4uyINMx6fYDIKiBU3VZR1DgwD7DteyjYES+XNfJ
         ahyipG39A5QUckopKwKG0YJrQDhs2ghLKxVeadGnR5P2/L0rqj/yqJZZZOn+L0ELi6HM
         2gag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DLfIpDy8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h135si3819811qka.140.2017.10.10.05.54.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 05:54:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DLfIpDy8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1u3X-0003FT-DR
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 08:54:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1u3N-0003EX-CB
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 08:54:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1u3F-0004FF-Kq
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 08:54:33 -0400
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:51430)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1u3F-0004Ep-DT
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 08:54:25 -0400
Received: by mail-wm0-x22f.google.com with SMTP id f4so5052131wme.0
	for <qemu-arm@nongnu.org>; Tue, 10 Oct 2017 05:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=B1sQKbpP7aA/0CX3tP6aAv5d+DNfJ9lX48DGO/TirxI=;
	b=DLfIpDy8ICRQfpQv0SOGQInsU8kA017FNuhI02iMQNcswiY00TRb/ABCIdnq+pDRQA
	4kMnlE2A7Zfw3clnjGWuNlYtGCEntLqFONSa8idKnlNDpQ5SUzBw+xfG72oWyFD1MfsJ
	sh0g/+W6jKxq1p0VuWCT0/XnnVHru/jxEX3NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=B1sQKbpP7aA/0CX3tP6aAv5d+DNfJ9lX48DGO/TirxI=;
	b=BaFhLRMrFfaJwc+foRe7D8c5sTz0hqq4mP5nDPgfBwa+uhCXiZjNnnLwwyK6+4rzBi
	WTgQq6hFrnxKY00317odwOEr3rYaoQJdZ9S0PVsd2dgvDU1j0Gmk+pWdPkkarNdcNTiS
	QbwSLk+yi0/hoSa+R3gYd3Bf2KZmmdnwRDRyadYTxayX5a+OeExVwLLMME7jq31xUBpZ
	CcWM1GPJFo/8LbFI1SXgRGsWhmQqffAAjWso0XMjtzbdxU+bKArO9gIc9cB4bPlXSoeC
	PyY2GaEciPsxy9S6SAGlY2mWN5QImLBZ5lWm+A/qIEfeEtWpwt62mZAqr4vOTKvxDvkw
	7yTA==
X-Gm-Message-State: AMCzsaUVvQQN9sF7M1W9cCjMZ/8e3nzuGiZh2vG60PqaeGTlEUraUJG6
	Jqu9YboyMOiQjsgLKgC2yVUttSVsIrp3e9UPfub9rQ==
X-Google-Smtp-Source: AOwi7QB+eQ40wfcgnrUsmTc9PlnbK0VME8aoIsIb+mCiBYkD5UcTu6uVc1chRnD98jyb+kLyowTZydZbLCwECi8X0BM=
X-Received: by 10.223.147.166 with SMTP id 35mr14399023wrp.90.1507640064285;
	Tue, 10 Oct 2017 05:54:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Tue, 10 Oct 2017 05:54:03 -0700 (PDT)
In-Reply-To: <20170920201737.25723-4-f4bug@amsat.org>
References: <20170920201737.25723-1-f4bug@amsat.org>
	<20170920201737.25723-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Oct 2017 13:54:03 +0100
Message-ID: <CAFEAcA_wci=BT69jDM6uNa=JCM=b5GD4pO2vRQUNi6cX-B1QGA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-arm] [PATCH v11 3/5] msf2: Add Smartfusion2 SPI controller
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
Cc: Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jdr+5rVjKpxd

On 20 September 2017 at 21:17, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>
> Modelled Microsemi's Smartfusion2 SPI controller.
>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> +#define FRAMESZ_MASK         0x1F

> +static void set_fifodepth(MSSSpiState *s)
> +{
> +    unsigned int size =3D s->regs[R_SPI_DFSIZE] & FRAMESZ_MASK;
> +
> +    if (size <=3D 8) {
> +        s->fifo_depth =3D 32;
> +    } else if (size <=3D 16) {
> +        s->fifo_depth =3D 16;
> +    } else if (size <=3D 32) {
> +        s->fifo_depth =3D 8;
> +    } else {
> +        s->fifo_depth =3D 4;
> +    }
> +}

Hi. Coverity points out (CID 1381483) that the "else" case here
is dead code, because the FRAMESZ_MASK of 0x1F means that size
cannot be 32 or more.

Paolo kindly checked up with the spec at
https://www.eecs.umich.edu/courses/eecs373/readings/Actel_SmartFusion_MSS_U=
serGuide.pdf
which says that this register's field is bits [5:0] which
would imply an 0x3f mask is needed. On the other hand it also
says that "maximum value is 32", so what is the else clause
doing anyway?

thanks
-- PMM
