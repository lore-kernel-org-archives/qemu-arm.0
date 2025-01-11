Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp573550njn;
        Fri, 10 Jan 2025 20:10:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXYlhgjC2oR2oprkgF/HpyfDkBYw9lBXbvMVReOjCs+61ofz7Otvfil9dVEGqoMHH2qRJpK2V5ou2Hjyg==@linaro.org
X-Google-Smtp-Source: AGHT+IEKDHskhoDOuEidXeg1G098FFfSWQl0lvR7nNHAbSp6+2FkUHNqlbSTzj7xKO+1ANReOU8G
X-Received: by 2002:a05:620a:45a3:b0:7b7:25d:d7c9 with SMTP id af79cd13be357-7bcd973efd3mr2033895385a.19.1736568609138;
        Fri, 10 Jan 2025 20:10:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736568609; cv=none;
        d=google.com; s=arc-20240605;
        b=A5KhHiUOXuAivBrlK3IBtlOZ1+fTuaCNPlss5lDo0ja//oyoMgC4FNYM+bQxYLqByT
         bvqCysMzFuAyKGT+LhSWsg2WJx2o4ty7ihdc9iM5bmGqYV6CNEgPaJDsaBrSdX6+4zZm
         yhBv48mGK9WFvzlLXHeLec4kqXCYqirLJQGRuENhzCayJtRbCd92QJ7coHXySVHIYNAP
         bv7rPRZQJLlPtD1ax+U3Mm2ZXvT1UgNWyBk2J8WQIdDjugSrKY0EwGP82UDV0alwL1Cb
         1PzuHpohgDrRbVft1RMkmRnJpyDXdqWNRdVqydjZYJsCxDlhCOBl/OEzkEjUaTTHRHk5
         FNGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+qj+9mz/QvIa3LS+3FXk+hh3iv5MxugOp9C8kJzQEK0=;
        fh=DBp759+AjIJ7U+TfNpAz/IOqFD/HDfqT97IgtdnbDW8=;
        b=cHspn4BAXM8mgvl8ZRetTZD/AVYGiPBcaODfBqcfsBrbDyQGgAfLDDYcPilmt16Y1a
         BlCNDoXPwohlYomYBL+tiTHLiirse9Yw/GEM7CJuWdI38J4FCRUuVNBRo8Pwtn4elJMx
         2DjrTiZEaxuw9ZExl3Lb7oaS9jVDR7bxicHK+733Fru6ryhpjOSUrLxy7f7xemG8r77j
         Bq6gZHWC2b0kwbLxKt2fgY7ae3VV8ksu6sh96UCccziAGgb1vfS4RWkDUh/WPdqaPgZ6
         GgvtCEn93CT3wmJW4Oe+UByrhMpp6tl6pNWeU+s9OEJctD1Hl8p/YbE456SEA0SK78uf
         /cCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=et8vDUQB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce322a056si606088685a.34.2025.01.10.20.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2025 20:10:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=et8vDUQB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tWSoV-0001es-K4; Fri, 10 Jan 2025 23:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tWSlI-0008CS-RH
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 23:06:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tWSlH-0004xg-Bl
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 23:06:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736568364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qj+9mz/QvIa3LS+3FXk+hh3iv5MxugOp9C8kJzQEK0=;
 b=et8vDUQBKvITf4xpHkN7bhZiGvYWcgs+r+ifRxnmj/5+Db/nWJEvvfEE3synwAmuugVFnQ
 /bPGfC9UNFWzIARDbMAo/wDxgGBvn4ApHOsX7yk/aggqTtunnAvqGfN2CkmtFb6l2JAQYq
 0CITE82YBbgsuaB4a/zKA9Zkjj3Wq2o=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-XDL2s0vENWO343sOezuJzQ-1; Fri, 10 Jan 2025 23:06:02 -0500
X-MC-Unique: XDL2s0vENWO343sOezuJzQ-1
X-Mimecast-MFC-AGG-ID: XDL2s0vENWO343sOezuJzQ
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b6e6cf6742so666842585a.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2025 20:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736568362; x=1737173162;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+qj+9mz/QvIa3LS+3FXk+hh3iv5MxugOp9C8kJzQEK0=;
 b=s6Y71RgohLCpm8WwnRCI8hLVA7vWdcSnL9q5V3W49RNvBTewWQIXNYIzqJGQY5IbLC
 HZJlHv78v8krCHZ/VuH0BKe04Lp0zTjdWuqvVn1cq08F/N6JJ0gM1rhJmVRQwiuzWSoQ
 AJ8nQjayEs1tXjCt/rpB3+7qVNMO34cCbw8d+nac6q5GxabYRLcK1WruJJzWq+6+RNx0
 S8EGn9oL/gqfHD+59ePZRsqZ9xPPtpqxIMHJBq/pNEGf1F+SMf0BrmhfHREwC+jEqP69
 xUbWzvNpVYfQUf0RgPfav9bfnVxwO0IrlOKH6ntRMpxUGrU5Xh5oNXG4ssQIbHYj/o6O
 pz+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXouUC/R4AeALAOCufH9lmuXNH/usMMSdoMV4vgGJx8bifPK3ZEwygg48vMQqaY5wiGC7IVSOXWkw==@nongnu.org
