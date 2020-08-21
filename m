Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp442858lfy;
        Fri, 21 Aug 2020 09:33:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw44hAbuvNG7SI6mSh0BzNkwQxbibBRBRHN+NOLQhxDemCUXl1goq8tkVRCXmQaUdmVvmRN
X-Received: by 2002:a25:aa72:: with SMTP id s105mr4441964ybi.463.1598027628652;
        Fri, 21 Aug 2020 09:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598027628; cv=none;
        d=google.com; s=arc-20160816;
        b=hn0wEj31tXlLsU6g14kYmHEphupNjcHNfAlstTMlVjPKYb473Rg8F4wKdM401cqpoJ
         g5E5AC/ZtEqikAeTKviCDVMqPk+mHyHXtqKWLKb60EMH7N4xMWvrTuwmU84ARMs3zqqH
         gPJ2y46zdI8argT3zJp8KCmGZQ3FsoNsZs3vx7FwkXKaPZ2Pmm3P8TVgsiA/o4EGypvB
         nxDGpB290EeK8klW3PQTGQHA8jc1kZ/JpFSTWEqcy/OR5ojihDU+BzY2pBZNRd4R04DY
         sIrY3R4Es/tK3wh9wUeSdoK9B//5aadK1RTX8XWwjnze6J2UHNojeNpMoJfyfh3xFiC5
         MtbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=K9+ysj0ADhxljjvkVTxDU5CArgBizmVfverGX7pt2Wc=;
        b=N36vaQd8mfRupKkN2pP/x9CAfVY6/0zxk1t3GteXfJa1HVhN9UKgQL942odLtIJ/Ow
         ExIWC7UtAA95uibGZXOSm5ztVikxq81VtyZ6+SqfNwFvP98PtEAAPShBW2IyeP/73W7N
         37ftw9H32zvlshTxsJ3yhp7vOoqpx+SXYOiv35nVN4Xh21IBDbvEQwSauKX36YBDS4/E
         ATSnDBDHbBMRHSA36+SJPtOK6/mUkFOjf0UvwOytNWLpu818hh7VPTXDPXGlcSVwKMXp
         pSrjgvPDlOEay0JSe/1xsErB7G8mmJShFOgG3wZkmwPPMQcYtq1BOCZUKSyB5vR2l3hA
         PdEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Egl5jY8Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p132si2343389ybc.45.2020.08.21.09.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 09:33:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Egl5jY8Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k99z9-0004wb-W6
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 12:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k99xc-0002Jl-Pc
 for qemu-arm@nongnu.org; Fri, 21 Aug 2020 12:32:12 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47054
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k99xZ-00072z-Oj
 for qemu-arm@nongnu.org; Fri, 21 Aug 2020 12:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598027528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K9+ysj0ADhxljjvkVTxDU5CArgBizmVfverGX7pt2Wc=;
 b=Egl5jY8Zccsj+eArh9TXmBv7hc6Xg7rTHV62jx+xBedKVRUkotW+FTmhpZIuXXM95XRfEe
 qng4yvT3xReyM6sT2PmI1jTPd+AK1Pc6iyJbKWNQIkcXqqwbxjYjiO9UhXOG2A7SFuAdaZ
 0qSS1qtriV/HnBf8bkHnm7/8ueCmhwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-esPZeDNbM4yUXBuoS98RHw-1; Fri, 21 Aug 2020 12:32:06 -0400
X-MC-Unique: esPZeDNbM4yUXBuoS98RHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4D5081F034;
 Fri, 21 Aug 2020 16:32:03 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96D4E60BF1;
 Fri, 21 Aug 2020 16:31:52 +0000 (UTC)
Date: Fri, 21 Aug 2020 12:31:47 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: Suspicious QOM types without instance/class size
Message-ID: <20200821163147.GI642093@habkost.net>
References: <20200820215529.GH642093@habkost.net>
 <CAKmqyKO2z3XMeA9-_hMp0ebdSG03db5FtmbUk3uF-rA9Qi1FaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKmqyKO2z3XMeA9-_hMp0ebdSG03db5FtmbUk3uF-rA9Qi1FaA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 05:15:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Cameron Esfahani <dirty@apple.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y6gx/U6uYkri

On Fri, Aug 21, 2020 at 09:06:51AM -0700, Alistair Francis wrote:
> On Thu, Aug 20, 2020 at 2:56 PM Eduardo Habkost <ehabkost@redhat.com> wrote:
> >
> > While trying to convert TypeInfo declarations to the new
> > OBJECT_DECLARE* macros, I've stumbled on a few suspicious cases
> > where instance_size or class_size is not set, despite having type
> > checker macros that use a specific type.
> >
> > The ones with "WARNING" are abstract types (maybe not serious if
> > subclasses set the appropriate sizes).  The ones with "ERROR"
> > don't seem to be abstract types.
> >
> 
> > ERROR: hw/core/register.c:328:1: instance_size should be set to sizeof(RegisterInfo)?
> 
> I'll send a patch out for this one today.
> 
> If you are fixing all of these as part of a series I'm also happy to
> just let you do that.

Feel free to send the fix, and I will include it as part of my
series if necessary.

Note that register_init_block() relies on the fact that
register_init() won't touch any RegisterInfo field except
parent_obj, so this won't be a one line patch.

-- 
Eduardo

