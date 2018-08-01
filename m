Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp574093wru;
        Wed, 1 Aug 2018 03:25:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeYLgFjpxEuAYy5we1iXsn7EcY6o9Zkh3fMZIhIC3sQrBCcUT9nZY6E0QQ3ZVT99c7UV7AC
X-Received: by 2002:a0c:91d0:: with SMTP id r16-v6mr22762027qvr.38.1533119149337;
        Wed, 01 Aug 2018 03:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533119149; cv=none;
        d=google.com; s=arc-20160816;
        b=esASBf1md+XrfQCAIbYs4wXAXjeHg/WqQ3fpxYe1yAnoUSb64VtNwdheNjXoUGQVNP
         TGvpnKgn7h8R3OZteEp5d2etDkvI1vZBPsSMt5czxc+XXHYCSBBI7HLs4MwsKLd2yB8Y
         T53IbMoB8kaBpPVK9JXrSo1m2JT2Ack3pdK/QGabFafW2fjflFALvOtYqypzq03ZQxXu
         cZUPSrn6ERtOru+pvKJienWVHVGMUCXZBwW6uquh1Ik3b71ay3UHfX3PgxOocv9y5HG1
         GVIQ0oe1shCWLDlrNeOsbsLNIJf266PcdARdkOBBWMR6u/BQo1R/tfkqIpxwjawF5kWj
         E4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=BWjKFTEEy5NHtGiQ52FS1KPuq/geSkUpU4MCERwPNyM=;
        b=Pytx0Isz8i/D44SKOY3gjYLLbShnjgRE+2yDuLZA3jAexBxCRSo90rtCmhc/9Qi+KX
         jHuTcnBoEYY7bhwVHUtVjg7jm210cBvjho+C5m+rtxUXlMLDVqbpye+oiziLxEkuykzI
         WgeLLwIjmoQJTxIYVdqBfTo6e7xZzi39U68L/lDKP+fMvqtCCxKGjk57wlzGVGMiXK/U
         zNYUWVREkcE8I01yea0uFN/AHnA79CVAcmu/cVCDqqYxhVJtfDD+h77Gtrzp9xDXEIvE
         h9D3jPlwnyPxg2utb7g2Kcv0H0+GQ3NdCgwB2PfWNbhkoGth8d1dnn5pZh0D02NQeK9s
         VXVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s15-v6si4947189qks.9.2018.08.01.03.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 03:25:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38819 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkoKC-0001rO-St
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 06:25:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fkoK3-0001p0-Em
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 06:25:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fkoJy-0005wg-N9
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 06:25:39 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2561 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fkoJy-0005v6-6z; Wed, 01 Aug 2018 06:25:34 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id A815EE6C8F044;
	Wed,  1 Aug 2018 18:25:27 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.399.0; Wed, 1 Aug 2018
	18:25:21 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <1532196162-29453-1-git-send-email-gengdongjiu@huawei.com>
	<4beb699e-8e9b-0a3e-01a6-891033ebc7a5@huawei.com>
	<CAFEAcA8cQQNXcO3FmqGR=txEFxZe8n4+qhdbVR7rvQkuS1_L4A@mail.gmail.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <3170ccdd-01c2-0b51-a40c-a2d55d119ba3@huawei.com>
Date: Wed, 1 Aug 2018 18:25:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8cQQNXcO3FmqGR=txEFxZe8n4+qhdbVR7rvQkuS1_L4A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
Subject: Re: [Qemu-arm] [PATCH v6 0/3] add support for VCPU event states
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HYwG5oevLF9f



On 2018/8/1 18:14, Peter Maydell wrote:
> On 1 August 2018 at 11:05, gengdongjiu <gengdongjiu@huawei.com> wrote:
>> Hi Peter,
>>    sorry to disturb you, any comments for this series patch? thanks you in advance>
> It is on my to-review list, but I'm afraid I have not yet
> got to it.

  Thanks very much, it is great that it is on your to-review list.

> 
> thanks
> -- PMM
> 
> 

