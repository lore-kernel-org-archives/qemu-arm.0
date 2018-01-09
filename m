Received: by 10.28.173.206 with SMTP id w197csp4018783wme;
        Tue, 9 Jan 2018 10:50:33 -0800 (PST)
X-Google-Smtp-Source: ACJfBoumSIMmNgdsiboQgZVBJ7kX/tf4zq44Eoox2zNg8U30VsIuovty9ZWefCaLdaCD6u+nUEFQ
X-Received: by 10.129.201.70 with SMTP id c6mr14846806ywl.512.1515523833587;
        Tue, 09 Jan 2018 10:50:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515523833; cv=none;
        d=google.com; s=arc-20160816;
        b=miJ3lW92oVLyuASFGwMv8KJyN+spzTQpfnUWKww2bvK7EC7yQqQD+yeWy9Yzf7jk0s
         k+zuzatejUjZ8Wl0m+5+xXliovQFjtNFlBoXs8Tf6HuTvbaBXdJvlGtt5ObTd022e3Ht
         TQcd5Y3KVc6cQtaIwDwUYQvzCTSHY+QSxRVrImsubXl1PsFTN2XzM/1fo+1fQS/X4WY6
         CoSp5ANXfSpS2hzUXDuS8mHjuF3KwyuOYIoJG025XkAb1+5qYobyYitcx+9MicX5uN8p
         J9kV7vmwdvB0P19hvYrIGyzS9qXexUhZPx2mlcP/cFcWf9Ebrd8QuZJFvu3SFQwL7wQY
         QBoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=EtYuql9p43rB8+w8j/gYnBD1WckVdJcYPL2qtU5lujw=;
        b=Yh5hH2yVGPWQ+nGCEb9Q3I0rTNM26UJSpkwGJCLZfvQIDSPpGm9/C1oP4k9lN9rsFh
         Ym5fLJYDrHW3km9xtIdZ3flV5RDvcjONRDq1fcB+bCp7IeN80+DB9RrfQTwIB1Y7cbLk
         DfPJtPUM/Tcm+kRhYhFHj+jYzTYzhi+PsPtrMbSy8UJzYWMzbcdcUwtptKShJxft9mOz
         QT8dTJ5mMKftA2aqCegq3PwXyf5W6TjVG4yaGZvve/rE5lZ4bGnnWe+8XjAMg7RrYhaZ
         XjrYAb+qlvLeqve9cMjlT4Rn9tU/y6XYtZXEXszD5+k/i3L8d6pbwcV5HuRJ7IUkaSNZ
         bhSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o206si680064ywo.358.2018.01.09.10.50.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 10:50:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYyyn-0003ES-4l
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 13:50:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eYyy3-0002vh-3Z
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 13:50:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eYyxE-00042b-Je
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 13:49:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45124)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eYyxE-000412-A0; Tue, 09 Jan 2018 13:48:56 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D322C04AC41;
	Tue,  9 Jan 2018 18:48:54 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF1316090B;
	Tue,  9 Jan 2018 18:48:47 +0000 (UTC)
Date: Tue, 9 Jan 2018 19:48:45 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180109184845.e2ma4po2sibogkua@kamzik.brq.redhat.com>
References: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8NbL7ROZs99hWhpAF2Rdi2qEiWLNo3hr_9W7gmgXyw4A@mail.gmail.com>
	<6d20557d-5722-706f-ca4f-489ab85358c0@redhat.com>
	<CAFEAcA-Nn4VmSnxT7Of8Nh+p5QgF9cMzkqZ-VBCC=2zRgk-Xdw@mail.gmail.com>
	<e40cc107-2fe9-d8a5-b4fd-385c0d22c564@redhat.com>
	<CAFEAcA8QqEna4u92bk88++Y1JrpCJD=KDpSfbJ8DhfSiTRm+=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8QqEna4u92bk88++Y1JrpCJD=KDpSfbJ8DhfSiTRm+=w@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 09 Jan 2018 18:48:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/2] GICv2 & GICv3: RAZ/WI
 reserved addresses rather than aborting
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
Cc: cdall@linaro.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"patches@linaro.org" <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aC+/ZwWTuV2+

On Tue, Jan 09, 2018 at 04:35:30PM +0000, Peter Maydell wrote:
> On 9 January 2018 at 16:29, Laszlo Ersek <lersek@redhat.com> wrote:
> > On 01/09/18 17:12, Peter Maydell wrote:
> >> On 9 January 2018 at 15:58, Laszlo Ersek <lersek@redhat.com> wrote:
> >>> Sorry, no clue about any of this -- where should I read up?
> >>
> >> I cc'd you mostly as a heads-up since the QEMU bug is UEFI affecting,
> >> not because I wanted to make you read the GIC specs :-)
> >
> > Thanks (and, thanks :) ) -- from patch #2, looks like GICv2 is affected
> > too, and the patch seems to be fixing commit a9d853533cc1
> > ("hw/intc/arm_gic: Switch to read/write callbacks with tx attributes",
> > 2015-05-12).
> >
> > Is that right? That commit was released with v2.4.0. Should I have
> > experienced the error? Is it KVM / hardware specific? What are the symptoms?
> 
> Happens under TCG emulation only. The bug got introduced with
> commit c79c0a314c43b78f6, which changed the effect of a device
> returning MEMTX_ERROR/MEMTX_DECODE_ERROR from "RAZ/WI" to
> "guest data abort". That's in general the right thing to do,
> but in the case of these device models we were returning those
> values for cases which aren't supposed to provoke aborts.
> 
> The symptom is that if your guest code is poorly behaved and
> tries to read or write offsets that don't correspond to documented
> GIC registers, it will take an abort that it didn't before.
> Linux is fine; this UEFI image I have lying around stopped working.

Thanks for pointing this out. I had just recently noticed that the
'gicv3-active' kvm-unit-tests test had stopped passing on TCG, getting
DABTs when attempting to write GICD_ICACTIVER. I was just about to
complain in this thread that that register is indeed documented, but
now I see the implementation of the test was always wrong. It was using
the wrong register base, RD vs. SGI...

drew
