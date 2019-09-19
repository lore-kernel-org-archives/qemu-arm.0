Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1008022wrp;
        Thu, 19 Sep 2019 06:41:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwf9If2CJzOUcBsWskJVEDQ67TmnWlDlypmzG+cgecUNefbnCnTMwzQFES5Vq2xUA+yIPyl
X-Received: by 2002:a37:c14:: with SMTP id 20mr2825063qkm.291.1568900462972;
        Thu, 19 Sep 2019 06:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568900462; cv=none;
        d=google.com; s=arc-20160816;
        b=mitG0sy3diDWr1l/U0gIsAGKoN4LLkZ/wJf7+6lc3mBSmx26yjw1++xXK/JH4ZQuI/
         rwYip0aV9b/kTph/ExgUupE0ON4oPD4OHgOwpvH8g1IO+3Q/Gj2rUbfZ+aNGyqleGHxJ
         CROO45vcsn5nvYF+aiToEEMDPOmyglyfLQhB4USw8i8VgqtT7WiZl/BiJpai7cEdERqN
         QL8pAyOgNhIgYyuoLfjqbG1R3v2eGvfwUdKFUICR5MqA9FDFhjDCazDgsEhh6rNZwBBN
         sTJxtUnMf52dObqtVOzExOwqLv7j0RgXEf7DgA1DtVO8ZXqomMlWsXj27luk5bNtFCtw
         07bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=5hgoLNw78NrDA8uV8mcgilKLOabASTGVfPkk1nadtlA=;
        b=HYDDOHwc/Sq1jMWjTDIQ3DGE6RyYGbyzx99vPUFttJ8NY8KnaO1v92E5Mlsca2Z9vQ
         8SHXhJy+LZW6sVDs5k2RfRDRMCODcvYAhx6T+qmAjJXh/SaWPJUVSPnUWCpiNSWgMkzf
         NSVig+pVBaINqHvALt0vEnbMOtOVggjYE0NjevvLJdZB4xjzgK1mYnnICZeMF2N+wLCb
         vmY4q9oJXUdtwiaNlrTnvxNCXoWxl64twdReM0HvN8Kn6HQjyvigtjaIazkSIp+Dq3cJ
         tOt+fFg7NOC4G1io4o8Lfh4MG5ZUCtfqNJKvDYcCqgu8mBoDQqUzb7uSz9HbGOaCiF+z
         CCUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j62si6416859qtd.367.2019.09.19.06.41.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 06:41:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAwg9-0003t1-Ut
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 09:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43673)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iAw61-0002eE-ML
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 09:03:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iAw60-0001tl-CV
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 09:03:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33054)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iAw60-0001sc-4u; Thu, 19 Sep 2019 09:03:40 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2593E309DEE1;
 Thu, 19 Sep 2019 13:03:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.116.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E26541001B01;
 Thu, 19 Sep 2019 13:03:18 +0000 (UTC)
Date: Thu, 19 Sep 2019 15:03:17 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20190919130317.GG10163@localhost.localdomain>
References: <20190918130244.24257-1-vsementsov@virtuozzo.com>
 <abb14088-6af2-5db2-da0d-0948fd4ac81c@redhat.com>
 <20190919091720.GB10163@localhost.localdomain>
 <1ee95d94-d3f9-2f56-a0bb-61d31e3ceeb7@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ee95d94-d3f9-2f56-a0bb-61d31e3ceeb7@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 19 Sep 2019 13:03:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC] error: auto propagated local_err
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
Cc: "fam@euphon.net" <fam@euphon.net>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>, "codyprime@gmail.com" <codyprime@gmail.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "david@redhat.com" <david@redhat.com>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "groug@kaod.org" <groug@kaod.org>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QcFhmx0oiJte

Am 19.09.2019 um 14:00 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 19.09.2019 12:17, Kevin Wolf wrote:
> > Am 18.09.2019 um 19:10 hat Eric Blake geschrieben:
> >> On 9/18/19 8:02 AM, Vladimir Sementsov-Ogievskiy wrote:
> >>> + */
> >>> +#define MAKE_ERRP_SAFE(errp) \
> >>> +g_auto(ErrorPropagationStruct) (__auto_errp_prop) = {.errp = (errp)}; \
> >>> +if ((errp) == NULL || *(errp) == error_abort || *(errp) == error_fatal) { \
> >>> +    (errp) = &__auto_errp_prop.local_err; \
> >>> +}
> >>
> >> Not written to take a trailing semicolon in the caller.
> >>
> >> You could even set __auto_errp_prop unconditionally rather than trying
> >> to reuse incoming errp (the difference being that error_propagate() gets
> >> called more frequently).
> > 
> > I think this difference is actually a problem.
> > 
> > When debugging things, I hate error_propagate(). It means that the Error
> > (specifically its fields src/func/line) points to the outermost
> > error_propagate() rather than the place where the error really happened.
> > It also makes error_abort completely useless because at the point where
> > the process gets aborted, the interesting information is already lost.
> > 
> > So I'd really like to restrict the use of error_propagate() to places
> > where it's absolutely necessary. Unless, of course, you can fix these
> > practical problems that error_propagate() causes for debugging.
> > 
> > In fact, in the context of Greg's series, I think we really only need to
> > support hints for error_fatal, which are cases that users are supposed
> > to see. We should exclude error_abort in MAKE_ERRP_SAFE() because these
> > are things that are never supposed to happen. A good stack trace is more
> > important there than adding a hint to the message.
> > 
> 
> Interesting, that to handle error_append_hint problem, we don't need to
> create local_err in case of errp==NULL either..
> 
> So, possibly, we need the following steps:
> 
> 1. implement MAKE_ERRP_SAFE_FOR_HINT (which only leave "*(errp) == error_fatal" in the if condition
> 2. rebase Greg's series on it, to fix hints for fatal errors
> 3. implement MAKE_ERRP_SAFE_FOR_DEREFERENCE (which only leave "(errp) == NULL" in the if condition
> 4. convert all (almost all) local_err usage to use MAKE_ERRP_SAFE_FOR_DEREFERENCE, which will
>     fix problem with error_abort (and also drop a lot of calls of error_propagate)
> 5. merely convert "void func(.., errp)" to "int func(.., errp)" and drop MAKE_ERRP_SAFE_FOR_DEREFERENCE()
>     magic, together with dereferencing.

Long macro names, but as the parameter will always only be "errp", it
fits easily on a line, so this is fine.

I think I like this plan.

Kevin
