Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp832976nji;
        Fri, 13 Sep 2024 03:21:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHBH51wGfDnqD/3BS+gt1p6f8616pX0KHgrbkJONt/utJeMaPjCkQoJKLR0SlP3CBY/A2kkO+TBphmZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGNWGZWBTo8WkSmdPrF0M6ugVpXdy1flvcCDYf1wQnQHjaPCDyMP4W3nSD7K/5alND86Sc8
X-Received: by 2002:a05:6214:5702:b0:6c5:1453:8c0b with SMTP id 6a1803df08f44-6c5736b9139mr107821516d6.46.1726222911576;
        Fri, 13 Sep 2024 03:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726222911; cv=none;
        d=google.com; s=arc-20240605;
        b=XIldhF5YcWLBq2xWdFKUzE8K1RQtTeHktVhb0daZhSxag4KyOY7htToC7oRAhgQKkw
         GRV2YtZS1or5v5LawumZ90G8C8dF03ZWbCJUnpNiOGLidl1r8JfPXFvh5hmxAcC8dp4C
         O/gTxXmw6s+AFjOM/EG0lUD0H6t4Nspjq4zqd++HsQPDYX4x9sQiMdTff+7gDp/iJb0Y
         TQzO702KgGXJieSh1RWxTRiIkkkGYIVCXFvtlKTd51d9XIBkqHMyQqJ7og20rrvTb6/D
         HVB6JtPpNbdTS2CpF3464nzoVaF2881y3vdLXfgO7eOSMOKu7njs7gcVgD6Q9Floyw7/
         iAig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=MbHiGLnryElVLNV3G14FgGaW85KT7VACaj51DMI4bF0=;
        fh=LLFvopbacDWRz8BCKFNwEdcXfTgi86NL8/Mc09yubt8=;
        b=P7Rze5zkImRo8mi4slKU8XYi+7kh+zd3wR7ryoFHEZpcfvYTfvUq2KEIhoZXojZvYx
         OfWT5t//PpP7Zj87eI5loxkYbgbgLemj6KMfH2GviwGIGO/j2ogzophFOOPwSrtPugrD
         GTqVQ29jyaogze+bJtMIICNPp4AXNkvJUZujXVIwLTYyMe95+WS2ry4xUmoWNlCmxtb6
         aBHvY9m77e7DtWWVS0phGA0VTSttsvbs4J0k6sxLLt+9ye/JXdBIM0YISePOZpI3da+C
         mwXor+STCfaI8Ctnh7lq5WR+6A86G1U8lgXwiUE3sjDKbYeX+r9HnF/OQRfe2buc/AVN
         lvBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c53476f108si149873926d6.244.2024.09.13.03.21.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 03:21:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sp3Qs-0005Pf-AG; Fri, 13 Sep 2024 06:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1sp3Qo-0005O9-JW; Fri, 13 Sep 2024 06:21:39 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1sp3Qm-0002W1-R8; Fri, 13 Sep 2024 06:21:38 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X4qwP1cdGz6GC9G;
 Fri, 13 Sep 2024 18:16:37 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id B33931400D8;
 Fri, 13 Sep 2024 18:21:30 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 13 Sep
 2024 12:21:29 +0200
Date: Fri, 13 Sep 2024 11:21:28 +0100
To: Alireza Sanaee <alireza.sanaee@huawei.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <zhao1.liu@intel.com>,
 <zhenyu.z.wang@intel.com>, <dapeng1.mi@linux.intel.com>,
 <yongwei.ma@intel.com>, <armbru@redhat.com>, <farman@linux.ibm.com>,
 <peter.maydell@linaro.org>, <mst@redhat.com>, <anisinha@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mtosatti@redhat.com>,
 <berrange@redhat.com>, <richard.henderson@linaro.org>, <linuxarm@huwei.com>,
 <shameerali.kolothum.thodi@huawei.com>, <jiangkunkun@huawei.com>
Subject: Re: [PATCH 2/5] i386/cpu: add IsDefined flag to smp-cache property
Message-ID: <20240913112128.0000074c@Huawei.com>
In-Reply-To: <20240912133829.400-3-alireza.sanaee@huawei.com>
References: <20240912133829.400-1-alireza.sanaee@huawei.com>
 <20240912133829.400-3-alireza.sanaee@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5bn7uA19+9i2

On Thu, 12 Sep 2024 14:38:26 +0100
Alireza Sanaee <alireza.sanaee@huawei.com> wrote:

> This commit adds IsDefined flag to the object and this helps in avoiding
> extra checks for every single layer of caches in both x86 and ARM.
Hi Ali,

You mention x86 here, but no code changes to support that?

Jonathan

> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
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

