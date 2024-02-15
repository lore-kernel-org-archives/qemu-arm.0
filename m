Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp635255ejb;
        Thu, 15 Feb 2024 07:18:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCURQJteIMUmcU/BGT8O4lnw6nSFp67JO/8QQqF6cPloSg4MA/uG4Wjspnb76S3byU3Nq7ZtOapCUUFElZYcTgWPtpl37xq1
X-Google-Smtp-Source: AGHT+IGW76xYRd/huQYQwt6FFE/Rr8E96TtH9pJz3hC/56lZk2TvsBujp6euw4ipEqy8iLqD5p2z
X-Received: by 2002:a5d:6984:0:b0:33a:ead3:6438 with SMTP id g4-20020a5d6984000000b0033aead36438mr4745052wru.33.1708010286393;
        Thu, 15 Feb 2024 07:18:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708010286; cv=none;
        d=google.com; s=arc-20160816;
        b=k2LrxsSL9949j8NBfuyKbrQ621s3Cqr6joC8t1+Yh+vbCr6mZd1EOtVV1W782o/RPC
         aRIAnT+lRbcET7LqFo+rG3Zsbf0z2pvRP4jQMPdl4G9hdtlyiJfxZREjWIFDzMnBE/1X
         RZ/FE9AFtVAUnl8MubRFyIebLftwQRNgJmHn4uAudiRekia36Nx5u7UyjHLfEUpHTcie
         YPyK9s5aBA2oGkw2IMFOuPJNdD+olzwhuMHuzf6D8l3mPB/eEWlzPymcmtvfDz/tqIs4
         tHDq6sGQGIb6GjmqhqsATxM7+arjRBu+anCqt9QLvakm1Lja3eyC8Reig1U0qD/nmggy
         W+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=hkEty1XAftLMcC9iCJYMOfZCq+33Pu1LuDhVsZTQqXY=;
        fh=Vg2yBWlikDPSwYiCI/Uk6oY6b+moM58ISSo3pIJ9eYM=;
        b=mSlhsa2jt/9k9yfuTyAu4LgKtVTyufXjpnRVANyU3LwYAstywi63L5EJUIyjubDKkL
         PcnvI70Tz9hgg1YwUQLtO1cZL5PhKBJens7WhoVQVGprilXMS2/ocXO7Iml9lOrjzN3k
         yIT6JAFNBqHZb6gbDHOhLCIum2MJ9MQ/iFbI28USt/DRS9kcO/tOkGoyo6M9/z4InqhE
         wOm1vS6EJdVGgBiCI/vc8sH6LWX2+9DAptVCXYM6MMjMvs82wk/n3IU9cjqv7DnKYD0d
         VQEUD0covpxheKagN5uVvAo8t4zYkB4D1jPSw7JCYPrydcJoZCIAegYfjAcvUpsa9dys
         hhmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id o1-20020a5d62c1000000b0033cf254873fsi840033wrv.678.2024.02.15.07.18.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Feb 2024 07:18:06 -0800 (PST)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TbJWd0DZXz6K8xR;
	Thu, 15 Feb 2024 23:14:37 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id D0D2F140DAF;
	Thu, 15 Feb 2024 23:18:04 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 15:18:04 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Gregory
 Price <gregory.price@memverge.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <richard.henderson@linaro.org>
CC: <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
Subject: [RFC PATCH 0/1] target/arm: Fix FEAT_HADFS when page tables are in MMIO (cxl)
Date: Thu, 15 Feb 2024 15:18:03 +0000
Message-ID: <20240215151804.2426-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: MOHqDhaJWDV0

https://lore.kernel.org/qemu-devel/20240215150133.2088-1-Jonathan.Cameron@huawei.com/
gives more details of the reason the CXL emulation uses MMIO space
(short answer is it has very fine grained address routing).

Obviously this one is lower priority for me to upstream as the ARM support in
general is only in my CXL staging tree (I'll get back to that soonish).

The equivalent tests with CXL memory and forcing applications to run from it
on ARM64 TCG ran into an additional issue.  We need to be able to do
atomic compare and swap to update the access and dirty flags as part of
a page walk if we have the ARM 8.1 FEAT_HADFS (note you can disable this in
the kernel then this problem isn't hit but that's not a viable long term
solution though it did help me diagnose the problem)

As the patch says I'm far from confident on this fix. Whilst it 'works'
for little endian at least I'm hoping someone more familiar with the locking
requirements etc can let me know if the BQL is the right option here and
people can give a general opinion on whether such a hack is the right
solution.

Jonathan Cameron (1):
  arm/ptw: Handle atomic updates of page tables entries in MMIO during
    PTW.

 target/arm/ptw.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

-- 
2.39.2
