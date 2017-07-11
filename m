Received: by 10.25.44.15 with SMTP id s15csp4175924lfs;
        Mon, 10 Jul 2017 19:05:17 -0700 (PDT)
X-Received: by 10.237.37.193 with SMTP id y1mr8103461qtc.140.1499738717482;
        Mon, 10 Jul 2017 19:05:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499738717; cv=none;
        d=google.com; s=arc-20160816;
        b=dAQoIJVrwgg5vr7rZhn5HvxgiLu+6zonGHDZiqLqlFX7BAsjNokAUsyUmqKYNl1ugn
         6S6+NIP43DBbXEv/0Fh4drP42+Q1Ry9mgc5yi7x3NUBSyVWFYzL8GnflFGgK22pOdimj
         7dloZkI2McdNAi25sbXiCA3x9RnfYmSEu12fI270yHqWKBAXsFA9p9vYsa3XgYEbzWU8
         tNrdCziIK2bce/c34k2YIqwBi5n56Rpl/8Z4DCq1XHjC7q+apMP3jU9QcGm1RYkFRwSP
         sD9KT3yh6mF0AQ9KZl7gGmEueeGGwwwNZ3kipGUokCT4xPwRNDe4UO960+CFST85L2kA
         xNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=r0yCtZO3UyclQ9i+dEO/2PHTy4CZSObbqZqJNezpH0A=;
        b=0vNn4+9J1oEocT5wEB7pLLpNmOmh8OdPtpGH/pMnkvvTmlHKW9H6RY0PwW5YnKMEjX
         Lw2tv4X9kejhnKQB6OJtVKdCpALZK6uzkeZsocNWXEhFCl6LX4t6iEifKD7NRam9ZNgC
         8JiYJznQGDnNx5hgXDCl4G2fMSIBDw9Y3pN+l58pXMfMFAPVM/f81bmoeMbstTBoN94+
         xosobK0PFNzYruAe3SI6307KPb/cBJ0unRIgi/tZ9cup97HVxDULlorOs8IgVH7+UqhT
         x8zJ7Qk4ErpAQ1vf7kUlS8XaFe2iE1s2Wc7A2OriuqRrrnw1cgvKu5lLOFSrjza0q/W3
         J0tw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id g38si12245236qta.349.2017.07.10.19.05.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Jul 2017 19:05:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUkY6-00063w-UL
	for alex.bennee@linaro.org; Mon, 10 Jul 2017 22:05:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dUkY3-00063K-N8
	for qemu-arm@nongnu.org; Mon, 10 Jul 2017 22:05:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dUkXz-00045Q-1T
	for qemu-arm@nongnu.org; Mon, 10 Jul 2017 22:05:11 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4025)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1dUkXy-00044W-MW; Mon, 10 Jul 2017 22:05:06 -0400
Received: from 172.30.72.54 (EHLO DGGEML402-HUB.china.huawei.com)
	([172.30.72.54])
	by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ARV52929; Tue, 11 Jul 2017 10:04:55 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEML402-HUB.china.huawei.com
	(10.3.17.38) with Microsoft SMTP Server id 14.3.301.0; Tue, 11 Jul 2017
	10:01:29 +0800
To: Eric Blake <eblake@redhat.com>, <lersek@redhat.com>, <mst@redhat.com>,
	<imammedo@redhat.com>, <famz@redhat.com>, <qemu-devel@nongnu.org>,
	<zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
	<qemu-arm@nongnu.org>, <zhengqiang10@huawei.com>,
	<huangshaoyu@huawei.com>, <wuquanming@huawei.com>, <zhihui.gao@huawei.com>
References: <1499678755-5633-1-git-send-email-gengdongjiu@huawei.com>
	<df74267a-3f6f-b6f5-432f-40f8c04ab1f1@redhat.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <56f91e49-da0f-1093-1dd5-bc157d85605b@huawei.com>
Date: Tue, 11 Jul 2017 10:01:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <df74267a-3f6f-b6f5-432f-40f8c04ab1f1@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.59643247.00CA, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 0146b00b530a74784d04a98287ce4919
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.187
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 1/3] ACPI: Add new ACPI
 structures and macros
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rYAnDVRFmNXr

Hi Eric,

On 2017/7/10 21:54, Eric Blake wrote:
> On 07/10/2017 04:25 AM, Dongjiu Geng wrote:
>> (1) Add related APEI/HEST table structures and  macros, these
>>     definition refer to ACPI 6.1 and UEFI 2.6 spec.
> 
> Your mail is missing In-Reply-To: and References: headers, which makes
> it appear as a new top-level thread for each patch.  You'll want to
> figure out why you didn't properly link back to your 0/3 cover letter
> with Message-ID: <1499678736-5244-1-git-send-email-gengdongjiu@huawei.com>

sorry for that and thanks for the pointing out. I will use Laszlo's suggested method
to change it. and resend the patchset.

$ git config --bool sendemail.thread       true
$ git config --bool sendemail.chainreplyto false


