Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5143083wrp;
        Tue, 17 Sep 2019 04:47:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxvaqa3CGeCxHsQMJ/yUBKJTFno3d7w13Q11bb/Now1STpf5hvmUVi19PaFMOELw/dnkO3T
X-Received: by 2002:ac8:1e1a:: with SMTP id n26mr3176938qtl.357.1568720823779;
        Tue, 17 Sep 2019 04:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568720823; cv=none;
        d=google.com; s=arc-20160816;
        b=hx3xPWt//D5gnmPC08EwLFl5bdo6xmTEOKqaaIeta2tgTuwt4KNW9TArNQf6PILFxH
         oait1Em+agA1FyyUSwuwe/cpw9y3oix/S/5dTaUKhbPArkJfGLk0wr5SenTCg/ey0Dr7
         Om4FCk0OVL8+zC9t4E2beLTVt5M+KMypgfKsaPpTw61gqO9AGaWTJ5IvbYygQkZ5lazo
         mAPProHGW4vMfZL2ViqNNHDOk3Da4g/dNa7LOK5pyrqibOEzrGq5MckMvVXtkOHic5Rm
         Dr4bbs4Ffzcy6EoYorB79CcLoBVR1aGyVVmcvyzG+qCAZeeiZ8ZqgiOflWM0OnocrC21
         iXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=7augb+GleeyTJD1Tm21+kbi+Of/wHDoZzMXzlCgYGys=;
        b=GRkpGsi6l2Qiy4s6Bl55H6w/JVUOgafseXKs3QGCtLNNCdiR58WiK0yveWEqOfKRYU
         SfPblcjFXHYkpvclrTZ0m0rHnLgT4EglVaWS8LD/jJUVcKBaLGlY68U8loVRMf6vNYyl
         Q/et6mPKsieRbpLbvVTpaupJm4/x86I6x6Jc8t3lx7hs6q6lgcfdJx6Z6OQStM8SDG0P
         4zIKvTtWZQ78FAlT+jGsEomQsOERQAxw1MLLWHr6JqM2C597lVqEFfVOxOvWR6BRONzM
         Zv7R8a7hMF/Nf7FhuWh/jt6AH6DW02mfQSd+LjG4fJU68EjTpNStAloenU1Fhoyiw7Tt
         ZVhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17si1471859qtk.200.2019.09.17.04.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 04:47:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iABwj-0003ZQ-S5
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 07:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57726)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iABvw-0003Up-I6
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:46:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iABvu-00036b-OG
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:46:12 -0400
Received: from 14.mo4.mail-out.ovh.net ([46.105.40.29]:47073)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iABvu-00035X-Av
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:46:10 -0400
Received: from player157.ha.ovh.net (unknown [10.108.57.72])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 372BD2074B9
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2019 13:46:08 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id E93CA9D6A085;
 Tue, 17 Sep 2019 11:45:30 +0000 (UTC)
Date: Tue, 17 Sep 2019 13:45:29 +0200
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Message-ID: <20190917134529.4c38f847@bahia.lan>
In-Reply-To: <551745c2-2579-9ce5-4aa4-536c37a1ce45@redhat.com>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
 <551745c2-2579-9ce5-4aa4-536c37a1ce45@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 14375208539410569507
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeigddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.40.29
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/17] Fix usage of
 error_append_hint()
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Eric Farman <farman@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, "Daniel P. =?UTF-8?B?QmVycmFu?=
 =?UTF-8?B?Z8Op?=" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HvnkC4LxgKDK

On Tue, 17 Sep 2019 13:00:37 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> For some reason your email client escaped incorrectly Daniel's email:
>=20
>   "Daniel P. Berrang=C3=A9\" <berrange@redhat.com>
>=20

The client is stgit's "stg mail" command, and indeed it generates this:

 "Daniel P. =3D?utf-8?q?Berrang=3DC3=3DA9=3D22?=3D <berrange@redhat.com>
                                   ^^^
                                double-quote

and if I turn the '=C3=A9' into a 'e':

 "Daniel P. Berrange" <berrange@redhat.com>

This looks like a bug in "stg mail"...

> Which makes my email client very unhappy (Thunderbird):
>=20
> There are non-ASCII characters in the local part of the recipient
> address "Daniel P. Berrang=C3=A9 <berrange@redhat.com>,
> qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
> qemu-s390x@nongnu.org"@d06av23.portsmouth.uk.ibm.com. This is not yet
> supported. Please change this address and try again.
>=20
> Neither is MTA:
>=20
> An error occurred while sending mail. The mail server responded:
> 5.1.2 The recipient address <qemu-s390x@nongnu.org@d06av22.portsmouth.uk.=
ibm
> 5.1.2 .com> is not a valid RFC-5321 address. r28sm2465872wrr.94 - gsmtp.
>  Please check the message recipient
> ""qemu-s390x@nongnu.org"@d06av22.portsmouth.uk.ibm.com" and try again.

Drat... this may prevent recipients starting with Daniel from receiving
the mails... ie, the sub-lists IIUC. Maybe not worth reposting for that.
Hopefully, Daniel may catch up on qemu-devel.
