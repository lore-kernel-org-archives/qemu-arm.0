Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8311874lff;
        Thu, 16 Jan 2020 04:39:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqy60Anl0LKs/8LiSEH8knn3URQsQBbIx0xcAGdjSPivniRfNYZ1ELh9lMl4otqQhTHHInH8
X-Received: by 2002:a50:84ab:: with SMTP id 40mr15580142edq.14.1579178358949;
        Thu, 16 Jan 2020 04:39:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579178358; cv=none;
        d=google.com; s=arc-20160816;
        b=bOeaCBnYolrb0F5fo+zPHK3dU3Rck/ZDm9wGj6h8wkIgiQ3Fxw894bQcDfUZqRggfd
         w71mcclX5AInfs+pXnpDdDToGKa1Fk1AyKfktittFxcl7KRSqwflQraNY7/z8bZZD0Aq
         y8tsUbcAe37HVsOD5FySexbrMnMy/iuRJZ3lqJ+83oczIA0efcNV0nSj6/R4qsLnI6WI
         8TPX9lw+S5KwRspSgdQG2/ZBIjBPO/fsMAYBtKXNqGfE69MI2xFNCIETLFHueBJFXNJk
         jwSGccZYybTWWZbCe0BoMLP7Hl0rJnIcklWOLtbfkr/uBM7OfEmTOAgHTppctQVITu/1
         pcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=E2U1XuLTgxp52sKLJtlis6HwlaEIREo1sR0zlgxMg7o=;
        b=NkHwsz76ZSdzjEdHmEHn6OzfyLHTo6vjWF6v/B9BL7K6QIOsyNve9ZDWVx2o0ZtvOT
         PBYxQO80vxCdQQ+V4WXalEFnWS5qagiXyM23s4IeTDDWVZ/UGfe4h0nATsQodWom4VNw
         msmfLmUQ/Ny072Z2dKb1Ehg1abfGMkYgCs1neZwdH6D4kkjKMl/H9zLSQsuWJ6hLtrYU
         FkSKFWv0BwAO3uCvtNDE2o0zwmbBeZBhyzWX1R3VBO4euz3fr/e9JdiShsvY7vcqKWFb
         RV7udmp8IW17YlplHudeiY6unf7z5/hPpA8UP3L4nhtxo6wOT6KNt8SNi1jS/bsjlu+b
         85CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NtfWrX2g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i25si13971197edy.18.2020.01.16.04.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 04:39:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NtfWrX2g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is4Qf-0000Mn-EY
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 07:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1is4Ol-0005cS-9L
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 07:37:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1is4Oh-00077i-Ou
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 07:37:19 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31343
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1is4Oh-00077B-ED
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 07:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579178235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E2U1XuLTgxp52sKLJtlis6HwlaEIREo1sR0zlgxMg7o=;
 b=NtfWrX2gyMe8HHbzLK8QEYuKHJ4KrsAVSBc4H/RFX8xVLGsSypDiz2tYIvhe98HF+p0p7H
 1hiuMW2wr1GcrzX6srLWSwou+d61MFcaVEin9Wu+ugZ491Z/J5sPK3b57BM0iJCKjHDaPw
 8OTg0eYP3iZdaPGAIr18tDpMFAnaUtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-NYR5XtZGOVa6DSTXjOTjYA-1; Thu, 16 Jan 2020 07:37:13 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69408800D55;
 Thu, 16 Jan 2020 12:37:12 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00B9060F88;
 Thu, 16 Jan 2020 12:37:04 +0000 (UTC)
Date: Thu, 16 Jan 2020 13:37:03 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [libvirt] [PATCH v2 82/86] numa: forbid '-numa node, mem' for
 5.0 and newer machine types
Message-ID: <20200116133703.11248ead@redhat.com>
In-Reply-To: <8b9be103-d550-853a-86ff-1dc504daab64@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-83-git-send-email-imammedo@redhat.com>
 <20200115153453.GL3243410@angien.pipo.sk>
 <20200115175237.325055f3@redhat.com>
 <8b9be103-d550-853a-86ff-1dc504daab64@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: NYR5XtZGOVa6DSTXjOTjYA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, Peter Krempa <pkrempa@redhat.com>,
 ehabkost@redhat.com, mst@redhat.com, libvir-list@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, rth@twiddle.net,
 david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eK9BkTYHId2c

On Thu, 16 Jan 2020 11:42:09 +0100
Michal Privoznik <mprivozn@redhat.com> wrote:

> On 1/15/20 5:52 PM, Igor Mammedov wrote:
> > On Wed, 15 Jan 2020 16:34:53 +0100
> > Peter Krempa <pkrempa@redhat.com> wrote:
> >   
> >> On Wed, Jan 15, 2020 at 16:07:37 +0100, Igor Mammedov wrote:  
> >>> Deprecation period is ran out and it's a time to flip the switch
> >>> introduced by cd5ff8333a.
> >>> Disable legacy option for new machine types and amend documentation.
> >>>
> >>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >>> ---
> >>> CC: peter.maydell@linaro.org
> >>> CC: ehabkost@redhat.com
> >>> CC: marcel.apfelbaum@gmail.com
> >>> CC: mst@redhat.com
> >>> CC: pbonzini@redhat.com
> >>> CC: rth@twiddle.net
> >>> CC: david@gibson.dropbear.id.au
> >>> CC: libvir-list@redhat.com
> >>> CC: qemu-arm@nongnu.org
> >>> CC: qemu-ppc@nongnu.org
> >>> ---
> >>>   hw/arm/virt.c        |  2 +-
> >>>   hw/core/numa.c       |  6 ++++++
> >>>   hw/i386/pc.c         |  1 -
> >>>   hw/i386/pc_piix.c    |  1 +
> >>>   hw/i386/pc_q35.c     |  1 +
> >>>   hw/ppc/spapr.c       |  2 +-
> >>>   qemu-deprecated.texi | 16 ----------------
> >>>   qemu-options.hx      |  8 ++++----
> >>>   8 files changed, 14 insertions(+), 23 deletions(-)  
> >>
> >> I'm afraid nobody bothered to fix it yet:
> >>
> >> https://bugzilla.redhat.com/show_bug.cgi?id=1783355  
> > 
> > It's time to start working on it :)
> > (looks like just deprecating stuff isn't sufficient motivation,
> > maybe actual switch flipping would work out better)
> >   
> 
> So how was the upgrade from older to newer version resolved? I mean, if 
> the old qemu used -numa node,mem=XXX and it is migrated to a host with 
> newer qemu, the cmd line can't be switched to -numa node,memdev=node0, 
> can it? I'm asking because I've just started working on this.

see commit cd5ff8333a3c87 for detailed info.
Short answer is it's not really resolved [*],
-numa node,mem will keep working on newer QEMU but only for old machine types
new machine types will accept only -numa node,memdev.

One can check if "mem=' is supported by using QAPI query-machines
and checking numa-mem-supported field. That field is flipped to false
for 5.0 and later machine types in this patch.


*) I might give another try to removing 'mem' completely in migration
compatible manner but that's well beyond the scope of this series
So far I hasn't been able to convince myself that previous attempts
to do it were absolutely correct for all corner cases that are there.

> Michal

