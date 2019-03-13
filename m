Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1165981wrs;
        Tue, 12 Mar 2019 20:09:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXJ6eZMQUWfRT+RCUkQr6mnAclxO2DQxjFGwnwevCfv1WOFOPeGljsvd4sL2LVpYCesgIV
X-Received: by 2002:a25:c45:: with SMTP id 66mr33422577ybm.30.1552446558733;
        Tue, 12 Mar 2019 20:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552446558; cv=none;
        d=google.com; s=arc-20160816;
        b=lIUo+xymP8a2pj7se4cXUSRtce0k9EIJVN91ksYZLSDLXUQVbGzfICmggc8Yx6NrqX
         N2V45OyLlNbXxrwYttXHK7WRxjmd2JPZpdQ40FQTrY7Lb2m4vwxNb/pJEsALwkSjQHsx
         S174wQAtDHGIY5X1qila4ZXehGBiZv/xAlW4gwdcmHa1ALYdYvdnhM9tbrSBzKpWj/oz
         FhHD9WOTV1HBNLrQvH3Jtg7CLO6xr5wz6HYr5MZQmv4/vHyyYQNWjf2OQQqwjElLe+5z
         35ZTXfJ3k0PAGRgsy+Np98l4ouclJybwpj29ZA0vNYnbOWrleigpBiz/UUK2i0YgtPnt
         8k9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=mdlpgMJfCS9qMAVW0NHNkAcbyUdAstRqkrlCO06dctA=;
        b=wnzTpO1oktw3cAVJmGkdTKwxsE1nPclMHl3vAZebvEtEr8wmjgM4dCbZX1r//AS2+1
         XDTOXMMG/zi6jlxcJnm+1l1HRWGyJmMrRcpbcYv340+1J+kqChVnPngkDVJ1w3cDbKbP
         U5vYngZ9nsNtMuC0lMgJMdOo3A1e2wZDHtaJ1HoYRUmDR8aD6Uepb23BUP6+wo0mTxYR
         vXX1E8zqT2NJtaJ4gtN2DY7aCnsUwpmhYesShYpa2msLfy/IlPnmy1lEweND7Aobgps/
         An4sJwsAUR/Tkk1/MMDEVNaOsrCfY9KnKcDAwyYzsMSQGe32ufaW9Bv+pD4Ken1iN1/O
         N+WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si6399266ybb.249.2019.03.12.20.09.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 20:09:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:37211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3uGc-0003ut-3L
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 23:09:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h3u4t-00025x-8p
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 22:57:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h3tsB-00081v-Ge
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 22:44:04 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:36132 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1h3tsB-0007yl-10; Tue, 12 Mar 2019 22:44:03 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id DC369E042A0040C8637D;
	Wed, 13 Mar 2019 10:43:59 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.408.0; Wed, 13 Mar 2019
	10:43:57 +0800
To: Richard Henderson <richard.henderson@linaro.org>,
	<peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <1552386624-10484-1-git-send-email-gengdongjiu@huawei.com>
	<6c900280-54fd-9e91-8cf3-240de0e4eb0f@linaro.org>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <7463daeb-1b4d-fca7-adb2-4713eac488b8@huawei.com>
Date: Wed, 13 Mar 2019 10:43:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <6c900280-54fd-9e91-8cf3-240de0e4eb0f@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V2] target/arm: change arch
 timer registers access permission
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
X-TUID: VHdJjLM/REkM


On 2019/3/12 23:02, Richard Henderson wrote:
>> [INFO ]@(dump_registers:68): X6=0000000000000020 X7=000000000c00b030
>> ---
>>  target/arm/helper.c | 30 +++++++++++++++---------------
>>  1 file changed, 15 insertions(+), 15 deletions(-)
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

  Thanks for this "Reviewed-by"

> 

