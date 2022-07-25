Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp674605lfg;
        Mon, 25 Jul 2022 00:06:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sfNAqDeIWKXtBh14DQUA4pBf6EnzvDiQmnuhuu9+As+dL02jR15Vo++V7oG6SJD1mtJo9B
X-Received: by 2002:a05:6214:2464:b0:474:247b:e334 with SMTP id im4-20020a056214246400b00474247be334mr9573226qvb.32.1658732789377;
        Mon, 25 Jul 2022 00:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658732789; cv=none;
        d=google.com; s=arc-20160816;
        b=VXK+Y4D6qSRqsGhtYI8El/8OSWU18OBKxhAluhLxmPMUZUiimg7LjzcF+CP3Vl2+Dz
         wdj34ZUcQaDqu0QHP3XmFfpu7FRuB+Q6zOvQB7StB7k11XqsboaSKO+WIpKNUhpIME+C
         sTXTNohdFTuQyqEpIYzbIgO6YEwIuXjP0w1S4uaSF09S3YAP69kihCfJzVYokUO/6rfQ
         Qg8Ijiv18EZjuaw7CejldSbQVLzAjYWHn4DpgC65EFDcNCtAP+nahG2fvuXmsScdK9mm
         7Pfqz5unETR8fts/RgpOdb/4J1NgoTZA3phiZdYQI0RJ1wNxJYMxQnnbmuzxY9qZHhmn
         UyhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject;
        bh=RdxtrfYaXNd8Slg2usgAxmgIymHYI0Qf7XQzs3zrcIA=;
        b=WkSh3f3gQPeMF7hrIhkQ8HafJiKXKKhCSzV/IMrmVB8mEboae7dFmsDpcM2BTncVe+
         yX8btyz7OZIG9400Ok3sldGHGpFqFlnF6WErZ8nDtc9gPROGZlnhySR8k44cylQFzdSe
         TaFu+w63/5YK5G8v593DPhJygJbsxHFftku5A2c2svDuzUTN6ehzxIK+HxkZt4WXF7LC
         Coki6BFXeHdpKM9G8i/QP+Db1gq26lU7PdkwLrCO26UA9Tdv8vcD0hst48V268sKOsDB
         OhhJ49I21R3qO8/nGq6KwlgbGtmSG6n3axHaEXRRC5PPxaneRVoZpnEDDW9nZch/gVWZ
         YUEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g23-20020ac842d7000000b0031f1f5a69edsi5644948qtm.169.2022.07.25.00.06.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jul 2022 00:06:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oFsAe-0006zj-P7
	for alex.bennee@linaro.org; Mon, 25 Jul 2022 03:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oFsA8-0006xv-Dc; Mon, 25 Jul 2022 03:05:56 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oFsA4-0006pW-Vd; Mon, 25 Jul 2022 03:05:56 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LrrbZ1LJvzkWPs;
 Mon, 25 Jul 2022 15:03:06 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 25 Jul 2022 15:05:35 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 25 Jul 2022 15:05:34 +0800
Subject: Re: [PATCH v7 01/92] target/arm: Add ID_AA64ZFR0 fields and
 isar_feature_aa64_sve2
To: Richard Henderson <richard.henderson@linaro.org>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, <andrew.jones@linux.dev>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
 <20210525010358.152808-2-richard.henderson@linaro.org>
Message-ID: <8e2ac59a-af4d-0f2c-455b-b9ed07b1e56a@huawei.com>
Date: Mon, 25 Jul 2022 15:05:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20210525010358.152808-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=yuzenghui@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-arm@nongnu.org>
X-TUID: 4ymCpfyC4zcf

Hi Richard,

On 2021/5/25 9:02, Richard Henderson wrote:
> Will be used for SVE2 isa subset enablement.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Do not read zfr0 from kvm unless sve is available.
> v7: Move zfr0 read inside existing sve_enabled block.

[...]

> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index dff85f6db9..37ceadd9a9 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -647,17 +647,26 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>  
>      sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
>  
> -    kvm_arm_destroy_scratch_host_vcpu(fdarray);
> -
> -    if (err < 0) {
> -        return false;
> -    }
> -
>      /* Add feature bits that can't appear until after VCPU init. */
>      if (sve_supported) {
>          t = ahcf->isar.id_aa64pfr0;
>          t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
>          ahcf->isar.id_aa64pfr0 = t;
> +
> +        /*
> +         * Before v5.1, KVM did not support SVE and did not expose
> +         * ID_AA64ZFR0_EL1 even as RAZ.  After v5.1, KVM still does
> +         * not expose the register to "user" requests like this
> +         * unless the host supports SVE.
> +         */
> +        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
> +                              ARM64_SYS_REG(3, 0, 0, 4, 4));

If I read it correctly, we haven't yet enabled SVE for the scratch vcpu
(using the KVM_ARM_VCPU_INIT ioctl with KVM_ARM_VCPU_SVE). KVM will
therefore expose ID_AA64ZFR0_EL1 to userspace as RAZ at this point and
isar.id_aa64zfr0 is reset to 0. I wonder if it was intentional?

Thanks,
Zenghui
