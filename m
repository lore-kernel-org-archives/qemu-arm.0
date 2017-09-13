Received: by 10.223.172.38 with SMTP id v35csp1110919wrc;
        Wed, 13 Sep 2017 07:27:36 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD011Sdo2dlXsksclwzWichxz9lKThJugW9i+YGaokEl3/4B7dVeVmUEEVWCJh4ONHkk83o
X-Received: by 10.55.72.215 with SMTP id v206mr24471983qka.92.1505312856422;
        Wed, 13 Sep 2017 07:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505312856; cv=none;
        d=google.com; s=arc-20160816;
        b=0+sA4/1rDMQlbKqvDJaGafMik0qC+ojdjy65oQEdxM12tbZFWU3HYA6lRYSF7aaVA2
         JoEK1PuyXENU2H0Nhe+1kNPRczfZQFlDlTMFZjDddZlrNgdQYqVJSihS6PxjJw9SZPTX
         GLEMsxo8Q5TBj/7IZU3UR4TO7BKECraU0ENN4j91c4+aBXN+/zJLJkOZm3tAQSxVoqGr
         z9HDZNt+udPthjvrFuIPoV3mKtomZSz9sW7Ip/As8VuhA4rFwSqrgOE8ixP/zGmtOGVf
         ax/lf927fov5w55Ec33fwbTPt6u0Z9GiB7Jf6BAbDlbZoyLEjvL3qDxLpQxRHt44atxp
         A6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=Lrjd/Fs7LXOMNMgSkoofH4jTuuUCNTNTKyZVXDdLK7M=;
        b=nOnh2oclJbjoYJoUj5sOlvpMajdbbNil9Wa4wK3yd6vm9T/x6ED9jWRw6GoDc58CEy
         J74K7qI1vN4LNwEk9aMDg6clsMmM5/BzEcmKVhrwgaKCDjOZVZiCH4Iq33//Vw3SY5BC
         M38mM0q/cORUtBZufUkqIjpbiwyFHP2qIc9E6DLWsxQZPGm0r3Vb2rOsmsOCvWzi18X2
         whXSVSTtYD+shEGmLo8hwXbmXORIPG1frM2zvoyUsiKKXeAMrH5R3anFfBQIw6TCh2hD
         WzokBcJyCQanJFUC0Id4101a0a1lYEX05lCu+EjR4+BMTMvObnBrFXqGxCYvIjkngg+h
         efoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d2si14207594qtl.110.2017.09.13.07.27.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 07:27:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42815 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds8da-00029r-5c
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 10:27:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1ds8dN-00026r-8K
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 10:27:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1ds8dK-0000Dz-38
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 10:27:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43700)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1ds8dJ-0000DD-T7; Wed, 13 Sep 2017 10:27:18 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2A345F742;
	Wed, 13 Sep 2017 14:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E2A345F742
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (ovpn-117-3.ams2.redhat.com [10.36.117.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B5565FCD6;
	Wed, 13 Sep 2017 14:27:12 +0000 (UTC)
Date: Wed, 13 Sep 2017 16:27:09 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20170913162709.3933352d.cohuck@redhat.com>
In-Reply-To: <20170913142036.2469-4-lvivier@redhat.com>
References: <20170913142036.2469-1-lvivier@redhat.com>
	<20170913142036.2469-4-lvivier@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 13 Sep 2017 14:27:17 +0000 (UTC)
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
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dA/LEYIzAnw9

On Wed, 13 Sep 2017 16:20:35 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> From: Cornelia Huck <cohuck@redhat.com>
> 
> It does not really make sense to dump memory that is not there.
> 
> Moreover, that fixes a segmentation fault when calling dump-guest-memory
> with no filter for a machine with no memory defined.
> 
> New behaviour is:
> 
> (qemu) dump-guest-memory /dev/null
> dump: no guest memory to dump
> (qemu) dump-guest-memory /dev/null 0 4096
> dump: no guest memory to dump
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> Tested-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> ---
>  dump.c | 6 ++++++
>  1 file changed, 6 insertions(+)

You need to supply your s-o-b as well, no?
