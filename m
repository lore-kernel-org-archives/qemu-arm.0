Received: by 10.28.71.155 with SMTP id m27csp514633wmi;
        Fri, 6 Apr 2018 02:37:01 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49lGoGecZo74sSDbIzxLRvStONhqOajMSQnoN93bL+ckm4y0k0ZUBLQzX8lYNRHMbRjwm0g
X-Received: by 10.200.115.11 with SMTP id x11mr9592100qto.290.1523007421017;
        Fri, 06 Apr 2018 02:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523007421; cv=none;
        d=google.com; s=arc-20160816;
        b=cUBmzj5oeOXaXgqrC+0G5DDglS2aF/tRKmp6LGzexXE9WHehItD+fXa5Zda1DlpjHH
         ODQ929523kHCICgn9OTJ4iB3X5+3la/9V1lSsBIU9Ogq5aagS2SUngOjHbbgthuZbkPw
         AYRLRqFxrgJamDAai6dKSLbXMtu5XU/PDFVud63gIk9AwcwQ0e32afvkp2DVpbyrn9ow
         6H5EIozTCYEIk2//y8fEGcbXin2GoqgqGbzeQpD6T7nUlNCsOmYLZ0SCMHSwDaphdK6J
         oib6OfJ12KAB4OQwPnCO/SDhvdCNZ4Z458MX9L/EATY9uGBjKjWUHHniWf6+jbb/ZlBh
         vxPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=cdqTN9C2XOBr8gSJCjLHvABVCYWyrs5NYK1htdaPa0g=;
        b=pUXDq3ue1k3drxg5Tp7prUF1wLaXix3qG9s4fSjN86wfsqRH0FWwJ15xZbcpv368lG
         eyHox0PeeL9Us8UBHfkm/gsP6Os3LlpZq7uOW/essd4TtvqVuFScdGQyh+sWx+O53I/d
         qKOx1uXCHEl8qMbK3uJvifcnJZdaRLN9119l/fG6fYHHW47NTbab9dNoBFwyi+xwmoIS
         IOhJWBC8yx/sWtLMz+kgvKimzB7INYPUt6FmWnl5GGmhZyvjVuB6dK7i0W6mTVn2guOp
         Rci2qaqCCwHyY8IBFH8/ukm7EE1CChBakIVhJ+PZIIaCKeUpsnQ0EaEs1JZDvD6Gk0HN
         H7yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iIDisINs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 36si11145401qtr.15.2018.04.06.02.37.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Apr 2018 02:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iIDisINs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f4Nno-0002kr-Fl
	for alex.bennee@linaro.org; Fri, 06 Apr 2018 05:37:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f4Nna-0002gX-OD
	for qemu-arm@nongnu.org; Fri, 06 Apr 2018 05:36:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f4NnZ-000576-OW
	for qemu-arm@nongnu.org; Fri, 06 Apr 2018 05:36:46 -0400
Received: from mail-oi0-x22c.google.com ([2607:f8b0:4003:c06::22c]:34467)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f4NnZ-00056y-JK
	for qemu-arm@nongnu.org; Fri, 06 Apr 2018 05:36:45 -0400
Received: by mail-oi0-x22c.google.com with SMTP id u141-v6so480659oif.1
	for <qemu-arm@nongnu.org>; Fri, 06 Apr 2018 02:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cdqTN9C2XOBr8gSJCjLHvABVCYWyrs5NYK1htdaPa0g=;
	b=iIDisINswSO099VbWwDrDbS5K8v6sd9W2Pce5AQd4ZsBuUPFT6GkUdJ/IBsnORt/aS
	5lOjW55n0CjlTdiVmO+opXHE6bMPO0NxQxGm0/jYCMEquRET5it7Adjp0deyMwJU1gii
	9TBN7YDuE4myc+LNxgN2QDpFdEgnVtx/OMFVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cdqTN9C2XOBr8gSJCjLHvABVCYWyrs5NYK1htdaPa0g=;
	b=Y4l5wa2e4Jivnyd8/2G+B+CYx0vbkr/avfDR8PB6UR2HjyALRTCsF4j8SZd3oCTh1w
	4p46jwRvblxihJN+OHEATbKq3OrgD6j2+O3ISLrzubzdPPSFx20gLkG6BYad1WIYNWwr
	KWbvYHw0S3FnX3ITuLjmEYY4du+r8cX3u5EiJ/LrdON3z8+Af18/Ie/fjphfnrcDBS9O
	stOmgu97QKaoUtlYgfcd0BmjirIBhClvDSFYsxy50nTF1QPmFgP5niJig9f1oLMTIZ4/
	fbQ7VsCxBR9u1eWFXBKWPDBaUTJzpqiKm3/wwlMCQeGr2hIEdePg3QSKt9HMhrKrhIwL
	R/GQ==
