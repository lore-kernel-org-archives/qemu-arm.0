Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp2716191wrr;
        Tue, 12 Nov 2019 05:48:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqzdOrCvZh9W8St4pWJuo7HS3BIvJbASLsoycucQJ6ArjNdcBwREAgfSY9MKqWsFsqiQEgmJ
X-Received: by 2002:aed:22c1:: with SMTP id q1mr31023851qtc.337.1573566494455;
        Tue, 12 Nov 2019 05:48:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573566494; cv=none;
        d=google.com; s=arc-20160816;
        b=jWk4z1bKdd5Ug1OXvZa6lQltwwq96UNvwMjlgIlNos1la+vokRzy/hD2nu2sXkwv0n
         OtDmmRjwVHRED0WvQK3tmpKAEbbtjggpe8Ox5Zhy10hcT4/s5nu+axtUeEzd758ebAya
         n3IRsY/mPJCZ8ESQt+sVp75M0jelKBSMaQzhwC0aJquokMb2g1viBa4ypIRue2QM0Q6U
         Pnxq4NqKLsXjN3McYi877wMMhqlhBnwFWXoZl4M4T6Coj09OVQKqSlFFSZA9d3F10RWN
         e6z41i2CTgehZJT//et7J7X5lojse9iRInuMfO0k5DZHXVBq4Wp9DssKbVLITngiHGV6
         zcjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=RYLIFYQlGm9Ki6YHiQ6cr/ujzB2VBpC1BfYM0Iim6bA=;
        b=Xkwh54T28Sksyl3o1HbT8YnW880oY7QIVm9eGJKYbdLNLel2EW/jB28M8WnnaF8UTj
         9kZ6YiB4pSzq2Y1YePKLSxR8wIelibxrzhsvxhmckHolG5+DVWbDTqKuc9q9yW1NjzRx
         HlU+wNHYe9OSvs9TA9ThDkxk9+LXtxMRwZ+gay90IxdpwNAxuKsa5B72Cgsk3p4LmCXF
         L//njz6pr6olagB3W/OF9k2uI6gE+NHIhXnqfOqtDOYf0ma5NAAyoHOvu4X9tsQWATRU
         zvkNDQUVzM+u3h6IaY50p665XJqgpwOPtqsYOY4KRnlH76agmsfd40bhByQT9zLA91Me
         LkbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T5gs3IXM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1si7832059qtc.302.2019.11.12.05.48.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2019 05:48:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=T5gs3IXM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iUWWj-0003tC-RM
	for alex.bennee@linaro.org; Tue, 12 Nov 2019 08:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52153)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iUWWN-0003pt-2D
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 08:47:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iUWWG-00062x-Md
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 08:47:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34968
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iUWW7-0005qC-As
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 08:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573566454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RYLIFYQlGm9Ki6YHiQ6cr/ujzB2VBpC1BfYM0Iim6bA=;
 b=T5gs3IXM0rIlCcCwqVoTT3fxfphT9IDzAu5lpjrKz1S/Ont/MGqPVSQcjjX0cfoeZbDVG3
 +OAETxwth7WuECnYXEmL9ike/D2ISd6i84TDiy1ohTfQps1c+95XtM04U3b2YJWBghw9bU
 9HIdadj1fy1s+Ip19xWOTLQm365Rc+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-zlx4a0vzMP2Ou6GrLn4HXA-1; Tue, 12 Nov 2019 08:47:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DF3385EE6D;
 Tue, 12 Nov 2019 13:47:27 +0000 (UTC)
Received: from gondolin (dhcp-192-218.str.redhat.com [10.33.192.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CE076106A;
 Tue, 12 Nov 2019 13:46:40 +0000 (UTC)
Date: Tue, 12 Nov 2019 14:46:38 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC v5 000/126] error: auto propagated local_err
Message-ID: <20191112144638.4baf555a.cohuck@redhat.com>
In-Reply-To: <CAMxuvawy_TStTDXYoNF0zFjh6eOF1EUKe6BYAxUo_S9-cxMPSg@mail.gmail.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <d1756cd0-8ad7-1e6c-b127-59ed24c5e512@virtuozzo.com>
 <CAMxuvawy_TStTDXYoNF0zFjh6eOF1EUKe6BYAxUo_S9-cxMPSg@mail.gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: zlx4a0vzMP2Ou6GrLn4HXA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>, Jeff Cody <codyprime@gmail.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Eric Blake <eblake@redhat.com>,
 Alberto Garcia <berto@igalia.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Anthony Green <green@moxielogic.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Andrew Jeffery <andrew@aj.id.au>, Chris Wulff <crwulff@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 "sheepdog@lists.wpkg.org" <sheepdog@lists.wpkg.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, Eric Farman <farman@linux.ibm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Liu Yuan <namei.unix@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Ari Sundholm <ari@tuxera.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Jason Dillaman <dillaman@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "integration@gluster.org" <integration@gluster.org>,
 Laszlo Ersek <lersek@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Max Reitz <mreitz@redhat.com>,
 Denis Lunev <den@virtuozzo.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Marek Vasut <marex@denx.de>,
 "armbru@redhat.com" <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 David Gibson <david@gibson.dropbear.id.au>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Wen Congyang <wencongyang2@huawei.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +kMbFyXhraNh

On Fri, 8 Nov 2019 22:57:25 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> Hi
>=20
> On Fri, Nov 8, 2019 at 7:31 PM Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:
> >
> > Finally, what is the plan?
> >
> > Markus what do you think?
> >
> > Now a lot of patches are reviewed, but a lot of are not.
> >
> > Is there any hope that all patches will be reviewed? Should I resend th=
e
> > whole series, or may be reduce it to reviewed subsystems only? =20
>=20
> I don't think we have well established rules for whole-tree cleanups
> like this. In the past, several cleanup series got lost.

Yes, it is always problematic if a series touches a lot of different
subsystems.

>=20
> It will take ages to get every subsystem maintainer to review the
> patches. Most likely, since they are quite systematic, there isn't
> much to say and it is easy to miss something that has some hidden
> ramifications. Perhaps whole-tree cleanups should require at least 2
> reviewers to bypass the subsytem maintainer review? But my past
> experience with this kind of exercice doesn't encourage me, and
> probably I am not the only one.

It's not just the reviews; it's easy to miss compile problems on less
mainstream architectures (and even easier to miss functional problems
there, although they are probably less likely with automated rework.)
CI can probably help, but that's something for the future.

Anyway, I've now gotten around to that series; spotted one problem in
s390x code, I think.

One thing that's helpful for such a large series is a git branch that
makes it easy to give the series a quick go. (You can use patchew, but
it takes time before it gets all mails, so just pushing it somewhere
and letting people know is a good idea anyway.)

