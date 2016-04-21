Received: by 10.159.53.12 with SMTP id o12csp145291uao;
        Thu, 21 Apr 2016 07:07:17 -0700 (PDT)
X-Received: by 10.55.82.6 with SMTP id g6mr20851922qkb.40.1461247637607;
        Thu, 21 Apr 2016 07:07:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m4si466991qkf.67.2016.04.21.07.07.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Apr 2016 07:07:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atFGH-00074o-6j
	for alex.bennee@linaro.org; Thu, 21 Apr 2016 10:07:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylgar@gmail.com>) id 1atFGE-00071i-SV
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 10:07:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sylgar@gmail.com>) id 1atFGB-00080v-GX
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 10:07:14 -0400
Received: from mail-wm0-f42.google.com ([74.125.82.42]:36333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylgar@gmail.com>)
	id 1atFGB-00080V-A1; Thu, 21 Apr 2016 10:07:11 -0400
Received: by mail-wm0-f42.google.com with SMTP id v188so246354185wme.1;
	Thu, 21 Apr 2016 07:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=RGGCj+gtmWpPS7PoqLq2oCLqzUKS1avHEYYrZUBYSbE=;
	b=G7P2Urm1EuON5qDc1emjw04heg/xuBaXZspSU7/SGeeCHP4kcZfx1shts80GI55Q0W
	mifrGYu+DCy/QeNtATmH5FzWcIfZj4ZLVwU95hpgZpNFmYgr5nU8NtkRwKY36xfjgNth
	bXdSIWvM7t1l1+kK3TB6uhAmOIG5V5nyp2ONmwOT77ypPGpILF3qeN87txH5rzF9MD11
	+2q92qTp+xvIq3wB/1fdU9rZDRgi0tXh/MiIMcS48P/VBUsdMhlNu1NaJG80fY0hU2he
	xy3UKlB6DK1pUcExxihJ0AoQhTqt1zDNujkzINTFwM9dEbTVrKBHsJA4J/kpyj5VDlOf
	F91g==
X-Gm-Message-State: AOPr4FXK3zbOxalE0qiNEB3ND/AU4PaDJ9/8j0G5PL1XSIIWatxC8pVmZoFGND9C++iJFw==
X-Received: by 10.194.92.163 with SMTP id cn3mr14761832wjb.3.1461247630745;
	Thu, 21 Apr 2016 07:07:10 -0700 (PDT)
Received: from [192.168.0.10] (plr75-1-82-226-218-68.fbx.proxad.net.
	[82.226.218.68]) by smtp.gmail.com with ESMTPSA id
	h124sm3443897wmf.7.2016.04.21.07.07.09
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Apr 2016 07:07:09 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
In-Reply-To: <CAFEAcA-yDZKEgZfFmtgn3+j3qCKo_zUJwp40BRERF4rF-tjASw@mail.gmail.com>
Date: Thu, 21 Apr 2016 16:07:08 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <DED29353-D9CE-45F5-990F-0A32DB57B4AE@sylvaingarrigues.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<CAFEAcA8mLk+3t+ypR96WPG9yMsvbJ4hmgk1NwfxPLHzk0R=Dwg@mail.gmail.com>
	<DD3027E2-6F96-4D87-B2C5-02E9926AA402@sylvaingarrigues.com>
	<CAFEAcA_nE2Ee_Ky+upz4veasmkyiVSHqyUe2-brtfopJA2-=_g@mail.gmail.com>
	<A03258E3-4CFE-49F8-8601-1467CD70AC29@sylvaingarrigues.com>
	<CAFEAcA-yDZKEgZfFmtgn3+j3qCKo_zUJwp40BRERF4rF-tjASw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3124)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.42
Subject: Re: [Qemu-arm] [PATCH] bcm2835_property: use cached values when
 querying framebuffer
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
Cc: Markus Armbruster <armbru@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZrGhIuY/v+ng

Le 21 avr. 2016 =C3=A0 15:42, Peter Maydell <peter.maydell@linaro.org> a =
=C3=A9crit :
>=20
> There may be something we can do here to make FreeBSD's life
> easier, but we definitely can't do it on the eve of a release.

I didn=E2=80=99t know it was release day, my timing is not perfect then, =
sorry about that, I didn=E2=80=99t intend to put stress on you guys =
today.
Like you mentioned, the Linux boot protocol doesn=E2=80=99t mandate any =
loading address, hence the possibility to set it on the command line.=20
It would benefit not only to FreeBSD (which is strictly Linux boot ABI =
compliant BTW - that is how I found the qemu bootloader bug and fixed it =
in b4850e5) but all other OS.
On the real hardware Raspberry Pi, there is the kernel_address firmware =
feature which enable to set the kernel load address. Would be neat to =
have it *someday* in qemu for any board if it is not too hard to =
implement.

>=20
> FWIW, I agree this is a bug fix; it's just that we're hours away from
> tagging the final RC for this release cycle, so the bar for "is this
> bug important enough to put in now?" is quite high=E2=80=A6

Again, I didn=E2=80=99t know about the timing. Indeed it is a bug but I =
let the team decide about including it in this release. Personally, I =
don=E2=80=99t care :-) (apart from my own ego being able to say =C2=AB I =
contributed to making this release compatible with FreeBSD =C2=BB)

Cheers,
Sylvain.=
