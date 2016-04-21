Received: by 10.25.208.194 with SMTP id h185csp161046lfg;
        Thu, 21 Apr 2016 05:50:25 -0700 (PDT)
X-Received: by 10.55.80.86 with SMTP id e83mr19852310qkb.91.1461243025684;
        Thu, 21 Apr 2016 05:50:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x191si278760qkx.200.2016.04.21.05.50.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Apr 2016 05:50:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40691 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atE3t-000469-8t
	for alex.bennee@linaro.org; Thu, 21 Apr 2016 08:50:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylgar@gmail.com>) id 1atE3q-000442-DI
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 08:50:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sylgar@gmail.com>) id 1atE3n-0003aB-4S
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 08:50:22 -0400
Received: from mail-wm0-f46.google.com ([74.125.82.46]:38870)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylgar@gmail.com>)
	id 1atE3m-0003a5-V8; Thu, 21 Apr 2016 08:50:19 -0400
Received: by mail-wm0-f46.google.com with SMTP id u206so130839378wme.1;
	Thu, 21 Apr 2016 05:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ZtEDbLXnbhO+MwN7YuRXq54XiuUnAm1ZbcwSY/up4pM=;
	b=RYqnZDhYAbaAg6pUg0PmZtPXcnO55nFKP7uWiBOIs11P6ehPdzmcOJ7kA/Ei7wU2+j
	yN9n87hR9k0ujcIBFbHvzvh0Ejths1Q3rm2MbkomOhK+cb5AdoqbuickYj2uohHrT1b4
	+LRjhhP5WpfQMlwBuQUcQ84x1ZY/oPEG8D8VLhK5JiAldOFQFKtNu+EzjGcfCKCedQAO
	i2Mim5GXaj9GvF67snThZQ2KKfQa+IYGTwY2xLUCR8JHCaMNJyK23M51+gkAjzSAKzlr
	2a5LawHvZ+1uNx6xTfQa99UdAuTUX3wI4C+dzgDDaEPyrx632ptMTrBkYnrL4/J31Xy2
	3b/g==
X-Gm-Message-State: AOPr4FXxYEyup4ycIWKzL9d43Snk0X2XcrTkIawan1EAbhI/4xX1GVTlPl7uWNrQ5OpGUA==
X-Received: by 10.194.34.39 with SMTP id w7mr14195708wji.19.1461243018289;
	Thu, 21 Apr 2016 05:50:18 -0700 (PDT)
Received: from [192.168.0.10] (plr75-1-82-226-218-68.fbx.proxad.net.
	[82.226.218.68]) by smtp.gmail.com with ESMTPSA id
	r123sm735409wmg.20.2016.04.21.05.50.17
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Apr 2016 05:50:17 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
In-Reply-To: <CAFEAcA8mLk+3t+ypR96WPG9yMsvbJ4hmgk1NwfxPLHzk0R=Dwg@mail.gmail.com>
Date: Thu, 21 Apr 2016 14:50:16 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <DD3027E2-6F96-4D87-B2C5-02E9926AA402@sylvaingarrigues.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<CAFEAcA8mLk+3t+ypR96WPG9yMsvbJ4hmgk1NwfxPLHzk0R=Dwg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3124)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.46
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
X-TUID: N31rHTmTlaGZ

It does prevent FreeBSD to boot correctly.

With that patch and=20
#define KERNEL_LOAD_ADDR 0x00200000
in arm/boot/boot.c, official FreeBSD RPI2 images boot like a charm :-)

BTW, would be great to be able to set the load addr on the command line, =
wouldn=E2=80=99t it?


> Le 21 avr. 2016 =C3=A0 14:45, Peter Maydell <peter.maydell@linaro.org> =
a =C3=A9crit :
>=20
> On 21 April 2016 at 11:41, Sylvain Garrigues
> <sylvain@sylvaingarrigues.com> wrote:
>> As the framebuffer settings are copied into the result message before
>> it is reconfigured, inconsistent behavior can happen when, for =
instance,
>> you set with a sinle message the width, height, and depth, and ask at
>> the same time to allocate the buffer and get the pitch and the size.
>>=20
>> In this case, the reported pitch and size would be incorrect as they
>> were computed with the initial values of width, height and depth, not
>> the ones the client requested.
>=20
> Thanks for this patch. I think at this point in the 2.6 release cycle
> we should leave this for the 2.7 release, given that it doesn't affect
> the booting of the older Linux and Windows versions that work on the =
raspi2
> board.
>=20
> I'll let Andrew review the patch...
>=20
> -- PMM

