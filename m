Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1247213wme;
        Tue, 22 May 2018 02:14:06 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrR5WoVFKP5A3/xXhJsdow8bQfIcAusppNqTC+pqpZhHBuaSMtGSD1vW6LplT8YpgUkjHxf
X-Received: by 2002:ac8:334c:: with SMTP id u12-v6mr21730963qta.127.1526980446679;
        Tue, 22 May 2018 02:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526980446; cv=none;
        d=google.com; s=arc-20160816;
        b=Q+TSYnPYuW1gRi/B8b9y21AvSEEod8fZ/8uKJ1SJ6Kj3bkumT9yzGk4TN57+Zhyo2k
         bKQJSLpdMfR0pAwPgL4/FpRvj8CKCKGETgHYvDwmt41ULovE6X5akbyFPEGkm8WPucyo
         2S49eW5awXpmf0TeX7T8aYSYBjQZv42fJ26JH3ZyceHDSaHwUixLLgnIK9sADaf9vA+U
         O9/9OZ0bkuY2rwL7gTBALCVnXF+ASS7SkIfsrwy4GajemRGRpgTR7EVwizyw3/aKnUR9
         vR+RrHUS3z13OY+vkf+T+FJvJyEmn4f9/epZaa2ejfyQu+xyArT2yg6zpgB2iV0PrMYY
         aY0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=RclRs90U2y/6OefBXKyIFQi7x++MVqV/naARx9iLe1Y=;
        b=hMS28khq8rTcKYsTVYjrqLNwaKpDe5dXnQVUULdEjJRV3MS7X+ciPN2Tp8BVbQbdfR
         AelFidQckYL7UQVS6tPhcSqVjG8H1i8/Zwi8UDGTYeXifBF1pO2IoV1HNsZlG0M5GcUi
         kbPDUcuFRxFIw1r7Q8e5ku5AV0w35aDoe5jSPQ0zmOe9zG+nWy9BT0t9afN74LvNj5M2
         HELFunRQMeJT0oW4A8fR62Bwtp2M504q5pv50yw0jJJsdSsN6q+AoIYFRoZidaVL2XlF
         7qcDUVw2BduJOg9qxJ+SumvAJGpiNNMJ4N06b1mc0GrxYJiy/6st9E0TMqqRaXk+1RD3
         EVbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YEWndVfA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z17-v6si978431qtz.71.2018.05.22.02.14.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 May 2018 02:14:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YEWndVfA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fL3Ms-00061S-7r
	for alex.bennee@linaro.org; Tue, 22 May 2018 05:14:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fL3Mi-00060P-BE
	for qemu-arm@nongnu.org; Tue, 22 May 2018 05:13:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fL3Md-00041b-Og
	for qemu-arm@nongnu.org; Tue, 22 May 2018 05:13:56 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:45505)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fL3Md-00041J-Jg
	for qemu-arm@nongnu.org; Tue, 22 May 2018 05:13:51 -0400
Received: by mail-oi0-x241.google.com with SMTP id b130-v6so15541163oif.12
	for <qemu-arm@nongnu.org>; Tue, 22 May 2018 02:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RclRs90U2y/6OefBXKyIFQi7x++MVqV/naARx9iLe1Y=;
	b=YEWndVfAI86WnRf4Ec2eaSiYYtqKHc/f1jlIBW3+sj6q2dV/s723Gi+kRSbdaIXZmA
	iIRJpkIS8sbGxgXGtZNqRN/5CWi/9U8N9YvfdIpUQ6SauxpldhBHcDDwow5IYidZcpj9
	b0+GsAl/u1KjT6kdzhex71MublqNrO+lbTxRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RclRs90U2y/6OefBXKyIFQi7x++MVqV/naARx9iLe1Y=;
	b=kRRjGoH2Zn092vKhFRKQ2wthGT+VjTJqRPCzVBf3zAsYVY1/tXE6NSj4kGA5sbGp2k
	H81L/A2ylW3af2oIU8HXQ4FYvd2S1vovPLcoTgh6RZC5uLMFlD5Gm9zClHaRpCpe5Ql+
	UkbjvV3uCeLrvRMaCR4RNF0ZADiDFHYoTORmhXXAF/gFc0VPJnagd7ODS9e1Nt+3tOXs
	KNxyuRoQStvqBv2/UclD9i8M0/UX2G7Hocxj2R/gVCQA13qbKrnoQfmgnL6yE2yaCrcS
	P3inTujflp3+F/DeVLtXGjUKlbwuy6n1TyrSuQD2AM4XSjx29uVlD0PqSNrDzqIeYCc/
	GjNw==
X-Gm-Message-State: ALKqPwc4f3/Z1TwkHzZq7VK8DLFuiHbzdjQj1LNwIegXyGl3SqoEFOBQ
	N5D4ddzwFadL1idJYQw9CAYkeMb1hoeSlRZ4CXtB7g==
X-Received: by 2002:aca:d447:: with SMTP id
	l68-v6mr14104102oig.102.1526980430732; 
	Tue, 22 May 2018 02:13:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 02:13:30
	-0700 (PDT)
In-Reply-To: <5AC97568.2040502@huawei.com>
References: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
	<1521530809-11780-3-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA96qV_f7i_36Yzb-QV7W9SRHKfJpg=rvv3tia2X-Xi7QQ@mail.gmail.com>
	<5AB0F254.3050503@huawei.com>
	<CAFEAcA-Ct3qa0OFZ4U+9RH68SQJgmkxJKKS5e+if_MuL2pSu3A@mail.gmail.com>
	<5AB21130.2020309@huawei.com>
	<CAFEAcA8yr+KJFwBSksMP-VjNbsSd190VCzB4wGwOCoaX2ScDiA@mail.gmail.com>
	<CAFEAcA_r=S=YWAuZue1zZnFdtFYK2wU7NnaCcGThZU_u33qD4g@mail.gmail.com>
	<CAFEAcA_JYyHj6NGJahGPQ9p9XQz6rkmhWMfheW96DzkciModDA@mail.gmail.com>
	<CAFEAcA_GwG-80oNHHb1wcJxkzS5YcbH335JHBo48_ksFmgRB7A@mail.gmail.com>
	<5AC97568.2040502@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 10:13:30 +0100
Message-ID: <CAFEAcA8M4-2sAr84kA-1m-0ydw_Xy27A6qK4BEwEzRTdCNahgg@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
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
X-TUID: izwXoJC8zN1k

On 8 April 2018 at 02:50, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> On 2018/4/6 17:36, Peter Maydell wrote:
>> On reflection, I think I'd aim for 2.13 for this, since:
>>  * it's not a regression
>>  * it doesn't actually affect any of our boards, because
>>    none of them define enough interrupt lines that they
>>    would actually be using the top 32 that we fail to migrate
>>  * getting the migration compat right is a bit tricky and
>>    will benefit from having the time for careful review and testing
>>
>> Let me know if I'm wrong with any of those assumptions.
>
> Yes, it's no need to merge this for 2.12. I'll respin this patch later.

Looking at another GIC related patch this morning reminded me
about this one. Shannon, are you planning to respin this now we've
reopened for 2.13 development?

thanks
-- PMM