X-Gm-Message-State: ALQs6tBLkyetOypYqdfDu5NrdkPzYonhNCSyHic5/O+nZXsFtkzRwiet
	E+DG+Mx66kwaafbXzhMBVjqr0zAuysrdjqnoZFIWcA==
X-Received: by 2002:aca:b3c1:: with SMTP id
	c184-v6mr3649078oif.12.1523007404918; 
	Fri, 06 Apr 2018 02:36:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP;
	Fri, 6 Apr 2018 02:36:24 -0700 (PDT)
In-Reply-To: <CAFEAcA_JYyHj6NGJahGPQ9p9XQz6rkmhWMfheW96DzkciModDA@mail.gmail.com>
References: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
	<1521530809-11780-3-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA96qV_f7i_36Yzb-QV7W9SRHKfJpg=rvv3tia2X-Xi7QQ@mail.gmail.com>
	<5AB0F254.3050503@huawei.com>
	<CAFEAcA-Ct3qa0OFZ4U+9RH68SQJgmkxJKKS5e+if_MuL2pSu3A@mail.gmail.com>
	<5AB21130.2020309@huawei.com>
	<CAFEAcA8yr+KJFwBSksMP-VjNbsSd190VCzB4wGwOCoaX2ScDiA@mail.gmail.com>
	<CAFEAcA_r=S=YWAuZue1zZnFdtFYK2wU7NnaCcGThZU_u33qD4g@mail.gmail.com>
	<CAFEAcA_JYyHj6NGJahGPQ9p9XQz6rkmhWMfheW96DzkciModDA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Apr 2018 10:36:24 +0100
Message-ID: <CAFEAcA_GwG-80oNHHb1wcJxkzS5YcbH335JHBo48_ksFmgRB7A@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22c
Subject: Re: [Qemu-arm] [PATCH v2 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XWyA6tV7geFf

On 5 April 2018 at 15:22, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 29 March 2018 at 11:54, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 23 March 2018 at 12:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 21 March 2018 at 08:00, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>>>> On 2018/3/20 19:54, Peter Maydell wrote:
>>>>> Can you still successfully migrate a VM from a QEMU version
>>>>> without this bugfix to one with the bugfix ?
>>>>>
>>>> I've tested this case. I can migrate a VM between these two versions.
>>>
>>> Hmm. Looking at the code I can't see how that would work,
>>> except by accident. Let me see if I understand what's happening
>>> here:
>
>> I was thinking a bit more about how to handle this, and
>> my best idea was:
>>
>> (1) send something in the migration stream that says
>> "I don't have this bug" (version number change?
>> vmstate field that's just a "no bug" flag? subsection
>> with no contents?)
>>
>> (2) on the destination, if the source doesn't tell us
>> it doesn't have this bug, and we are running KVM, then
>> shift all the data in the arrays down to fix it up
>> [Strictly what we want to know is if the source is
>> running KVM, not if the destination is, but I don't
>> know of a way to find that out, and in practice TCG->KVM
>> migrations don't work anyway, so it's not a big deal.]
>
> Shannon, are you planning to look at this for 2.12, or should
> we postpone it to 2.13? (It's not a regression, right? So
> we don't necessarily have to urgently fix it for 2.12.)

On reflection, I think I'd aim for 2.13 for this, since:
 * it's not a regression
 * it doesn't actually affect any of our boards, because
   none of them define enough interrupt lines that they
   would actually be using the top 32 that we fail to migrate
 * getting the migration compat right is a bit tricky and
   will benefit from having the time for careful review and testing

Let me know if I'm wrong with any of those assumptions.

thanks
-- PMM
