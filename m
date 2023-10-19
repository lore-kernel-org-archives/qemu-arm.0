Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp847992ejb;
        Thu, 19 Oct 2023 16:03:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8i4pS3gfZYxolGh3QqNe6eQMDV56M+Uaee+zKbHVhjfgagBIL15rH7EHpV9rBdhwbzPtF
X-Received: by 2002:a05:622a:216:b0:41c:c6a6:338f with SMTP id b22-20020a05622a021600b0041cc6a6338fmr50989qtx.53.1697756637000;
        Thu, 19 Oct 2023 16:03:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697756636; cv=none;
        d=google.com; s=arc-20160816;
        b=CCBq/kJ5ukfhEHJ8nL+zX7OqEf/a0DdEPd+vR2yoUhrTHb0ctwM7WhU6c5vuIFy1OH
         2ySsVpt7zLKUFirhBBgDOztd6BQRzeXQxSZAhhw87urnKcExBDDmppbStiGsOgMUQiTm
         pPjxzZt25EMWDyxSWMwGU2P7jVUfysg33QfZJlIKcWPFa3hMqB+mUPH209oHAJnhL29U
         8jcDrRPADuTQlyOfXaPnHzEfplhTYkHZla9UXYou3uTDRmtr9AxkHmpWLAxd4hLiMcbG
         qbQuMUkj7evqCReZSLdqkbuG0wAD34W/6oI257sITdFn/acEab9h3c0k3qgoV6EqZh/I
         7TQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QfRgzEIChtuAOhGnSfJuI73ipLTqt1l7t44qPa0GDkM=;
        fh=UudfAAvZ9xnUiTevj5aViWk4V4FKRzQCm5AqcBvZUUc=;
        b=W3EoWdoLzn4OxmNuHstfE8Y23e/ngOD4IuaHthJH6M+qvKkeyJq02MrMUaSUby3f6P
         AG08Wu8axyCr6MziScbZdlynYhDNtex476BKxVi/fr0qmuFYdqD7gc6Utd3gxGYI0YJW
         4zwD7RKOCmoWLpjUsW08M2ORQXEx0wV4BlcD3PyrLYIXBK723Ap+MG+kxZ6C+87hYgVO
         tXj0SDJeok1i0/a8yTPr7LebdJhQfbK2DOu8tJ91R6j7aUW1ee2QUHwNKDcKfzMU4JyS
         ivDovq6HCaQu6OYBahNmymLZXav7xfweTMDH8Ujp9fpaL8KvteXYuWc76P3RW7+GpVIs
         9rAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fl3Mq+W2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020a05622a04c600b0041b83bbd0d6si375669qtx.604.2023.10.19.16.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 16:03:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fl3Mq+W2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtc3P-0003Uh-Ml; Thu, 19 Oct 2023 19:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1qtc3I-0003Na-6N
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 19:03:41 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1qtc3F-0007MW-LG
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 19:03:39 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3226cc3e324so158585f8f.3
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 16:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697756615; x=1698361415; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QfRgzEIChtuAOhGnSfJuI73ipLTqt1l7t44qPa0GDkM=;
 b=fl3Mq+W2Jc+tXhDUkB0gZEbCDTtpRLAdZPJaSKKCmswsHkjXpuF3Q9gEQma4Xm7U3+
 dFyzJyEvS8O8P7YCpJo5e5CwTuQuSxAxnPETzybsCyn9/YDxSGFYYCvLImU5GS9Hyqqy
 sOszXnXULeFZwBPpxb/pzUE8C5yMiH6x4wGDy9ju1xGWYHEp2OTY5/uyLX8TiLLc9F2c
 HF09DV23nAFHGZdneaD5+KX0VN6U1fRSUYvLq8LyOkpB/1TFIEqwSVd4YHlWHi+8K4ez
 eZUWPnMKVhdrk5/u9Nmn0Exf9SINr7+HWWB1m5+GxYYqxDmsSRMROPayGcv4zORueduS
 3cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697756615; x=1698361415;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QfRgzEIChtuAOhGnSfJuI73ipLTqt1l7t44qPa0GDkM=;
 b=JfpJn1jr/P1HBCTqyxm6a5eW/tjHjbgSVWMQwEjDtLqcAx0lgCCnvpOXzYSJ2Thkc0
 K6jB2ntmTMO/2H1x2pn3W0PjcZ1iRFET/mmog279brvU1qfjCWkDCmOGlWwxU0ByoUXp
 zdL0CKqmLfab9FOT50o/2+I4qCldbPZ4Br+b+X51NV6JBKcdv6plG8Rpkui2vOuwD95v
 6zPtNDsD9vCQ7LWWSa5GaRV16m7fUH+wspm+wSty48G33hDv538Abj76XW6Vw+ZFwNlC
 HlyaZV6ToY9zCGlmYxZtyA7WKVBtGe0AEI/RYL+b91/LgSW2wCPlwcgXxaMohCo71MGl
 juag==
