Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1798481njb;
        Mon, 10 Feb 2025 00:47:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUr+mriRwCPjIpC5eTgHw2oKaXjHD0W7X5T/Am3K40S1s/BeXHCeY9gWD4Tdx6soRKeSFJO/qzAfoQjBw==@linaro.org
X-Google-Smtp-Source: AGHT+IGov0bmkWKw1xAaK9ZJhJPjlBck6jWhbk19LUy4XK2iZS/pycc95Mb5XC8XwUxm+XJ+HDpv
X-Received: by 2002:a05:620a:bcb:b0:7b6:cdd4:bdd8 with SMTP id af79cd13be357-7c047bba9ebmr1750107985a.16.1739177260749;
        Mon, 10 Feb 2025 00:47:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739177260; cv=none;
        d=google.com; s=arc-20240605;
        b=JqhFnICKMVkQin3Rg7FnHc+JxpKWILuPHQwBmiQDSOPzUZk/W6ZqJFCCtAA+cA3tjF
         ctLWT15dejalzKQosXS0nLQRECbyOCpth4ljkx/ohZ8iqcY9uoLj7ICpJum1nOvWDn8x
         jdXqLkHwTjh5FV8q8Cf2/VmjkQwfykJfupvY5nQuQUIrATAypk6P4UHC7REF7aepn7+Y
         i9pWFX/058fLoN6aVgoahM4VdVXZujqRJGBkkzCcskWbHMwEbWArQRd/Bus5NSYZvMFn
         C2izaHrkxRdOPMpyL49XLCJ12XLv8WZOG2QLoPtfi2suspVj19Hw1TTtxNtEXUw8Nk5J
         7tEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=q6Y1JRaaRUtWFZvfGb1RPUPBj4MwuLzl3ZiWakaP89k=;
        fh=59XESeJIlupogMeBIudxgF1UWtSEQHJ11xxyYQtLiYw=;
        b=I25Qy7DMd5jeSfc3xZassEw0iQVVOtNZrSCFWczxWQeqOGPb18X1Sh+SDoLhkgQOE2
         8fPBQ9giehmuZ1p2oZy0/YxnhUDQKGfe59q2cebYXUDfA13jN0j+Xr3F7tshh7OAJGls
         WOr2AtpfG+P0BbEErbfojLLqESKD/bYLb+pPRDOnnrvK75AbAib6vL4Uu9XgdRk/Ibjy
         S+ttJYe8YNS88/GQeLiPl+piNmSwHAs0s5KuJcqL007SNkjXCGViUxTfZPIvyWQ4Jscx
         d+p4uIlBsZbGopYs2tZ0nIvh6/Sj/+TXHYqpc8sAqkE5AHKKGraI3piCvhpNME1aXl8y
         2mZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ur5OtPJA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4719847c73csi7947141cf.358.2025.02.10.00.47.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 00:47:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ur5OtPJA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1thPRz-0006fR-68; Mon, 10 Feb 2025 03:47:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1thPRi-0006Oh-J7
 for qemu-devel@nongnu.org; Mon, 10 Feb 2025 03:47:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1thPRg-00046m-G6
 for qemu-devel@nongnu.org; Mon, 10 Feb 2025 03:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739177231;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6Y1JRaaRUtWFZvfGb1RPUPBj4MwuLzl3ZiWakaP89k=;
 b=Ur5OtPJArpKL5T+xcvl7NEU1xY/E+J67bB+rj/MMpqSQoPhHdafPsPeVGzdWD/o69UVOVA
 e38n+88qNdsMwVq1vK8rQZR8RLCSHc4rIxD966Qu2UvS7JqAGqJrm2Tkg/MMXIWeOZvluy
 Xsc1oAEcn1fWhULqrjoit/MHy11froo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-J2Nu_aErNyOJ1_NlPuBA8A-1; Mon, 10 Feb 2025 03:47:08 -0500
X-MC-Unique: J2Nu_aErNyOJ1_NlPuBA8A-1
X-Mimecast-MFC-AGG-ID: J2Nu_aErNyOJ1_NlPuBA8A
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4393e89e910so5500535e9.0
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2025 00:47:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739177227; x=1739782027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q6Y1JRaaRUtWFZvfGb1RPUPBj4MwuLzl3ZiWakaP89k=;
 b=ZddCGQ8y4zAFVyg/F6vDN0mCzN7OgFY1+nKy2p7oZ5eBKl8CLU9qSGi7StUjfrLYKp
 ywE25ddwRW99GY/vmMmEBgsvU+2wOkjUKlNqRrB9ZSSTCI1l7Rs2yy3hAC1aIHp8cdaU
 oBP/PmxiiowwyUyMvh0RYukpQkGXdzy1j+FGOFAVHMRqQnC4EIx2Z9if7LkWmohBv0dv
 oRVCkh7RpjzrGMCe8HTntAq6H6eNl6fApAwrZ9VcY45giWL/rxWpLpSu5CZeYPfRPByp
 TeaYAC1CvVSplCVHeMHF2CjRTk729vwpany79jDORs0PO71IhZMdEMITVUw6glkvfP4A
 Dt8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDxFWTFt/2+JijqE1A8ojAwikdiFT9NR3EO4OM7quXYjN3+HolQbnmubOTiiECGMkSK1tcQmCvSWvX@nongnu.org
