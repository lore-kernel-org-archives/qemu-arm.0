Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1741805wrg;
        Thu, 23 May 2019 06:40:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZ9RdN2I17u8gAUfsvohfjQLVRU7TQ3MEDKzfSFUi4SsCcOSkghL20DwkXWwOyoF/X5uWg
X-Received: by 2002:a50:b3a6:: with SMTP id s35mr98801427edd.220.1558618830521;
        Thu, 23 May 2019 06:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558618830; cv=none;
        d=google.com; s=arc-20160816;
        b=B8Qrj4M6ER00iD57kMsv5PaBJNkUADjX66Z0DAsbzSut+ZL6hSkok9KJQXKXf18W4H
         uY8pWB8zedAe7ppzzjOst5Np8pLyKGAq3IY9UoQQU/MzwD9ZezSa/EXrtuODgNjW/wIi
         Uf0WUEglo8uSWckzgXtlRMuwunDAs96zWmcgXGRe+iJ9QeU4aoLRTBt1ZRcbDIVMV6hT
         xF+uLvrDUgBMty6pnffHUG4OmTzWj6dvggWVM07YPpnF11tNdLdM4LcBQeAAvHbyHbCH
         fBMfCLHwLDK8Rz+LDI2ZnimezeV2Q5791ahXWkFikf5WK0mH5L/4Ob1JxmW6MiQuJQQw
         Gw0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:thread-index
         :thread-topic:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:to:from:date;
        bh=qixryh4s6rddoUvuQy6EqqQNupX0srYSKmfYBpQ2n+s=;
        b=lhWz7l5wmNVwMzBr6g5vp3nkRLdXN0j9te+8ys9s+MX6MpazDhHmI3SnqorIoHZr+Q
         B67QsCNPfPJ9gKaeawRJiZYdLBxai0NNVzHbX3kJRIb65i1dO+JT4iChDwBKsokbQQRs
         duN7Pqtz9upu+TXNroXo/N0fUP2W1MwnBkpOjh7yyw6A0pNBg4bLnFENF/0/+QyHZHCA
         HUZtY8sUP947Tt0SXINUMGh73DtCj7bKpTTaUwxNGu9WUTMLPsq/YmW84CJMbqyNng2K
         Xu99G1FL9JzRumY9vBcV7IEpHSxOQrLgPAE+WCZVp2IE9w7daG2JgMVJcpoOKAtkfDGd
         OrQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e26si9198696ejs.54.2019.05.23.06.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 May 2019 06:40:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTnxN-0008E4-G0
	for alex.bennee@linaro.org; Thu, 23 May 2019 09:40:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1hTnx5-0008Cj-GE
	for qemu-arm@nongnu.org; Thu, 23 May 2019 09:40:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1hTnx4-0001bC-9E
	for qemu-arm@nongnu.org; Thu, 23 May 2019 09:40:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44444)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1hTnx4-0001ag-1t; Thu, 23 May 2019 09:40:10 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5775C309B165;
	Thu, 23 May 2019 13:40:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BC7B5C69A;
	Thu, 23 May 2019 13:40:09 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
	(zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 386CF1806B13;
	Thu, 23 May 2019 13:40:09 +0000 (UTC)
Date: Thu, 23 May 2019 09:40:06 -0400 (EDT)
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <1894627419.24355320.1558618806274.JavaMail.zimbra@redhat.com>
In-Reply-To: <1088d160-20c1-00ed-b494-fede1a3a8410@redhat.com>
References: <20190312234541.2887-1-philmd@redhat.com>
	<20190312234541.2887-3-philmd@redhat.com>
	<20190522205234.GY10764@habkost.net>
	<1204725743.24201394.1558559144548.JavaMail.zimbra@redhat.com>
	<1088d160-20c1-00ed-b494-fede1a3a8410@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.36.116.137, 10.4.195.29]
Thread-Topic: Boot Linux Console Test: add a test for the Raspberry Pi 2
Thread-Index: cTKA5go+WjGllWYQUczyegVNXSeSlQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 23 May 2019 13:40:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/2] Boot Linux Console Test:
 add a test for the Raspberry Pi 2
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z7g2Z7iI+vFB



