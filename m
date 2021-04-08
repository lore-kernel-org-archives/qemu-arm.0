Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp482548lfr;
        Thu, 8 Apr 2021 06:51:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvw955qY0udquJH2OnkwGA6fzbx9Wnd6AyQMrKdk6W5qIMWNcOB5xnN21rts5ZJAHi654K
X-Received: by 2002:a6b:7319:: with SMTP id e25mr6622296ioh.0.1617889917646;
        Thu, 08 Apr 2021 06:51:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617889917; cv=none;
        d=google.com; s=arc-20160816;
        b=Wku+eZk33/d9nExhKYk4FMOY3zztZ669YAk5EIovlt4qFVP/q4wTMv/1hKhkzVcdkO
         OWuKZiyvJGuX2ccxaZm87MQeKNZ2PQSSKK6R9xQ+LBB3vZfqVEVTHRdS55C7A2JviQkh
         06KMqZQWWe7pP5UrT4fCW7DMBoIyR7GppJxX+TAoluHP7ODTFAsjzl/kMNtPwn+3IUhi
         ZTcYhPogtGe5j4QaWdon+NBLTTVbTaATZggA9sGcOhbC4mM/W27+Xd0FYuUQoSnd9ppo
         BYiLJj0hSHBGE83jEOEVfokSOOV6ndecAgkpBQWsjZyyPitaqXxrt80Jtq0AEh7UzTkk
         qOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=n1EcrdqITbWAeZ4g0EkxIcDgeGErTtgdU5KTzNhUEd8=;
        b=pSZAn/zMq2dZ0kaQaVgNin24KsZDRjL+Ckx8HPUvBMQDcFV0uga7AhdRj1G2ZLApar
         AgZSZsHz96d2aC4uXlY0RtqojyVhJEKpQ04Cy76XjRO5wkFclH+o0CGRYwSVqX6SI8dp
         +TL4TCALHZirUR0j6YCNy0NXLot9SB4rPz7KTUNCPdqtsg/EZ/8zT46oNCeCxUWf5UU2
         xzjx6foIB+b8SzAGOOXtDD+hMLNUV0cbLgLrJ6bHOgib4ynJXJF9ekpwNs2qABFHYRJF
         5F5pw3CvHajzqcto33xCLamCGVBRqeIp8ICCfHKLP0+X3/WPCh8I58zov4jsDeFqStve
         R6lA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si24428714iok.57.2021.04.08.06.51.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Apr 2021 06:51:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:49806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUV4e-00069y-VY
	for alex.bennee@linaro.org; Thu, 08 Apr 2021 09:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lUUzV-000131-PI; Thu, 08 Apr 2021 09:46:40 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lUUzN-0007Sx-7r; Thu, 08 Apr 2021 09:46:37 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGMtT4rmZz1BFhj;
 Thu,  8 Apr 2021 21:44:01 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 21:46:09 +0800
Subject: Re: [PATCH 0/3] hw: Constify VMStateDescription
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20210313171150.2122409-1-f4bug@amsat.org>
 <bd47e690-dab6-e8db-2d8c-aa729c41abad@huawei.com>
 <4b8eca8f-fad2-1adf-6997-686803dfa723@amsat.org>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <07edbe0e-37ad-d262-6f9f-d058a2f3e3a8@huawei.com>
Date: Thu, 8 Apr 2021 21:46:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <4b8eca8f-fad2-1adf-6997-686803dfa723@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Rob Herring <robh@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /gxfNgQg9l62



On 2021/4/8 21:22, Philippe Mathieu-Daudé wrote:
> On 3/15/21 10:05 AM, Keqian Zhu wrote:
>> Hi Philippe,
>>
>> It seems that vmstate_ecc_state and vmstate_x86_cpu can also be constified.
>> Found by <git grep "VMStateDescription" | grep -v "const">.
> 
> Correct (I only searched for the static ones).
> 
> Do you mind sending a patch?
OK, I'll do. :)

BRs,
Keqian

> 
>>
>> Thanks,
>> Keqian
>>
>> On 2021/3/14 1:11, Philippe Mathieu-Daudé wrote:
>>> VMStateDescription isn't supposed to be modified.
> .
> 
