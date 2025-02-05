Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp848521njb;
        Wed, 5 Feb 2025 04:36:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW5Fma8CgbmlvDCDufC7Hgt+7DmriX4m3bELsjRzr+Y3NGUbXAZ2UMDwjLAkhwZbaNIFfE4UGzvTklj0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IE+IoiBXYjDdjSsmLm+VQj1iFujpg8QrI8pZzIYp0/F5uYBKAplZDsGN0uZfXRWD5gbvy8y
X-Received: by 2002:a05:622a:510c:b0:467:75c3:89a8 with SMTP id d75a77b69052e-470281901c5mr37850771cf.14.1738758999409;
        Wed, 05 Feb 2025 04:36:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738758999; cv=none;
        d=google.com; s=arc-20240605;
        b=lza21+Nr85OlwszdZyrSPlmyfPt6CKslvbr4HeWIIBuRF5nVQtZJKfjX0iHc4dKowu
         nJ4leP2+F4ju07yK8rFDp6KN1PEB0mR5dyzB3Tz/FOnGpEk31wqY9D/PMo3uZd5QPoKh
         jkWEzZBGpUE3yPRcGBx6kfN7Cw3YDnloWTTmhq5owp9+4XF8OwZ0fRERTHEdxph6g/WH
         Cfo4d+X6GtwPbYLKAI0dElKjJ02dGC3JaGm0I1G6rB8XgcH+uyUhXl87lKK8Ew9QDvdC
         0364QFRB3Kz4R7qQC+FSHAra98TKMbwZ7WKNkL4wncIToICXvMK+ObtR3mMt31ME1gDG
         Wv0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oDgRhvAVYdvoxe7XBnXUhWpJbAGWmB4L9GDPUJxPhRk=;
        fh=OCF3wgulAtVrUEO8VmMifKKjKMJ8pJ3Wn4BHs7ur8/8=;
        b=P6zBmngR0KFdEVLsHfsDsh7YstWA3D64k2ZHj5fNOM81zvuFvzD+uKVDXyOrda5lcN
         m95uHDUvWL2Wu1CGU1/zeDIWnb8fnNFZvS0V1aAQ26e09cfkfgvT62BGnERROZHQ0Dre
         gwgtX7UnXY3jBAgZaUtxCwQ06cz2N+TbzrWMY0r8LtYsl0lCVs6odlGHHcvUI3MOLgEW
         s5QXUSRr0bgU3228h9HOeg3mcg4QYP1f+lwOiSVmQ3jSjoD2rdBuVkjIhp0VIlTE4wqR
         Q9Wj1s8SmwoPfdy9D5Izm9qm/kGy0YKF3U50O/Xfc4Vg6O9znoyUuhGFumYeo49RzM6R
         yBbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SQSraXx3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-470169f7ee5si51397071cf.59.2025.02.05.04.36.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2025 04:36:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SQSraXx3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfedD-0005UH-5v; Wed, 05 Feb 2025 07:35:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tfed7-0005TV-RT
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 07:35:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tfed5-0001kx-Ln
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 07:35:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738758942;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oDgRhvAVYdvoxe7XBnXUhWpJbAGWmB4L9GDPUJxPhRk=;
 b=SQSraXx3GV9WSwTQ4K0oGA/ajTvDca9DlorgLcj+D1iY1Ove1tPTM04WfUcp+80RrqTo8q
 mAVONheU4E6mvn+p57VcaAGO/PdpOeD2aI6sZlLHIRWvAbu5u7BGRKWi6sJMf+Ep1ruXnf
 dac8ZFjKz1tukziTD6gPGp/OT8Y/33M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658--gbcOKgQOIqia6jlPPq4-g-1; Wed, 05 Feb 2025 07:35:41 -0500
X-MC-Unique: -gbcOKgQOIqia6jlPPq4-g-1
X-Mimecast-MFC-AGG-ID: -gbcOKgQOIqia6jlPPq4-g
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-436219070b4so34841165e9.1
 for <qemu-arm@nongnu.org>; Wed, 05 Feb 2025 04:35:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738758940; x=1739363740;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oDgRhvAVYdvoxe7XBnXUhWpJbAGWmB4L9GDPUJxPhRk=;
 b=N9NbbHUhfavbwSihkYGtVRBonHk5fdr4lChNJi7aqnw+TatbgAOl2zEZhjcRo4Q96y
 VkdLgW4WfSh4qBjnL9of9d8IpFlag573hqYCQ9wAPd7BqssiuXV7U4DPsHLjsQSPwjdj
 lucwZeI+U/skQPC2S0YRxtvBQIxxXSlAKA/N+VTHCO4IUsmsOV2Z0zhXvLZVLqQdIvE0
 bMhNg6YHmyObIyC0DM03xYYAgqO3tgRDwVLxPesa1HcRSP3UFU6vXhk7+9nJXSi2vyXX
 0N6Cp+DUdu8MkjDlcPp8gnRfYiFyhe3+v+uo48MVYwjzHBmfH0nq75QBfECbOu9Pqbf7
 zRZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYqb3stYRlCrf7zg+DPxS3vWVv/Jf4ycFWUrbTel2AcepBPEbJicNr6ckZjjffoV/Z4QTw4ySAfQ==@nongnu.org
