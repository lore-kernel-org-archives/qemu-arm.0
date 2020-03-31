Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3655652lfi;
        Tue, 31 Mar 2020 00:37:03 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsbU4ORYFe8Y3iSRJUC51IJsoxLT1XsmNxMn5oIvu7ZyYC7Du/xj/i5Xwuv5JIxzc0VaO3s
X-Received: by 2002:ac8:4e51:: with SMTP id e17mr3852124qtw.101.1585640223639;
        Tue, 31 Mar 2020 00:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585640223; cv=none;
        d=google.com; s=arc-20160816;
        b=Ba71aoFyjfQaWRNNQxJl/DQ8zMmp6+FCsjRVR3f0B4Fp9iFA9HUviiR7lNtmOqnIVS
         XA2sfIB3pIcRxKoIMcpQh+qZFBvRPveGMTPAQZHJRbBXqP05Cm97VHBIBNEeyr3j9WSm
         akPpIxnvcueRJyKGO7s6NVhdaT5hZSVCPzaqT2L13djwHoIrRHla0vPKaNV2gauhnyCW
         68CqQYoNMCio9wc0/MOUEuBoXyPD5tUVFNmLKUt/f5gGLTgG6+HYHqDvm/PoKacxKa4K
         radLOg4ISUD/EstRkRfDtBUrDSQm17Q/6oqp6y4BB2pF9SO4Y+7XVxQHsZYiUlAPaCy3
         dn3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HWKo00iz8fvROFUAHZ5wh/5hjLTRWUP788xE8iR+dm0=;
        b=sbc+V8yH1dTWCgAPfTi7kd2UKcKIVG5p2nhiGFAx3YZwHiF1oQ4RYD3d4KBXDCEBKN
         gS4Vyyo+Z7y3Owkf0MYX8tymaapaswRU3Y/u+w4s//ZPsGWAPg6R3mg+zHB7VXA8Y+ck
         6w9AE3yWYBcuW6ev3ID30M+bIPNCw/kUe1on+XWGz4WgtzWCn85j7o7VD0WXSBmlre4I
         x9+iv0XKztM85ArQ7J5tYw/rSdebuAHXQsLx2lp2jya5UCcKUnNQHEbvE6AZFmE8/tCR
         6bcbb3SrNPUAZ/Zp3c3QR2a6/1IYDqaVmeN3YkOKWBhP+ye92A1Pb2UZ0wZRXPX5Q4ZA
         NGlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ne0LxTmX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p17si9101734qtu.73.2020.03.31.00.37.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 00:37:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ne0LxTmX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJBSJ-0002wR-3l
	for alex.bennee@linaro.org; Tue, 31 Mar 2020 03:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47282)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhangfei.gao@linaro.org>) id 1jJAbZ-0005RI-O4
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 02:42:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhangfei.gao@linaro.org>) id 1jJAbX-00026J-LZ
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 02:42:33 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36426)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <zhangfei.gao@linaro.org>)
 id 1jJAbX-00023H-9C
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 02:42:31 -0400
Received: by mail-pg1-x542.google.com with SMTP id c23so1528676pgj.3
 for <qemu-arm@nongnu.org>; Mon, 30 Mar 2020 23:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=HWKo00iz8fvROFUAHZ5wh/5hjLTRWUP788xE8iR+dm0=;
 b=ne0LxTmXheyqWvplQua1gZp1Jj8sfmo3Iq5BVA2ncwOCl/Muu7H3VjyGs6rXpAeWXf
 1yrriluz6hVMviDugkkiRNuBhw1Tk8seAOqdlFgq9dZpv3OMT8IH478whrHXziN/54S9
 pilEljZBufxp50r/KFh1tMtzO/JStpVROUrPF8CF54Iz9Gt0/aaJU7mGm7iqn4eGoY6P
 o5xho3Af7F6ATfWmJcg5hCVTug/RLZYl8+YJU65bkaVmD94PCjeLfkfvybNOf+k81Au+
 7O55Jiq6dwD4zFh0yozIu7TlpUSi7pdYoYUSeySu8O/M2z5Um15m4tJY+MV9oQbcNCto
 vFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HWKo00iz8fvROFUAHZ5wh/5hjLTRWUP788xE8iR+dm0=;
 b=SqK6ImijMuSa7RUTYkH3BAtOJCMQwVqtWeFuanZyu+LHVI24MTuEyUfGsWHdhmGQfn
 pEWUmCIuQM/qXqKoAufZ4UmLMAh21QY3hSmlifnj6kziSUlz6ZDPk6bKq+M7dibJhRPT
 XNiotESXwWu8htKCQHMURHnAEZ0NYF1B5Xz0YZasNlqZn6OxlYIkfCZi46KQrGS33+2P
 d+jBppC53CALztx2VAcAAUy96cbObx+Ie9DU+paJqPCXPpbGPPqnytZG2emdndAlHryP
 hCVmajRrWFLDWdmgJsgrQGW2Z+L47NIE8AbXcWNt8VvC81lyxIiirA8yurjsV5CPCZe9
 gj9w==
