Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4357554ejb;
        Tue, 20 Dec 2022 06:19:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsrYjo8efwcT0eO7GdDtvcu1sKvQL+DzFKOpDlXT4+r+LyqAMwH2cKj014M6bunsYzvtnAy
X-Received: by 2002:a05:6102:1589:b0:3b5:3ba7:d491 with SMTP id g9-20020a056102158900b003b53ba7d491mr11392827vsv.30.1671545995577;
        Tue, 20 Dec 2022 06:19:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671545995; cv=none;
        d=google.com; s=arc-20160816;
        b=OdxaagbTdKs26xjmR8nQR22gI9ygGYfNS7ZiX1qQmyjmsO5hxvAjYZGdfiVlMXHjaL
         8Bt5zt9jqY8093+9jDy0QSm85i5OT2GT2dN7D/SSZvgYWv+NuvO1NtRwyPEyCgfO7lO0
         DnrInUo5nuDrVbs/j9LxdQcvQTRgvyPf6WVkPIbbWiOW/sSe3gsNuZeoVsz6MCeja/vo
         muanOeLq0QMF9j19AT4IPYXyyuNcLE0Pgl0l0rhsMap0rXuXQYm5ta95uA5H5b60PhyZ
         5kEd5ITq/7gc3aQbzQtel0/8UI4UZ0trHsSnn5oLD/oaJkv5tI1ulNSAupH9rlAkcfOq
         P5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject;
        bh=JNkGbdFuMwDJAX8PNjG/4IKkenq5MWbb+eh9+q+/xvQ=;
        b=nmS7QVmy0EZVarPaC1vOr7LtdLJ9w4c9yAzGRlu60sdH5ncqkO+MWMeZjwq7EdEnQm
         +KSHSGni7krhMfXgd070p5Bf45dh1iCYI1AaObZdv9oQrl5c0DLVRKM6C8agMPKFW38W
         7M2vK4+HTWDHqk2eZg4SKJb41QPywb14SbGBpno8bxuINAdH7FB0leSKX8KbpD3Pg7aC
         bzfZqSfWl9MfaMk3LSYiynIgIvM+fYxEwi6f5aGGcYWLEL7weqSK7njB1d5HPxlQZ0cz
         jyVjiRx9XNcdDeDp5JXTmVXmR9egbySjZTMspVqQ2umcJ5yklKX6xbPBw/bxmHSvXB8E
         uNVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2-20020a05620a04e200b006ed2f5fce24si3914427qkh.59.2022.12.20.06.19.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 06:19:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7dN4-0005W2-V9; Tue, 20 Dec 2022 09:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1p7dN2-0005Ux-C9; Tue, 20 Dec 2022 09:13:28 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1p7dMz-0004YT-SB; Tue, 20 Dec 2022 09:13:28 -0500
Received: from kwepemm600007.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Nbz6P59MKzmWYH;
 Tue, 20 Dec 2022 22:12:13 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 20 Dec 2022 22:13:20 +0800
Subject: Re: [PATCH] hvf: arm: Add support for GICv3
To: Alexander Graf <agraf@csgraf.de>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 <qemu-arm@nongnu.org>
References: <20221219220808.26392-1-agraf@csgraf.de>
 <d848e536-94ba-7f2e-ad40-026449fa63fd@huawei.com>
 <ceeb8fef-f0dc-eac9-8b0e-e28735bfdaf2@csgraf.de>
Message-ID: <e92d6301-de3b-5784-8c17-9c4194357c78@huawei.com>
Date: Tue, 20 Dec 2022 22:13:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <ceeb8fef-f0dc-eac9-8b0e-e28735bfdaf2@csgraf.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=yuzenghui@huawei.com;
 helo=szxga01-in.huawei.com
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
X-TUID: /sYjwCellH0y

On 2022/12/20 15:37, Alexander Graf wrote:
> Hi Zenghui,
> 
> On 20.12.22 08:14, Zenghui Yu wrote:
>> On 2022/12/20 6:08, Alexander Graf wrote:
>>> We currently only support GICv2 emulation.
>>
>> Before looking into it, I think it's worth finalizing the GIC version in
>> the hvf case - only v2 is allowed and fail early if user selects the
>> unsupported versions. Currently finalize_gic_version() does not deal
>> with hvf at all.
> 
> 
> Currently finalize_gic_version() treats HVF the same as TCG, which is 
> incorrect. However, with this patch applied, they happen to match.
> 
> I don't think it's worth changing the finalize_gic_version() 
> implementation to reflect the gicv2 only state for HVF. Instead, let's 
> rather get GICv3 support in and then add explicit handling for HVF on top.

I'm fine with it. I was just a bit confused when the guest got stuck
with a (blindly selected) gic-version but *no* error_report like "Hey,
please do not try GIC version other than v2" was printed. Apparently I'm
not familiar with how things work on my M1. ;-)

I'll have a try with this patch. Thanks.
