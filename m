Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5070099wrm;
        Tue, 8 Oct 2019 05:01:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqygKMs9KNxhgWauAQC6wiUSoZKNdSuk5pbATOHMSnMJvAF8Y9Cu1dG1XQSC7nBFgyYemEpx
X-Received: by 2002:ac8:ec2:: with SMTP id w2mr34799858qti.119.1570536080317;
        Tue, 08 Oct 2019 05:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570536080; cv=none;
        d=google.com; s=arc-20160816;
        b=egOuPHMkd1Igr4dQ3nb8wQMOWMQb+nuwQmcQ+A/7Sv9IjxJEaLweltI4B/H9OQCGzl
         cdZU5tCVk9tNqzEELwiyKMybY2y05dU1B7A61K6wHdJcij2o8sjOyRMRx4AuldUFZwPP
         7ITqb9YodrDL3jfO2fZTJd2MObw38aQNVChBxM5adixZqyN2JXFAcd+qFN3+xtf+XOlN
         aOzG4w/vZRnuvFjHBPM72D+uMRWJtMHZOULtd8QSKerWj9/gzg+6gpL3Pej5NnZkXfDN
         BzcZgdIDau9sspyVQVmChDdtk2aPtEoT4feDiGmOsEW3RZ3uINRXqFYnD5lhucVDb3DS
         5svw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from;
        bh=9Ik3Zwm3x0V0RWgxp9jC2/YU3n/YZHfwFeIKd+Tdn2s=;
        b=xwEcD3xhIZSnOX3uTjdjALgeQ80N/1Dw2ZSvFYiTIRstHa2YZiFiD9V0/y0xCQQB+Z
         hokkSENreqo5+PtW1aYaWxyiQZ6ju8U0qUSw/pv/4utGYlukT6usVArrOzlCxGH+yVIQ
         46kJvidbJITVr0WiJJe68qsSNlYHQNF1ddin7rV3Zrd4w9GtB/jXdlGfvvC/mbZOVaII
         MTWZUMpj1ytasxB8/pgTAgTN1HOXnQtGra9mp+olcwgdOiJaoR5GEbTFMkl0aWl2kNhs
         GP9cXvmmTat5lL46rEwYeXMxIFAleV4uyNi1tKqZeGXSYrIREyNwYW4fmWLGxZ5U5lML
         j/zA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 70si16053463qkh.144.2019.10.08.05.01.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 05:01:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHoB5-0000H7-Jw
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 08:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54729)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iHoAr-0000GC-Pz
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 08:01:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iHoAp-0003mP-CU
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 08:01:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45366)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1iHoAo-0003iT-0v; Tue, 08 Oct 2019 08:01:02 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 27A4B307CDE7;
 Tue,  8 Oct 2019 12:00:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACC4219C68;
 Tue,  8 Oct 2019 11:59:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6A203113864A; Tue,  8 Oct 2019 13:59:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 00/31] error: auto propagated local_err
References: <20191001155319.8066-1-vsementsov@virtuozzo.com>
 <87eeznn185.fsf@dusky.pond.sub.org>
 <a449a64d-ca3c-2442-27b3-70b565545a36@virtuozzo.com>
 <20191008113932.18eb4c1d@bahia.lan>
 <7567d46b-f51c-d459-fd54-7841637d0666@virtuozzo.com>
Date: Tue, 08 Oct 2019 13:59:51 +0200
In-Reply-To: <7567d46b-f51c-d459-fd54-7841637d0666@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 8 Oct 2019 10:09:42 +0000")
Message-ID: <871rvnla6g.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 08 Oct 2019 12:00:54 +0000 (UTC)
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
Cc: "fam@euphon.net" <fam@euphon.net>,
 "pburton@wavecomp.com" <pburton@wavecomp.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "codyprime@gmail.com" <codyprime@gmail.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "arikalo@wavecomp.com" <arikalo@wavecomp.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>, "sw@weilnetz.de" <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, "yuval.shaia@oracle.com" <yuval.shaia@oracle.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "clg@kaod.org" <clg@kaod.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "david@redhat.com" <david@redhat.com>, "jsnow@redhat.com" <jsnow@redhat.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "kwolf@redhat.com" <kwolf@redhat.com>,
 "integration@gluster.org" <integration@gluster.org>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nnzYGqWcTb4M

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 08.10.2019 12:39, Greg Kurz wrote:
>> On Tue, 8 Oct 2019 08:41:08 +0000
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>> 
>>> 08.10.2019 10:30, Markus Armbruster wrote:
>>>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>>>
>>>>> Hi all!
>>>>>
>>>>> Here is a proposal of auto propagation for local_err, to not call
>>>>> error_propagate on every exit point, when we deal with local_err.
>>>>>
>>>>> There are also two issues with errp:
>>>>>
>>>>> 1. error_fatal & error_append_hint/error_prepend: user can't see this
>>>>> additional info, because exit() happens in error_setg earlier than info
>>>>> is added. [Reported by Greg Kurz]
>>>>
>>>> How is this series related to Greg's "[PATCH 00/17] Fix usage of
>>>> error_append_hint()"?  Do we need both?
>>>
>>> These series is a substitution for Greg's. Still, there are problems with
>>> automation, which Greg pointed in 21/31, and I don't know what to do next.
>>>
>>> May be, just continue to review patches and fix them by hand. May be try to
>>> improve automation...
>>>
>> 
>> The feeling I have after working on my series is that the lines that deal
>> with errors are mixed up with the functional code in a variety of ways.
>> That makes it very difficult if not impossible to come with code patterns
>> suitable for a 100% automated solution IMHO.
>> 
>> My questioning is more around the semantics of error_fatal actually. What
>> does passing &error_fatal gives us over passing &local_err and calling
>> error_report_err()+exit(), apart from breaking error_append_hint() and
>> error_prepend() ?
>
> As I understand, the only benefit is one line instead of four:

Brevity matters when it comes to error handling.

> func(..., &error_fatal);
>
> instead of
>
> func(..., &local_err);
> if (local_err) {
       error_report_err(local_err);
>      exit(1);
> }
[...]
