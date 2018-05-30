Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4403290wre;
        Tue, 29 May 2018 23:46:47 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJBy2FqCLnSOi5zlEC11a+UN4V8n4bvM1he31gO4qIStbmki7n05zJLlm0JMv60uE/N5SYE
X-Received: by 2002:ac8:31b7:: with SMTP id h52-v6mr1359139qte.100.1527662807060;
        Tue, 29 May 2018 23:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527662807; cv=none;
        d=google.com; s=arc-20160816;
        b=ltp5jEQd+qoGIWezx9sBF3OstKjGpPrQ46MupcQSMCWtX2NlN56lgbqM9FCh5Vvq91
         1JkoUzsVev4MSAAgiO08fG0XXaJZl56hE7QZkEGR9PRloWowdoVBa42TkfsI/15Mraws
         3q+HD/w9YAvutWwsAMbiA+6Cfknnczw3sNo7npqMyI+OH2l5Ek5XQDw6wAzowBo80T2k
         6c5uuTcLxLjAmIwt9+cuHNcoXKvPill5hu8Mj+CfiaUXY+BTprpOG/39yqwk4p52LYKV
         lMJAY810ui6S6T2JniRE74ZemaBb3EHxQbaRNNqadx8Pad3TsoPeRjxckdpIHAnyHeKG
         DLYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=mZW7DUSKXmjilSIxX0Ci3k8IQvaKkAuOhzePLZkwwTI=;
        b=OoyAVN+edzxGsyhJSo3Pbm42EYoN28lMG+MLUf6aDzhRwLtU75KRBu6B+5i9mYA0z+
         TEIpI7csHjGIMNyfzH7U0tAlTj5b/Cnnw8dQekNp2FUeoKAF/qlQWQyR4bpRh2IuWIvr
         rQbnn71p43Du0tZszoC3AH0rH2KryfQZGoSThTShdbW9yenyZqjD9UQMP5XNXAi0aN3B
         t56h8iryklmbsuhukAZLzixU4idRHx3XpHSBb92J1CwCinw+npqGcra93WW3+uHMKOJV
         2g880ZF0z3WEYgQ6c+xUUJMLm6vnNV208QcqPc4Y2QjrTOXl9WXHzzP/6tzQNaA1bwms
         9WfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b10-v6si5354638qvj.239.2018.05.29.23.46.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 23:46:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNusg-0006CN-HM
	for alex.bennee@linaro.org; Wed, 30 May 2018 02:46:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fNuq8-0004Nn-7A
	for qemu-devel@nongnu.org; Wed, 30 May 2018 02:44:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fNuq7-0002a5-JP
	for qemu-devel@nongnu.org; Wed, 30 May 2018 02:44:08 -0400
Received: from [45.249.212.35] (port=38744 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fNuq2-0002Vy-Cf; Wed, 30 May 2018 02:44:02 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id A8E618ADB6618;
	Wed, 30 May 2018 14:43:57 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.382.0; Wed, 30 May 2018
	14:43:52 +0800
Message-ID: <5B0E4813.7030403@huawei.com>
Date: Wed, 30 May 2018 14:43:31 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Auger Eric <eric.auger@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>
References: <1527563283-13148-1-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA-LoTOnTnSYBpzuyUDFZBsVBaB2qjvzAP_94rou8ob6Tg@mail.gmail.com>
	<65E224A1-C972-4C38-BD6E-41C59191D999@163.com>
	<383b0c0b-4406-869c-5493-df2f48896113@redhat.com>
	<5B0DFB0C.3000002@huawei.com>
	<81226dc7-4b0a-bd1b-6910-0b9a94b0128f@redhat.com>
In-Reply-To: <81226dc7-4b0a-bd1b-6910-0b9a94b0128f@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: Re: [Qemu-devel] [PATCH v2] ARM: ACPI: Fix use-after-free due to
 memory realloc
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UmKME0jmUFWO

Hi Eric,

On 2018/5/30 14:38, Auger Eric wrote:
> I checked against the v1 in my branch thinking you did not change
> anything besides the comment (your log history?).
Sorry about this, I'll add some words in commit message.

Thanks,
-- 
Shannon

