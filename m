Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp611091lfa;
        Wed, 28 Oct 2020 08:37:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOSWXQt42CXYm8bzCYJ6ttrh/D447UyhaFgHZay4pybUT31R1tSHEboUjzEa7vHow8Lf28
X-Received: by 2002:a17:90a:a609:: with SMTP id c9mr7569699pjq.124.1603899478101;
        Wed, 28 Oct 2020 08:37:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603899478; cv=none;
        d=google.com; s=arc-20160816;
        b=HA48Cj04qd7IG5R2+mlyt7SXHECZBzO5ZBdXhdsaqMMWY/3ZzXUbN0MK+JXcu395ni
         w9VNw80HeTXPUXNGw/oAJHocWPIVllWWMCP3/MuKb7OYv7awJEE4BWnQLN7h7+PBZe8L
         rcl0iyIuDQc0dx+naxf741cLlQt70ZvMF6x/h0lRmGoiaNORDK4/JpypqKTqzTFWL5VP
         v71RtBd9otXk2srEnCRBVXEjaxz9hOdpldrQd/tURMK3FuIPYH0DheWIn0z9063cwhPS
         EVkRr+qbtok2O5RrRI+XNgSd/cf7u1oYMdHH81eYNxRYuRYh1KbeeNgA+2oAauE0tMvg
         Estg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=igCvaxOOlVz0R8hL+g+DxHD0pQz4hC+WBUmwoXiXBFQ=;
        b=uFuTaVgQJSzSHF20fc6KXz4OlPoHXKxL/BMZPgyXDwxcPCZvCsrsZUnaeTRA4G0qyz
         CHejaFlgz9FxUNuOFQR35x+3mBlvCKonPMVZgS9ba9MNk10YKga9u6/Fm1A548rx/lgz
         Tdusp86nxLDoaqu+yUdUvDynweAenNNvyVmxIMfDb9SDAk+sLcHBMy3dLuQhyDsLcVuA
         aOyoi5RYkf3b+xIw/oHnu7nJisKGhPIriK/AM3tiHXfShwbj7OinnnRMDt0gtpfeupcI
         1L7q2amn6j+bP3g+4o8WkJd+Up0pZiUSFcDfSV7tsxfzsyGXPAW1WLgDutLdb5TdMib3
         TaOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=OJgkrlgN;
       dkim=pass header.i=@keithp.com header.s=mail header.b=OJgkrlgN;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id f78si4906571pfa.145.2020.10.28.08.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 08:37:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=OJgkrlgN;
       dkim=pass header.i=@keithp.com header.s=mail header.b=OJgkrlgN;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id BF3BF3F2DD89;
	Wed, 28 Oct 2020 08:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603899476; bh=YzHdL/SVNn3Bt1bCDaUC9XvyJG5vFq4cXxNR1e8UkSI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OJgkrlgNH2HsYbNmegTXWjFvLgxiz7V1vKmFk+h6BSnXLXmrblBId8avUvsLghsKj
	 LdiQcwm0ZdG6Kdtm+Q4xieTvGk/VLeEATpv/mopJpUCPCHVENODa8WRKkDGg8RIuhG
	 g3MZ8Y70Ag3ZzK4PPgHrnTEoFwmmfrADeBt/7ho9xC8YiYPs+KDcyPs+HUKsS8Hky3
	 ZfXdoSMKGoK1bxaplNBDFA5bKluhgFooD/cAgiD94It2cLjvjVPpYT+fwgDLShXiXl
	 XD0ed4UNcBTlD0qhIiydnm8/j87gXrQ73lMfq/DXtMFuYfyOtg4O7UpdwcsTZx/u3a
	 eogV4TlG3nRJQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sDeMeo7hjEsz; Wed, 28 Oct 2020 08:37:56 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 544E23F2DD85;
	Wed, 28 Oct 2020 08:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603899476; bh=YzHdL/SVNn3Bt1bCDaUC9XvyJG5vFq4cXxNR1e8UkSI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OJgkrlgNH2HsYbNmegTXWjFvLgxiz7V1vKmFk+h6BSnXLXmrblBId8avUvsLghsKj
	 LdiQcwm0ZdG6Kdtm+Q4xieTvGk/VLeEATpv/mopJpUCPCHVENODa8WRKkDGg8RIuhG
	 g3MZ8Y70Ag3ZzK4PPgHrnTEoFwmmfrADeBt/7ho9xC8YiYPs+KDcyPs+HUKsS8Hky3
	 ZfXdoSMKGoK1bxaplNBDFA5bKluhgFooD/cAgiD94It2cLjvjVPpYT+fwgDLShXiXl
	 XD0ed4UNcBTlD0qhIiydnm8/j87gXrQ73lMfq/DXtMFuYfyOtg4O7UpdwcsTZx/u3a
	 eogV4TlG3nRJQ==
