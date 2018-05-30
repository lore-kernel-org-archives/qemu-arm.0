Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4709361wre;
        Wed, 30 May 2018 05:55:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKswxie2lFwrQoxH9K3JPdiMdZNNwIURpbyjy/f725oy17/E+PHJ5L7kb6ZTQYyvSHsAqxV
X-Received: by 2002:a37:af05:: with SMTP id y5-v6mr2150622qke.55.1527684933359;
        Wed, 30 May 2018 05:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527684933; cv=none;
        d=google.com; s=arc-20160816;
        b=YFx0Pll2mBy/t0Xnst7BWl6tcJo2DQNTKRhdm0tOAT01AXBb2LtPm1J9MxJ9wiRk5W
         KeVDIyN8lZt/rRlNM8CPjp9db+eWlpT8cQMQYs4tiG+l/NEJxegVlcLLTUYLcU8UAghZ
         3sfyO4nAG8cDBReMSVsIaAgEfFsWflUc+oJu/JzZvbA3KeclCvXZowvWsNvspYj8iUMG
         7tx0Bqck0eGPKp5oDv0wi8vg9Y8fdL6r0XL5FcglLsI2a5BF1mMzZQ4tYjrloC+aVKGz
         OJduZyZqMpLqHRoO9PgZrhPxhLnRGB006HGYf6lJZWdu6IArQvOdiw/p+0c2Yrq2QYWK
         Tbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=97NRZqQHAXP5WGgV6qZB18rs+y2kjwgG7GRfavfFmzI=;
        b=JTEX8/+vNDcFhY3ydkGxMvMqHHNuW5VhyxH8Szui/1NvxpeNyP/zbT4AnBf/c22cq4
         Q1z227mFnXHa5RqMfG4gR9YZSQ0pNltTg9tWagGQeiy//NP56pRbOqvIObFrXSrgywt2
         lADsjQKg16X5dube5kJKbIJ9ke43l6phM2pPVn0CN7DxTJ9ldF5+kCAaPDjcwZl8Cwo1
         qurptzlvd2wnRJo6OMACJh0XWmfNha/AR8p0ubppEoYmOg/61tJo4m0YdFThJQLhGTJi
         WGia3IjJXjywb/pdjiRXN1m7lq8g+5x1cxMbfVG/HteDgZ3J2ooesjZP0wolRPM/7xMI
         PdhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n184-v6si3407529qkb.113.2018.05.30.05.55.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 05:55:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO0dY-0002q0-PK
	for alex.bennee@linaro.org; Wed, 30 May 2018 08:55:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fO0dM-0002oB-4q
	for qemu-arm@nongnu.org; Wed, 30 May 2018 08:55:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1fO0dI-0005Kh-0t
	for qemu-arm@nongnu.org; Wed, 30 May 2018 08:55:20 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43542 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1fO0dH-0005K0-Qi; Wed, 30 May 2018 08:55:15 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0147940BC04F;
	Wed, 30 May 2018 12:55:15 +0000 (UTC)
