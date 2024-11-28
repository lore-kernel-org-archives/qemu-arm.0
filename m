Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1342366njb;
        Thu, 28 Nov 2024 00:07:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXJS4BQWj00PV7ESFulNP7Em/YVyCtG3xOJYQK3GH7S2rsk6CzSxeu8tXR6ALNjaTTzqUHhgVNHWPG7UA==@linaro.org
X-Google-Smtp-Source: AGHT+IFYHhgsFJdZDr6yUnqlR8KE5fRUn0U/bEpnWD4QVJnjoEFpXljYjWouL9vmcCWUKvqQbG/g
X-Received: by 2002:ac8:7f52:0:b0:466:7b35:8cdd with SMTP id d75a77b69052e-466b34d3618mr89661941cf.3.1732781245893;
        Thu, 28 Nov 2024 00:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732781245; cv=none;
        d=google.com; s=arc-20240605;
        b=XVFS7ZA9MWJF7JZNN4dTg7Uv3Oq4x77+TYMKepZfx8gSR27BeW4/pspwrwDOg8JYaZ
         k5ARRZHPkvM+GAfdNfBb0eK8a3wHydsI/v0Ie+1ZDCzqNH0Tq46y7bDDqAxp/GwBCgCP
         cjJhpiDMx2NRtXhlVdYhOZu6mGUVvN4J1616SKWMDiT3CXUpzHYrkRvQpCo1f5HPSacg
         uzVl5MR2X+H6WYEWvWlg01/VivsVNdVyLWYJ3K73/pBB50XrQDaeHgmYSkff3vMwilfg
         QXbQIDXnVBnkc4VJR/PF+ng2bm3a/4O0ozO0yw81O+r3y4eC4FnGNwaVLnr9ft4wSbW/
         t6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CVe9xOy+MPsbZXEGhxNCaDYnl7LRyUwGHDKkf1tEUFk=;
        fh=wq8imr2NPXXCp3XrXvdIbjcbTOEWdthR6xSYwrVPRf0=;
        b=Jv5UIGtUMjzzNtKEIrdtqribNoXjJK3Gd224U2BXs/QgKnkqBJI3MnY1Tmy/+3EQrM
         RltlJbe004yEuDtzwznrm7ZPOmAzi6FsGRv4Y0ssKwlAJnnSA3tB8jaVCM1MaLIqBvqx
         o33/S83LuMyFhypyk6P37r6Jwz3qv24k53n6cqPwrcNLhBEWcXksZgrR0hcXfJyBa4d/
         rEfkZm3KjE61zuVfRTL5cr8SS2kSQj94vHw2KTHoz9XWBm7j2kY7W1A7wS/7ag3HROk3
         CdBQaCSkIoqridMcuzi0ncxAn9s1eZJRoiiJkbvPbLX7gzA1JYTwfM3+VRFzgG/SDHJw
         /ZLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WzTkaIPd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4066b10si11297241cf.171.2024.11.28.00.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Nov 2024 00:07:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WzTkaIPd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGZY8-0002S4-Kb; Thu, 28 Nov 2024 03:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tGZY6-0002Qo-8q
 for qemu-arm@nongnu.org; Thu, 28 Nov 2024 03:06:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tGZY1-0007Ms-PT
 for qemu-arm@nongnu.org; Thu, 28 Nov 2024 03:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732781202;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVe9xOy+MPsbZXEGhxNCaDYnl7LRyUwGHDKkf1tEUFk=;
 b=WzTkaIPdtThpA/ysOa2CDf8zGgzGTjnq3OgCbuhWafBvdgOPJXLCL3Qdrss2oLpaupSjkY
 Vj9/UInyLEadtVg+LwYDmYAtv4UWLutfgmzlWLDw/rgIrzgfgeChujcvvQonG1TLJAGuIX
 v/X0vzpyssukZdzvLqB61/RaWDyXTQ8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-T-TmfTDNM_uECmSQ1xKtXw-1; Thu, 28 Nov 2024 03:06:40 -0500