Received: by keithp.com (Postfix, from userid 1000)
	id D505B1582210; Wed, 28 Oct 2020 08:37:55 -0700 (PDT)
From: "Keith Packard" <keithp@keithp.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair
 Francis <Alistair.Francis@wdc.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 1/4] semihosting: Move ARM semihosting code to shared
 directories
In-Reply-To: <87lffqmwi6.fsf@linaro.org>
References: <20201026212853.92880-1-keithp@keithp.com>
 <20201026212853.92880-2-keithp@keithp.com>
 <CAFEAcA-0_WLMP1Y1sgcu7Ng+0w8Ovt9DVWzYU8ZA_FA2+bwcUw@mail.gmail.com>
 <87pn53e3ke.fsf@keithp.com>
 <CAFEAcA8Sha5QYbO25dtzBZHoXUeiGVv8aojPFTMrst8nbVDAdg@mail.gmail.com>
 <87k0vbdthq.fsf@keithp.com> <87lffqmwi6.fsf@linaro.org>
Date: Wed, 28 Oct 2020 08:37:55 -0700
Message-ID: <87blgme4z0.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
X-TUID: I7liI3VF/owb

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> I don't think we want arm specific adds in the common code. I think what
> Peter was suggesting is a new config symbol that only ARM and RISC
> define, e.g something like:
>
>   specific_ss.add(when: 'CONFIG_ARM_STYLE_SEMIHOSTING',
>                   if_true: files ('common-semi.c'))
>
> or some other suitably descriptive symbol. Otherwise you have to keep
> adding an foo_ss.add line for each architecture that wants it.

Sure, that will also work, just a few lines of additional config file
stuff.

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl+ZkFMACgkQ2yIaaQAA
ABGQyA/9Eknw0a9LPyqureDreTvCxw67YCgUYQMn2cxp2iMt/I03xf3SB0JOxg0h
Zj5WaJ5mtQOBKpZfRP4qLZqK1a3mLPxsCFQUzhtXxMwrMvnsPqJbSvykxh23gu88
ZbEpTAqgTF+8gZp+LgL7M2BSoAddCEO8C0jWmSBjobkatNthZEufTJrvsf3b8qP9
CVHbxSkhPEze4a1Y4d9HgvgefdBCHXgBnPZoTSTn4HvsdJzkyC5JK221kDhCWf7A
yvL8oeU2sTXls4hO5Y+ntt0CzjslKi2D8PmehJP0oEw/jgohQ9hXOxFTdkoiJsix
c5lueStzU3bzcPGK88DZUY8mejCaZyL5VQAC2z5yoafoEsh4AnhEydFxCyv+oZUi
nEWCcsk6DawT/bCfjcV/V6sHOHpjaLUT9soylE+UHtbuLtJiMmc3gqczSBcJc6JY
BpAoyCd5buq4gAb+VwxlPqai4XUGiuXpDK6hrWxJSwUYM0hNmRSPamxLVTCb2ksg
31eW3AWVkJsZh0XkfQPzWNGPud7oRR0sGwiWAg1k4Q9y19R06Zj/yK1dxtP1rfww
PU7RPDuYiz72UR/UY0vOJbfRQQ2PdOdQpmuiRBextHSykmEXLErur0cPSAR39JUP
So3572RP7lrHVy9CjcNl3cQxJqkrS4RFzSNQWvZLxwS/7MG8OWE=
=LZa5
-----END PGP SIGNATURE-----
--=-=-=--
