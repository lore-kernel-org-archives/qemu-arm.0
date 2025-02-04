Received: by 2002:a05:7023:b15:b0:92:a90b:6588 with SMTP id qd21csp421001dlb;
        Tue, 4 Feb 2025 09:49:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWqSO+N91WHSay2CRp4Fg4Edxy4uRXD/9rI2AfloToYtXbWSb/eGqvzoR0oNu7/eLAO1fcPoxhdis6Cfg==@linaro.org
X-Google-Smtp-Source: AGHT+IH7oQaGHVyC4tA2VbPXRTTsHGXu9kNHdnd9B76gChere7DgXqT0Rw92AkwmaZMGwY0E/Hf7
X-Received: by 2002:a05:622a:4a08:b0:467:7a27:f3bb with SMTP id d75a77b69052e-46fd0b92617mr408876741cf.49.1738691384365;
        Tue, 04 Feb 2025 09:49:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738691384; cv=none;
        d=google.com; s=arc-20240605;
        b=kbmhQxguWfg3YQEiAI7z0AkOSgOxZQIC1u7ud8m/7mrvq91FSw98h48LcXi/Hoj+xl
         HVJbtylvdEFD+LQ0+7W6kbXN4atIKLK6GmoYP3Yz2kunFr63qbUzhdv7CQHUlcMFnbz5
         Fn7cd1Ynim5dQP8I5O1S77OKbvCc2wKyzbtwidGnNCyQ5te8lElUan/mVtvVpqnJSEqm
         u7fWCECDTRQ5YCHES/t4gda1jaj3hoam21cmVs88TbfbLfW5G9hHhfOBDzgJaLGH33DD
         G4ebKm0bCrrkqzvAcAx2ekztZKesIhGVvIxNodMwq1hcXS4jKaAIfH291PspG9XIcgNg
         GMhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ocVkwQum6xQIQj9MxspsCl6nfLCBD5by5s9rb96rDtI=;
        fh=ytySsqAmrmGAc+Bcb8TfIF7aNn0tiVw29l4Wxctveho=;
        b=OuV+ctwdqO5Rrs5T9KeJWpL0YmF+CdQkrrRouHv+psA+kw6DZjB3D53KrHIpf1Ta5O
         Ow+5dnarbDC9Wz77uDDrD6KkGtLyCriQLs8ueOabx/Y567uKDo2iIvl4ZX552mM2LVQ9
         x/wAXIMOrqYrOWKvytT1TKtM7X86qBEgXleKs1Ju9WiMIn1kXcrhCXOQYolrqZLEuTb6
         z/ohy07LFaM0GXyuYj8M6c531MgXc4wgfdunpA6m2z4nuACzZP0iRhg5UhmMykc1yU4N
         JSsdotwGWFZzymbIgzqer+ldE6+7n5R1IBAGTwMVieQd9eaEuP9Zz3O/3xpBmC4FjCfk
         Gi0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YeH2U9nl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47016bd20ccsi34385031cf.562.2025.02.04.09.49.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 09:49:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YeH2U9nl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfN3B-0005y7-Nn; Tue, 04 Feb 2025 12:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tfN3A-0005xp-44
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 12:49:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tfN38-0000zX-F2
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 12:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738691364;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ocVkwQum6xQIQj9MxspsCl6nfLCBD5by5s9rb96rDtI=;
 b=YeH2U9nl0nE9IOQA1dFmYkzx2dIUg4sp0MtGITbcEP9otHOp4kHAJpbq8oEL011RErBp1g
 LuQxpYwNm2fOlWQj9+o/iiY79tERIzVVSPPkOjBCPa5DjjdRGI7ugLSUBkUOrwNW84c2ea
 3KxB/Lk9RR3GkNTVj5wwzEGOTGBO+y8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-A_Vy7UUDN3SjEfBVdhc9bA-1; Tue, 04 Feb 2025 12:49:20 -0500
X-MC-Unique: A_Vy7UUDN3SjEfBVdhc9bA-1
X-Mimecast-MFC-AGG-ID: A_Vy7UUDN3SjEfBVdhc9bA
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-467b645935fso108778031cf.3
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 09:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738691360; x=1739296160;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ocVkwQum6xQIQj9MxspsCl6nfLCBD5by5s9rb96rDtI=;
 b=KroVsylUlXLUAVvZGeCh+6cEIum2ZpgI+i8JJMwjzw0oKB+fUKnSIkxC9hBHhf0xtV
 4PPEo4mlJttQXlcsSbOYYKTtzOsNB/W4an3S0M2DT1QxAetMl609XuF/NwG7H/lnyIUB
 uwSCawkXTQvwp3EX5XCx5oSKy1b6J51hSgdxAniHZd4mnv/v9/Z5bSCGPMhjMDZAn9Wr
 q/iwhxkBqovMdPs1r/V1UfpZHWaslj9qy5Zd7srX5xam++zK3uzhqOmAdj9YwS6jqZvy
 0qVhmyfo+RYXNTwHofZQFmEdIBSj/7pLY0Zc4RwtW3tlfC5kLKdiq6LGrEHn0SE9s4At
 e0mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUjMb/vqN+rAwHf0iGA1YVZNTmDMP+R1bLPKG7S1l2QkDpkYIj9FCMZ5wT1oxaT+kcJj4APjji1w==@nongnu.org
