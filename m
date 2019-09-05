Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp489647wrp;
        Thu, 5 Sep 2019 01:24:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxF1ym4N2XeSf5qxr3dx7pjfCGuKXk6Tv95M8qwQ81iA97qlOMsod+Ani95KFYWkpM+Ji4/
X-Received: by 2002:ad4:4b09:: with SMTP id r9mr875853qvw.121.1567671861826;
        Thu, 05 Sep 2019 01:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567671861; cv=none;
        d=google.com; s=arc-20160816;
        b=UCEN5WrWTsEFshggGlPsEaNjhO60Y5RK1njaiAGYUuT3dwx2KBQQy93YyjCLgVlX7J
         u8qzV0Lj4Uf0sKQ/4qX/C582/OOi55xUjB1N8ZtJAsjkMwQHsY0ZOkYGX6xZT+f7XabY
         5P5Lk7ZiyAsaDatF+woMY2BmC1Bx+08dh8xDNJAWSx5wnou+IsoOvxa05LNyOewuHyhB
         zRXuTovd2i2VLqCfE4Gejr9J84vSBiE19HGLmtnVGliKMkM7aUlqMJkujlZ34Pw2X40B
         iz2YOiBbGjYDKHAV3ziBpy+0LCkkEqOycobnRF7Q5kqNyOdRbfwD4PjMXjP9r6OV+oM6
         LFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=vr0XrqLVu8g+HgIEU6TZ4HBBbSZfWcCsO2HJIyKOSpY=;
        b=EKDHElXwprDeuPuX/V3lW3KClrV2WioWa2dMcDNapXpqfurmfFgewjMQhR7+/JJBvG
         JHMFolOFsdWtpXG2EM0Z6uWJ7RuS7Oc6t/PgIERBYSPmXiVHk2Ud8IJf6rQYEbaoR3lU
         69k0ssN5bBCmE+2pDWuyjL9OHf6dz7JV4nxAPm1c1HXDzpyzyfyOl4Q2AVNtE7ZVVwC2
         9p+yX8mEB0m8yf7Qnj9PKqchz3m4Flkd1WjveqWI5WheD2R0TiLbzob/fwER+mU4Ionw
         hLwMoYWXHrsleqp7vRF9V/umNwY2WH638rgZxTZiOPPyAhIim6y4E7XA1rMoqbmSWC4x
         rIWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n60si850877qte.94.2019.09.05.01.24.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2019 01:24:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5n41-0004k0-35
	for alex.bennee@linaro.org; Thu, 05 Sep 2019 04:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1i5n3r-0004js-H4
 for qemu-arm@nongnu.org; Thu, 05 Sep 2019 04:24:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1i5n3q-0002Np-Ja
 for qemu-arm@nongnu.org; Thu, 05 Sep 2019 04:24:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51088)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1i5n3q-0002N9-EJ; Thu, 05 Sep 2019 04:24:10 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7D58D31752AF;
 Thu,  5 Sep 2019 08:24:09 +0000 (UTC)
Received: from localhost (ovpn-117-222.ams2.redhat.com [10.36.117.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3E975D713;
 Thu,  5 Sep 2019 08:24:05 +0000 (UTC)
Date: Thu, 5 Sep 2019 09:24:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190905082404.GB32415@stefanha-x1.localdomain>
References: <20190902162638.28142-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline
In-Reply-To: <20190902162638.28142-1-thuth@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 05 Sep 2019 08:24:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/misc: Mark most objects as "common" code
 to speed up compilation a litte bit
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Aleksandar Rikalo <arikalo@wavecomp.com>,
 qemu-arm@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EzIDzPvQxIQQ


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2019 at 06:26:38PM +0200, Thomas Huth wrote:
> Most of the code in hw/misc/ does not directly depend on CPU-specific
> code. Mark it as "common" so that the code can be shared between e.g.
> qemu-system-arm and qemu-system-aarch64, or between the various mips
> flavours, instead of recompiling it for each and every target again
> and again.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/misc/Makefile.objs | 90 +++++++++++++++++++++----------------------
>  1 file changed, 45 insertions(+), 45 deletions(-)

Nice.  My understanding is that we poison symbols so target-specific
code accidentally added to common-obj-y should fail to compile.
Therefore I didn't audit the affected code to see if it has
target-specific dependencies.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1wxiQACgkQnKSrs4Gr
c8jsgAf+PLcRF26MLfCuoYo6XtPaE8O7I0bcEteytjnW4Om5TppDwvKNeCoaOXlV
LyIQuQDOOSwUw1ySaWfy1nZyWwWJ2u7tFhqOyEVUwKWMSMCpSh1O0PWU6Ae4woO/
I6mUA6dXANTP/aIaC1wiWDHcsCIYrNoJoMR6utGKUI8fSrb5Idfysb+cIdkiKHNW
0ewuMUAhllLqDa0WO3xbWOli7fKBiPXXIf6mS4Y5z4m2Cws2Wl3Azany8eenMtiz
tOFoe3rXoV3g/M9hWqaKgyKO7nWgXS8hOjuiB4GU6thnN15wTi30V9T3WFeVJHY4
i6ha15VFNDcBMMHUhQt6j8LOyyyABg==
=9eJI
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
