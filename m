Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp3202627wri;
        Fri, 8 Nov 2019 14:46:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqzuEAkmjALr8sxdcFgS4FzC8z9F8pvLb9HNXK//jSiOBtUkm0lNS+jps/H1An2hrvRw4Wcv
X-Received: by 2002:aa7:dd13:: with SMTP id i19mr13516153edv.240.1573253166136;
        Fri, 08 Nov 2019 14:46:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573253166; cv=none;
        d=google.com; s=arc-20160816;
        b=EEMoGISWk72bKrRm62DyWYhHSmbM3YkNG9f0n54QVl4ZzaNesf8XjASr2KRawcfQVg
         JQt+CUuE95MSJo5nBGlNAG/GMwx6Hdkz94xfmxpApwdD4rr7NmSkRpdO1R9+TcmqEPD4
         RBthEzwi1Og2Qqrm9orU1fW44hi9deOYfH3vpItFKOJ6PY/HvOT29OW5O/cCLFGJcBPk
         Efm1VCVdx3T+0BG0Ku5IzB1nrzsrVfX0+YSVQGL0byFG1Y6TsVJB7xTUFhjM8tJNw7B4
         MIt3uIA7Bu7zUs70n0egtVPzdqWVYCwDpXUX0+iElnwxmqxm09ADDuFB40AsGoCtYads
         wKPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=tauBkVrjbdHxvo0j47ev+RStxPX1TKE0sdwLGZbCWTA=;
        b=eAwDus9ocm5gXs3rQWMLF6yHrDu8ARN1qAcx7VbJRLirV60ViG94RcQ4LDxpUaVquX
         SnaRM6eZGWF9vnir8T7No/PO+Q3gsn+W0Ae64q40MET12CdkAu6wznNUWZUK3XNeHO6X
         yoYPpjTtM/RjyRdPyZ1xXMDaAb6OowLPNUy5xzcXWiA09TxOCMEYeoEJWIk1wpB8Xqgp
         pTy2LuzKnY/cz04WeWlBN64w5zuJqt6OWkbo9g6LxvjqAZOS+cMPwPrR6HphTdWKvFAZ
         Kt28GfzS/w8aRPy5HJv8Uius4MICWYthfdDvvp6XOPtGQpdwV7U4gSqB0ACHYjSNQefl
         jzow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aUJtsBl0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 95si5395787edq.244.2019.11.08.14.46.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2019 14:46:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aUJtsBl0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iTD12-0008Kh-Tr
	for alex.bennee@linaro.org; Fri, 08 Nov 2019 17:46:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39195)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iTD0p-0008JE-TB
 for qemu-arm@nongnu.org; Fri, 08 Nov 2019 17:45:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iTD0o-0001eM-Lo
 for qemu-arm@nongnu.org; Fri, 08 Nov 2019 17:45:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46521
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iTD0o-0001eA-Hr
 for qemu-arm@nongnu.org; Fri, 08 Nov 2019 17:45:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573253150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tauBkVrjbdHxvo0j47ev+RStxPX1TKE0sdwLGZbCWTA=;
 b=aUJtsBl0AYnb3+6qDAsvi0R+8UOFYz2iWSBwrYaWe0BsZYxZ4jqtBcjpFNk3YEy8BDofkS
 XGj0r7oNHTuuHi9t+jye0FwUM3EDSIkeYfnlquEs9hZMhZKwWJL5zJOB+cFs9MFajLMmUG
 tlc+TrRy8XAOxO7pW0qFa4U5raI/92Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-SN5_Gsa4NL-LUGOLQ27uEQ-1; Fri, 08 Nov 2019 17:45:44 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8441800C72;
 Fri,  8 Nov 2019 22:45:41 +0000 (UTC)
Received: from [10.3.117.38] (ovpn-117-38.phx2.redhat.com [10.3.117.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B61FE6084E;
 Fri,  8 Nov 2019 22:45:12 +0000 (UTC)
Subject: Re: [RFC v5 024/126] error: auto propagated local_err
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-25-vsementsov@virtuozzo.com>
 <CAJ+F1CJWgQqE-FLVrOSeh8JMc_X5cKxk-iOpDftE1e_T7CsKNg@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9a4efbbb-4dbf-011b-4a0b-4f5cd276379b@redhat.com>
Date: Fri, 8 Nov 2019 16:45:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJWgQqE-FLVrOSeh8JMc_X5cKxk-iOpDftE1e_T7CsKNg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: SN5_Gsa4NL-LUGOLQ27uEQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
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
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Chris Wulff <crwulff@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 "open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, sheepdog@lists.wpkg.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, Max Filippov <jcmvbkbc@gmail.com>,
 "Denis V. Lunev" <den@openvz.org>, Hannes Reinecke <hare@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Liu Yuan <namei.unix@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 Qemu-s390x list <qemu-s390x@nongnu.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>, qemu-riscv@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Juan Quintela <quintela@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Antony Pavlov <antonynpavlov@gmail.com>, xen-devel@lists.xenproject.org,
 integration@gluster.org, Laszlo Ersek <lersek@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Max Reitz <mreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, QEMU <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Marek Vasut <marex@denx.de>,
 Markus Armbruster <armbru@redhat.com>,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oL9kWn6npAT4

On 11/8/19 3:10 PM, Marc-Andr=C3=A9 Lureau wrote:

>> +/*
>> + * ERRP_AUTO_PROPAGATE
>> + *
>> + * This macro is created to be the first line of a function with Error =
**errp
>> + * OUT parameter. It's needed only in cases where we want to use error_=
prepend,
>> + * error_append_hint or dereference *errp. It's still safe (but useless=
) in
>> + * other cases.
>> + *
>> + * If errp is NULL or points to error_fatal, it is rewritten to point t=
o a
>> + * local Error object, which will be automatically propagated to the or=
iginal
>> + * errp on function exit (see error_propagator_cleanup).
>> + *
>> + * After invocation of this macro it is always safe to dereference errp
>> + * (as it's not NULL anymore) and to add information (by error_prepend =
or
>> + * error_append_hint)
>> + * (as, if it was error_fatal, we swapped it with a local_error to be
>> + * propagated on cleanup).
>=20
> Nice improvements. Minor drawback, the abort()/exit() will now take
> place when going out of scope and running the cleanup instead of error
> location. Not a big problem I guess.

Your assessment is not quite right:

Any abort() will happen at the leaf node (because we are no longer=20
wrapping thing into a local err and skipping error_propagate altogether=20
for &error_abort).

You are correct that any exit() will now happen during cleanup, but that=20
is an undetectable change (there is no stack trace present for=20
&error_fatal, so calling error_propagate at a later point in time does=20
not affect the observable end behavior).

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

