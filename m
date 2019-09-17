Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5122324wrp;
        Tue, 17 Sep 2019 04:27:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy3q0zaOxyrB2sfBmvY45z3GWZSw048NvcwwvTeNshL3rcknMPKDHbVUHGKHHPVE7LTJGyD
X-Received: by 2002:a37:2c44:: with SMTP id s65mr2910870qkh.303.1568719628149;
        Tue, 17 Sep 2019 04:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568719628; cv=none;
        d=google.com; s=arc-20160816;
        b=o7btGp0khsH0c4ncmI7Jzli+AmJlRsA96OYRVoslWM535fNyKGImF9paK+JSKt0Ike
         AGJBn4AcjJR58YH0GGUBAaMSB+5FLFVxXdbKlztfwv0j4Z+D0Zh7K67R6PW64vCAPhxp
         LW1+MDgFyLpemdg4Sd+4jgXbyD2P5rCzHUCyID5/vk7TSj0SZHWIzuACuXYY9nT5C3b/
         xyGGnFwVevL7yutowfaZF2vSTCD5+kyh//aAGC7c3kjJhryksr6WwUYkA8Fr8oGfZbya
         WnBlV5fvb9++v9Ee7k8ksZF+7flNTTIZToRex2s5lpzWB9V7ChzONGIkx1DU3BKzLpYc
         JGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=UQGrVJwPgGrff2LFCWLfE5i/OvHSGkdofBVEvx92zIk=;
        b=wVIG16zJS2XTQEKv02/RdDk4QKZgokYNKbpC90pJHiDruckO7QaalhxfTWwvK3oV2M
         HRani80sbxIJ87U8taqkICQph1N5zRD8giDmJxY+KwS3ySw9Z89cka1+AIoVMJpFRPzO
         0k6jOUmL9c7lbDapVjQfkxoy5z/IIiwbjKO2fvIMOyLz9msyu9GW+rwwpnIJKUUO9Pcw
         j3eoHgD7bKvEcry+ZHIwRRDunOWTCb3/4f0fGUDad8yLuI2fZklTv7Rgt7dxbaKQPzYD
         INXRSI9jktD0jqbVE4czSR5FM5WPoREuboDQ6YSV8pvcKrzeRBW3wQB6oCZCnhSBVijT
         btqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k1si738036qtm.89.2019.09.17.04.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 04:27:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iABdT-0001eO-Ab
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 07:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55343)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iABd8-0001eD-Ep
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:26:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iABd7-00067s-FX
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:26:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48792)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iABd7-00066l-9d; Tue, 17 Sep 2019 07:26:45 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 038B9C04B302;
 Tue, 17 Sep 2019 11:26:44 +0000 (UTC)
Received: from gondolin (dhcp-192-230.str.redhat.com [10.33.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A19745D9E1;
 Tue, 17 Sep 2019 11:26:26 +0000 (UTC)
Date: Tue, 17 Sep 2019 13:26:24 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Greg Kurz <groug@kaod.org>
Message-ID: <20190917132624.09551e2a.cohuck@redhat.com>
In-Reply-To: <156871566867.196432.11276188812327366259.stgit@bahia.lan>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
 <156871566867.196432.11276188812327366259.stgit@bahia.lan>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 17 Sep 2019 11:26:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 06/17] vfio: Pass local error object pointer
 to error_append_hint()
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
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1eaxVaL0V2HB

On Tue, 17 Sep 2019 12:21:08 +0200
Greg Kurz <groug@kaod.org> wrote:

> Ensure that hints are added even if errp is &error_fatal or &error_abort.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/vfio/common.c |   14 ++++++++++----
>  hw/vfio/pci.c    |   12 ++++++++----
>  2 files changed, 18 insertions(+), 8 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
