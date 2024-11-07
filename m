Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4128967njc;
        Thu, 7 Nov 2024 03:11:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWkbuGyo+K21VJKsHJmjrbPSscz5J9/qmssNeALqCeo4UiCU589Y4rBCx0lzXjwpEVz3RmpctudFqHzGg==@linaro.org
X-Google-Smtp-Source: AGHT+IFImBQSmqyiO62vIhCRAgeSLnhxgIhYOWrDQldxiSDB/LY4FixRGWBCFQ8B1qwZIoodzZr9
X-Received: by 2002:a05:6214:418e:b0:6cc:22eb:4508 with SMTP id 6a1803df08f44-6d39a544964mr8031546d6.47.1730977893824;
        Thu, 07 Nov 2024 03:11:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730977893; cv=none;
        d=google.com; s=arc-20240605;
        b=FDLnbTyxOK8qJoCFs5hYgU2QEW6irbep+Aiq5Lo4GE2TwS/3Sly2DBCTdBbcPiEJRD
         RzFM379cF9tndUMMKMAsR1zQzlhQOSAIklDhHlGA5IH3WLY82rNSVHFz6i9HNejyZ+4w
         SzULgAWEu+4spB0pRZzV8FI+ux4t0GTPo9l7WmJnJ4Ch7vQ1Ic2OK17vxB7ff6d2NZa7
         H0+RYlSlvlKqKx+imBN6hzajTyNHFkWgGknYHqOIhpTtpHesdHeVC7mvCM8yvleUyMTO
         elwcE7LP1dGbuJVM30ywZbdRZ8GccTHzcA9sVuCTOp+NOl/uTOlnzN3m/kzyXuHsIQhV
         eh9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zLPbw+LOCiW49xri+PS81nXTSXc9M95CdG7b2wuAfuY=;
        fh=XRf8EflgBuQ1RMYNl8VXSE03Ip/QqF6c6j0oa2kxOJA=;
        b=X11N2zoeHusb/3f7xWu3JZzqQg8X7oKY//GAkKKCYSr9OFX6GV9rKUUJSG7kNLq01e
         UzL2dkVu2aQ0PBB2nEUS7ClHRH5NlAzbEg0gyo6eKKs+0+OWfe85aai364k8xfWmZ+nJ
         pLXVVZDrvcSHDgUZzVpDcOT9hWjYAc8CBIItbtX2FVzn16tMCc96537r4FUQBQ0zh9S7
         O5CO67DH0bZy+O7PssOnyvGrLoyAH+2Y3GfnONol7yVlJlqBKYa6TffdykvHpirIsJCF
         Vm20tExK4dwxslGIwV+2OUyrwufOs0KbXZrxN2npljhJBBbcNWHkMnULCgIoqsFd2+49
         yKtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MzS0W8dD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d39620f4b7si12625796d6.6.2024.11.07.03.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2024 03:11:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MzS0W8dD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t90Q9-00067t-Kc; Thu, 07 Nov 2024 06:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1t90Q5-00067c-If
 for qemu-devel@nongnu.org; Thu, 07 Nov 2024 06:11:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1t90Q1-0002te-Qu
 for qemu-devel@nongnu.org; Thu, 07 Nov 2024 06:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730977874;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zLPbw+LOCiW49xri+PS81nXTSXc9M95CdG7b2wuAfuY=;
 b=MzS0W8dDplR27hBvZT/mzNcxJycaVWidi1yTD7YYMDEMnmCzseEXgj8oCArfWYlce7OZpo
 EUQQkNASGZWvrpaR/9vO3uYGRDgN5sL+GqQb6KNPkuqOsyGjZSX94IaSMhzxynPh/hnCju
 y7pNEu5P35LR7ARj4xnn944OltQ8AM0=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-K840HQXmORqDwui_Ddwc5w-1; Thu, 07 Nov 2024 06:11:11 -0500
X-MC-Unique: K840HQXmORqDwui_Ddwc5w-1
X-Mimecast-MFC-AGG-ID: K840HQXmORqDwui_Ddwc5w
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2fcda6c1906so5353811fa.1
 for <qemu-devel@nongnu.org>; Thu, 07 Nov 2024 03:11:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730977870; x=1731582670;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zLPbw+LOCiW49xri+PS81nXTSXc9M95CdG7b2wuAfuY=;
 b=SwZ+NTKGe0AjKt1smMWkViafMYhxBMI9SSxnawvqKW2K+M/jvsbgLcihEP3W28vp3s
 OBL0JhkR81Pr5DrQDO5YdFfnT7pWryLitv55MW3hXyAm6N6yOh63F1ewT9mCenkpUXBU
 UIRQJakV5rB7Q2BiXu5uILxYKEOtFPfPqPvQ+1QFdzvO1qV3E4lYzPAk7x8xOYsrzRq3
 flKrkxnlwC7jk4sj0l2zNbFln7klvju/RBmGuujXxKtTZzo/46Q79rVa+hw1yOrfBCGi
 4azMkJdS/EX/k72vICEvJGaur7HAuHofHdwtVRlPkoIlkKFPkXPrzqwVQmAQNW3RRUNO
 SvYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg21npmfsTxG4dq6VTxEi0VOthKn/adfXbMbHdW944X96horpGxQS0/x64ec4qGM1h6kf6LMuGnqgD@nongnu.org
