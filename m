Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3288826lfg;
        Sun, 28 Feb 2021 21:58:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzG3QvS85PyWrNJEPrmjtzq04+QG+Vkzg7sRUXDuWk+wHTKAM4gexGwSLDLJCX64pEbcF6c
X-Received: by 2002:a25:1883:: with SMTP id 125mr20670410yby.465.1614578291453;
        Sun, 28 Feb 2021 21:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614578291; cv=none;
        d=google.com; s=arc-20160816;
        b=M3FmgHOiq3EJmxXIzzj3gyDyYfGMsFZKwImDmcPgBdceaHRSCAG6kwNVioHYese1IS
         c/KT1ELEwesFbsa9ChJl7qoI+Xrvz4sR6FqJb2aPhTnpQX0eQXcuzHhzkoe51U9lnx+Z
         qf8fRBO9uOmOB2rAMowRbyTL3/DgYh11vOVDGdr38Wqg26j/EphSq7q5rQgjOdf4csUs
         XnVDf0Rjz/oYJMThEiqlY2zjcFYr+K3gSM6xUSGaOAKqWf6s6/9pz5u5bMrYcuLOVQlz
         ktmih4iZZe4brygpQBvTaOyNzRXO4wihlfqypxwlmikhRO5Mp/ftOHzprSxT0A6qTpdl
         m2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:dkim-signature
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=3QbhSDux7NC7EWfd6bApbwNgJ5uePxGuBz1403G956w=;
        b=fb4FcYgQAuHT+REpuBOMEQZx35/hIvsu0xeQ4fjOm9U57EmdcsKgvXYW7bOkejrjfj
         9owuGvGYu8pd2rhWTQwPt5dWA0ttnUELSNF7qFR4jE4E7UXaEHy19cRiez3BHBtLMvvY
         SaV9qTqdyYiFWW473xbpFXCSrHFNELncEd33JLxSzp4t/ubuiARJgelDosUD6D8Glg7G
         EpAm6C4w5vFuytm2J5z0BTKj+0vqDnNBFINgPvDH8iawh+6Uk/QvWaBcTKbwonBOUAWC
         9aiASdinPc5xB5Tsat7DHHIn6zgnT9Y3w3OA1YZ35ycsomnLp0luBBA/Do/Tl5frYhbp
         IJTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nvidia.com header.s=n1 header.b=jjIN4nXd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m137si16538901ybf.191.2021.02.28.21.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 21:58:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nvidia.com header.s=n1 header.b=jjIN4nXd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nvidia.com
Received: from localhost ([::1]:54616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGbZK-0000Gf-Qg
	for alex.bennee@linaro.org; Mon, 01 Mar 2021 00:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1lGbZ4-0008Qs-Jy; Mon, 01 Mar 2021 00:57:54 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:5615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1lGbZ2-00031H-Hu; Mon, 01 Mar 2021 00:57:54 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B603c82590000>; Sun, 28 Feb 2021 21:57:45 -0800
Received: from [10.40.102.108] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 1 Mar
 2021 05:57:31 +0000
Subject: Re: [PATCH v3 1/3] vfio: Move the saving of the config space to the
 right place in VFIO migration
To: Shenming Lu <lushenming@huawei.com>, Alex Williamson
 <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20210223022225.50-1-lushenming@huawei.com>
 <20210223022225.50-2-lushenming@huawei.com>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <6e88241a-3d4e-9e8b-ed10-a8f2ba7179b1@nvidia.com>
Date: Mon, 1 Mar 2021 11:27:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210223022225.50-2-lushenming@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614578265; bh=3QbhSDux7NC7EWfd6bApbwNgJ5uePxGuBz1403G956w=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=jjIN4nXdzhYQKObuLh3VROAYSOJxS907UaOqRWWCXCsVauIKZi/xv03fq3sy8qJp/
 Wu62Fnl4bwXssHHQFRA6zneoVHuoI3mM1tuQL7AgqkOlxpY9xc3lljXNB8wO9dDoQ0
 OtTvKrrf/So8PrqAooxTvkHqGtJCoQY7EYw6PsMmDCiLun/ItuKgL4nJHefi+vefoP
 i4AV/WsoErsBXlI4ZKCUbyUcWqc1LyAs11q2h4cDI4A1j3OkpTfsiUNQPtO9lmjcmF
 BPt9ZS/FM619J33FNXhtBvP5TfT1FT8WgOj+3PepWaCCNJJcjdtPahBZmBRtxKuYH6
 d4i6FfWvtPCVA==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Eric
 Auger <eric.auger@redhat.com>, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oUs/7+cTIz4Y


Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>

On 2/23/2021 7:52 AM, Shenming Lu wrote:
> On ARM64 the VFIO SET_IRQS ioctl is dependent on the VM interrupt
> setup, if the restoring of the VFIO PCI device config space is
> before the VGIC, an error might occur in the kernel.
> 
> So we move the saving of the config space to the non-iterable
> process, thus it will be called after the VGIC according to
> their priorities.
> 
> As for the possible dependence of the device specific migration
> data on it's config space, we can let the vendor driver to
> include any config info it needs in its own data stream.
> 
> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> ---
>   hw/vfio/migration.c | 25 +++++++++++++++----------
>   1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 00daa50ed8..f5bf67f642 100644
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
> +    ret = vfio_save_device_config_state(f, opaque);
> +    if (ret) {
> +        error_report("%s: Failed to save device config space",
> +                     vbasedev->name);
> +        qemu_file_set_error(f, ret);
> +    }
> +}
> +
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
