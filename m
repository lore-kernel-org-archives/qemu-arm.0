Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1779570njc;
        Mon, 16 Jun 2025 04:13:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHKvmNvAL2671j+PAIoI2KFOVctzK9QtYtdqo0JDNB+/JLwXuR71bTar/lKsfSntnrOWYQNFaFlOnbDg==@linaro.org
X-Google-Smtp-Source: AGHT+IFFmamN2U2Em/Pm9e0/D3Fiy/+WbOrdVn6I+ISLEfgy0eXz3vtSU+KAic2melGNmkimlgcV
X-Received: by 2002:a05:622a:120b:b0:4a5:880d:ee6 with SMTP id d75a77b69052e-4a73c4fcebfmr157241851cf.3.1750072420202;
        Mon, 16 Jun 2025 04:13:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750072420; cv=none;
        d=google.com; s=arc-20240605;
        b=jMY3Sz47UUUcz9Z2eaUnx6SVAmGgWNPDHxv3pGRStnGUSxUYuRB+fOESPCOTKuqRIp
         rocC/xrFoX6pWKpI6W59uhTFAuCbWcxEwwnY14TgQKc3ERyW7H4r/IRkENPybEJwOzzD
         bKVHGDmCEv4W29krNPXf87jdn9KzsS2lNiP2C90vhTX+xrNKb5juH7xx8rRtDt0wNdxx
         BkCRGRvugn+ulpFc2Y3T8/uGLAgUIy6vvfEwgFSiUCEr48ZIuLtEKsahsdUfx/Lsrzn6
         hsMz9E6u66LXZbY1pLjHeV1n6N3a4yjygPqQSeTDiv+F4WaEl2AmA8CDyUJRBEfOL9Pd
         ji5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=UefArCooobiw5sa3sFR45Wbn5DLMuarv/c3Bz/Y4tEU=;
        fh=aA8gsM5QP8IJIk1ptJlCXNxyLIMaAhKHt/Cf0Wq9DRk=;
        b=Nm1GJpiNJhOqus4ocy+H3TdJTeUY44wdu66bNavMaMyzLtMpLiDqn523KUZ0EAW59f
         jLXCwCHOyrJKr/a3Biql38zhtea96Od5pEh1WvBE9iXYd0R8SredzFs/s6vfnHZjNeIP
         ndcpMTmq0UfrAF7ku91unUx88YzJ3jQ3gPEt6xnv1j4dso9hi997mqeTcNLVPzOEkFfz
         LtUq6ER5A6m6IZIKkRpEpoNPh/1RgvrAQTR2leJfiXJIZg1NZfTGJTlHyeIOstwf5EHf
         D1W7w8JLUvh21/SVpLejTWftyAy8QuRc6kNXbe9kJ2/K/S+7kUPATuW21wlUTOrVo10t
         vCkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a47d883si95904441cf.197.2025.06.16.04.13.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 04:13:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR7m6-0003Qe-KF; Mon, 16 Jun 2025 07:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uR7lv-0003Nm-Qq; Mon, 16 Jun 2025 07:13:04 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uR7lq-0004Ga-Gg; Mon, 16 Jun 2025 07:13:03 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bLS5D2PsHz6M56J;
 Mon, 16 Jun 2025 19:12:16 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 654A8140119;
 Mon, 16 Jun 2025 19:12:48 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 16 Jun
 2025 13:12:47 +0200
Date: Mon, 16 Jun 2025 12:12:45 +0100
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 <linuxarm@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <nicolinc@nvidia.com>,
 <ddutile@redhat.com>, <berrange@redhat.com>, <imammedo@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v4 7/7] qemu-options.hx: Document the arm-smmuv3 device
Message-ID: <20250616121245.00005b4b@huawei.com>
In-Reply-To: <20250613144449.60156-8-shameerali.kolothum.thodi@huawei.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-8-shameerali.kolothum.thodi@huawei.com>
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
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: PBOsxnigbVqr

On Fri, 13 Jun 2025 15:44:49 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Now that arm,virt can have user-creatable smmuv3 devices, document it.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  qemu-options.hx | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7eb8e02b4b..3edbde45bb 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1226,6 +1226,12 @@ SRST
>      ``aw-bits=val`` (val between 32 and 64, default depends on machine)
>          This decides the address width of the IOVA address space.
>  
> +``-device arm-smmuv3,primary-bus=id``
> +    This is only supported by ``-machine virt`` (ARM).
> +
> +    ``primary-bus=id``
> +        The PCIe Root Complex to be associated with.

Hmm.  Root complex or host bridge?
I think an RC is allowed to have multiple heirarchy and hence multiple
host bridges. Figure 1.2 in the PCI spec. So my gut feeling is this
should be host bridge. 


> +
>  ERST
>  
>  DEF("name", HAS_ARG, QEMU_OPTION_name,