Received: from redhat.com (ovpn-120-96.rdu2.redhat.com [10.10.120.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56A012166BCC;
	Wed, 30 May 2018 12:55:12 +0000 (UTC)
Date: Wed, 30 May 2018 15:55:12 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180530155301-mutt-send-email-mst@kernel.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-10-f4bug@amsat.org>
	<20180529134053.1ea9f46d.cohuck@redhat.com>
	<11289f38-6d0f-74c9-1719-83b2a3ed2d97@amsat.org>
	<20180530074026-mutt-send-email-mst@kernel.org>
	<CAAdtpL7sDOg2m+Ffsbc3f_Za6fr3in5ZfBJ2BAtGNJ1j4vbhJQ@mail.gmail.com>
	<CAAdtpL6eW5=djFE-k7bHUR6s_b=wAmMuOLM8Djb_CYPf54L8CA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAAdtpL6eW5=djFE-k7bHUR6s_b=wAmMuOLM8Djb_CYPf54L8CA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 30 May 2018 12:55:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 30 May 2018 12:55:15 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v4 09/21] target: Do not include
 "exec/exec-all.h" if it is not necessary
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	David Hildenbrand <david@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Anthony Green <green@moxielogic.com>, Cornelia Huck <cohuck@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, Laurent Vivier <laurent@vivier.eu>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ijul5It+I64x

On Wed, May 30, 2018 at 03:19:19AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Le mer. 30 mai 2018 02:50, Philippe Mathieu-Daud=E9 <f4bug@amsat.org> a=
 =E9crit=A0:
>=20
>     On Wed, May 30, 2018 at 1:42 AM, Michael S. Tsirkin <mst@redhat.com=
> wrote:
>     > On Wed, May 30, 2018 at 12:12:55AM -0300, Philippe Mathieu-Daud=E9=
 wrote:
>     >> Hi Cornelia,
>     >>
>     >> On 05/29/2018 08:40 AM, Cornelia Huck wrote:
>     >> > On Mon, 28 May 2018 20:27:07 -0300
>     >> > Philippe Mathieu-Daud=E9 <f4bug@amsat.org> wrote:
>     >> >
>     >> >> Code change produced with:
>     >> >>=A0 =A0 =A0$ git grep '#include "exec/exec-all.h"' | \
>     >> >>=A0 =A0 =A0 =A0cut -d: -f-1 | \
>     >> >>=A0 =A0 =A0 =A0xargs egrep -L "(cpu_address_space_init|cpu_loo=
p_|tlb_|tb_|
>     GETPC|singlestep|TranslationBlock)" | \
>     >> >
>     >> > Hm, does this expression catch all files that need to include
>     >> > exec-all.h? The resulting patch seems fine, though.
>     >>
>     >> No, not all :/
>     >> I started with "(cpu_loop_|tlb_|tb_)" then kept brutebuilding un=
til no
>     >> more errors appear. In 2 more steps I added "cpu_address_space_i=
nit|"
>     >> then "|GETPC|singlestep|TranslationBlock". Quick and dirty enoug=
h for my
>     >> goal than trying to build a regex to explode function/struct nam=
es from
>     >> headers. This is a clever way to do it for long term command reu=
se taken
>     >> from commit messages...
>     >
>     > Brutebuilding isn't a good way to find unused includes, some othe=
r header
>     > might pull in an include you are trying to remove for its own pur=
poses.
>     > If you want to try brutebuilding you must also verify that's
>     > not the case - e.g. look at the dependency file generated.
>=20
>=20
> I think I get it for headers, but here I'm only modifying .c source fil=
es.=A0

Same thing - if you call a function from a header, you should include
that header even if some other header happens to pull it in.
Otherwise someone might cleanup that other header and suddenly
your build breaks.



> I'll restrict the shell command to .c=A0

I don't think it matters.

>=20
>=20
>     Hmm you mean the .d files in the build dir?
>=20
>     i.e.
>     $ find lm32-softmmu -name \*.d -exec fgrep -L exec-all.h {} \; | se=
d
>     -e 's/.*-softmmu\/\(.*\)d$/\1c/'
>     dump.c
>     numa.c
>     tcg/tcg-common.c
>     tcg/optimize.c
>     tcg/tcg-op-gvec.c
>     tcg/tcg-op-vec.c
>     accel/tcg/tcg-runtime-gvec.c
>     accel/tcg/tcg-all.c
>     accel/accel.c
>     accel/stubs/whpx-stub.c
>     accel/stubs/hvf-stub.c
>     accel/stubs/kvm-stub.c
>     accel/stubs/hax-stub.c
>     hw/lm32/milkymist.c
>     hw/lm32/lm32_boards.c
>     hw/core/generic-loader.c
>     ...
>=20
>     Then look why each .c included it?
>=20
>     >
>     >> >>=A0 =A0 =A0 =A0xargs sed -i.bak '/#include "exec\/exec-all.h"/=
d'
>     >> >>
>     >> >> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
