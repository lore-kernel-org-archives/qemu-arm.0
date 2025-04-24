Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp3607474njd;
        Thu, 24 Apr 2025 03:48:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZ7TL78UTU5Sm+qAB/3btdNTGmRBc7Ty8dSYZ4oB7jlH0u2pSsWes4ISGMhx9QknyLftN4CwT/84xtOg==@linaro.org
X-Google-Smtp-Source: AGHT+IGbxVD06tw+itzNV/bbp4vI3RIyOT2KFdILAJ9kXJzTPzlwYPOQyckwNYAMATHW8Cp/qvJX
X-Received: by 2002:a05:622a:5d2:b0:476:964a:e338 with SMTP id d75a77b69052e-47eb30a4eb7mr31057131cf.28.1745491736813;
        Thu, 24 Apr 2025 03:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745491736; cv=none;
        d=google.com; s=arc-20240605;
        b=kyjwOPpty61vJuqGHQtMwIlJiYxDKC3cwQKfbEL0Fb93y2sEuHUbbkQNZcKVsOPS9h
         Ja6Vp3gkFrtzNs5YPDU4sAEoc+9lrndHpzmwe7MCjfUKOVfPAroHQYX0aL1wSNO8Ukzo
         8lS7lE91DcvxiiKk61TSJCa/NEiOGqSEmc/v6FUYPpHW1BxFtZTvFh+mr6Dozqb/gjzI
         AGkyWUqjTPQEa1aSIAvyuV6syTCir3pjgn7y++Gblh0ElUlZR0Wmt+KtxvQ9/URCyClh
         CqKNY3KqcViiogGmVHviCRJEjWY7yIyeCnVwlnI/ES6wXsD3wBBF0gTZzAozdWlRQL52
         /Cbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=99QSphfUEgq3Mr4PmQOyqUqK8vk/lsUZzIM3NRoiE8c=;
        fh=2d3CTXCdXHan7SFosDhf3NuT3Ty+9A+Ierl5qtXyXnU=;
        b=YdFXbXJhPolJFbqfzNxP8y7nw2KEm5XPNoZGG2zzF2P5MEySSgLSwCi2pNLtyWn+yf
         9Tg4SGrL4vq0Cx/NYkn2ka+sgQybTHAnObXr3LOu8I4mJfG3GKQLl1jgAPD9y1/qP+1v
         xnGM1YJ76PcwSYakyPiY4w/XnbvOOPT3YfBr2wccQcjbRnkR3rgmlzMIUwCMlxUHwXJ2
         wcFcXXuIR5Td8+RJI7wIT8mcW4Cy/mAzCOkvjJtSU4z4JA3vCMD+67SRDFfjMC+92YYm
         upCmRFo7TKx05PUVKL26JVsHPvMu5HQ6xYKpih6Q2y0bV0cleLrDaPZCGPQXGXs4yt0Q
         S6kQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (no key) header.i=@nongnu.org;
       dkim=pass header.i=@beckhoff.com header.s=mail2022r header.b="u2/XfR5x";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=beckhoff.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ea1f95e0esi14771651cf.386.2025.04.24.03.48.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Apr 2025 03:48:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (no key) header.i=@nongnu.org;
       dkim=pass header.i=@beckhoff.com header.s=mail2022r header.b="u2/XfR5x";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=beckhoff.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u7u8N-0007hd-Df; Thu, 24 Apr 2025 06:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <C.Koehne@beckhoff.com>)
 id 1u7u8A-0007eA-L2
 for qemu-devel@nongnu.org; Thu, 24 Apr 2025 06:48:36 -0400