X-Gm-Message-State: AOJu0Yxj5JECDJH9AG2z+mrvWGcybk52udbqY7olVOfMnNIpEv80VImG
 a3IzA/NtgIHC72T8X13bst1vgUup+vrIYAdKngq/2g==
X-Received: by 2002:adf:f346:0:b0:32d:bc6e:7f0d with SMTP id
 e6-20020adff346000000b0032dbc6e7f0dmr98163wrp.18.1697756615017; Thu, 19 Oct
 2023 16:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <CANW9uyvsD8UWJ9yrrvgb4i7nEoDAXNaepk-zsJWuyw=tp_W9oA@mail.gmail.com>
 <20231002102231.GA3075015@myrica>
 <CANW9uyu85z9+-v8ait9EWcjWRu1+C8Xx3cM__8oBKof7fJwRwA@mail.gmail.com>
 <20231004105558.GA1454132@myrica>
In-Reply-To: <20231004105558.GA1454132@myrica>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 19 Oct 2023 17:03:23 -0600
Message-ID: <CANLsYkx340VE0nr7EH6t2r-5x5-wTv+9S4z-fOtUSGWR_FWE6w@mail.gmail.com>
Subject: Re: Quick start guide on RME emulation
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
Cc: Itaru Kitayama <itaru.kitayama@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GLDa08ubIqLf

Hi Jean-Philippe,

More progress and more debugging...  See below.

