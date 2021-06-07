Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3318027lfa;
        Mon, 7 Jun 2021 02:20:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPy85KHnd2CR8y6yJjV8VLUhHX+PR5JmnBlU2/NM11QZRDgqd+VJm6tsKW7nJdkSh64hVk
X-Received: by 2002:a25:764c:: with SMTP id r73mr23546681ybc.271.1623057601192;
        Mon, 07 Jun 2021 02:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623057601; cv=none;
        d=google.com; s=arc-20160816;
        b=eo1U31SODaBfG+SXiWsGXJOvXRmaFxswKT+HbeR0AePMGogAJQSeJ6DNbunU3iazej
         ViE3rLzI8m45xGH3VM0FEuBdy8hwCtOmZ62zibEQ6/GX969p2ifih8hY0auwhJsVDPIT
         /8mIxKVCZU0iuMCfDb2pibI6sBf/fk6f+7GwcZ7LTXbtAfxNCAbf6goPS/7wgCHKpnsb
         iOnx43e+r50L713FRYnYOuVKUrWJD828Wi5dWW0xS2a0TJQ93mC+scPw6wh02NGYJmSU
         YdWV66lDHqpA5qJtCjTrtTQUesEKAMs0kMgEuTrUOwWIsJaqGnrc3ym58sjqgZqB+WtJ
         cGfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bFdNlErOxTqFKbmwI105aIqMjRySxdMaBEh8q3km9rs=;
        b=MipgRo0v0SeZYeJyroDD0hABr2xNB92Tcon1/ckPpXxHLSTKsBLTgLznn6UjWKhZGe
         Cj+Hfsmm09kFsUGgVrP0mHssjmZBk79/k9XVkjNR5ByvLfmnU1FBLYhyopWScWQH08C1
         or9ND+6RC76W+ylaSeXCfcgfSD+OIIs375VxrjDFNU8XAPaTnZbpmKFfh1WzFK7knBxU
         3YFuHGQI+ea2SPPaLRw11ZcBACy5h2JnVq/NXcZfRScN5fm7RPxU3eAz+iAl63jKTg6o
         OF/ygPsEyn7IyY1M7Q1zIPKd1eVNrxQDzkGUFo3xXLVIYB+FL11VbjLpfceEGlI/3pqW
         3ewg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UvsVwNC6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10si3413646ybc.390.2021.06.07.02.20.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 02:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UvsVwNC6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqBQO-0000tX-Gb
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 05:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lqBQA-0000rA-Qv
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 05:19:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lqBQ8-0005aV-H7
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 05:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623057583;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFdNlErOxTqFKbmwI105aIqMjRySxdMaBEh8q3km9rs=;
 b=UvsVwNC6WOvBg1N2HhdSCkFHoQovpfcqQ7xEvnErrnPP2iBriMQQFDJyOhkztiuezKhGlp
 LQNyS3cAsPirDYRxNCRE4m+K1JjL6r3Xhj1GGl5Sn7onqAEbSiJ1IhlM4xq0BsHduQTmqx
 RL6KRnwvVib0gRE4uyMtrM6fiKSrCUw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-YPooWrShNTKzXcF2uXiOpQ-1; Mon, 07 Jun 2021 05:19:42 -0400
X-MC-Unique: YPooWrShNTKzXcF2uXiOpQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l185-20020a1c25c20000b029014b0624775eso6648628wml.6
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 02:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=bFdNlErOxTqFKbmwI105aIqMjRySxdMaBEh8q3km9rs=;
 b=ET/wkr0Kuism5cjcvqb8ag5Evu4qkslEO8d79hIJ1jlwW9kvuK8t/HpNwNAlSWZ46x
 bu+iJkxHgt8XX65B5mBk6CaZn8frNtNggvmlSGfuSs3C20ULZK7u+aDff6ewxiqV1rcj
 7R8bl2jU1GpFlovOuSV+rF4MXi3kPWnTyxXHG2vHIYi1dfP3//0CgWRSPGAlgFQElfb7
 mfGMbfquiEKylMoa68RN2yONkONWfMuAyO3rGT7WgMJtTtYjkA98j+G8FFGmiJegRwQH
 YX+mUZXVaN8XedWbc7vQBhIbcGI1xbtev2EmrEQ8etgRm2DJq+1Q434h5Q7+E6bFZ6Pg
 226g==
X-Gm-Message-State: AOAM531px5cLfvgRhy7kZmWWTmK/hkMTnt64rcls8jf12o2PQd8pBA/Y
 +WMKPQwyZDxNzmwgRjBlEdn7AopZZQ3BsT32iNSscsh2izTyZGTjatvdDBkYRwykMRejWj1SUfw
 y8Mly5oyo8bMj
X-Received: by 2002:a5d:6443:: with SMTP id d3mr16301425wrw.389.1623057581264; 
 Mon, 07 Jun 2021 02:19:41 -0700 (PDT)
