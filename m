Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp276837lfq;
        Wed, 23 Sep 2020 02:15:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpx3FBjmm20iaPSKZM2FXTpDY15zpDyrKQyerZ0IDGL2l3OjoX7ZeOdluhMQ8a3sKjIB17
X-Received: by 2002:a17:906:2747:: with SMTP id a7mr9077101ejd.301.1600852533234;
        Wed, 23 Sep 2020 02:15:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600852533; cv=none;
        d=google.com; s=arc-20160816;
        b=nMNzrbk4rUdBOOTrn6uvN8rQ9ksw1HgwKDYmjiTJV9mDlhEadI3CVsRRXjtbvO0Xn+
         HGrhAxhquF+MYtA2hlT9Wy5r6x3fivXoKt/pW/qvsLb9Y0Vx/GjYOZTwQ7FMG8AK2k0d
         ktglVa47tVkFG359ikDU9MkoUdNvcrygm/wqj4HzG7hTTs/Fh86qxtICgOa1Gw2dswEV
         xyJrSNZd6bU5Sc3sO2hOSTM2hpW81XFZtW7SiChhDXJWd3P+7LzLJ5abebFH+RIXxUGB
         mad6uQIqnbUQVyyVXrq4q1tGxUDXagLrEyV/93UZbmTnbAPFL/bBNgX7vN/hpgQzAnk8
         50zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-disposition:in-reply-to:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=gvE1WWYK2A6oHFuZMILxDD6bW0p1EgPD4Z1lIxbzBuE=;
        b=BD73U5NXST4fz6XeG386LVf+MBhGDbTlGD3nDbjoqg+CHynANHQZ/veN1RbPVc64N3
         j3xyhNQhISQvBtMJlvrS4cuajqGKHRGix8gGz5L5h8+rvZP/8Sa4NV2QM4/+54JoAz0z
         d6dtfv7439Of1qCrzOXezLiM3bcP5QcKoBjGQc8fI6Oud6q/UbanmVO/77faGQbmdjEa
         2O496GLQ/7bWShUNwgtNaot93GpAr37ZIVkAas908GpFx4g9WHx1J2WN2hixGYn4ZUKe
         YVsIwRFRirijxR+E5kLWHR75mnvP+mbosxLj5bGA2Dl4d1PXwA5edN3fbOvqjvicWaO8
         jc0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jrfs2LcI;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id v10si11835514ejf.80.2020.09.23.02.15.33;
        Wed, 23 Sep 2020 02:15:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jrfs2LcI;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgIWJPc (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 23 Sep 2020 05:15:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35966 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726178AbgIWJPb (ORCPT
        <rfc822;kvm@vger.kernel.org>); Wed, 23 Sep 2020 05:15:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600852530;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gvE1WWYK2A6oHFuZMILxDD6bW0p1EgPD4Z1lIxbzBuE=;
        b=Jrfs2LcITAMDSUccFeS32EwB3Zj+usnLP2UMFEwzRlaHhZPw6lUe3nbWNu9jjGq+JeASzl
        ivKGvXo8fWtpTHBvI2/Mt3c4sYy3Tj8X/UEuUhgQJmUwCHb/dh5OwvkZlCyjcrq/hxPokA
        Z814Ja5IrlqZFgYb1clktqJvPP3xz3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-rh6mPe3GNYKmYVs-QqDXcQ-1; Wed, 23 Sep 2020 05:15:28 -0400
X-MC-Unique: rh6mPe3GNYKmYVs-QqDXcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0918E81CBE9;
        Wed, 23 Sep 2020 09:15:24 +0000 (UTC)
Received: from localhost (ovpn-114-98.ams2.redhat.com [10.36.114.98])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 218BD73682;
        Wed, 23 Sep 2020 09:15:12 +0000 (UTC)
Date:   Wed, 23 Sep 2020 10:15:11 +0100
From:   Stefan Hajnoczi <stefanha@redhat.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
        Eric Blake <eblake@redhat.com>, Peter Lieven <pl@kamp.de>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Sagar Karandikar <sagark@eecs.berkeley.edu>,
        Alberto Garcia <berto@igalia.com>, qemu-s390x@nongnu.org,
        kvm@vger.kernel.org, Liu Yuan <namei.unix@gmail.com>,
        Jiri Slaby <jslaby@suse.cz>, Fam Zheng <fam@euphon.net>,
        Paul Durrant <paul@xen.org>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Max Reitz <mreitz@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Michael Roth <mdroth@linux.vnet.ibm.com>,
        Kevin Wolf <kwolf@redhat.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        qemu-arm@nongnu.org, Yuval Shaia <yuval.shaia.ml@gmail.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        sheepdog@lists.wpkg.org,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Juan Quintela <quintela@redhat.com>, qemu-riscv@nongnu.org,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Stefan Weil <sw@weilnetz.de>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Markus Armbruster <armbru@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, qemu-block@nongnu.org,
        =?iso-8859-1?Q?Marc-Andr=E9?= Lureau 
        <marcandre.lureau@redhat.com>, xen-devel@lists.xenproject.org,
        Laurent Vivier <laurent@vivier.eu>,
        Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
        Richard Henderson <rth@twiddle.net>,
        Peter Maydell <peter.maydell@linaro.org>,
        Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH v2] qemu/atomic.h: prefix qemu_ to solve <stdatomic.h>
 collisions
Message-ID: <20200923091511.GD16268@stefanha-x1.localdomain>
References: <20200922085838.230505-1-stefanha@redhat.com>
 <33631340-e3e3-b10f-4f9a-0e1b295d79ef@redhat.com>
MIME-Version: 1.0
In-Reply-To: <33631340-e3e3-b10f-4f9a-0e1b295d79ef@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fXStkuK2IQBfcDe+"
Content-Disposition: inline
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 3NEz6Whc/cc5

--fXStkuK2IQBfcDe+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2020 at 01:35:37PM +0200, Paolo Bonzini wrote:
> On 22/09/20 10:58, Stefan Hajnoczi wrote:
> I think the reviews crossed, are you going to respin using a qatomic_
> prefix?

Yes, let's do qatomic_. I'll send a v3.

Stefan

--fXStkuK2IQBfcDe+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9rEh8ACgkQnKSrs4Gr
c8gTtwf+L4MHcbTtPkPfGurD9HXiLneXdmU2Q4SPmoHhAEE2Wbmuh1VKIQNNwt+x
I3kSaG5NIrp9zk9jS8GE9FWVptoivF6LWnPwiKzYpYZyUM9XCn8cAtSI6NYDAihv
92qRGSxnew/1NI16GyTPG1kOYANTA8lB0b4OPYiM9etANay2R+YSLHfE5dX39Tjc
22dNsOVk+wKvzIaNwhuMCbvQIlixtWeD+pdqZ83iVSYfKHv1r2ciEDBVMDwEJPJw
k0jSoJ5Q1uxxkX1WfxuARIqog42u43rhrbhQmpf9di13QrTPotosVA5L7lK/fQ1X
FAhr2AqUH1OMGEVUvZniHgHfu0yLpg==
=Qvv9
-----END PGP SIGNATURE-----

--fXStkuK2IQBfcDe+--
