Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4163153lfc;
        Mon, 31 Aug 2020 18:42:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHpO8Bjo03eY5I2qRt4Xjtu0MYk9f7xjopYu2zRCv55+CQqS+m9ZYBxxlLYSv+IaQExlA8
X-Received: by 2002:a5b:cca:: with SMTP id e10mr6241478ybr.360.1598924552347;
        Mon, 31 Aug 2020 18:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598924552; cv=none;
        d=google.com; s=arc-20160816;
        b=AnwQt1++UmV/Uh5kXrSfddPN+Du0fFbEdsvrZmZYMWlE1iUpeAAIFWESDDtVCfmukh
         4M6Dg7ZMS0XegtKp8gZeomZW1obhhmDTZW6ZT/O2w1JOTdTtwYK9cMhUIBaCO7n1kBhz
         SZFYDw81InkwgLiq3nSl4JiQvECF7yjyK9+EPMcL8MbiAbFgfDI/TrfdSeN9Qjnlaz78
         EBt8cua6zyl8HeY59NWVbOYUY6EqyRC31HzBoBXeZDJfy1nysxA7qoLRVp8LEnXPJ64x
         DvqrYznVEYXHKvnnXK+HDvBvhxoRaZfWiGC2dR+hyOHpCpymXyKFMZSsezvIqBiFFiZa
         fj7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=s7gyqfg/Mi9mPR4bB0JcRJ4ClLRdi+PkKjofPJk7llE=;
        b=BUv8qgNJgXG5AFxjJSDfnFfNP9FhCstvGB3d4NsGCzWdvbAJZRRIe7+MctfxhbJby2
         p7KOyRv+ihDAMRI54SDsNQT2QHneZviD8vBLJz9rJLCLSxDrPmAifEEDGA00w01A7bfY
         kcCAfQPmsQz85mD48CpuP9mzvZUadJAGveSyu6d5wwa9TT48JYZpt+6SumK5ppPQafFT
         v5T4bZUBDftAWPbQoKtPZvKIc3B3WcTIUojCl5SRmRCH5lKNed8lv3j6zLdOO7iPMmu+
         rIRgJspwgoFpV75k5WYwkAMHNLYFka8SgjBzlyXYvl88MDGrYNWHnkhi+OVnYwXHdyaq
         qT9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pKSZkXCj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si9128779ybf.433.2020.08.31.18.42.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Aug 2020 18:42:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pKSZkXCj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kCvJf-0006Sz-MH
	for alex.bennee@linaro.org; Mon, 31 Aug 2020 21:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kCvII-000555-EX; Mon, 31 Aug 2020 21:41:06 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kCvIG-0005cg-Nn; Mon, 31 Aug 2020 21:41:06 -0400
Received: by mail-pf1-x443.google.com with SMTP id t9so1733953pfq.8;
 Mon, 31 Aug 2020 18:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=s7gyqfg/Mi9mPR4bB0JcRJ4ClLRdi+PkKjofPJk7llE=;
 b=pKSZkXCjTOZSK48zWZ/MQNfc6q/yQ4dpOodq7VqXftkCHfEsiTxRd5ZcuQLnjZPUXK
 9ika8/rm40xEjhRTTNF5tQzp+c+TMeetoDgpj5XGtAGTTsqPXx5npFwsvFW9bT9zjgHA
 THdvtNN/Blsj8EVD5iYLBoUy2EtlcYEBBiAIzbaJhwy5368Z75F4KmSdbb4gT8pHrwCX
 eIU6GtFxh5LbR4w+3JOjvjh4f6rQupke+I4ylXsTMm7ncvuLIE2Yd1FIC4wfNIiVXegj
 xXMYN4xLLbodt1lPPZ+y1KDOvUk5DgAMmkXSyuuAFKWXsUFw/iQT+VZREHSwPwqRxgcL
 Jpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=s7gyqfg/Mi9mPR4bB0JcRJ4ClLRdi+PkKjofPJk7llE=;
 b=k4y6cS7CZYQpYgIH1fxxT4XVBJKlqSVkDFD6Fyv8bBh5hcB8fHySAjtlQhCUl31ePs
 ZmKaKstDmtf4BSyB6qq5BM6sbUnUNGtri3x++4+rS4TRKWNh95uKRTwIPdd1mp7USXfj
 OKKTXlfHMIhTSvtMmysYSZFComldYjBNce020UX9J2nX8uARIfFZYBetGCOsP8+33I4S
 bovRxdMPdpnMc6qKwmKsIV06RTYVAxk4ToPavl3/C0GLiKo1vQCXkOGMtxyYaRWDdunM
 tqZb4vTN4nrgmm4rCogA9DgRYBkfCu8reMt7RhdT5WMR36Zb/OlgFkm+FJNRCcrLnPsF
 QYwA==
