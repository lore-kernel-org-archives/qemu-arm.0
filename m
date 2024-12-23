Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp4209332njk;
        Mon, 23 Dec 2024 09:48:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWsZfZvH+Ra7BviLB76TMFMYNGJrr5WgkDu751rqXD2/dAKpKPx+qjT1bi00cxj+iCdbioW7WGnmftJIA==@linaro.org
X-Google-Smtp-Source: AGHT+IGMz3WPo9rtyN0j0AD3tqzA4kmK7/+mQYOoPOhM9e/ZNY8pBoxkzMUxAoCxsOZJcPNY46j0
X-Received: by 2002:a05:6102:3913:b0:4af:ed5a:b697 with SMTP id ada2fe7eead31-4b2cc380fdfmr14051080137.13.1734976080676;
        Mon, 23 Dec 2024 09:48:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734976080; cv=none;
        d=google.com; s=arc-20240605;
        b=LxUJPq+0ct7tqI2E5oLTTyvJNTUwAfN/4XPoVUNTHa9D02GdDYQhHGQ8Pu4EkUsnSv
         qD7q06QQ133e4N3Gu6l15tjQjSGz200n90Ec7IFWsq25p+ttMttPca0kHxVieUo1x9JY
         j5agQKAsMyzbyEPa4qs8alZN/IiekfoYVDrXSskJTwIEMpB006yQ/wll3f1yBeUg7/pg
         L4ZVzlVExoLz+nfCOtXlA+3Bg23P5bVjFkeMFQqmww9ZGyfPNhR94GYG3TwaksdMXC+V
         RH3ZKdCFyK3CvD7wCfth7Qq8jnBZOrZOLWDKq+7Hn6r1V2vwK5PlkFEnVqIClnnSqpWJ
         K3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=1lKyb94nghjPrE49Eg/gwRIrK5JgRTIcmijkCAz+MrA=;
        fh=uhEa4+c/PWgbkyok7o0K47ovsE+h/jBjfBiC909Ll24=;
        b=k12GS8mEm0gZhiLnrgmeJqwwiOPSt3JmMdUdFRMM3MaSZ9xO0MvSYudkhp1EFC3JQT
         eTvWZ3Qk20tv1ftfRox/leXJYulc7OYBWUmiynhVZ/Vn+ksprfv2YvGiXbdGr6rqFX+/
         5Ws5zDiio9CsDjJIdQ3heWT6IhFGNvrz2lNvzHhp1jKpT0HCL0eRtoxSE5F7p5ph34W4
         P+bvxIiHh6MHEbrEqZaRjnFZh13ckREyrW6TCmewQa6eJbiPhNJ9ikTkHanrb5CYDXpY
         IIycnF0iV27xzpAQL8K36x06QwaGN+GGLAOxD8pzjMH+1ohHPD+DYvjWub8NvMXB2R1V
         Stsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b2bfb739cfsi3089318137.496.2024.12.23.09.48.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2024 09:48:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tPmWr-00052J-QL; Mon, 23 Dec 2024 12:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tPmWq-00051x-2j; Mon, 23 Dec 2024 12:47:40 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tPmWn-0005Qw-Pr; Mon, 23 Dec 2024 12:47:39 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH56X1dT4z6LDSr;
 Tue, 24 Dec 2024 01:46:12 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 5AD64140517;
 Tue, 24 Dec 2024 01:47:24 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 18:47:22 +0100
Date: Mon, 23 Dec 2024 17:47:20 +0000
To: Alireza Sanaee <alireza.sanaee@huawei.com>, <linuxarm@huawei.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <zhao1.liu@intel.com>,
 <zhenyu.z.wang@intel.com>, <dapeng1.mi@linux.intel.com>,
 <yongwei.ma@intel.com>, <armbru@redhat.com>, <farman@linux.ibm.com>,
 <peter.maydell@linaro.org>, <mst@redhat.com>, <anisinha@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mtosatti@redhat.com>,
 <berrange@redhat.com>, <richard.henderson@linaro.org>,
 <shameerali.kolothum.thodi@huawei.com>, <Jonathan.Cameron@Huawei.com>,
 <jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <sarsanaee@gmail.com>
Subject: Re: [PATCH v4 2/7] target/arm/tcg: increase cache level for cpu=max
Message-ID: <20241223174720.0000358e@huawei.com>
In-Reply-To: <20241216175414.1953-3-alireza.sanaee@huawei.com>
References: <20241216175414.1953-1-alireza.sanaee@huawei.com>
 <20241216175414.1953-3-alireza.sanaee@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
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
X-TUID: jhsUsbQBQ+k6

On Mon, 16 Dec 2024 17:54:09 +0000
Alireza Sanaee <alireza.sanaee@huawei.com> wrote:

> This patch addresses cache description in the `aarch64_max_tcg_initfn`
> function for cpu=max. It introduces three layers of caches and modifies
> the cache description registers accordingly.
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>

I think this makes sense as a MAX cpu with out an L3 sounds pretty minimal
and it provides a way to exercise the rest of this series in TCG. For KVM
it will come from host registers (or overridden ones) anyway.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  target/arm/tcg/cpu64.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index 904a7e90b4..47d8c9c9ae 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -1086,6 +1086,19 @@ void aarch64_max_tcg_initfn(Object *obj)
>      uint64_t t;
>      uint32_t u;
>  
> +    /*
> +     * Expanded cache set
> +     */
> +    cpu->clidr = 0x8200123; /* 4 4 3 in 3 bit fields */
> +    /* 64KB L1 dcache */
> +    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
> +    /* 64KB L1 icache */
> +    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
> +    /* 1MB L2 unified cache */
> +    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 * MiB, 7);
> +    /* 2MB L3 unified cache */
> +    cpu->ccsidr[4] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 2 * MiB, 7);
> +
>      /*
>       * Unset ARM_FEATURE_BACKCOMPAT_CNTFRQ, which we would otherwise default
>       * to because we started with aarch64_a57_initfn(). A 'max' CPU might

