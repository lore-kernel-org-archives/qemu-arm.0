Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2637458wrt;
        Fri, 23 Nov 2018 14:53:15 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WjW0mhjy0/mg6WYm9vtxMPHe5z76L2TNL5Ot5L5kDjVfEujk90Us3s4iMkaBQ6gC/5lcnk
X-Received: by 2002:a25:4485:: with SMTP id r127-v6mr17709945yba.275.1543013595218;
        Fri, 23 Nov 2018 14:53:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543013595; cv=none;
        d=google.com; s=arc-20160816;
        b=G77VXxVcr+TrC0+dSdtJLsQdbcYWQ/FO6pSfVPviLkuODgR3GV/pgSB2ZZcUrZZX5N
         eg6HHP/d5H8wFKLSvTncAScDoFeaSKoRSzlBrUtC+oatQ4hYd1drRlAXxbTiwRF9mzLs
         qHg/YPE3kfdRhYYb/HmhxUlvzvzxKtptafnzBLDooXA/4RVOgsu8j3VZMTHaeeyCo2Ok
         4iHXAN2UHTXD4sBPkxXNYT4yWbI6NPdU/svicv3oQAeDQzXqHlc3c78LRHKjwo5hfBC5
         1IWpv1X7Bb/+YPjVHtUvNF7H1Gj6cQB7EcQPH3IyHG8vodxKROU9gtZikjZb/Hsqb3Oo
         Zb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=TaK+pH2V6eMalCKlyTJ4lxAFY68VviSHJj0kRzNzJfE=;
        b=KADV4WpuYoT/n0odLCtdOG+wgqylcD0ebsCjFtr/qbmeTsmwSkh+5VPtid4xJ29yDN
         tzCNcojiJTkPotRjcUGPS5c67/iPkcFMoapT8siBL4VWdlordjMPzFczV/1AeAstp4TG
         /I5ChKMiaLf8sIOSB1ujCpytvBFgWPeHdD0qiKfgamgAtrBpjDJsq+agf7rGWFy/BVpM
         axzgEGb6GMBqdTqbR/N+BHhpljPr2OZW3ZKYbBtsIT6TkBy1h0fkZtQzZuixJg7rc6L5
         jh9bMlKmJLcTDJjcUW4QM+cDeUVorCWT+TLY2qyzkbKvD9RRHBw2rEuU74PIlqDlpZlV
         EwyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d187-v6si34105848ybf.62.2018.11.23.14.53.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 14:53:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQKK2-0004pQ-NM
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 17:53:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gQKJl-0004hy-Rp
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 17:53:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gQK5N-0003tI-FG
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 17:38:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40540)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gQK5N-0003sv-A6; Fri, 23 Nov 2018 17:38:05 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0BF787D0DE;
	Fri, 23 Nov 2018 22:38:04 +0000 (UTC)
Received: from localhost (ovpn-116-21.gru2.redhat.com [10.97.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8ECCA5C227;
	Fri, 23 Nov 2018 22:38:02 +0000 (UTC)
Date: Fri, 23 Nov 2018 20:38:00 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181123223800.GQ18284@habkost.net>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-2-luc.michel@greensocs.com>
	<20181123181059.GN18284@habkost.net>
	<CAFEAcA_8jJz5dE7XP4R=LjEC5WzP3jzutg=YqiYjJVwZZz+jvQ@mail.gmail.com>
	<20181123182415.GP18284@habkost.net>
	<CAFEAcA-WwupF9Lm85+S4YSq1f5Y0AjEOtG0Uzh=7pDVdF0w38A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-WwupF9Lm85+S4YSq1f5Y0AjEOtG0Uzh=7pDVdF0w38A@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 23 Nov 2018 22:38:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU
 clusters
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6XMJxf6YFzZx

On Fri, Nov 23, 2018 at 06:53:07PM +0000, Peter Maydell wrote:
> On Fri, 23 Nov 2018 at 18:24, Eduardo Habkost <ehabkost@redhat.com> wrote:
> >
> > On Fri, Nov 23, 2018 at 06:14:28PM +0000, Peter Maydell wrote:
> > > One thing I would like to do with this new "cpu cluster"
> > > concept is to use it to handle a problem we have at the
> > > moment with TCG, where we assume all CPUs have the same
> > > view of physical memory (and so if CPU A executes from physical
> > > address X it can share translated code with CPU B executing
> > > from physical address X). The idea is that we should include
> > > the CPU cluster number in the TCG hash key that we use to
> > > look up cached translation blocks, so that only CPUs in
> > > the same cluster (assumed to have the same view of memory
> > > and to be identical) share TBs.
> > >
> > > If we don't have a unique integer key for the cluster, what
> > > should we use instead ?
> >
> > This sounds like a reasonable use of cluster_id as implemented in
> > this patch.  The ID would be only used internally and not exposed
> > to the outside, right?
> 
> It would be internal to QEMU (not exposed to the guest or
> to the user), yes.
> 
> > I'm more worried about cases where we could end up exposing the
> > ID in an external interface (either to guests, or through QMP or
> > the command-line).  This happened to cpu_index and we took a long
> > time to fix the mess.
> 
> I see, thanks.
> 
> My other question about this code was a slightly different one -- are
> we guaranteed to be holding the iothread lock when we create
> new QOM objects? (ie that we won't have races between two threads
> which both try to create new objects and increment the variable)

I assume we are, because type_initialize() (called by
object_new()) isn't thread-safe.

-- 
Eduardo