On Wed, 4 Oct 2023 at 04:55, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> On Mon, Oct 02, 2023 at 07:52:28PM +0900, Itaru Kitayama wrote:
> > Jean,
> > It is indeed the latter. Itd be good if we could test how far we can go in
> > terms of launching a Realm guest via the CCA aware KVM.
>
> Here is a draft doc that explains how to build and run the whole stack.
> I'm not sure where such a document should go. Maybe the QEMU wiki would be
> best, since these instructions will change frequently.
>
> Note:
>
> * The following instructions are for QEMU virt machine (just because it's
>   the one I'm familiar with). The sbsa-ref machine will be supported.
>
> * I haven't tried to run a secure payload yet, there might be some
>   outstanding bugs. Secure payload such as optee would be packaged with
>   TF-A as BL32.
>
> * I need to rebase the guest edk2 support, so didn't include instructions
>   for that.
>
> Software components:
>
>            |              |              |
>            |    REALM     |  NON-SECURE  |
>            |              |              |
>     -------+--------------+--------------+
>            |              |              |
>       EL0  | Guest Rootfs |  Host Rootfs |
>            |              |  VMM         |
>            |              |              |
>     -------+--------------+--------------+
>            |              |              |
>       EL1  |        EDK2  |              |
>            | Linux Guest  |              |
>            |              |  EDK2        |
>     -------+--------------+  Linux Host  |
>            |              |    (KVM)     |
>       EL2  |      TF-RMM  |              |
>            |              |              |
>     -------+--------------+--------------+
>            |                             |
>       EL3  |            TF-A             |
>            |                             |
>     -------+-----------------------------+
>            |                             |
>       HW   |            QEMU             |
>            |                             |
>     -------+-----------------------------+
>
>
> TF-RMM
> ------
>
> The Realm Management Monitor (RMM) connects KVM and the Realm guest.
>
> RMM gets loaded into NS DRAM (because there isn't enough space in Secure
> RAM). TF-A carves out 24MB of memory for the RMM, and tells other software
> about it using a device-tree reserved memory node.
>
> Status: QEMU support is currently under review. Additional patches are
>   needed until QEMU supports a couple additional features that are
>   mandatory for RME (PMUv3p7 and ECV).
>
> Repo: currently at https://jpbrucker.net/git/rmm/ branch qemu-rme
>       official is https://git.trustedfirmware.org/TF-RMM/tf-rmm.git/
>
> Build:  git submodule update --init --recursive
>         export CROSS_COMPILE=aarch64-linux-gnu-
>         cmake -DCMAKE_BUILD_TYPE=Debug -DRMM_CONFIG=qemu_virt_defcfg -DRMM_TOOLCHAIN=llvm -B build-qemu
>         cmake --build build-qemu
>
>
> Host EDK2
> ---------
>
> Works out of the box, although it doesn't properly account for reserved
> RMM memory yet.
>
> Repo: https://github.com/tianocore/edk2.git
>
> Build:  git submodule update --init --recursive
>         source edksetup.sh
>         make -j -C BaseTools
>         export GCC5_AARCH64_PREFIX=aarch64-linux-gnu-
>         build -b RELEASE -a AARCH64 -t GCC5 -p ArmVirtPkg/ArmVirtQemuKernel.dsc
>
>
> TF-A
> ----
>
> TF-A loads the RMM as well as the Non-secure firmware, and bridges RMM and
> KVM. It also owns the Granule Protection Table (GPT).
>
> Status: QEMU support is currently under review.
>
> Repo: currently at https://jpbrucker.net/git/tf-a/ branch qemu-rme
>       official is https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/
>
> Build:  # Embed the RMM image and edk2 into the Final Image Package (FIP)
>         make -j CROSS_COMPILE=aarch64-linux-gnu- PLAT=qemu
>                 ENABLE_RME=1 DEBUG=1 LOG_LEVEL=40
>                 RMM=rmm/build-qemu/Debug/rmm.img
>                 BL33=edk2/Build/ArmVirtQemuKernel-AARCH64/RELEASE_GCC5/FV/QEMU_EFI.fd
>                 all fip
>
>         # Pack whole image into flash.bin
>         dd if=tfa/build/qemu/debug/bl1.bin of=flash.bin
>         dd if=tfa/build/qemu/debug/fip.bin of=flash.bin seek=64 bs=4096
>
>
> Host & Guest Linux
> ------------------
>
> Both host and guest need extra patches
>
> Status: https://lore.kernel.org/linux-arm-kernel/20231002124311.204614-1-suzuki.poulose@arm.com/
>
> Repo: https://gitlab.arm.com/linux-arm/linux-cca cca-full/rmm-v1.0-eac2
>
> Build: arm64 defconfig
>
>
> VMM
> ---
>
> Kvmtool and QEMU can be used to launch Realm guests. For kvmtool, see the
> cover letter for the Linux support above.
>
> Status: In development
>
> Repo: for now https://jpbrucker.net/git/qemu/ branch cca/rmm-v1.0-eac2
>
> Build:  git submodule update --init --recursive
>         # to download the missing subprojects because buildroot won't do it:
>         ./configure --target-list=aarch64-softmmu
>         # Note: when buildroot is configured to use this tree (see below),
>         # it will rsync the whole tree including binary files. Therefore,
>         # use a separate build directory to make the system emulation
>         # QEMU, to avoid conflicts between native binary files and
>         # buildroot's cross-build.
>
>
> Rootfs
> ------
>
> Buildroot provides a convenient way to build lightweight root filesystems.
> It can also embed the VMM into the rootfs if you specify the path to
> kvmtool or QEMU source in a local.mk file in the build directory.
>
> Repo: https://gitlab.com/buildroot.org/buildroot.git
>
> local.mk
>         KVMTOOL_OVERRIDE_SRCDIR = path/to/kvmtool/
>         QEMU_OVERRIDE_SRCDIR = path/to/qemu/
>
> Build:  make qemu_aarch64_virt_defconfig
>         # then change some options
>           # BR2_LINUX_KERNEL is not set
>           BR2_PACKAGE_KVMTOOL=y
>           BR2_PACKAGE_QEMU=y
>           BR2_PACKAGE_QEMU_SYSTEM=y
>           # BR2_PACKAGE_QEMU_BLOBS is not set
>           BR2_PACKAGE_QEMU_SLIRP=y
>           BR2_PACKAGE_QEMU_CHOOSE_TARGETS=y
>           BR2_PACKAGE_QEMU_TARGET_AARCH64=y
>           BR2_TARGET_ROOTFS_EXT2_SIZE=256M
>
>           # Generate an initrd for the guest
>           BR2_TARGET_ROOTFS_CPIO=y
>
>         make
>
>
> QEMU system emulation
> ---------------------
>
> Repo: https://gitlab.com/qemu-project/qemu.git
>
> Run with:
>
>         qemu-system-aarch64 -M virt,virtualization=on,secure=on,gic-version=3
>                 -M acpi=off -cpu max,x-rme=on,sme=off -m 3G -smp 8
>                 -nographic
>                 -bios tf-a/flash.bin
>                 -kernel linux/arch/arm64/boot/Image
>                 -drive format=raw,if=none,file=buildroot/output/images/rootfs.ext4,id=hd0
>                 -device virtio-blk-pci,drive=hd0
>                 -append root=/dev/vda
>
> To use separate consoles for FW (port 54320), secure payload (54321), host
> (54322) and guest (54323):
>
>                 -nodefaults
>                 -serial tcp:localhost:54320
>                 -serial tcp:localhost:54321
>                 -chardev socket,mux=on,id=hvc0,port=54322,host=localhost
>                 -device virtio-serial-device
>                 -device virtconsole,chardev=hvc0
>                 -chardev socket,mux=on,id=hvc1,port=54323,host=localhost
>                 -device virtio-serial-device
>                 -device virtconsole,chardev=hvc1
>                 -append "root=/dev/vda console=hvc0"
>                 -device virtio-net-pci,netdev=net0 -net user,id=net0

This argument above gave me an error.  See [1], line 19 to see how I
corrected it.  Notice the "-netdev user,id=net0" rather than "-net
user,id=net0".  Please confirm you have the same on your side.  Also,
"root=/dev/vda" is a duplicate entry.

[1]. https://pastebin.com/KCh8KFD0

>
>   And connect with 'socat -,rawer TCP-LISTEN:5432x'
>

There seems to be a syntax error with the above command:

$ socat -,rawer TCP-LISTEN:54320
2023/10/19 16:44:55 socat[2799916] E tcsetattr(1, TCSADRAIN,
0x561add6715c0): Invalid argument

I ended up writing my own startup script [2] using the same mechanic
as found in OP-TEE.  The "soc_term.spy" file is available here[3].

Once the QEMU syntax and the console output were fixed I was able to
start the boot stack with the resulting output [4].  The assert, in
function gicv2_driver_init()[5] , is caused by variable gic_version
being set to 0 rather than 1 or 2.  I found that weird because my QEMU
command line [1] explicitly set gic-version=3.  As such I would have
expected to read 3.  And why using gic-version=3 when the code is
specifically looking for a value of 1 or 2?  Any insight would be
appreciated.

Regards,
Mathieu

[2]. https://pastebin.com/XYjUSgSF
[3]. https://github.com/OP-TEE/build/blob/master/soc_term.py
[4]. https://pastebin.com/qnSXrE7z
[5]. https://jpbrucker.net/git/tf-a/tree/drivers/arm/gic/v2/gicv2_main.c?h=qemu-rme#n128

> To share the files needed for booting the guest:
>
>                 -device virtio-9p-device,fsdev=shr0,mount_tag=shr0
>                 -fsdev local,security_model=none,path=.,id=shr0
>
>   And 'mount -t 9p shr0 /mnt' in the host.
>
>
> Then in the host, launch a Realm guest:
>
>         qemu-system-aarch64 -M virt,acpi=off,gic-version=3 -nographic
>                 -cpu host -enable-kvm -smp 2 -m 512M -overcommit mem-lock=on
>                 -kernel /mnt/linux/arch/arm64/boot/Image
>                 -initrd /mnt/buildroot/output/images/rootfs.cpio
>                 -append "console=hvc0 root=/dev/vda"
>                 -M confidential-guest-support=rme0
>                 -object rme-guest,id=rme0,measurement-algo=sha512,num-pmu-counters=6,sve-vector-length=256
>                 -nodefaults -chardev stdio,mux=on,id=hvc0,signal=off
>                 -device virtio-serial-pci -device virtconsole,chardev=hvc0
>                 -device virtio-net-pci,netdev=net0,romfile= -netdev user,id=net0
>                 </dev/hvc1 >/dev/hvc1 &
>         ...
>         [    0.000000] RME: RSI version 13.0 advertised
>
