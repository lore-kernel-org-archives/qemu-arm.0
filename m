Received: by 10.28.91.67 with SMTP id p64csp892288wmb;
        Mon, 12 Mar 2018 08:25:11 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtL2/bEa0+vHKvpjnRCeclzgK/wMHyYlSBbE0V/UcgZSYnZPnrp2+68cVis+zPITQMdKSfx
X-Received: by 2002:a25:a145:: with SMTP id z63-v6mr4971213ybh.96.1520868311797;
        Mon, 12 Mar 2018 08:25:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520868311; cv=none;
        d=google.com; s=arc-20160816;
        b=aE5FBttLdRC6JQUkJVW0NFGDRKe2Cqz0olQ6cd2z/ci4MONmqS+Z1pdpBqeo+U/p0M
         b6W13JjS8DvEygTG0NWw6D1KigMqj+ZstKJknU24NiuZFn3dCC/eXIH5fRxqTzOV98LN
         BvnejXhyjfPleIwJiL6kPkOOGh6b1qWtmEKNhOZwik95fSb6aBjdqBgIXy+vcJO3VicZ
         Vzp3wltnvGZpynW/Z5KBL8xTeRCc7cCdzypfGqdJlZolrZI4P5rycDk4U1Rl3+Zj9vMk
         NbEpqbTGDcD6kCSpo0EQgjQZFfiGvWMHXKOY//4Hq7/hKxI55B6kmy/P+pVpiPpPXJI/
         zTLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=Xca/KsxvvP/oUfskmHRoOPMp73GYsoM7YVZ5TEwewN4=;
        b=zgLZTzLXQAccPvQiYFTpTM5T+RUsRV97VrhCWF4LP0vjjWJKybQHzqWYiRpPL10XXI
         pWu93HK7QYc+HVTRn/Iyg7n1eC0ClHRw7dmSu5gIFAK2M5ddyTlCCqiyjcDztHS/6kL5
         5ogJh/0npiSDtIShm+kLewWXSiALn2YZGUtVM7+XDnp4O130xP6haqImssRsKE4okALm
         2+rGDMnh7DED5T9Y3xgfgIpIOCM4+NIXI510HI8iuJHK1COPaHb6ojDFbOB4GcUX0wtc
         F9FJQ0hWjxdBq3eLFiHjZAjH1F4phf+gbEG3g5ZXb13zfHrDj6IRnopNn6N+N8MDoNgY
         lQqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z22-v6si1210765ybi.801.2018.03.12.08.25.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 08:25:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59521 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evPK3-00046B-64
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 11:25:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1evPI5-0002E6-Fr
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 11:23:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1evPI2-00008m-Ap
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 11:23:09 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43544 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1evPI2-00008M-79; Mon, 12 Mar 2018 11:23:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F64D4000B6E;
	Mon, 12 Mar 2018 15:23:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9729D2166BAE;
	Mon, 12 Mar 2018 15:22:55 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9KzitEO21Rgh8Azip+gVJjyobzNbk8sHuQf-ngg+Jjxg@mail.gmail.com>
	<74aa2e5e-ed1b-3cf8-8ddc-41f7ef90ad7b@redhat.com>
	<CAFEAcA-Mb_o88ieynaY8k6xehTyAoC13Dkf0QUUyOGmEjRd7XA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <20cc43e6-47b9-c7e7-09bb-21d170aab182@redhat.com>
Date: Mon, 12 Mar 2018 16:22:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Mb_o88ieynaY8k6xehTyAoC13Dkf0QUUyOGmEjRd7XA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 12 Mar 2018 15:23:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 12 Mar 2018 15:23:02 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 00/14] ARM SMMUv3 Emulation
 Support
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Prem Mallappa <prem.mallappa@gmail.com>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pZMpjqPtX9hw

Hi Peter,

On 12/03/18 13:58, Peter Maydell wrote:
> On 28 February 2018 at 08:44, Auger Eric <eric.auger@redhat.com> wrote:
>> On 27/02/18 20:02, Peter Maydell wrote:
>>> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>>>> This series implements the emulation code for ARM SMMUv3.
> 
>>> What state is this series in now? Is it "seems ready to
>>> go, needs review"? Are you hoping it might get in for 2.12,
>>> or targeting 2.13 ?
> 
>> Yes I think it is in a decent state and I would be happy to get some new
>> reviews, for a tentative pull in 2.12. In any case I will be reactive on
>> any comment in that prospect.
> 
> Hi, Eric. I've now gone through the patchset and reviewed it. Sorry
> I didn't manage to get to this in time to be able to put it into 2.12,
> but there weren't any major or structural issues, so we should be
> able to get this into the tree early in the 2.13 dev cycle.

No worries. I am already really grateful to you for the time you spent
on this comprehensive review.

I have taken into account most of your comments already. I will run some
more tests and post v10 this week then.

Thanks

Eric
> 
> thanks
> -- PMM
> 