X-Received: by 2002:a5d:6443:: with SMTP id d3mr16301411wrw.389.1623057581065; 
 Mon, 07 Jun 2021 02:19:41 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r7sm21072609wma.9.2021.06.07.02.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 02:19:40 -0700 (PDT)
Subject: Re: [RESEND] Multiple SMMUv3 instances on PCI Bus and PCI Host Bridge
To: Nicolin Chen <nicolinc@nvidia.com>, miaoyubo@huawei.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20210604231613.GC15599@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <a349744d-762b-74b9-352b-ad0a7b16dfec@redhat.com>
Date: Mon, 7 Jun 2021 11:19:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604231613.GC15599@Asurada-Nvidia>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Reply-To: eric.auger@redhat.com
Cc: vdumpa@nvidia.com, praithatha@nvidia.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0JdWsZD+v49x

Hi,
On 6/5/21 1:16 AM, Nicolin Chen wrote:
> (Resending as my previous mail didn't go through mailing lists)
>
> Hello Eric, Yubo, and other QEMU developers,
>
> I am having a problem with links between vSMMU and PCI Host Bridge,
> using ARM-VIRT (64-bit; ACPI) + SMMUv3 (nested translation) setup.
>
> Firstly, I am very new to the areas of QEMU, PCI and ACPI. So some
> of my thoughts/ideas below might not sound very reasonable to you.
>
> My goal here is to create two vSMMU instances in QEMU level and to
> link them to different passthrough devices: each vSMMU has my local
> feature that reads/writes through a VFIO mdev interface to talk to
> Host OS, so it has to be two vSMMU instances in the QEMU level for
> my use case.
>
> As we know, QEMU by default has only one PCI root bus (PCIE.0) that
> links to a default vSMMU (let's call it vSMMU0). And I learned that
> now ARM-VIRT has PCI gpex feature. So I was planning to create one
> host bridge (PCIE.128) to link to a different instance (vSMMU1) --
> later on I can pass through different PCI devices to either PCIE.0
> or PCIE.128 for different mdev pathways.
>
> I then tried to add a PCI Host Bridge using the following commands
> that created one default vSMMU instance, as my first experiment.
>
> /home/ubuntu/qemu-system-aarch64
>     -machine virt,accel=kvm,gic-version=3,iommu=smmuv3 \
>     -cpu host -smp cpus=1 -m 1G -nographic -monitor none -display none \
>     -kernel /boot/Image -bios /usr/share/AAVMF/AAVMF_CODE.fd \
>     -initrd /home/ubuntu/buildroot-20200422-aarch64-qemu-test-rootfs.cpio \
>     -object memory-backend-ram,size=1G,id=m0 \
>     -numa node,cpus=0,nodeid=0,memdev=m0 \
>     -device pxb-pcie,id=pxb-pcie.128,bus=pcie.0,bus_nr=128,numa_node=0 \
>     -device pcie-root-port,id=pcie.128,bus=pxb-pcie.128,slot=1,addr=0,io-reserve=0 \
>     -device vfio-pci,host=0003:01:00.0,rombar=0,bus=pcie.128
>
> However I found that PCIE.128 was also added to vSMMU0, which feels
> like that PCIE.128 treated PCIE.0 root bus as a parent device so it
> was added to the parent's vSMMU too.
>
> Then I tried another experiment with the following hack, hoping that
> it would link vSMMU0 to PCIE.128 instead of PCIE.0:
>
> @@ -385,13 +387,13 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      /* fully coherent device */
>      rc->memory_properties.cache_coherency = cpu_to_le32(1);
>      rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
>      rc->pci_segment_number = bus_num; /* MCFG pci_segment */
> +    rc->pci_segment_number = cpu_to_le32(bus_num); /* MCFG pci_segment */
>
>      /* Identity RID mapping covering the whole input RID range */
>      idmap = &rc->id_mapping_array[0];
>      idmap->input_base = 0;
>      idmap->id_count = cpu_to_le32(0xFFFF);
> -    idmap->output_base = 0;
> +    idmap->output_base = cpu_to_le32(bus_num << 16);
>
> Yet, I found it's not successful either: the vSMMU instance was not
> added to either PCIE.0 or PCIE.128.
>
> So I started to have questions in my mind:
> (1) Can PCI host bridge (PCIE.128) add to a different vSMMU without
>     following PCIE.0's SMMU setup?
changes need to be made in hw/arm/virt.c
create_smmu() is passed the primary bus the iommu is attached to.
Currently arm virt only supports one smmu instance. So playing with qemu
options is not sufficient.
Besides that, effectively there are IORT changes needed because you need
to route RCs to the different SMMU instances, ie. some RIDs need to
reach SMMU#0 and others #SMMU#1.
You can get inspired of "[PATCH v4 6/8] hw/arm/virt-acpi-build: Add
explicit IORT idmap for smmuv3 node for this kind of changes."

Thanks

Eric
> (2) If the answer to (1) is yes, is there any way to have two pairs
>     of PCI+vSMMU?
> (3) If the answer to (1) is no, how can I correctly change the iort
>     table to link vSMMU to PCIE.128?
>
> Thanks
> Nic
>

