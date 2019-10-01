Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp7943762wrp;
        Tue, 1 Oct 2019 02:20:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx9BeY3hcWccnF+fEKdP5Byah1fxgQFuufFLTFymarDd0TOOvngwnllbHkp0qctnQIKcrjd
X-Received: by 2002:aed:204b:: with SMTP id 69mr29134221qta.126.1569921631137;
        Tue, 01 Oct 2019 02:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569921631; cv=none;
        d=google.com; s=arc-20160816;
        b=E5LfuyvzTO98Ulwuiz9hrzzFp2KUYW0uNJiwAaOu9WfLfXmWOxTcSiMSlc0RSlr/4P
         YFno2CpjvD/ubX50Zia5sUeADo+1NQIRaIWU4dY2ijanm45mxbI3FAAKsnBpcnar5NTa
         UPwHCz9bfVmpyFHNP0qOC2BxoHWZXXxsNcwWkmaSyucZ6c42lCTSNrTP78S7tlTuYDs+
         a0spkVlfXA2b7c6kzqu/IbM4nwP+HJSxapKxMDSuqQWGTlFCS7xwu6Sx5aGq06c2Z40W
         BaQwk7iZQJCq/3AHi7MD+vtLlHlKUclS8F2lxBnXdE0sil1Wuh+TBmFDf1mkjilTEnTj
         rEEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date;
        bh=TzTncD6nw97Uk4u2XjsMT+JtY86QlMZ1nmfJ7DKpYzM=;
        b=uyzkBUYUQsVoP+ZTpvsyJe8GTWpCXCHKG9qP20nDg73fi/JTrgKJA49IC9G7csIhZj
         pEYFHEk3N7z/jS1F7MDsmtYBVtal/kJzwa5Ts6tIfIY53I//hJ+05Ue3+qzpqHuy1QMp
         jdYCrYtDHn/1ssJ2REFvcD0O6/a7UmQCsMoHkw+lJ9FazXYNX61rD6QywnB8/5AHvYhm
         yfT438pkwqJdGmg3YCbMqKQ2Zt/q7z3KTuARtffA48dqP8FXKgl2Y1OPF33uOz5jLWDj
         zFF0btpRvosQwzWgJ1+tC3M0tfR7vmrcDEc/8+EU81Gncul+dELmuZ7r4Qly94zDjI1P
         4sqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o28si13978088qtt.306.2019.10.01.02.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2019 02:20:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iFEKb-0000QL-Te
	for alex.bennee@linaro.org; Tue, 01 Oct 2019 05:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34272)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iFEKL-0000JZ-0Z
 for qemu-arm@nongnu.org; Tue, 01 Oct 2019 05:20:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iFEKJ-0006Eh-LT
 for qemu-arm@nongnu.org; Tue, 01 Oct 2019 05:20:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60884)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iFEKJ-0006CO-6D; Tue, 01 Oct 2019 05:20:11 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3FBC081F07;
 Tue,  1 Oct 2019 09:20:09 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-215.ams2.redhat.com [10.36.117.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AD343DE2;
 Tue,  1 Oct 2019 09:19:46 +0000 (UTC)
Date: Tue, 1 Oct 2019 11:19:44 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 04/25] error: auto propagated local_err
Message-ID: <20191001091944.GB4688@linux.fritz.box>
References: <20190924200902.4703-1-vsementsov@virtuozzo.com>
 <20190924200902.4703-5-vsementsov@virtuozzo.com>
 <20190930151215.GB12777@linux.fritz.box>
 <ca629ae8-15c5-1685-1cbb-99283d37b0a1@virtuozzo.com>
 <20190930160039.GC12777@linux.fritz.box>
 <495102b2-5d1a-f659-4387-5733ae34b3e2@virtuozzo.com>
 <20190930163909.GD12777@linux.fritz.box>
 <8d55df7a-abe6-bebc-a6bd-a1a2db4b8946@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d55df7a-abe6-bebc-a6bd-a1a2db4b8946@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 01 Oct 2019 09:20:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 Paul Burton <pburton@wavecomp.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 "integration@gluster.org" <integration@gluster.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oxG2FgmXaWIG

Am 01.10.2019 um 10:39 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 30.09.2019 19:39, Kevin Wolf wrote:
> > Am 30.09.2019 um 18:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
> >> 30.09.2019 19:00, Kevin Wolf wrote:
> >>> Am 30.09.2019 um 17:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
> >>>> 30.09.2019 18:12, Kevin Wolf wrote:
> >>>>> Am 24.09.2019 um 22:08 hat Vladimir Sementsov-Ogievskiy geschrieben:
> >>>>>> Here is introduced ERRP_FUNCTION_BEGIN macro, to be used at start of
> >>>>>> functions with errp parameter.
> >>>>>
> >>>>> A bit of bike shedding, but FOO_BEGIN suggests to me that a FOO_END will
> >>>>> follow. Can we find a different name, especially now that we won't use
> >>>>> this macro in every function that uses an errp, so even the "errp
> >>>>> function" part isn't really correct any more?
> >>>>>
> >>>>> How about ERRP_AUTO_PROPAGATE?
> >>>>
> >>>> I have an idea that with this macro we can (optionally) get the whole call stack
> >>>> of the error and print it to log, so it's good to give it more generic name, not
> >>>> limited to propagation..
> >>>
> >>> Hm, what's the context for this feature?
> >>>
> >>> The obvious one where you want to have a stack trace is &error_abort,
> >>> but that one crashes, so you get it automatically. If it's just a normal
> >>> error (like a QAPI option contains an invalid value and some function
> >>> down the call chain checks it), why would anyone want to know what the
> >>> call chain in the QEMU code was?
> >>>
> >>
> >> When I have bug from testers, call stack would be a lot more descriptive, than just
> >> an error message.
> >>
> >> We may add trace point which will print this information, so with disabled trace point
> >> - no extra output.
> > 
> > But wouldn't it make much more sense then to optionally add this
> > functionality to any trace point? I really don't see how this is related
> > specifically to user-visible error messages.
> 
> Interesting idea
> 
> > 
> > However, even if we decide that we want to have this in Error objects,
> > wouldn't it make much more sense to use the real C stack trace and save
> > it from the innermost error_set() using backtrace() or compiler
> > built-ins rather than relying on an error_propagate() chain?
> > 
> Hmm, I thought about this.. And in concatenation with the fact that
> we'll have macro not everywhere, backtrace may be better..
> 
> On the other hand, backtrace will not show coroutine entries..

Hm, good point. I wonder if we can easily get a stack trace not starting
at the current point, but from a jmp_buf. Then we could just switch to
the coroutine caller whenever we reach coroutine_trampoline().

But glibc doesn't seem to support this case easily, so that might mean
rewriting all of the stack unwinding inside QEMU... Maybe not then.

> OK, anyway, if we will track some additional information in
> trace-events or in macros or in error_* API functions, it's not bad to
> track some additional information in macro named ERRP_AUTO_PROPAGATE.

Yes, I think tracking the information where we use ERRP_AUTO_PROPAGATE
anyway is okay. I just wouldn't add the macro everywhere just for the
sake of the additional information.

Kevin
