Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4792870lfb;
        Tue, 27 Apr 2021 06:37:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyE0tJNzLzGtwY0/B5/HZgBuSoM6Hd0MpNCUP0g2AkIf5dcKNBH5yS08z4u4jqk9HA7pWhW
X-Received: by 2002:a02:660e:: with SMTP id k14mr21591338jac.9.1619530675345;
        Tue, 27 Apr 2021 06:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619530675; cv=none;
        d=google.com; s=arc-20160816;
        b=ItedCy5DWo1EjmZKZ1rWVu7PRyY5yAOM8ey+XZQhILpx8VcVBLyrwRtHQ+4diVfv6Y
         3BP4ItoFWUcRFdux/xgwP6hJ4cVp25ElIVztcJM+9Oup9ovFNmbnG+7Z2zzM2GvGcLFH
         QGdFmUdsSgSFGrBJwnOXN8l5qhxYCwCBogoaQyRaogXfPMgyy4oMMbil9RK+JZm3C40I
         BM65B3lriIkr5miHS1MMwrsNy2h0SYLzdwU8/Wd8T7MZNo15KXv0aWaK12zxLiJ9af7/
         DT8A4TP9D99qhBMLV4jMxIzB5FPyLEXdol9Kl1U7Dm/tdE+XLFYPnWKcIdjeNijczACK
         R/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=FyXqyptnSyqvxUVR/2dT9FnJxlTqMyPKlzV0+jrfjDE=;
        b=tbnPWrKMsHhZBYS8XOstOrvuv6MgkEeaa4UDyFsn2kWZJ834mHSoYlSojKjuVtWUqr
         ZtNRl0KKcWZaOAv+o8qJ2Eay1YbodNLv5TeoYeaf19XuRRdMRu69qzeJfNliLaamT0w1
         XqI5oIvseq+xI5uYspuoCPPwen63uMc/fhiUpJGjbACz3pwRjcogNdEPiiiuOxtDzQFL
         TnFCjIAIX8p70ma1KWmES3EsjX1hDoRr5HeXzfNk1l9eTRbeEfpoXk73lTDk3Xjr6329
         SlXlyEfWytdmH/5B6r8JXuo/w4NBXqacgPS6i7qYaGuWKLW0DBOjomXit+GZRWftNzyL
         xsWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TrKqZpfY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12si3421886jai.103.2021.04.27.06.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 06:37:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TrKqZpfY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbNuU-0006IW-Kq
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 09:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbNuI-0006H6-D2
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 09:37:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbNu6-0006u5-83
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 09:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619530647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FyXqyptnSyqvxUVR/2dT9FnJxlTqMyPKlzV0+jrfjDE=;
 b=TrKqZpfYwugVW+av3TaJ2Og+V9ZGcXhNC32dkQ4WpnQ0olrUm+kwsF/9esqEw8VxodrvLn
 wUpAY0hPAIimkwfzcFU+S3NhaPxGR3FEapwx00K8BR0O0yRUMfi8saCSWOZxoND9AJEZkn
 i5Je+Bvxqnbqg4Fn5sakOxMuGGqbnaU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-ppEuW7JrPmOUwHzRza6uTQ-1; Tue, 27 Apr 2021 09:37:24 -0400
X-MC-Unique: ppEuW7JrPmOUwHzRza6uTQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 c13-20020a05640227cdb0290385526e5de5so14842460ede.21
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 06:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FyXqyptnSyqvxUVR/2dT9FnJxlTqMyPKlzV0+jrfjDE=;
 b=JpOZwC74oikSXSjS0uv/ZFSQx8LadWXtzfpKiDBL2yJ1EOW+7snIsadjhv33gdNTj1
 ZMbibHYgIVvqNivAq8ur9nFt5PfQDc+Rk35dm0w6HHlCorOuZdEkVWUu/PJtSdbNU2eP
 mYlYP3g4KYf0iCvkOTU1Odaz0Z5yzVVuigDO5FPL6dFocT/nUTy7ePBerHYzhXKg4mra
 XC3iDudUr0adNwSUp2+fO9hXzwuvbQG0s+Id5CdS6SsiILvbme9t1G58zXujywGHVQvM
 L51bouURcOOKYV400XC+BKEV8vSSK7/29JbppD6fNPkG37r5X92ImR84xxQ2ND/gld9A
 geUg==
