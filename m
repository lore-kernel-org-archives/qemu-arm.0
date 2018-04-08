Received: by 10.28.71.155 with SMTP id m27csp1147080wmi;
        Sat, 7 Apr 2018 18:51:11 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/xFholjdoHh/1luom6CP9ge0sfC2d/S+DJBv757vjEq3mVaKKfSsMs1ZOSCHr2FQIJ1AMo
X-Received: by 10.200.8.130 with SMTP id v2mr4251196qth.292.1523152271694;
        Sat, 07 Apr 2018 18:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523152271; cv=none;
        d=google.com; s=arc-20160816;
        b=cdXOq5tI7igT7rfnubffhzs+A9eNlNTfICQausFsWpi6seWaKcpYEdpDcprplIx3Zx
         yTH9txjUBCR7JRPA5HotBhjYTqQEw9ZOnvnT57wJ4XnczZDEn+86k0+npQArUXAPXSdT
         3o9gSHA6z37RKks9Cb9oevDr0TfNQR3V3D3Rr2NnNqBJy/2bdVNlLqLsAnFJ+4chjYEt
         eibz2BARoFR/HwVCgEYkxh8I7HBb0pgPr8sK/3rMRBi4RtGpiKtuDbb/fdvYOdnHzCxW
         jFaezehGM2/mtVLfJJk7WJbmrbz6BGvtBFP/2RAS0rRy8t0NHb7CyL5oTMOE2FVO45kv
         d7Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=iaECtApj/Fi+nHPURoykAtXTapIYtCUKg9EDbmElVA4=;
        b=b8uYfDJLrHuRe/8Q3l++HLh+PM+ko1JX+bnn0eOoke5HjW3GtBAhRM2+8UjijA14Zp
         R+fGjyF7wenTrluoFc/vGwfTl2liWCzCbmLif4q9W/aC3I2zwvfy4XjHbH0S7hGYvfUK
         rwQQ2hjwFzN8gaL7jbzZL+5o31dutFFAP1jAiIwoLQSCLuj8RCITY8927OlPl43CCrRF
         /xfq5FJtD6OluLwZK6/d5NV/gC/1JwKGefvPxqHnUh+Vq2tKnvoi5y4fcMPuZAzMmf8V
         9stnmmZh1uKAPXliPdDFjPQMtBvqAUjzSX1A8y5dlyLnPqAXoKL+oraTcLVWksXhqO5v
         SvnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 12si6965547qtc.32.2018.04.07.18.51.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 07 Apr 2018 18:51:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f4zU7-0001a3-6N
	for alex.bennee@linaro.org; Sat, 07 Apr 2018 21:51:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1f4zTy-0001ZK-8n
	for qemu-arm@nongnu.org; Sat, 07 Apr 2018 21:51:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1f4zTv-0003VD-6c
	for qemu-arm@nongnu.org; Sat, 07 Apr 2018 21:51:02 -0400
Received: from [45.249.212.35] (port=46401 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1f4zTu-0003T4-RM; Sat, 07 Apr 2018 21:50:59 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 8D0E5B1D8FFF4;
	Sun,  8 Apr 2018 09:50:50 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS406-HUB.china.huawei.com
	(10.3.19.206) with Microsoft SMTP Server id 14.3.361.1; Sun, 8 Apr 2018
	09:50:44 +0800
Message-ID: <5AC97568.2040502@huawei.com>
Date: Sun, 8 Apr 2018 09:50:32 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
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
In-Reply-To: <CAFEAcA_GwG-80oNHHb1wcJxkzS5YcbH335JHBo48_ksFmgRB7A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
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
X-TUID: 13GVQS0HgpMz



On 2018/4/6 17:36, Peter Maydell wrote:
> On 5 April 2018 at 15:22, Peter Maydell <peter.maydell@linaro.org> wrote:
>> > On 29 March 2018 at 11:54, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> >> On 23 March 2018 at 12:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> >>> On 21 March 2018 at 08:00, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>>>>> >>>> On 2018/3/20 19:54, Peter Maydell wrote:
>>>>>> >>>>> Can you still successfully migrate a VM from a QEMU version
>>>>>> >>>>> without this bugfix to one with the bugfix ?
>>>>>> >>>>>
>>>>> >>>> I've tested this case. I can migrate a VM between these two versions.
>>>> >>>
>>>> >>> Hmm. Looking at the code I can't see how that would work,
>>>> >>> except by accident. Let me see if I understand what's happening
>>>> >>> here:
>> >
>>> >> I was thinking a bit more about how to handle this, and
>>> >> my best idea was:
>>> >>
>>> >> (1) send something in the migration stream that says
>>> >> "I don't have this bug" (version number change?
>>> >> vmstate field that's just a "no bug" flag? subsection
>>> >> with no contents?)
>>> >>
>>> >> (2) on the destination, if the source doesn't tell us
>>> >> it doesn't have this bug, and we are running KVM, then
>>> >> shift all the data in the arrays down to fix it up
>>> >> [Strictly what we want to know is if the source is
>>> >> running KVM, not if the destination is, but I don't
>>> >> know of a way to find that out, and in practice TCG->KVM
>>> >> migrations don't work anyway, so it's not a big deal.]
>> >
>> > Shannon, are you planning to look at this for 2.12, or should
>> > we postpone it to 2.13? (It's not a regression, right? So
>> > we don't necessarily have to urgently fix it for 2.12.)
> On reflection, I think I'd aim for 2.13 for this, since:
>  * it's not a regression
>  * it doesn't actually affect any of our boards, because
>    none of them define enough interrupt lines that they
>    would actually be using the top 32 that we fail to migrate
>  * getting the migration compat right is a bit tricky and
>    will benefit from having the time for careful review and testing
> 
> Let me know if I'm wrong with any of those assumptions.
Yes, it's no need to merge this for 2.12. I'll respin this patch later.

Thanks,
-- 
Shannon

