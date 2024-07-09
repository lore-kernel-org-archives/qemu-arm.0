Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3423584njb;
        Tue, 9 Jul 2024 10:07:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbPjHYj7CnaReyChXNUoO6lLxh9bGWZkiRhAWH91ZisuIgCz/M2vQBjcCnYJI8Q+VeFk0Cjcw5ObRHfK9OmPtOse2RtcUs
X-Google-Smtp-Source: AGHT+IGWl7T7fgJPqt4Y18EU1QrWyUBS5JqHHiv6EdQ6ZLAtBkUwdIb9iVIeJiGjoSpXjp9GI8G2
X-Received: by 2002:a05:620a:4606:b0:795:60ba:76e9 with SMTP id af79cd13be357-79f1b507affmr478595585a.4.1720544834144;
        Tue, 09 Jul 2024 10:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720544834; cv=none;
        d=google.com; s=arc-20160816;
        b=xqgBzUOwcI6r9UGhpm6LNOvbei5V1QvBJJzWwJw+oCMu/1jW16/ffzF/Gzra9KFQOZ
         WBbUPGSPaUKa/bBWGJb8WRbMdJFjsGnTirDkSW0APAL5HjEtaIAxhD/s+nvuh84xCJTv
         P1XlHgi7jyV97fkEwFiaFBPrmPtiIziA2/fV5+/EY/XCq2cqnA7Jfu3JQCt9P5Jyi1Di
         Bffr6igz4D22qLf1oZ3bRPYE4qRp7Aso8t/AT683tYKgFt9Fhk7/c6CFp/bvHKUl55Mv
         Lk1al8PhXq14oebg2JVoHWX7XKbjPzjPMKoQqHXmtNX017UMRSfXG6HhXnx/sKBHn7jU
         DpMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jAZGjImkX2HQuFPZOVYzNYKh/FgsBpv4IZdaz1kVazk=;
        fh=4PCGK4CX4fF7VE67LcA8SUvqyIKqzWuBhlsOA+FkJgs=;
        b=xdaSnFePy5Cwy6hzmgvk6xvjIZLz62H+INuXfuZpBsrxtaG0qzfyw5KSv0TnApSrXu
         +Q0bLQj+vUeOkmdnIwhhPK7woNLFnKWaF2j6LG1I6oz/LSDu9LCBM2qVlomJvKSvgrvU
         xcRtu9SY7Y0bmeWLo9OBkzl/LcZv0ONJWQYW8x771JefSYVUizVkD9tCUSF3LFKxjDqe
         HDnEz+F6vaZpvxZVT1o5qYIkVqIz/6uzByk9Ddq03MWln4i0iLkbJaSLuD7r9c9aT7Pv
         5ooH+fyPWaYkpS87yXLCtMXpIInltZdxXqXF/DNErHmT4aSGGcwMnwPZScmPUEk2SpS8
         EUWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fftx6MQV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190d8891si245542585a.577.2024.07.09.10.07.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 10:07:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fftx6MQV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sREIy-0002r4-Q2; Tue, 09 Jul 2024 13:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sREIx-0002lZ-FZ
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 13:07:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sREIv-0008S8-Sc
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 13:07:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720544818;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jAZGjImkX2HQuFPZOVYzNYKh/FgsBpv4IZdaz1kVazk=;
 b=fftx6MQVx5jHtm+DOzfEdtiVmbaYw2fCviFYGp16aBaGBA/JO7KjyeBQk3cnMMIh/lLkel
 PK7RakMSz1xgStZM4tt1uZxXPJt2qQRoBID19UR9V10oFa+v197xBSfY2iQigW0DKIWMee
 2vBnQR86Gn0qVqJqi8JNE2CB2mySjOE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-4aypEGNEOPiH7Unv3p5Jhg-1; Tue, 09 Jul 2024 13:06:54 -0400
