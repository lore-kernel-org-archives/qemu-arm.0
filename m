Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3588524lfb;
        Mon, 16 Nov 2020 02:38:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoDp9afINlZRS5oFhys5XvnxwQrS86OrL7D/zn8kXMuMWKhI9J3gHH03hlc+gg7KUufU03
X-Received: by 2002:a25:e08c:: with SMTP id x134mr7122449ybg.309.1605523121980;
        Mon, 16 Nov 2020 02:38:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605523121; cv=none;
        d=google.com; s=arc-20160816;
        b=Ot/URoUZ9Zv0QjrBxohgU0MSm3cUqNuBU2RV9yB8RIxA1yq35Lz6D8kpLN9ig1hnLQ
         hEv7JUBMV8ypkI84aVD/FqqvSGWfI5TrR3dLxUKxjR9a7Q6m/YSEwAJCtNBECMRUMt87
         y8MOhWJ0CL8FTnxyIavy/kCxI7dFgfOVEPuFDc6mAk9454IoRMWdZKKzsFRD1b7vPV8y
         0uFtHOAZdZBykmM9c9OldSHHgLmE5/d/JMmU0Rwf7gwYYpxhsLHEeWaBdHU00KzvUedj
         J2t9vuW3rXaMZug2MlFYiUNRwuEYHfTXeXu/dDx89YCxk8vokOkXbsOyQsFOBiHGerY2
         OXlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=ubs2hT0zU4v64bpfO4KA+bCKNPNjD4r2MoAescTJVK0=;
        b=fwYC8WF/8Jr1LEzY79XpcQYR/d8gbhJRc9Rs7Zx81gIgbU4NHeAxi3xXLP67bl7zrH
         vsiJXNFmGtPVnPOteKaC2vSE7EeW0iGQD6noMZeloKG8NDeNK8Dli8283WtNPExmK35V
         cFStXtEF2YhwCoDznGGZubbVN+mYBkbhh7J1T8oIohe2Q1Mj9Ou8sU+RldeTwXvyVFtB
         O6T2mAwiQphM4slGDxVMYqZFWOlRZgMamiL8VG8HHi1PVno/RDirgMeHYxPSWe26cfUu
         9mETcqT2mohN2+VX6IStwSHhgKORnw02Sq+mlLvbn0TV2Th79M/PljfW1h4LaZuj9bCp
         v6lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TRAFpsth;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z127si944788ybf.354.2020.11.16.02.38.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 02:38:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TRAFpsth;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kebuD-0004q5-CO
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 05:38:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kebu4-0004pu-FU
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 05:38:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kebu0-0007Mk-Dg
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 05:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605523106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ubs2hT0zU4v64bpfO4KA+bCKNPNjD4r2MoAescTJVK0=;
 b=TRAFpsthciim8fA43AOKXEI+iDU6h4OWgJIFmc61KM/cW/KaArllPXdmllMYpr65ZiPWYC
 UGsJQoDrnTFqsY93kiZ+Pd2+XAVeCDjwX9NgIfn30H3/NP6Q2HkCsFtxvgJfV0sdGwrTQW
 Mf5ezGp5FFO8qgTVr1w6Fmp66yFrxP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-hKlRJB8lMlmoLAhoeB29ug-1; Mon, 16 Nov 2020 05:38:24 -0500
X-MC-Unique: hKlRJB8lMlmoLAhoeB29ug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B595087951A;
 Mon, 16 Nov 2020 10:38:22 +0000 (UTC)
Received: from gondolin (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 318D010023A5;
 Mon, 16 Nov 2020 10:38:15 +0000 (UTC)
Date: Mon, 16 Nov 2020 11:38:13 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] hw: add compat machines for 6.0
Message-ID: <20201116113813.619aa510.cohuck@redhat.com>
In-Reply-To: <20201116112314.3e999cae@bahia.lan>
References: <20201109173928.1001764-1-cohuck@redhat.com>
 <20201116112314.3e999cae@bahia.lan>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HStXlOv/tXeu

On Mon, 16 Nov 2020 11:23:14 +0100
Greg Kurz <groug@kaod.org> wrote:

> On Mon,  9 Nov 2020 18:39:28 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > Add 6.0 machine types for arm/i440fx/q35/s390x/spapr.
> > 
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> >  hw/arm/virt.c              |  9 ++++++++-
> >  hw/core/machine.c          |  3 +++
> >  hw/i386/pc.c               |  3 +++
> >  hw/i386/pc_piix.c          | 14 +++++++++++++-
> >  hw/i386/pc_q35.c           | 13 ++++++++++++-
> >  hw/ppc/spapr.c             | 15 +++++++++++++--
> >  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
> >  include/hw/boards.h        |  3 +++
> >  include/hw/i386/pc.h       |  3 +++
> >  9 files changed, 71 insertions(+), 6 deletions(-)
> > 

(...)

> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index 98b87f76cbbe..c5a6c517bb9d 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -28,6 +28,9 @@
> >  #include "hw/mem/nvdimm.h"
> >  #include "migration/vmstate.h"
> >  
> > +GlobalProperty hw_compat_5_2[] = {};  
> 
> Maybe worth putting the }; on the next line so that the next
> change has a prettier diff ?

That's mostly because I always copy from the last incarnation of that
patch; but can try to remember to change next time.

> 
> Apart from that,
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks!

