Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5116058wrp;
        Tue, 17 Sep 2019 04:21:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyOXZ/oi3netDXYORqskhywfro92LnuP9BDAKbt1ILDkIWySBezG8jJD4XKDB3EDnTzOPj/
X-Received: by 2002:a17:906:e10a:: with SMTP id gj10mr4219883ejb.134.1568719299548;
        Tue, 17 Sep 2019 04:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568719299; cv=none;
        d=google.com; s=arc-20160816;
        b=PT/2Ia7W++27aOHiWtxvWzvG09NoU3OFOcV3k7z7Tomv8zRzyCo6sS30YXPCmkPoI8
         rVQAM+9Wc6EERcw348d9kVABTHX4X0IB8UPCJSLuRJj/7hw3Ehh8ZDlniqdyWuIyhXcO
         ANWjDqNwLAgA2nesTiDi26SfU4c4Z3Nu6nCMN83cGWt4zwUJn5BMkoemEY7bL1y+Wkiz
         6oWryADz1SSLEflGYp9vZNRi/SFGy05IEHneR68UyK0Vg2tEgalCQRTAp7uGoL4DvIYg
         XeHpBJwMwZeYhL8jylmYjUeji9m/hqCl697qjoxZMULAw9HfijQqmCkIJFCcAtzMWm77
         o95Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=NOOiqsOIrK4HvfHKUrqHDbzGgL6JxGma48e2Js6Gp2c=;
        b=e1z+NNmxP1eiVF1VK31QB8MO7Vpc70CxI+NE1+C+mC+rhWDymBMLq7uEUc+B7IXFiU
         gxhZ8R7n80giS2yapcn8pAZjlKwlu4EBMmAEvxKFFwP2MJTF+rhpHNQQiZFeqt3cila6
         06Goz4V7FbCcJ2D/kpI6p2uOHDoAD+Zwm7lLoWfjVXVGEe89vztgG0BHHdOAsdPD6Osc
         6FkRD5h6gghr3WDDVHDdqnXLlgXKf6WN0SK2iKiFu/DLtjhc1iRmJUZfn7iPrN7RK1rB
         jvv2+haprHqaNh4324zOwoytgkOH4zuMfBpgbSsJaSfkvpnuZfUNXLSml1FYOEv/9wki
         lFcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si1055226edm.116.2019.09.17.04.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 04:21:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iABYA-00063Q-7e
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 07:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54596)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iABXz-00063E-HE
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:21:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iABXy-0002xo-0L
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:21:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38818)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iABXx-0002xK-Ql; Tue, 17 Sep 2019 07:21:25 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5E0DE307D90E;
 Tue, 17 Sep 2019 11:21:24 +0000 (UTC)
Received: from gondolin (dhcp-192-230.str.redhat.com [10.33.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A86F919C4F;
 Tue, 17 Sep 2019 11:21:04 +0000 (UTC)
Date: Tue, 17 Sep 2019 13:21:02 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Greg Kurz <groug@kaod.org>
Message-ID: <20190917132102.4031e77e.cohuck@redhat.com>
In-Reply-To: <156871563702.196432.5964411202152101367.stgit@bahia.lan>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
 <156871563702.196432.5964411202152101367.stgit@bahia.lan>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 17 Sep 2019 11:21:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 01/17] error: Update error_append_hint()'s
 documentation
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
X-TUID: F5P831CQKHGG

On Tue, 17 Sep 2019 12:20:37 +0200
Greg Kurz <groug@kaod.org> wrote:

> error_setg() and error_propagate(), as well as their variants, cause
> QEMU to terminate when called with &error_fatal or &error_abort. This
> prevents to add hints since error_append_hint() isn't even called in
> this case.
> 
> It means that error_append_hint() should only be used with a local
> error object, and then propagate this local error to the caller.
> 
> Document this in <qapi/error.h> .
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  include/qapi/error.h |   11 ++++++++++-

It's a bit awkward requiring a local object, but better safe than sorry.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
