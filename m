Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp4540839wri;
        Mon, 4 Nov 2019 14:02:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqyV8Q+5scmQJZQBtosvKz/mfH6zcmOnLXryEHEH6VZ4nX3CVC5UPmWUwh/gr4XDg4ak4bTY
X-Received: by 2002:a17:906:f753:: with SMTP id jp19mr12239955ejb.216.1572904936105;
        Mon, 04 Nov 2019 14:02:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572904936; cv=none;
        d=google.com; s=arc-20160816;
        b=IXHUZjC+SkIpx2t9t6R4VtRMRZe8/24Oqf1hNtw4aPdEDAV9xBnny3ILnwoOY8gLhU
         XvazWBHo2+QF4tPr71IZelrib5rW3TvdPwcZhlhx/ZATgOgdyD3RC8NCMFn0by8Dd1YV
         OxDAZghJ2vTTJxhVnRMu5zliWVnJ5HEdmj92wwfr3Kglb2QP/64Ji2/ed7ebzSuqRuvI
         2SJYACzwnWuxDAVUxOc47OH3Nb/hGxN2DL9tNTfJW8t7US6r4oyMuEBoofUaB3ystDrn
         E1YnNPC5MwKUyQ+JX8245ltqQCYh11EH0EHgq7UgKgE5G4YIrJZf86BT9qWsvFEqXEHq
         +Ihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=vZlHRNrWzOSLywQj2MWXmHR9NXbEechkL9y1Q+q5kes=;
        b=tp0yFxYHk3iO5mn96FUDUlob5fem9jjZRzd2IhDQRUAmU+y8g2Z+sx6N4zmRtsDBPj
         Q4+lCUDSN25u765cfZvrOOsXvFh+EwJem9uKX4y3nvaDG1Z+9WFrPqYr88rNrfAJdZyr
         8RJ8c6aLLxrt1qzfgkllFjODQpmGO7NvC64OKA1JXjSSMGO6PFDRWrH5mMRbBLbApMdz
         5r/UR5aSxBPZzQdg2bkNbxn+G6dRdyznPO+eFiYQqBSyVQMNgSf5sKuiQWkH+Yeg9+n6
         HH2Gdc6iUfAxBGiJT+ZWbGhz+R7HkeuiZe2E5wIOvJZ/0xnFYb/dPirTos7347/XFoCN
         1YcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@holoplot-com.20150623.gappssmtp.com header.s=20150623 header.b=CpVDj8d5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3si5143687eju.377.2019.11.04.14.02.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2019 14:02:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@holoplot-com.20150623.gappssmtp.com header.s=20150623 header.b=CpVDj8d5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iRkQQ-0003eL-Ue
	for alex.bennee@linaro.org; Mon, 04 Nov 2019 17:02:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41148)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <linus.ziegert@holoplot.com>) id 1iRgu4-0008MO-Tr
 for qemu-arm@nongnu.org; Mon, 04 Nov 2019 13:16:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <linus.ziegert@holoplot.com>) id 1iRgu3-0006Za-MK
 for qemu-arm@nongnu.org; Mon, 04 Nov 2019 13:16:36 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55783)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <linus.ziegert@holoplot.com>)
 id 1iRgu3-0006Yu-9g
 for qemu-arm@nongnu.org; Mon, 04 Nov 2019 13:16:35 -0500