X-Gm-Message-State: AOJu0Yw1KMXh1/GS3k4WxQH+r05G3MV/b1glH0CBquXvO9XYNyTtfnXL
 4uLoT9p6dxmOjDU2j/cAu3esUakNOI59Vt1w9aWXnko7GhVVHBwSB63Y+kowjBUKR7lcmjnQpus
 ywBUHVpM3vxJrL6UhGLgfEqiyUM9e0KKf4VTZikFiiLrq3+AGHK6v
X-Gm-Gg: ASbGnct7WLjE9ZG3G+lK2r2WmrZ01UM96cjOLBZXMZq87tOdkn0RexeqW81KqqmF6op
 3Vk+st3V17Rl29jiWscIYofJHBBxKqq/J48mS3FmjUG7WeaB+3Fbv74Tvk9JlyiQRNOCrXGScjD
 o5Re+A4nDTXWHdPtE5Y49wDDg5ewfx4Iom87O03AoQwd4PxflA5Mjk7aZwcKOTf47PZyoU918zB
 viGC9Yp3ROwDLU7bj48niRtvoFLhKoGel/wtrC0rtOOgrVP10b6JfQx8g26peLfEp9wFdTv/TVV
 4kiX3vktu9KgqqAIpxN6uzjheqOxGAmVWqrL8xsIHRISDK0Tk9OS
X-Received: by 2002:a05:600c:3593:b0:438:e231:d342 with SMTP id
 5b1f17b1804b1-4392497dbe7mr81610315e9.1.1739177227054; 
 Mon, 10 Feb 2025 00:47:07 -0800 (PST)
X-Received: by 2002:a05:600c:3593:b0:438:e231:d342 with SMTP id
 5b1f17b1804b1-4392497dbe7mr81610105e9.1.1739177226722; 
 Mon, 10 Feb 2025 00:47:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc565d62dsm10420009f8f.93.2025.02.10.00.47.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 00:47:05 -0800 (PST)
Message-ID: <07a12390-dea8-49dd-a38e-13aecddc6b87@redhat.com>
Date: Mon, 10 Feb 2025 09:47:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] hw/arm/smmuv3: Move reset to exit phase
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com, jasowang@redhat.com, imammedo@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <20250206142307.921070-5-eric.auger@redhat.com>
 <CAFEAcA_LgrBRbafVQ0vLGPd8xG=wsLjWnKTJ2JSEREYUqgRQBQ@mail.gmail.com>
 <7102d470-ac72-4c02-b8bc-20f1379a4843@redhat.com>
 <CAFEAcA-XK5GwT0b_Ff-8fYnWcDgzaE-0Ei-YqDoXv-aXFGNXUQ@mail.gmail.com>
 <Z6ZHTStx_S9ALdxt@x1.local>
 <CAFEAcA8ovoGsQ9oEco88iw3iUy_3kBOUaYHL+oq5VF-i9xg4+A@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA8ovoGsQ9oEco88iw3iUy_3kBOUaYHL+oq5VF-i9xg4+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: qgDey5h8HrtD


Hi Peter,

On 2/7/25 7:18 PM, Peter Maydell wrote:
> On Fri, 7 Feb 2025 at 17:48, Peter Xu <peterx@redhat.com> wrote:
>> On Fri, Feb 07, 2025 at 04:58:39PM +0000, Peter Maydell wrote:
>>> (I wonder if we ought to suggest quiescing outstanding
>>> DMA in the enter phase? But it's probably easier to fix
>>> the iommus like this series does than try to get every
>>> dma-capable pci device to do something different.)
>> I wonder if we should provide some generic helper to register vIOMMU reset
>> callbacks, so that we'll be sure any vIOMMU model impl that will register
>> at exit() phase only, and do nothing during the initial two phases.  Then
>> we can put some rich comment on that helper on why.
>>
>> Looks like it means the qemu reset model in the future can be a combination
>> of device tree (which resets depth-first) and the three phases model.  We
>> will start to use different approach to solve different problems.
> The tree of QOM devices (i.e. the one based on the qbus buses
> and rooted at the sysbus) resets depth-first, but it does so in
> three phases: first we traverse everything doing 'enter'; then
> we traverse everything doing 'hold'; then we traverse everything
> doing 'exit'. There *used* to be an awkward mix of some things
> being three-phase and some not, but we have now got rid of all
> of those so a system reset does a single three-phase reset run
> which resets everything.
Thank you Peter. This is reassuring. I will add such kind of description
in the commit msg/cover letter.

Eric
>
> -- PMM
>

