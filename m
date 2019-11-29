Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp8583700lfc;
        Thu, 28 Nov 2019 23:38:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqxSKEdTJlQ9VRHBDlegq6NzjLAo0hAYOJ7IUrONhLyCp4ZbwPv8Oh43LoZuN+VeMq7u/28j
X-Received: by 2002:a0c:ee91:: with SMTP id u17mr13863747qvr.245.1575013138138;
        Thu, 28 Nov 2019 23:38:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575013138; cv=none;
        d=google.com; s=arc-20160816;
        b=pCW/UuB58oFvfeEicSYN3rBTEU0XgxjotiP6vI4KE9Or8Vkl5FTr2DoSjn35HO7FTt
         DIPnNwhmVZh6C7F4Yxe3Kdp48qXTIBJPRQQ2zLP2XnzFehXXjNPt33cYvTlp17mTHbHw
         kbCd3E5A3tr9aUPwfQf1PQ01piisgbUALaVPjuooYo3esXXtuiAYRe3QgD4NDu5+HJ0r
         k5YaBZbSAZQ6rtSg5346+lU0drBdlHvaLKhdU7vsN4hOQhu7PrjdfgF3wtpVx+VqQ9vR
         xi9+qdPlH/fHDEFYHopLc1VANkTa6vyhvCyDseqj/3lZly9FNVdie4cHaQlWqYqxgQ6M
         LaGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=7ugWduPKYqS1aKmAMjDn0U32aHtRHH1B9URx1vzj2ks=;
        b=kSo3W1Pfeovur57SwQy1JXMGQDCQ4jhkUYUrZDmgi9eKZHok6obo//gwhYRuWy9SOu
         Ke/390RR49nVfK2yqKnkrU3g4mZ47R17zg88TCc3uAHxeqUqi2OGBJx7h+vRV7GPRUrQ
         k0PvAxhKSHj4FQzsi1tDYAVijv/Bu4vMKh+gLAYd8nbxhdKthGipkx22xe8RdXs3B/n8
         Irz17CDFDC3MebgifPFB/MBO4uwTH3pZPMkK5yqSiIBhA/juTGii0Ai50Bkx09Ooq5Ok
         2NgvxNtjOvMvvSissdp3BTwhtRhpw58lNuiOGtv1hR4kOXytAtAjRj2wJxUUvWTcgEKG
         WS7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HeKHdXzZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b41si13624141qvh.37.2019.11.28.23.38.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Nov 2019 23:38:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HeKHdXzZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iaarg-0001pa-Ka
	for alex.bennee@linaro.org; Fri, 29 Nov 2019 02:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60730)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iaarA-0001lv-QB
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 02:38:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iaar6-0003By-5U
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 02:38:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20581
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iaar5-00037c-SS
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 02:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575013099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ugWduPKYqS1aKmAMjDn0U32aHtRHH1B9URx1vzj2ks=;
 b=HeKHdXzZZajgfjtoFIENl2BlJ5EnHLnkCgA1N/f2kN8IMP+SQCV/LS064+A+y5Ul6Jf/2h
 btBz6wvkg9UrDS3HVyjeK95/bRAJk517G5W1+OXIScPErMuUayUU9M+zMEG7OC88rAM1+Z
 0TRxuSoUywg9uO7Rh8sXJPiFjtgx8xw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-xwHUKyogMpa-cfP15TsnQQ-1; Fri, 29 Nov 2019 02:38:11 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A42ED800D53;
 Fri, 29 Nov 2019 07:38:09 +0000 (UTC)
Received: from gondolin (ovpn-116-140.ams2.redhat.com [10.36.116.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAB825D6D2;
 Fri, 29 Nov 2019 07:38:01 +0000 (UTC)
Date: Fri, 29 Nov 2019 08:37:59 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost
 <ehabkost@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH] hw: add compat machines for 5.0
Message-ID: <20191129083759.7e23a97e.cohuck@redhat.com>
In-Reply-To: <20191112104811.30323-1-cohuck@redhat.com>
References: <20191112104811.30323-1-cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: xwHUKyogMpa-cfP15TsnQQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VZ2nwRrV7QGf

On Tue, 12 Nov 2019 11:48:11 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> Add 5.0 machine types for arm/i440fx/q35/s390x/spapr.
> 
> For i440fx and q35, unversioned cpu models are still translated
> to -v1; I'll leave changing this (if desired) to the respective
> maintainers.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> also pushed out to https://github.com/cohuck/qemu machine-5.0
> 
> x86 folks: if you want to change the cpu model versioning, I
> can do it in this patch, or just do it on top yourselves
> 
> ---
>  hw/arm/virt.c              |  7 ++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 69 insertions(+), 6 deletions(-)

Queued to s390-next.

