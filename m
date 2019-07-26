Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11675121wrv;
        Fri, 26 Jul 2019 02:32:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1/TpAFFDR8NdgEPSPM51gTLkf28sFhdEJjZ97XDWL46w8f8475QtA1CcnlacI3aNUERzF
X-Received: by 2002:ac8:f3b:: with SMTP id e56mr65628602qtk.123.1564133549270;
        Fri, 26 Jul 2019 02:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564133549; cv=none;
        d=google.com; s=arc-20160816;
        b=oKqIQYUxUsTrDveQxFWqQqMW1odebEuFSdZYSKb6kQ+UBlB16xB1mjmbedn+sZM/kC
         ZTSR2MoEp08TZ9VX22Kn5DiCM4FuggE3Qpgz4SCjfOYL4GZ0kEZKkismpb/IZhU4yL3O
         RYuKyygwGr7iuPHWjMClkjzHNiVGfuNbzaYBrnpp63a8Qn+B6WeqJ2mcwzPNPe/wHE1y
         Yc3oAalM99modefSYzEg35uhlRZQNiltPQ/RXF4oxZWvKY3CERfzQBvag9f7SGfaHA44
         8fdD2iVzxvXXqJ01ndcu0f7suj/vDZ3scN9idnBM4AmdJhfmVjLGzif0tWihhbzXI5x1
         GeGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=0+N7ovjR625b1xlz32FMyGqe7lUMx++1TPwmSSJ/wnI=;
        b=VLmyZK4t2JlH8CjqEWdr6muUG5sk+IZGePI6TIbE3UOB3+QSgVLXEIzDLINu9mI3hD
         BwdiKsxtsz1L8q5TZec8pc7bexRWes3sjZ71yeVzOirfT24gnav7ZFqo6+OLWbQsI/iD
         h3MOP6xOTLajuaR1ybLqdG0DMQ5D73WlwyWMoqjK8TYci9QSM67lRj1VuBXlJwR0hixh
         +nmezKSyntrevEQVGVdVvlvpikEidND2XcazAuVDv3NTN6RZCq/RqLbgkMGMWmfRJBod
         S4i3jvn+vTP57+jyx/uArNvuguVUAoM+4wAlo0vlslVMgFcUjQFNY5sOvicTJq2rqON8
         Lgug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e26si32660161qtk.76.2019.07.26.02.32.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 02:32:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqwaO-0002IC-TH
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 05:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38315)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hqwaL-0002GC-DC
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:32:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hqwaJ-0000Es-D5
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:32:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37634)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>)
 id 1hqwaJ-0008FP-73; Fri, 26 Jul 2019 05:32:19 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9497B3071D7E;
 Fri, 26 Jul 2019 09:32:12 +0000 (UTC)
Received: from work-vm (ovpn-117-185.ams2.redhat.com [10.36.117.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E78CD5D719;
 Fri, 26 Jul 2019 09:32:10 +0000 (UTC)
Date: Fri, 26 Jul 2019 10:32:08 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190726093208.GC2657@work-vm>
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-3-peter.maydell@linaro.org>
 <20190725172712.GM2656@work-vm>
 <CAFEAcA-jGvNS4N4qobLekHYdV82qSUWVQOvTRQbrpcCRF0Yvwg@mail.gmail.com>
 <20190725180007.GN2656@work-vm>
 <CAFEAcA8T25Fq5wj8a-K9KAyXdfj3+HtW=kTJ13zr+-iHFz4-GA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8T25Fq5wj8a-K9KAyXdfj3+HtW=kTJ13zr+-iHFz4-GA@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 26 Jul 2019 09:32:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.1? 2/2] vmstate.h: Type check
 VMSTATE_STRUCT_VARRAY macros
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tw/yWdypvDzh

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 25 Jul 2019 at 19:00, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > On Thu, 25 Jul 2019 at 18:27, Dr. David Alan Gilbert
> > > <dgilbert@redhat.com> wrote:
> > > >
> > > > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > > >  #define type_check_2darray(t1,t2,n,m) ((t1(*)[n][m])0 - (t2*)0)
> > > > > +/* Check that t2 is an array of t1 of size n */
> > > > >  #define type_check_array(t1,t2,n) ((t1(*)[n])0 - (t2*)0)
> > > >
> > > > I'd have to admit I don't understand why that does what you say;
> > > > I'd expected something to index a t2 pointer with [n].
> > >
> > > Note that this is just a comment describing what the existing
> > > macro does, as a way to distinguish its job from that of the
> > > new macro I'm adding.
> > >
> > > What happens here is that t2 is a type like "foo [32]", ie
> > > it is an array type already. t1 is the base 'foo' type; so the macro
> > > is checking that t1[n] matches t2, where n is passed in to us
> > > and must match the declared array size of the field (32 in
> > > my example). (In C the size of the array is carried around as
> > > part of its type, and must match on both sides of the expression;
> > > so if you pass in the name of an array field that's the wrong size the
> > > type check will fail, which is what we want.)
> >
> > Ah, OK that makes sense; what it really needs is that example to make
> > me realise that t2 was already the array.
> 
> Would
> 
> /*
>  * Check that type t2 is an array of type t1 of size n,
>  * eg if t1 is 'foo' and n is 32 then t2 must be 'foo[32]'
>  */
> 
> be clearer ?

Yep.

Dave

> thanks
> -- PMM
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
