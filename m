Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3592251wrq;
        Mon, 2 Jul 2018 05:28:01 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeIPnBklKZxRVn0mLkeXsZBrjzgyLw0kNjWnJHpecPYbyZ7F2GXQRjMecdBzGnEIuG8O+lA
X-Received: by 2002:a37:1289:: with SMTP id 9-v6mr21706249qks.151.1530534480994;
        Mon, 02 Jul 2018 05:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530534480; cv=none;
        d=google.com; s=arc-20160816;
        b=Ohqz/yMJSm++QZQu80d9k0gPa8hnfkCucGUce3oAWfDOyg7KJJGia2relHTESHpR3u
         0PswtpY57kpkOIoXjFhYKmBxpHubqIJeZrcE18rjvkl6N4dykYXbCRKTkjbqNJR+EueV
         GwgnO+o1v4HuhZi7HVvBPAhyujMK7aKypEL4VJVRNpQWHDcLTGWvulaQQ4YkfW5awuEM
         4CkMZrihWRe/JxwFVhf/3UKLLYWQLvMDhL2rDOLlJ8avQbdiqzfmO6ZgieEkw8MzwAGe
         bMnRNLz5WczJ2U6dHsbld5d4nRpicT3qPVl0WNRGlSInv1y2mlz/aWKdL1nrG8OKbCsf
         numw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=LTU6pspxGcm0HS+sFvRDVgLMkL9Oygnll+pw81dm7tc=;
        b=OZ2vyt2/bMfxzS76K8Wmwk2wDjmT1PMLAgC7R8eArVplyxodqjYqHnsZsmom9CMDqt
         5F6bo2HTfHM8jTVLJ0zREov37ThLZFC0W2rnU/e31jtVGM0ONXc6e0vJTESA7MguMsk5
         h8bzVjQvFW0znuRzoot8waWwqlGaM8+Hj5gffI8lCSIfGR5nQKG6wU1WjR3Vi4/+pHFw
         6lC3nDDx5mTbTGZPsOX1g6pxr5kVh4Bp0cFIsOR8Fzl2ztYmELZgfrPHzU+ZiEQKobS+
         shfAKKR8Hh8xvm7I/2HxtEKBjE8A/4JWvmdsmn8aZChUm2d06Y+gY1fplmoUEg4UUW5o
         YMNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RVwlUgQp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v6-v6si2904318qvv.284.2018.07.02.05.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 05:28:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RVwlUgQp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60737 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fZxw0-0004Uk-Cd
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 08:28:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fZxvg-0004UJ-Eq
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 08:27:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fZxvb-0004cI-TP
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 08:27:40 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:39713)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fZxvb-0004bx-Mt; Mon, 02 Jul 2018 08:27:35 -0400
Received: by mail-wm0-x242.google.com with SMTP id p11-v6so8496115wmc.4;
	Mon, 02 Jul 2018 05:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LTU6pspxGcm0HS+sFvRDVgLMkL9Oygnll+pw81dm7tc=;
	b=RVwlUgQpQ2FL9laE8ZG6xh5Rk/F7xrEpwrcK3vHZFnvzx8lkoV/lCZVya8DY8tIxjw
	eOkTLPnnc3Cxh6CCic9kQSu5XqY9QHGuis0uHfo4GyGhEGisYRyQUXQ7PSVMTEdxO0Ef
	czkw0kYjYRvvZOKkj6qi2oVHCe+kK1wAWf5yjuYoHw/+ZqQDxVFw/X4vfo9r2hNqe4BT
	VXAdGJu174CNXTaiwKYo/3BLI4acUr1ozrcrgYGtEPR5x8yY8GJ1Q7lT0EqqxB75xuVo
	mvd+qeNVEqs10vguZJZzeGoTCVy2oh8Oj/qZhzE19rDoZlX9xiSmGG41gDZZWQy26CR2
	zXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LTU6pspxGcm0HS+sFvRDVgLMkL9Oygnll+pw81dm7tc=;
	b=hxOwFzGNz5Mcqfyxt3Tb+2qm1Pnt1+S5DrmgjPDJXulAr1nEUZ+oGnnIb4uTWRcxVw
	2mcOussZrJnlZ6jbJbxDjeixkytKtCD8OgE5afv3kG3TLq95faSZB2loii5vthQuwbOh
	SktXflFSEyPtmK6FQ92Piwbih0DjITr66q7KSh2HTGUC4X204dk5koFkMJZ4/zleuvWk
	5qzFq17cyvl7qNKJDG95rFPhK5LmH/IpWZ5V8AAc7nVHD0VWoahsR0s0dsLk1Vv37SHC
	nYSf/u+UJ+h1latlsRm8B4AJZfoLyNZJ13fud8hK6MpDwWUFNQDLKaJBHZvQ93L9y1QQ
	kuvA==
X-Gm-Message-State: APt69E07pFtjxjU+GERnvWXKsstlQElOWxlG6wsBlU4WMBUzk0TSVgwr
	dkkqWMWjnc9EqaAOvgPK0K0=
X-Received: by 2002:a1c:5c7:: with SMTP id 190-v6mr3242565wmf.24.1530534454773;
	Mon, 02 Jul 2018 05:27:34 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	b1-v6sm11596403wma.23.2018.07.02.05.27.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Jul 2018 05:27:33 -0700 (PDT)
Date: Mon, 2 Jul 2018 13:27:33 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20180702122733.GC2155@stefanha-x1.localdomain>
References: <20180627143815.1829-1-joel@jms.id.au>
	<20180627143815.1829-3-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline
In-Reply-To: <20180627143815.1829-3-joel@jms.id.au>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-devel] [PATCH v2 2/3] arm: Add BBC micro:bit machine
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RWfv9KHEmbHp


--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 28, 2018 at 12:08:14AM +0930, Joel Stanley wrote:
> diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
> new file mode 100644
> index 000000000000..e9e0d35ca79c
> --- /dev/null
> +++ b/hw/arm/microbit.c
> @@ -0,0 +1,56 @@
> +/*
> + * BBC micro:bit machine
> + * http://tech.microbit.org/hardware/
> + *
> + * Copyright 2018 Joel Stanley <joel@jms.id.au>
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "hw/arm/arm.h"
> +#include "exec/address-spaces.h"
> +
> +#include "hw/arm/nrf51_soc.h"
> +
> +#define FLASH_BASE      0x00000000

Unused, please remove.

Aside from that:
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbOho1AAoJEJykq7OBq3PIjJYH/RiWVrGgbbchLAaGMs1293/A
CrxioGLNC9QM4DtQJ2gPLX1E93rPxB2MD/Y4+M7s5RoHEB4AbXKZ8LvLpX5swjvC
IGok8Ju6LGozwnmOm8ijQN3uqCDQcTTo+n8AVzZgbiZyvFbtrYGo6P/ePQxjetK+
oiT+acdlwM3THPL/8HECSreWoC5wyqHL7gM6g5TeKTVy9bSPlWsrrxEELl/47NTq
i3OuDKvNmuIzx2CZyx/0614okauNG5Q1v7M0EEn2wCJ4kiwmF80k6S3Qa8AKqJMx
wka7vUgX5hKq6uGd1rujRT0VsM+HiAS8gTphrjnUqtkSMjM2E4oI23Wk45eW8ps=
=TIVn
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--
