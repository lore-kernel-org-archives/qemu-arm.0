Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11678093wrv;
        Fri, 26 Jul 2019 02:35:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEej5TLeOREoVsdL3Dbf8xwX+sgotwsn+uHIIrY6rTHy0+a47IbWlQCWY/SjVgVccmk7Gj
X-Received: by 2002:a50:92e1:: with SMTP id l30mr79030414eda.141.1564133718250;
        Fri, 26 Jul 2019 02:35:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564133718; cv=none;
        d=google.com; s=arc-20160816;
        b=GkSM0HsfkF+hPKET3m2gPV5aagg13jNJ8RhHrJRDHXrURBWhPb2HVBkX+yV7SH8Mou
         4f/u1VPfrvKYyAxj9LtTXDw41kxVaG6JVwTpVDTGmfMmFeC+/Sd44kn2zSJH4oyPNRNY
         7UZDiFhuYBc2OAc+VNVlC93JsOWsVsCsyuDBslkLnJA6S2OAFo9eycBNcrGjM4k3H54c
         mS+dwMxgVaDOjDZQ3RZR6UamMtuY5cOTIi5nRyh429Qj1kwzNmiYL56hYLlEa8z7D9mp
         b154ijAY61iieuZdvAG/WERFJIbD7uu6Uiv/AZdYht6jjXy2kCChlNePF7gbEySL1wMw
         kJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=H9G1+AmyNYOU4OKHShxWliYcLpBFz89Go717RqgXrCc=;
        b=d2C6HKUsLwmHzD70RWnJ+PUI/KvSA1Gt0jbFZUZtTyMpOdl1NeD2auUUioH0tw8UXi
         OQN+7gSzL6vZYIy3KXGSSB6gEZvGaxloKYKHtFPFXnV7aqLMomRTldV+plbOsYb4wcby
         f/pw3EhomeRxp0yTEFT9gDbepTVZQViRs2fqVKXm8vhBZWWC6egL5Ldw/QQgcn9QY1Bo
         RVIdhGlPWvHdU3ynNFV7tdmdkasCqkfHg55Da3KFaXA+4QlfC3SDt7bH+DQRSAqMF2TG
         B1XKTCC/qxXbDrJJgOUx1AMZ9DXTRlI+2koh6cSTqiBSOx5wfNOcnPNz3TSpO/ZrTfBJ
         OC7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x25si12780846edb.47.2019.07.26.02.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 02:35:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqwd8-00050G-Dh
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 05:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44798)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hqwd3-0004zY-FQ
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:35:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hqwcz-00019v-94
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:35:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36010)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>)
 id 1hqwcz-0000x7-2Y; Fri, 26 Jul 2019 05:35:05 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B34A9C04959E;
 Fri, 26 Jul 2019 09:35:02 +0000 (UTC)
Received: from work-vm (ovpn-117-185.ams2.redhat.com [10.36.117.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BE55600C4;
 Fri, 26 Jul 2019 09:35:01 +0000 (UTC)
Date: Fri, 26 Jul 2019 10:34:59 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190726093459.GD2657@work-vm>
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-3-peter.maydell@linaro.org>
 <20190725172712.GM2656@work-vm>
 <CAFEAcA-jGvNS4N4qobLekHYdV82qSUWVQOvTRQbrpcCRF0Yvwg@mail.gmail.com>
 <20190725180007.GN2656@work-vm>
 <CAFEAcA8T25Fq5wj8a-K9KAyXdfj3+HtW=kTJ13zr+-iHFz4-GA@mail.gmail.com>
 <20190726093208.GC2657@work-vm>
 <CAFEAcA9G1RmT-Ot4rYfqTa-xHfTPVq+RJ2A_EB9ufNrEhzyBCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9G1RmT-Ot4rYfqTa-xHfTPVq+RJ2A_EB9ufNrEhzyBCw@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 26 Jul 2019 09:35:02 +0000 (UTC)
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
X-TUID: aHAV7crMWK1h

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Fri, 26 Jul 2019 at 10:32, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > Would
> > >
> > > /*
> > >  * Check that type t2 is an array of type t1 of size n,
> > >  * eg if t1 is 'foo' and n is 32 then t2 must be 'foo[32]'
> > >  */
> > >
> > > be clearer ?
> >
> > Yep.
> 
> OK, I'll fold that in. Are you happy for me to take this
> via the target-arm tree for 4.1, given the two dependent
> patches are both for arm devices?

Yep

> thanks
> -- PMM
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
