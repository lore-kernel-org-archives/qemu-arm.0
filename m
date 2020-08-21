Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp518438lfy;
        Fri, 21 Aug 2020 11:14:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxghwEJu/RMx5F4CNpLVIQVcrYm4m8xwT2qGCcNf7vauyS77oI2TGKTIBeD3Crff82rCH6C
X-Received: by 2002:a25:c102:: with SMTP id r2mr5599664ybf.110.1598033651633;
        Fri, 21 Aug 2020 11:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598033651; cv=none;
        d=google.com; s=arc-20160816;
        b=r8Zr748KwKGlLwaJl7T7sPB3h1f8sOAkSM3u5qkEr8v2XlGp8YcQdONFVnT3GvtLDK
         RAWqFNeKXZAve4OBzppSYWIIIjP4aX7qh6uO2blWmxv1yDz+UZsjNVpqJ00+hgXW9Par
         /pdYLRRP37AU12He1FtiqtqCe2UMQjJUBvcLxictiDF/UvjMZl74snRwdxr7VCF72VTh
         akKlSZAEfs2QFAOIdHnasBXLRM3hkJ6/+YyW8ZrEvwZlxuoTXkdHGEiMtlzaBEVMZQuW
         05+SlgBz1F5TTcSK2UVzucImctqmoGxo7wBDiT3oNLTmWoLSxbbtVVp8rx4Tm9t5nEnY
         7VfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=WVRyCH/0B2Beqz10QLwON7xNDrSJ4bQ0T9yZbTyIBPY=;
        b=WvGZoPWe8zCOtW1pMTy1XFg7lOrm/158f+EkWSGuLDiFH0f/FVnubopEAjkVFoHFeL
         WmEv919A6S+ztyJeb9p8H18qXZ5EDc7n0VPkIa99L+WxieV4gZUmUQHm+xai1dnzS7Lj
         JUunm1jWL/9CBlB3+LTxrjH3pD8lOHeoI58oMwocE4F1CLdh5BhOYWzeg/PiTaZX1O6i
         jCOiDh7bxJT+HryboKrPU7y4JMswv6tpoMdzMNC6QKfqEPc51uIHTCeAUyVGSq0jFc1K
         Gsv9r22PZvddj4c3QQy41p9mgfVEpYh5M9TM3cGatutpwt8xVggi34zZ4Su84cFSd6i1
         c7Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BOyTkDem;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e128si2994121ybf.298.2020.08.21.11.14.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 11:14:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BOyTkDem;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9BYJ-0006D3-0X
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 14:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k9BXx-0006A8-0m
 for qemu-arm@nongnu.org; Fri, 21 Aug 2020 14:13:49 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:20094
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k9BXu-0007Jo-2R
 for qemu-arm@nongnu.org; Fri, 21 Aug 2020 14:13:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598033623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WVRyCH/0B2Beqz10QLwON7xNDrSJ4bQ0T9yZbTyIBPY=;
 b=BOyTkDemATqCywus3tXu06l4dlTjb3eon2a0YiklCZd380npVLl1ARiA5C6pEw2I9RmZXG
 LW4jMOwgf3KSXFILGnLgfZauaqBhHnpDI7UetrFHdQwcV9yzE0thVS6RAkJbJtAOZX+kZo
 fh+jsIZKGDWaSpWPoW0w+0XSfmVTe+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-_gFWXcMqObeVGba3harvVg-1; Fri, 21 Aug 2020 14:13:42 -0400
X-MC-Unique: _gFWXcMqObeVGba3harvVg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 237521009462;
 Fri, 21 Aug 2020 18:13:39 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04A687E331;
 Fri, 21 Aug 2020 18:13:23 +0000 (UTC)
Date: Fri, 21 Aug 2020 14:13:22 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: Suspicious QOM types without instance/class size
Message-ID: <20200821181322.GL642093@habkost.net>
References: <20200820215529.GH642093@habkost.net>
 <20200821014732.GW271315@yekko.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20200821014732.GW271315@yekko.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NwtIQHRMwm1U

On Fri, Aug 21, 2020 at 11:47:32AM +1000, David Gibson wrote:
> On Thu, Aug 20, 2020 at 05:55:29PM -0400, Eduardo Habkost wrote:
> > While trying to convert TypeInfo declarations to the new
> > OBJECT_DECLARE* macros, I've stumbled on a few suspicious cases
> > where instance_size or class_size is not set, despite having type
> > checker macros that use a specific type.
> > 
> > The ones with "WARNING" are abstract types (maybe not serious if
> > subclasses set the appropriate sizes).  The ones with "ERROR"
> > don't seem to be abstract types.
> 
> 
> Comment on the ones within my area:
> > 
> > WARNING: hw/input/adb.c:310:1: class_size should be set to sizeof(ADBDeviceClass)?
> 
> Yeah, that looks like a bug (though we'll get away with it because
> it's abstract).

Right, luckily we are not touching any ADBDeviceClass field
inside adb_device_class_init().

> 
> > WARNING: hw/ppc/pnv_lpc.c:771:1: instance_size should be set to sizeof(PnvLpcController)?
> 
> Ditto.

Agreed.

> 
> Should I make fixes for these, or will you?

Please send the fixes, and I will apply them before running the
TypeInfo conversion script.

> 
> > ERROR: hw/ppc/spapr_drc.c:771:1: instance_size should be set to sizeof(SpaprDrc)?
> 
> I'm confused by this one.  I'm not exactly sure which definition is
> tripping the error, and AFAICT they should all be correctly inheriting
> instance_size from either TYPE_SPAPR_DR_CONNECTOR or
> TYPE_SPAPR_DRC_PHSYICAL.  If anything, it looks like
> TYPE_SPAPR_DRC_PHB could drop it's explicit override of instance_size.

The error is triggered because of this type checking macro at
include/hw/ppc/spapr_drc.h:

#define SPAPR_DRC_PCI(obj) OBJECT_CHECK(SpaprDrc, (obj), \
                                        TYPE_SPAPR_DRC_PCI)

The expectation is that whatever type you use in OBJECT_CHECK
will be the one used for instance_size.  The script also looks at
the parent type, to reduce false positives, but this case was
flagged because SPAPR_DRC_PCI uses SpaprDrc, but the parent type
(SPAPR_DRC_PHYSICAL) uses SpaprDrcPhysical.

Now, I don't understand why we have so many instance checker
macros that use the same typedef (SpaprDrc).  If the code needs a
valid SpaprDrc pointer, it can just use SPAPR_DR_CONNECTOR().

-- 
Eduardo

