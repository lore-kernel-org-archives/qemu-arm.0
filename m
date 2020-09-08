Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp393140lfq;
        Tue, 8 Sep 2020 01:13:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBgBaSP9jmip9PJKT/m1Ksia8SSU3cQbzp/fOwelUGj0HcCz8TNIkoVnOx2Aey/vUOGzjH
X-Received: by 2002:a25:ef43:: with SMTP id w3mr28577295ybm.230.1599552838246;
        Tue, 08 Sep 2020 01:13:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599552838; cv=none;
        d=google.com; s=arc-20160816;
        b=amtNH/EtW684taug0tLv9JTVmq+z0fjXgLGCPTGqbgNzhgMXSRt0DVcuFgy4AmKpWs
         /VazTQ63AsAdlM1ysMRNzxph5844B1DaqjD7Fscx96za77DG3Yb976DhJMjwYJJGixTj
         qAdctaVz7lCXlUdb2RrMo+mLy0nyDhisuQUyWhdbv2+eSbmMv9PpGRb8h7HUpr9XG/H1
         VCk99blFcCmRECxjH4CFuJk6kb1p+4HYOAiDA3TSx8lr6mjJhUNSC1cvLCtFgZqFCkAe
         gY4eD0lQU1BwwLhxuNS99s8r5FJA4owv80a3NxsUKdy7epTCS5jLAEOop200XEZ4YxID
         Cgrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Dme5wOJZvNDhKpDBEi74Ima5Rw3hvZ52vtZKHURP4rY=;
        b=f3+zEBJmTJzGjzZ5KiSq9Vuz0e8HOgEtN4SdVApN2SQ2BydySjUGH1C6DkgMETAU7i
         HbbzCCZgtHBf7SvTCQp62u19if6S7VTQvrzK5eXFiCqc5i14ojj5TLCKvScstKW/zwj1
         D8sTa9g/eAt4GAO69COASwg9d8rf4Dnj1M+tHh4bW1q7G++Ji4Q1Kj9b8P1PSHuSJ4zP
         dCKoVcwzHNJGW++gyHdAceUEUBVsuQQJgIzXasRftJ/3FXNE4ASl6vd5De82vzzSVSVA
         g52Md261SYyzacR/yav1A23O92BEexw2nnHzpfdm4NczXGc4QpInEkFJFMJLjDBxc1i9
         gjjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mOXtCU3s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v81si18211321ybv.32.2020.09.08.01.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 01:13:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mOXtCU3s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFYlJ-0005Zq-Ir
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 04:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYl9-0005ZR-0e
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 04:13:47 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:44510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYl6-0000Q9-Mg
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 04:13:46 -0400
Received: by mail-pg1-x535.google.com with SMTP id 7so9494983pgm.11
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 01:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dme5wOJZvNDhKpDBEi74Ima5Rw3hvZ52vtZKHURP4rY=;
 b=mOXtCU3sfQYCyaYDEF3467iwanb/BnVVUkjRgJ2724aFN2GTTwczcMKw67aiTpzQ5/
 UI9Zu7/cn5g/T3L2mfmcXHDtUG/PxYN0b5ZBq7lnY525LRfVnNNDV2KZK4mWrXcY2bZT
 w2pzcBAxnL3OQIai+9TnuGN7CPNx6BkKHW1/0oqanZrxnkOyLReCyvoEtan2NYyfxPiV
 WiMsjPiRsnRrfH6+q7KxYQ/TED3CDomAXsmWt3twbjY9LrCJTmBe8EwCskedRmMtD7TE
 vKFH90buBGcoZ3Bl2NvCnbyhVIF3WGo+NrmnGXijgPMrXRk6U7S1pRujWt/DDlbLeqYB
 lqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dme5wOJZvNDhKpDBEi74Ima5Rw3hvZ52vtZKHURP4rY=;
 b=JJZ/N/TvxBG9YoN/988hPQT+Q5G92R4hN8lYiCd238TKRIPv5+t7VrGiiIRZQCj5io
 77lIFQ9jSdyCEdmhL7KNxugVX2AoN7rLJalnDdXAcWW8E1s2rxHHAsZv4qXdcZxb9kxF
 +iWqLZ8AWUq85J7PXLcNL4syFxZEahnFy+zz1FQvhNqfQ0Gcb/i6jwJn0QU5fXdzwAG+
 GBtEWEq7Rpl0g8zD25eTLxMo6zbi5WETggNsT8/iAgPMPLi1aGNHreGwvC/YozqCgzPS
 Ec1wpYqGQdkSG/M/yBqjAibCdbfuchuWAX+YejuEjehcbp8ZGxL3KyM0Wp8PWfe6YsFV
 NlBA==
