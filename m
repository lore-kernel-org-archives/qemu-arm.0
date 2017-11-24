Received: by 10.223.159.82 with SMTP id f18csp2189451wrg;
        Fri, 24 Nov 2017 06:44:58 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZnnIDx+2xQOV8VT1LtJnDprq+toFYpKbLpjMHSPtGp6GZhS992mYp8MCw6EXbqh7FmXIre
X-Received: by 10.37.40.196 with SMTP id o187mr18173122ybo.244.1511534698283;
        Fri, 24 Nov 2017 06:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511534698; cv=none;
        d=google.com; s=arc-20160816;
        b=w9CHpm5IHoWy6yJ0u7sXVxTe7bCMI/TYohgBPk9SqjwR38wn8HFgrK6HJnUKj6J2xQ
         MvlWcNtrtMc/bcxvM0S6bmHjUSyx57zgPHCWOcAL4ZiE6AWsxidHLQgrTOkX6NAy73DA
         6yE/ku+5oMAEgXXKaX8mTLw9FfX9Ukm1aSscONLhD8Ig268RIw0X2F0vtCrxzYjUg3Hn
         Rzi/y3hQgWZXZ6pSZuEjxbLRNG7XWm5WGCg2NNhFpfvardWktDzCnRedluqv2OjnjKfl
         0O9S/0wfhzidDbM0RyNBTqlx+Fyy5yRGOB5ED7LZ6pEjQPPnYunSN3FU6JNBaTYBhBly
         duHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=GSt7L6Hk6W2XYl3W+Jc6lTDZ8bSsqgiv83horfrbuWg=;
        b=yqqho3a152HbX+j8UX/OOdtOWgyh6MbEvAAWb/MmwKmixWo9PugpbwcgHG8c2stmDh
         tYi/+bMx/ZFM08/SoiZUV5rRe40/y7pYN0w0w0BsO524vc3m9qQXkySKJGI5dupbZpmQ
         f+S7jivoGioAOE6xgmPv++blTQV8Q5ZH5MB3h00HrETQbG2/6KviaNgNBKMegCRXjGlv
         uwIoqtp8oMSgiWv3y+/uz0e7kGF34J58Wy2E0QVGIwg/aIhK5kjtpRzWfN606Jyqu2l2
         vvFuBLqipY6lk3oo7VIoo3st8F27kTAV9SkwFJDZB6YBrK9YoUlISuLjCR1ZkGBuXbgv
         oJ9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z143si4581914ywa.480.2017.11.24.06.44.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 06:44:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIFDt-0007u1-MS
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 09:44:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIFDh-0007s4-Tc
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 09:44:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIFDd-0008NK-0b
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 09:44:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38474)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eIFDc-0008N6-Pr; Fri, 24 Nov 2017 09:44:40 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A55B119D00F;
	Fri, 24 Nov 2017 14:44:39 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E350F600C8;
	Fri, 24 Nov 2017 14:44:34 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1511533107-5315-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_K4f=mmuoEbyuFCHP2dor5p2UPyedteELQoxPYFzAcEg@mail.gmail.com>
	<dd80f8f3-26da-5893-fa4b-cfa31790394d@redhat.com>
	<CAFEAcA8mqRsOYPVOu=tPqDuXyHauKpoF3AQ-bQgiqv5514o+Xw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <15186366-0220-96ae-91ff-c10515fbe778@redhat.com>
Date: Fri, 24 Nov 2017 15:44:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8mqRsOYPVOu=tPqDuXyHauKpoF3AQ-bQgiqv5514o+Xw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 24 Nov 2017 14:44:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 0/4] ITS Reset
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
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FfX0uDskPHkP

Hi Peter,
On 24/11/17 15:35, Peter Maydell wrote:
> On 24 November 2017 at 14:32, Auger Eric <eric.auger@redhat.com> wrote:
>> On 24/11/17 15:20, Peter Maydell wrote:
>>> Thanks. My remaining question is: how important it is to
>>> put some of this into 2.11? We're getting quite close to
>>> the release now so I'm getting gradually more reluctant
>>> to put in changes.
>>
>> I fully understand.
>>
>> Anyway clean and comprehensive reset modality would require v4.15 + full
>> QEMU series (otherwise you get the scary error message even if full
>> reset can be achieved by individual register writes).
>>
>> This means the migration of guests while they are booting will not be
>> functional in 2.11. However it should not abort QEMU as it did before,
>> with a kernel >= v4.14.
> 
> ...so overall, what is your recommendation for what we should
> or should not put into 2.11 ?
I would queue the whole series for 2.12 or whatever.

Thanks

Eric
> 
> thanks
> -- PMM
> 