X-MC-Unique: T-TmfTDNM_uECmSQ1xKtXw-1
X-Mimecast-MFC-AGG-ID: T-TmfTDNM_uECmSQ1xKtXw
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7b66e8dfe04so67297285a.1
 for <qemu-arm@nongnu.org>; Thu, 28 Nov 2024 00:06:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732781200; x=1733386000;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CVe9xOy+MPsbZXEGhxNCaDYnl7LRyUwGHDKkf1tEUFk=;
 b=esgPoQl2YcWMOjUh2m1RpIeC+3bsRoJpXmDge6sfH3iZKEC7K15j0f8mPjeMrvZ8Bo
 rH9r/0v7xi5cWqZYVwrv/P7kwf0MGTFBfuwYQTzqAZ/sqBn7Zs8mKLH5HRT1bcJZvp7P
 NMoi8uHNEYi6TuT0a/BYhFx0VUH+w/i31Aljrg2zVe62kvlNmPYUpOkrlImnPtZp8H37
 6UPL2qK10ZCmy0st1/g2AP5RXagof5UJFwFaqDX5fTSB3U+l/xJtnO+Eq/EQ0cZDFqe2
 vU7MShI1YRiFFgxXUQmHJ7cW37MvRBVmOBIv7LL5U8KY8vU+QB6ijqjaTJewpBL7GqS6
 UVSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWju5G/LMZsMPxgkBxhirx3xSCfTCNGb9LURYlZ38zuDaF8yCyXvF+Qao63nuBYAHn+wce95Ek9Qg==@nongnu.org
X-Gm-Message-State: AOJu0Yxu0nwVH4HXiSyLEsDFjBQsg3wMDaWLvmW9emBC0Wm3PkLOfiRB
 373vBmQvG49MUWRxD8IrGyvEgWjg6PaXjkDHLh0GUFiWhyaMbZUih2o4MsuLPPi44dBOhrLpt4M
 9eD4CyYIt6gprw1Gg9pxCT+nwgxXunh65e8hwVcG5GIjUURUMYQ==
X-Gm-Gg: ASbGncvZGoYeSYpKSCTR+1J0DCaiqxcKMlFgURnNDyomM79tO1+R9xqWhadd5PO+Mtb
 yX+KmYf4ewMfufSf4rtJYx7gs5e/Kdi6QfOBYuLPZz1eyZ+aowSDCkom2UwskBupQBwBfG1lowu
 09ZzVzUtELFhbBCVyqEMarsu8LLsBq6FksFlh/whyKyrVSPqkNNVHczMOejk6PsS13VMMcv8Zll
 xjhPg7vwLjjmqHkgaVJbiQpqQ7vqjngmRcmX+0ouDubdUCbZ2SKrEGEGZ97ygd79q7fqkeMWWpN
 63YoZ/4sowbGXH+hVX3hhg==
X-Received: by 2002:a05:620a:4049:b0:7b0:6e8:94ef with SMTP id
 af79cd13be357-7b67c0d672dmr859034885a.0.1732781199976; 
 Thu, 28 Nov 2024 00:06:39 -0800 (PST)
X-Received: by 2002:a05:620a:4049:b0:7b0:6e8:94ef with SMTP id
 af79cd13be357-7b67c0d672dmr859032685a.0.1732781199708; 
 Thu, 28 Nov 2024 00:06:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b6849b87d6sm36627585a.98.2024.11.28.00.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 00:06:38 -0800 (PST)
Message-ID: <05470fe6-4336-455a-8b30-e05fb273aa25@redhat.com>
Date: Thu, 28 Nov 2024 09:06:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for SMMUv3
 Nested device
To: Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Donald Dutile <ddutile@redhat.com>, Nicolin Chen <nicolinc@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-3-shameerali.kolothum.thodi@huawei.com>
 <00e8a5d6-c926-44bb-8d11-dab4ddc4820d@redhat.com>
 <ZzTqXCFKV9s++C2N@Asurada-Nvidia>
 <cfe8864c-f830-4b39-b4d5-f219f5a42eea@redhat.com>
 <d8fbaa677771425dac985438b4b1db59@huawei.com>
 <20241127160031.GA1253388@nvidia.com>
 <bd4c4665-148c-427b-8717-457c584fb233@redhat.com>
 <CABQgh9ErT6BmvbrUr_aNiLFws2Kx-=NzGJJCo+vV7AV_U6Pk9g@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CABQgh9ErT6BmvbrUr_aNiLFws2Kx-=NzGJJCo+vV7AV_U6Pk9g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bQBnx0cjWQyWptsW7e8HHIvzPKeNVbzDVAm58q9ceXg_1732781200
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: QZbfTfHA5nce



On 11/28/24 04:25, Zhangfei Gao wrote:
> Hi, Eric
>
> On Thu, 28 Nov 2024 at 00:06, Eric Auger <eric.auger@redhat.com> wrote:
>
>>> Yeah, there is no live migration support yet in the SMMU qmeu driver,
>>> AFAIK?
>> the non accelerated SMMU QEMU device does support migration.
> Could you clarify more about this?
> The migration is not supported if using viommu (SMMU QEMU device), isn't it?
No this is not correct. Current QEMU SMMU device *does* support
migration (see VMStateDescription) as well as qemu virtio-iommu device.
so for instance if you run a guest with smmuv3 and protected virtio-pci
devices this is supposed to be migratable. If it does not work this is
bug and this should be fixed ;-)

Thanks

Eric
>
> Thanks
>