X-Gm-Message-State: AOJu0Yw7DCFsDTdF9rXBYfbDhvs6g3Bq29K1JZY71INhT9itgE7SyarV
 CvqbFSjP6CzYVooVm9vukIgLYbfSE7K9MgSCHecM2YZDQqhB+3PeygtVSnMmTLFfXclnIUaqvXI
 eTo39FcmfudUJtQ47ggcavKNFHCOfdA77Sm3LdNsMdy/cuPd83w==
X-Gm-Gg: ASbGnctiRLx7rLUvaQhr5TDz78n43SfaXBxQZOdXJJzWNrB1fgDubRwbekjOfXDyLAt
 G6FV+r9uE2BLqUPKBo/gejsu6A20/ZjMdZH27slqAcrOTLFuBNueEVjqO7Lr81WHxnOyodAr/yf
 zadAB8Sypx37sx4f8XLpix5UALvv1yed/eE/Uw90Ug3ylR4ESQtOXym7wa6z+c6D8aTggvYhJMr
 wiza2aeL0IfCcPpI7BvmD4S+KEHGhJ7+1WkGKC+V4MBOyxQeFum5IiO8BpwzSBh6ETTXnDAyeYj
 dYePZyu6sSttw26o/KJUIa58QegilKkvI7QX+XuBYmllzmxTiLgI
X-Received: by 2002:ac8:7c45:0:b0:466:9197:b503 with SMTP id
 d75a77b69052e-46fd0b9152amr338420491cf.46.1738691360356; 
 Tue, 04 Feb 2025 09:49:20 -0800 (PST)
X-Received: by 2002:ac8:7c45:0:b0:466:9197:b503 with SMTP id
 d75a77b69052e-46fd0b9152amr338420011cf.46.1738691359835; 
 Tue, 04 Feb 2025 09:49:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e254819959sm64435856d6.31.2025.02.04.09.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 09:49:19 -0800 (PST)
Message-ID: <77f736f6-9ef9-462b-916e-c8cfff279044@redhat.com>
Date: Tue, 4 Feb 2025 18:49:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Gunthorpe <jgg@nvidia.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
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
 <f4e64a3a-5c1d-49f2-ac72-b84ecd353c9d@redhat.com>
 <Z6EQENkHJy7TrkYy@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Z6EQENkHJy7TrkYy@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kwEktpWyOfu_jxmQIPJDAsB3Zlcy1LXUFY5aKBY0njs_1738691360
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_BTC_ID=0.499, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: U3e8g8iT6iS/

Hi Nicolin, Shameer,

On 2/3/25 7:50 PM, Nicolin Chen wrote:
> On Fri, Jan 31, 2025 at 05:54:56PM +0100, Eric Auger wrote:
>> On 1/9/25 5:45 AM, Nicolin Chen wrote:
>>> On Mon, Dec 16, 2024 at 10:01:29AM +0000, Shameerali Kolothum Thodi wrote:
>>>> And patches prior to this commit adds that support: 
>>>> 4ccdbe3: ("cover-letter: Add HW accelerated nesting support for arm
>>>> SMMUv3")
>>>>
>>>> Nicolin is soon going to send out those for review. Or I can include
>>>> those in this series so that it gives a complete picture. Nicolin?
>>> Just found that I forgot to reply this one...sorry
>>>
>>> I asked Don/Eric to take over that vSMMU series:
>>> https://lore.kernel.org/qemu-devel/Zy0jiPItu8A3wNTL@Asurada-Nvidia/
>>> (The majority of my effort has been still on the kernel side:
>>>  previously vIOMMU/vDEVICE, and now vEVENTQ/MSI/vCMDQ..)
>>>
>>> Don/Eric, is there any update from your side?
>> To be honest we have not much progressed so far. On my end I can
>> dedicate some cycles now. I currently try to understand how and what
>> subset I can respin and which test setup can be used. I will come back
>> to you next week.
> In summary, we will have the following series:
> 1) HWPT uAPI patches in backends/iommufd.c (Zhenzhong or Shameer)
>    https://lore.kernel.org/qemu-devel/SJ0PR11MB6744943702EB5798EC9B3B9992E02@SJ0PR11MB6744.namprd11.prod.outlook.com/
> 2) vIOMMU uAPI patches in backends/iommufd.c (I will rebase/send)
for 1 and 2, are you taking about the "Add VIOMMU infrastructure support
" series in Shameer's branch: private-smmuv3-nested-dev-rfc-v1.
Sorry I may instead refer to NVidia or Intel's branch but I am not sure
about the last ones.
> 3) vSMMUv3 patches for HW-acc/nesting (Hoping Don/you could take over)
We can start sending it upstream assuming we have a decent test environment.

However in
https://lore.kernel.org/all/329445b2f68a47269292aefb34584375@huawei.com/

Shameer suggested he may include it in his SMMU multi instance series.
What do you both prefer?

Eric


> 4) Shameer's work on "-device" in ARM virt.c
> 5) vEVENTQ for fault injection (if time is right, squash into 2/3)
>
> Perhaps, 3/4 would come in a different order, or maybe 4 could split
> into a few patches changing "-device" (sending before 3) and then a
> few other patches adding multi-vSMMU support (sending after 3).
>
> My latest QEMU branch for reference:
> https://github.com/nicolinc/qemu/commits/wip/for_iommufd_veventq-v6
> It hasn't integrated Shameer's and Nathan's work though..
> For testing, use this kernel branch:
> https://github.com/nicolinc/iommufd/commits/iommufd_veventq-v6-with-rmr
>
> I think we'd need to build a shared branch by integrating the latest
> series in the list above.
>
> Thanks
> Nicolin
>

