Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp892976lfb;
        Wed, 18 Nov 2020 13:33:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUliF9BxtXSTw5MpYQFtodlTHgORYTNG2ypCg2yeSRRHrJKGyU9T7+1tEhCrQlnSzUDl3b
X-Received: by 2002:a25:cfcf:: with SMTP id f198mr12403350ybg.362.1605735221588;
        Wed, 18 Nov 2020 13:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605735221; cv=none;
        d=google.com; s=arc-20160816;
        b=zXtv8ogfakuLULauYSdIRj/eNzY5LzdB86Qlg3eU/XuVV2rOh/iFc7NP2GeyfQGdiW
         DdG2+H/+hpkydYx47zjEe9vbVpww1iGijxLPzfFYkBAb95VaNP2Q8TFrrEczb9Mff4Y+
         o9X3GNTA58r6EL/QD5PWKSfOolIwGz4ynghrOACtXL6R1UGJJRMNBcIsvJIZWdrgfCUu
         hZe0gbvuOxTmhjRbdXE6+whwKCSQwlQUU2IzBTS2CP/x1NwzADWDgX5lUE4rNVQipAL+
         jsa3zB65QzMs7hIm6gJ74ODT4Wg1HDJ3Hzg6oLBhUerQckilsO0jkerGmYu06d9zkfqZ
         QSHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:dkim-signature
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=iZy2jnKCo6uVy6XoVK4BTiUnT47dLE0/jlWtYW+n1o4=;
        b=yJwAZdnUtLjsRpFAS+y56t1nBO/phnwArwvF18LAQShjwpohUOyfFW1m3MewEmcEb/
         wicEsu0N8cBl8uD2lyTDn8rvlXGYbDilassUK4CJeF9tLzzKldxAWgoUSLulRtOkVLrK
         m/k1CF+EcfQQl4AWALgFLN62/ONhXS/MyvD3R6wu0klME/TAmyWClO6ncHPqsc2Qp7Zz
         LvRJ5rOjBfQ83UBEF7Z04pvLzdZtOucwFPOZfbRrWAJT9UFrxj1jwDyTDZZdcz0cjFaO
         EwaQOLyMqRG7wOfVV+EKB08UgWaLKqK5Um/wTmxhgvg7k1+II4B8ZH6vL2bR4r931ei8
         uhhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nvidia.com header.s=n1 header.b=c8z4vMsi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nvidia.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j65si23639804ybj.137.2020.11.18.13.33.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Nov 2020 13:33:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nvidia.com header.s=n1 header.b=c8z4vMsi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nvidia.com
Received: from localhost ([::1]:59508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfV5A-0005BN-E0
	for alex.bennee@linaro.org; Wed, 18 Nov 2020 16:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kfV1s-0003s6-Tg
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 16:30:16 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:12575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kfV1q-0001hJ-L1
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 16:30:16 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fb5925a0001>; Wed, 18 Nov 2020 13:30:02 -0800
Received: from [10.40.103.11] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Nov
 2020 21:30:05 +0000
Subject: Re: [PATCH RFC] vfio: Set the priority of VFIO VM state change
 handler explicitly
To: Shenming Lu <lushenming@huawei.com>, Alex Williamson
 <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20201117014050.1385-1-lushenming@huawei.com>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <7a9289ac-a28e-d9ff-a267-f1e2895dd078@nvidia.com>
Date: Thu, 19 Nov 2020 03:00:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201117014050.1385-1-lushenming@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605735002; bh=iZy2jnKCo6uVy6XoVK4BTiUnT47dLE0/jlWtYW+n1o4=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=c8z4vMsi70tcv6i02VXRLSxhGWA7gPuRyrwilVfUw2Z5N3aFuJUBlfPKBVr1VEowW
 h/73V9aY7qPrCy/t3YvxPymfL30zfbYqyEMQRatT0CRZypFJWkOySXRTPcU9MOd4Fx
 jmM5zHH4iP944mS/Et+EOW4pz32zHz9LUvhUlqFKiu7K0hgkYR8sz+674uDuNNM1GM
 UPMjfXlS3xFn2KDd2UUFFvWiq7EpgHXN9c1EQ8rhHBB/pVE8u6PK3adJ9iND093vSs
 jE2e5VW0phvTXPOuN4F8Fi8SyMXelCKgGw1STjHJAHGajQm6yijEy035gUiUqjN+tb
 OPGju8a3gH34w==
Received-SPF: pass client-ip=216.228.121.64; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate25.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 16:01:23
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Neo Jia <cjia@nvidia.com>, Marc Zyngier <maz@kernel.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DnVyhhQb7f6w



On 11/17/2020 7:10 AM, Shenming Lu wrote:
> In VFIO VM state change handler, VFIO devices are transitioned in
> _SAVING state, which should keep them from sending interrupts. Then
> we can save the pending states of all interrupts in GIC VM state
> change handler (on ARM).
> 
> So we have to set the priority of VFIO VM state change handler
> explicitly (like virtio devices) to ensure it is called before GIC's
> in saving.
> 
> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> ---
>   hw/vfio/migration.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 55261562d4..d0d30864ba 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -857,7 +857,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>       register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
>                            vbasedev);
>   
> -    migration->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
> +    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
> +                                                           vfio_vmstate_change,
>                                                              vbasedev);
>       migration->migration_state.notify = vfio_migration_state_notifier;
>       add_migration_state_change_notifier(&migration->migration_state);
> 

Looks good to me.
Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>

