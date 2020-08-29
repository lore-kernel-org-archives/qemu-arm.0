Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2337955lfc;
        Sat, 29 Aug 2020 08:22:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK2DPuBQK0bt9C7ZSpQi4CVwyAzRb4O/vYhBi0fUu2klUdH8XpqcOoAPjIfhyw0HtlWyOg
X-Received: by 2002:a25:bcce:: with SMTP id l14mr9859057ybm.467.1598714539445;
        Sat, 29 Aug 2020 08:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598714539; cv=none;
        d=google.com; s=arc-20160816;
        b=NEODVxzvxbE0Fn9EW5QAjetKpHvAsfglwUKRBHyXxaLjUtEQfBhyPouz6h62wOYTCk
         rx/pbzYJI7eTZBt9QisDltji8oDkB2w7HT58iHk68q4z+6XsREjKS8zj9Vj27LOXDEjh
         czbBCxyOGyccRMaJLd1N2FI4y7pnDA8it0PN4FE7zfgmWtxEdVwF+hs1dJVUal7y4S2v
         uSOterJOehHNhLzOKzXokc/uXrsAIRmbL5aiM+QS9UhrT5si4REWO5kucQ7MAeZaBIwo
         wZlxH0LT92vJA5h7uYFR/miQImvnghZ1lNQzi2rVa/08mIlArDwm4lIFPTmyQWnEuv9t
         EUkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=XSd6UA9oGJXgO/Kcn28mrye1Vbs4EU3WILT/MQkdqmw=;
        b=0koyjhcRtsX7j9mpL0Z4INhDVBP0FjNnOn9fFCudyMyE/OGirAt/31XCCY1j6IdPxE
         aLOH6uwuRMeBVdPHag8WvwUTLkBIEW+u1dSxir3zQmLfVcxmU9jHXoRWV1nB0bgmcpsn
         dnopq2YKSMMH8tQtRumMhsvdyB2VKnsFGy1kLtyWV+SCORi7wkzUXvuuNbBZGdqjfSqO
         rORVUf3B5mAamD1HER3MRyt0B42bySl/B3D3ZG2r3pFCMfv7q795GrzGuBK4Oy/pXYCz
         j9pPn2IY4kS4B0wBmGtBuKT3Ypv+ZjiNlcXW2/NvI+MbyHcS93CJvyf2p3GWL+K9qWxY
         +u4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iRPM103u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 77si2276898ybc.208.2020.08.29.08.22.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Aug 2020 08:22:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iRPM103u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kC2gM-0007h4-Qz
	for alex.bennee@linaro.org; Sat, 29 Aug 2020 11:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kC2d0-00018t-Kl; Sat, 29 Aug 2020 11:18:51 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:46343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kC2cz-0005E1-32; Sat, 29 Aug 2020 11:18:50 -0400
Received: by mail-ot1-x342.google.com with SMTP id j3so1758504otk.13;
 Sat, 29 Aug 2020 08:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XSd6UA9oGJXgO/Kcn28mrye1Vbs4EU3WILT/MQkdqmw=;
 b=iRPM103u4ZZKHaEFmDRJvt+VAJIsRj9fNeEZGzCBpYoBz+d4HF+5AThuaNOf2Jcfqn
 EzkCbCUjw8Kb+XEWJ0j3+xF2jnYUlxMQpxzh2hFy9nBOehtFxWSmzRfjaXP72aijCxdl
 FcStNKlHNkOHkJ9F+OOeGodMY+rF/wwGXV9G12tdPRHstKXx2fnYSlOq1xDWIxpx3Ilf
 c137FI9SFXqX7LWBiPdoRBiu1LRx3ecKZRGXpFdfZVh2nim0GijCzXBCKKgs3KGUzVaG
 y1OjyeRrUF5SplLXGCL8B5+wFZDBM6qSj6dkeFlfVCBNeuQ5koUWhcUAXztBMI46bGIe
 ZFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XSd6UA9oGJXgO/Kcn28mrye1Vbs4EU3WILT/MQkdqmw=;
 b=qyRnVqbNhYdhumThil8DTtQI+52SgCzgeVT0aXDN5BlaX6ScUp5exGGDM1bVxN0j4z
 lKsHmc9OM+uh4nfefmtF3w9MV0wbTnaL0azoJvKcvNkGEHsdp3Fm0ELSb5LhI8lAvCTP
 3Sga9bsDfNNmxtwxYAI6r7WEBdhom1ezMGRRxWbcM/lnp9Ipk8JKC3h+LMzzObp9kFxz
 GLc+dXHMSVxCmO+WU53sA7TOlsVGFRixs+scvaygPNraYDP73TcTJsWIcZ6ITpYRKBff
 tdJ8EZj9RnZ90/gyrUo/zUW+gp9iTaMbMCn+gp/U8NCYiJKz6zimp16EWLyOOPNG2VYV
 DUqw==
X-Gm-Message-State: AOAM5333Oou7/KtZUiaPJ31tEBS8CgI92XYGYfnBg+unMKmw5ixCYXEF
 41rn3M1iYozjbqM41HgFaeg=
X-Received: by 2002:a9d:4b01:: with SMTP id q1mr2311635otf.15.1598714327353;
 Sat, 29 Aug 2020 08:18:47 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id f50sm58181otf.47.2020.08.29.08.18.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 29 Aug 2020 08:18:46 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 11/16] hw/net: cadence_gem: Add a new 'phy-addr' property
Date: Sat, 29 Aug 2020 23:17:35 +0800
Message-Id: <1598714261-8320-12-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598714261-8320-1-git-send-email-bmeng.cn@gmail.com>
References: <1598714261-8320-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ot1-x342.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OnCEkhGezO7m

From: Bin Meng <bin.meng@windriver.com>

At present the PHY address of the PHY connected to GEM is hard-coded
to either 23 (BOARD_PHY_ADDRESS) or 0. This might not be the case for
all boards. Add a new 'phy-addr' property so that board can specify
the PHY address for each GEM instance.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

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

