Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp205949lfm;
        Thu, 27 May 2021 03:19:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkmC09lES325Q8qDh/yjlng9sNQsvs81ok9BmrzqOAAzZ/3w3SZrePXQKvJztS13vmsezm
X-Received: by 2002:aa7:cb8d:: with SMTP id r13mr3301348edt.184.1622110747145;
        Thu, 27 May 2021 03:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622110747; cv=none;
        d=google.com; s=arc-20160816;
        b=FA9DctykG316DfcnDDW7dQITO8Nj2FK6i265W6QlqMAOmvZnhZVY5SqTOPsTTdV8Rt
         IUXwWsaQsjWqw7ojk2I8QOmH6sg3Q3OfXXig/a39RcNnhkDo7S2FYE5jMTXRRdK9N+0Y
         Dng4nhoUgE6YHcu3tnRrDkA+XD9TYjNWPL9vF2uEAulCg7ZV6Ukzz+MTyLAPpq0lCD4R
         fBRVRlsDHcnsdsgfs4Rx5qcL6fULGlvjKUXH8lxDZbgE2xzoLdBbx3beJDuo7pkBy+O2
         w7zn5QGFKYoevJd7Gu/7tbuR+xpRgN7LhxsIg2GJckPfF2L9vCDVmkvJ27CaXTV5lM3T
         5ekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=0KT12i/Kxfgs5CSiVHh1x7qw/XzpWD70m3h1QsjLRqo=;
        b=abI1LoSo7AB9EuXl+hOSV/8qY5H+mC8Q9uitJNkDYuYVweuy7nkdBM0Z9+9ZBZgE9A
         AbkUnRp4iL7R68XOgxD/mIwQ/6kKLWeeDbeKshCKia14cS2TVau7A//VT63fhvZ3bzI3
         2WghJ3VTgymwsUcU9GJcbN0X/lFMFGxr+IPRMQI/a0BpHHQLr4LxJ3Y612P+RPDMkVwK
         TYgxSQiWTsIHLarkMdHABNmf2jz4BF4isktcMQb89DPFX+CPj3R60YGLT1LMCDyAGBvB
         9aijrZkrHckGA0mjaAIT5WSBKOpdbE0/WP18FjVRx1pmvKLUalIdj/sWfI9XC2Vu/hdH
         mK/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y8FSk42A;
       spf=pass (google.com: domain of slp@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=slp@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <slp@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id j23si1625481eds.79.2021.05.27.03.19.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 May 2021 03:19:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of slp@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y8FSk42A;
       spf=pass (google.com: domain of slp@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=slp@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622110746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0KT12i/Kxfgs5CSiVHh1x7qw/XzpWD70m3h1QsjLRqo=;
	b=Y8FSk42A4k4M8fM9Nd+c/w7dRvkm7CtnRI2XLz1jdgfk6l/7OxRVhu1+yWPRx3jwmvsHFF
	iXrDcgut0V1ptUvN9sXN/AXiKQzhY5pUPOBIXsynZoYGhPxEuTIGfbEuLGf/lJ1ptooMbU
	YWud5vOPxjnWqUEzWmPSgStchwsyB3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-6ejCAaGrMC2HdRzFm5e15g-1; Thu, 27 May 2021 06:19:02 -0400
X-MC-Unique: 6ejCAaGrMC2HdRzFm5e15g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66EA6800D55;
	Thu, 27 May 2021 10:19:00 +0000 (UTC)
Received: from localhost (unknown [10.33.36.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1A265D6D3;
	Thu, 27 May 2021 10:18:59 +0000 (UTC)
Date: Thu, 27 May 2021 12:18:59 +0200
From: Sergio Lopez <slp@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH v8 11/19] hvf: Introduce hvf vcpu struct
Message-ID: <20210527101859.qbzygjnu7lw65s45@mhamilton>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-12-agraf@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <20210519202253.76782-12-agraf@csgraf.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="joreco4mdd7ktila"
Content-Disposition: inline
X-TUID: ObOVrWgiAYYZ

--joreco4mdd7ktila
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:22:45PM +0200, Alexander Graf wrote:
> We will need more than a single field for hvf going forward. To keep
> the global vcpu struct uncluttered, let's allocate a special hvf vcpu
> struct, similar to how hax does it.
>=20
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Reviewed-by: Alex Benn=E9e <alex.bennee@linaro.org>
>=20
> ---
>=20
> v4 -> v5:
>=20
>   - Use g_free() on destroy
> ---
>  accel/hvf/hvf-accel-ops.c   |   8 +-
>  include/hw/core/cpu.h       |   3 +-
>  include/sysemu/hvf_int.h    |   4 +
>  target/i386/hvf/hvf.c       | 104 +++++++++---------
>  target/i386/hvf/vmx.h       |  24 +++--
>  target/i386/hvf/x86.c       |  28 ++---
>  target/i386/hvf/x86_descr.c |  26 ++---
>  target/i386/hvf/x86_emu.c   |  62 +++++------
>  target/i386/hvf/x86_mmu.c   |   4 +-
>  target/i386/hvf/x86_task.c  |  12 +--
>  target/i386/hvf/x86hvf.c    | 210 ++++++++++++++++++------------------
>  11 files changed, 248 insertions(+), 237 deletions(-)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--joreco4mdd7ktila
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmCvchIACgkQ9GknjS8M
AjXWxA//ZIjjeH3sojG83rQdUqubQLoml+GCB2XyZTyeYEABaiqZV3sCYHS/Qtsy
K4fwbxKvIiND06YZui1MG0pBZzsNw6gdNX/baoF0ELdaUlSjDfGj2Z3qWmm/DuPO
fqLz+iSue0ZZqisecsQF48VI+EvBvRlqH4ePp7HedLY65w3v9leCBCr1CbBnAUrM
jkiLhH8cCWGgObeZnGJWSCpReACmNjM2hDUkIAraO7SRIU/eunOVUbtnNFR0LD8+
OrcKmRPt6fE/TcJjH6KDkVTPDprietK/fub5KeaS1LibcQyggsbsMrsEcybddCVX
p8NCfIoZG0l1sNU87/mwPzs/YhBfWJtPVxfKz8LZqh+UFgGqiCD26pjXtY5mMOjy
iD1dOwmzt+7x/JhF5vCT8c7gLroKMSkBfDNWJGM7plgoEjLZvZE5j/0yPdcE6VCb
qMptA+OASerpIcHpUkojxfhsEVWvj6b0TGs4a4hHOlXMgv+axUubQ9F7jKRKRK9a
rMnU9T4tNQ83ryQ0UOPQdrmutOX2OBzo5gPOlX1AXFqLN4P4cH3hoZFQJZ8HkuH7
Tg6KdPQkY9ksCqC3QjnfKjB7pukQMIdDTlUg0bP4ltmvgucJIbeHlCdJw7gdrgbR
Nz/ltZde1dsAjeGzokWJ1kQ4DAorQTB63RCWSEiXALEs+TrgWBk=
=rXQS
-----END PGP SIGNATURE-----

--joreco4mdd7ktila--
