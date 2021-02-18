Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8212935lfc;
        Thu, 18 Feb 2021 06:42:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvF49vvEXKFLOLnv1ZOkU85jPLeSCyuo7xOqtlXY+pwK+r/jBwsd60v5Af5O7YtlPIXbAx
X-Received: by 2002:a25:b883:: with SMTP id w3mr6807732ybj.321.1613659356768;
        Thu, 18 Feb 2021 06:42:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613659356; cv=none;
        d=google.com; s=arc-20160816;
        b=qaG4rkpm4XEJKaqr5oLaxSE73nEInoWZcPTwtdJbTsqF7K11KK5db69ShxW/QtkHsU
         WdCQIx6t/0m338b8DPYVL+WzOoQjO1Gk00Np3Jcb9aBzUcTE5072wQ/X83oT09HAGJqw
         6pvxmRW97tG8Q90RaRKSnTfh4SkIOVMbhnfqCPZ3e0v1DBbjgzsgKkVhRqDEn503KYZl
         u7C4+mqbs/T6jjYkN5pGP7pH9aUVIDY03Jro0ulxK2pUOduiZq3wOrQoUGdhMd8olsf6
         XdtHELu+uxXPFIT5nV4VBXKSd69pu6MASf2F76iJW9KyrkxeSBcaLgJKknq5sO0rE24u
         46xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:dkim-signature
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=pg46Rr6LdjUm3aq1jDKH3b7YebqljsxDTsVTky19sdA=;
        b=U/6Qf3BIfFEfb9JBP7Fm5uBMNGadgKnMGbZbX+lFGEquwmhHTCC7csVWjBiPKnG7yL
         vHjNcb5ajeQZ65p3WIaGGZetWUMwMIFYjtSMisBWx8y8lvGj/viRqfZ+fDCFH9C3nQQv
         UlEd0pQrgvzTr/mloIfJm2HpiPaK0xqjQ04d0I91twIh4A36CHHZQUJxDcGd1wfLYB3Z
         8i1VlDy9fuv9vdAloTd64PGDDaXcxOjhuo13gCJmFEwB56Fbg02dLJa1TnFe/mqiKZnG
         Qoshb6lUKWAn+41mIw2oIFm+tzU7dYeFHbO6Uq69ZW6JdZ6B08VQ6jDEtQw1GU+7qNeQ
         e1fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nvidia.com header.s=n1 header.b=PKqqZqPh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z95si7681273ybh.58.2021.02.18.06.42.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Feb 2021 06:42:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nvidia.com header.s=n1 header.b=PKqqZqPh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nvidia.com
Received: from localhost ([::1]:53852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lCkVo-0000gj-4a
	for alex.bennee@linaro.org; Thu, 18 Feb 2021 09:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1lCkVd-0000eU-FA; Thu, 18 Feb 2021 09:42:25 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1lCkVb-0001gu-6m; Thu, 18 Feb 2021 09:42:25 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B602e7cc80001>; Thu, 18 Feb 2021 06:42:16 -0800
Received: from [10.40.100.105] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 18 Feb
 2021 14:42:05 +0000
Subject: Re: [RFC PATCH v2 1/3] vfio: Move the saving of the config space to
 the right place in VFIO migration
To: Shenming Lu <lushenming@huawei.com>, Alex Williamson
 <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-2-lushenming@huawei.com>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <b51b7282-ad47-01d1-7b83-834aead08d76@nvidia.com>
Date: Thu, 18 Feb 2021 20:12:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201209080919.156-2-lushenming@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1613659336; bh=pg46Rr6LdjUm3aq1jDKH3b7YebqljsxDTsVTky19sdA=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=PKqqZqPh/bILddOyHWdR9HNQH75Rk2omOT+oD3czLb+zVUtHNjUB+7aLjCByZSCNJ
 dcMmuh4+YZ4RVcefnfPPRXoy5+h8/UO3qr7L+iyLGaJONkLWhODmhgqWw/yqsebG0B
 QqFEzIIIye/UrxMoqjLOpYGgukBPiTT3MwaMM3KmMqO6lfJw0WgQWEI2kl7YQZBRsO
 6ctHQx5BvaR6HfCY/7ARmdCCsq8CGx5Znt6NoyqZMSN3sUjDQoBCrL//PFdHlNBs3t
 8Img1IoV1n/DMyE9HDmk7GH+bqkdRKwioqTGIYVw/53Q/macGlQuaDH7lVlcYaKcv7
 Ca+s2rUdIutUg==
Received-SPF: pass client-ip=216.228.121.64; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate25.nvidia.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xNWWUlR8zR/M



On 12/9/2020 1:39 PM, Shenming Lu wrote:
> On ARM64 the VFIO SET_IRQS ioctl is dependent on the VM interrupt
> setup, if the restoring of the VFIO PCI device config space is
> before the VGIC, an error might occur in the kernel.
> 
> So we move the saving of the config space to the non-iterable
> process, so that it will be called after the VGIC according to
> their priorities.
> 
> As for the possible dependence of the device specific migration
> data on it's config space, we can let the vendor driver to
> include any config info it needs in its own data stream.
> (Should we note this in the header file linux-headers/linux/vfio.h?)
> 
> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> ---
>   hw/vfio/migration.c | 25 +++++++++++++++----------
>   1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 00daa50ed8..3b9de1353a 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -575,11 +575,6 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>           return ret;
>       }
>   
> -    ret = vfio_save_device_config_state(f, opaque);
> -    if (ret) {
> -        return ret;
> -    }
> -
>       ret = vfio_update_pending(vbasedev);
>       if (ret) {
>           return ret;
> @@ -620,6 +615,19 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>       return ret;
>   }
>   
> +static void vfio_save_state(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    int ret;
> +
> +    /* The device specific data is migrated in the iterable process. */
> +    ret = vfio_save_device_config_state(f, opaque);
> +    if (ret) {
> +        error_report("%s: Failed to save device config space",
> +                     vbasedev->name);
> +    }
> +}
> +

Since error is not propagated, set error in migration stream for 
migration to fail, use qemu_file_set_error() on error.

Thanks,
Kirti

>   static int vfio_load_setup(QEMUFile *f, void *opaque)
>   {
>       VFIODevice *vbasedev = opaque;
> @@ -670,11 +678,7 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>           switch (data) {
>           case VFIO_MIG_FLAG_DEV_CONFIG_STATE:
>           {
> -            ret = vfio_load_device_config_state(f, opaque);
> -            if (ret) {
> -                return ret;
> -            }
> -            break;
> +            return vfio_load_device_config_state(f, opaque);
>           }
>           case VFIO_MIG_FLAG_DEV_SETUP_STATE:
>           {
> @@ -720,6 +724,7 @@ static SaveVMHandlers savevm_vfio_handlers = {
>       .save_live_pending = vfio_save_pending,
>       .save_live_iterate = vfio_save_iterate,
>       .save_live_complete_precopy = vfio_save_complete_precopy,
> +    .save_state = vfio_save_state,
>       .load_setup = vfio_load_setup,
>       .load_cleanup = vfio_load_cleanup,
>       .load_state = vfio_load_state,
> 
