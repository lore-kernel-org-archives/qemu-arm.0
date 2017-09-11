Received: by 10.100.151.138 with SMTP id q10csp6005143pja;
        Mon, 11 Sep 2017 08:35:50 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAK074tPZ+58TqW8FYl82Bs8VeNEb3EDpQ3QMUEz9/UEq3Rf9s0Yg1XvlcOUs5fiA2SNrvO
X-Received: by 10.55.76.205 with SMTP id z196mr16430590qka.252.1505144150244;
        Mon, 11 Sep 2017 08:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505144150; cv=none;
        d=google.com; s=arc-20160816;
        b=0+YMpy+TDpEn5ySHvODoQIq/uVE73WjCXBI69LXjDZQwDcOxltw6lGpBhVRI3FDzS8
         ImOBoeongE6YRyt0UI0Pgq0ElTzlDjkjcgGjOs8oXj6+7tGpeu3mo46NsFJ6LpXmRPXP
         W4C7SzV513+VGqyepgdObn956k2gytU5bdkcS+ULAKK1dTh+m55vF6uXktPHcjybjXvu
         P4mWiD//YVcJinQmyURmGVGXGO4VpljJwfkyYCpM8ypZmZhd90dN5qoqQT95cKHmcadD
         536JcxtLdVI8xv7VIOwqGL6OGTlQmuTv5pVd/cyDlbUB3991idkuirm0dooa7+Mqv/ck
         Ievw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=eLKNVPyizJX5owbZw+MxYn0IjXG5WOSfm1sGptnJUgQ=;
        b=Ej1UAX8B1lwlS1FDyRqF0h1WfhquFTGRqU6wOBOGsxDgkG9v+Q27w72Fcq6QnAUQ9C
         ccSwgelnmy20pvbjhk8c0KolHNiv4wgc3fzsqmk64FfgPdqo1bJxPfW6xpy8kakZVTLU
         tk+Wwv09+zuP/JMF198JuWysGGRHb30T3Cfhali9t9eexZ3ADi+IS6sVxQlOlNVoXiAH
         8G0kkm1/uOu5RY6M64nZAagTSz42n+O6qBn1b8xC18BOxSqoTCOhKNTlG51stFBkfru8
         P74sz+HsCoiAtBVTjDAbh3BPnUE5BQWmCzb/ev59L1lR1865F3WsZuUC3ke793TYbVmt
         Y2Og==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n19si9989887qtc.340.2017.09.11.08.35.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 08:35:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drQkW-0007la-4E
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 11:35:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drQkQ-0007jX-JW
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 11:35:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drQkN-00039S-IK
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 11:35:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46900)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1drQkN-00038y-8n; Mon, 11 Sep 2017 11:35:39 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 398FD2F86FC;
	Mon, 11 Sep 2017 15:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 398FD2F86FC
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from [10.36.116.239] (ovpn-116-239.ams2.redhat.com [10.36.116.239])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7EA419621;
	Mon, 11 Sep 2017 15:35:35 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170911142056.15643-1-lvivier@redhat.com>
	<20170911142056.15643-3-lvivier@redhat.com>
	<CAFEAcA_G8mEzB0Mox0TTz578LQKXgvhNHeZ8Bk7OwC4NbqiXPg@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <309f01b9-3066-60fd-47d5-5206ae6360ed@redhat.com>
Date: Mon, 11 Sep 2017 17:35:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_G8mEzB0Mox0TTz578LQKXgvhNHeZ8Bk7OwC4NbqiXPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 11 Sep 2017 15:35:38 +0000 (UTC)
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sOT02wRzCWHo

On 11/09/2017 16:39, Peter Maydell wrote:
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

We need a default value.  Is 64bit and/or big-endian better?

> Why do we have a machine without a CPU anyway ?

To hotplug it later?

As we can, we should avoid the segfault.

Thanks,
Laurent
