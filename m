Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5111113lfy;
        Mon, 10 Aug 2020 03:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/6SvHe86VdgeMzfap3dMq6SIHVmvI+vLG1g8rKI0ebPwi3nTfqNWGwmgn4MTP5kM07L/u
X-Received: by 2002:a5b:40b:: with SMTP id m11mr39122193ybp.308.1597056211659;
        Mon, 10 Aug 2020 03:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597056211; cv=none;
        d=google.com; s=arc-20160816;
        b=Btg+6Gh5zUPMaxs/MDwyMsER3A/MVnilqCOL4ZWe7d+HzNkYsJWE3vCyCPa5ulIFSf
         Jn4mgQ6kAoFV8oIdHqj4U/Icnn1WoE3mDzlZ4sHGCHSU6M43qqW2eUuB3Pnlyh2wpEhk
         4wJ6M9KXHM0U279T1zE4lYsGT/1ZZZ+FZpJmbCBneRskY17pFQjGcF3RPw0TuFB+APAa
         ND9AYM0kiKka00BnDYH+8pAZhXe1oP8TY+Vf8Xn2WXAJgzluzjZ4vFAyqjNwKhfDRtg8
         O0JO3gfQ2mF7QbT6/C9W65jet7u5UpN3SOnT4tS3j8hdACKsv4fQkEX71Gan28+9x16O
         N89w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=cLHWB7zwClSWcpwff7F7eZ3wKdSk+6jA7829m0kmJqY=;
        b=jeZvplMcuCYvmQiYVfbxoeNJnFsrRSaGkBLjUga0V/HVkcnExKtaN/QObsgqLqlN+3
         31V+V/kn2wDTQ+mNujy7rWklTJVpZqoSa2ceXSWyoRGn1jV4nGWGDE6UnOeLbNsWBDsF
         vvIZMMtBgJjjB3f9yGQPyG0tSoA0obz8FCyMwM1nO2AleJpHJdpuIfoAFLLJzUGjy5ZS
         uehpFEXBbXVZto4xe7ab5Zwd9omFx1qEpapuxx9Kq60e3c7OxsMq25t5c7XbOwp1Ehsb
         aM9xqboT0FFoMZvmU+nsnA+C0/wlZdaS7PSEBOq5v12j6dbDFDO+WhLo4Q0o4XatKZwx
         G3vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=huZL3tNi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k131si5067178ybk.460.2020.08.10.03.43.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 03:43:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=huZL3tNi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k55H9-00067G-1t
	for alex.bennee@linaro.org; Mon, 10 Aug 2020 06:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k55Gx-000677-Ej
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 06:43:19 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37574
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k55Gv-0003xf-Kh
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 06:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597056196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cLHWB7zwClSWcpwff7F7eZ3wKdSk+6jA7829m0kmJqY=;
 b=huZL3tNi3uZylgxNEsuarsRTeE419F3KPYNSXh9PLzL00ZXX7FGziGTuuY1kt5ZaW9Z6/D
 7vXgGxblunZL1lxJP23OjA+a6LtF+b9Ijyklpgdp/n+8X19aOEF7o20/ByaTVKNOcrF30n
 fkrbiHGl7KiRNlUeGtywX5T+UcgVicg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-lXxV-SdQNBCU2BiNUiFe9g-1; Mon, 10 Aug 2020 06:43:12 -0400
X-MC-Unique: lXxV-SdQNBCU2BiNUiFe9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAE68100AA23;
 Mon, 10 Aug 2020 10:43:10 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FDF29F77;
 Mon, 10 Aug 2020 10:43:09 +0000 (UTC)
Date: Mon, 10 Aug 2020 12:43:06 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH 0/7] target/arm: Add vSPE support to KVM guest
Message-ID: <20200810104306.5qqanthdqxmlkxah@kamzik.brq.redhat.com>
References: <cover.1596768588.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <cover.1596768588.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 03:29:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /n2BQJop9g6l

