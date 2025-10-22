Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20755CCD1AB
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Oct 2025 10:08:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBVlX-0007wo-QV; Wed, 22 Oct 2025 06:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vBVlW-0007wR-KM
 for qemu-arm@nongnu.org; Wed, 22 Oct 2025 06:08:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vBVlR-0008CS-Hf
 for qemu-arm@nongnu.org; Wed, 22 Oct 2025 06:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761127694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rrJD2aykImgZuv8mCfWO7a1gXkuVk8mizg4XSEnTEio=;
 b=FXFuwAYI0xXrqMpLAvsb9mfpvASA3jMDWMVlYAhCDeBqeCX1E/6Bn/NGfPhyPmicYbqPTU
 u05pGvG7j2AKCuUe3iTA4Wh53iaBmZ0LKWsHl9w1XuJm8AsIIa30vWdCbBH2hAY2RBa5eq
 mWbYeCcqUxb0zcUfJNE7ujy6xH7awpo=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-7bc2bWrRPNOOsSxqrHkIMQ-1; Wed, 22 Oct 2025 06:08:12 -0400
X-MC-Unique: 7bc2bWrRPNOOsSxqrHkIMQ-1
X-Mimecast-MFC-AGG-ID: 7bc2bWrRPNOOsSxqrHkIMQ_1761127691
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-33428befc08so2857846a91.2
 for <qemu-arm@nongnu.org>; Wed, 22 Oct 2025 03:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761127691; x=1761732491;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rrJD2aykImgZuv8mCfWO7a1gXkuVk8mizg4XSEnTEio=;
 b=SrAw9+Z9mNTpZoSTH7dfvYX3HNWS3woklnuX2ufeEMwN873p1CP6rKpUt35UKa1TX2
 Ezb91JeKc8c8ceHkQncaUxdvViqpHBPCfmMPlzAIqEo9oQ7x34cMiNrRGU4nSkbEndLa
 o3fbb90U8+yXn/R0tCzH7haO/K+Gt1ldGQ04YzmCYbaWgJVmYadIOIgkxCW2C4cY1hsR
 FboqHy9Roj7zvRnEdckqjPTIFwpAx8rN8G0AuiGDMiaNXviGvi/t2dbfWxgvIr1dzh4S
 5iOC/j/w8fYrOuNpHI6bw/FZs7sB0X/v4om/2G9y347JvUPb/rQo1pF0jI5nyVdhDS9y
 ToOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCWxk7ZdShkpoe5Ca73XY2oUaxGYyXkgw1znRWAYiLdF5J+cXYd7cYFHpFgubAqIIDlnRAx5W9MA==@nongnu.org
X-Gm-Message-State: AOJu0YynK1YZqklE1Wj/OF68WTtILpG6jHzb1b0vryYI2qOwuaOzHKc1
 0JymFHroeOlELpYDXGAI6+tY7U9lSLmXNrSLx8yp7enrVTjNIKtxzZLE/JdHPBljdFsRaOpiX4E
 psV9fo4sHl7RuknQQaJ7SIcwM06rPIEfJl80D5ntYnOY1LebaE3xRbw==
X-Gm-Gg: ASbGncucVU8113Tp8EqjrLZ5AWQzX1nC3ITRuLmuyBeGDhhshXphMM0uN4yGHYZCU8h
 Vn4RphMP7cUL+eA1H8VG/KdsHmtwQfP7Dz3kmJPo0C8LNDQJut5GmSGL5sVwOyzKrseFDhpKFUw
 fL9WEIAfyimckLlf3iIaHculR9dhNI1rUSmXxinjY+zUbxi2GpHPG4PNMjilA4pvt1K4hsNLLqd
 lWNEq0khy3/+YpfFBuaKRTajsK+MvexixGlZ844HiF1iYLj2b5QsPEmU212l/Fce5RFCMpVY+So
 E3mMsnwdJeo3U+s0YXGcnR24wgr25a4ApOw8JQGDmos5iyhVLkQEIDTyNhTRj210+gGp5Cb1mq9
 JNZapz4mkjfW6Pyes7xZ04sRCNyo4plTWppOA8zM=
X-Received: by 2002:a17:90a:ec8b:b0:330:6d5e:f174 with SMTP id
 98e67ed59e1d1-33bcf8ec602mr26802489a91.20.1761127691339; 
 Wed, 22 Oct 2025 03:08:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2pDrHwUoML4XgEoRBI9H3xxrPRmHdkaibIZ3hcNEZi3EBMLwtVA075Dl5IkCHLEFjpqlyMQ==
X-Received: by 2002:a17:90a:ec8b:b0:330:6d5e:f174 with SMTP id
 98e67ed59e1d1-33bcf8ec602mr26802465a91.20.1761127690919; 
 Wed, 22 Oct 2025 03:08:10 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33e208f9e29sm1299103a91.1.2025.10.22.03.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 03:08:10 -0700 (PDT)
Message-ID: <b1c0a0a8-3b94-47ee-ab8b-e42099f3f1a8@redhat.com>
Date: Wed, 22 Oct 2025 20:07:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V6 00/24] Support of Virtual CPU Hotplug-like Feature
 for ARMv8+ Arch
To: salil.mehta@opnsrc.net, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com
Cc: salil.mehta@huawei.com, maz@kernel.org, jean-philippe@linaro.org,
 jonathan.cameron@huawei.com, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org, imammedo@redhat.com,
 armbru@redhat.com, andrew.jones@linux.dev, david@redhat.com,
 philmd@linaro.org, eric.auger@redhat.com, will@kernel.org, ardb@kernel.org,
 oliver.upton@linux.dev, pbonzini@redhat.com, rafael@kernel.org,
 borntraeger@linux.ibm.com, alex.bennee@linaro.org,
 gustavo.romero@linaro.org, npiggin@gmail.com, harshpb@linux.ibm.com,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 gankulkarni@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, wangzhou1@hisilicon.com, linuxarm@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 shahuang@redhat.com, zhao1.liu@intel.com
References: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2caoSJjRDGkH3d_lKRvHEWnS-AZLBqJ7jGxhZ9vG2dQ_1761127691
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Salil,

On 10/1/25 11:01 AM, salil.mehta@opnsrc.net wrote:
> 
> ===================
> (VII) Commands Used
> ===================
> 
> A. Qemu launch commands to init the machine (with 6 possible vCPUs):
> 
> $ qemu-system-aarch64 --enable-kvm -machine virt,gic-version=3 \
> -cpu host -smp cpus=4,disabled=2 \
> -m 300M \
> -kernel Image \
> -initrd rootfs.cpio.gz \
> -append "console=ttyAMA0 root=/dev/ram rdinit=/init maxcpus=2 acpi=force" \
> -nographic \
> -bios QEMU_EFI.fd \
> 

The parameter 'disabled=2' isn't correct here and it needs to be 'disabledcpus=2'.
Otherwise, the VM won't be started due to the unrecognized parameter.

$ /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64       \
   --enable-kvm -machine virt,gic-version=3 -cpu host,sve=off    \
   -smp cpus=4,disabled=2 -m 1024M                               \
   -kernel /home/gavin/sandbox/linux.guest/arch/arm64/boot/Image \
   -initrd /home/gavin/sandbox/images/rootfs.cpio.xz -nographic
qemu-system-aarch64: Parameter 'smp.disabled' is unexpected

Thanks,
Gavin