X-Gm-Message-State: AOAM5336dQNc4bWFgPDn8RohyQML+kt8sBzKkRCL1Bt2VSOdwoBOos1l
 pHMRJorzmyp7GfC0tCTm0oRh
X-Received: by 2002:a17:902:b108:b029:d0:cbe1:e770 with SMTP id
 q8-20020a170902b108b02900d0cbe1e770mr102286plr.23.1599552822378; 
 Tue, 08 Sep 2020 01:13:42 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id m190sm16934788pfm.184.2020.09.08.01.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:13:41 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 00/12] target/arm: Add vSPE support to KVM guest
Date: Tue,  8 Sep 2020 08:13:18 +0000
Message-Id: <cover.1599549462.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=haibo.xu@linaro.org; helo=mail-pg1-x535.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qo6nkWX0D0Hw

v2:
  - Rebased on Andrew's patches[3]
  - Added compat codes to enable vSPE only for the 5.2 and 
    later machine types [Andrew]
  - Changed to use the ID register bit to identify the spe
    feature [Andrew/Richard]
  - Added the missing field in AcpiMadtGenericCpuInterface
    definition [Auger]
  - Split the un-tested userspace irqchip support for vSPE
    into a separate patch [Andrew]
  - Added doc and qtest for vSPE [Andrew]

Many thanks to Andrew, Richard, Philippe and Auger for their comments. 

This series add support for SPE(Statistical Profiling Extension)[1]
in KVM guest. It's based on Andrew Murray's kernel KVM patches V2[2],
and has been tested to ensure that guest can use SPE with valid data.
E.g.

In host:
$ ./qemu-system-aarch64 \
        -cpu host -M virt,accel=kvm,gic-version=3 -nographic -m 2048M \
        -kernel ./Image-new \
        -initrd /boot/initrd.img-5.6.0-rc2+ \
        -append "root=/dev/vda rw console=ttyAMA0" -nodefaults -serial stdio\
        -drive if=none,file=./xenial.rootfs.ext4,id=hd0,format=raw \
        -device virtio-blk-device,drive=hd0  \

In guest:
$ perf record -e arm_spe/ts_enable=1,pa_enable=1,pct_enable=1/ \
        dd if=/dev/zero of=/dev/null count=1000
$ perf report --dump-raw-trace > spe_buf.txt

The spe_buf.txt should contain similar data as below:

. ... ARM SPE data: size 135944 bytes
.  00000000:  b0 f4 d3 29 10 00 80 ff a0                      PC 0xff80001029d3f4 el1 ns=1
.  00000009:  99 0b 00                                        LAT 11 ISSUE
.  0000000c:  98 0d 00                                        LAT 13 TOT
.  0000000f:  52 16 00                                        EV RETIRED L1D-ACCESS TLB-ACCESS
.  00000012:  49 00                                           LD
.  00000014:  b2 d0 40 d8 70 00 00 ff 00                      VA 0xff000070d840d0
.  0000001d:  9a 01 00                                        LAT 1 XLAT
.  00000020:  00 00 00                                        PAD
.  00000023:  71 a5 1f b3 20 14 00 00 00                      TS 86447955877
.  0000002c:  b0 7c f9 29 10 00 80 ff a0                      PC 0xff80001029f97c el1 ns=1
.  00000035:  99 02 00                                        LAT 2 ISSUE
.  00000038:  98 03 00                                        LAT 3 TOT
.  0000003b:  52 02 00                                        EV RETIRED
.  0000003e:  48 00                                           INSN-OTHER
.  00000040:  00 00 00                                        PAD
.  00000043:  71 ef 1f b3 20 14 00 00 00                      TS 86447955951
.  0000004c:  b0 f0 e9 29 10 00 80 ff a0                      PC 0xff80001029e9f0 el1 ns=1
.  00000055:  99 02 00                                        LAT 2 ISSUE
.  00000058:  98 03 00                                        LAT 3 TOT
.  0000005b:  52 02 00                                        EV RETIRED

