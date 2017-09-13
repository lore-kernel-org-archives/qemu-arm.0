Received: by 10.223.172.38 with SMTP id v35csp1063007wrc;
        Wed, 13 Sep 2017 06:42:25 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBK1VRX/a9UpC0Szs02kWstzSXyGJ7Zuhv0CvqOK4jqk8J+gratxWd3fdPnpo7bcyz0Ev+R
X-Received: by 10.200.57.29 with SMTP id s29mr26791669qtb.309.1505310144894;
        Wed, 13 Sep 2017 06:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505310144; cv=none;
        d=google.com; s=arc-20160816;
        b=hNgc6fNOWjXPfblm9pRmxjgB8ZbBcNZ19mLCR0muNzsayyNqOSApjzIH9LrajOc4Z2
         2nFlDooI+600tJTc923OrzGYqJpFff/rD8ZaLq0mkQ6tZ57x/QOiBXNnT0RYGNEsiFC9
         TN64MDnO7CS2HOjyrkfpHQLtokzAeBMv5rNKBg+gJA2QHIo6l4Jrealwb97o35HNwXOj
         E7oJxkCRZhCwWMHDQAay044G+i32VOFMS/ZNLAdAwtVkujriGNAWFery4gJEZIEFDpgx
         9T/pu9XCZmPM6C4MZxMR+jrifYSp7Hz4KuofIrjuxOyh8ja+o4IZvSmlWFgf5z5G2WQ1
         5zVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=txG8sMBx7kfdpeMqIlpBsrKe4xD6TRWNFNPMsCOhynM=;
        b=IAF1V/XOrJrhkIqU9oxXEZKGzU+AB8ueBp5iTOlNXH+FcxOJnR5oIzHq76AKIQW8zo
         /9579Jpgq2wyijU8CKmJPn30oNhi81BjxcJ6yjU442uzs912nDDN+qY/Sm+mcPeOI8gb
         Zf4r4o+BCAzR5ynYtUaGsA1XNBXOoRi2LTnoc0oJ6fAEovDQGCmRkh3hkd+4yuNwwM+o
         BrGepMCkY1BXvEpzLCd1FtyW+jPAv6LNvXaQzbbx6BWBPDIsKNebXiP+Q5Voue/1Ns6o
         W4+ht8bJf1q6NnPdPQIVCRm/PRGoO6jc5/vgpSDIgcfJM8Muc6SR8VS9q2nvtBjdT3u+
         JEaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p94si15325697qkp.387.2017.09.13.06.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 06:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds7vq-0006kS-K4
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 09:42:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1ds7uW-0005HW-BR
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 09:41:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1ds7uS-00087n-E4
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 09:41:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:21531)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1ds7uS-000873-7I; Wed, 13 Sep 2017 09:40:56 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D655883A0;
	Wed, 13 Sep 2017 13:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3D655883A0
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=dgilbert@redhat.com
Received: from work-vm (ovpn-117-158.ams2.redhat.com [10.36.117.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C0B36C509;
	Wed, 13 Sep 2017 13:40:52 +0000 (UTC)
Date: Wed, 13 Sep 2017 14:40:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20170913134050.GE2096@work-vm>
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912140149.7692-2-lvivier@redhat.com>
	<20170913053533.GF7550@umbus.fritz.box>
	<20170913124456.GB2096@work-vm>
	<770fc286-a566-920a-9aba-16c3b5264806@redhat.com>
	<20170913131948.GD2096@work-vm>
	<5accd02c-f116-22ef-99ef-1ddd9e58fc21@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5accd02c-f116-22ef-99ef-1ddd9e58fc21@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 13 Sep 2017 13:40:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 1/3] hmp: fix "dump-quest-memory" segfault
 (ppc)
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
X-TUID: YpZkPoZHFaR6

* Laurent Vivier (lvivier@redhat.com) wrote:
> On 13/09/2017 15:19, Dr. David Alan Gilbert wrote:
> > * Laurent Vivier (lvivier@redhat.com) wrote:
> >> On 13/09/2017 14:44, Dr. David Alan Gilbert wrote:
> >>> * David Gibson (david@gibson.dropbear.id.au) wrote:
> >>>> On Tue, Sep 12, 2017 at 04:01:47PM +0200, Laurent Vivier wrote:
> >>>>> Running QEMU with
> >>>>>     qemu-system-ppc64 -M none -nographic -m 256
> >>>>> and executing
> >>>>>     dump-guest-memory /dev/null 0 8192
> >>>>> results in segfault
> >>>>>
> >>>>> Fix by checking if we have CPU, and exit with
> >>>>> error if there is no CPU:
> >>>>>
> >>>>>     (qemu) dump-guest-memory /dev/null
> >>>>>     this feature or command is not currently supported
> >>>>>
> >>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> >>>>
> >>>> Applied to ppc-for-2.11.  I'm not really sure what to do with the rest
> >>>> of the series though.
> >>>
> >>> I can take the whole set through HMP.
> >>
> >> Could you update the comment in last patch as asked by Cornelia?
> >> (PATCH v3 3/3] tests/hmp: test "none" machine with memory)
> > 
> > Sure, do we understand what the error that patchew caught was?
> 
> We need the fix from Cornelia, otherwise the new test fails.
> 
> Do you want I resend the series including the fix from Cornelia to be
> sure patchew works?

Yes, that's best because I think you're saying we need to put
Cornelia's fix in before your 3/3 to ensure it's bisectable.

Dave

> Thanks,
> Laurent
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
