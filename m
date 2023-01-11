Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3998244ejc;
        Wed, 11 Jan 2023 05:37:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvBM9P99c8RJrj2j7+X1SS+I35SyZegxDOTu2S+fBy3oHUsjE3mg4q5O9gYAPP7zsMcLW/Z
X-Received: by 2002:a0c:fbc7:0:b0:532:2dbb:30e7 with SMTP id n7-20020a0cfbc7000000b005322dbb30e7mr3608786qvp.5.1673444241296;
        Wed, 11 Jan 2023 05:37:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673444241; cv=none;
        d=google.com; s=arc-20160816;
        b=QzuCWecyd33BUEDFE0R/P5r6TAmYG5LUCKnzMLcVgksMDXFIP9kYbjq/4Rpu3wOsIx
         a6ENxhpnISQIBTAcOAXo/TLlQ6bEgKMP4ltpD9onzeLswSzumk40p3ibwhHNFyLypUYu
         r6lhVPQ41o/XxZigTnKg2Ca0ssOh0ESQwzAD2DWJ8uRtxhLCvuEa6xg4BIrhWNuHQaDc
         6fuaG0IHTV1tu0x6JPkDbMrCkgUOooLv7j9wqwG04sfVX23kFUqfw/JemMhrEe1cWrYJ
         9sBvLpcky27enaXhlXsrwiCh/670v3w1l9ebK6KDPJ3IGFXD8qiylEKayQ5l1b0mo4wR
         wpDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject;
        bh=OcRdNzd1C2KMA4AVxZTRlqK8tCqDMdSf6ZIpq9KPHrc=;
        b=kiM9Iqk0VS4YMWQbVE707sY/XXV8KYpwV3xmjs5GW+wAcj3xZXORvcvdccnSTKxMzX
         6Il00fAK4CZkJNY+ZxpdbXQ/xPnh+xpQOcbJMc+6MhpunJZVc/iZggD97U7GHISUU4gK
         pesrtbyfT9XxRIDnnThdkCK3RcMtATcU69/2qGRY1296dQG5UMA681ej820iO/L4isY8
         AmULFCm4zme+E1tYp+wC7L0U+JEi9hyk1XAhjYWZoOWeEMVNEKhBhNwdLkgA3HQB1R64
         W+30XTCHDc1e+yhxxf4Gq4oM2qKtsWRyIAU9oZEnnACbJzKJeAF5faIK0VAF4dUPi3kb
         grIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj19-20020a056214529300b005322c03e3a6si6129808qvb.557.2023.01.11.05.37.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jan 2023 05:37:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFbGj-0007sZ-15; Wed, 11 Jan 2023 08:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1pFbGg-0007rZ-Ko; Wed, 11 Jan 2023 08:35:50 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1pFbGd-0003n3-M0; Wed, 11 Jan 2023 08:35:49 -0500
Received: from kwepemm600007.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NsT9031mMzJqDj;
 Wed, 11 Jan 2023 21:31:16 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 11 Jan 2023 21:35:23 +0800
Subject: Re: [PATCH v3 2/2] hw/arm/virt: Make accels in GIC finalize logic
 explicit
To: Alexander Graf <agraf@csgraf.de>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 <qemu-arm@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Cornelia Huck
 <cohuck@redhat.com>
References: <20221223090107.98888-1-agraf@csgraf.de>
 <20221223090107.98888-3-agraf@csgraf.de>
Message-ID: <615a0ee5-1a0d-1cd8-cd16-ac076d6db7fc@huawei.com>
Date: Wed, 11 Jan 2023 21:35:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20221223090107.98888-3-agraf@csgraf.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=yuzenghui@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xhPQKhPLTWHV

Hi Alexander,

On 2022/12/23 17:01, Alexander Graf wrote:
> Let's explicitly list out all accelerators that we support when trying to
> determine the supported set of GIC versions. KVM was already separate, so
> the only missing one is HVF which simply reuses all of TCG's emulation
> code and thus has the same compatibility matrix.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>


> @@ -1938,6 +1939,9 @@ static void finalize_gic_version(VirtMachineState *vms)
>                  gics_supported |= VIRT_GIC_VERSION_4_MASK;
>              }
>          }
> +    } else {
> +        error_report("Unsupported accelerator, can not determine GIC support");
> +        exit(1);

Looks like qtest will use arguments like '-accel qtest' and a 'make
check-qtest' triggers this error_report() on my box. It'd be good if you
can have a look (as I really don't have much knowledge about qtest..).

Thanks,
Zenghui
