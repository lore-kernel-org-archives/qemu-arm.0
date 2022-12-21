Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4843989ejb;
        Tue, 20 Dec 2022 19:35:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsSy0yuecQ84feADYnPb3NMYQeCr/LF8ENeupBs5ncwVHkLfMUootfcH6XYnUCZ+TbkL+fm
X-Received: by 2002:a05:6214:14e7:b0:4df:d8a9:ddfb with SMTP id k7-20020a05621414e700b004dfd8a9ddfbmr500450qvw.42.1671593755209;
        Tue, 20 Dec 2022 19:35:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671593755; cv=none;
        d=google.com; s=arc-20160816;
        b=gTvZhegq3/q/V8DUwOM4gOYXnGImROqAb7LyFd+qbATluM4emL/171AL6iigfq0OHB
         YI5U2hVykhgNu56X77LtzN4IMNE5uW/esnurGr9ZDo/yDlnWQ5yQ+FjLWPV2TgYh8sSJ
         pUDIzNiKB7cadTSgwmoyMXX2zSweo4NvSlFEt7UeP7Ovdd9HfZXiqFSA7vA8iYWokx0z
         JawDsIB63VggMlHYlU0zcQ48ghDY0e0yoece3cROCe/cxyddxLLU8Etx/rmD2r7v3UhF
         OR08cBBcXfLpBGncV+ykqFyTqnJGRCEtRnwET+bhGL8CkooCTh4AJiKqpsG7bvL4cFFT
         sclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject;
        bh=vMyrlfLBd/9lRdK7CPYDng/taLWGVQCO3/WR9YWTLKo=;
        b=sxaOUMrZfFhrHRrTaglKsXGHMe1XlK/ooYP8UJsaiXkvQRNquTfvrwvC5BSpsnxcMp
         4laL/O15cF53ERJrm6tsRrkdHh6+jATmvpySulJn+/QiiA5fIV8RrJ5RnyEXeEaR/Nx/
         9MKaOwoOTTHhaQyElLa+hQd/cDDqy3u1F69sOACiFeykbfe3ZVbEjND5JGN2bKAWlA7/
         ReiLIWT+ObRCoazYJ7Ns8hK/DAP2jvPwQ8RWp1hOIlF27CBxmz4gHdxImb25zULi9POV
         wqBrmbGe6a/5G79ZjAYPJ76GHIzQp6AYLePxMGIaDcTe/xu8kdgwxIlK5mpc2I1a3kW6
         XmGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hu11-20020a056214234b00b004c738885744si6026862qvb.64.2022.12.20.19.35.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 19:35:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7ptK-00047B-V6; Tue, 20 Dec 2022 22:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1p7ptJ-000457-87; Tue, 20 Dec 2022 22:35:37 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1p7ptH-0006OF-Co; Tue, 20 Dec 2022 22:35:37 -0500
Received: from kwepemm600007.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NcJrx1Rf8zHqYy;
 Wed, 21 Dec 2022 11:31:45 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 21 Dec 2022 11:35:29 +0800
Subject: Re: [PATCH 1/2] hw/arm/virt: Consolidate GIC finalize logic
To: Alexander Graf <agraf@csgraf.de>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 <qemu-arm@nongnu.org>
References: <20221220230414.47876-1-agraf@csgraf.de>
 <20221220230414.47876-2-agraf@csgraf.de>
Message-ID: <2e2a7246-5b79-637d-cbfe-65bc686d523e@huawei.com>
Date: Wed, 21 Dec 2022 11:35:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20221220230414.47876-2-agraf@csgraf.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=yuzenghui@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gJzGG6Fll9rF

On 2022/12/21 7:04, Alexander Graf wrote:
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index c7dd59d7f1..365d19f7a3 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -109,12 +109,12 @@ typedef enum VirtMSIControllerType {
>  } VirtMSIControllerType;
>  
>  typedef enum VirtGICType {
> -    VIRT_GIC_VERSION_MAX,
> -    VIRT_GIC_VERSION_HOST,
> -    VIRT_GIC_VERSION_2,
> -    VIRT_GIC_VERSION_3,
> -    VIRT_GIC_VERSION_4,
> -    VIRT_GIC_VERSION_NOSEL,
> +    VIRT_GIC_VERSION_MAX = 0,
> +    VIRT_GIC_VERSION_HOST = 1,
> +    VIRT_GIC_VERSION_NOSEL = 2,
> +    VIRT_GIC_VERSION_2 = (1 << 2),
> +    VIRT_GIC_VERSION_3 = (1 << 3),
> +    VIRT_GIC_VERSION_4 = (1 << 4),

This would break the ACPI case. When building the MADT, we currently
write the raw vms->gic_version value into "GIC version" field of the
GICD structure. This happens to work because VIRT_GIC_VERSION_x == x (by
luck, I think). We may need to fix build_madt() before this change.

|static void
|build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
|{
|    /* GIC version */
|    build_append_int_noprefix(table_data, vms->gic_version, 1);
