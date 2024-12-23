Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp4224793njk;
        Mon, 23 Dec 2024 10:12:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1kT8YVrgHjQ+TJFrqIfmZVtcRejmaxGxL2M998JJQp9xvwmri/+pRgt/CtsmBotvS6o8ZyR8wuWl1yg==@linaro.org
X-Google-Smtp-Source: AGHT+IEkrZZfBCVVfSuDNPpGmLkqUDQncXm7GpTBbJXf5L5zCaDwq1VZh9yxd29uQZRbX4nSF/F6
X-Received: by 2002:a05:620a:27c6:b0:7b6:7ac5:5e02 with SMTP id af79cd13be357-7b9ba7a3ec6mr2447464085a.24.1734977547735;
        Mon, 23 Dec 2024 10:12:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734977547; cv=none;
        d=google.com; s=arc-20240605;
        b=JXQu/Qg1nJH6qv2GE3id/7I+ehaBI6LrWuTWvwoTZM/kPK9Ft3Q/Fxs3tOxBhfbdWO
         8K7qxG4InAJG8SjGlkKWzrBIMam3TkblRBTPQrMudminYYGuUB9+C19fSMq0aToBxueF
         usJ5Xzxu7DzeH40kg3xIum1rFB425d8VsczDD2UjpRDUAfNSGnuC9piOVRyTAD6BEOpr
         QNesI4I91/rVBPWVkBtQfcdLHLYx0fQjHlH0uaz73aLgOZ+8rskepVQYibquKZPWLWrg
         cj0n60K6n1gzTznRDFFx1vWE+q/sGgWM1sjTbcUPuWtbUx38KQ8dUr6gfFWulzW9BQkh
         c6KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=M489I18JoodYQSIbJYbqtBhOi4HLzmx0gy9uGAzkXX0=;
        fh=uhEa4+c/PWgbkyok7o0K47ovsE+h/jBjfBiC909Ll24=;
        b=Nqlzmzh2968sNCjzwDEBJrEy6GqxxhCh8xFzEgExEUJ2y3M8FGpF26uP1nB9g1uGj0
         hEVj3D5WhLDHlLHNOUfwWQ4xxqbxE4lieXJrvOkH753877LTaBNF+7mcfudWUM+/biDE
         F1lXn/uDlwM1Lxzg/Pkp42X3b4AyC5y1i02x0K4BxO8Nlar4WD8WqqIsvP7JqmmjMg9f
         G7747iR38ePVK94RJtG45curi/v6T8aPUcgTBmXNRBQ14WdvwTSR9FKVB8OmdpRIdNfU
         2W5U5kciY9bvjzy4z/5Pl6ORkhF15g7CCK05hGciFR78YVGgd7OETV3HzE3hyZH4Ielr
         4jvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac51fc5asi1165717685a.592.2024.12.23.10.12.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2024 10:12:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tPmuN-0005zb-4L; Mon, 23 Dec 2024 13:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tPmuL-0005z2-GJ; Mon, 23 Dec 2024 13:11:57 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tPmuI-0000Y4-0I; Mon, 23 Dec 2024 13:11:57 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH5bf1q9Zz6K5Ym;
 Tue, 24 Dec 2024 02:07:58 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id E6CD4140517;
 Tue, 24 Dec 2024 02:11:48 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 19:11:47 +0100
Date: Mon, 23 Dec 2024 18:11:45 +0000
To: Alireza Sanaee <alireza.sanaee@huawei.com>, <linuxarm@huawei.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <zhao1.liu@intel.com>,
 <zhenyu.z.wang@intel.com>, <dapeng1.mi@linux.intel.com>,
 <yongwei.ma@intel.com>, <armbru@redhat.com>, <farman@linux.ibm.com>,
 <peter.maydell@linaro.org>, <mst@redhat.com>, <anisinha@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mtosatti@redhat.com>,
 <berrange@redhat.com>, <richard.henderson@linaro.org>,
 <shameerali.kolothum.thodi@huawei.com>, <Jonathan.Cameron@Huawei.com>,
 <jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <sarsanaee@gmail.com>
Subject: Re: [PATCH v4 6/7] tests/qtest/bios-table-test: testing new ARM
 ACPI PPTT topology
Message-ID: <20241223181145.00003b06@huawei.com>
In-Reply-To: <20241216175414.1953-7-alireza.sanaee@huawei.com>
References: <20241216175414.1953-1-alireza.sanaee@huawei.com>
 <20241216175414.1953-7-alireza.sanaee@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LL5wEtQd6ALu

On Mon, 16 Dec 2024 17:54:13 +0000
Alireza Sanaee <alireza.sanaee@huawei.com> wrote:

> Test new PPTT topolopy with cache representation.
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>  tests/qtest/bios-tables-test.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 36e5c0adde..0f72520664 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2019,7 +2019,11 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>          .scan_len = 128ULL * 1024 * 1024,
>      };
>  
> -    test_acpi_one("-cpu cortex-a57 "
> +    test_acpi_one("-M virt,smp-cache.0.cache=l1i,smp-cache.0.topology=cluster,"
> +                  "smp-cache.1.cache=l1d,smp-cache.1.topology=cluster,"
> +                  "smp-cache.2.cache=l2,smp-cache.2.topology=cluster,"
> +                  "smp-cache.3.cache=l3,smp-cache.3.topology=cluster "
> +                  "-cpu cortex-a57 "
Trivial but is there a reason the cpu must come after machine / -M bits?
If not I'd leave it on first line to reduce the churn in this patch a little.

Either way,

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


>                    "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
>      free_test_data(&data);
>  }

