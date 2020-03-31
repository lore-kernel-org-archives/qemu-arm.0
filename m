Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3682677lfi;
        Tue, 31 Mar 2020 01:12:39 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vshLgoTrbok+HLMX94CAgF52WvExi6wXZw+KTa36ZcwHbZCgQv1AteJ4Rn9W0ycExxnOKhh
X-Received: by 2002:aed:2c23:: with SMTP id f32mr3856960qtd.251.1585642359001;
        Tue, 31 Mar 2020 01:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585642358; cv=none;
        d=google.com; s=arc-20160816;
        b=AQadWaGpTQ6TIpf3IwiK8cRfubXT4aaku6FvYG5RONFAODoRnNLuKjJI7Vo9qSVVc5
         eCQG4r1gVn7DEJvo6TZkAqi1loVcfT14VFJMWGuV/0/L0cDItft8jjKJIBeLXqyWb2aX
         Vm+bpDU6SIXamafWQ8RNyrq+0ffuZ+/JG5XBIHTSW1vKV80ZbHPF3ybowVHbI98DqUBM
         wStsahy4GaWaTyThQ+a8phkClftA901La8ICzK7R0SrpHqaNxhda/QxHAu7Fm82mYsUy
         35rnOjJee7g3EkgLtpz+F6xpVJhz5ma71059YCR95gvfJZ5cqSm0TwmMKfLCaVKFXEu4
         gpwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QAL4BkbnvjE9nOID52HcQWMjYh1jM5m1zG24Y5v5V9A=;
        b=J7FVuEDkB0/cZbOpa9BWTFzOf5k0j5dambqCqS/UFk/Et7Mhw5O4aPf7InRllYVAEe
         ExwfZ19J8OA9sNEt/bBy0W75s9Op+YcQ5YqQyE8n6aan8b/ViPF1AYnQM588ZPevCDOg
         gSjkwWBxLu5hMA7ImR93hyocOK2EyU1xGU5jpaHXVD/bMsucwe6pseXjxbFTvJnddWg8
         8IqlaqTVWMmOQQd6RYhEueFsnxEabkyELMydX4P6OgdnVf6YKhwOSrxS9W3TSIo4rbLZ
         BQ2DvUJEIP5SH7uTFyVLU0Rzxo+CpZkKpeHCnVf59jEEwIxKnYag0ppAVy1H3LdMqBcr
         N6mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=O0twhlkf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p202si9596006qke.256.2020.03.31.01.12.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 01:12:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=O0twhlkf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJC0k-0005Jv-F1
	for alex.bennee@linaro.org; Tue, 31 Mar 2020 04:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55332)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jJC0a-0005JR-U0
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 04:12:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jJC0Z-0001Gg-D6
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 04:12:28 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28893
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jJC0Z-0001GU-9A
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 04:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585642346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QAL4BkbnvjE9nOID52HcQWMjYh1jM5m1zG24Y5v5V9A=;
 b=O0twhlkfmBrAvFP2IYf5uQf4M0REv0qda4ajecEuFEVvciVsfMAuQPaENr6yzzj3SdxZex
 vyiX3pk7gMoOw5chH0Tk/tVQiwOBDlg8fPLfA1sJjaDRj28ZVUlqlA43s0jrT6mwDTzaZw
 3HEvI/xsObpb6mYwjhSfpwemp7SApqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-EUHCfo8FMr64GkoBfXSRIQ-1; Tue, 31 Mar 2020 04:12:23 -0400
X-MC-Unique: EUHCfo8FMr64GkoBfXSRIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 799CD1088380;
 Tue, 31 Mar 2020 08:12:21 +0000 (UTC)