Received: from netsrv01.beckhoff.com ([62.159.14.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <C.Koehne@beckhoff.com>)
 id 1u7u80-0000bZ-6C
 for qemu-devel@nongnu.org; Thu, 24 Apr 2025 06:48:32 -0400
DKIM-Signature: v=1; c=relaxed/relaxed; d=beckhoff.com; s=mail2022e; 
 t=1745491699; bh=99QSphfUEgq3Mr4PmQOyqUqK8vk/lsUZzIM3NRoiE8c=; h=
 Subject:Subject:From:From:Date:Date:ReplyTo:ReplyTo:Cc:Cc:Message-Id:Message-Id;
 a=ed25519-sha256; b=
 kymu8zZQNGJvcgs6QUKbuaxwvWJZrPj1ilXwFqaZzIJovVWllE9CQCyN/9pRRCiXxulrZ/bviWXl4N3bG7OFAA==
DKIM-Signature: v=1; c=relaxed/relaxed; d=beckhoff.com; s=mail2022r; 
 t=1745491699; bh=99QSphfUEgq3Mr4PmQOyqUqK8vk/lsUZzIM3NRoiE8c=; h=
 Subject:Subject:From:From:Date:Date:ReplyTo:ReplyTo:Cc:Cc:Message-Id:Message-Id;
 a=rsa-sha256; b=
 u2/XfR5xjZctpVTw4OZxgk+8oHP/VbS674jWqyDKNgbO6Ai9Q6na9hls+rlv7lJyHrnkizJ30ju5WX9qf+OzLNykmeRcdFVi9YaMQV6GtIynQ3C8mLyu8wDaf7Vm20mE/VuOkDGQvcsX5EkGYwpXHV2yPla3aiD7CsDCBFNldwdANW5wkm+IlUEQlQs0wltFAX+wLZ2rWaCYxMYEARwmtHlR6AfZ3WqQv0MUNA1dK3UJc2NthNWL5IWC4cXD3dXtUhzAC55mW/dAV0ufpwglZEL5SpqGmoAa8Nw01+ZJpX0OdrpwlJlbFSL8JKiTJ3dASyS49HulWfDRVpM78h2kMQ==
Received: from 172.17.3.7 by netsrv01.beckhoff.com
 (TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384); Thu, 24 Apr 2025 10:48:18 GMT
Received: from ex04.beckhoff.com (172.17.5.170) by ex14.beckhoff.com
 (172.17.3.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 24 Apr
 2025 12:48:17 +0200
Received: from ex04.beckhoff.com ([fe80::d02e:4c24:89d8:a7a3]) by
 ex04.beckhoff.com ([fe80::d02e:4c24:89d8:a7a3%6]) with mapi id
 15.01.2507.039; Thu, 24 Apr 2025 12:48:17 +0200
From: =?utf-8?B?Q29ydmluIEvDtmhuZQ==?= <C.Koehne@beckhoff.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>
CC: =?utf-8?B?WWFubmljayBWb8OfZW4=?= <Y.Vossen@beckhoff.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "alistair@alistair23.me" <alistair@alistair23.me>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH 00/21] hw/arm: add CX7200 board emulation
Thread-Topic: [PATCH 00/21] hw/arm: add CX7200 board emulation
Thread-Index: AQHbtQZjL8/xnLpkdUeX1BjxG964Xw==
Date: Thu, 24 Apr 2025 10:48:17 +0000
Message-ID: <b4a0daac7b200e4ffc08879977dbde120a8d5f73.camel@beckhoff.com>
References: <20250318130817.119636-1-corvin.koehne@gmail.com>
In-Reply-To: <20250318130817.119636-1-corvin.koehne@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.17.62.149]
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="=-dWZnBj5kp8IkcOU5sAxi"
MIME-Version: 1.0
Received-SPF: pass client-ip=62.159.14.10; envelope-from=C.Koehne@beckhoff.com;
 helo=netsrv01.beckhoff.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: u3zPIj08+8RD