X-Gm-Message-State: AOJu0Yzsdz3a7CVCEvZcjmjO2nJ8qMVeW7VvTdtY8jPi6rkdXd8nshw6
 U6DzrclcWqnsxk0+j42x7tTczadBiBd9TfOnkqWSc80t5box73R6FFPypxB5H3Bf4GBWqkQ2gQL
 8SK5ZXgJWkYQXEEYaOTF7gPLEu6wQiVjc50CV9Pmam1kjDlec8w==
X-Gm-Gg: ASbGncu9kANu2GlAzdAfnP25+3ordl7UuvKqDli2TxK0/7mspZ2mZ170YhlRqqiZ6gN
 dD4dgpQqsRIaj9hNCfU2CRZIK8klfRmV+aDzCzHFULbIRiJssPKyzgyV9q3MwhDQMk9Le0utngS
 yYOQLkfbf/0ttsO0J0eXfvW6mJq/WRbN6N5UQ5nxpdDUVgGvCVJJff7mLESuKCSo8yjmcC+87Ux
 ZUNduUZHEz2zXOsnKqj0XBOYXF+MFpq7z6Ep/fyerObvWS7IGA1
X-Received: by 2002:a05:620a:4407:b0:7a9:afef:33e6 with SMTP id
 af79cd13be357-7bcd97893a1mr1770827985a.34.1736568361826; 
 Fri, 10 Jan 2025 20:06:01 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:7a9:afef:33e6 with SMTP id
 af79cd13be357-7bcd97893a1mr1770825485a.34.1736568361537; 
 Fri, 10 Jan 2025 20:06:01 -0800 (PST)
Received: from [172.20.4.54] ([12.177.140.20])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7bce350e0e6sm242400285a.96.2025.01.10.20.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 20:06:00 -0800 (PST)
Message-ID: <568014f5-25fd-439b-b70c-9cf50f31255b@redhat.com>
Date: Fri, 10 Jan 2025 23:05:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
To: Nicolin Chen <nicolinc@nvidia.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Gunthorpe
 <jgg@nvidia.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <Z1wh69_gZ9izr1iU@redhat.com> <Z1wsslDnwlth3A8+@nvidia.com>
 <CAFEAcA8TW2RKyFnh-TZRpfaKfZipHD5TZy_hymUr41GJ4rs4xA@mail.gmail.com>
 <329445b2f68a47269292aefb34584375@huawei.com>
 <Z39Ugx2M+FRFVVpB@Asurada-Nvidia>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <Z39Ugx2M+FRFVVpB@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -SYNGUE2XDaiBQs9Pide6mWNn9s7IkaYbfAWMqcly_Q_1736568362
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.432,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YoGvLgNufY7r

Nicolin,
Hi!


On 1/8/25 11:45 PM, Nicolin Chen wrote:
> On Mon, Dec 16, 2024 at 10:01:29AM +0000, Shameerali Kolothum Thodi wrote:
>> And patches prior to this commit adds that support:
>> 4ccdbe3: ("cover-letter: Add HW accelerated nesting support for arm
>> SMMUv3")
>>
>> Nicolin is soon going to send out those for review. Or I can include
>> those in this series so that it gives a complete picture. Nicolin?
> 
> Just found that I forgot to reply this one...sorry
> 
> I asked Don/Eric to take over that vSMMU series:
> https://lore.kernel.org/qemu-devel/Zy0jiPItu8A3wNTL@Asurada-Nvidia/
> (The majority of my effort has been still on the kernel side:
>   previously vIOMMU/vDEVICE, and now vEVENTQ/MSI/vCMDQ..)
> 
> Don/Eric, is there any update from your side?
> 
Apologies for delayed response, been at customer site, and haven't been keeping up w/biz email.
Eric is probably waiting for me to get back and chat as well.
Will look to reply early next week.
- Don

> I think it's also a good time to align with each other so we
> can take our next step in the new year :)
> 
> Thanks
> Nicolin
> 

