Received: by 10.80.166.35 with SMTP id d32csp1095037edc;
        Tue, 18 Oct 2016 09:57:36 -0700 (PDT)
X-Received: by 10.55.145.129 with SMTP id t123mr1477724qkd.130.1476809856442;
        Tue, 18 Oct 2016 09:57:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s24si21513010qtb.112.2016.10.18.09.57.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 09:57:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42927 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwXhn-00071H-Ve
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 12:57:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bwXhg-0006yb-C1
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 12:57:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bwXhb-0003rq-70
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 12:57:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35262)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1bwXhb-0003q7-1I; Tue, 18 Oct 2016 12:57:23 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 291BBC04B925;
	Tue, 18 Oct 2016 16:57:17 +0000 (UTC)
Received: from [10.36.112.25] (ovpn-112-25.ams2.redhat.com [10.36.112.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9IGv7j0009830; Tue, 18 Oct 2016 12:57:08 -0400
To: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
	<1476485569-6744-3-git-send-email-lvivier@redhat.com>
	<20161017192022.GA3275@thinpad.lan.raisama.net>
	<20161018130007.k7hhxovkxiqiumfj@kamzik.brq.redhat.com>
	<20161018131829.GQ3275@thinpad.lan.raisama.net>
	<20161018142247.55d4aymduofvhy3r@kamzik.brq.redhat.com>
	<20161018152207.GZ3275@thinpad.lan.raisama.net>
	<20161018162202.pmui5rv3va7ubcrv@kamzik.brq.redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <eabc6166-5373-8699-a0e4-0eb3cb00169a@redhat.com>
Date: Tue, 18 Oct 2016 18:57:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161018162202.pmui5rv3va7ubcrv@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 18 Oct 2016 16:57:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 2/3] exec: rename
 cpu_exec_init() as cpu_exec_realizefn()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Jia Liu <proljc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FSdY9YDWS7TK



On 18/10/2016 18:22, Andrew Jones wrote:
> On Tue, Oct 18, 2016 at 01:22:07PM -0200, Eduardo Habkost wrote:
>> On Tue, Oct 18, 2016 at 04:22:47PM +0200, Andrew Jones wrote:
...
>>> OK, to proceed with this patch, since mp-affinity *is* currently a
>>> property, we can just change its default value to ff000000. Then,
>>> when moving the calculation to realize we just need to ensure the
>>> current value is ff000000 before overwriting it.
>>
>> Sounds good to me.
> 
> Good. Laurent, to be clear, MP_AFFINITY_INVALID doesn't currently exist,
> and it should be defined as ~ARM64_AFFINITY_MASK

OK, thank you for all your comments.

I'm going to update my series with this change.

Thanks,
Laurent
