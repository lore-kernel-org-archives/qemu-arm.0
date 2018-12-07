Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp73593wrt;
        Thu, 6 Dec 2018 18:30:05 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X5dv8dOgZKYJhEODmaK5ald4L2NpfVhobx+hy30sY7ueo+LopNEb/8rBy3GERNP0PwLIDb
X-Received: by 2002:a37:ef07:: with SMTP id j7mr335462qkk.35.1544149805790;
        Thu, 06 Dec 2018 18:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544149805; cv=none;
        d=google.com; s=arc-20160816;
        b=fo69g34WEF508RQU9fnt+yT6MMQNxIjo0Sydm+9pQbWuyI/1IEkSvKsjmTZqc7q7uz
         5LvrhUdc1qgVNQCq3P23otcuCVeLrxt9qI6GIMipYROl9irW5I5bXQoXqxW6KOma/3yt
         hqY6eXVkcXkNSIu+Ks2Ws5Ctvcv3NIgS5/hhGikyX3JXqR5ZoOh9V0OoMJ3+ww5TEzkL
         Olrki++Bfv9y+PUEWLchYM1anLuLCx5VZStWW6/wW7ClSEZZGCF5FyLBRDRQSWUbH9Y8
         UC5DHLzEV4PRvomTBIY2mYDPv4pTtAyh6dUBydhIPo5os9lUq1TYV7AQTrE4dzs//GXx
         hL3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=yU12hub9q8T//P5o5eWEkxKX9beZe6lA34ybyznv80A=;
        b=weBaip3USpP36oSE1yCypjPmak3XPjylKrhLk8r4KB4vXmHdpmv17Ii4GXE02ja0cK
         CbSzvsC2HEzvj5xcw9ytW7JzTdEjziHB0AbLND5+1i1e4m9sfsur5dA8pcwUJE7RAfSf
         CpJNdQZadrHNwn3MeVezoLgL4xbf97hGrJirvS35D22Jx6LYPp6gZgKa55gpQUMivShA
         QXlGMNMncieGR5HOenJW0vGr3CqKKUUDq6ZaVqacYRkU6t25GuKC2QgTqPgSjLKoM9IE
         4KYBBHuJh9U/2AZi3psa/WQOjMw2tHyQQS7HN2vrXYweIpF395Bg/K91oFeIx4eq7Okz
         i31Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r37si1428275qtb.257.2018.12.06.18.30.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Dec 2018 18:30:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43823 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gV5u1-0004oX-Bu
	for alex.bennee@linaro.org; Thu, 06 Dec 2018 21:30:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1gV5th-0004n5-Fj
	for qemu-devel@nongnu.org; Thu, 06 Dec 2018 21:29:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1gV5tg-0006L0-RL
	for qemu-devel@nongnu.org; Thu, 06 Dec 2018 21:29:45 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:40632 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1gV5tb-0006Ea-Ll; Thu, 06 Dec 2018 21:29:39 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id D134331B2BD7E;
	Fri,  7 Dec 2018 10:29:29 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.408.0; Fri, 7 Dec 2018
	10:29:30 +0800
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <20181206151401.13455-1-peter.maydell@linaro.org>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <4c74e17a-840b-e1d9-6dac-71f64a190945@huawei.com>
Date: Fri, 7 Dec 2018 10:29:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20181206151401.13455-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: Re: [Qemu-devel] [RFC] arm: Allow system registers for KVM guests
 to be changed by QEMU code
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, patches@linaro.org
X-Mailman-Copy: yes
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d0jQ9t/sItoz

On 2018/12/6 23:14, Peter Maydell wrote:
> ---
> I think this patch:
>  * should be necessary for the current KVM debug code to be able
>    to actually set the ESR_EL1 for the guest when it wants to
>    deliver a breakpoint exception to it
>  * will also be necessary for Dongjiu's patchset to inject
>    external aborts on memory errors
> 
> I have tagged it "RFC" because I don't have a setup to test
> that; I've just given it a quick smoke test that it runs a
> VM OK. Please test this and check whether it really does
> fix the bugs I think it does :-)

Great! thanks Peter follow up this issue and patch to fix it.
I will test it and give response.

> 
> Opinions welcome on whether the "try the write-and-read-back"
> approach in write_cpustate_to_list() is too hacky and it
> would be better to actually record whether write_list_to_cpustate()
> succeeded for each register. (That would require another array.)

