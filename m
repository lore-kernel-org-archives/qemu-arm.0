Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp607289lfy;
        Fri, 14 Aug 2020 09:51:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLfxYoDDzNMXwIRo/B20zMUSE4yoUAHedxy7ZAojr5WjY6z/4RZOBi9zIlwRRMt3YAsGEU
X-Received: by 2002:a25:1189:: with SMTP id 131mr4690000ybr.364.1597423864181;
        Fri, 14 Aug 2020 09:51:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597423864; cv=none;
        d=google.com; s=arc-20160816;
        b=QJKbJBHbZPfSpAzvNvvxkT3fkb0OP5efJTdK+xPB7hHyFWGfE5QnlHLnkm/MVJ50/E
         yjLIwPRDgTACNwb1jljU6ZGbGrUhPS1ZkljsBTgANyvTGaIFZe6nhFDNHQh6B66teyUu
         QeahVZ8wjAjvi2YmC5hI5gM3hcEgyAVWribwioTSCjL8sM8xbqUiZM5o87uX7OEbGUkw
         RjCsWh1OIMqMuaiehs++bG5DO6WGpawFTblknylYZ3NBvvEoBREPLf1pAF9tI/Gv+/py
         lZeA5Nf9Eg1cPo13V5ius+bSdCp67XyR2jU/By+WPIDuok46jziDnw/8B5jiU+1SycSk
         Uyfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=xWM6KDXnU2haYF7jfdME41V1s1evuLW8hUFzTHSoRXs=;
        b=N4Vmau6UGk6JiOh/veVNLobHPzUa79UgjY6oI3+CoLbCc0zQ9s6bnVepSNAU/yI6p3
         pIofQ+UZjdvK4ZXoh+xrsl2KpdnJMV0e3thpD7niEr+BOW2bvRLSK5Oi0DsPXwrgKz+1
         9DWlhYUrn0fizojb+apEWuO0qm5e+a4xJ3I4u4FUqbKKDrAz33+grfjJETDh+q9A2jnR
         xTvvBm+Vn6P45ZEznclTAQtGGvX6IVAKWuh+b/eVsFXCyZAFeija3kIwJugBOQ2aJrxT
         ovvY3W3O1Idxj9yh8FGJHiL8xUj0hqv4XEpYRl/6obCpbjBlEznEQGKMPgr/N/AE1/P5
         VmjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rM65ZrIR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si7747401ybw.299.2020.08.14.09.51.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 09:51:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rM65ZrIR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6cv1-0006oh-JU
	for alex.bennee@linaro.org; Fri, 14 Aug 2020 12:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k6cmG-000069-Eq; Fri, 14 Aug 2020 12:42:00 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k6cmE-0002jp-Rp; Fri, 14 Aug 2020 12:42:00 -0400
Received: by mail-pg1-x543.google.com with SMTP id d19so4782801pgl.10;
 Fri, 14 Aug 2020 09:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xWM6KDXnU2haYF7jfdME41V1s1evuLW8hUFzTHSoRXs=;
 b=rM65ZrIRr7SUkTX++aNO9naidmkz+pllYUoakwS2ewObrlyMN20GcwL6J69OB63fMH
 fBgEpe9cthP8OiMGeF7U8ckVgt5XAHgJiSBqFD0dkn+L9B2KpvSzZKyqAfMQEK1EARZ1
 FO0bVZxczgJ+QyIcVusKFnMxTxg+WIVXq/G171ZCM6spYZjsdrrgJzPi0qBdBdAFP1YE
 C4gzvaDX1DLNkfAedscqbmricsg5jhj92OCFlei5Sc0picJTSq3BaRtcOXa1zH5apec1
 PB2GXVCK3MYlEPGmnQ6qrsOjOptmDwqZz/F8qomhch3xbW1QCLsS3flWzXFgNoQ0xyZb
 gRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xWM6KDXnU2haYF7jfdME41V1s1evuLW8hUFzTHSoRXs=;
 b=ZshvFwC9QRTI0Boo7zMX9auY69RWq06bZ9tPUNDZ/BJifhXlyFIw7MVMqg5TCMOr6T
 QXVVc9MgFx4+CryeUfWwX4rpfGZFbPuhvTySOjxrJb9+VqkrLuYHoWiTHk28wuZ2t3Jn
 klavrLTuBvXdt9UbWghlzRmxSaqmUgi42d+hLsv3OdZGXIyfUPZeQKKL6BsaDxBFwxZK
 rhN6JZ9xcK+vlBfAEZIzM2AJCLCUFo2rIfm9SHouU1imgpF10FNNg95vUkuk9xv0ruiG
 nbLE0xZQ7XGBdcU+EgwIZtTV+YCim4StSf030n1b6DP8HoDOFyD7HeoXMaSIL+g9oem2
 mWRg==
