Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2666112wrt;
        Thu, 11 Oct 2018 08:35:35 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60mE//xXDQZk6yOaj7xE7ybaJg0Zq3bXo9VSKMrqOrC0VoaIHZdXqdyilKqXqBvj2VLg6zx
X-Received: by 2002:a37:60c4:: with SMTP id u187-v6mr1979541qkb.234.1539272135387;
        Thu, 11 Oct 2018 08:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539272135; cv=none;
        d=google.com; s=arc-20160816;
        b=T7yasyvjAQIm6884SVztSO9eAywS/+W9RugEYA4H0MuFcsqWm2ltRcmfMYt4YIMV1A
         JDlPulL8kQb5Rq02+aIrRRi+Z7xP9eRKAUVsVHHRPNd1T1T4gly7P63TbXok9EqKoQX7
         oGQJ/tpOKwdiNEscTDQV6xfJNEwJT7sDnlLB7NB9memk3CvTEmArmbKfFojBLeI8XaqF
         yPIRZx1X2LGfZpqCFnGQKL4PjmKlXv4QaUtLqyEQrsby2S8BlwIkVaO2l/c612Hu3vW8
         F5IyFOePZppvwSelqJE6DHGHSFHbua3Q9d4PXI0B8H7LNdB/seoE1Qw2zorhOYgC995T
         1vLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=9giHznzMCe+XBjQScuCmCI+SFIM1dPUclsky3Jw47tk=;
        b=YhINAbsPst3eoDuXjbsSo1M4VbdIGPqXc5y201gJXrK9XlY9xwzIhPhyD8DX8NOp+1
         94RjX8iaI83kyJb7o2SdfifGFJRnIqCT0XUPmnDhNDJE8S7+ZXoC8eFGLrU1Q932N1RG
         YfvfxRoDXP7GnvrqDilRFgjvJJ9efbnLhXh/oQENjB17lit1psRlkts6VoQmH+zb4ccB
         LGOjNtwOgqkuHCAJ1OPz8yDKOoA7u2mEVRfifnPl9MCqI7WLkl0jUSvJt+89r/lixEJ3
         YMfM+QG/eT1RM9mxtRzCKn1/hn6lw07b79jZkg6q6vYsut60kr0cX93i8AM2S3UQ49ed
         oKlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e17-v6si160627qkm.130.2018.10.11.08.35.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Oct 2018 08:35:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAczu-0000Bb-R4
	for alex.bennee@linaro.org; Thu, 11 Oct 2018 11:35:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gAczl-0000BS-Sk
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 11:35:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gAczg-0002OB-R2
	for qemu-arm@nongnu.org; Thu, 11 Oct 2018 11:35:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10584)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1gAczg-0002NI-In; Thu, 11 Oct 2018 11:35:20 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4074481F0D;
	Thu, 11 Oct 2018 15:35:18 +0000 (UTC)
Received: from [10.36.118.43] (unknown [10.36.118.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19C551057041;
	Thu, 11 Oct 2018 15:34:53 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Prasad J Pandit <ppandit@redhat.com>
References: <20181011131413.22208-1-philmd@redhat.com>
	<7762db82-6044-df69-a1b7-c05100a0e938@redhat.com>
	<4b664769-9830-e186-05c4-132a8cfc423b@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <8d285029-2b6f-a841-2489-c6761e62c02c@redhat.com>
Date: Thu, 11 Oct 2018 17:34:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <4b664769-9830-e186-05c4-132a8cfc423b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 11 Oct 2018 15:35:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] chardev: Convert IOReadHandler
 to read an unsigned number of bytes
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
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
	Jason Wang <jasowang@redhat.com>,
	Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Clark <mjc@sifive.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Markus Armbruster <armbru@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	"open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
	"open list:PXA2XX" <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>, Zhang Chen <zhangckid@gmail.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
	Michael Walle <michael@walle.cc>, "open list:sPAPR" <qemu-ppc@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7JcADEplfXE4

On 11/10/2018 17:24, Philippe Mathieu-Daud=C3=A9 wrote:
>> On the other hand, fd_chr_read_poll is not an IOCanReadHandler, and th=
is
>> patch therefore probably doesn't compile?
> It does compile.
>=20
> fd_chr_update_read_handler() uses fd_chr_read_poll with io_add_watch_po=
ll():
>=20
> GSource *io_add_watch_poll(Chardev *chr,
>                         QIOChannel *ioc,
>                         IOCanReadHandler *fd_can_read,
>                         QIOChannelFunc fd_read,
>                         gpointer user_data,
>                         GMainContext *context);

Oh, that's somewhat weird.  It could just as well return a bool.

However, this made me notice that you need to change e.g. s->max_size's
declaration (in include/chardev/char-fd.h) from int to size_t, and
likewise for: 1) all users of s->max_size, such as len in fd_chr_read;
2) all the similar variables in other char backends.

So it's probably best to structure the series as follows:

1) change fd_can_read from IOCanReadHandler to a GSourceFunc (which
returns a boolean value), changing all "return s->foo" to "return s->foo
> 0;".  Then you can remove the > 0 from

    bool now_active =3D iwp->fd_can_read(iwp->opaque) > 0;

(Having the > 0 repeated in all backends is now a bit ugly, but there
are future cleanup opportunities here to move the qemu_chr_be_can_write
call to qemu_chr_be_can_write; this way most chardev backends can skip
defining a read_poll function.  But I digress).

2) assert in qemu_chr_be_can_write that the returned value is >=3D 0

3) for each backend, change the assigned variable from int to size_t

4) now the rest of your patch, touching all front-ends.  The assertion
from (2) now does not make sense anymore, since ->can_read returns an
unsigned value, but perhaps you can keep a "fail-safe" assertion that
(ssize_t)returned_value >=3D 0 to catch undesired overflows.

Paolo
