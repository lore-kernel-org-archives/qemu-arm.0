Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2842478ejh;
        Tue, 6 Sep 2022 02:46:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5CmyVLmftt+UQvTuJDAAoccMBi7PEuugBRIP2h2F5xsdJ+CVC4wIH1R2l4mpvWCXR+vcix
X-Received: by 2002:a05:620a:2a12:b0:6bb:b3af:780e with SMTP id o18-20020a05620a2a1200b006bbb3af780emr35172529qkp.460.1662457587923;
        Tue, 06 Sep 2022 02:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662457587; cv=none;
        d=google.com; s=arc-20160816;
        b=QUuZt7z4WXa8/Y7DhjhG23W36+qkCBe6WnLb6FQYt7eS7DPNUrT/AdnUHnRpFmCm/3
         qK0qlVPOheAfJ1kwKtgZtCPjmt7f996ziIiQ2+xDmY8xEe3b2LOuAtfiepC0nCTqHUom
         oCPE/v5wl0MgG1Qvpf+Af5PsjYFS81cgBH73guxp/WlCijbhr2dwwB1P86oatBDbJMH4
         3CrlEY4GdhjyWwWbFGQJew4xqJJPi5DCKyQ77kjq/GznTcKN1Jr5fHlXY0V7fybsZafl
         HTi5KLI8xTq9GfMwB9XzJxb4KNipRcN1ArQ7OgILTxoKQnfLE5yhfkHyTzoiYxWsG48I
         s8yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N3yZnnmCzzhalF1IzHkzxM7TrD4sWxNKryRCUa4tAr4=;
        b=r3wUDksKyUlZr0TFPMNtiIJmg0OTPfzJLmrXvqRtzVtxwHZGVSix7CzauZ58JnLyxr
         1r9dejZ5KwaRv3E48bxMR1vqIX8wwM7LYpS8yB1dFZe7uIxuMUCiWgvUC4FT329hBcfC
         6NIo8u9ah7VxtaiUzzJrvcQnf8kJkzPw21z+yEnVEzoQrjyPVfxRXv9xoDH6Esq+POcw
         76O4ii80EU0khzVOWnSDsNrHX+b4AVCnYs7QOa5TiUlzlOIk3TeSPfnKnTJ7J/lzTAWQ
         0Rg7P2klrk75UU8fk4bodC7AHlWZYz9B9orpo5WS5lW2YgmvnnWL+aNqvwwIYjnvNzX3
         81tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=UfkkTzib;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10-20020ac8774a000000b0031f0ca5b498si5355625qtu.68.2022.09.06.02.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 02:46:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=UfkkTzib;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVVA3-00053e-F1
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 05:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVUTd-0001WK-Uo
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:02:39 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVUTc-00018t-7w
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:02:37 -0400
Received: by mail-pg1-x534.google.com with SMTP id r69so10085643pgr.2
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=N3yZnnmCzzhalF1IzHkzxM7TrD4sWxNKryRCUa4tAr4=;
 b=UfkkTzibWEqs7ugIcV0pje/UhNlrZ9F4M99Ldi9ysXvhucPuUV9lH4h88B+QUBSFMk
 fPm94JiZUzumfML7u7Gn7byCzs0kVSbBPrsZZui9N8f39UbeGPyw3h2fOprZoPV6W95k
 QJMP9w2CaQOS9laS0InwLfUb3qBeO5FZmBb6hgicJHGFST/3j7gPlebehyIZShMFjUk0
 ASC/tZdm87PRK0hYsSNeoNPo9WwMErf2aynLGYuxsnUvilIcc94sNkOmFa0pAW+BTtMS
 Tgd3j1DiNPkbCgZpFPb59UdDM5rX4gpC2wbrgyNXS3JJPGNwisdAag3MKpyG8KwcSgeO
 oNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=N3yZnnmCzzhalF1IzHkzxM7TrD4sWxNKryRCUa4tAr4=;
 b=yqsXiQqDpKfGTJn5LLJwUY+Frbj9fJCJJa/NCPiswWaMpeIvqMuQKb2OAgs3fE3kJF
 JjO5w7rM/swlsKqJ5X3vVNdd+iymd9vs01KAWhBVurRA5t0xPTo3L2O0+UFn78MF3HmD
 C10EFS5RT04JPxtvuxtNWouhIm5TkIaxbFnj5GLfU3XZo/PX7VBzma2vd/GjipSBlnwT
 UP+WY2LL9/Pck/UIHYMIpUxV1eGfm9mxMuzW9hwMl4ck9CT1+CnhrfyOPVVLAX3rvEgQ
 L27Jh9T23yUBdOQ1+UCierB4SdxDfUHQg6x6naAskwiRONvmRQs1aqBxhuKouywFms9f
 r/aQ==
X-Gm-Message-State: ACgBeo0Au5iJAaDFZj/5AF6Eg+tSaIFi7xyIP3UO0+PFPT0tlElufYXR
 T9o/RV4PZ3E60o8dttJdSE/92g==
X-Received: by 2002:a65:6d87:0:b0:42c:5a17:15c8 with SMTP id
 bc7-20020a656d87000000b0042c5a1715c8mr32414552pgb.409.1662454954977; 
 Tue, 06 Sep 2022 02:02:34 -0700 (PDT)
Received: from localhost.localdomain ([49.206.11.92])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a17090a2f8200b001fabcd994c1sm11987315pjd.9.2022.09.06.02.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 02:02:34 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V4 2/3] hw/riscv: virt: Move create_fw_cfg() prior to loading
 kernel
Date: Tue,  6 Sep 2022 14:32:18 +0530
Message-Id: <20220906090219.412517-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906090219.412517-1-sunilvl@ventanamicro.com>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ptgoc44qt0E6

To enable both -kernel and -pflash options, the fw_cfg needs to be
created prior to loading the kernel.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ff8c0df5cd..b6bbf03f61 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1251,6 +1251,13 @@ static void virt_machine_done(Notifier *notifier, void *data)
                                     RISCV64_BIOS_BIN, start_addr, NULL);
     }
 
+    /*
+     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
+     * tree cannot be altered and we get FDT_ERR_NOSPACE.
+     */
+    s->fw_cfg = create_fw_cfg(machine);
+    rom_set_fw(s->fw_cfg);
+
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
@@ -1284,13 +1291,6 @@ static void virt_machine_done(Notifier *notifier, void *data)
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
-    /*
-     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
-     * tree cannot be altered and we get FDT_ERR_NOSPACE.
-     */
-    s->fw_cfg = create_fw_cfg(machine);
-    rom_set_fw(s->fw_cfg);
-
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
                                    machine->ram_size, machine->fdt);
-- 
2.25.1

