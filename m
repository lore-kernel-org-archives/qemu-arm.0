Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2732700lfy;
        Mon, 24 Aug 2020 10:27:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz08TmNAKIc4BvPl9FA0vV8vylMArOZWR/0ivP6zmJO8YGlZerudV1sWewq14dHgEYlB6xm
X-Received: by 2002:a5b:486:: with SMTP id n6mr8445390ybp.432.1598290034575;
        Mon, 24 Aug 2020 10:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598290034; cv=none;
        d=google.com; s=arc-20160816;
        b=GccEGk+Sa/1Qv84qICpnKqB+sucuJvbQXaPNrXRIaBkOMSx/s/KrHLQtKEg3i7uk2K
         LRZ7rNMS3lTgeST8Y0hjTn1LwMe6BMu6GsmvqKTvWLpHscBqFzQwzrZYproGZF87sxPA
         qw9SZDVOjwRJi4PvV9r5aogIXQXi++0rvBtOH4uJHcmmi/Z7vF0g/SzBuV7rLWMyKYtF
         vckjXWrS69iSuangcZ7SAZLBfiQA7fhHXRujMWW/N3odvowI/ad5xfQUMyvwpxIwJndb
         gllz/zYstSvodUbp8h0YidUKaYL9O6Mit9vjOyRXkKYHTNRg7ouQ8/tzJg66WPvpYboq
         PW+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=/EQdte3a7gN2c/yTNsv5BVC/KYzBgy+gPm2x+r74Prc=;
        b=UarBoTUCGlEuYIF6sfWpT1Mgjuhu6Oi38hA3hPeFUHqlX/G2f+zn2mDGE/bwXiggYk
         Yo7UQ1gHu0X1hUip83yPP1+ATTQz06TEa6pHjga/MXsQRKV8QdrrwD5QDYkiLF+egFLJ
         NKW7ol5Gor9usjT07VsSmBUCPPSkdFYT5MtwpoWwL+20c1fAH74ocYGeheClgrd3l4eA
         ORcdgJBOiw5KyRAfsjm9yPEc5HXaZd+mSYlkSOSpdYVrc/sKf5jF9NpmpADwfGRzowON
         DB8NDr5cRWmOSDGSDkrAdweRjRF+nM5KiE9Y1tzFyoGQNdLlYdmrald920vdq+88h25W
         fb0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="bwd/ALg3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 77si12106921ybc.208.2020.08.24.10.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 10:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="bwd/ALg3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAGFV-00067x-VF
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 13:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAGFO-000676-C0
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 13:27:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35960
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAGFL-000715-SP
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 13:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598290022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/EQdte3a7gN2c/yTNsv5BVC/KYzBgy+gPm2x+r74Prc=;
 b=bwd/ALg3Ixm0kegqUVrUXT/GsK5oQW2dpdgJLTDG1UkONaXbArTOcFWLvmUMXVDZjhaSvC
 2P/2ZGtz9Z0PB6NIadA9AiE2iuxqyhdMkWhnAaZsCxoHrHKLN9FKWGWw23MVmmsmKPaG+Y
 3LTFZcgebMm5idpu2verwaY83gyTrKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-5KzmFjCvObu1NSGEX4MBIw-1; Mon, 24 Aug 2020 13:27:00 -0400
X-MC-Unique: 5KzmFjCvObu1NSGEX4MBIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39D67100670A;
 Mon, 24 Aug 2020 17:26:58 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E21C100238E;
 Mon, 24 Aug 2020 17:26:48 +0000 (UTC)
Date: Mon, 24 Aug 2020 13:26:47 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: Suspicious QOM types without instance/class size
Message-ID: <20200824172647.GQ642093@habkost.net>
References: <20200820215529.GH642093@habkost.net>
 <20200821105352.GA89922@SPB-NB-133.local>
 <20200821172927.GJ642093@habkost.net>
 <20200821174802.GK642093@habkost.net>
 <20200824164134.GA41106@SPB-NB-133.local>
 <20200824164552.GP642093@habkost.net>
 <20200824170642.GB41106@SPB-NB-133.local>
MIME-Version: 1.0
In-Reply-To: <20200824170642.GB41106@SPB-NB-133.local>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 08:00:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Cameron Esfahani <dirty@apple.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v7QPKMPocZU4

On Mon, Aug 24, 2020 at 08:06:42PM +0300, Roman Bolshakov wrote:
> On Mon, Aug 24, 2020 at 12:45:52PM -0400, Eduardo Habkost wrote:
> > On Mon, Aug 24, 2020 at 07:41:34PM +0300, Roman Bolshakov wrote:
> > > On Fri, Aug 21, 2020 at 01:48:02PM -0400, Eduardo Habkost wrote:
> > > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > > > ---
> > > > diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> > > > index d81f569aed..81d1662d06 100644
> > > > --- a/target/i386/hvf/hvf.c
> > > > +++ b/target/i386/hvf/hvf.c
> > > > @@ -878,13 +878,11 @@ static int hvf_accel_init(MachineState *ms)
> > > >  {
> > > >      int x;
> > > >      hv_return_t ret;
> > > > -    HVFState *s;
> > > > +    HVFState *s = HVF_STATE(ms->accelerator);
> > > 
> > > The file also needs definition of MachineState:
> > > #include "hw/boards.h"
> > > 
> > > >  
> > > >      ret = hv_vm_create(HV_VM_DEFAULT);
> > > >      assert_hvf_ok(ret);
> > > >  
> > > > -    s = g_new0(HVFState, 1);
> > > > - 
> > > >      s->num_slots = 32;
> > > >      for (x = 0; x < s->num_slots; ++x) {
> > > >          s->slots[x].size = 0;
> > > > @@ -908,6 +906,7 @@ static void hvf_accel_class_init(ObjectClass *oc, void *data)
> > > >  static const TypeInfo hvf_accel_type = {
> > > >      .name = TYPE_HVF_ACCEL,
> > > >      .parent = TYPE_ACCEL,
> > > > +    .instance_size = sizeof(HVFState),
> > > >      .class_init = hvf_accel_class_init,
> > > >  };
> > > >  
> > > >  
> > 
> > However, the hvf patch above shouldn't require it.  You should be
> > able to apply and test it on top of qemu.git master.
> > 
> 
> Yeah, that's correct, thanks.
> 
> With the include fix for hw/boards.h, the patch works:
> Reviewed-By: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-By: Roman Bolshakov <r.bolshakov@yadro.com>
> 
> BTW, am I expected to see the accel in "info qtree" (or qom-tree)? It's
> not there for a reason.

I don't know if you are expect to see it.  I don't think there's
explicit code to attach the accel object to the user-visible QOM
tree.

-- 
Eduardo