If you want to disable the vSPE support, you can use the 'spe=off' cpu
property:

./qemu-system-aarch64 \
        -cpu host,spe=off -M virt,accel=kvm,gic-version=3 -nographic -m 2048M \
        -kernel ./Image-new \
        -initrd /boot/initrd.img-5.6.0-rc2+ \
        -append "root=/dev/vda rw console=ttyAMA0" -nodefaults -serial stdio\
        -drive if=none,file=./xenial.rootfs.ext4,id=hd0,format=raw \
        -device virtio-blk-device,drive=hd0  \

Note:
(1) Since the kernel patches are still under review, some of the macros
    in the header files may be changed after merging. We may need to
    update them accordingly. To be specific, if you want to have a try
    on this patch series, you needs to replace on the kernel 5.5-rc2 based
    series, and do minor changes:

    -#define KVM_CAP_ARM_SPE_V1 179
    +#define KVM_CAP_ARM_SPE_V1 184

(2) These patches only add vSPE support in KVM mode, for TCG mode, I'm
    not sure whether we need to support it.
(3) Just followed the 'sve' property, we only allow this feature to be
    removed from CPUs which enable it by default when the host cpu support it.

[1]https://community.arm.com/developer/ip-products/processors/b/processors-ip-blog/
   posts/statistical-profiling-extension-for-armv8-a
[2]https://www.spinics.net/lists/arm-kernel/msg776228.html
[3]https://www.mail-archive.com/qemu-devel@nongnu.org/msg727588.html

Haibo Xu (12):
  update Linux headers with new vSPE macros
  target/arm/kvm: spe: Add helper to detect SPE when using KVM
  target/arm/cpu: spe: Add an option to turn on/off vSPE support
  target/arm: spe: Only enable SPE from 5.2 compat machines.
  target/arm/kvm: spe: Unify device attr operation helper
  target/arm/kvm: spe: Add device init and set_irq operations
  hw/arm/virt: Move post cpu realize check into its own function
  hw/arm/virt: Move kvm pmu setup to virt_cpu_post_init
  hw/arm/virt: spe: Add SPE fdt binding for virt machine
  target/arm/cpu: spe: Enable spe to work with host cpu
  target/arm/kvm: spe: Enable userspace irqchip support.
  target/arm: spe: Add corresponding doc and test.

 docs/system/arm/cpu-features.rst |  20 ++++++
 hw/arm/virt-acpi-build.c         |   3 +
 hw/arm/virt.c                    | 116 +++++++++++++++++++++++--------
 include/hw/acpi/acpi-defs.h      |   3 +
 include/hw/arm/virt.h            |   2 +
 linux-headers/asm-arm64/kvm.h    |   4 ++
 linux-headers/linux/kvm.h        |   2 +
 target/arm/cpu.c                 |  11 +++
 target/arm/cpu.h                 |  17 +++++
 target/arm/cpu64.c               |  57 +++++++++++++++
 target/arm/kvm.c                 |  10 +++
 target/arm/kvm64.c               |  56 +++++++++++++--
 target/arm/kvm_arm.h             |  18 +++++
 target/arm/monitor.c             |   2 +-
 tests/qtest/arm-cpu-features.c   |   9 +++
 15 files changed, 294 insertions(+), 36 deletions(-)

-- 
2.17.1

