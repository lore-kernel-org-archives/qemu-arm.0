Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1662949njm;
        Thu, 6 Mar 2025 10:00:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVrTWLob1EXkO+fTKlllmKKadqdnfb3EFztM7XS2SJRdLwejs5X7e71Rk1ak2m7vQ/GUbBBqtjaK/Z36g==@linaro.org
X-Google-Smtp-Source: AGHT+IEjRtQdEm33blDfbw2RYm7S/czrVXnBDhVDHnvqJblphLhJA+HuRE2Q9KmqxBwdvtRFuN9o
X-Received: by 2002:a05:622a:1a20:b0:471:fc9e:8de2 with SMTP id d75a77b69052e-476109533d0mr56671cf.8.1741284038499;
        Thu, 06 Mar 2025 10:00:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741284038; cv=none;
        d=google.com; s=arc-20240605;
        b=Daa7GvvRARpEoaQpppTNA/KORWx6+8/AiaV/dYSTXu/XGZkpul3CCrXCcTm24Dq2DI
         U6w4vuntbtys1I+mpFgDjA2H7MAp/yql3jhP4T4auPJZouRk/H224ocU6TnzTPO/RJ8A
         504rrwmK82/29/PjM037jLA7Ae7IoYuSPnOMOxXQtsXvGIixminnpfdhc5wqfTB7o9T8
         5RIHjjOoQp1Xuy7mA28Wnm2zayouz25ZbiE8EST/5LNqmox7rDG3NzsrvcxYaES3Oy8m
         FSwLUh+CHz7eRFEedD8n3bSSmVNVqrt6hOnRG/VT921yZ3ykxLi5h4IAuHT7sJxOhZDH
         vtqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2nIPruIQ08U8Iyvv5h184/O0l7dO44/GMt0kItqu+2A=;
        fh=VkoAigF4TklyIUz/EDS4AdGVAHKFZobFGVB2LHjL/J8=;
        b=YEzh8Ce1mYFfh3mNGg/T3xfXj2jqK+Tf9Z1ET9BMJnSGARtvh81BwMAOc9ChyA60DE
         XEuAlpOwCnCr7X+jWQil/c9MZcvmCi5snftNCvaLIzZ3ym0uI5nXb/w1086yP0b3epOL
         Ou8/A2SnIau/2CzV6zEY1CPFh5PahRbyK+qYmI/zWe7Kzk+fYLDfxoELcb5tJcmn0Lr1
         2pC43NV2mVpFhf5ulyPPPSU4bv+8SkykhoQTVkIA01yymfO6GyKHZ5j/zyJjkrASR1Ku
         JI/cpaUYT4NQZVJvU9cDGeVCibkxi+Bgg2aUVjV9wr9vUUQ8fRNB5hDxMs0PP90j0r2L
         RAJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gHBsDSnU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751d97f85csi16548231cf.61.2025.03.06.10.00.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 10:00:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gHBsDSnU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqFW6-0002JS-Bx; Thu, 06 Mar 2025 13:00:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tqFW4-0002Hw-Ge
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 13:00:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tqFVy-00081c-0E
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 13:00:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741284006;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2nIPruIQ08U8Iyvv5h184/O0l7dO44/GMt0kItqu+2A=;
 b=gHBsDSnUdueiNUJwMItQQ6KlaK0lgngUwx6cf+dMMpo+ULaxQue7cNWg/UzeVKtd0C096E
 qpQ86fimqsqEJSjqEursjZO/bXhpN6nvdCgNGPQRLsot4kXOkeFcWpjuLL4M8kRHVbTs40
 vmUeLiTFbMgnk0CAXTLpF4c8UwWn6AY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-NzovNyhENfqWBmKYGtU1mA-1; Thu, 06 Mar 2025 13:00:00 -0500
X-MC-Unique: NzovNyhENfqWBmKYGtU1mA-1
X-Mimecast-MFC-AGG-ID: NzovNyhENfqWBmKYGtU1mA_1741283999
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43943bd1409so6464715e9.3
 for <qemu-arm@nongnu.org>; Thu, 06 Mar 2025 10:00:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741283999; x=1741888799;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2nIPruIQ08U8Iyvv5h184/O0l7dO44/GMt0kItqu+2A=;
 b=eqBReTcE0JBnVGlllUlg2G+B9aiwQHSJn/iYFNcSbJdNFRVlfCtLR8inX+uxksKT33
 Y3PvX7TQt2ygGKGjXGPdQptbK1B20wpZJi5YRoJY4g8GLlW7vLNz5pq9E71y4wCnPT16
 LkPUqYhJ00a+PqM9pEMNwSFxqris1CnWPW1ooOYbOjzeKB0JWcTPIBYu1XHFGsABrGWq
 mC/LdT8YzkJRa423xUgrzZozgXpNIQeiU4ya/rXUq9Rl8st7tn0GPFY1TwoigiPH6vpx
 Xjb+Z9NzsM9C6Rt4Wd7sO+h4+M4fhTJ5zuTpQN+q7rThFwIpVueht7VnftE/SvYdcgDg
 aiKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm35vjmLN+HNpLX6Jzhsx1GKTSizAODwq6A3+JzBm7ZbkszW4aWLrZLazm1rlPaFS0v79YeB8qYQ==@nongnu.org
