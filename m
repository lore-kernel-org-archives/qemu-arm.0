Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5479808lfm;
        Wed, 26 May 2021 07:23:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtD1xvWBsmnwg7o+r3Y4PrVwo4Uq88azD58unh3oMyWPZa0NNFDchcImWzoXrsuOR2Phea
X-Received: by 2002:a17:902:7887:b029:ef:9429:e956 with SMTP id q7-20020a1709027887b02900ef9429e956mr35979350pll.78.1622038997880;
        Wed, 26 May 2021 07:23:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622038997; cv=none;
        d=google.com; s=arc-20160816;
        b=nch7NEjHeCBI1YuEngRU8QyBYRJFvGVpGVALiFGbGSwJcvJE5lvVJQIbufgBmHBuGe
         VizLykJkjw+8l10KHxqT9dHDVWSHOAVdiPRp7ShCQVSE5684jas9J955xOdM4r61+zet
         0Sw6RFq9fqRgJTaYRb4cqsFe3SpmMMstTDAPRSYs7UKhbFzlAw+v8QTSf24xn5+gQmJv
         VioZKLl+3sWycMRF6h+HZacFIdOWmgBcmQs9CJNLBzR3ARad8pchXO3QxTdwxLP03rAs
         EL8ADHP6+WShIOlnMVGdZaCvvHurR/36OLfB6jetfSgFqOLalStT6n2JrTxzHXmeklNz
         8y3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=Mw1KI9fec2NkZrKNrVrUVOtoS7OU3uFpUeY2poZg47w=;
        b=zeGYBftk+/UJ6Xdc7Q9UzX4CqkZgiX9NCO048NYAxHtV0UUiucGHKqiZispIiKmifA
         zNJTjU4vx+Dmd1gvqC7fuvMm9dp6LE7rVIwVuQSWqZPLWigHceNgXTxxmXoQ7ONFu5zh
         VqFQVGikEzcywpA26xOeOYYV+uZ+QKGGRbVUuP3JLdduj7vaEI77RNa2TezoFf/9FuIe
         E1laYnNUBNB4s17wusjNWc3R7gK9oP0rGLU5CwfNzWSgtXEaAGUAhncj2OZaU8S0xSnd
         l2w1Qsa7ySNudteMm39fkERmhYAk0PxFErsSBDGf5f8hDBQqfO8fL7aWY49z1XoU+cv+
         /mIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of yuzenghui@huawei.com designates 45.249.212.190 as permitted sender) smtp.mailfrom=yuzenghui@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <yuzenghui@huawei.com>
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com. [45.249.212.190])
        by mx.google.com with ESMTPS id l191si24970503pga.8.2021.05.26.07.23.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 May 2021 07:23:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of yuzenghui@huawei.com designates 45.249.212.190 as permitted sender) client-ip=45.249.212.190;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of yuzenghui@huawei.com designates 45.249.212.190 as permitted sender) smtp.mailfrom=yuzenghui@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.58])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FqtPP1MTZzncdM;
	Wed, 26 May 2021 22:19:37 +0800 (CST)
Received: from dggema764-chm.china.huawei.com (10.1.198.206) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 22:23:14 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 dggema764-chm.china.huawei.com (10.1.198.206) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 26 May 2021 22:23:13 +0800
Subject: Re: [kvm-unit-tests PATCH v2 2/4] scripts/arch-run: don't use
 deprecated server/nowait options
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: <kvm@vger.kernel.org>, <shashi.mallela@linaro.org>,
	<alexandru.elisei@arm.com>, <eric.auger@redhat.com>, <qemu-arm@nongnu.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.cs.columbia.edu>,
	<christoffer.dall@arm.com>, <maz@kernel.org>
References: <20210525172628.2088-1-alex.bennee@linaro.org>
 <20210525172628.2088-3-alex.bennee@linaro.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <d6c6defe-1ad6-6c23-05a4-ed5966f75f28@huawei.com>
Date: Wed, 26 May 2021 22:23:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20210525172628.2088-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema764-chm.china.huawei.com (10.1.198.206)
X-CFilter-Loop: Reflected
X-TUID: agOqY1UkLUh8

On 2021/5/26 1:26, Alex Bennée wrote:
> The very fact that QEMU drops the deprecation warning while running is
> enough to confuse the its-migration test into failing. The boolean
> options server and wait have accepted the long form options for a long
> time.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Shashi Mallela <shashi.mallela@linaro.org>

This works for me.

Tested-by: Zenghui Yu <yuzenghui@huawei.com>
