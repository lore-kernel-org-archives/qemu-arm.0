Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1295212wrp;
        Thu, 14 Feb 2019 10:22:42 -0800 (PST)
X-Google-Smtp-Source: AHgI3IarDGqApSKO/xT2AIRFfv4eIs+nhyZK88bGcj4zI8pVPTJi6B31J3JunzcO43pmip5sKPZy
X-Received: by 2002:a81:55ce:: with SMTP id j197mr4489925ywb.100.1550168562561;
        Thu, 14 Feb 2019 10:22:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550168562; cv=none;
        d=google.com; s=arc-20160816;
        b=uPLKAXwbZqH8ul2Etl6fHbuXWo+eBIvA4+93+neLWEqZ1SJle7nS21JqAP44W8SCRb
         1hpeypgsPaAYVvPNxWmYnZsgSqx2pWicXRtemAMPisggAGew8rPaUGsgeGJTDIekiS8N
         GKPWLN8hQ16EjDDu1GZOSZkIN6O8V4E40FbG+/MAfTMFRL1L6rHmb39PYbGfFbMAAaSa
         szFMf6P7zzaBlHkyLT0glXK2/Y1jCVJtSvbfa0SsEmhcrr0ZClqtJo/VoL1H+0Oi4BrB
         M/ZhLspupHYDHVHN7SniOR8LwaE8uZxDhouvP7o4eqVHGfbqTrURty91iLSWprOJurjC
         AYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=wchcFG9yqYOpPKbEROdZqIxrS94En0LVEgAsSie6XCs=;
        b=POhglZlIT/iNtOBtG53QBjKCGS3YGctaD0c66cX/ejh6KfCiRG/5DJje9FJvpnVE1+
         aLXkwDUf+jtFGqg9JECb81J2HJmUB1BMBrUQGbYWfHmmmTMAFOwSNISFr2CIPMS1w4QY
         9948pBo6YozRAhd7olUmP7wv2YmiXeV6UhugciK184Zit8c8WGcBymv+S2tZVgh7DRtf
         bmHWtMqY5u/b8yiVTRDs7ENG+jJYJ3RI6fXeVY+Ch5bJcArtn618ASl9++v7IvuIfnJv
         EmFUp++K3YeJdusZmu2+n9yHcHUTIQchdrRAa24T4pbsySTMYro98qLGbJD/l4tyElst
         t9TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c65si1808607ybf.428.2019.02.14.10.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 10:22:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guLej-0004nh-Vk
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 13:22:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1guLSU-0004OL-Ql
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 13:10:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1guLSU-0000pI-3k
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 13:10:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38298)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1guLSS-0000jK-7R; Thu, 14 Feb 2019 13:10:00 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F36389C3B;
	Thu, 14 Feb 2019 18:00:28 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E17A600C1;
	Thu, 14 Feb 2019 18:00:20 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190205173306.20483-1-eric.auger@redhat.com>
	<CAFEAcA9QHxm7ACYBnKibfderjfgg+9p+xHZZB4QmMHk26BqTuw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8b51d0ed-ea6b-1f75-e134-5e51e111bb98@redhat.com>
Date: Thu, 14 Feb 2019 19:00:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9QHxm7ACYBnKibfderjfgg+9p+xHZZB4QmMHk26BqTuw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 14 Feb 2019 18:00:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6 00/18] ARM virt: Initial RAM expansion
 and PCDIMM/NVDIMM support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, David Hildenbrand <david@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iISRhOvl3oBH

Hi Peter,

On 2/14/19 6:35 PM, Peter Maydell wrote:
> On Tue, 5 Feb 2019 at 17:33, Eric Auger <eric.auger@redhat.com> wrote:
>> This series aims to bump the 255GB RAM limit in machvirt and to
>> support device memory in general, and especially PCDIMM/NVDIMM.
> 
>> Functionally, the series is split into 3 parts:
>> 1) bump of the initial RAM limit [1 - 10] and change in
>>    the memory map
>> 2) Support of PC-DIMM [11 - 14]
>> 3) Support of NV-DIMM [15 - 18]
>>
>> 1) can be upstreamed before 2 and 2 can be upstreamed before 3.
> 
> Hi Eric; sorry I haven't reviewed this series earlier. I think
> that 1-10 are pretty near to ready to go in; maybe the easiest
> path is to do a respin of just those with the review issues fixed?

No problem. Thank you for the review.

Yes I will quickly respin the patches you reviewed.

> 
> I'm a long way from being expert in the PC-DIMM/NV-DIMM stuff, so
> I'm going to be reliant on other people to review those parts.
> 
> I don't know if your series needs anything from linux-headers
> which isn't already in QEMU master after the update to match
> 5.0rc1 -- if not you could drop the header-sync patch.
5.0-rc1 should be OK so I think I can drop the header sync.

Thanks

Eric
> 
> thanks
> -- PMM
> 
