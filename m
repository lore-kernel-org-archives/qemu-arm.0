Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2484021dyb;
        Mon, 23 Jun 2025 04:32:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNBgsXPEOIn3lDA1GI8Q6Q2DVlZpcLxc0fIdgERulRLNB+HEmBN92WIH3femYkG9svb2mBSLpoC4akng==@linaro.org
X-Google-Smtp-Source: AGHT+IG0kFo4UJRlJss4DrYWdFzkXZQe8GioAsNC5NC8UjzemCSxjSRE6HBJOcKObsx0vaI6yXTG
X-Received: by 2002:a05:622a:a1a:b0:494:b1f9:d683 with SMTP id d75a77b69052e-4a77a256f97mr216043481cf.49.1750678370825;
        Mon, 23 Jun 2025 04:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750678370; cv=none;
        d=google.com; s=arc-20240605;
        b=TrWRO5ImluLouLiRSxj9wmLjZGfBLgEEBCWj0Fwo7NNwWDacBv/+NWcjXnL5h5t9V5
         ne90VsYCg6kXxLvJQxa6r5AfLJ51zYx6c77+UsQ1AaGtuZiioETY69FtrBnppOQzENmr
         aQxQJRUVSwXtlPLZ5rnHeuyvcxzpnI+GVBxegSxzSxVmHgwco4PlmtWiN6pyemsSMToV
         bfkk8CuMM2y6bNO88PiYvk+zS5fiDmd5QOIcW9TaFllSUXtpHs+Q/iK3BFGtF+nW5ywC
         krLr1RR7kAtV2Tp+Cb0mhO+APIlRAFcE0x542fYfL4JinAXYJFAsfJmPVGMRPIbKxk61
         Xy9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=EBW+5HuEb7bK4lD/J79fWUqyfsg1kOGM1mDpejaU7uE=;
        fh=nDSQDZidiGeJ2daiUwC1/Yd3QXQYWxkzypgrkUaKy1k=;
        b=L9fYr8WpLZ2ruVLAALALFsa53NEIZid+6Hmc8k6arvJf6RekDATIfzdm7nsGWB1/30
         /i/Ck1TYvKewqKIXLC2I4drmY1GdM862HMOmJWTs1JvZGFy8UpX774B+2XfNaZU1W68P
         GK5jsaGKJfZsZz39RbU1zocJR6XSaE2JwrDPs5yCNQ81kJ71kCrFCyMAVIb6uD15sGSb
         AtUtVkZLYJI9L7CvJsyzAD+FucsQKo9mFAd0w5sgIYc8ODBIN4z+68s3m8FRH80yadh+
         oRs8pm0vjtJszhaFPIYUxcFcV9Zb6/jnsGsivAOB4FUWrfZ+GSYz01KI76jyU8w6z+pQ
         Wxnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a77a0e6863si79989871cf.582.2025.06.23.04.32.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jun 2025 04:32:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uTfPf-0000eY-Lh; Mon, 23 Jun 2025 07:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uTfPZ-0000eC-8Z; Mon, 23 Jun 2025 07:32:29 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uTfPW-0002aV-DU; Mon, 23 Jun 2025 07:32:28 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bQm8441cVz6HJxV;
 Mon, 23 Jun 2025 19:29:40 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 741AE1402F6;
 Mon, 23 Jun 2025 19:32:07 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Jun
 2025 13:32:06 +0200
Date: Mon, 23 Jun 2025 12:32:04 +0100
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 <linuxarm@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <nicolinc@nvidia.com>,
 <ddutile@redhat.com>, <berrange@redhat.com>, <imammedo@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <gustavo.romero@linaro.org>, <wangzhou1@hisilicon.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v5 01/11] hw/arm/smmu-common: Check SMMU has PCIe Root
 Complex association
Message-ID: <20250623123149.0000703f@huawei.com>
In-Reply-To: <20250623094230.76084-2-shameerali.kolothum.thodi@huawei.com>
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
 <20250623094230.76084-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
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
X-TUID: SEa8bPv2/T6o

On Mon, 23 Jun 2025 10:42:20 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> We only allow default PCIe Root Complex(pcie.0) or pxb-pcie based extra
> root complexes to be associated with SMMU.
> 
> Although this change does not affect functionality at present, it is
> required when we add support for user-creatable SMMUv3 devices in
> future patches.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
