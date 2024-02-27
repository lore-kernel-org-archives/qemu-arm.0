Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2651931ejf;
        Tue, 27 Feb 2024 05:01:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9DfU1fE0BY19aemryDR50812W3NDjs5/RZUVIVukiXAXOLn1oXR1UOo+ECqSfcg7dwSnlT7mcV274nsZ3B8UDgKcsRZMD
X-Google-Smtp-Source: AGHT+IF9qij/S/8f3Fyba+cjryoyXqRkpRGgzdnkF3riMSL3qReawslYLseBTvQ3xhLCYE+5oCbT
X-Received: by 2002:ac8:7dc3:0:b0:42e:a621:efc7 with SMTP id c3-20020ac87dc3000000b0042ea621efc7mr125907qte.26.1709038863735;
        Tue, 27 Feb 2024 05:01:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709038863; cv=none;
        d=google.com; s=arc-20160816;
        b=LvVVfe2WvEmkTUJ33ftFX08dK0Mw0W5ooQHESxZiI4pb0mq1e/4Ou/OGMA43ScVR7J
         rFpEkw3fYhDImHeyRyotl/1t1iHjsB7+AAeyxXNNWJmXZXrict6s7NiyfAl5+q3kHANz
         s/bENWMfCJyhk15Kmju0+ofjotw3GW9m23y89W24qIXNNS6BL4QJnjj9TvOQ1w2w5rLO
         3p0pVYTg7IgenhVqv+PS+qB7TklCuxPKbAxKw7N6BFGR5yZn3dsygch76mfbMLCvX2G0
         nwwDR0+9i2X9bxmNUAj7oddJ4fZexODYmP3sTHo1egtGJAIEh6XPFaUCS27NhMVDg9rm
         PJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=miyEygCi2QozZ4YppFon4OaJ1pBdsKlMLCn+/Wdaijs=;
        fh=S5KfG517jnmZiWmNRDwcBtASqH6F+n4I4staEIYnefs=;
        b=DJDbpkAOiypqb97wuAd6Drj/3tgufQueDc9N29H4y9ra7a/B4ckuifzsikc5SibpJG
         /Eg2sJ5zx5aazbSLW/OIiyJl15a/DIggdAUgxTRlDEKF8btY0OP5vtAr6MOdodOSydIg
         9qY4JV3RX+jZQ7oC5YOhr8Fk0JtCorrekyYGS/tb950IsgGmhJCE81XFvMg8cAXANZJb
         lI3FieOc01/C5QrL5gwhIQtG9Ub5wgq3kKGbTJxsyyr/pvDemvRJgG31RskMI1v1ICTa
         VFuJl4wWiMHFBT/vWMF4fyA2SbKERp5rYfv0txxDn24iDYBh+q40dL4O6LiESJ9mWa8A
         klIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12-20020ac8480c000000b0042e7b1eb6a4si5641241qtq.643.2024.02.27.05.01.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 05:01:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rex4a-0005Wd-AP; Tue, 27 Feb 2024 08:00:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rex4X-0005Vt-1T; Tue, 27 Feb 2024 08:00:39 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rex4T-0004NJ-Jj; Tue, 27 Feb 2024 08:00:36 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TkctC13Zmz6K6Cg;
 Tue, 27 Feb 2024 20:56:03 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id DA18E141677;
 Tue, 27 Feb 2024 21:00:24 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 27 Feb
 2024 13:00:24 +0000
Date: Tue, 27 Feb 2024 13:00:23 +0000
To: <ankita@nvidia.com>
CC: <jgg@nvidia.com>, <alex.williamson@redhat.com>, <clg@redhat.com>,
 <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>, <ani@anisinha.ca>,
 <berrange@redhat.com>, <eduardo@habkost.net>, <imammedo@redhat.com>,
 <mst@redhat.com>, <eblake@redhat.com>, <armbru@redhat.com>,
 <david@redhat.com>, <gshan@redhat.com>, <zhiw@nvidia.com>,
 <mochs@nvidia.com>, <pbonzini@redhat.com>, <aniketa@nvidia.com>,
 <cjia@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <vsethi@nvidia.com>, <acurrid@nvidia.com>, <dnigam@nvidia.com>,
 <udhoke@nvidia.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v7 1/2] qom: new object to associate device to numa node
Message-ID: <20240227130023.00000744@Huawei.com>
In-Reply-To: <20240223124223.800078-2-ankita@nvidia.com>
References: <20240223124223.800078-1-ankita@nvidia.com>
 <20240223124223.800078-2-ankita@nvidia.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: GCqeS6dNcwxu


> diff --git a/include/hw/acpi/acpi-generic-initiator.h b/include/hw/acpi/acpi-generic-initiator.h
> new file mode 100644
> index 0000000000..2f183b029a
> --- /dev/null
> +++ b/include/hw/acpi/acpi-generic-initiator.h

> +typedef struct AcpiGenericInitiatorClass {
> +        ObjectClass parent_class;
Too indented.
> +} AcpiGenericInitiatorClass;

