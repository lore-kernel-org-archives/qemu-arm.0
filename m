Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC08CA0FED
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Sep 2025 10:37:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuToQ-0000yu-Qs; Fri, 05 Sep 2025 06:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuToP-0000xq-Cl
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 06:36:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuToG-0003fa-DV
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 06:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757068605;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jgzRI4M8YzzXymautfHy1slGXby83FcFw/MBRmwhcvk=;
 b=eHJH0fndzbYp04xZcm9HjgfxdL7KwucVB5UwBgDcL0pLw58pb5JEwMkJMB+jGfWVo483VG
 CrdUuOiBS7Se2jXtptSThMJPoSutu5l8i2F/8KNDgfK6wohnVqAKSnDpm8KlEzfp0DTTrO
 Vg2sgSjcVGSmyyk55P70CrCTUykZ+Pc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-ynBJY7j4P8OLFK67LCp52Q-1; Fri, 05 Sep 2025 06:36:44 -0400
X-MC-Unique: ynBJY7j4P8OLFK67LCp52Q-1
X-Mimecast-MFC-AGG-ID: ynBJY7j4P8OLFK67LCp52Q_1757068603
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45cb604427fso10437705e9.1
 for <qemu-arm@nongnu.org>; Fri, 05 Sep 2025 03:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757068602; x=1757673402;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jgzRI4M8YzzXymautfHy1slGXby83FcFw/MBRmwhcvk=;
 b=b2GbTl1epqvPIOX+ikb5kygA1ibeVGzae3qn4qNTZPm6+GRXLB44paBuzo0FSnautC
 nYyPYB4iF1CuRMLiPQJ4zxX8KzSQhwaXetappEB92E6eAqbZVImrnE0eA9Q83CPxYyxK
 Gb2wQLNa11RRmfTxK9kew40F+x7EcUHjrAZSXk/mHmsASUxCF+pO2OjVH3bY1HR596mX
 jLDDHEu3nfhKI+2Uxs8n//le5Ui8BBq+1u0sIuekB9oX1OPURrVI4RAWkwqbymLQtTEl
 uccH/XHYUNbr7Yb2L/wyiZwfRV32KQJNPBGZIkF/7qK+QPACSyjrQIdVnJGSZamjAueW
 w3fQ==
X-Gm-Message-State: AOJu0YwhTAtijULqWMLRQuyPRVrHaJApCSEIyEzCobAZqMW6UYcP3hRn
 CrJW9H9ZBJtJUi/wBAJLXZdz+u09vej/AFe/dXK6HuuqPErZmDXpL1Sw0AE9uOnAIu0jPMj+AZH
 MMFrsFpk/ueCe2tCFQjAzs1tShgRhKLHBoFNcKqUD4eSIvHRr/pQoEx5WqswziNpTRNM8TbrexY
 JdLk8I9T+KWvSwEHlgFNgwiaODVWqppq884ah5oaYPEsE=
X-Gm-Gg: ASbGncsIJgOtCV4TR1OoGSJMNa6zGEvYFALaAUBBwgF77nflUnFLTEbz923mEEMF7nj
 /ALjYuMMxX0i3XvXHrtfvXsX/PS43WrFAxRdAWZBJ4AQuXaQhiM2wqK5NlAVL22gcj5Dqc74Giy
 nu5W4RPoyUM0w63//Ak0IrdXWxb7KNcfH+R22LtHd9lx2VT/n9CxoBY/r/Cv9g/NtrZftIa9SmI
 wrXgdyqRqoKZIUgeMMqGT0MIe6d1Tw250vGNeAhj0F3+tYLrmA4D7ECQ7TroyZnQpSI6oqiurfH
 e5kadyEJopZGvMSIEsnMYxnT4H2fpHQ3r55AqpVW2VDdTl33WjDSVgKRdCDKGl6yoLLlkpzfV5Z
 eK/Mk572hMLQ=
X-Received: by 2002:a05:600c:524f:b0:45b:8453:d7e with SMTP id
 5b1f17b1804b1-45b85526a68mr203942815e9.6.1757068602377; 
 Fri, 05 Sep 2025 03:36:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYacQgGtLUHklmXAMKA9NtrY78SLmncEs54gilRcHMhxwZ+BDRjutRJXGFHlG/bIz/lRw3xQ==
X-Received: by 2002:a05:600c:524f:b0:45b:8453:d7e with SMTP id
 5b1f17b1804b1-45b85526a68mr203942385e9.6.1757068601883; 
 Fri, 05 Sep 2025 03:36:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3dc1cd4a7d2sm11196918f8f.33.2025.09.05.03.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 03:36:40 -0700 (PDT)
Message-ID: <28332ba8-976b-4bae-8ea7-7843b410a450@redhat.com>
Date: Fri, 5 Sep 2025 12:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 15/15] hw/arm/smmu-common: Add accel property for
 SMMU dev
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, shameerkolothum@gmail.com
References: <20250714155941.22176-1-shameerali.kolothum.thodi@huawei.com>
 <20250714155941.22176-16-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250714155941.22176-16-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jnCb20VS-o2H0GmhbxBPcpdH7scDq6oFZN6HcT_y8bQ_1757068603
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 7/14/25 5:59 PM, Shameer Kolothum wrote:
> Now user can set "accel=on". Have fun!
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmu-common.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 6a58f574d3..3e8783670a 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -1022,6 +1022,7 @@ static const Property smmu_dev_properties[] = {
>      DEFINE_PROP_BOOL("smmu_per_bus", SMMUState, smmu_per_bus, false),
>      DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus,
>                       TYPE_PCI_BUS, PCIBus *),
> +    DEFINE_PROP_BOOL("accel", SMMUState, accel, false),
would be nice to add some documentation as done in
4526687bf126 ("vfio: Add property documentation")

Eric
>  };
>  
>  static void smmu_base_class_init(ObjectClass *klass, const void *data)


