Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5119399wrp;
        Tue, 17 Sep 2019 04:24:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzIf+da3IimHzTFeGzJ3VZNi67Fwbh7ck66Z9BO019x/5kdB+T7j9qcnJtMoXnDic6cLWhA
X-Received: by 2002:a17:906:6818:: with SMTP id k24mr4096518ejr.271.1568719486393;
        Tue, 17 Sep 2019 04:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568719486; cv=none;
        d=google.com; s=arc-20160816;
        b=jro95lT+ne0p9iNLmlxF60/IBdC4kIW7ENQkW7BjUquXgNXsCIp/k1wiEBNfyRP7zt
         8MGmIqORBAOXRVDkPVc/dwkyO5pz03za+pc8Hba+dJ43mwiCnShCSGrTaR/Sfk9z0t1O
         jcWJAjp+e8Q2FyR2QAdbnz8kALFl1mOijrIEPPRTKSgmjcQ/GvnBn2y1X5ORD9aAMCLJ
         t60fS9JRVrqT13C8P3n3JTnSzoyzEi6z0IMiS4hrf/mHD1iiPRTK8KD27kNIogUTLlDe
         T2NtHMhtg78EGmHOfeervoki4gTjrGlCEo5/YL2p32cm1DkVCBSunigk48OA6Uf7io3X
         Khkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=j7Dl+tx8vsSAjIxyMLnnKEWDOMdherngiWI/jirlyLk=;
        b=os9bJ2gIh4WHEDWTM80ySkSfQQtEieeL91HOtTBYgzF57TYG99HwT3VUsBhf8/LRyQ
         l8kugw9aI6aMOJgqI1NxxG7LyevzPv/9MtkPRSn/eWuFLfFyAWOrZ/NMdFaILnjNFeDD
         ak5IVfvomWmLdG9ibAKN7irVbZH+EecoT1giFQaG0/rojzdQMcOQJnOozpjuGdvVnfUm
         TBY/MoD3wjhaYHlez5imze44mz7q7Z7Gt1C6MtRweRkFU36CtSq0ZoUxb9n+6t3uRrSF
         GEjrRyceU+tQH3w7WkGeANz5vVSZeFZjkjsnjOWNOfVpTrZGlvx1d2yPy/WPne2aVxfh
         8lgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11si876405ejo.299.2019.09.17.04.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 04:24:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iABbB-0008TP-0c
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 07:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54995)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iABb1-0008SX-OC
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:24:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iABb0-0004az-Dk
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:24:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33182)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iABb0-0004ac-7O; Tue, 17 Sep 2019 07:24:34 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3F0D0308A968;
 Tue, 17 Sep 2019 11:24:33 +0000 (UTC)
Received: from gondolin (dhcp-192-230.str.redhat.com [10.33.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F2C36012C;
 Tue, 17 Sep 2019 11:24:14 +0000 (UTC)
Date: Tue, 17 Sep 2019 13:24:12 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Greg Kurz <groug@kaod.org>
Message-ID: <20190917132412.6610576c.cohuck@redhat.com>
In-Reply-To: <156871569396.196432.12307975838741351907.stgit@bahia.lan>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
 <156871569396.196432.12307975838741351907.stgit@bahia.lan>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 17 Sep 2019 11:24:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 10/17] s390x/css: Pass local error object
 pointer to error_append_hint()
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
X-TUID: WcvpEHKtSfP5

On Tue, 17 Sep 2019 12:21:34 +0200
Greg Kurz <groug@kaod.org> wrote:

> Ensure that hints are added even if errp is &error_fatal or &error_abort.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/s390x/s390-ccw.c |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Can also take this via the s390 tree, let me know what would work best.
