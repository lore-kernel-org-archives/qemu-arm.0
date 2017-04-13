Received: by 10.25.0.144 with SMTP id 138csp636574lfa;
        Thu, 13 Apr 2017 01:19:03 -0700 (PDT)
X-Received: by 10.200.50.199 with SMTP id a7mr1478665qtb.95.1492071543715;
        Thu, 13 Apr 2017 01:19:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si10469056qke.125.2017.04.13.01.19.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Apr 2017 01:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cyZy0-0007IW-TV
	for alex.bennee@linaro.org; Thu, 13 Apr 2017 04:19:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cyZxu-0007IQ-EO
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 04:18:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cyZxr-0003jt-Am
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 04:18:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46986)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1cyZxr-0003jU-59; Thu, 13 Apr 2017 04:18:51 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C28607572D;
	Thu, 13 Apr 2017 08:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C28607572D
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C28607572D
Received: from [10.36.116.243] (ovpn-116-243.ams2.redhat.com [10.36.116.243])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E34D218A4C;
	Thu, 13 Apr 2017 08:18:47 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
References: <20170412173203.20072-1-lvivier@redhat.com>
	<87efwwrdki.fsf@dusky.pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <ab71843b-7148-7df4-6e5a-c5585121fa1d@redhat.com>
Date: Thu, 13 Apr 2017 10:18:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <87efwwrdki.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 13 Apr 2017 08:18:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] arm: remove remaining
 cannot_destroy_with_object_finalize_yet
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 99grve25fXUj

On 13/04/2017 09:06, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> With commit ce5b1bbf624b ("exec: move cpu_exec_init() calls to
>> realize functions"), we can now remove all the
>> remaining cannot_destroy_with_object_finalize_yet as
>> unsafe references have been moved to cpu_exec_realizefn().
>> (tested with QOM command provided by commit 4c315c27).
> 
> Also tested with device-introspect-test :)
> 
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> Thanks, Laurent!
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
> Just three places marking broken devices left: versatile.c
> ("realview_pci" and "versatile_pci"), target/ppc/kvm.c (various ppc
> CPUs).  Volunteers to fix them, so we can get rid of
> cannot_destroy_with_object_finalize_yet?
> 

I think I can have a look to these ones too.

Laurent