Received: from [10.36.112.58] (ovpn-112-58.ams2.redhat.com [10.36.112.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DE8C101E817;
 Tue, 31 Mar 2020 08:12:03 +0000 (UTC)
Subject: Re: [RFC v6 00/24] vSMMUv3/pSMMUv3 2 stage VFIO integration
To: Zhangfei Gao <zhangfei.gao@linaro.org>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
References: <20200320165840.30057-1-eric.auger@redhat.com>
 <73b1c3e1-a418-f57c-d949-261250d6a79b@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c15f98fb-01d7-cb2f-5401-4b648997fcba@redhat.com>
Date: Tue, 31 Mar 2020 10:12:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <73b1c3e1-a418-f57c-d949-261250d6a79b@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
 shameerali.kolothum.thodi@huawei.com, peterx@redhat.com, bbhushan2@marvell.com,
 will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z8YAUFDO8u3R

Hi Zhangfei,

On 3/31/20 8:42 AM, Zhangfei Gao wrote:
> Hi, Eric
>=20
> On 2020/3/21 =E4=B8=8A=E5=8D=8812:58, Eric Auger wrote:
>> Up to now vSMMUv3 has not been integrated with VFIO. VFIO
>> integration requires to program the physical IOMMU consistently
>> with the guest mappings. However, as opposed to VTD, SMMUv3 has
>> no "Caching Mode" which allows easy trapping of guest mappings.
>> This means the vSMMUV3 cannot use the same VFIO integration as VTD.
>>
>> However SMMUv3 has 2 translation stages. This was devised with
>> virtualization use case in mind where stage 1 is "owned" by the
>> guest whereas the host uses stage 2 for VM isolation.
>>
>> This series sets up this nested translation stage. It only works
>> if there is one physical SMMUv3 used along with QEMU vSMMUv3 (in
>> other words, it does not work if there is a physical SMMUv2).
>>
>> - We force the host to use stage 2 instead of stage 1, when we
>> =C2=A0=C2=A0 detect a vSMMUV3 is behind a VFIO device. For a VFIO device
>> =C2=A0=C2=A0 without any virtual IOMMU, we still use stage 1 as many exi=
sting
>> =C2=A0=C2=A0 SMMUs expect this behavior.
>> - We use PCIPASIDOps to propage guest stage1 config changes on
>> =C2=A0=C2=A0 STE (Stream Table Entry) changes.
>> - We implement a specific UNMAP notifier that conveys guest
>> =C2=A0=C2=A0 IOTLB invalidations to the host
>> - We register MSI IOVA/GPA bindings to the host so that this latter
>> =C2=A0=C2=A0 can build a nested stage translation
>> - As the legacy MAP notifier is not called anymore, we must make
>> =C2=A0=C2=A0 sure stage 2 mappings are set. This is achieved through ano=
ther
>> =C2=A0=C2=A0 prereg memory listener.
>> - Physical SMMU stage 1 related faults are reported to the guest
>> =C2=A0=C2=A0 via en eventfd mechanism and exposed trhough a dedicated VF=
IO-PCI
>> =C2=A0=C2=A0 region. Then they are reinjected into the guest.
>>
>> Best Regards
>>
>> Eric
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/v4.2.0-2stage-rfcv6
>>
>> Kernel Dependencies:
>> [1] [PATCH v10 00/11] SMMUv3 Nested Stage Setup (VFIO part)
>> [2] [PATCH v10 00/13] SMMUv3 Nested Stage Setup (IOMMU part)
>> branch at:
>> https://github.com/eauger/linux/tree/will-arm-smmu-updates-2stage-v10
> Really appreciated that you re-start this work.
>=20
> I tested your branch and some update.
>=20
> Guest: https://github.com/Linaro/linux-kernel-warpdrive/tree/sva-devel
> <https://github.com/Linaro/linux-kernel-warpdrive/tree/sva-devel>
> Host:
> https://github.com/eauger/linux/tree/will-arm-smmu-updates-2stage-v10
> <https://github.com/eauger/linux/tree/will-arm-smmu-updates-2stage-v10>
> qemu: https://github.com/eauger/qemu/tree/v4.2.0-2stage-rfcv6
> <https://github.com/eauger/qemu/tree/v4.2.0-2stage-rfcv6>
>=20
> The guest I am using is contains Jean's sva patches.
> Since currently they are many patch conflict, so use two different tree.
>=20
> Result
> No-sva mode works.
> This mode, guest directly get physical address via ioctl.
OK thanks for testing
>=20
> While vSVA can not work, there are still much work to do.
> I am trying to SVA mode, and it fails, so choose no-sva instead.
> iommu_dev_enable_feature(parent, IOMMU_DEV_FEAT_SVA)
Indeed I assume there are plenty of things missing to make vSVM work on
ARM (iommu, vfio, QEMU). I am currently reviewing Jacob and Yi's kernel
and QEMU series on Intel side. After that, I will come back to you to
help. Also vSMMUv3 does not support multiple contexts at the moment. I
will add this soon.


Still the problem I have is testing. Any suggestion welcome.

Thanks

Eric
>=20
> I am in debugging how to enable this.
>=20
> Thanks
>=20
>=20

