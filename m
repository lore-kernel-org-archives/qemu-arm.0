Received: by 10.223.172.38 with SMTP id v35csp5634239wrc;
        Mon, 11 Sep 2017 07:46:17 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBopczpmX6W534pmK8tNdXOok8CxM/Gr4UbuT+WzemmeRC7eGBbp0bvB7IssNtW6l7Nrt0y
X-Received: by 10.55.82.197 with SMTP id g188mr11102687qkb.240.1505141177382;
        Mon, 11 Sep 2017 07:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505141177; cv=none;
        d=google.com; s=arc-20160816;
        b=WbrkrneQB3byDVCZf5OE3Rjgy6ah2xcKDEUhr5c3JGe5pcaLzbjXdUr3UyBhHdRFwi
         6DtxIm6A4wECBzXe9eclWNC0xXi2bGWK3qRVX8c9sLaLk8D/HlVhuJRD/zaLkNqNOm67
         Xtfs8LHD3dgqb7GKe2lqdWyavcqnIOUMyOnNrxiYFApuur00miiBrhfwyqS/jMJICOgN
         yZRP8myUjQVDQCvYEBoxXMW4yhMsWfis1Pfhog3/nlNM3OsdUTD1sYUVzULFS9FzyiAy
         Ltrst/0eVnbn9VN418DuknW6mHhpmz2k+CVgnWLCuDFOqlW70wb5qnmzX9PTbYWdTKrt
         B0VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=hsZyhWvk2oD7LJNWBM1GO+BPSAEyv/pXxnEfuPgjka0=;
        b=UN9Yd7SbbksoIBY9nLFAHfWys7qRqBNxmOXMNhN4qDE3smYOEb7za2M+3L8BAhXzJS
         jCAnvqMCZRCT5y4rSJxUM9NUw1uwR7IlPK0B3zXUc+H1tajthmidcEwU0I+Kl8m5TzIF
         Cz36YHZEVyeg7rjstac+A45PExHbwJ4HQYNJYjMbp4JSCjxgfbycdNAbIJnx9VPc+bTk
         XOrEvy8aOySc7ONpO8yPPv5qvi1NBkQKrXrT+Wcf26PjGIjfZfzcE1v4D/o25IY2VTPe
         6JU/GrIlsi5F2ptFvQ58t0iwzWneTMh5UDNnfLKk6LeSCB+8JLnCVC5DNDadl2Fc0lN2
         xqBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k65si9123823qkf.467.2017.09.11.07.46.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 07:46:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drPyZ-00050j-48
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 10:46:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1drPxr-0004QV-9p
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 10:45:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1drPxn-0003AN-CJ
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 10:45:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35552)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1drPxn-00039n-5X; Mon, 11 Sep 2017 10:45:27 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2091732D306;
	Mon, 11 Sep 2017 14:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2091732D306
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.113] (ovpn-116-113.ams2.redhat.com [10.36.116.113])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C29A5C898;
	Mon, 11 Sep 2017 14:45:23 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
References: <20170911142056.15643-1-lvivier@redhat.com>
	<20170911142056.15643-3-lvivier@redhat.com>
	<CAFEAcA_G8mEzB0Mox0TTz578LQKXgvhNHeZ8Bk7OwC4NbqiXPg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <889d6ce7-073f-7860-e091-619c1202b1cd@redhat.com>
Date: Mon, 11 Sep 2017 16:45:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_G8mEzB0Mox0TTz578LQKXgvhNHeZ8Bk7OwC4NbqiXPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 11 Sep 2017 14:45:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 2/3] hmp: fix "dump-quest-memory" segfault
 (arm)
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jq/Pe4XGBJtJ

On 11.09.2017 16:39, Peter Maydell wrote:
> On 11 September 2017 at 15:20, Laurent Vivier <lvivier@redhat.com> wrote:
>> Commit fd5d23babf (hmp: fix "dump-quest-memory" segfault)
>> fixes the problem for i386, do the same for arm.
>>
>> Running QEMU with
>>     qemu-system-aarch64 -M none -nographic -m 256
>> and executing
>>     dump-guest-memory /dev/null 0 8192
>> results in segfault
>>
>> Fix by checking if we have CPU.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> It seems a little arbitrary to assume that if there's no
> CPU what you wanted was a 32-bit little-endian dump.
> 
> Why do we have a machine without a CPU anyway ?

The "none" machine is always started without a default CPU.

 Thomas