X-Gm-Message-State: AOJu0Yye1yokdp9Gac1Da+925BLHfr5rVUNbnno4VyUTrWqmekRrK7Zx
 mmI0dTwGFqJAWbZ1bhNPxsAg7ng77dtLUgQzNk3MiSsoxE5kWU8ld9Iw4KtwIM8pmsWxbMtDkn6
 4rRylE/NWuS9KMUGrTScRLuQYwdwRkoDN1uq/UW7REvyjSVDggfL8
X-Received: by 2002:a05:651c:1592:b0:2f6:62a1:25fe with SMTP id
 38308e7fff4ca-2ff1a92f814mr6669661fa.23.1730977870023; 
 Thu, 07 Nov 2024 03:11:10 -0800 (PST)
X-Received: by 2002:a05:651c:1592:b0:2f6:62a1:25fe with SMTP id
 38308e7fff4ca-2ff1a92f814mr6668871fa.23.1730977869059; 
 Thu, 07 Nov 2024 03:11:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b053ff08sm20437535e9.10.2024.11.07.03.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 03:11:07 -0800 (PST)
Message-ID: <1845a6b8-5214-4379-85f4-3d36b61059dd@redhat.com>
Date: Thu, 7 Nov 2024 12:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: nested-smmuv3 topic for QEMU/libvirt, Nov 2024
Content-Language: en-US
To: Nicolin Chen <nicolinc@nvidia.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: Mostafa Saleh <smostafa@google.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Moritz Fischer <mdf@kernel.org>, Michael Shavit <mshavit@google.com>,
 Andrea Bolognani <abologna@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Zhangfei Gao <zhangfei.gao@linaro.org>, nathanc@nvidia.com,
 arighi@nvidia.com, ianm@nvidia.com, jan@nvidia.com, mochs@nvidia.com,
 Don Dutile <ddutile@redhat.com>
References: <ZyRUcGKKS6NbIV5O@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ZyRUcGKKS6NbIV5O@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NBsUkAcrZJJQ

Hi Nicolin,

On 11/1/24 05:09, Nicolin Chen wrote:
> Hi,
>
> This is a continued discussion following previous month's:
> https://lore.kernel.org/qemu-devel/Zvr%2Fbf7KgLN1cjOl@Asurada-Nvidia/
>
> Kernel changes are getting closer to merge, as Jason's planning to
> take vIOMMU series and smmuv3_nesting series into the iommufd tree:
> https://lore.kernel.org/all/cover.1730313494.git.nicolinc@nvidia.com/
> https://lore.kernel.org/all/cover.1730313494.git.nicolinc@nvidia.com/
> https://lore.kernel.org/all/0-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com/
>
> So, I think it's probably a good time to align with each others and
> talk about kicking off some QEMU upstream work in the month ahead.
>
> @Shameer,
> Do you have some update on the pluggable smmuv3 module?
>
> Updates on my side:
> 1) I have kept uAPI updated to the latest version and verified too.
>    There should be some polishing changes depending on how the basic
>    nesting infrastructure would look like from Intel/Duan's work.
> 2) I got some help from NVIDIA folks for the libvirt task. And they
>    have done some drafting and are now verifying the PCI topology
>    with "iommu=none".
>
> Once the pluggable smmuv3 module is ready to test, we will make some
> change to libvirt for that and drop the auto-assigning patches from
> the VIRT code, so as to converge for a libvirt+QEMU test.
>
> FWIW, Robin requested a different solution for MSI mapping [1], v.s.
> the RMR one that we have been using since Eric's work. I drafted a
> few VFIO/IOMMUFD patches for that, yet paused for getting the vIOMMU
> series merged to this kernel cycle. I plan to continue in Nov/Dec.
> So, for the near term we will continue with the RMR solution, until
> we have something solid later.
>
> [1] https://lore.kernel.org/linux-iommu/ZrVN05VylFq8lK4q@Asurada-Nvidia/

At Red Hat we may find some cycles to resume working on the QEMU
integration. Please can you sketch some tasks we could carry out in
coordination with you and Shameer? Adding Don in the loop.

Thank you in advance

Eric
>
> Thanks
> Nicolin
>

