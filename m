Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4500270lfg;
        Thu, 27 Feb 2020 06:13:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqxnjjcHgeof0jOEvXf6/6bDusM3/jczFofuyw58FQGj/UF16prkHv14vnjpkdiYCessD8+0
X-Received: by 2002:a25:5e87:: with SMTP id s129mr3736732ybb.231.1582812800707;
        Thu, 27 Feb 2020 06:13:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582812800; cv=none;
        d=google.com; s=arc-20160816;
        b=KU4c3Yhpnc2NFpmO5jX6Dyzf9Wn0eU+lBuMeUIkIspoctZ4imA1XSSDRFFnW1xnh2R
         UdbyfEq9XoYRxS6LsotEWP18lFBRgEcoMwtI2RKTvpGlA7HvSMAFJoakm9JB5T6RQdEc
         kQna4xEQPdU8AlGOGYp2K/ND9o/P3XfOkTpfxgvK+M51svRHMoFzIWlSXGl13mQlKLYD
         QmvHAWt1nI6fmPw+G90sZgQE8PHJmsDlSI/HPoUz/YAcROm8qBCl3vjPIvxOOgVeKl2f
         0V+B9VPPUy3hk6GgpRpFOiT6aXi75QE+7b3q5kecsGNI9CRP8D/TSsNvQz72ohD8/BCU
         yPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=+eWiKI/VVlEEq63rGQvQJ+kE6pcSeHfnXA0xz1Tbp8k=;
        b=t2u9Hdur5qRDuzU69unvi+ZThuMnLqloUgd5cXuWL0oHsrdiqGbDUa0+YQ13RUEj3X
         98XEHkHR0A+lbVe8xtJ6SjoznFKyuazyFmwWyQ2BpA1Ygv4xaQnsCojZjKgxmBU7DtpN
         Y5jU9A9iJ1szIlQmc3qmHbSYjh/fewOEum2Yvl3/IiineF4SWlvIboQtN5gkAIMiTGQo
         uTsnrw6WgKnaaLUfE5mD8zjlZwB4wfYsfSrDXQpZr16v/85RC7arsw45G+uF/d3H0oaK
         EEnBLsSwLTg77oPwSIqxzw+/L0gShz/EFk+096qdxwkdhyGpsKtA9d0l3Cp/Rw0SkI2k
         hC5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AbL5Kcve;
       spf=pass (google.com: domain of imammedo@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id i6si1263751ywm.308.2020.02.27.06.13.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Feb 2020 06:13:20 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AbL5Kcve;
       spf=pass (google.com: domain of imammedo@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582812800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+eWiKI/VVlEEq63rGQvQJ+kE6pcSeHfnXA0xz1Tbp8k=;
	b=AbL5Kcve3GB4aIKy5FfNe2oRVra6ceZ72iwnLMMLG/ikQNAQk9GsGIOAF8cwaSCEZWOOM0
	/AA6jj40LHlXiSw+Yzp1+qBF/kgKQ424D+cDfnmcNc2e8MF/BxkTgz0qo1X6vBWlwMncTE
	qd/cW6JtlNPTss4FdOpZjF0N0Ur+k1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-eYHn4upUMDquFVFqigMpTw-1; Thu, 27 Feb 2020 09:13:18 -0500
X-MC-Unique: eYHn4upUMDquFVFqigMpTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC73518C8C01;
	Thu, 27 Feb 2020 14:13:16 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 823C96E3EE;
	Thu, 27 Feb 2020 14:13:15 +0000 (UTC)
Date: Thu, 27 Feb 2020 15:13:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, Laurent
 Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v1 4/4] accel/tcg: increase default code gen buffer size
 for 64 bit
Message-ID: <20200227151313.7b2f188b@redhat.com>
In-Reply-To: <56f5e355-9357-e212-e92b-9db1d8424dea@linaro.org>
References: <20200226181020.19592-1-alex.bennee@linaro.org>
	<20200226181020.19592-5-alex.bennee@linaro.org>
	<2ca7b55b-5674-370d-5c4d-dc8b7782ca64@linaro.org>
	<87pne0w6rt.fsf@linaro.org>
	<56f5e355-9357-e212-e92b-9db1d8424dea@linaro.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: R32FR9/obmsM

On Thu, 27 Feb 2020 04:56:46 -0800
Richard Henderson <richard.henderson@linaro.org> wrote:

> On 2/27/20 4:31 AM, Alex Benn=C3=A9e wrote:
> >> It does not make sense for a linux-user chroot, running make -jN, on j=
ust about
> >> any host.  For linux-user, I could be happy with a modest increase, bu=
t not all
> >> the way out to 2GiB.
> >>
> >> Discuss. =20
> >=20
> > Does it matter that much? Surely for small programs the kernel just
> > never pages in the used portions of the mmap? =20
>=20
> That's why I used the example of a build under the chroot, because the co=
mpiler
> is not a small program.
>=20
> Consider when the memory *is* used, and N * 2GB implies lots of paging, w=
here
> the previous N * 32MB did not.
>=20
> I'm saying that we should consider a setting more like 128MB or so, since=
 the
> value cannot be changed from the command-line, or through the environment=
.

That's what BSD guys force tb-size to, to speed up system emulation.

>=20
>=20
> r~
>=20
