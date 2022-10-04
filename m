Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp40333ocb;
        Tue, 4 Oct 2022 02:24:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM60WkiQopkF8a78j9sm0MGc0IH9G1F8u9WqPCbFZVRa743OdA6BwRXiseQfu4aKoBEHyPEV
X-Received: by 2002:a05:6214:e4e:b0:4ac:b834:f594 with SMTP id o14-20020a0562140e4e00b004acb834f594mr18882180qvc.100.1664875482189;
        Tue, 04 Oct 2022 02:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664875482; cv=none;
        d=google.com; s=arc-20160816;
        b=o5a345Z02AbT76x001SWFc7m3IA/tV6a0LkFlaPb7n2uY2wyvMNcxzkCe5hewGoO5I
         ODiN/VKbUFrnNXeYni6rJYW0Z2t32pSvlM4j161PNd7+VyRqxy+R5WjrlMdCt75mkZRG
         1iafCuIorp418IqslxD311sC09juhY7nNGHoqjQr3q82Dbl5ZsZJ8KyIxlQOK7HpK0v+
         NX2avGKxc04XvCNe+JsHPVy3VxNZXjBHGGYI/0f41BRRuanT/uot0LYWWPrhgLK9DPba
         MdRaIzpwac6rIfr+oXpLvdHPgFGmoEIfRbgaBqro3RH0+1qwIKOpeBb/EV5Q/TO9IcxM
         SwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vMgIC3BFTqFjiZBLLZIOIfcn007DVCDGcbA2Ug7rHrY=;
        b=ZMjLBw/8DPRHDZwsZkLbYyPcZqxMG08rCbPF2ZNaeIJkPB0PyuRNKJL+lE54u+qQc+
         /IoSdLZukY4kxvvPaJyM22h8h7M12bDYVI5s+8ky5gQfMmTGO7jmyLe/Cp4mfZmrjCZZ
         WvJwaiJEps6ifsTm+5bVKKhTWACMh+YR9WTlsG+fi5xUSNx4+1K2MmTvZZYMzm318EgI
         0FbOlm5MCGxrMLTnefuWcnl0VBziSfA9oiZTozSEGg43RID71BCriNuu6r8lRtTElEvb
         5SKhlw/8YRspu93IKmOoGM9hUTK82KbBtd5ia7IYvU16kU6ZFB8NVbkcv1RD9l9WrDNk
         MUlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=MQPE3evO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e29-20020ac8415d000000b0035b9b4c4f54si4926730qtm.787.2022.10.04.02.24.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 02:24:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=MQPE3evO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofeAL-00046y-Or
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 05:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ofe9o-00043C-Eu
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 05:24:08 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1ofe9i-0004Lu-WB
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 05:24:07 -0400
Received: by mail-pg1-x535.google.com with SMTP id 3so12247996pga.1
 for <qemu-arm@nongnu.org>; Tue, 04 Oct 2022 02:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=vMgIC3BFTqFjiZBLLZIOIfcn007DVCDGcbA2Ug7rHrY=;
 b=MQPE3evOsO4bN12RuMuvtoAl4qadSc2gFo1iVmqmkUygMmqT0PEh14WsPEd8j9JrQG
 EzT3QKMWPjaHXIXriKbK+MIkpXOwTcVIG04vPgdVSuEaMnwtSqAOksG0GPVwqR+PD9g+
 WtE6U0djYsqdpgXlXDNgEENMpS1mYx7ABiUnNrbkfxQx7UNvcGdfjE+uf26bd5X566w+
 OrnKsTUctfsyyYMUrCJg5BrXwywJ8dXIt8FbrT0T2HWqxkzmTl1mT4/zbzps7NKtrGyA
 r5g7DGY3iL8GT6pmD8/WSF10j2ZUGS9YU4LVjhck8BJwAlC7Xqp9hjAvWfPerJTcW15R
 qkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=vMgIC3BFTqFjiZBLLZIOIfcn007DVCDGcbA2Ug7rHrY=;
 b=Nd/sxwt/xAcc56f44uIL/PoQSvTIDvN+DbfVrthTNuAIv7w+Ystt6NqntV2ZHjRKGR
 8lj7IveG9l45xGUnNdwTr6i6an4qNBMCG2X528lyXmgXPAXn+W4yh/yl9CEja2KlrDW9
 2YAs7628t8d9RGFykQQIa9lD7nJCThT4Z5HkLmNpADZv55ZUmH3g7CzKFOca1G0xYT3A
 HwXKrdkrRkiRDfsu3FfhNzyVMXeCxJLIIJj6Q8MZ1jlisp7Aw24R/p/NN5ic/ABS0yGC
 bj2CRKhz84SaLCeKvgvekt5hjsYQZqlbdP8MUOt2RbpGUjbE/5ig/vmVcVb/92K4uWIc
 fXyQ==
