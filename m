Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5386346wre;
        Wed, 30 May 2018 18:43:08 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL5kbW6lA2qtm+bQqT2OLEWer2CwlgT4ejGX10tQUl1hRBcsX8wk5be+aqs4kCzFJDE1Uz6
X-Received: by 2002:ac8:424f:: with SMTP id r15-v6mr4655968qtm.395.1527730988706;
        Wed, 30 May 2018 18:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527730988; cv=none;
        d=google.com; s=arc-20160816;
        b=otDSdxMt1TJIMEwFLaXXkh6kMql50xRn7ErfUjeDeT4slSn/l7M8GJSTCet8g1SH84
         2RctTROgdNDa9rTKmrjCH2DZPKIkjEHE3eB6FDQFe9t6gduqemV1pjnF0U1XiqcyxqGU
         1b3g16ShfMt35Tv+1b6AW4B37WM8q/NZwxTlONEASbLLE1RDTzmoJkyKMBTASLEVgtwj
         KGzExAludta+A5mma5gRsx7LOUwNpHvhCIksKyDlSOWsaQ1iRIwumQAb36udQQOy8Os+
         qp4JLoeaCFdCefZAgtlI2vQNOO153H+/IbAqhGjKAoPV5hIiHduw3DCvQk34EnAzHTK2
         /h+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=6MkuD4zc0rs5Mjxv+g2LZcTfIZhNbCWqol84z8aX0mM=;
        b=nncZC0wZ9axipopYdHZHqPhnTJwcjrUKSOtoImoWbBMZ5J5z9vOqM3T49FgH84z4I7
         5fCUMWK0TtOa24uqMUxvkdcOlGK8wrx4CrqhD7BimeNyoz7PLq3IkzqSqgHsU7nkZ5TV
         Od5wn8gE5y1ZFuX9GWtKLFuOWGIzbzvA6XJc5t+/88nDGBOkD0PHOTULDjj7Dn+iHPQN
         V5cwmP/WZ+vgd17Nza57ETICTRE5HgRMVysKaHm0JdC3eQzApcX7gaMlQc1GmKZZ7O5C
         H/7jzmLnHbWInAa2rz/101dwQ0yOS2cwS1hWnLoZ/187jsRPFMsTZt4JM6CscTLxFwCc
         K9mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j23-v6si9503709qtl.150.2018.05.30.18.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 18:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOCcO-0001Uq-8D
	for alex.bennee@linaro.org; Wed, 30 May 2018 21:43:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fOCcG-0001Uj-74
	for qemu-arm@nongnu.org; Wed, 30 May 2018 21:43:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fOCcB-0006nb-Cd
	for qemu-arm@nongnu.org; Wed, 30 May 2018 21:43:00 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2104 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fOCcB-0006ms-0z; Wed, 30 May 2018 21:42:55 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id BFC21958631E6;
	Thu, 31 May 2018 09:42:35 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS406-HUB.china.huawei.com
	(10.3.19.206) with Microsoft SMTP Server id 14.3.382.0; Thu, 31 May 2018
	09:42:29 +0800
Message-ID: <5B0F52F6.8060006@huawei.com>
Date: Thu, 31 May 2018 09:42:14 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Laszlo Ersek <lersek@redhat.com>, Eric Auger <eric.auger@redhat.com>,
	<eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
References: <1527690380-9782-1-git-send-email-eric.auger@redhat.com>
	<1527690380-9782-3-git-send-email-eric.auger@redhat.com>
	<273bb69a-a463-7fbe-edb0-a87622556afb@redhat.com>
In-Reply-To: <273bb69a-a463-7fbe-edb0-a87622556afb@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/virt: Add virt-3.0 machine type
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
Cc: liujinsong <liu.jinsong@huawei.com>, drjones@redhat.com,
	ard.biesheuvel@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jbo2791hk2B5



On 2018/5/31 0:18, Laszlo Ersek wrote:
> +    vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
>> +
Does it need a info log here to tell user that even though you enable
the highmem_ecam but due to some other reasons it's disabled.

Also, if user enables highmem_ecam but finally it can't enable, does it
need to error out?

Thanks,
-- 
Shannon

