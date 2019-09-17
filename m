Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5145789wrp;
        Tue, 17 Sep 2019 04:50:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw7hUum3o2pbfLNd3hzXZ2/AOLOTKVOWKHhHQ2DMnxHK45J1G7ZwzXxe721W88oVEUni0F4
X-Received: by 2002:a05:620a:113a:: with SMTP id p26mr3300042qkk.353.1568721034964;
        Tue, 17 Sep 2019 04:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568721034; cv=none;
        d=google.com; s=arc-20160816;
        b=BOnA+4zJD5KLfBGCoGsndlNCNvc6+BGUViZA/fyy6jZ7Sq2oEkNQlkIvIXtQu41VTv
         uIAlIENyEDDwPnT+wKQvxOdOaDSw5QVLKlULviNivazDP+2X/p9r8O5IGRuMACw8JDBA
         2AU2pOfcRLfei3w/rn6aB4HI+PZuQW9th2cQEeY7uo/edsoMH5CHS2IsvhnX+eodVCGf
         6i+R+uaM5ORJtcctY8FKDBwIlhlkFu1o+qlsQSJEXZnwBReC1ivanQGMVb5cw/QekQnf
         46lbcJxClBSOGoCejCCiPhj9r/wvb02vTeaxA7HCPfrD2LqLAe4pabMl1MSFcHm2L8aL
         v6ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=50nD5BcOEIpwpQAAvkvvST9Z/rpDPS4V4cdLa1OEpdA=;
        b=woYjVubyG9uMKPp8XVUqXTAE2EttAleygKrq9feVHfG3ltdnA2xX7aTvBB6VrjUAiU
         wiql7Yo1jD/FV89UobMQIKbdWeEJesMuwKsV+C3vPI0iq86ashfAeWG1X9/Kzna1LEJ+
         1lHWVUgm9x7ZEnKuW5zNPXi58dXXh+XXFBhXjUHgG+Yxmb2pgwLjQ/EyHfIDVzKAtowm
         YspN/6F/QybEBI/OkWrX3Nwd7lUrzWmkQNvftEKBEMwCcd+Qm99cKZwK8Tid6P8FfD2Z
         AEwioCCTZFAGTlynalsqp1DbloQMpGGNPwtyLtBNB+KzjfdOn68zBhTLnkP9DmhGLTPy
         1cIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si1344448qve.122.2019.09.17.04.50.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 04:50:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAC09-0006Aa-TF
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 07:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58147)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iABzP-00065z-9F
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:49:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iABzN-0004bJ-Gx
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:49:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47650)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1iABzM-0004av-WB; Tue, 17 Sep 2019 07:49:45 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1176B10CC1EB;
 Tue, 17 Sep 2019 11:49:44 +0000 (UTC)
Received: from redhat.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37D7F60126;
 Tue, 17 Sep 2019 11:49:19 +0000 (UTC)
Date: Tue, 17 Sep 2019 12:49:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Greg Kurz <groug@kaod.org>
Message-ID: <20190917114916.GK1069@redhat.com>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
 <551745c2-2579-9ce5-4aa4-536c37a1ce45@redhat.com>
 <20190917134529.4c38f847@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190917134529.4c38f847@bahia.lan>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Tue, 17 Sep 2019 11:49:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yNFaAXxlKSGL

On Tue, Sep 17, 2019 at 01:45:29PM +0200, Greg Kurz wrote:
> On Tue, 17 Sep 2019 13:00:37 +0200
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
>=20
> > For some reason your email client escaped incorrectly Daniel's email:
> >=20
> >   "Daniel P. Berrang=C3=A9\" <berrange@redhat.com>
> >=20
>=20
> The client is stgit's "stg mail" command, and indeed it generates this:
>=20
>  "Daniel P. =3D?utf-8?q?Berrang=3DC3=3DA9=3D22?=3D <berrange@redhat.com=
>
>                                    ^^^
>                                 double-quote
>=20
> and if I turn the '=C3=A9' into a 'e':
>=20
>  "Daniel P. Berrange" <berrange@redhat.com>
>=20
> This looks like a bug in "stg mail"...

Happy to see that my name is detecting bugs :-)

I should add an emoji to it to really flush out the edge cases...

> > Which makes my email client very unhappy (Thunderbird):
> >=20
> > There are non-ASCII characters in the local part of the recipient
> > address "Daniel P. Berrang=C3=A9 <berrange@redhat.com>,
> > qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
> > qemu-s390x@nongnu.org"@d06av23.portsmouth.uk.ibm.com. This is not yet
> > supported. Please change this address and try again.
> >=20
> > Neither is MTA:
> >=20
> > An error occurred while sending mail. The mail server responded:
> > 5.1.2 The recipient address <qemu-s390x@nongnu.org@d06av22.portsmouth=
.uk.ibm
> > 5.1.2 .com> is not a valid RFC-5321 address. r28sm2465872wrr.94 - gsm=
tp.
> >  Please check the message recipient
> > ""qemu-s390x@nongnu.org"@d06av22.portsmouth.uk.ibm.com" and try again=
.
>=20
> Drat... this may prevent recipients starting with Daniel from receiving
> the mails... ie, the sub-lists IIUC. Maybe not worth reposting for that=
.

Yeah, I wouldn't bother reposting just for that.

> Hopefully, Daniel may catch up on qemu-devel.

Indeed.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