Received: by mail-wm1-x341.google.com with SMTP id m17so8504103wmi.5
 for <qemu-arm@nongnu.org>; Mon, 04 Nov 2019 10:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=holoplot-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vZlHRNrWzOSLywQj2MWXmHR9NXbEechkL9y1Q+q5kes=;
 b=CpVDj8d5jarBg9AgbBvLnr6G6Ny10ptuL3kZjzoDBd/JJ1TxIz4daZ3n0jHlAm3BAd
 Kk/0GLs+FBfikPVkJh6lQuPDV5btsM1aNBVdizVGG5jVU0R1PeLpgfRDBN5heeYQu5mh
 RGLCtOREljfsAiN3PGj6zcG2IMx0vwpyqlgEQRJNg1sZanVZWopFW71euSuI0UMxbEV7
 CJfQgjfq2rNCJJgaPzGLEC0vGXCLhlMFxbkGaux7TX5iko/wxEh/rOsMCGRd6cmWqN/l
 eUIZlRGh2p0ZLSgKQFlildIzK3Tti0xNoHQMXzr4oXy/YzSAW6/wgCHix/KQlMVuJ+aO
 DxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vZlHRNrWzOSLywQj2MWXmHR9NXbEechkL9y1Q+q5kes=;
 b=iUq33Jx5+ysFupSBEvLhT8w0zOMgC7Wg3tXpjkHPNabAu+KVSLeZ0N96DV1XJS7/HL
 vDkEs1ZRKhd9pY0SgrSb7dwO9WzV6Dfh0KzFOXMqT5c0KCDAz7e3PnhA63TW2NyA/Mqp
 uvhDOZvFune9ZWSJ7gkVOMfhLoY0bkuYFYDrKm/VCLkol0ShxvnenFBd9TTQZt6iQBke
 ZWG7chRn6z/YZkVzroHERltIk+r1RSxwpepxQT66tUWTrLa7XAh/bKiR/LyfwM3n4mtS
 FMNCUUjDjfYNWtWmcUHtt12mFn3ECtDLYh0W6VidG4fERJeTtXXxyaeE2QKkoV2ty0gG
 7DgA==
X-Gm-Message-State: APjAAAUC5l4Gbizy2OEwtl31YN1cfrbplucyxeYZF8ckFulBJnDzszmk
 Kxu94xlMDUj+4RbxsU3i9NL7BQ==
X-Received: by 2002:a7b:ce12:: with SMTP id m18mr408194wmc.130.1572891393265; 
 Mon, 04 Nov 2019 10:16:33 -0800 (PST)
Received: from localhost.localdomain ([194.162.236.226])
 by smtp.gmail.com with ESMTPSA id q15sm17165703wrr.82.2019.11.04.10.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 10:16:32 -0800 (PST)
From: linus.ziegert@holoplot.com
X-Google-Original-From: linus.ziegert+qemu@holoplot.com
To: qemu-devel@nongnu.org
Subject: [PATCH] net/cadence_gem: Set PHY autonegotiation restart status
Date: Mon,  4 Nov 2019 19:16:04 +0100
Message-Id: <20191104181604.21943-1-linus.ziegert+qemu@holoplot.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
X-Mailman-Approved-At: Mon, 04 Nov 2019 17:02:06 -0500
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 Linus Ziegert <linus.ziegert+qemu@holoplot.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xsaZc/+YPMLZ

From: Linus Ziegert <linus.ziegert+qemu@holoplot.com>

The Linux kernel PHY driver sets AN_RESTART in the BMCR of the
PHY when autonegotiation is started.
Recently the kernel started to read back the PHY's AN_RESTART
bit and now checks whether the autonegotiation is complete and
the bit was cleared [1]. Otherwise the link status is down.

The emulated PHY needs to clear AN_RESTART immediately to inform
the kernel driver about the completion of autonegotiation phase.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c36757eb9dee

Signed-off-by: Linus Ziegert <linus.ziegert+qemu@holoplot.com>
---
 hw/net/cadence_gem.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 7f9cb5ab95..b8be73dc55 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -271,9 +271,10 @@
 #define PHY_REG_EXT_PHYSPCFC_ST   27
 #define PHY_REG_CABLE_DIAG   28
 
-#define PHY_REG_CONTROL_RST  0x8000
-#define PHY_REG_CONTROL_LOOP 0x4000
-#define PHY_REG_CONTROL_ANEG 0x1000
+#define PHY_REG_CONTROL_RST       0x8000
+#define PHY_REG_CONTROL_LOOP      0x4000
+#define PHY_REG_CONTROL_ANEG      0x1000
+#define PHY_REG_CONTROL_ANRESTART 0x0200
 
 #define PHY_REG_STATUS_LINK     0x0004
 #define PHY_REG_STATUS_ANEGCMPL 0x0020
@@ -1345,7 +1346,7 @@ static void gem_phy_write(CadenceGEMState *s, unsigned reg_num, uint16_t val)
         }
         if (val & PHY_REG_CONTROL_ANEG) {
             /* Complete autonegotiation immediately */
-            val &= ~PHY_REG_CONTROL_ANEG;
+            val &= ~(PHY_REG_CONTROL_ANEG | PHY_REG_CONTROL_ANRESTART);
             s->phy_regs[PHY_REG_STATUS] |= PHY_REG_STATUS_ANEGCMPL;
         }
         if (val & PHY_REG_CONTROL_LOOP) {
-- 
2.21.0

