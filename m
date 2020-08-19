Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp487938lfy;
        Wed, 19 Aug 2020 07:11:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqEkiF1wOPxXDY4B5mwVBEEyBOS7gQ99jm72yLpJndAEi7/+JsjoeGH5+/aYHWk3POjiga
X-Received: by 2002:a25:cc12:: with SMTP id l18mr34633582ybf.224.1597846290596;
        Wed, 19 Aug 2020 07:11:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597846290; cv=none;
        d=google.com; s=arc-20160816;
        b=0DcpGThZvjCfOypSqhmwJ0IFVuzvjDnlSLbSRkMtLJNiVavw65WCCoC4mRZZe8mLQb
         yt47pbIGfpuEdBMMfLBV9NvCqEjSCQEUpmwGPne/8WFUUpQfEMUIa8ln9EcprJ/vtq63
         GvXJtLiQhTOBPGudjyYmK7u5csz+qgE7OUCKT6zyKR+EJd4o529IDcXDIP7O3N6mJpxI
         Way+sZvNc7BgaDgCtTFcHyJaMu452flUoh1tGhy3jet8wgE+V4/sF7QKzrRuiQA8S9dG
         W684VwiDwfJzUMU2Ho0AMTcyB2zss06Nl7zQjdjR9n7Xi54KQbIg8H0TGOr/KEgCXN1D
         ILTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=fPcpcj0+q4neAxL6WMmwvDt0WiThR+anvePmt9mxJAE=;
        b=oG66IOivIC7sgLsNBKdz5YoNfexbszBNCWCj+dcVFzk6j0jkztV1L8AdcDbFYazbA4
         YEM2FiPoNwugG/f8cOOEZdVMsH97mnr/ZhMvPRH85s3c9yxGnr4mx0PaQPpxBPqkireU
         fQyxKfV9099Oc4RlsEEy2PLjPtpEhdclIHZ3+AtJ5Yi9wOwjP4SlqS5DfKx/L4tA+4dI
         48s9HcDjG/iC4Ob91Tlixplr4038WhHIsB2ePXruFeEp/3zE3AamqvYn6TEvslDezdW0
         sKY37gzxNHldMZqoPIFAgfoEcsZGeIYh0o+xUZ/cvfiyXSn/n70Jtrm1KHKo9fYfRtig
         KdjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c0IzJfdg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6si24525395ybc.228.2020.08.19.07.11.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 07:11:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c0IzJfdg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8OoM-0006RR-1D
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 10:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k8OoD-0006Qw-8C
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 10:11:21 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40374
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k8OoA-0006LZ-DY
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 10:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597846277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fPcpcj0+q4neAxL6WMmwvDt0WiThR+anvePmt9mxJAE=;
 b=c0IzJfdg9RssdaUu/InDvIUM/QT0Onc78Hrmg8Vx3ERd3tgLp/YAZLdoZZOiyTzcjB4OZw
 b1rqpWPAgNwTTgZkz2ikaTlp2caG7njbmZj/4MqJJXFhSgizwiGs5Yro3q3CSnQ64c03ha
 lnhAxY2vvd6j6hXwqPBME8mBsuSCOCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-q1J_Fu5ZMv2R9vQOoRhYbg-1; Wed, 19 Aug 2020 10:11:15 -0400
X-MC-Unique: q1J_Fu5ZMv2R9vQOoRhYbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFCF81084C8E;
 Wed, 19 Aug 2020 14:11:12 +0000 (UTC)
Received: from gondolin (ovpn-112-216.ams2.redhat.com [10.36.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB0BA709DC;
 Wed, 19 Aug 2020 14:10:59 +0000 (UTC)
Date: Wed, 19 Aug 2020 16:10:52 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v6 2/7] hw: add 5.2 machine types and 5.1 compat options
Message-ID: <20200819161052.51f73185.cohuck@redhat.com>
In-Reply-To: <20200819145425.622a0751@redhat.com>
References: <20200818143348.310613-1-stefanha@redhat.com>
 <20200818143348.310613-3-stefanha@redhat.com>
 <20200818171132.551e2c72.cohuck@redhat.com>
 <20200819145425.622a0751@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 01:46:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Richard Henderson <rth@twiddle.net>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Max Reitz <mreitz@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0lzWmDXR7OLv

On Wed, 19 Aug 2020 14:54:25 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Tue, 18 Aug 2020 17:11:32 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Tue, 18 Aug 2020 15:33:43 +0100
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >   
> > > arm, i386, ppc, and s390x have versioned machine types and associated
> > > compatibility options. Introduce new ones now that QEMU 5.1 has been
> > > released.
> > > 
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > >  include/hw/boards.h        |  3 +++
> > >  include/hw/i386/pc.h       |  3 +++
> > >  hw/arm/virt.c              |  9 ++++++++-
> > >  hw/core/machine.c          |  4 ++++
> > >  hw/i386/pc.c               |  4 ++++
> > >  hw/i386/pc_piix.c          | 14 +++++++++++++-
> > >  hw/i386/pc_q35.c           | 13 ++++++++++++-
> > >  hw/ppc/spapr.c             | 15 +++++++++++++--
> > >  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
> > >  9 files changed, 73 insertions(+), 6 deletions(-)    
> > 
> > https://lore.kernel.org/qemu-devel/20200728094645.272149-1-cohuck@redhat.com/
> > is already out there :)  
> 
> That one doesn't apply anymore (or I did something wrong when applying it),
> 
> but Stefan's version applies cleanly

Seems that there were some changes afterwards. I'd prefer to just
respin mine, though.

