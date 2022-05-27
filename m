Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp741251lfh;
        Thu, 26 May 2022 20:31:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAyHKzt71lIWVqhVYMlMCXcXRNaao195cPG4sx5SlbqV9KunufPVQ/4WuIlweJ+N49BZ2R
X-Received: by 2002:a05:6a00:1989:b0:519:133c:737e with SMTP id d9-20020a056a00198900b00519133c737emr6982056pfl.26.1653622276084;
        Thu, 26 May 2022 20:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653622276; cv=none;
        d=google.com; s=arc-20160816;
        b=qqDJgHd6yZk+SDzFeHpPSDUfdnzLkRsPTn4aAx+oRPWUq5D2+/l8Gi1HNzhpYY8u4S
         LiAFQ/h+M8o6FHVkZY95SZM3BLkKCtR9VlOHI22qWiUpffxOPti6kq5IXDKsQ881srMB
         8jpH4az7HbcGWGCBYhQCJUv0cZ7DcjZevcE8uZR0yRkKBg/gg7c85R6CLNTDebGI9iP4
         wWIBw1N8pRG7m4+V2CWmr3faS/wEtiTO74KUQNIOlOopBQhg8a5ZcVM4uwn717JPppdN
         3MwbZyrq5Dh9Ga7uzmC8At9D0VA8S3Q6hamZRZaL9piD+C/fkghLCDGPvpTmemHDR31v
         Y7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=zXSzBM6EY8HQC9CTEV+evN+MEk8BCPAhc62fDnUOVF4=;
        b=EY0sSWOOzpc/i7M/dDJnd2310Mt0rdNwvk01gk1QbUqr0aykhq5oEXDx+mdOLyYrYR
         5wbPfPBaMpB0FTFqSZUH2JVJSycQKcydCN7oQku8DSHkAkhRYWYfjsJWBUUO0MhjEKu+
         8q0cHCNGtfLtZu9NPuCIZKZJoVKEvTYntJPeexLwQAONulMfaCM5Q4GWohvRINXEJnGX
         VK8U+JG1tVaDHv+XjuaYjxO2IpZBs4NTor5WlqSmAvdzIGjSAdju5l58kUYv1aW0IamD
         SGByoLTgUQ27L83V5fWepoZxToJ7LPXC10gkYtoRWur6H1rM2PuzaIo3icxAeNvmUt2R
         8+7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of yuzenghui@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=yuzenghui@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <yuzenghui@huawei.com>
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com. [45.249.212.187])
        by mx.google.com with ESMTPS id b14-20020a17090a550e00b001df6f1c3c04si1069029pji.44.2022.05.26.20.31.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 May 2022 20:31:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of yuzenghui@huawei.com designates 45.249.212.187 as permitted sender) client-ip=45.249.212.187;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of yuzenghui@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=yuzenghui@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from kwepemi500017.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L8VfX0JX9zfZMy;
	Fri, 27 May 2022 11:29:40 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 kwepemi500017.china.huawei.com (7.221.188.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 27 May 2022 11:31:13 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 27 May 2022 11:31:12 +0800
Subject: Re: [PATCH] target/arm/hvf: Include missing "cpregs.h"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@fungible.com>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
	<qemu-arm@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Alexander Graf
	<agraf@csgraf.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Duncan Bayne <duncan@bayne.id.au>
References: <20220525161926.34233-1-philmd@fungible.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <5dacd767-6e69-64ed-7ca5-f9fbf8b36acd@huawei.com>
Date: Fri, 27 May 2022 11:31:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20220525161926.34233-1-philmd@fungible.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
X-TUID: 3EqT26L93Uev

On 2022/5/26 0:19, Philippe Mathieu-Daudé wrote:
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 86710509d2..1fdc5eef92 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -17,6 +17,7 @@
>  #include "sysemu/hvf_int.h"
>  #include "sysemu/hw_accel.h"
>  #include "hvf_arm.h"
> +#include "cpregs.h"

Compile tested on my MacBook, thanks.

P.S., Looks like we don't need to include "target/arm/cpu.h"
explicitly in hvf.c.
