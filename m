Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2495289dyb;
        Mon, 23 Jun 2025 04:57:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKCU7AP3zWQpNQK7K78YC6UU7jCAzscD6kIImzDpsAywvO6WiZVwtNAkkfvOt1MAjiK/HsV+mYG+yv0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHf+Mq9goV2FMLbCmbYY34swucW31wp/Yfe019zuAESBanolD6Jbb7DgMBHaY8AIY1KzBGk
X-Received: by 2002:a05:620a:3186:b0:7d3:8da2:e9e2 with SMTP id af79cd13be357-7d3f991b6f3mr1743120085a.27.1750679870906;
        Mon, 23 Jun 2025 04:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750679870; cv=none;
        d=google.com; s=arc-20240605;
        b=gE9spVUUBbMl889w0WNpipF5AoEOBeHVRsTFS/mQHuggL6hU+FCgnQtxVmptI1JIUL
         oE5364ug60DMssQHvwUaAFE5utAhZUbo3UMKevg7m74nLpX2lZjYKOtONW0cPynrOAzf
         HpGp484eDgh3tuqPUlsZVZCwVJ9itcGVZUeWiimF44tWLn6wnWAzgaRLE66L2MswBs6f
         dmQLcUr763JeWsWgUMlFdL1I9Eocr1Sn048jSFW4ua/eUQWZ60/7Yp76CEEKaCIc+J2z
         OQ33kPI1XBIaz7EyAoCIZd4PSoFrOsRsOtsZg0zWU9fSRhp7TCgYzDryJ0wqKhyiSBwb
         AQmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=16yw/K4XXyBV0pihtCRMGjhWmHG/E+nwOIpdq94Y4u0=;
        fh=nDSQDZidiGeJ2daiUwC1/Yd3QXQYWxkzypgrkUaKy1k=;
        b=dpLxwklkECuBUnduc90pjYcBY4tXeLW7yD6T2QorRAuOKsdB+2fQkWk4DEwafVl3L8
         XOXv4KTaIl5lhUhhpOnKT75jITQ+2ULSmri7jgpiMSnaocjn3BEoMnTNOt8a0oRv2trG
         GqicFtoq8eClebBaNm0oTA6E400RATo+OtzHVx8sQVxmX7KnfZI9wEqgRi8tyx/E/lZG
         yqm4HBQ+FrL5pVWqwmejtiWtacom2Y1SdKP6GKtXN1PeW9Ipy0PFNJGtkPxIV4H/L59s
         hwSUf+m8UDBJ6rOPwvCZKulw72PM5OJK/snJAWH1317/z2OKeQkpxdqk03FDca+kiiiK
         6pcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f9a27fdesi748365385a.645.2025.06.23.04.57.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jun 2025 04:57:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uTfnr-0003N8-Uh; Mon, 23 Jun 2025 07:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uTfnf-0003Mc-O2; Mon, 23 Jun 2025 07:57:24 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uTfna-0005mN-HB; Mon, 23 Jun 2025 07:57:21 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bQml25WMYz6LD9h;
 Mon, 23 Jun 2025 19:56:30 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 669AC1402EF;
 Mon, 23 Jun 2025 19:57:13 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Jun
 2025 13:57:12 +0200
Date: Mon, 23 Jun 2025 12:57:10 +0100
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 <linuxarm@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <nicolinc@nvidia.com>,
 <ddutile@redhat.com>, <berrange@redhat.com>, <imammedo@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <gustavo.romero@linaro.org>, <wangzhou1@hisilicon.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v5 10/11] qtest/bios-tables-test: Add tests for legacy
 smmuv3 and smmuv3 device
Message-ID: <20250623125640.000044ab@huawei.com>
In-Reply-To: <20250623094230.76084-11-shameerali.kolothum.thodi@huawei.com>
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
 <20250623094230.76084-11-shameerali.kolothum.thodi@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-TUID: pd49JmzipUJr

On Mon, 23 Jun 2025 10:42:29 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> For the legacy SMMUv3 test, the setup includes three PCIe Root Complexes,
> one of which has bypass_iommu enabled. The generated IORT table contains
> a single SMMUv3 node and a Root Complex node with three ID mappings. Two
> of these ID mappings have output references pointing to the SMMUv3 node
> and the remianing one points to ITS.
> 
> For the -device arm-smmuv3,... test, the configuration also includes three
> Root Complexes, with two connected to separate SMMUv3 devices.
> The resulting IORT table contains two SMMUv3 nodes and a Root Complex node
> with ID mappings of which two of the ID mappings have output references
> pointing to two different SMMUv3 nodes and the remaining ones to ITS.
> 
In the ideal world I think you'd introduce the legacy test at the start of this
series so that we can verify nothing changed, then bring only the test for
the new stuff at the end.  Meh. I don't care that much as it's good to have tests
either way.

> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
LGTM
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