On Fri, Aug 07, 2020 at 08:10:30AM +0000, Haibo Xu wrote:
> This series add support for SPE(Statistical Profiling Extension)[1]
> in KVM guest. It's based on Andrew Murray's kernel KVM patches V2[2],
> and has been tested to ensure that guest can use SPE with valid data.
> E.g.
> 
> In host:
> $ ./qemu-system-aarch64 \
>         -cpu host -M virt,accel=kvm,gic-version=3 -nographic -m 2048M \
>         -kernel ./Image-new \
>         -initrd /boot/initrd.img-5.6.0-rc2+ \
>         -append "root=/dev/vda rw console=ttyAMA0" -nodefaults -serial stdio\
>         -drive if=none,file=./xenial.rootfs.ext4,id=hd0,format=raw \
>         -device virtio-blk-device,drive=hd0  \
> 
> In guest:
> $ perf record -e arm_spe/ts_enable=1,pa_enable=1,pct_enable=1/ \
>         dd if=/dev/zero of=/dev/null count=1000
> $ perf report --dump-raw-trace > spe_buf.txt
> 
> The spe_buf.txt should contain similar data as below:
> 
> . ... ARM SPE data: size 135944 bytes
> .  00000000:  b0 f4 d3 29 10 00 80 ff a0                      PC 0xff80001029d3f4 el1 ns=1
> .  00000009:  99 0b 00                                        LAT 11 ISSUE
> .  0000000c:  98 0d 00                                        LAT 13 TOT
> .  0000000f:  52 16 00                                        EV RETIRED L1D-ACCESS TLB-ACCESS
> .  00000012:  49 00                                           LD
> .  00000014:  b2 d0 40 d8 70 00 00 ff 00                      VA 0xff000070d840d0
> .  0000001d:  9a 01 00                                        LAT 1 XLAT
> .  00000020:  00 00 00                                        PAD
> .  00000023:  71 a5 1f b3 20 14 00 00 00                      TS 86447955877
> .  0000002c:  b0 7c f9 29 10 00 80 ff a0                      PC 0xff80001029f97c el1 ns=1
> .  00000035:  99 02 00                                        LAT 2 ISSUE
> .  00000038:  98 03 00                                        LAT 3 TOT
> .  0000003b:  52 02 00                                        EV RETIRED
> .  0000003e:  48 00                                           INSN-OTHER
> .  00000040:  00 00 00                                        PAD
> .  00000043:  71 ef 1f b3 20 14 00 00 00                      TS 86447955951
> .  0000004c:  b0 f0 e9 29 10 00 80 ff a0                      PC 0xff80001029e9f0 el1 ns=1
> .  00000055:  99 02 00                                        LAT 2 ISSUE
> .  00000058:  98 03 00                                        LAT 3 TOT
> .  0000005b:  52 02 00                                        EV RETIRED
> 
> If you want to disable the vSPE support, you can use the 'spe=off' cpu
> property:
> 
> ./qemu-system-aarch64 \
>         -cpu host,spe=off -M virt,accel=kvm,gic-version=3 -nographic -m 2048M \
>         -kernel ./Image-new \
>         -initrd /boot/initrd.img-5.6.0-rc2+ \
>         -append "root=/dev/vda rw console=ttyAMA0" -nodefaults -serial stdio\
>         -drive if=none,file=./xenial.rootfs.ext4,id=hd0,format=raw \
>         -device virtio-blk-device,drive=hd0  \
> 
> Note:
> (1) Since the kernel patches are still under review, some of the macros
>     in the header files may be changed after merging. We may need to
>     update them accordingly.
> (2) These patches only add vSPE support in KVM mode, for TCG mode, I'm
>     not sure whether we need to support it.
> (3) Just followed the 'pmu' property, we only allow this feature to be
>     removed from CPUs which enable it by default. But since the SPE is
>     an optional feature extension for Armv8.2, I think a better way may
>     be to disable it by default, and only enable it when the host cpu
>     do have the feature.

* When not using KVM, if TCG supports SPE emulation, then it should be
  enabled by default with '-cpu max'.

* When using KVM, if KVM supports the feature, then it should be enabled
  by default with '-cpu max' or '-cpu host' (which are currently the only
  ways to use KVM on AArch64)

* When using KVM, if KVM does not support the feature (either the CPU
  doesn't support it, or the version of KVM in use doesn't know what to
  do with it), then the feature should obviously be disabled for the VM
  by default, since there's no way to enable it.

> 
> [1]https://community.arm.com/developer/ip-products/processors/b/processors-ip-blog/
>    posts/statistical-profiling-extension-for-armv8-a
> [2]https://www.spinics.net/lists/arm-kernel/msg776228.html
> 
> Haibo Xu (7):
>   update Linux headers with new vSPE macros
>   target/arm/kvm: spe: Add helper to detect SPE when using KVM
>   target/arm/cpu: spe: Add an option to turn on/off vSPE support
>   target/arm/kvm: spe: Unify device attr operatioin helper
>   target/arm/kvm: spe: Add device init and set_irq operations
>   hw/arm/virt: spe: Add SPE fdt binding for virt machine
>   target/arm/cpu: spe: Enable spe to work with host cpu
> 
>  hw/arm/virt-acpi-build.c      |  3 +++
>  hw/arm/virt.c                 | 42 ++++++++++++++++++++++++++++++
>  include/hw/acpi/acpi-defs.h   |  1 +
>  include/hw/arm/virt.h         |  1 +
>  linux-headers/asm-arm64/kvm.h |  4 +++
>  linux-headers/linux/kvm.h     |  2 ++
>  target/arm/cpu.c              | 34 +++++++++++++++++++++++++
>  target/arm/cpu.h              |  5 ++++
>  target/arm/kvm.c              | 11 ++++++++
>  target/arm/kvm64.c            | 48 ++++++++++++++++++++++++++++++++---
>  target/arm/kvm_arm.h          | 18 +++++++++++++

This series should also be updating these files:

 docs/system/arm/cpu-features.rst
 target/arm/monitor.c
 tests/qtest/arm-cpu-features.c

Thanks,
drew

>  11 files changed, 166 insertions(+), 3 deletions(-)
> 
> -- 
> 2.17.1
> 
> 

