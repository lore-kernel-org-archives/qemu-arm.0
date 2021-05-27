Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp260056lfm;
        Thu, 27 May 2021 04:34:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxSLEv/Bx19qHQl1pZo4bLOA4oM74j8zavY0m9uXgqYb5cA1h1waaoH5hR9WDkIxAr7mSk
X-Received: by 2002:a67:ce81:: with SMTP id c1mr1772420vse.28.1622115277643;
        Thu, 27 May 2021 04:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622115277; cv=none;
        d=google.com; s=arc-20160816;
        b=W8sX9Fx+mxxkxBoSBwSAC4TWklnQjGvZkDxLyjqCPumbDlbrAa3jN033kg+iQCFmeX
         W5UO+1z0rzhwj4ZLaX2dNiL8ulz4on2NwmWxHTSepKH5VtFM8pO8txEnrQRV4IHzHSrY
         lrrsUAF8ns9xSMinmSpz+xYRDKe08+F0po5bUReaUII+/RLNgcMPTbPqFqBs7Yl91Y7K
         4cqvttqcjJx+cbMCSngU3/bOcIrPP1KqrpT2PKI5yktxqsmNuW4NVwvtgqT/WxuXquz1
         uoWJcvWduZGZGURHIQZfFpjqOtYhFy5Nyvd/AmqQVbldrQ0+gEzyff6M5zrCQi6FCOIc
         oiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=wmxSe8v2qPIoeyzzBGhE9ZXkgNTvLmx82gOuIv7gadY=;
        b=tHa87mWCXEBdhogMIalkaI17jM8AaiHMiR60c4mZVjYYpOa4hRkLPL1jI0PVGYe5Vq
         ubhDD72+1dkVT3sqnIrejHxkU7xINg7ice+FjYudK8A2mEvKT4aaEpr9XT9sr1/Txhkf
         nEv/bMsqSL1a2D4rgjU4jeFyzqEAXKpJsLxjljpvnDay75q1fUngb0LtXdgTP7suIQb9
         W7a6J8W9o/fdU6YGQa6YmVfkqI2d4wQ1A/zc/amPsZmGVssfsQnOW8nfCiC5cqIQlqCd
         N5vD+ScssjsocATK5lhmqHIHXzFGp/WWMKPS6Jx6PJQEpbZOVXukb3f7cJ//CFFQKvhM
         2TZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GBcF1SNy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13si731433vse.393.2021.05.27.04.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 May 2021 04:34:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GBcF1SNy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lmEHc-0003pp-Vn
	for alex.bennee@linaro.org; Thu, 27 May 2021 07:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmE4Q-0006KU-8r
 for qemu-arm@nongnu.org; Thu, 27 May 2021 07:20:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lmE43-0002FD-9e
 for qemu-arm@nongnu.org; Thu, 27 May 2021 07:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622114429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wmxSe8v2qPIoeyzzBGhE9ZXkgNTvLmx82gOuIv7gadY=;
 b=GBcF1SNydKMm7R3misMeDeaP8VCBUXyrsurSd40R0OU7kKLuFAt2u26aqCEey0VoIOFG8y
 b3i3/uQcE4Du+K/WgAJibEC8COX1Uvv1vGJ/uOc2k+IiBW/eQ38ZPRDltD+uK5MdSIOv95
 /o/OMA/eGWZQHTy7p8ujqUia97D2eB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-kCryELIGMaG2_FJTRSZINg-1; Thu, 27 May 2021 07:20:25 -0400
X-MC-Unique: kCryELIGMaG2_FJTRSZINg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1624A106BB33;
 Thu, 27 May 2021 11:20:24 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABB39687D7;
 Thu, 27 May 2021 11:20:23 +0000 (UTC)
Date: Thu, 27 May 2021 13:20:22 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v8 16/19] hvf: arm: Implement PSCI handling
Message-ID: <20210527112022.iwosfhwemlwsxlre@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-17-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-17-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qxr7svkp6aqmzl3t"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2/pdSRvTtCI7

--qxr7svkp6aqmzl3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:50PM +0200, Alexander Graf wrote:
> We need to handle PSCI calls. Most of the TCG code works for us,
> but we can simplify it to only handle aa64 mode and we need to
> handle SUSPEND differently.
>=20
> This patch takes the TCG code as template and duplicates it in HVF.
>=20
> To tell the guest that we support PSCI 0.2 now, update the check in
> arm_cpu_initfn() as well.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>=20
> ---
>=20
> v6 -> v7:
>=20
>   - This patch integrates "arm: Set PSCI to 0.2 for HVF"
>=20
> v7 -> v8:
>=20
>   - Do not advance for HVC, PC is already updated by hvf
>   - Fix checkpatch error
> ---
>  target/arm/cpu.c            |   4 +-
>  target/arm/hvf/hvf.c        | 123 ++++++++++++++++++++++++++++++++++--
>  target/arm/hvf/trace-events |   1 +
>  3 files changed, 122 insertions(+), 6 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--qxr7svkp6aqmzl3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvgHUACgkQ9GknjS8M
AjXAqQ//bgikQsfVLi0kkAWrkgug7TnpvAlVBXi/LCdIFwhmyiq9o1PIxsFmFjES
Tj1ey6uWRs/z2YAMKk/Ben/nmlhSIAYeM0jlIgMSJCd24xhyFlwD0AjdeZTLwobn
+QHV0jROv+y2HN59xADZNr6OUSsg7MdMex4JgKZgrUbMKJc6haLCqtZIicHs31Hx
Fz/iY2c8rQzWU9HNeaIjOg2v6/q+DTiYhHdFGwRDpsbY4ZSgpWoKTuNXqXNHMBzM
NZZPJcWprHqqfOFXRPcDqZ8An7uT0zGVttZSi2Zh2xn9UQ3DYx1ZQRq05l9oOruP
97r0C2MR1UKzQzxhs4IryEakfPMIoNGOLKSgRrJ4Md4g87DM5yrPCS/D3IMt2pPB
Li5AN1LxCMh+77gZLgrxWWldPgj9W6ZoGalpRrPIc3IKO2H5sCII2A6RDHHtQof3
VK6EKUGjhfpab3URDX2Ik4goF5rsm3vgR2CO7h6sOWFGKO8cZOErqosuLyd6azoz
H4J1BGC4T6WyI8zShZHE+itxefVYufCG1eJcvV19xHltUSftAoaF1LVy8bb3Mzig
i6etM8lYJdybGN1VTFDIOW4fNqxXIpE/ZiSGIekbPXdMCLLztEbkd7PgYgDKVXzm
5u8GrpDyiU/RuUS4P3q1cFrqPjQwXeEMAv1G1h/ZBlEVVper+4g=
=7AJU
-----END PGP SIGNATURE-----

--qxr7svkp6aqmzl3t--

