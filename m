Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1965608lfc;
        Wed, 20 Nov 2019 05:02:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqzdwSR99Fmta2cVc0KHJaa5iKHC2qykoaKiIarmOeryubZJiKNte7B34KR8u0mJYHfHj9Ur
X-Received: by 2002:a17:906:958b:: with SMTP id r11mr5327972ejx.332.1574254966780;
        Wed, 20 Nov 2019 05:02:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574254966; cv=none;
        d=google.com; s=arc-20160816;
        b=WETkakCGHU3fTPp7jg2nWCXUbsGRHWPTtodXb4LTiuMKEUc/zEFCltY3hi1dQWpAyq
         uY6DYlcSNqoB3ECd8mUgGBloyX3VyI2YvLf+HVyNlv0vZV28EHnYdfJuZWJbdpB+Lrwf
         CQ1KmlRd/0ZcR3KM8UtI99Sta+UtVazjnQYNSXCSi6WYAoSUQ+2HMcFl9NPv2KSwBhLl
         dVi7+YsmGJ5ZgkIMsmGo/bT/idXeeSxJvXPvbOmGQwzlZFl3sGNcapYuKAB8Ep2c9dZD
         ropu+1J30eh93KaJ5PQuCDbXsVMnsEboBbWlEXcal3YZQ0h9lgIhQZTjHV4xgCnYdKnP
         gOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=rzXyhKN6JI07guKLYgMixvCs/MyYGuc0l5Klz8/DR+E=;
        b=QsHYrhN4h5/1EnxsWGb6joTnxwZpaAJWwYpnR7poYRs9qCvpZGIYAcrTiJrI5H4nV4
         9URyUzKIddaZMiudP7zsdt6DAiM89r+3mcPVFn4mCmo+FzEN3tvJ1EEon/99WXgad3nQ
         glBnp7ZzK2v3PatTB3zxHsr2IQy2t1J6FS3HtYLWIRwmX9h/+gZNzaoE5DPPtF49/T0l
         J8TLIqmHo8/W7ml5QTrMSEyOp3SsyoYtZCbuc/WlMzkb3aMgzVrt25E7nZ08PCHNKznu
         I0Kn+RJmQkXQjJf6IAulcf9coH/CO4fKOepxHBvxGcuFMujF3uO4bNz9Pdn4LfgwMUCi
         TZjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PkDbiE5m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a26si8104710eje.383.2019.11.20.05.02.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 05:02:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PkDbiE5m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXPd7-0005Ow-AH
	for alex.bennee@linaro.org; Wed, 20 Nov 2019 08:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33719)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iXPae-0003ZB-IM
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 08:00:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iXPac-0000JQ-Uy
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 08:00:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45905
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iXPac-0000Ih-QC
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 08:00:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574254809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rzXyhKN6JI07guKLYgMixvCs/MyYGuc0l5Klz8/DR+E=;
 b=PkDbiE5m5gdAA9bs68o3nr6spiUm26r1A3BvLxF1cMVy5tuCSA5nSS4pi2pz1etyy53qho
 PRCLnUrG94l90auThK7WScsbNocWXGYPxv3XIJII3cdmiqwo54WNTusGYSvPJrarP6cxJb
 16Qg750AbZStWm6UCiI+/K5yXsso2Gs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-tkrQfcfNNXSPOST1rxoQEw-1; Wed, 20 Nov 2019 08:00:03 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1397191220;
 Wed, 20 Nov 2019 12:59:59 +0000 (UTC)
Received: from [10.3.116.221] (ovpn-116-221.phx2.redhat.com [10.3.116.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DEAB69300;
 Wed, 20 Nov 2019 12:59:16 +0000 (UTC)
Subject: Re: [RFC v5 000/126] error: auto propagated local_err
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <d1756cd0-8ad7-1e6c-b127-59ed24c5e512@virtuozzo.com>
 <538354c8-7ba9-8b1c-476e-5733c418207b@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <606dbe22-0d1e-66bb-aba9-681ca7961623@redhat.com>
Date: Wed, 20 Nov 2019 06:59:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <538354c8-7ba9-8b1c-476e-5733c418207b@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: tkrQfcfNNXSPOST1rxoQEw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Alberto Garcia <berto@igalia.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Anthony Green <green@moxielogic.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Chris Wulff <crwulff@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 "sheepdog@lists.wpkg.org" <sheepdog@lists.wpkg.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, Thomas Huth <thuth@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Liu Yuan <namei.unix@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 Amit Shah <amit@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
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
 Vincenzo Maffione <v.maffione@gmail.com>, Marek Vasut <marex@denx.de>,
 "armbru@redhat.com" <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 David Gibson <david@gibson.dropbear.id.au>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Wen Congyang <wencongyang2@huawei.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZduzJ7j4g1iZ

On 11/20/19 3:50 AM, Vladimir Sementsov-Ogievskiy wrote:
> Okay...
>=20
> I think that:
>=20
> 1. A lot of efforts (not only my, I think reviewing is already exceeded g=
eneration efforts)
>     are made, it would be sad to lose them.
>=20
> 2. It's safe enough to apply only part of generated patches: we just fix =
error_abort/error_fatal
>     in more popular subsystems, what's wrong with that? Why not to cover =
80% cases by 20% efforts?
>=20
> 3. It's obviously impossible to merge the whole series. A lot of time pas=
sed, series diverges.
>=20
>=20
> So I propose the following plan:
>=20
> 1. I resend small separate series of preparation patches per maintainer. =
They are good anyway.
>=20
> 2. We commit patch with macro (changing MUST to SHOULD in documentation) =
and coccinelle script.
>      (or that may be combined with the first series from [3.])
>=20
> 3. When one of preparations taken to maintainer's tree, I send generated =
patches for
>      its maintainer.

I'd still prefer waiting for direction from Markus.  We've been tied up=20
by other things (KVM Forum, 4.2 release), but now that we are in freeze,=20
this is actually a GOOD time for Markus to finally get back to this=20
series, and there is going to be less rebasing needed if we can apply=20
the entire cleanup right as 5.0 development opens in a couple of weeks.


>=20
>=20
> If no objections during a week, I'll start that plan, hope someone will s=
upport it.
>=20
>=20


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

