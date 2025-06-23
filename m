Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2490908dyb;
        Mon, 23 Jun 2025 04:47:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+Er7vfIH5xOY8r5abSgmE92sKN4BEukhlKHSMwdZH3smxrX402L99QVyRBCDDQyKFJmkns5W3YOHNcw==@linaro.org
X-Google-Smtp-Source: AGHT+IGttzv1sBnqZLCrmhgptyWm/oacwKGffb4npXHXHHAF+HKccO50xNokrngwZ/2r8Ff0OPNZ
X-Received: by 2002:a05:622a:1305:b0:4a4:2c75:aa57 with SMTP id d75a77b69052e-4a77a23e729mr179710801cf.44.1750679271500;
        Mon, 23 Jun 2025 04:47:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750679271; cv=none;
        d=google.com; s=arc-20240605;
        b=TzxBiCz3/VWQd+DFkxE1Oem9Q6r8DMdGrs+WoGCtNBw8JHKiQ+LG3orxM6ZGMjAKYs
         DJKlbUPFacEH/aMvFN3vqz9HgRJqlKmjwIO2fvM660xhjqCXdLkln0aGIjNsuGF91IoV
         /B5R1ghJXrR0NKQkiLyIUjK8FPt95dk2UmMZrvlWXc8c9NgacZY6TufJTeI6YmjxijKN
         eTBLerozV1v/ahVrRS+rWIeETlSaK1nuLala+4WcdmKVyNvnfTyuKGqwrPsxTvyaEiBN
         um4tQA9UXqm9BK/wEaQWB3kCyFUsb11ixvUGchFnFubogqbNjA2QUjkY81T0G90ko7UF
         1WLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=up0W5JxS3WFMYI1UtmrcLAD3n3cPBIHfqaB6qPvB9ms=;
        fh=nDSQDZidiGeJ2daiUwC1/Yd3QXQYWxkzypgrkUaKy1k=;
        b=HUl6Dnwu2OE2oBbReIQioEpfFeUOQLzDlilxRQPjMMP1XfTtFt4kNyct5OI0fRBm+B
         Xom+CY2kIxHyBj1yiezlNTWyxFLcK6j8J5o01ExVj+KSS6JD8n9b/gKbg6pmwXb42ern
         eh0Q8TsmAc319gXp4X3LUOnt+GwhUsgeabtjJlokG/Viep3M8blrhO0Ve06bCDY9Nvjj
         nnOH6CMI3P4kHrbe/7+AJOrwCz17uWakorAzRppTLfhaGJ+g1YykLNzb4XyBexSBrO9K
         wFEgTfrFKk/l1yLRmdFj9rcRVbeDi4qP4ZKDPIJA493Ar2Lydeqjt9e84zFi7mxDmU+l
         641Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a77a0e6863si80230811cf.582.2025.06.23.04.47.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jun 2025 04:47:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uTfeM-0006nq-NV; Mon, 23 Jun 2025 07:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uTfeI-0006nL-4s; Mon, 23 Jun 2025 07:47:42 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uTfeG-0004Tr-2F; Mon, 23 Jun 2025 07:47:41 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bQmR04pTCz6L585;
 Mon, 23 Jun 2025 19:42:36 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id AAD921402EF;
 Mon, 23 Jun 2025 19:47:32 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Jun
 2025 13:47:31 +0200
Date: Mon, 23 Jun 2025 12:47:29 +0100
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 <linuxarm@huawei.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>, <jgg@nvidia.com>, <nicolinc@nvidia.com>,
 <ddutile@redhat.com>, <berrange@redhat.com>, <imammedo@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <gustavo.romero@linaro.org>, <wangzhou1@hisilicon.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v5 08/11] qemu-options.hx: Document the arm-smmuv3 device
Message-ID: <20250623124712.000058de@huawei.com>
In-Reply-To: <20250623094230.76084-9-shameerali.kolothum.thodi@huawei.com>
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
 <20250623094230.76084-9-shameerali.kolothum.thodi@huawei.com>
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
X-TUID: KeCdnbJEDmBT

On Mon, 23 Jun 2025 10:42:27 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Now that arm,virt can have user-creatable smmuv3 devices, document it.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  qemu-options.hx | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7eb8e02b4b..7d1a12f7ef 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1226,6 +1226,13 @@ SRST
>      ``aw-bits=val`` (val between 32 and 64, default depends on machine)
>          This decides the address width of the IOVA address space.
>  
> +``-device arm-smmuv3,primary-bus=id``
> +    This is only supported by ``-machine virt`` (ARM).
> +
> +    ``primary-bus=id``
> +        Accepts either the default root complex (pcie.0) or a
> +        pxb-pcie based root complex.
> +
>  ERST
>  
>  DEF("name", HAS_ARG, QEMU_OPTION_name,