X-Gm-Message-State: AOJu0YxPWBkSnWVqee1XXJZzKM3g+TsV9CNSadqpvdSU+l4dRSlchiK0
 rnTsIW8Y8894UoSuZ1i9TSZ0QZbrRx2d9GVhHLJ8hY9fy9rxWy+a9fPpuAyrHDd6odBQQrfHOW+
 qPZU/BH/mVZRqOICyGHdrAnFzkJMCkdmN74hepXFg5lpFkZDQqQ==
X-Gm-Gg: ASbGncvfeM2E4Ek/WcRhJdhJiqnkN/kN88xMEvwhEz7JvDkZKjwmnNoEFTV7jjIO8hk
 FAXCVJ8zpENAm8Ln1iSjMX56c0kll/n6dWI62rOjBjP3g7mQMIw4NYW+/NCEyynh/uB0U1v5NTq
 ZqLj+ZgI7hIzO0r8T9wMpkwP/Le6EBgH5y4YiVwk6wz8pqwpgFERnJzG+YhKRJ+HCDkFbwwE4RG
 DsuA/i+XQqGTW6g9Kfhk9QxQXJWNfNOsrMgS0NezsvUrcZ+hvW6ZllINA1xhzk3qDW90ACelp1g
 eLbfL+gX58+diVBNUV3S+nXyFK+Wp2CdREgOOzBlemR0X7ENM2c+qRf26Xm7zVw=
X-Received: by 2002:a05:600c:45d1:b0:439:6118:c188 with SMTP id
 5b1f17b1804b1-43c5a62a276mr3597095e9.19.1741283999273; 
 Thu, 06 Mar 2025 09:59:59 -0800 (PST)
X-Received: by 2002:a05:600c:45d1:b0:439:6118:c188 with SMTP id
 5b1f17b1804b1-43c5a62a276mr3596955e9.19.1741283998878; 
 Thu, 06 Mar 2025 09:59:58 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c01ebddsm2814820f8f.60.2025.03.06.09.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 09:59:57 -0800 (PST)
Message-ID: <2191c0b3-f3a4-4d90-9448-23c3bc876372@redhat.com>
Date: Thu, 6 Mar 2025 18:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Donald Dutile <ddutile@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Gunthorpe
 <jgg@nvidia.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "Peng, Chao P" <chao.p.peng@intel.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <Z1wh69_gZ9izr1iU@redhat.com> <Z1wsslDnwlth3A8+@nvidia.com>
 <CAFEAcA8TW2RKyFnh-TZRpfaKfZipHD5TZy_hymUr41GJ4rs4xA@mail.gmail.com>
 <329445b2f68a47269292aefb34584375@huawei.com>
 <Z39Ugx2M+FRFVVpB@Asurada-Nvidia>
 <568014f5-25fd-439b-b70c-9cf50f31255b@redhat.com>
 <Z5HBJOgO4tUJApY+@nvidia.com> <8fe09b60e6f04cc6aec99b72b46b2fb3@huawei.com>
 <SJ0PR11MB6744943702EB5798EC9B3B9992E02@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <SJ0PR11MB6744B3D96A98584525B0401292FB2@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <c975f6dfaa9243c5a2db9e37d592ea51@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <c975f6dfaa9243c5a2db9e37d592ea51@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cVyp51kLkb7tgPgQB5Bp0EgNmvNYdHPMHQwStY8q0oM_1741283999
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: VtbkhnTlmArF

Hi Shammeer,


On 2/18/25 7:52 AM, Shameerali Kolothum Thodi wrote:
> Hi Zhenzhong,
>
>> -----Original Message-----
>> From: Duan, Zhenzhong <zhenzhong.duan@intel.com>
>> Sent: Monday, February 17, 2025 9:17 AM
>> To: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; Nicolin Chen
>> <nicolinc@nvidia.com>; Donald Dutile <ddutile@redhat.com>
>> Cc: eric.auger@redhat.com; Peter Maydell <peter.maydell@linaro.org>;
>> Jason Gunthorpe <jgg@nvidia.com>; Daniel P. Berrangé
>> <berrange@redhat.com>; qemu-arm@nongnu.org; qemu-
>> devel@nongnu.org; Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
>> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
>> Jonathan Cameron <jonathan.cameron@huawei.com>;
>> zhangfei.gao@linaro.org; Peng, Chao P <chao.p.peng@intel.com>
>> Subject: RE: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
>> nested SMMUv3
>>
>> Hi Shameer, Nicolin,
>>
> [...]
>
>>>> Hi Zhenzhong,
>>>>
>>>> Just wondering what your plans are for the above patches.  If it make
>> sense and
>>>> you
>>>> are fine with it, I think it is a good idea one of us can pick up those from
>> that
>>>> series
>>>> and sent out separately so that it can get some review and take it
>> forward.
>>> Emulated series is merged, I plan to send Intel pass-through series after
>>> Chinese festival vacation, but at least half a month later. So feel free to
>>> pick those patches you need and send for comments.
>> I plan to send vtd nesting series out this week and want to ask about status
>> of "1) HWPT uAPI patches in backends/iommufd.c" series.
>>
>> If you had sent it out, I will do a rebase and bypass them to avoid duplicate
>> review effort in community. Or I can send them in vtd nesting series if you
>> not yet.
> No. It is not send out yet. Please include it in your vtd nesting series. Thanks.
>
> I am currently working on refactoring the SMMUv3 accel series and the
> "Add HW accelerated nesting support for arm SMMUv3" series
so will you send "Add HW accelerated nesting support for arm SMMUv3" or
do you want me to do it? Thanks Eric
> from Nicolin.
>
> Thanks,
> Shameer.
>
>