----- Original Message -----
> From: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> To: "Cleber Rosa" <crosa@redhat.com>, "Eduardo Habkost" <ehabkost@redhat.=
com>
> Cc: qemu-devel@nongnu.org, "Peter Maydell" <peter.maydell@linaro.org>, qe=
mu-arm@nongnu.org, "Philippe Mathieu-Daud=C3=A9"
> <f4bug@amsat.org>, "Andrew Baumann" <Andrew.Baumann@microsoft.com>, "Gerd=
 Hoffmann" <kraxel@redhat.com>
> Sent: Thursday, May 23, 2019 5:29:22 AM
> Subject: Re: [Qemu-devel] [PATCH v2 2/2] Boot Linux Console Test: add a t=
est for the Raspberry Pi 2
>=20
> On 5/22/19 11:05 PM, Cleber Rosa wrote:
> > ----- Original Message -----
> >> From: "Eduardo Habkost" <ehabkost@redhat.com>
> >> On Wed, Mar 13, 2019 at 12:45:41AM +0100, Philippe Mathieu-Daud=C3=A9 =
wrote:
> >>> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>>
> >>> Similar to the x86_64/pc test, it boots a Linux kernel on a raspi2
> >>> board and verify the serial is working.
> >>>
> >>> If ARM is a target being built, "make check-acceptance" will
> >>> automatically include this test by the use of the "arch:arm" tags.
> >>>
> >>> Alternatively, this test can be run using:
> >>>
> >>>     $ avocado run -t arch:arm tests/acceptance
> >>>     $ avocado run -t machine:raspi2 tests/acceptance
> >>>
> >>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>
> >> We're getting timeouts on travis-ci:
> >> https://travis-ci.org/ehabkost/qemu/jobs/535468057#L3289
> >>
> >> I don't know yet if the guest is hanging, or if we just need to
> >> increase the timeout.  I could reproduce the timeout locally,
> >> too.
>=20
> That's odd, I can't reproduce (this test is quicker than the following
> test_arm_emcraft_sf2 which start u-boot then timeouts and start the kerne=
l).
>=20
> My guess is network issues, since this test use a different mirror:
> archive.raspberrypi.org
>=20

It could be a network issue, it could be something else.  I think the very
first step, and I'd urge us to get that on master ASAP, is to show the
entire logs in CI, I mean:

---

diff --git a/.travis.yml b/.travis.yml
index 6fd89b3d91..fd8f6ca2d2 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -225,7 +225,7 @@ matrix:
     # Acceptance (Functional) tests
     - env:
         - CONFIG=3D"--python=3D/usr/bin/python3 --target-list=3Dx86_64-sof=
tmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmm=
u,alpha-softmmu"
-        - TEST_CMD=3D"make check-acceptance"
+        - TEST_CMD=3D"make AVOCADO_SHOW=3Dtest check-acceptance"
       addons:
         apt:
           packages:

---

That way we can know for sure what's going on.=20

> Gerd already raised this problem (timeout reached while fetching
> artifacts) to Cleber.
> Cleber, can we add test_setup() methods that use different timeouts?
>=20

Not in a released Avocado version.  Interestingly enough, I wrote a PoC
that adds different timeouts to tearDown()[1], that can be used the same
way for setUp(), and it looks like Intel DAOS is already using those
patches[2].

So, I guess I can work on a non-PoC version for that.

- Cleber.

[1] - https://github.com/avocado-framework/avocado/pull/3076
[2] - https://github.com/daos-stack/daos/commit/084ec23461e7bd9b997d4b6f5e8=
095a4eaffc685

> Regards,
>=20
> Phil.
>=20
> > It may be related to:
> >=20
> >  https://bugs.launchpad.net/qemu/+bug/1829779
> >=20
> > And this is a proof that we urgently need to have a better
> > way of presenting/storing test artifacts.  The brief output
> > is nice when everything goes well, but makes the test results
> > close to useless once a failure happens.
> >=20
> > Philippe showed us how GitLab allows CI jobs to preserve
> > artifacts, so maybe the solution is to move the loads there.
> >=20
> > - Cleber.
> >=20
>=20
