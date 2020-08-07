Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2426141lfy;
        Fri, 7 Aug 2020 01:10:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx26R1LOqhX/+iP8DmMeYqgm72ua/u+XU3HNvDQoftov6M1LVg21C1fVuNWRodeYf5QpPCy
X-Received: by 2002:a25:bac9:: with SMTP id a9mr19236455ybk.20.1596787857249;
        Fri, 07 Aug 2020 01:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596787857; cv=none;
        d=google.com; s=arc-20160816;
        b=hZO5AFrFFsz+KngvASt34XFbz9UycBZDnIoREfNVjU6KtwMsYfF8s/886kmIJ75B0V
         TG7Z2wFBv+B9JrOl4J39FNUEcq1Ocgzm7BGanPhrdBegkpndv70HhpXJ/l4/6bgM1UNc
         wzqttwO0nWGaxVF/Vzztcm6wSvWtx/ryDSiz0nDL9KhPl2V2zj3hM7diNICYBgdyXgdJ
         RGGjZzEjIzm38FIZg1HaMFECOywzDAQx9hsS0fAk89wPUosW+/CGA/29NkAO4bQ4hoYr
         IUJJG6l6SeCiAR7aWYdA3BC8crYxOTuVPg8hTl38CzKMlcjot6IKt/W5WutAiLBAJyll
         aIqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=CoQS0jn/1hwXwTcHIYOL0+48OLeXmrMVmHENtEgtvUM=;
        b=BuFn6AmQlvWh3hQy6/xocRSjLcyFDdh5hVjCLLw9XEoS1Etmr8BoKqxQZVMXZPQJH8
         GLbJZkH9m/n9g0+4kBPK2Ea89+qlI3c0l1Z/MRq+m+q3cmKobkBKhQvL/6OEVm/s8Lp8
         1lEn/fCEwxdgpyRypXgI+yIMbtTr60i/oerg7FlYjHLzQvlLA1Qn0WQF8PHhjQxf37z2
         DF9vybPUJW+0OGYr7PAb055NCng4FpZTxdOpH6H842NMchKlcik6IZek/SJkcbier2Lf
         QDlGBBG6ly6H2Dort/6JS1+ChIh0/NWzz+fYzKlD4JDc4HnJsvglToP74n3bewMkR1Wa
         GKzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GaeH9aZC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 129si6632222ybn.43.2020.08.07.01.10.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Aug 2020 01:10:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GaeH9aZC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3xSq-00070J-Hz
	for alex.bennee@linaro.org; Fri, 07 Aug 2020 04:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k3xSe-0006wu-Ch
 for qemu-arm@nongnu.org; Fri, 07 Aug 2020 04:10:44 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:38227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k3xSc-0001gx-48
 for qemu-arm@nongnu.org; Fri, 07 Aug 2020 04:10:43 -0400
Received: by mail-io1-xd29.google.com with SMTP id l1so1073452ioh.5
 for <qemu-arm@nongnu.org>; Fri, 07 Aug 2020 01:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CoQS0jn/1hwXwTcHIYOL0+48OLeXmrMVmHENtEgtvUM=;
 b=GaeH9aZChBHRdPq0u5V59OslWHYdLl8rOY5wAxWLOQ1MI3tky7nzgwhYYq58khBl+q
 n9rXoc7MxJ83wRraLE+j8G3eS/huYIt45mz7bmtQ8kZYet3YPpm+kZeIVK/aWM7dwaEE
 a/cAZlh8fgeuD89keyLfLwxvhrq0i4MUeTYlZWGU0KWzZG1/Bwbog30RGEUfYO7SRpAk
 9k5z+tWpyXsTMfDkv/1iVxl4aCfnbUVpxseMoxWAFyirwJrVb8nFdrMKCUyLBwYBUb5l
 4s0a69+jgoxSoeXkx9tZHXXgob990NhU53lhIZBUV7Fm9JON9aaOuHMeofxBEmZ/KWFv
 VhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CoQS0jn/1hwXwTcHIYOL0+48OLeXmrMVmHENtEgtvUM=;
 b=sHvtsARB9YrZkZnLYX6lI9PkY27OiNDZc+n3tV8n4uWuIOdejwiy1cd/SABBFOA76J
 Xu23J8utzInawmGQ0pMOtN1u49pgKGGO/ao1giwMZPoj2V2hdJ+sKjZvtq2r3Sp72H32
 MPUpyHTZN+SOLaDh474dFcWthPVk78zN/7wPx0RkJ33rx3Q9whH6fRA/l4/gsYR1xhTU
 k96uZwz0mEBhl51oThK46BeOzgmdQm4Ox36MduT1Ik7ihCk6426v6K4hgeuGJgsWslVr
 OAyz8rhcI3aaHP4Wc/V9vvDBrGeWbRhGJfRbqFkkx/OY9I8GGEyBVLeJFidMLZVeuOw3
 G3Xw==
X-Gm-Message-State: AOAM533gDx78DFNYIi4KIDFeaX+1g68LzL7Z0W9C+ffuJTysAh7EJbtk
 VugXkchwzBFUr3A5oytnPxG7
X-Received: by 2002:a05:6602:2409:: with SMTP id
 s9mr3032017ioa.98.1596787840232; 
 Fri, 07 Aug 2020 01:10:40 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id l144sm6233546ill.6.2020.08.07.01.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 01:10:39 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: peter.maydell@linaro.org
Subject: [PATCH 0/7] target/arm: Add vSPE support to KVM guest
Date: Fri,  7 Aug 2020 08:10:30 +0000
Message-Id: <cover.1596768588.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd29.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: drjones@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VjirHWZzthGB

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
    update them accordingly.
(2) These patches only add vSPE support in KVM mode, for TCG mode, I'm
    not sure whether we need to support it.
(3) Just followed the 'pmu' property, we only allow this feature to be
    removed from CPUs which enable it by default. But since the SPE is
    an optional feature extension for Armv8.2, I think a better way may
    be to disable it by default, and only enable it when the host cpu
    do have the feature.

[1]https://community.arm.com/developer/ip-products/processors/b/processors-ip-blog/
   posts/statistical-profiling-extension-for-armv8-a
[2]https://www.spinics.net/lists/arm-kernel/msg776228.html

Haibo Xu (7):
  update Linux headers with new vSPE macros
  target/arm/kvm: spe: Add helper to detect SPE when using KVM
  target/arm/cpu: spe: Add an option to turn on/off vSPE support
  target/arm/kvm: spe: Unify device attr operatioin helper
  target/arm/kvm: spe: Add device init and set_irq operations
  hw/arm/virt: spe: Add SPE fdt binding for virt machine
  target/arm/cpu: spe: Enable spe to work with host cpu

 hw/arm/virt-acpi-build.c      |  3 +++
 hw/arm/virt.c                 | 42 ++++++++++++++++++++++++++++++
 include/hw/acpi/acpi-defs.h   |  1 +
 include/hw/arm/virt.h         |  1 +
 linux-headers/asm-arm64/kvm.h |  4 +++
 linux-headers/linux/kvm.h     |  2 ++
 target/arm/cpu.c              | 34 +++++++++++++++++++++++++
 target/arm/cpu.h              |  5 ++++
 target/arm/kvm.c              | 11 ++++++++
 target/arm/kvm64.c            | 48 ++++++++++++++++++++++++++++++++---
 target/arm/kvm_arm.h          | 18 +++++++++++++
 11 files changed, 166 insertions(+), 3 deletions(-)

-- 
2.17.1