--=-dWZnBj5kp8IkcOU5sAxi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-03-18 at 14:07 +0100, Corvin K=C3=B6hne wrote:
> CAUTION: External Email!!
> From: Corvin K=C3=B6hne <c.koehne@beckhoff.com>
>=20
> Beckhoff has build a board, called CX7200, based on the Xilinx Zynq A9
> platform. This commit series adds the Beckhoff CX7200 as new board varian=
t to
> QEMU.
>=20
> The emulation is able to successfully boot an CX7200 image. The image inc=
ludes
> some self tests executed on every boot. Only the cache self test fails du=
e to
> QEMU emulating the cache as always being coherent. The self tests include
> f.e.:
>=20
> * Network
> * Flash
> * CCAT DMA + EEPROM [1]
> * TwinCAT (Beckhoff's automation control software [2])
>=20
> [1] https://github.com/beckhoff/ccat
> [2] https://www.beckhoff.com/en-us/products/automation/
>=20
> Corvin K=C3=B6hne (1):
> =C2=A0 MAINTAINERS: add myself as reviewer for Beckhoff devices
>=20
> YannickV (20):
> =C2=A0 hw/timer: Make frequency configurable
> =C2=A0 hw/timer: Make PERIPHCLK period configurable
> =C2=A0 hw/dma/zynq-devcfg: Handle bitstream loading via DMA to 0xffffffff
> =C2=A0 hw/arm/zynq-devcfg: Prevent unintended unlock during initializatio=
n
> =C2=A0 hw/dma/zynq: Notify devcfg on FPGA reset via SLCR control
> =C2=A0 hw/dma/zynq-devcfg: Simulate dummy PL reset
> =C2=A0 hw/dma/zynq-devcfg: Indicate power-up status of PL
> =C2=A0 hw/dma/zynq-devcfg: Fix register memory
> =C2=A0 hw/misc: Add dummy ZYNQ DDR controller
> =C2=A0 hw/misc/zynq_slcr: Add logic for DCI configuration
> =C2=A0 hw/misc: Add Beckhoff CCAT device
> =C2=A0 hw/arm: Add new machine based on xilinx-zynq-a9 for Beckhoff CX720=
0
> =C2=A0 hw/arm/beckhoff_CX7200: Remove second SD controller
> =C2=A0 hw/arm/beckhoff_CX7200: Remove second GEM
> =C2=A0 hw/arm/beckhoff_CX7200: Adjust Flashes and Busses
> =C2=A0 hw/arm/beckhoff_CX7200: Remove usb interfaces
> =C2=A0 hw/arm/beckhoff_CX7200: Remove unimplemented devices
> =C2=A0 hw/arm/beckhoff_CX7200: Set CPU frequency and PERIPHCLK period
> =C2=A0 hw/arm/beckhoff_CX7200: Add CCAT to CX7200
> =C2=A0 hw/arm/beckhoff_CX7200: Add dummy DDR CTRL to CX7200
>=20
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 7 +
> =C2=A0hw/arm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 =
++
> =C2=A0hw/arm/beckhoff_CX7200.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 440 ++++++++++++++++++++++++++++++
> =C2=A0hw/arm/
> https://nospamproxywebp.beckhoff.com/enQsig/link?id=3DBAgAAACF1PqAcgZXNGo=
AAACSdE
> 7DUYKKiipqQsJl32BC_vIVe3kQ23Cr-DKSrQn5Y_I0ZnsAu8qZHVUsGVmYwKL0amQboD-LYv9=
rWN-
> mvEPUf2y-CZ1qrggzKI9xgbKnOi8XSPZVd2G0Lro-8fGR9tAuNB-3CWjEaKli0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
> |=C2=A0=C2=A0 1 +
> =C2=A0hw/dma/xlnx-zynq-devcfg.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 36 ++-
> =C2=A0hw/misc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
> =C2=A0hw/misc/beckhoff_ccat.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 365 +++++++++++++++++++++++++
> =C2=A0hw/misc/
> https://nospamproxywebp.beckhoff.com/enQsig/link?id=3DBAgAAACF1PqAcgZXNGo=
AAACSdE
> 7DUYKKiipqQsJl32BC_vIVe3kQ23Cr-DKSrQn5Y_I0ZnsAu8qZHVUsGVmYwKL0amQboD-LYv9=
rWN-
> mvEPUf2y-CZ1qrggzKI9xgbKnOi8XSPZVd2G0Lro-8fGR9tAuNB-3CWjEaKli0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
> |=C2=A0=C2=A0 2 +
> =C2=A0hw/misc/zynq_ddr-ctrl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 331 ++++++++++++++++++++++
> =C2=A0hw/misc/zynq_slcr.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 47 ++++
> =C2=A0hw/timer/a9gtimer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 25 +-
> =C2=A0hw/timer/arm_mptimer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 33 ++-
> =C2=A0include/hw/dma/xlnx-zynq-devcfg.h |=C2=A0=C2=A0 3 +
> =C2=A0include/hw/timer/a9gtimer.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +
> =C2=A0include/hw/timer/arm_mptimer.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> =C2=A015 files changed, 1309 insertions(+), 11 deletions(-)
> =C2=A0create mode 100644 hw/arm/beckhoff_CX7200.c
> =C2=A0create mode 100644 hw/misc/beckhoff_ccat.c
> =C2=A0create mode 100644 hw/misc/zynq_ddr-ctrl.c

Hi,

any feedback for those commits?


--=20
Kind regards,
Corvin

--=-dWZnBj5kp8IkcOU5sAxi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEgvRSla3m2t/H2U9G2FTaVjFeAmoFAmgKFu8ACgkQ2FTaVjFe
AmrBSw/9FGDPspzlsktW2OoOz7QWgjMNB5OhilUIe3K/whhC6l/zTLygOo134Kl9
RFL8wmWwPWdCc7PZR/npjZmTktA4oGGt5rgyIMMd5hhH3n8Bt2HjHMOCjMiDU8C+
lcNYNKGYXAXFHeHFh4QZnuC8E0zkGUrrci0nduD8YDPWTZ47qx7Ji/hOXx/nTcL8
9N/kXM/d5sJ5XwA3nttcz7gV2ZGEi1M+ocQHKIXLWd9PSbkj4dgVp6cE/YHircbC
pz8EVDXGtWIAsVw5H27jx4xS/lF1Uhu+DHCI0UJUy5FxLgcESg/nNG1ozqge75Xx
Jv+s+UUAdcZJJBECbWDYSw7Nagwjx43oP1+pMlGYuOx8H8lx4XP4N+SM7k/WRgHr
E7Hgc/FrDLTAikdkmb9v86Gpt1z4pB6+VSgKUIiM8Oi6esJpCm1VHY3UVsy+BHBD
ezhnaXUVn3TcPPnHWD2NcH+qgqJ+kIY5KvGawKnG8eOdVEm1edmX5JFKFAJHMteM
WvUqhvM4ov6XcBXg3VHV7n/BtZ6X3G4HPM0J3BnWmmE5Ke8+r04rFAo4L+SM/8Jp
LTqqt3gzscVrKPDQrd4e/3O6JoznrCtSkWbBS1PVxskBYg1cZmdQZaQVXYdtP57R
uCZ1pQNsH6y795S0J3ZlDYhOZLc0/EzfdmcoTu1Y7a5KLKmFA8w=
=a8lj
-----END PGP SIGNATURE-----

--=-dWZnBj5kp8IkcOU5sAxi--

