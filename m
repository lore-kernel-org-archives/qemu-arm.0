Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1215513lfg;
        Mon, 25 Jul 2022 19:03:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1umXeh3ziQ82NVwUZVIevymE2Tl1poV6InSIx0fPzW/wdODDeiLK6lKRl1XjpkwLHbUWGMc
X-Received: by 2002:a05:620a:404a:b0:6b6:1f33:36ca with SMTP id i10-20020a05620a404a00b006b61f3336camr10680774qko.689.1658801008974;
        Mon, 25 Jul 2022 19:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658801008; cv=none;
        d=google.com; s=arc-20160816;
        b=0dnIqOisnEJh2LgSNyxu7f9zynWpDnB033peaeb7wHE7yOxCNbOTB3KDx9renBOSZM
         MhDsIr5kfU7seu5npb+mOWTWoDwSgDb/GNCmr5utRicZIIJmwkxihxN87dFtHKW9ezfe
         msOKPkULD3CcwfegGVC6D6nnVL6tL2Fjm4yu+vIpb2ya0ob7rIz0xcplxo70htcEis84
         G3QYqIORQkndvcwkfjh2+XVSMNjJadf4VeeGh+nmCxWdXxExgjaKAZv+4ugU8DIXIg2H
         P48lcd/km0VIa/p++EN37VCobQK4YmhifMph+9c0brxT0BCQ0cap2kVGf9YLcrPcs60P
         2DwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject;
        bh=iu8BNw14DLphszZc/rnCtjkErirdh7fHA4qICXXmtDk=;
        b=AP/eoTVe6dnMzcRXL4ancxM3OWwzg0uyRmkC9tfzc1358JzkqQSPo3lgz1W1kUH29s
         xfMudBTSGvLV8tyR0Yq6qB2eTrrVGIiHt02SOC3/MIuWFg6NAwzGTuRiF0RV/2HvENSE
         v/NVjBNWQ333BUEj+CVxscPtKanS9SFb4Uve5DRF8zNtHtXHJPXYzVMpEeWz4Y0r4ool
         tJOym/VF2kbdTe94vRvBAAcyehlk3v0T2xsxfryOhphk3gVv/d8UD7qxaqG3eO60gV1O
         UbWejWylBpS+9EyxaFze8eqiJa5RX4dZprir0gUZTa/hT6P3DyzJLPEyejzJiLShMbKA
         Eyvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15-20020a05622a058f00b00304a5c5f331si6334168qtb.595.2022.07.25.19.03.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jul 2022 19:03:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:46178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oG9uy-0002v3-B3
	for alex.bennee@linaro.org; Mon, 25 Jul 2022 22:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oG9tx-0002uo-VB; Mon, 25 Jul 2022 22:02:25 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:5163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oG9tu-00044M-Bg; Mon, 25 Jul 2022 22:02:24 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LsKrd6X2Wz9svL;
 Tue, 26 Jul 2022 10:01:05 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Jul 2022 10:02:10 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Jul 2022 10:02:09 +0800
Subject: Re: [PATCH 1/3] target/arm: Create kvm_arm_svm_supported
To: Richard Henderson <richard.henderson@linaro.org>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20220725181457.41083-1-richard.henderson@linaro.org>
 <20220725181457.41083-2-richard.henderson@linaro.org>
Message-ID: <8d493056-fc22-cc0a-29ab-15a810ff1c30@huawei.com>
Date: Tue, 26 Jul 2022 10:02:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20220725181457.41083-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=yuzenghui@huawei.com;
 helo=szxga03-in.huawei.com
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
X-TUID: qvqC7lY37Uvs

Hi Richard,

On 2022/7/26 2:14, Richard Henderson wrote:
> Indication for support for SVE will not depend on whether we
> perform the query on the main kvm_state or the temp vcpu.
> Mirror kvm_arm_pauth_supported.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/kvm64.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index d16d4ea250..36ff20c9e3 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -496,6 +496,11 @@ static bool kvm_arm_pauth_supported(void)
>              kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
>  }
>  
> +static bool kvm_arm_svm_supported(void)
> +{
> +    return kvm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
> +}
> +

Not sure if it's a typo. Maybe we should instead use
kvm_arm_sve_supported() which was introduced in commit 14e99e0fbbc6.

Zenghui
