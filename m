Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2843992ejb;
        Wed, 31 May 2023 06:13:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5mnj5pN13GYRvZ1aohS3PiLotsZUY+s+kiF1OUAKfEo9SYKDmfRtrOwk5ROVGlkbA+Odux
X-Received: by 2002:ac8:5709:0:b0:3f6:bcda:e77 with SMTP id 9-20020ac85709000000b003f6bcda0e77mr7005354qtw.55.1685538816707;
        Wed, 31 May 2023 06:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685538816; cv=none;
        d=google.com; s=arc-20160816;
        b=DMPZ6WCpM7DB/o3mkH3/MLzNmQlyM/4R0pSb1fPrxYqGudttyQKEJHL6BIvmDbZYoC
         ryGjMkxl+38ccwTY3sTAdX9Mz8G1e4L6zorF/Na/2dCtZlH2leBffxJacLUd/wOl2E0I
         h2fph5jUajG308R+GkxmKriTBkU47JTx0nSxOAL+luOyZkobWC7IXkkdR77q9a6uZwdy
         DPe+aotrU4ECX2QEwwv+Pu7+WSMSsUG0VVg4j2fdn8oLlq3eKBD7g+A0DS1YJR3Hr5te
         Axzp15iLwYX9RlwOg2JaBRu/uCn03KsC+rjD6KP2KW/CeJ4ZW8olOXSezv3kI3t/oB+E
         XWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=RbOa8PAml6rxfkGpsjRcYBEKufG03n3LpmXZSyRIkvU=;
        b=IgD7tgfTcWSyGvM5u5WN1qGoLfLTC7Qu37hVItG13v5iaoOtdFH5b70z8bBxwYZJGI
         OdExhSiwz6/QMQw82L8wK6bVaSGBUaPq8oaUY+XoCg2YiAnT8sQgpxLWoO9k4tzTjnup
         Tz5vh3XwCBFl7hNlalR05t3zqbJZkws87g4pelhlwTclgFMPWsQHv2LxJPomGczNm32P
         TUeHxsB5OpAOZXNVF2UUWfBJNA7xL7XDzdpQC2wOyzlMl13wLqJEkg4W44j9Q3V8nYJl
         m8pH0lQb8+HKYvCZeE0MsY2ddjetKdDnml9xyDLR/A4+igokv6TKetnbv9iRZ5+aIb9V
         gHYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20-20020a05622a019400b003f6b8a4f19bsi7972532qtw.119.2023.05.31.06.13.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 06:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4Ldn-0006cr-Jq; Wed, 31 May 2023 09:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1q4Ldl-0006ZK-EH; Wed, 31 May 2023 09:13:25 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1q4Ldj-000239-9n; Wed, 31 May 2023 09:13:25 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QWV5j0yQXz67nPF;
 Wed, 31 May 2023 21:11:37 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 31 May
 2023 14:13:18 +0100
Date: Wed, 31 May 2023 14:13:17 +0100
To: Klaus Jensen <its@irrelevant.dk>
CC: <qemu-devel@nongnu.org>, Corey Minyard <cminyard@mvista.com>, Keith Busch
 <kbusch@kernel.org>, Jason Wang <jasowang@redhat.com>, Lior Weintraub
 <liorw@pliops.com>, Paolo Bonzini <pbonzini@redhat.com>, Jeremy Kerr
 <jk@codeconstruct.com.au>, <qemu-arm@nongnu.org>, Matt Johnston
 <matt@codeconstruct.com.au>, Peter Delevoryas <peter@pjd.dev>,
 <qemu-block@nongnu.org>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Klaus Jensen <k.jensen@samsung.com>, Peter Maydell
 <peter.maydell@linaro.org>, <gost.dev@samsung.com>
Subject: Re: [PATCH v3 1/3] hw/i2c: add smbus pec utility function
Message-ID: <20230531141317.00001912@Huawei.com>
In-Reply-To: <20230531114744.9946-2-its@irrelevant.dk>
References: <20230531114744.9946-1-its@irrelevant.dk>
 <20230531114744.9946-2-its@irrelevant.dk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: n9mQ6lNzHE+6

On Wed, 31 May 2023 13:47:42 +0200
Klaus Jensen <its@irrelevant.dk> wrote:

> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add i2c_smbus_pec() to calculate the SMBus Packet Error Code for a
> message.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
LGTM

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  hw/i2c/smbus_master.c         | 28 ++++++++++++++++++++++++++++
>  include/hw/i2c/smbus_master.h |  2 ++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/hw/i2c/smbus_master.c b/hw/i2c/smbus_master.c
> index 6a53c34e70b7..47f9eb24e033 100644
> --- a/hw/i2c/smbus_master.c
> +++ b/hw/i2c/smbus_master.c
> @@ -15,6 +15,34 @@
>  #include "hw/i2c/i2c.h"
>  #include "hw/i2c/smbus_master.h"
>  
> +static uint8_t crc8(uint16_t data)
> +{
> +#define POLY (0x1070U << 3)
> +    int i;
> +
> +    for (i = 0; i < 8; i++) {
> +        if (data & 0x8000) {
> +            data = data ^ POLY;
> +        }
> +
> +        data = data << 1;
> +    }
> +
> +    return (uint8_t)(data >> 8);
> +#undef POLY
> +}
> +
> +uint8_t i2c_smbus_pec(uint8_t crc, uint8_t *buf, size_t len)
> +{
> +    int i;
> +
> +    for (i = 0; i < len; i++) {
> +        crc = crc8((crc ^ buf[i]) << 8);
> +    }
> +
> +    return crc;
> +}
> +
>  /* Master device commands.  */
>  int smbus_quick_command(I2CBus *bus, uint8_t addr, int read)
>  {
> diff --git a/include/hw/i2c/smbus_master.h b/include/hw/i2c/smbus_master.h
> index bb13bc423c22..d90f81767d86 100644
> --- a/include/hw/i2c/smbus_master.h
> +++ b/include/hw/i2c/smbus_master.h
> @@ -27,6 +27,8 @@
>  
>  #include "hw/i2c/i2c.h"
>  
> +uint8_t i2c_smbus_pec(uint8_t crc, uint8_t *buf, size_t len);
> +
>  /* Master device commands.  */
>  int smbus_quick_command(I2CBus *bus, uint8_t addr, int read);
>  int smbus_receive_byte(I2CBus *bus, uint8_t addr);

