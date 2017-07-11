Received: by 10.25.44.15 with SMTP id s15csp4167216lfs;
        Mon, 10 Jul 2017 18:55:27 -0700 (PDT)
X-Received: by 10.237.38.195 with SMTP id q61mr8494646qtd.245.1499738127169;
        Mon, 10 Jul 2017 18:55:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499738127; cv=none;
        d=google.com; s=arc-20160816;
        b=v2VXmB8Jn/cPrv3eCZg8dd2ICw7TzwmcV7rrKSaSFXTrC1kGjtP8lXWrGprldnnobX
         k7zLyFn4wfdixBBpu7DWYV9F5egF/Frn6AXYBchsM59gHbn1cqyNBjwxMidrDxMsHXIk
         T6/1eqO9DkjOnz3vCUnJ7jt4W4+gIUqh7TdeB9vkC8p1sKC6hjg5X7Q9lkSqR35Owch8
         mbPrwJ76C8uQ4xDHOkzrO2DI7MBnPUAAENPDSVuFbTdRKS2jGdHVkzfClD6N8APdyQAa
         CKry3W5cDT/0g1qZ9CUpastby49DSPw+gZ/Ht5fsKjaG5M8CrIbFSIwJNqnnv8Vse7uG
         T3NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=ygYL4CEsnxbaJz8v9JeHRjgwcY31gr2xbgqGLxy5IsQ=;
        b=niqtE1Nv7td/+96yN8ApfXX5w6pl3H/sMQ0tdODrUDre5pBKjSC4gbEaXQOeSDwtv3
         dGGaJm9GjT+5rZC6Rii0ygJsfSrEe1Fd2HRB+oD9NdFn5a4+UVk2fWtG7E6gcD9sipda
         cHPdptchdVIFTVlTtsEzgOz4Kfts7O/z3qzYzIfRRXXTFK6IYDAKBDbsgrfeWGzyYkak
         aetzqFZXLYGQ1F1kv6WmqhAdehsNzsm3Kl8r5OXnqWXsmYFR9DtwxCoYY06dejwMvhux
         UsWpxceylU8Gd2dL+RHa7rkpQzwlXQiqFR4J67+6MHkIkj3oIyRXUfGVyyuUOacYH3NX
         PboQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id q36si12547534qte.136.2017.07.10.18.55.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Jul 2017 18:55:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUkOa-0002Ac-Hj
	for alex.bennee@linaro.org; Mon, 10 Jul 2017 21:55:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dUkOW-0002AR-On
	for qemu-arm@nongnu.org; Mon, 10 Jul 2017 21:55:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dUkOT-0000dN-PF
	for qemu-arm@nongnu.org; Mon, 10 Jul 2017 21:55:20 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3961)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1dUkOT-0000cO-EL; Mon, 10 Jul 2017 21:55:17 -0400
Received: from 172.30.72.54 (EHLO DGGEML402-HUB.china.huawei.com)
	([172.30.72.54])
	by dggrg02-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id AQV51544; Tue, 11 Jul 2017 09:55:03 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEML402-HUB.china.huawei.com
	(10.3.17.38) with Microsoft SMTP Server id 14.3.301.0; Tue, 11 Jul 2017
	09:54:23 +0800
To: Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
	<mst@redhat.com>, <imammedo@redhat.com>, <famz@redhat.com>,
	<qemu-devel@nongnu.org>, <zhaoshenglong@huawei.com>,
	<peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<zhengqiang10@huawei.com>, <huangshaoyu@huawei.com>,
	<wuquanming@huawei.com>, <zhihui.gao@huawei.com>
References: <1499678755-5633-1-git-send-email-gengdongjiu@huawei.com>
	<df74267a-3f6f-b6f5-432f-40f8c04ab1f1@redhat.com>
	<d48ec6cf-03b6-bf2b-1bed-1e2c34aaf5f0@redhat.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <f37c8504-905b-5971-a487-e30870b19227@huawei.com>
Date: Tue, 11 Jul 2017 09:54:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <d48ec6cf-03b6-bf2b-1bed-1e2c34aaf5f0@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.59642FF7.0190, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 4063c23db1b65703667f0df4e455952f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.188
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
X-TUID: gqf3U1+Jz44U

Dear,Laszlo

On 2017/7/10 22:04, Laszlo Ersek wrote:
> Yes, the git-send-email options to use are:
> 
>   --thread --no-chain-reply-to
> 
> Best to set them permanently in one's qemu clone,
> 
> $ git config --bool sendemail.thread       true
> $ git config --bool sendemail.chainreplyto false
> 
> This is called "shallow threading" (see git-send-email(1)).

great, thanks for your suggestion.

