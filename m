Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp4209666njk;
        Mon, 23 Dec 2024 09:48:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWgzU/8kOlEZODEyLi0fyOEciYMG2T9c5PYNA8n06oywcvMOZhrbBblH53uZv8nwB88VIoyEP0KPm0bzw==@linaro.org
X-Google-Smtp-Source: AGHT+IG6gNbn7vkj7sU8+bkD/wYuLiH/3+KMIY6ik05cYtOE0T/Im2Hk3JgQAkBNUjm4NEvu99V/
X-Received: by 2002:a05:6102:334a:b0:4b1:f903:98d3 with SMTP id ada2fe7eead31-4b2bc01044bmr19182215137.7.1734976117739;
        Mon, 23 Dec 2024 09:48:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734976117; cv=none;
        d=google.com; s=arc-20240605;
        b=dOpXWw9dlDKAEKom3/I06jSuReSfRqSfcbMMvYXVOfGVnvj2xQ0cH8C8EuX6ppzO3p
         8tpa3g/FxIcoBE0dAF/ZA/voCFGLRS6YTHN+xGzKAKujaz6ngRH5dr6/OPpdywWN9uB7
         sNjGx2VsgnUUMJ0RTE9EJ8BDy48fpzCOjxVR/UGHnLW1jMjAZqrYku1HUFeDZniT0hDt
         X7YTtvF2An7kBlARHgmf5CTjMDbhhOPlJCTCY5JgmtYrLQsIXLdE07mWxS1y5Yk9j2Rn
         Vjrs6hbfy1qIswdBHYVO9UOB0UPC/dtRblxQEQ/0255waF3JQ4n1cdgvLD00aUgCDtZH
         yF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=R+NjXSKuXqFK24FGGBw4Epoo+FKrXThJSJX7tBvF7XQ=;
        fh=uhEa4+c/PWgbkyok7o0K47ovsE+h/jBjfBiC909Ll24=;
        b=hmC4o19sLQabbAftZ6ZUZ2zBhBJitxQARm0tzFYlOCCL/5lk4SHdlnTocTv01CksN0
         dHpvf/V3NYy/iKdV4U263QgG4nmWjCoUL3iNDsnWtYkAnIoEnMuMJ6MfVARaQrWB+cxq
         fVZgT2pavMXGAlNflHmP8dTpEGgwVKZBw33e2gMQJTbNsxwJMQkfq0qioY9/NqGiM7MX
         /wONQkMLOZ6gmQQo5uDNWFi9uckdX//aW3wVcH70qc5FBEHGbmcYDijgKPOn6aa5p5OH
         USzWgo14OgegH/yeqapa0f0rI8eU5qGXMparig2Syq778uEOB1CQ6BuIf3ze+eKpTiAu
         IpPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-8610ade8f67si3477545241.182.2024.12.23.09.48.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2024 09:48:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tPmXa-0005hM-KH; Mon, 23 Dec 2024 12:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tPmXY-0005Y8-W0; Mon, 23 Dec 2024 12:48:25 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tPmXX-0005XE-BS; Mon, 23 Dec 2024 12:48:24 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH57d11msz6LDSw;
 Tue, 24 Dec 2024 01:47:09 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 46AD7140B2F;
 Tue, 24 Dec 2024 01:48:21 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 18:48:20 +0100
Date: Mon, 23 Dec 2024 17:48:18 +0000
To: Alireza Sanaee <alireza.sanaee@huawei.com>, <linuxarm@huawei.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <zhao1.liu@intel.com>,
 <zhenyu.z.wang@intel.com>, <dapeng1.mi@linux.intel.com>,
 <yongwei.ma@intel.com>, <armbru@redhat.com>, <farman@linux.ibm.com>,
 <peter.maydell@linaro.org>, <mst@redhat.com>, <anisinha@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mtosatti@redhat.com>,
 <berrange@redhat.com>, <richard.henderson@linaro.org>,
 <shameerali.kolothum.thodi@huawei.com>, <Jonathan.Cameron@Huawei.com>,
 <jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <sarsanaee@gmail.com>
Subject: Re: [PATCH v4 1/7] i386/cpu: add IsDefined flag to smp-cache property
Message-ID: <20241223174818.000025c7@huawei.com>
In-Reply-To: <20241216175414.1953-2-alireza.sanaee@huawei.com>
References: <20241216175414.1953-1-alireza.sanaee@huawei.com>
 <20241216175414.1953-2-alireza.sanaee@huawei.com>
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
X-TUID: gV1fNL5LDi5d

On Mon, 16 Dec 2024 17:54:08 +0000
Alireza Sanaee <alireza.sanaee@huawei.com> wrote:

> This commit adds IsDefined flag to the object and this helps in avoiding
> extra checks for every single layer of caches in both x86 and ARM.
> 
> There is already a discussion on mailing list to have this flag. A
> patch that enables this flag will follow later.
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Makes sense.  Zhao Liu, is this something you plan to use in the x86
code?

Either way
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  hw/core/machine-smp.c | 2 ++
>  include/hw/boards.h   | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index 9a28194676..5a02bbf584 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -371,6 +371,8 @@ bool machine_parse_smp_cache(MachineState *ms,
>          return false;
>      }
>  
> +    ms->smp_cache.IsDefined = true;
> +
>      return true;
>  }
>  
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index db2aa2b706..2883a57084 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -373,6 +373,7 @@ typedef struct CpuTopology {
>  
>  typedef struct SmpCache {
>      SmpCacheProperties props[CACHE_LEVEL_AND_TYPE__MAX];
> +    bool IsDefined;
>  } SmpCache;
>  
>  /**

