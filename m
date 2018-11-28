Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1315185wrt;
        Wed, 28 Nov 2018 09:30:38 -0800 (PST)
X-Google-Smtp-Source: AJdET5cqbMxbcnlkBtzsIF2pfDm3T8yv/59xWQDbfgogUHQyQynGcfG8KeLAXjDOL+BNNDgEn00e
X-Received: by 2002:a81:3753:: with SMTP id e80mr39326877ywa.505.1543426237939;
        Wed, 28 Nov 2018 09:30:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543426237; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2McP7uud9mGBJUIIlQvXNehJ5Ns32fQhgeaqW76uYMYw8PRWDi++rzDO+m6kTWac0
         d4lOu3d4PIKSOwwQSUjDU2PoiLQa9jYzKbE+MDXJ4+Lxw5Mh6AqdsKCeSlD42qPQ7zFO
         wMLfDO0Z3qmhe+qy9M5rxySR22I9Ei7ha/GVv1ryvPSMSyTKalwJhgfBjM69metprBBN
         EhlozqwKu++gdcT9SjBV68GK2F/my3vrcTqAZQDl0NodBZT3xoejFKkbq+u8rKfyNs+g
         OF+YWxkn/DvtS0Qf10ADxtzZwPVsi7UwZsgkDHjVewvWxtOeVd4sP4NOQWGKp4o+Dq6D
         E4WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=iwYXw3UtzPynOBwjRC/WYL8RKYzsrTlCNHL18O3lVp8=;
        b=01a82tSrQ5kbPVvTFarQhMnWfa5i7kYgt99VW/qX8n429abyrPuQxFYaKTwx+A/ghm
         ZmTy9iGk6fJJdSnLYSydmoB4cHT8VWCMi+v1wO0VpAt09x7tG7zn25YofLgHD8oB+GuF
         TavtI8HlViK/76WNaIKCFisZxUIACwHStU9GGpwyZV6Iip9cELn8WAE6C4HGk4d6qDi5
         cOswEafy2YS0anlAewFxeniIoCYwJfIKDb1FLNxC1QiFpy5bZqbgSVVThillbKElne1e
         0xL6qYhkayw/kO4YnSzvSxsjDtXzejox/aBv+CW/3bqaNAxHafljZ/9I4tgC9TprOJ7H
         eeow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z125-v6si5306378ywf.155.2018.11.28.09.30.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 09:30:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49175 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gS3fZ-0003tj-Ca
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 12:30:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gS3es-0003s0-51
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 12:29:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gS3eq-0005Q7-Un
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 12:29:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59156)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gS3el-00036I-47; Wed, 28 Nov 2018 12:29:47 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED8863002E15;
	Wed, 28 Nov 2018 17:29:37 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08E7B7A5D7;
	Wed, 28 Nov 2018 17:29:34 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20181126154616.18173-1-eric.auger@redhat.com>
	<CAFEAcA9B_jLiHLzJZrKuhT3SfXB+pzj03D=NiVNWqRc+zc=qTA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ac1e7ca7-e050-1f56-03fb-cafaf2fd6ae5@redhat.com>
Date: Wed, 28 Nov 2018 18:29:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9B_jLiHLzJZrKuhT3SfXB+pzj03D=NiVNWqRc+zc=qTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 28 Nov 2018 17:29:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-3.1] hw/arm/virt-acpi-build: Fix SMMUv3
 ACPI integration
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b/42uW9EE0Ju

Hi Peter,

On 11/27/18 2:32 PM, Peter Maydell wrote:
> On Mon, 26 Nov 2018 at 15:46, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> The AcpiIortSmmu3 misses 2 32b fields corresponding to the
>> proximity domain and the device id mapping index.
>>
>> Also let's report IO-coherent access is supported for
>> translation table walks, descriptor fetches and queues by
>> setting the COHACC override flag. Without that, we observe
>> wrong command opcodes. The DT description also advertises
>> the dma coherency.
>>
>> Fixes a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reported-by: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> 
> Hi; it looks (from looking at the code) like this isn't a
> regression from 3.0 -- is that right?
Correct, the lack of COHACC override flag has been there from the very
beginning.
> 
> I think this fix has missed rc3 (discussion seems to be ongoing
> and it needs more time on-list for review), which means it's
> likely to miss the 3.1 release. So at the moment I'm expecting
> it to go into 4.0. (Maybe if we need an rc4 for some other reason
> we might be able to put it in.)
OK

Thanks

Eric
> 
> thanks
> -- PMM
> 