X-Gm-Message-State: ACrzQf1zs/Etld/RmJv+U0ECtKITgLv3wT/c5RdzzmCF6Jw0rlgzNGyc
 G7vlZpR19XBl1CGuBwJLzPZFcA==
X-Received: by 2002:aa7:9e52:0:b0:53e:49b2:1c6e with SMTP id
 z18-20020aa79e52000000b0053e49b21c6emr26749203pfq.70.1664875439561; 
 Tue, 04 Oct 2022 02:23:59 -0700 (PDT)
Received: from localhost.localdomain ([49.206.9.142])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a17090b070200b001fba4716f11sm2934551pjz.22.2022.10.04.02.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 02:23:58 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V5 0/3] hw/riscv: virt: Enable booting S-mode firmware from
 pflash
Date: Tue,  4 Oct 2022 14:53:48 +0530
Message-Id: <20221004092351.18209-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D5Q7JmNh8cCC

This series adds the support to boot S-mode FW like EDK2 from the flash. The
S-mode firmware should be kept in pflash unit 1.

When -kernel (and -initrd) option is also provided along with the flash,
the kernel (and initrd) will be loaded into fw_cfg table and opensbi will
branch to the flash address which will be the entry point of the S-mode
firmware. The S-mode FW then loads and launches the kernel.

When only -pflash option is provided in the command line, the kernel
will be located and loaded in the usual way by the S-mode firmware.

These patches are available in below branch.
https://github.com/vlsunil/qemu/tree/pflash_v2

The first two patches in this series are refactor patches.

These changes are tested with a WIP EDK2 port for virt machine. Below
are the instructions to build and test this feature.

1) Get EDK2 sources from below branches.
https://github.com/vlsunil/edk2/tree/virt_refactor_smode_v1
https://github.com/vlsunil/edk2-platforms/tree/virt_refactor_smode_v1

2) Build EDK2 for RISC-V
	export WORKSPACE=`pwd`
        export GCC5_RISCV64_PREFIX=riscv64-linux-gnu-
        export PACKAGES_PATH=$WORKSPACE/edk2:$WORKSPACE/edk2-platforms
        export EDK_TOOLS_PATH=$WORKSPACE/edk2/BaseTools
        source edk2/edksetup.sh
        make -C edk2/BaseTools clean
        make -C edk2/BaseTools
        make -C edk2/BaseTools/Source/C
        source edk2/edksetup.sh BaseTools
        build -a RISCV64  -p Platform/Qemu/RiscVVirt/RiscVVirt.dsc -t GCC5

3)Make the EDK2 image size to match with what qemu flash expects
truncate -s 32M Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd

4) Run
a) Boot to EFI shell (no -kernel / -initrd option)
qemu-system-riscv64  -nographic   -drive file=Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1  -machine virt -M 2G

b) With -kernel, -initrd and -pflash
qemu-system-riscv64  -nographic   -drive file=Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1  -machine virt -M 2G -kernel arch/riscv/boot/Image.gz -initrd rootfs.cpio 


Changes since V4:
	1) Rebased on riscv-to-apply.next branch
	2) Added RB tags
	3) Gerd's feedback on removing the truncate requirement will be addressed as separate
	   patch in future.

Changes since V3:
	1) White space and comment edits
	2) Added RB tag

Changes since V2:
	1) Moved the doc comment to .h file

Changes since V1:
	1) Modified code to support the use case when both -kernel and -pflash are configured.
	2) Refactor patches added to help (1) above.
	3) Cover letter added with test instructions.

Sunil V L (3):
  hw/arm,loongarch: Move load_image_to_fw_cfg() to common location
  hw/riscv: virt: Move create_fw_cfg() prior to loading kernel
  hw/riscv: virt: Enable booting S-mode firmware from pflash

 hw/arm/boot.c             | 49 ---------------------------------------
 hw/loongarch/virt.c       | 33 --------------------------
 hw/nvram/fw_cfg.c         | 32 +++++++++++++++++++++++++
 hw/riscv/boot.c           | 29 +++++++++++++++++++++++
 hw/riscv/virt.c           | 32 ++++++++++++++++++-------
 include/hw/nvram/fw_cfg.h | 21 +++++++++++++++++
 include/hw/riscv/boot.h   |  1 +
 7 files changed, 107 insertions(+), 90 deletions(-)

-- 
2.25.1