X-Gm-Message-State: AOJu0YxqWF7fqx/Do9QQfVCGc1fMk4AmeNNw3xa61FJs1oc6vOGCefAd
 f3/BnK72P6UzUB1vynXVyCWLfSCftCIEE/hQKjtwRhEHiaaSt/e7WQOxNbapFcbezy7wMzLOlFS
 Jzw7oKinByeClXw1BKG5vTmRab9PLMuG2sHJhdJXlN/44tL8Vvw==
X-Gm-Gg: ASbGnctDXDDoZegUQGnABHtcO1B9yLSzniPd5ZcIx5dUKB7cb3K//OV0Vk7Z63hvgak
 I6JPk/y7o2j1v6c5rbGttcREssPigykOBOBi3abp0Lc7JrOU4SCQChqn8kOIxeBgkoDEi38from
 OGf03D40vBl3vsAG53QgaZVfCsGWypDPX46fPp3bVBluErCQkwvZG9EoXa05YlHP9xSzwaX9RPn
 kso5PUHtnrVo3n8FcBzl6H3b7gn7Mjsc79oCFh0JJkvZS5ZHUOtde5JXJYG2FkZk7nlr+Nw3Fjl
 GgOLrGeuKEfT0Ehh4XAX8crLuQvUlFSIZmpvRVz3jk8YoPJzG46d
X-Received: by 2002:a05:600c:6d52:b0:434:f0df:a14 with SMTP id
 5b1f17b1804b1-4390d8615c7mr18341895e9.2.1738758940129; 
 Wed, 05 Feb 2025 04:35:40 -0800 (PST)
X-Received: by 2002:a05:600c:6d52:b0:434:f0df:a14 with SMTP id
 5b1f17b1804b1-4390d8615c7mr18341585e9.2.1738758939746; 
 Wed, 05 Feb 2025 04:35:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dad9a8663sm4386021f8f.6.2025.02.05.04.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 04:35:38 -0800 (PST)
Message-ID: <e191a394-e70d-4c9c-ad6e-8e2f1111112e@redhat.com>
Date: Wed, 5 Feb 2025 13:35:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
To: Nicolin Chen <nicolinc@nvidia.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: "ddutile@redhat.com" <ddutile@redhat.com>,
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
 <77f736f6-9ef9-462b-916e-c8cfff279044@redhat.com>
 <Z6KsAE9wnjWU0xMs@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Z6KsAE9wnjWU0xMs@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zLWF9BikwAJq7s0d7EN4gGVi2GwxPJaHHKBbyjcDep0_1738758940
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
 PDS_BTC_ID=0.498, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: EVmuGRt7T+rc

Hi Nicolin,


On 2/5/25 1:08 AM, Nicolin Chen wrote:
> On Tue, Feb 04, 2025 at 06:49:15PM +0100, Eric Auger wrote:
>>> In summary, we will have the following series:
>>> 1) HWPT uAPI patches in backends/iommufd.c (Zhenzhong or Shameer)
>>>    https://lore.kernel.org/qemu-devel/SJ0PR11MB6744943702EB5798EC9B3B9992E02@SJ0PR11MB6744.namprd11.prod.outlook.com/
>>> 2) vIOMMU uAPI patches in backends/iommufd.c (I will rebase/send)
>> for 1 and 2, are you taking about the "Add VIOMMU infrastructure support
>> " series in Shameer's branch: private-smmuv3-nested-dev-rfc-v1.
>> Sorry I may instead refer to NVidia or Intel's branch but I am not sure
>> about the last ones.
> That "vIOMMU infrastructure" is for 2, yes.
>
> For 1, it's inside the Intel's series:
> "cover-letter: intel_iommu: Enable stage-1 translation for passthrough device"
>
> So, we need to extract them out and make it separately..

OK
>
>>> 3) vSMMUv3 patches for HW-acc/nesting (Hoping Don/you could take over)
>> We can start sending it upstream assuming we have a decent test environment.
>>
>> However in
>> https://lore.kernel.org/all/329445b2f68a47269292aefb34584375@huawei.com/
>>
>> Shameer suggested he may include it in his SMMU multi instance series.
>> What do you both prefer?
> Sure, I think it's good to include those patches, though I believe
> we need to build a new shared branch as Shameer's branch might not
> reflect the latest kernel uAPI header.
>
> Here is a new branch on top of latest master tree (v9.2.50):
> https://github.com/nicolinc/qemu/commits/wip/for_shameer_02042025
>
> I took HWPT patches from Zhenzhong's series and rebased all related
> changes from my tree. I did some sanity and it should work with RMR.
>
> Shameer, would you please try this branch and then integrate your
> series on top of the following series?
>    cover-letter: Add HW accelerated nesting support for arm SMMUv3
>    cover-letter: Add vIOMMU-based nesting infrastructure support
>    cover-letter: Add HWPT-based nesting infrastructure support
> Basically, just replace my old multi-instance series with yours, to
> create a shared branch for all of us.
>
> Eric, perhaps you can start to look at the these series. Even the
> first two iommufd series are a bit of rough integrations :)
OK I am starting this week

Eric
>
> Thanks
> Nicolin
>