X-Gm-Message-State: ANhLgQ2UWTAZT5Jakd4L+8vG3M6Zl1TKwY3yAUQEdsG/IVq8taD/b9A+
 td6fBQSXabg2JUSg8vD8QMAZug==
X-Received: by 2002:a63:bf4e:: with SMTP id i14mr16015360pgo.41.1585636944877; 
 Mon, 30 Mar 2020 23:42:24 -0700 (PDT)
Received: from [10.27.0.210] ([45.135.186.113])
 by smtp.gmail.com with ESMTPSA id h4sm1928170pgg.67.2020.03.30.23.42.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Mar 2020 23:42:24 -0700 (PDT)
Subject: Re: [RFC v6 00/24] vSMMUv3/pSMMUv3 2 stage VFIO integration
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
References: <20200320165840.30057-1-eric.auger@redhat.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Message-ID: <73b1c3e1-a418-f57c-d949-261250d6a79b@linaro.org>
Date: Tue, 31 Mar 2020 14:42:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200320165840.30057-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
X-Mailman-Approved-At: Tue, 31 Mar 2020 03:36:49 -0400
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 peterx@redhat.com, shameerali.kolothum.thodi@huawei.com,
 zhangfei.gao@linaro.org, bbhushan2@marvell.com, will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o/1wxHmIuqVi

Hi, Eric

On 2020/3/21 上午12:58, Eric Auger wrote:
> Up to now vSMMUv3 has not been integrated with VFIO. VFIO
> integration requires to program the physical IOMMU consistently
> with the guest mappings. However, as opposed to VTD, SMMUv3 has
> no "Caching Mode" which allows easy trapping of guest mappings.
> This means the vSMMUV3 cannot use the same VFIO integration as VTD.
>
> However SMMUv3 has 2 translation stages. This was devised with
> virtualization use case in mind where stage 1 is "owned" by the
> guest whereas the host uses stage 2 for VM isolation.
>
> This series sets up this nested translation stage. It only works
> if there is one physical SMMUv3 used along with QEMU vSMMUv3 (in
> other words, it does not work if there is a physical SMMUv2).
>
> - We force the host to use stage 2 instead of stage 1, when we
>    detect a vSMMUV3 is behind a VFIO device. For a VFIO device
>    without any virtual IOMMU, we still use stage 1 as many existing
>    SMMUs expect this behavior.
> - We use PCIPASIDOps to propage guest stage1 config changes on
>    STE (Stream Table Entry) changes.
> - We implement a specific UNMAP notifier that conveys guest
>    IOTLB invalidations to the host
> - We register MSI IOVA/GPA bindings to the host so that this latter
>    can build a nested stage translation
> - As the legacy MAP notifier is not called anymore, we must make
>    sure stage 2 mappings are set. This is achieved through another
>    prereg memory listener.
> - Physical SMMU stage 1 related faults are reported to the guest
>    via en eventfd mechanism and exposed trhough a dedicated VFIO-PCI
>    region. Then they are reinjected into the guest.
>
> Best Regards
>
> Eric
>
> This series can be found at:
> https://github.com/eauger/qemu/tree/v4.2.0-2stage-rfcv6
>
> Kernel Dependencies:
> [1] [PATCH v10 00/11] SMMUv3 Nested Stage Setup (VFIO part)
> [2] [PATCH v10 00/13] SMMUv3 Nested Stage Setup (IOMMU part)
> branch at: https://github.com/eauger/linux/tree/will-arm-smmu-updates-2stage-v10
Really appreciated that you re-start this work.

I tested your branch and some update.

Guest: https://github.com/Linaro/linux-kernel-warpdrive/tree/sva-devel 
<https://github.com/Linaro/linux-kernel-warpdrive/tree/sva-devel>
Host: 
https://github.com/eauger/linux/tree/will-arm-smmu-updates-2stage-v10 
<https://github.com/eauger/linux/tree/will-arm-smmu-updates-2stage-v10>
qemu: https://github.com/eauger/qemu/tree/v4.2.0-2stage-rfcv6 
<https://github.com/eauger/qemu/tree/v4.2.0-2stage-rfcv6>

The guest I am using is contains Jean's sva patches.
Since currently they are many patch conflict, so use two different tree.

Result
No-sva mode works.
This mode, guest directly get physical address via ioctl.

While vSVA can not work, there are still much work to do.
I am trying to SVA mode, and it fails, so choose no-sva instead.
iommu_dev_enable_feature(parent, IOMMU_DEV_FEAT_SVA)

I am in debugging how to enable this.

Thanks

