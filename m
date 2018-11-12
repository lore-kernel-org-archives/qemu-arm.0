Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3003380wrw;
        Mon, 12 Nov 2018 03:25:55 -0800 (PST)
X-Google-Smtp-Source: AJdET5cJrJNTtovlKB25xM4hyt4mbVaZ9O8jJlfqY6eY9yZPs63PoNX1DxEKD4D1MTtfyuEaBLiL
X-Received: by 2002:ac8:12cc:: with SMTP id b12mr473826qtj.90.1542021955002;
        Mon, 12 Nov 2018 03:25:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542021954; cv=none;
        d=google.com; s=arc-20160816;
        b=WbD0qr5GDDOnDftWaFLLnxiF2XMA8r7MfnJ5k0jJmjmmt+fMa22KjlhSnJKf5FsAOZ
         0b4snZAaxopZC7YNAuLouNXD7lc3N7yG958N0wf+3ecMfw+JaXeIu1Ub+0zlVsbdppfn
         uD8bicxWtw+wJzDARci8q49XYwFpt+7joyw6Ad0YihqDe21Qs6AXWd0AOkyt9uNzn5X/
         y4LvpFwSzrvx7MXBml6MDoipxtFdfQ28eb/2jOnDpMmtFGKqa9qi8BjxsaClUnapaXJ6
         Z/mVfN6tr+U9dciPxoAGR0YJrFxcRB30YAEGYhByOl4hwcBYdQnrXmsiSqdt4DaZJA8W
         q1yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=8VNJb6Xtwi32L3KUl9oHN/1nEoBm1Q3WgJGNP72JhUo=;
        b=XwwYes4HMxc+z0PE/jbjYr8DBm3Hj9Y7LZrv2u0z/rByDLJhZ9A5GMKaa/bbi/vwu9
         Gzr88WHi2Yp+GfRFqGF2ZpprdBrybInL1McZa3fffHt026AZGP7uAHwSB3SlnyWGgN5f
         NJcsFxJhZjZ8m3a/tkMks6JJNRFIV24MduOsP2kzEX2+QKIO0bcfCWcZBTe1+ZXCHIUX
         ym6fmY4I3KapqLpYLnLUjaB4Bs6nepqX4OUfO3TPznDvDaLdr5f49UaL6bfkxpoRA5b3
         4wvepSZUPUMTawdj41EKNrGXFmWCJBRdxUSrGV8Rxr2IDFNT3cwN6d/GKzEfXplmQ/Lu
         m9LA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b1-v6si7305761qkf.142.2018.11.12.03.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 03:25:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMALq-0006yV-FL
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 06:25:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gMALi-0006yQ-Rw
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 06:25:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gMALh-0005It-3t
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 06:25:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43224)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gMALg-0005Eq-Mx; Mon, 12 Nov 2018 06:25:44 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A7BB8046F;
	Mon, 12 Nov 2018 11:25:33 +0000 (UTC)
Received: from localhost (ovpn-117-45.ams2.redhat.com [10.36.117.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 217DE5D738;
	Mon, 12 Nov 2018 11:25:29 +0000 (UTC)
Date: Mon, 12 Nov 2018 11:25:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181112112529.GE21380@stefanha-x1.localdomain>
References: <1540495397-88089-1-git-send-email-peng.hao2@zte.com.cn>
	<1540495397-88089-4-git-send-email-peng.hao2@zte.com.cn>
	<467e77d8-48af-5361-3e31-b9eac79d968d@redhat.com>
	<CAFEAcA-tkcsCFXQZmZyqLDXQKvXX9Am0dgNviVw=Ccq6tX+w_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JBi0ZxuS5uaEhkUZ"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-tkcsCFXQZmZyqLDXQKvXX9Am0dgNviVw=Ccq6tX+w_A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 12 Nov 2018 11:25:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V4 3/5] hw/misc/pvpanic: Add the MMIO
 interface
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peng Hao <peng.hao2@zte.com.cn>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CuAQT8zC2tzd


--JBi0ZxuS5uaEhkUZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 08, 2018 at 09:38:54AM +0000, Peter Maydell wrote:
> On 25 October 2018 at 12:38, Philippe Mathieu-Daud=E9 <philmd@redhat.com>=
 wrote:
> > Depending of the response to Peter's question [*]:
> >
> >     I'd also like some confirmation from folks more familiar with the
> >     current state of the art in guest-to-management-layer communication
> >     that pvpanic is still the recommended way to achieve this goal,
> >     and hasn't been obsoleted by something else.
>=20
> Paolo? Stefan?

Sorry, I've never followed pvpanic and don't know what the current
approach is.

Stefan

--JBi0ZxuS5uaEhkUZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJb6WMpAAoJEJykq7OBq3PI5JIIAJNzzZkkjQl4IfnXBnq8rrFn
GmZ0WFmKyxvlwSi3NVlfcgIJhcBa2u6T8QlQNhAHLBcjBr3PNkK/3dHgNbyqqmm7
Ds0Q0//1M+7H14BxlpQ8SqXUbz0jVsM87R/IBOTU3xMVz0GFFyK7MfX8WhA+Kzb5
mDEiEpu5pE+L2ipYlNxK02Ur2lIDW5soixhaF70Nl5NjPi832W2Xe17KZEg+6R4L
VCkq5k7U0GEn66CAYoCBiP4vD6ur8pjto3dMDirXV/gZ8oAgLXXS17rJCylsPv7r
je8ORnZXA8xvyd8Pphu4BDcd4HP9QnrGjYx1tRXfK0qvbxRIwVo0+zB5qRabhXo=
=OrZg
-----END PGP SIGNATURE-----

--JBi0ZxuS5uaEhkUZ--
