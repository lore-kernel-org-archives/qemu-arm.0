Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1186908wrm;
        Fri, 11 Oct 2019 11:37:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzRorL9DSkNY/mSB3GRn2Wxv5XGx525iuhU9c4u5HHbeKCurVFBeyR25jOLkqp+efXkLR25
X-Received: by 2002:a37:de0e:: with SMTP id h14mr16686523qkj.45.1570819049523;
        Fri, 11 Oct 2019 11:37:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570819049; cv=none;
        d=google.com; s=arc-20160816;
        b=nCQtlZeaCiCi+ogCwYtrxYx4PtkoZdYWiQ/M2Wh6DTBWAKfhxta3ZKNmvg/i9MVvSs
         /CNumCI/bXWf0OrtT+/C8u+LbdVZ9dUBFbFes/P5ib/xK01brnTdcyp5ElZq4LQ7H2o9
         9EX8OWB47wAIPDYTRFxYJwIZ9fyG13J6TGwZ7YHe2v/8e3QlPXLXzRJomcP8WbinVBKq
         QKDaV52ZWPOsxQjrZV5qfO/yLglIkKxeHbCvZByFH7WEntqla47gVMwh69usWSC8Wyev
         Ir4GCe1OgIeAG7Vrl8m+7igarsHoRKRDhxa1hFyFsUdO1k12agNO4vJSRje6p5z3O3IM
         uKoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:references:to:from:subject;
        bh=H7/2fctIDGsbW+IDKvmh7zOOgtyoT0UsLVR/Q7h4i4A=;
        b=vL7wU5qC8gngUN5bFhGlm3p7t7/MYdx3N2R8NiawmDMQj3RZ9polShpimJqT4ES65i
         cpqbAHaOEtD6ivDtF+i3NLOx8vopHwgeuuMvya8GmyjJjA+mLFTvXT2wLdqhDTEq9Amy
         O/N4z4quy+Xr+Gh9Ds+wfqW4ZMDteLNcyskwqdJyCZNxVgRjUADyIMgcMy6soRUhoz+Q
         FlcfLB0/QwtnMDhGnBnHtYq8M4kduaQeoe/QBMV5tdSr9v0tsmH3uZPNaQligpD6a47L
         U3MtqVAnYehlgqt23uljsdRIskofziy+3UykgsVTHnn91y1gjgeK3oexHkzM7W17pQ9e
         AhYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u58si9594905qta.392.2019.10.11.11.37.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 11:37:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIzn6-0003FN-Lv
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 14:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56123)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iIzSU-0004mA-Nx
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 14:16:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iIzSQ-0001j2-O6
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 14:16:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55686)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iIzSH-0001ag-9L; Fri, 11 Oct 2019 14:15:57 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8E21C7BDA5;
 Fri, 11 Oct 2019 18:15:54 +0000 (UTC)
Received: from [10.3.116.168] (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42A2C60BF4;
 Fri, 11 Oct 2019 18:15:16 +0000 (UTC)
Subject: Re: [RFC v5 025/126] scripts: add coccinelle script to use auto
 propagated errp
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-26-vsementsov@virtuozzo.com>
 <5dd4d642-7ea6-42a2-66fc-6d6710b77b8d@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f846f0dc-854f-90f7-5f25-eb4f2b461520@redhat.com>
Date: Fri, 11 Oct 2019 13:15:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <5dd4d642-7ea6-42a2-66fc-6d6710b77b8d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 11 Oct 2019 18:15:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>, qemu-block@nongnu.org,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Laszlo Ersek <lersek@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Chris Wulff <crwulff@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, sheepdog@lists.wpkg.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, Thomas Huth <thuth@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, "Denis V. Lunev" <den@openvz.org>,
 Hannes Reinecke <hare@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Liu Yuan <namei.unix@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 Amit Shah <amit@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>, qemu-riscv@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Paul Durrant <paul@xen.org>,
 Anthony Green <green@moxielogic.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Ari Sundholm <ari@tuxera.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Jason Dillaman <dillaman@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 xen-devel@lists.xenproject.org, integration@gluster.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Max Reitz <mreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Vincenzo Maffione <v.maffione@gmail.com>, Marek Vasut <marex@denx.de>,
 armbru@redhat.com,
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
X-TUID: vFoia5xv7jJU

On 10/11/19 12:12 PM, Eric Blake wrote:
> On 10/11/19 11:04 AM, Vladimir Sementsov-Ogievskiy wrote:
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>

>> +@@
>> +identifier rule1.fn;
>> +identifier rule1.local_err;
>> +@@
>> +
>> + fn(...)
>> + {
>> +=C2=A0=C2=A0=C2=A0=C2=A0 <...
>> +(
>> +-=C2=A0=C2=A0=C2=A0 error_free(local_err);
>> +-=C2=A0=C2=A0=C2=A0 local_err =3D NULL;
>> ++=C2=A0=C2=A0=C2=A0 error_free_errp(errp);
>=20
> This does not make sense - error_free_errp() is not defined prior to=20
> this series or anywhere in patches 1-24, if I'm reading it correctly.

Apologies - I sent my reply to this message before 21/126 showed up in=20
my inbox, and didn't realize that I had skipped over sequencing.  This=20
part is fine after all, but it points to the perils of reviewing a=20
thread as it comes in piecemeal, vs. reviewing an actual branch with all=20
patches instantly available.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org