X-Gm-Message-State: AOAM531g4as0ONTdH9hXNmb/uHIJ+tsh0nwjGppeojy0IJ6KncwnGNrI
 CuhTmsw6nIfbZoIuAZLrkeQ=
X-Received: by 2002:a05:6a00:1509:: with SMTP id
 q9mr2460323pfu.24.1597423317031; 
 Fri, 14 Aug 2020 09:41:57 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id 16sm9836332pfi.161.2020.08.14.09.41.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Aug 2020 09:41:56 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 14/18] hw/net: cadence_gem: Add a new 'phy-addr' property
Date: Sat, 15 Aug 2020 00:40:52 +0800
Message-Id: <1597423256-14847-15-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
References: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x543.google.com
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
X-TUID: cn6o+anjTJ+X

From: Bin Meng <bin.meng@windriver.com>

At present the PHY address of the PHY connected to GEM is hard-coded
to either 23 (BOARD_PHY_ADDRESS) or 0. This might not be the case for
all boards. Add a new 'phy-addr' property so that board can specify
the PHY address for each GEM instance.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/net/cadence_gem.c         | 7 +++++--
 include/hw/net/cadence_gem.h | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index a93b5c0..9fa03de 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1446,7 +1446,8 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
             uint32_t phy_addr, reg_num;
 
             phy_addr = (retval & GEM_PHYMNTNC_ADDR) >> GEM_PHYMNTNC_ADDR_SHFT;
-            if (phy_addr == BOARD_PHY_ADDRESS || phy_addr == 0) {
+            if (phy_addr == BOARD_PHY_ADDRESS || phy_addr == 0 ||
+                phy_addr == s->phy_addr) {
                 reg_num = (retval & GEM_PHYMNTNC_REG) >> GEM_PHYMNTNC_REG_SHIFT;
                 retval &= 0xFFFF0000;
                 retval |= gem_phy_read(s, reg_num);
@@ -1569,7 +1570,8 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
             uint32_t phy_addr, reg_num;
 
             phy_addr = (val & GEM_PHYMNTNC_ADDR) >> GEM_PHYMNTNC_ADDR_SHFT;
-            if (phy_addr == BOARD_PHY_ADDRESS || phy_addr == 0) {
+            if (phy_addr == BOARD_PHY_ADDRESS || phy_addr == 0 ||
+                phy_addr == s->phy_addr) {
                 reg_num = (val & GEM_PHYMNTNC_REG) >> GEM_PHYMNTNC_REG_SHIFT;
                 gem_phy_write(s, reg_num, val);
             }
@@ -1682,6 +1684,7 @@ static Property gem_properties[] = {
     DEFINE_NIC_PROPERTIES(CadenceGEMState, conf),
     DEFINE_PROP_UINT32("revision", CadenceGEMState, revision,
                        GEM_MODID_VALUE),
+    DEFINE_PROP_UINT8("phy-addr", CadenceGEMState, phy_addr, 0),
     DEFINE_PROP_UINT8("num-priority-queues", CadenceGEMState,
                       num_priority_queues, 1),
     DEFINE_PROP_UINT8("num-type1-screeners", CadenceGEMState,
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
 
-- 
2.7.4