X-Gm-Message-State: AOAM533/1WNVLgjNUVNC6aBlx/t+bGkqhnyptkJ2Rc/jABkaTJ8jGfTy
 rwjb3Eyk8tGL7N6J1sKIq/a52sO7uFJE8ZWQLG+cV8fhoNpo+nOdnZ4I15PYDqYuSwCMS9ofaGL
 Fxp9vC/+SwZl8
X-Received: by 2002:a05:6402:270a:: with SMTP id
 y10mr4442168edd.387.1619530643344; 
 Tue, 27 Apr 2021 06:37:23 -0700 (PDT)
X-Received: by 2002:a05:6402:270a:: with SMTP id
 y10mr4442120edd.387.1619530643063; 
 Tue, 27 Apr 2021 06:37:23 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id i1sm2461693edt.33.2021.04.27.06.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 06:37:22 -0700 (PDT)
Date: Tue, 27 Apr 2021 15:37:20 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 4/6] hw/acpi/aml-build: Add processor hierarchy
 node structure
Message-ID: <20210427133720.xxwx6caln6dze5dm@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-5-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413080745.33004-5-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Henglong Fan <fanhenglong@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Ying Fang <fangying1@huawei.com>,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o6vXjkAtSQTr

On Tue, Apr 13, 2021 at 04:07:43PM +0800, Yanan Wang wrote:
> Add a generic API to build Processor Hierarchy Node Structure(Type 0),
> which is strictly consistent with descriptions in ACPI 6.3: 5.2.29.1.
> 
> This function will be used to build ACPI PPTT table for cpu topology.
> 
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: Henglong Fan <fanhenglong@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/acpi/aml-build.c         | 27 +++++++++++++++++++++++++++
>  include/hw/acpi/aml-build.h |  4 ++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index d33ce8954a..75e01aea17 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1916,6 +1916,33 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                   table_data->len - slit_start, 1, oem_id, oem_table_id);
>  }
>  
> +/*
> + * ACPI 6.3: 5.2.29.1 Processor Hierarchy Node Structure (Type 0)
             ^ Doesn't this table show up in 6.2 first? We should always
use the oldest specification we can.

Also, please don't capitalize Hierarchy, Node, and Structure. Those words
are not capitalized in the spec section name and we want an exact match
here.

> + */
> +void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
> +                                    uint32_t parent, uint32_t id,
> +                                    uint32_t *priv_rsrc, uint32_t priv_num)
> +{
> +    int i;
> +
> +    build_append_byte(tbl, 0);                 /* Type 0 - processor */
> +    build_append_byte(tbl, 20 + priv_num * 4); /* Length */
> +    build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
> +    build_append_int_noprefix(tbl, flags, 4);  /* Flags */
> +    build_append_int_noprefix(tbl, parent, 4); /* Parent */
> +    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
                                                          ^ should be
capitalized like in the spec
                        
> +
> +    /* Number of private resources */
> +    build_append_int_noprefix(tbl, priv_num, 4);
> +
> +    /* Private resources[N] */
> +    if (priv_num > 0 && priv_rsrc != NULL) {

Since we should never have priv_num > 0 and priv_rsrc == NULL, then we can
do

   if (priv_num > 0) {
       assert(priv_rsrc);
       ...

> +        for (i = 0; i < priv_num; i++) {
> +            build_append_int_noprefix(tbl, priv_rsrc[i], 4);
> +        }
> +    }
> +}
> +
>  /* build rev1/rev3/rev5.1 FADT */ 
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id)
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 471266d739..ea74b8f6ed 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -462,6 +462,10 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>  void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  const char *oem_id, const char *oem_table_id);
>  
> +void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
> +                                    uint32_t parent, uint32_t id,
> +                                    uint32_t *priv_rsrc, uint32_t priv_num);
> +
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id);
>  
> -- 
> 2.19.1
>

Thanks,
drew 

