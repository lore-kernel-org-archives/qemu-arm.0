Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp792425wrp;
        Wed, 2 Oct 2019 04:59:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxh5KySyxKNNCCr5vCPDx22f1P0Yz1aSFxc4HH3DMRS633nvZQaNKz0l2mLJUODuuzOZnfs
X-Received: by 2002:a05:620a:1458:: with SMTP id i24mr3199381qkl.361.1570017573400;
        Wed, 02 Oct 2019 04:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570017573; cv=none;
        d=google.com; s=arc-20160816;
        b=RSDq3tZ4wcbIDGI2l6MLhUdqg7kJag4mwTGo25CJ+THlZ1OeIKZbxBGb90GCI4UHag
         RE6z3b3BO7xbI24nTyHgEvFBmfm0ieSaA8j1MG9sfAV+qJbaOgxVo8xuS9xRYkCVpMlO
         GmXfGEwfDU/O74BIQqIwV/j5ieoliw3F+gxJQ4uIhfeTG+7asjpK+W/kSZcIvK2x7NuI
         U/uw7CDGkPLYewonCnJSGdQneFGw+fuGTr92aAoapmeSSPh+wHvx4NL3lZT1k6nBSl+3
         wC7Oq6+FQV6XVY4MUh1pOe1MVxKqoSboP+gEVXgVmkBwokCD3uo96q0dF8z60ROrG2sM
         ucEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from;
        bh=FZJNoJ57kY5wnZOV5ONOvWNkzFK5fzywTNYA5LyUJ94=;
        b=XVXwk5mcMdPubnmt5by4M1OOTVfxBiB8kMJOS8jDCUqbBv3eDoi6POuulGPuZ5uEvN
         fjU67YriOdZ29nwCJIG9uV0GmhCmPp8gdC2/PB4Mm6hatz80y6KMUeIRExi+f8Cqr2b6
         Z0PhPTHinuBOuaJYkdcELCVNdSs6qo1ajGaCduRrq7Blr5UZ7Y+icumcFAKeCut/jIRT
         KBqKVflz16tZFvZYb1LXN8iTDj3q8zs7gevkE52HHQ0HJXyAW9RYCNQQTJwBiAsl1+7L
         SHVumV7QSmex8IQECx6H0Z/Uv6CRJMr0vKx9gR7+rCc4pV9d3/+Ql67VbqYt3U+lo+EZ
         lkoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18si17010207qvg.159.2019.10.02.04.59.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2019 04:59:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iFdI4-0004Jc-86
	for alex.bennee@linaro.org; Wed, 02 Oct 2019 07:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41550)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iFdHt-0004J2-7I
 for qemu-arm@nongnu.org; Wed, 02 Oct 2019 07:59:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iFdHs-0003vP-9r
 for qemu-arm@nongnu.org; Wed, 02 Oct 2019 07:59:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59430)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1iFdHs-0003v7-4c; Wed, 02 Oct 2019 07:59:20 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DD8543082149;
 Wed,  2 Oct 2019 11:59:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D57C608C0;
 Wed,  2 Oct 2019 11:58:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9AF9A113864A; Wed,  2 Oct 2019 13:58:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 00/31] error: auto propagated local_err
References: <20191001155319.8066-1-vsementsov@virtuozzo.com>
Date: Wed, 02 Oct 2019 13:58:58 +0200
In-Reply-To: <20191001155319.8066-1-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 1 Oct 2019 18:52:48 +0300")
Message-ID: <875zl7uznh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 02 Oct 2019 11:59:19 +0000 (UTC)
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
Cc: fam@euphon.net, pburton@wavecomp.com, peter.maydell@linaro.org,
 codyprime@gmail.com, jasowang@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, kraxel@redhat.com, mreitz@redhat.com,
 qemu-block@nongnu.org, quintela@redhat.com, arikalo@wavecomp.com,
 mst@redhat.com, mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, joel@jms.id.au, marcandre.lureau@redhat.com,
 david@gibson.dropbear.id.au, farman@linux.ibm.com, ehabkost@redhat.com,
 sw@weilnetz.de, groug@kaod.org, yuval.shaia@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, clg@kaod.org,
 stefanha@redhat.com, david@redhat.com, jsnow@redhat.com, rth@twiddle.net,
 kwolf@redhat.com, integration@gluster.org, berrange@redhat.com,
 andrew@aj.id.au, cohuck@redhat.com, qemu-s390x@nongnu.org,
 sundeep.lkml@gmail.com, qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JShoB1/i/YHH

Reviewing this series is finally getting close to the head of my work
queue.  I apologize for the delay.
