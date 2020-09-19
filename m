Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2329935lfq;
        Sat, 19 Sep 2020 04:15:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyixdyH1cRDmu+GctmFMN4Ik9CxbscxsPv7h2NmIlj/nCi3oow33w55dpKdWHBeTK8h5Glv
X-Received: by 2002:a17:907:264c:: with SMTP id ar12mr41784499ejc.80.1600514151872;
        Sat, 19 Sep 2020 04:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600514151; cv=none;
        d=google.com; s=arc-20160816;
        b=KkWYOcgQ3L2C7Q0CWfaAv2dlNuYhmPtE0tg+iY9fqeuKCjDuIwRAe0rfHUboS0ftoi
         yDsvp7aEgxmw29quBzBXm1wqtI7Q0w5xlNldpb9MLj7eVrW42Z6eRTdHigcledo4dm00
         USFjO2DzUxtNB2NQEWZanBY/rQegmjG6h0vGt3ZDOwIKMj39uW5B+oBOgJXpEYLpJVAD
         cn4xnx4GiD1X0DKiJr4ZOP2S1pdEzT/Dp56x0UpJUVh366mq2ADWPB43prTyWXWfeQVK
         vrJ09ZLdF2rqtxf5s4uYUs/87vleYqoUfCMJ/42r8wBGykCbZE+xmibYB19wJo86AYYU
         EPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:content-language
         :mime-version:user-agent:date:message-id:cc:to:subject:from;
        bh=vNwUi2JLPurtdimKJ4Z2B45LFDY9CW6I0hmhrP3G5Sk=;
        b=aMz6U1mAN16BSImeyqQhHUXixBE94g1dFXIyZEJhIiaaZe4/GCgoJOpybW2MyNgvf5
         70liAStEGjzhL3kYWYsV03O6oMmixskZ6Zj7vje7Pkf+rvFeerOmIR3otlBNz+by1Vmd
         KgQxhIKa35DF2KlajZM8/mLHUhOXueJmvP9UFroIYyRCwFLaiV9M917UCjl6LqTd3Diz
         6cyAlWW6i4yRG11SslYHnrpCq0Od9LZhAg3TqP1BVTYiiWUpmxBVnWCIEdwDVnNZZstd
         vfeacmbwZHD0nedVNgWKkgTRCqg4dHixDFxXrmxFYmgxIfLcVziuY5JLGQU1v2gzNQkU
         MRLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id a18si3993538edy.407.2020.09.19.04.15.51;
        Sat, 19 Sep 2020 04:15:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgISLPu (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Sat, 19 Sep 2020 07:15:50 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:13731 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726041AbgISLPu (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 19 Sep 2020 07:15:50 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 0BAC450C2E2CAE8B0AC4;
        Sat, 19 Sep 2020 19:15:49 +0800 (CST)
Received: from [10.174.185.226] (10.174.185.226) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Sat, 19 Sep 2020 19:15:38 +0800
From:   Zenghui Yu <yuzenghui@huawei.com>
Subject: KVM_SET_DEVICE_ATTR failed
To:     <qemu-arm@nongnu.org>, <kvmarm@lists.cs.columbia.edu>,
        <kvm@vger.kernel.org>
CC:     Marc Zyngier <maz@kernel.org>, Eric Auger <eric.auger@redhat.com>,
        "Alex Williamson" <alex.williamson@redhat.com>,
        <wanghaibin.wang@huawei.com>
Message-ID: <1f70926e-27dd-9e30-3d0f-770130112777@huawei.com>
Date:   Sat, 19 Sep 2020 19:15:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Au2Xyj0OIcT5

Hi folks,

I had booted a guest with an assigned virtual function, with GICv4
(direct MSI injection) enabled on my arm64 server. I got the following
QEMU error message on its shutdown:

"qemu-system-aarch64: KVM_SET_DEVICE_ATTR failed: Group 4 attr 
0x0000000000000001: Permission denied"

The problem is that the KVM_DEV_ARM_ITS_SAVE_TABLES ioctl failed while
stopping the VM.

As for the kernel side, it turned out that an LPI with irq->hw=true was
observed while saving ITT for the device. KVM simply failed the save
operation by returning -EACCES to user-space. The reason is explained in
the comment block of vgic_its_save_itt(), though I think the HW bit
should actually be checked in the KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES
ioctl rather than in the ITT saving, well, it isn't much related to this
problem...

I had noticed that some vectors had been masked by guest VF-driver on
shutdown, the correspond VLPIs had therefore been unmapped and irq->hw
was cleared. But some other vectors were un-handled. I *guess* that VFIO
released these vectors *after* the KVM_DEV_ARM_ITS_SAVE_TABLES ioctl so
that we end-up trying to save the VLPI's state.

It may not be a big problem as the guest is going to shutdown anyway and
the whole guest save/restore on the GICv4.x system is not supported for
the time being... I'll look at how VFIO would release these vectors but
post it early in case this is an already known issue (and this might be
one thing need to be considered if one wants to implement migration on
the GICv4.x system).


Thanks,
Zenghui
