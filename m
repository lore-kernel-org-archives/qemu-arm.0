Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp589067dyc;
        Thu, 3 Jul 2025 07:49:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfkYDkhuyxXwL13fvPZCIdqXu/ib+HNK4502E2m62zpyvnMLBnXLrxlwYUjc+Bi+4VCYhh0PAOYTifLw==@linaro.org
X-Google-Smtp-Source: AGHT+IFrL46m2ghatFHBndTdZtIjmAPGSsjqtrqyuS+CQSTQsraG69E+N3KUdRd+l+32++S9/Mij
X-Received: by 2002:a05:600c:c057:b0:450:d5bf:6720 with SMTP id 5b1f17b1804b1-454a36dc862mr66575775e9.3.1751554183921;
        Thu, 03 Jul 2025 07:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751554183; cv=none;
        d=google.com; s=arc-20240605;
        b=WQ6IJ7rXXVv60JOYFa0za8banI+cGVBKMmNeoprXhbzP70EtaMz3tjwUS9MuDA5a+R
         yTy7RD0J6piJozNk0SGUFvSAfYvTZ+UzaqYrREvIyUlkGxHM7EyLkfePdT6P4/YsS+8q
         Hn5AOJZLKEUTE3VXw0kXfOuc66fAOqkMbLgkMei+QO7DEXCSXOnACB92MQskbxz9Gc1F
         QznMTO7ZHT+1+Xjl0+/JM+ZZzbnfGn66thvfOGNs2YvnYepAF4r5hf30Rr8YDxQE1GEF
         Sx7e2JIOxVWBZ8LVU1E02lPV9fV5xtyAg8GBu5vMdoyl/AeU+zlW1daKQO4w7fIpcP4o
         ySmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=L1Q6asH40yStMpkpsIvXTK40am1j906Ph5ubyzH266k=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=i/6LmpKuxnwLmIXTvOk7dLY+aZSr7WKMT2u2hkFkiHTeh8lo3j+TbHy6/h/aJb/n7s
         mhV5ZHJLqxL7CEZPWqOXSoWKttAjYPAdvBukYcBf2n9lCEMzFqyI+Bn0K8nLIq/JTvGB
         x+t2DdXGwbvZQPDrXCPx2DzBM/q/VnXKCAz3p38828CI8jciuiIPcyuXUuNBspU7F6o1
         n/hCCI6YNKbwWAcjf9W7Hz55W05mQlti37DX2S4N4MS79GIpgbhhJnvEVUi0yNyNvrQw
         CJdQYvz4oF49UpTlyid771M1V+jE3Uk0QmyTLdxxIVAoA2jNgtwiTj6VaeXZxgYNsFnY
         GdOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-454a99bfa36si18810475e9.174.2025.07.03.07.49.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jul 2025 07:49:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bY0596YGPz6M4ZJ;
	Thu,  3 Jul 2025 22:48:45 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 28AF614044F;
	Thu,  3 Jul 2025 22:49:43 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 3 Jul
 2025 16:49:42 +0200
Date: Thu, 3 Jul 2025 15:49:41 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v5 18/36] qtest/bios-tables-test: Add a variant to the
 aarch64 viot test
Message-ID: <20250703154941.000020a1@huawei.com>
In-Reply-To: <20250703123728.414386-19-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
	<20250703123728.414386-19-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: eGnSe9L0aUK8

On Thu,  3 Jul 2025 14:35:18 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Signed-off-by: Eric Auger <eric.auger@redhat.com>

The wide range of ways setting variant up is coded in this file is
a bit more creative than I'd like and makes it hard to spot if there
are other cases of this.  I 'think' this is only one other than
base tests that has this problem but might be wrong.

Anyhow, this looks right

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  tests/qtest/bios-tables-test.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 4dbc07ec5e..357bcefd37 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2237,6 +2237,7 @@ static void test_acpi_aarch64_virt_viot(void)
>      test_data data = {
>          .machine = "virt",
>          .arch = "aarch64",
> +        .variant = ".viot",
>          .tcg_only = true,
>          .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>          .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