X-MC-Unique: 4aypEGNEOPiH7Unv3p5Jhg-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-52e9d04d773so5752971e87.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 10:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720544813; x=1721149613;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jAZGjImkX2HQuFPZOVYzNYKh/FgsBpv4IZdaz1kVazk=;
 b=wu0Acdf1u9wK37UONyPrPITbQgZmgRcpnZfAz7TlkmkxoCLwK53WZzRWkAOoE48Mdp
 sAs9flKmzKEKU9E1FVhNWn2xC6p3Ty7Y1r0ju0QxRwUFarwcDcDcL1Vp33g82Z+eHKH2
 0YSsgMsWDJOdKJKpq6S8TWKUsxMouaBXAVUQymUU15etDkyLd0y4J1Xx2R6s212A6Y2u
 VtIPBrec5R+wipQoTkS9vhC6kEpT2IjGezS2gf9lvb5YXNJKyvwotYjMoveqPFCLETeH
 9gH2BbMYU9HzNO0x3JAekusq/55+bviontHJ6D3kja2UuEiR+GtEDzkmNNpbnh4ZTUSC
 j2Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkrFwAPdwop2N+uVm5MlJBe9O0JhH3j5MAHGPUYrh7QXxeTIy9M+TfqEJfOWBA5fNk86HXB32EezoTF/Mx6Jgy3+Ro
X-Gm-Message-State: AOJu0Ywc6Uf/koG2zxcl8w3I3wN/SE5wgS4XxWgPWNU5T9xKwV2pKaUr
 Ugs3NGGyNpXCcYmZsuVyMhC7DZQ9sP5syEQlJ+IQzMI0T54E+SEyUCS5LX526CHr4hxfjJnA21M
 YS4wKk+ynfUTGWv9rRbYg9c5ymwvJI9lZbH+o2DvLK7pK3F9vkA==
X-Received: by 2002:a19:9105:0:b0:52c:d617:f4da with SMTP id
 2adb3069b0e04-52eb99a3100mr1716666e87.41.1720544813386; 
 Tue, 09 Jul 2024 10:06:53 -0700 (PDT)
X-Received: by 2002:a19:9105:0:b0:52c:d617:f4da with SMTP id
 2adb3069b0e04-52eb99a3100mr1716653e87.41.1720544812983; 
 Tue, 09 Jul 2024 10:06:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f7361b5sm48602915e9.29.2024.07.09.10.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 10:06:52 -0700 (PDT)
Message-ID: <af440fe7-faf7-43a4-9f04-9d0059ef7e90@redhat.com>
Date: Tue, 9 Jul 2024 19:06:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1 02/10] hw/arm/virt: Add iommufd link to virt-machine
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: peter.maydell@linaro.org, shannon.zhaosl@gmail.com, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, peterx@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, jgg@nvidia.com,
 shameerali.kolothum.thodi@huawei.com, jasowang@redhat.com
References: <cover.1719361174.git.nicolinc@nvidia.com>
 <df22fcd43e201fea97da8862b61614a2986ffa5e.1719361174.git.nicolinc@nvidia.com>
 <efec2974-ce96-4cb1-a00c-30fe93c5fa7b@redhat.com>
 <Zo1sblmS9+xlWObT@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Zo1sblmS9+xlWObT@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PGHVxMLMW7dr



On 7/9/24 18:59, Nicolin Chen wrote:
> Hi Eric,
>
> Thanks for the comments!
>
> On Tue, Jul 09, 2024 at 11:11:56AM +0200, Eric Auger wrote:
>> On 6/26/24 02:28, Nicolin Chen wrote:
>>> A nested SMMU must use iommufd ioctls to communicate with the host-level
>>> SMMU instance for 2-stage translation support. Add an iommufd link to the
>>> ARM virt-machine, allowing QEMU command to pass in an iommufd object.
>> If I am not wrong vfio devices are allowed to use different iommufd's
>> (although there is no real benefice). So this command line wouldn't
>> match with that option.
> I think Jason's remarks highlighted that FD should be one per VM:
> https://lore.kernel.org/qemu-devel/20240503141024.GE3341011@nvidia.com/
OK I thought this was still envisionned althought not really meaningful.
By the way, please add Yi and Zhenzhong in cc since thre problematics
are connected I think.
>
>> Also while reading the commit msg it is not clear with the iommufd is
>> needed in the machine whereas the vfio iommufd BE generally calls those
>> ioctls.
> I think I forgot to revisit it. Both intel_iommu and smmu-common
> used to call iommufd_backend_connect() for counting, so there was
> a need to pass in the same iommufd handler to the viommu driver.
> For SMMU, since it is created in the virt code, we had to pass in
> with this patch.
>
> That being said, it looks like intel_iommu had removed that. So,
> likely we don't need an extra user counting for SMMU too.
OK at least it deserves some explanation about the "why"

Thanks

Eric
>
> Thank you
> Nicolin
>

