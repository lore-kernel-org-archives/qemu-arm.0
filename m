Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp7061433wrp;
        Mon, 30 Sep 2019 09:07:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz8VHnY4QzpguyXsAsT9Cewj+wg2MUt9dGWI3SeoSInpvzB2nmpqnG1Z+mKVWAwjR5nTg05
X-Received: by 2002:a05:620a:15d2:: with SMTP id o18mr723535qkm.341.1569859624780;
        Mon, 30 Sep 2019 09:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569859624; cv=none;
        d=google.com; s=arc-20160816;
        b=bsMuhULPVl1f3/wZZCosP14VZ6IYcJ5Sea7aj5Iot7igr/SzCMoUZMNLQGfyBqTZz6
         O4YhdvHGLr7fWbiYqx8lDvkp1ULm82MBSl2ZM+iAs1kjcUzANVZkEex5qVC1FNcatLNW
         8G1cBobuQix3in6SvD8K8FLazWe/AXK/0siXYX9y0CRQHEoIGV7VI9khCAErW/C4GKjB
         fATrEextdaCjrtYL7EzEj8kZgdGFqW1lsMGj+G7eyapFjy30aLUUel9W4Fqt4evqC+Oc
         +Qw3J1gsPtSW62xXKTr9VqQOi6GIRUGx0YatqEjVQSQD9AR16tAkLxQsZTeLafscOuYn
         rtOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date;
        bh=u/nTZdCfRDUN1zqUwOpDkE0UNLFnZdgTHZu6zzUuWJU=;
        b=xIxhNXpy6OEChAtibcdxfGaTtTtlPwWGUPMTuk0pO93dVVaj/xwCUZp+fdxWkxLG4I
         m995/feP+Hh+WWgcPJwLmVhZpcSZRoCArrNkAJQHG0Bw8U2kPMtYwtfe4AQU4DSP0H6X
         0op64TOAdyaiHsJdWgyhx8CN25eapJcsqNb3xytebhy7ghi5aRVQxARUBvpKtozVI/sQ
         ERFR8wBaHMr4qbvKnvsi5SvFQliuiBeXF10w/jFqExIFxAk4uFB1M8sU5YcFeAcApHMk
         g4nPbLEG2qyCWqpuS7VaGQCKfjjqP3sd9YQFhN5aaJmI0DxJpGFHWZPR+sZLh6lOUJGf
         8QbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v65si10480152qkc.308.2019.09.30.09.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2019 09:07:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iEyCV-0000hg-TA
	for alex.bennee@linaro.org; Mon, 30 Sep 2019 12:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38282)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iEy6k-0004dB-3c
 for qemu-arm@nongnu.org; Mon, 30 Sep 2019 12:01:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iEy6h-0003lM-C8
 for qemu-arm@nongnu.org; Mon, 30 Sep 2019 12:01:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47294)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iEy6h-0003du-2I; Mon, 30 Sep 2019 12:01:03 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 13E71307D844;
 Mon, 30 Sep 2019 16:00:51 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-86.ams2.redhat.com [10.36.116.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7358426327;
 Mon, 30 Sep 2019 16:00:41 +0000 (UTC)
Date: Mon, 30 Sep 2019 18:00:39 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 04/25] error: auto propagated local_err
Message-ID: <20190930160039.GC12777@linux.fritz.box>
References: <20190924200902.4703-1-vsementsov@virtuozzo.com>
 <20190924200902.4703-5-vsementsov@virtuozzo.com>
 <20190930151215.GB12777@linux.fritz.box>
 <ca629ae8-15c5-1685-1cbb-99283d37b0a1@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca629ae8-15c5-1685-1cbb-99283d37b0a1@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Mon, 30 Sep 2019 16:00:51 +0000 (UTC)
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
X-TUID: oO9K5KaaqmTC

Am 30.09.2019 um 17:19 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 30.09.2019 18:12, Kevin Wolf wrote:
> > Am 24.09.2019 um 22:08 hat Vladimir Sementsov-Ogievskiy geschrieben:
> >> Here is introduced ERRP_FUNCTION_BEGIN macro, to be used at start of
> >> functions with errp parameter.
> > 
> > A bit of bike shedding, but FOO_BEGIN suggests to me that a FOO_END will
> > follow. Can we find a different name, especially now that we won't use
> > this macro in every function that uses an errp, so even the "errp
> > function" part isn't really correct any more?
> > 
> > How about ERRP_AUTO_PROPAGATE?
> 
> I have an idea that with this macro we can (optionally) get the whole call stack
> of the error and print it to log, so it's good to give it more generic name, not
> limited to propagation..

Hm, what's the context for this feature?

The obvious one where you want to have a stack trace is &error_abort,
but that one crashes, so you get it automatically. If it's just a normal
error (like a QAPI option contains an invalid value and some function
down the call chain checks it), why would anyone want to know what the
call chain in the QEMU code was?

Kevin
