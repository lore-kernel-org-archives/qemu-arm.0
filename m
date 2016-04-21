Received: by 10.25.208.194 with SMTP id h185csp175262lfg;
        Thu, 21 Apr 2016 06:15:33 -0700 (PDT)
X-Received: by 10.55.71.76 with SMTP id u73mr20250459qka.6.1461244532988;
        Thu, 21 Apr 2016 06:15:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b26si334248qkj.205.2016.04.21.06.15.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Apr 2016 06:15:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atESC-0005kz-G8
	for alex.bennee@linaro.org; Thu, 21 Apr 2016 09:15:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylgar@gmail.com>) id 1atES7-0005h2-Lk
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 09:15:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sylgar@gmail.com>) id 1atES2-00022k-Kw
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 09:15:27 -0400
Received: from mail-wm0-f53.google.com ([74.125.82.53]:36007)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylgar@gmail.com>)
	id 1atES2-00022g-Ey; Thu, 21 Apr 2016 09:15:22 -0400
Received: by mail-wm0-f53.google.com with SMTP id v188so244298013wme.1;
	Thu, 21 Apr 2016 06:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=y/BqevAooc1LLyDkIBJX/FzlsJracOahVnRJA2JjagQ=;
	b=isVycnxaf/dF6ZUF6BP3ZCk/iKKpwacl1ixsHORK4UkqAfQlBMYAfU/4yBfTqVSKGE
	OyNymaoCsOLwZbAFSFsuiDyLNTMq9bicF/CaYZSXdvseRYybBKSMbCAumnpUXQR+1eAx
	jImeMlOSRSTZJDD38wvwGubR/uNKLwsuN6yHwgDWGYJi0dl8cqif1o8gkb5PBTSAlrzi
	pypA+MHKoVEjwnWrcDY53jfJU9tMBYbt8G+jr5/rW9DU1Rb45JFNkGIbh7QJQ0sM6K2R
	JWLhv2u4+qIK9xOE9leZdMiTZN+ZukAw9CrbpgY7B0MrGa4uDVAee6ydnCJNzUeo3KL0
	xP6A==
X-Gm-Message-State: AOPr4FXBfrS46OZoRtYrdPeBxcFynjZnGANYGv10eklzLyUog6/uUMIJsDYfny2FtHmnZw==
X-Received: by 10.194.103.98 with SMTP id fv2mr15275502wjb.23.1461244521895;
	Thu, 21 Apr 2016 06:15:21 -0700 (PDT)
Received: from [192.168.0.10] (plr75-1-82-226-218-68.fbx.proxad.net.
	[82.226.218.68]) by smtp.gmail.com with ESMTPSA id
	jr8sm2837063wjb.15.2016.04.21.06.15.20
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Apr 2016 06:15:20 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
In-Reply-To: <CAFEAcA_nE2Ee_Ky+upz4veasmkyiVSHqyUe2-brtfopJA2-=_g@mail.gmail.com>
Date: Thu, 21 Apr 2016 15:15:19 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <A03258E3-4CFE-49F8-8601-1467CD70AC29@sylvaingarrigues.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<CAFEAcA8mLk+3t+ypR96WPG9yMsvbJ4hmgk1NwfxPLHzk0R=Dwg@mail.gmail.com>
	<DD3027E2-6F96-4D87-B2C5-02E9926AA402@sylvaingarrigues.com>
	<CAFEAcA_nE2Ee_Ky+upz4veasmkyiVSHqyUe2-brtfopJA2-=_g@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3124)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.53
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
X-TUID: gXOKLQlsWBmM

Le 21 avr. 2016 =C3=A0 14:54, Peter Maydell <peter.maydell@linaro.org> a =
=C3=A9crit :
> On 21 April 2016 at 13:50, Sylvain Garrigues
> <sylvain@sylvaingarrigues.com> wrote:
>> It does prevent FreeBSD to boot correctly.
>>=20
>> With that patch and
>> #define KERNEL_LOAD_ADDR 0x00200000
>> in arm/boot/boot.c, official FreeBSD RPI2 images boot like a charm =
:-)
>=20
> This is the kind of thing that is useful to mention in the commit
> message, because it tells people why the change is important=E2=80=A6

You are obviously right, sorry about that.

>> BTW, would be great to be able to set the load addr on the command
>> line, wouldn=E2=80=99t it?
>=20
> The booting protocol does not mandate any particular address
> that the kernel has to be loaded at:
> https://www.kernel.org/doc/Documentation/arm/Booting

I didn=E2=80=99t know qemu would blindly follow and stick to Linux =
rules, but I understand. I use qemu for baremetal and *BSD emulation, I =
wish it would be easier to change the loading address (and not stick =
with Linux rules like so many people again) :-) =20


> If the FreeBSD kernel can't handle being loaded wherever
> we put it, that sounds like a FreeBSD bug to me=E2=80=A6

I would not say it is a bug, but an explicit assumption. Indeed, the =
kernel expects it is loaded on a 2 MB page boundary.
I=E2=80=99m no expert, but I believe it was made so that we could remove =
the need for setting the physical address in the building process. The =
virtual to physical offset is computed more simply with that assumption.=20=


With the patch you committed for me earlier today (b4850e5), the patch =
we are talking about in this email (which is not a feature but a bug fix =
in my opinion), and the ability to set the load address to 0x200000 (on =
the command line if possible), the following line just works straight to =
the login prompt :-)=20
# ./arm-softmmu/qemu-system-arm -M raspi2 -m 1024 -smp 4 -kernel =
kernel.bin -serial stdio -dtb rpi2.dtb -sd =
FreeBSD-11.0-CURRENT-arm-armv6-RPI2-20160408-r297692.img

FreeBSD-11.0-CURRENT-arm-armv6-RPI2-20160408-r297692.img is the latest =
FreeBSD official image.
rpi2.dtb and kernel.bin are in the /boot/ partition of that img file.=20

That=E2=80=99s it for my patches to make qemu and BSDs the best lovers =
in the world.

Have a good day,
Sylvain Garrigues.=
