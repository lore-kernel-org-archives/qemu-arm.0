Received: by 10.223.159.82 with SMTP id f18csp1023474wrg;
        Thu, 23 Nov 2017 09:45:09 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZ4QGYy6kYMjYz4exg6CLoSMFgiPHRxTyp2IEXnA1SGXd0T58NHngUwKGgIOD7CQZBYVXn4
X-Received: by 10.129.159.196 with SMTP id w187mr16268180ywg.129.1511459109731;
        Thu, 23 Nov 2017 09:45:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511459109; cv=none;
        d=google.com; s=arc-20160816;
        b=0YnYTDMivLfKNjorg4v9TbxTFUGlRstWHHuFd9zQ6Svl9fLujIObtO0mUP4ZwraWyG
         vvDcdjGyZuq6LrEbXClfb6tYDK2wxxYROm0AJ/H95KBam4uCfHBaqhtVVQR/xDM8UEvW
         SqxBfrX69MCExzU5sUMVeKybgzaAtm6UkxSL+lzheLkn/Rr8zANQvqNk3Qdm18R/6UvP
         cKRXqd0+zRJYxo4SfEsMY2h5Q+IHogVaof8KNh1mry7r7Twq3PEhPLx2v/b7Jo30T/YQ
         2FCbp21GSq0UeoVOXZKkBbm8DTVrqLtO/PcA+fCRaJrm1H68Auj0Jd05g/GxF2GVUIfz
         DYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=pmWj//y0qLrjb3ZU7OuqCb5PZbQlDPxyvZcf4kMeDrU=;
        b=og5YXyQUtGEqP445mLXv+pIorX2Wv1x29C75UCKUULxKgrrY7bJAoMcY4BRGo9qUyc
         fXiRKs4cRQ3vBamgdY31/9Yv73ypeoaeFGZFItezQWJX55EUU06saA6gUU0MncCsanJB
         bFAamiD5Q95SptrzSjKf8UehC/pliC/7u333vefwtnYcQ0fNlFCdkzBsdMdIIS7ka7mU
         nJjP63DmfEZJ3VhQQSUBMXr1HkVe1yRFNm8u3Oueo0awE8RiYqvl9fKK4UqgAchSd8ED
         SJUSa5lK1eYXdZY3+1eYf+mFkhU+xaM20ilVHLPAMdFuu+gWP61cD0XYyE69oY9xEZGr
         KUIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q1si3975482ybk.492.2017.11.23.09.45.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Nov 2017 09:45:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHvYj-0004Nc-15
	for alex.bennee@linaro.org; Thu, 23 Nov 2017 12:45:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eHvYX-0004N1-K2
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 12:44:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eHvYT-0004Da-8P
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 12:44:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32882)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eHvYS-0004C8-W7; Thu, 23 Nov 2017 12:44:53 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDC8C6A7CD;
	Thu, 23 Nov 2017 17:44:51 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 419686024C;
	Thu, 23 Nov 2017 17:44:46 +0000 (UTC)
To: Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8T4cShPYONdo8hiaZKvd+zq9Uo1o5awU3rA03uu8Vsiw@mail.gmail.com>
	<1bede1e5-cc11-dca6-9f0b-ef16b9031d7a@redhat.com>
	<CAFEAcA_ZUGR+t2T3cvVo2OkyOccVjtRW+YTN-5KXaw+rFRiRqg@mail.gmail.com>
	<20171123181402.627fd5df.cohuck@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f3a550ab-5eff-1c9c-15e0-32ac70a4c2a6@redhat.com>
Date: Thu, 23 Nov 2017 18:44:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20171123181402.627fd5df.cohuck@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 23 Nov 2017 17:44:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 0/4] vITS Reset
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FhQxpD1rjXO1

Hi Cornelia, Peter,

On 23/11/17 18:14, Cornelia Huck wrote:
> On Thu, 23 Nov 2017 17:01:32 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
>> On 23 November 2017 at 16:05, Auger Eric <eric.auger@redhat.com> wrote:
>>> When using update-linux-headers.sh I get suspicious errors at the end:
>>> grep: /tmp/tmp.A5NjLtHOij/include/asm/kvm_virtio.h: No such file or
>>> directory
>>> sed: can't read /tmp/tmp.A5NjLtHOij/include/asm/kvm_virtio.h: No such
>>> file or directory
>>>
>>> and include/standard-headers/asm-s390/virtio-ccw.h deleted
>>>
>>> I would prefer having s390 people checking and testing that.  
>>
>> I think the kvm_virtio.h problem should be fixed by
>> http://patchwork.ozlabs.org/patch/838230/
>> which removes it from the set of headers the script imports.
>>
>> Cornelia/Christian -- any idea about the virtio-ccw.h issue ?
>>
>> thanks
>> -- PMM
> 
> I had that commit queued for post-2.11, but I can also send it for 2.11.
> 
> The virtio-ccw.h one looks weird... if I run the script on my s390-next
> branch against recent-ish Linux master, I just get the SPDX notice
> update for virtio-ccw.h.
> 

http://patchwork.ozlabs.org/patch/838230/ effectively fixes all issues:
- no errors anymore and
- no deletion of include/standard-headers/asm-s390/virtio-ccw.h anymore,
which is consistent with include/standard-headers/asm-s390/virtio-ccw.h.


Thanks

Eric