X-Gm-Message-State: AOAM5337qWNttu/RBZgUAZsdmhkLtSMdsgp0+pfPBtuBQgwWwtmb7C2w
 77XTMdgPpYIy2jQeqtp9jwE=
X-Received: by 2002:a62:33c2:: with SMTP id z185mr3671034pfz.242.1598924462944; 
 Mon, 31 Aug 2020 18:41:02 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id l13sm8887520pgq.33.2020.08.31.18.40.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 31 Aug 2020 18:41:02 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 11/16] hw/net: cadence_gem: Add a new 'phy-addr' property
Date: Tue,  1 Sep 2020 09:39:06 +0800
Message-Id: <1598924352-89526-12-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
References: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bw0L4cvm4R1z

From: Bin Meng <bin.meng@windriver.com>

At present the PHY address of the PHY connected to GEM is hard-coded
to either 23 (BOARD_PHY_ADDRESS) or 0. This might not be the case for
all boards. Add a new 'phy-addr' property so that board can specify
the PHY address for each GEM instance.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v2)

Changes in v2:
- change "phy-addr" default value to BOARD_PHY_ADDRESS

 include/hw/net/cadence_gem.h | 2 ++
 hw/net/cadence_gem.c         | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index 54e646f..01c6189 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -73,6 +73,8 @@ typedef struct CadenceGEMState {
     /* Mask of register bits which are write 1 to clear */
     uint32_t regs_w1c[CADENCE_GEM_MAXREG];
 
+    /* PHY address */
+    uint8_t phy_addr;
     /* PHY registers backing store */
     uint16_t phy_regs[32];
 
diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index a93b5c0..d80096b 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1446,7 +1446,7 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
             uint32_t phy_addr, reg_num;
 
             phy_addr = (retval & GEM_PHYMNTNC_ADDR) >> GEM_PHYMNTNC_ADDR_SHFT;
-            if (phy_addr == BOARD_PHY_ADDRESS || phy_addr == 0) {
+            if (phy_addr == s->phy_addr || phy_addr == 0) {
                 reg_num = (retval & GEM_PHYMNTNC_REG) >> GEM_PHYMNTNC_REG_SHIFT;
                 retval &= 0xFFFF0000;
                 retval |= gem_phy_read(s, reg_num);
@@ -1569,7 +1569,7 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
             uint32_t phy_addr, reg_num;
 
             phy_addr = (val & GEM_PHYMNTNC_ADDR) >> GEM_PHYMNTNC_ADDR_SHFT;
-            if (phy_addr == BOARD_PHY_ADDRESS || phy_addr == 0) {
+            if (phy_addr == s->phy_addr || phy_addr == 0) {
                 reg_num = (val & GEM_PHYMNTNC_REG) >> GEM_PHYMNTNC_REG_SHIFT;
                 gem_phy_write(s, reg_num, val);
             }
@@ -1682,6 +1682,7 @@ static Property gem_properties[] = {
     DEFINE_NIC_PROPERTIES(CadenceGEMState, conf),
     DEFINE_PROP_UINT32("revision", CadenceGEMState, revision,
                        GEM_MODID_VALUE),
+    DEFINE_PROP_UINT8("phy-addr", CadenceGEMState, phy_addr, BOARD_PHY_ADDRESS),
     DEFINE_PROP_UINT8("num-priority-queues", CadenceGEMState,
                       num_priority_queues, 1),
     DEFINE_PROP_UINT8("num-type1-screeners", CadenceGEMState,
-- 
2.7.4

