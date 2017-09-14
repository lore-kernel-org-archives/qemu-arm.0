Received: by 10.223.172.38 with SMTP id v35csp651477wrc;
        Thu, 14 Sep 2017 02:49:07 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA3jEG3R6MWAb9hr9mpUDuO7LsnBtnnvyHvyTBYztMROqx8EWdLOgMoqnRjShkkRFEIOiyJ
X-Received: by 10.200.15.74 with SMTP id l10mr31446876qtk.159.1505382547463;
        Thu, 14 Sep 2017 02:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505382547; cv=none;
        d=google.com; s=arc-20160816;
        b=LWPFZYtn2cwqbDlDqWI5DWz59cHD1Y9Ci+LUrPURt4xQp62jn4ezzaiw8H3xE3sW3p
         zsifRtMmsGJYSdVD3Hg/ZaTGDSabJiffOR7Ezv0Jh8ANOaW36ioRwzcm04VExcibTfSh
         tTaBC2ql7h4q8V3EP60KQ+zvzSfx/iz44YXS08vmwOXD49S7ff/rzUzJZ7g30Uyg5DoB
         EYU8Nvk5lZAprbpXU/AxhGdF0RuZTktmcWuocHUPIOPOFnoXaYINv6uykg+OuxYbI2/+
         pA18p0Fnp28Tedp4QdzL9tNTr/gWMpwMumHrK31g6c1hroTdKqG9iC59ETRG3CJSV6SI
         ACqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=4XiWUT6VLnq8K5roq0G68nzbg6uwJAcCrM8D/0s6Us4=;
        b=xtAJ10k+y++vjaBsKoccH7Cizr99K+5LoOZvqqzxfEHpRInMXC/K9lT+zpnceUZcPr
         pdFchKEzAXkFozTsJo3wRjU0Y+QXSaO2QzGRFAX+v5HAEoONje7jtfQIlabOkAQOclMH
         svmEtRMOFX05Ct9YBRo70exYozjxvZsgg7hnasLfPO7pAgweN7JCv1035oC0+g5HlH3S
         W2I3YEqBUXLS24NPrJMZooPE/isJb5hutE39u334J9mAwMRDSkiD5IIqTJM86xLS/6cB
         xF/Y0n29jOIzcJ1RCCnASJMASPY9INYywsfrn+jRThb5VkU5Vvqe6ZsRVPpMFJxhr9M6
         P1+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u25si17668057qth.458.2017.09.14.02.49.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 02:49:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46645 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsQld-0006eJ-6r
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 05:49:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dsQlS-0006e9-Ti
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 05:48:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dsQlN-0001lw-Mn
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 05:48:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50622)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1dsQlN-0001h2-HQ; Thu, 14 Sep 2017 05:48:49 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EB54356D4;
	Thu, 14 Sep 2017 09:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2EB54356D4
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=dgilbert@redhat.com
Received: from work-vm (ovpn-117-192.ams2.redhat.com [10.36.117.192])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 429E252357;
	Thu, 14 Sep 2017 09:48:41 +0000 (UTC)
Date: Thu, 14 Sep 2017 10:48:38 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20170914094838.GA3982@work-vm>
References: <20170913142036.2469-1-lvivier@redhat.com>
	<20170913142036.2469-4-lvivier@redhat.com>
	<20170913162709.3933352d.cohuck@redhat.com>
	<32c345ab-ce02-fe29-1587-db863fb21209@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32c345ab-ce02-fe29-1587-db863fb21209@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 14 Sep 2017 09:48:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 3/4] dump: do not dump non-existent guest
 memory
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CviDXQeYqMzd

* Laurent Vivier (lvivier@redhat.com) wrote:
> On 13/09/2017 16:27, Cornelia Huck wrote:
> > On Wed, 13 Sep 2017 16:20:35 +0200
> > Laurent Vivier <lvivier@redhat.com> wrote:
> > 
> >> From: Cornelia Huck <cohuck@redhat.com>
> >>
> >> It does not really make sense to dump memory that is not there.
> >>
> >> Moreover, that fixes a segmentation fault when calling dump-guest-memory
> >> with no filter for a machine with no memory defined.
> >>
> >> New behaviour is:
> >>
> >> (qemu) dump-guest-memory /dev/null
> >> dump: no guest memory to dump
> >> (qemu) dump-guest-memory /dev/null 0 4096
> >> dump: no guest memory to dump
> >>
> >> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >> Tested-by: Laurent Vivier <lvivier@redhat.com>
> >> Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> >> Reviewed-by: Greg Kurz <groug@kaod.org>
> >> Reviewed-by: Peter Xu <peterx@redhat.com>
> >> ---
> >>  dump.c | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> > 
> > You need to supply your s-o-b as well, no?
> > 
> 
> I was wondering... theoretically, yes, so:
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Thanks.

Dave

> Thanks,
> Laurent
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
