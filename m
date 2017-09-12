Received: by 10.223.172.38 with SMTP id v35csp6682845wrc;
        Tue, 12 Sep 2017 01:12:06 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD4Wi9EcppEvadP3A17H8LvmA++7iBZmqdmSNs7+rMgc7zZmtF637mBs2ZFKGsF4+y21+n4
X-Received: by 10.55.143.134 with SMTP id r128mr19067892qkd.211.1505203926621;
        Tue, 12 Sep 2017 01:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505203926; cv=none;
        d=google.com; s=arc-20160816;
        b=pAUqQSZwLx1kiMIK5xWyCbBs5WNCwyGsr+qPjlToNjfHgJ/2g01wPWhZd4vzGtv6Vb
         YHxtfUwqZKblqPPHtZfywlPOKUlT5hkk4tLcf5aqyKkCFr6MVvpfiQTA3tUFSAYdXr2N
         39yS/SMduEo4E7Tvb5O0NM4COEwpS+fwLM4wKIWSgs2AHOOw/jMFJ4DqjsPp11UcAN2N
         hq+Py/5jiyxgAZUALAp7Ok29XmjZdVYfEnqVRjrrvdMD6suX0NWXvb32iZ8QCNf8prMN
         gPoHQgF57AtB0DsiOD63RzoBF038uyEBB3nfeOxGPHcrMirBqpkHx6f+A+HSOvovRFFc
         uuvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=5Ew8dpgFRl8gAjdQZLNSTjL4s8l32s9Vkywx4KySNCc=;
        b=DiQ67SvdCC5ca04X25UCQZP/axoJzdPKqznj2XLvHY5dIAgV3yx7Yvz93QFQ+w/ewp
         Bnmk7TrqTcptPMZYzUmmtEZ5D/L7tdVI1zCKLgsI2qgngviVmQUzh4g0QXdPOqqbilej
         TTw3VqcRVIJAcNcE1EQDTP2YOuawaQgpf8sSA9LlCnbFs4W7iWQrSgR+Wq9oVtVD0mmi
         SWr97Y5Ikx7fzka8xTrciZ3ax16GXprB26xLTAGJ8lgiH6zZjS1i6jpAFPZsNSukWGlv
         2j1z1w5Trle2H1UG1pyyvVK0FoV9zwpXlh/VGo7pUXUXtD0994sF+Igmpi5V85TIjc5T
         uqrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j127si11797982qkd.99.2017.09.12.01.12.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 01:12:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drgIe-00076u-IJ
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 04:12:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drgIU-00075p-Fz
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 04:11:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drgIR-0008Qy-8M
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 04:11:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41560)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1drgIR-0008PD-01; Tue, 12 Sep 2017 04:11:51 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67E6F828;
	Tue, 12 Sep 2017 08:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 67E6F828
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from [10.36.116.239] (ovpn-116-239.ams2.redhat.com [10.36.116.239])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D3BF36C52A;
	Tue, 12 Sep 2017 08:11:43 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20170911142056.15643-1-lvivier@redhat.com>
	<20170911142056.15643-3-lvivier@redhat.com>
	<CAFEAcA_G8mEzB0Mox0TTz578LQKXgvhNHeZ8Bk7OwC4NbqiXPg@mail.gmail.com>
	<889d6ce7-073f-7860-e091-619c1202b1cd@redhat.com>
	<CAFEAcA9Wmq+G6H78NdsVs5mKDrMcUkB30yY2d=3+KOnbT-pmAQ@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <315f4cc0-0cd2-4c68-1b0f-26b6979d85e5@redhat.com>
Date: Tue, 12 Sep 2017 10:11:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Wmq+G6H78NdsVs5mKDrMcUkB30yY2d=3+KOnbT-pmAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 12 Sep 2017 08:11:47 +0000 (UTC)
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
X-TUID: G8nDrEWnTKzM

On 11/09/2017 18:40, Peter Maydell wrote:
> On 11 September 2017 at 15:45, Thomas Huth <thuth@redhat.com> wrote:
>> On 11.09.2017 16:39, Peter Maydell wrote:
>>> On 11 September 2017 at 15:20, Laurent Vivier <lvivier@redhat.com> wrote:
>>>> Commit fd5d23babf (hmp: fix "dump-quest-memory" segfault)
>>>> fixes the problem for i386, do the same for arm.
>>>>
>>>> Running QEMU with
>>>>     qemu-system-aarch64 -M none -nographic -m 256
>>>> and executing
>>>>     dump-guest-memory /dev/null 0 8192
>>>> results in segfault
>>>>
>>>> Fix by checking if we have CPU.
>>>>
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>
>>> It seems a little arbitrary to assume that if there's no
>>> CPU what you wanted was a 32-bit little-endian dump.
>>>
>>> Why do we have a machine without a CPU anyway ?
>>
>> The "none" machine is always started without a default CPU.
> 
> If it has no CPU then how can we create a core dump for it?
> We don't (in theory) even know whether it's x86 or ARM.
> (One day we may support multiple CPU architectures in
> one QEMU binary...)
> 
> If the theory is hotplug-later then we're a bit stuck
> because we need to know information now that we can't
> know until the CPU is actually hotplugged.

As we have memory we should be able to dump memory, even without CPU.

But I can also do as proposed by Thomas and return -1 to cancel the dump
if there is no CPU.

Thanks,
Laurent
