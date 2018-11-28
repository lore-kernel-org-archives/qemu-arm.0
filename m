Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1276776wrt;
        Wed, 28 Nov 2018 08:58:36 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U2/Um2bPitvQ+Sk4Xc+WH2aEg/KwygBwfRyZ/3GfrXvHU8UOj6scezIntpRGzJv/8V66cx
X-Received: by 2002:a25:83c3:: with SMTP id v3-v6mr38473051ybm.44.1543424316254;
        Wed, 28 Nov 2018 08:58:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543424316; cv=none;
        d=google.com; s=arc-20160816;
        b=GxPmTqQ3myO5zS34Vao7uhHHXyhkJVh3B+fqslEmopV48rdA2ue0Kg/tLwnmoXenoH
         th8uIQ2gurN/8G/SnBMZCDX0wp6chee51nmL3gPPJ3OE9DGyLbDof8I2UjjdPWCzgssr
         3OgwdUWz2QD9UwHBBlCgOOIAC1rs5/jbIvxsD0RKvYatlPYvupKbtj54FAnmI73dGH6t
         QhuKykv1tIeDhoVEk+uGC3DU2b3gk1FWxkdzZ6Pp7KjigXlWAfm+MD6j3rfmwA+m9N1R
         5efoNw15o8z1qCb4lSaNm7DZYbZ6iFMdI44VMdDB6n6FKhZgmdOwEbigXolLE1kI1bdB
         flyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=BwoiShGARSCvRQKL1M6E1OHcxhWMiCyej/bBC+TzxFw=;
        b=irkUhoXYGsuKQc3g/h6PaG0ktSeT4jf9ghwV65V54/OWtTP3GB5vg9a0hklLell7NR
         M7vq/+X0Yys7E7FFwUrtnzIFN/QS/ao/cAylgxgriuyI6jqQWZIy4TDRykfsMneF42xa
         gp4LKsuLWldKyon4baViLoi+Io4bx4uPvwgv0yQyA19RPsKv4iTgh8O9X5OoT7LLyHEf
         pMn47fFUodkExgZVlvluD1SJjwi6oNQXtQNMXyxSgPN9zpfXa7kq37ZbPctmCrLFao9r
         Q/yVWG944nVz+/FFCGIBkrZrKO68veKHryM90fLm0ssFsO1oV8lM7RviNZn4cCKDoUa0
         07dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u130si5224828ywu.26.2018.11.28.08.58.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 08:58:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gS3AZ-0005iu-LO
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 11:58:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gS3AI-0005hB-3S
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 11:58:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gS3AD-0001YI-Tc
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 11:58:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35310)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gS3AB-0001Pv-T3; Wed, 28 Nov 2018 11:58:13 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 027263083393;
	Wed, 28 Nov 2018 16:58:08 +0000 (UTC)
Received: from redhat.com (ovpn-112-68.ams2.redhat.com [10.36.112.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A06E19754;
	Wed, 28 Nov 2018 16:58:06 +0000 (UTC)
Date: Wed, 28 Nov 2018 16:58:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20181128165803.GT24355@redhat.com>
References: <1543399094-2260-1-git-send-email-thuth@redhat.com>
	<20181128160525.GP24355@redhat.com>
	<3d95da16-5f2a-2ec8-a674-189b44eab222@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3d95da16-5f2a-2ec8-a674-189b44eab222@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 28 Nov 2018 16:58:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1?] target/arm/sve_helper:
 Fix compilation with clang 3.4
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +9xCBpYfCmUt

On Wed, Nov 28, 2018 at 05:50:38PM +0100, Thomas Huth wrote:
> On 2018-11-28 17:05, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Nov 28, 2018 at 10:58:14AM +0100, Thomas Huth wrote:
> >> Clang 3.4 does not know the "flatten" attribute yet. We've already
> >> introduced the QEMU_FLATTEN macro for this in commit 97ff87c0ed020c2=
,
> >> so use this macro now here, too, to fix this issue.
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >=20
> > Although we currently only aim to support CLang and GCC, we don't hav=
e
> > any checks for a minimum version of these two tools in configure.
> >=20
> > So I was wondering if we actually still need to support CLang 3.4 at =
all
> > in QEMU, given our targetted build platforms.
> >=20
> > Unfortunately repology.org is failing me in reporting clang versions
> > for most distros, so I don't have an answer yet. I do see that Debian
> > Jessie however ships clang =3D=3D 3.5 and that's usually the oldest d=
istro
> > if RHEL hasn't got something older.
>=20
> I'm using RHEL7 and the clang that I get "for free" is 3.4.2 via EPEL.

Hmm, raises interesting question of whether we should consider 3rd
party repos for purposes of determining our min versions.

I'd pretty much intended to only care about vendor provided repos,
in which case RHEL7 would be considered to lack clang, for purposes
of deciding min versions.

EPEL is a bit murky because while it is a 3rd party repo, many users
of RHEL consider to be a defacto standard repo.


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
