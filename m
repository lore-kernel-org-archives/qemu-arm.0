Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp6763150lfk;
        Mon, 22 Nov 2021 03:04:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRzUgxi1ZNBboKUlw4HJVU9VNELnCiAa8AMdxz5/BzjCTH7vcPOkYaUfhn04eV6VKSTMjY
X-Received: by 2002:a05:6102:7b3:: with SMTP id x19mr131106402vsg.24.1637579063251;
        Mon, 22 Nov 2021 03:04:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637579063; cv=none;
        d=google.com; s=arc-20160816;
        b=wEa7EP76FZtO7L66W8R5fUPbG+ZDqhSEpQ1246PwgRZCMgr1hfDdWkIX/gBKJgLJZI
         hi/penW7F6F8yg150ijLcYvPwBdIgQzyNO8P546kq+2WVqhFAnHVi4V+ETGphQK7Ap7D
         lWeIL3jqFa+1iMmZVbas/860iOWc4a/1/lTzadoSKpcdOhcl6IyucNhb4b1qRel/Q0Mp
         NBb8hqSuHsy9a9ii7zN242E11EVk52P+lc+ElERz9VicTzyMOMItqwLJQ394iDpuoORg
         sqfjNxGsnr6dKO+5qNLKaxbli8xdA7L6ciUsXXgHKbTqxUrogKjpzNZEM14nBlT6CuYh
         PWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Tdq7N3oNCaqvE7IxQ4unaziboqg8QUaCE/ZXK4Tc81s=;
        b=DYQhw3fOlnwTVqz3yM/eczR1cywGNWhl01659kGeZBWZAQFSWIJqNHfSWy9aVIrExu
         fKJhT14hUEIbAHtbJbLQtbqVCTEjFOiCbI6zqAZQvGVvzy428kYLeNa+P5h9MxcbeOf/
         cwNmzvfpC1lGVrAqXvqqw7yL5fsIPL/kQRisMcHsnEXX4BH1wQwLbv0L8sGfEGoR9VHf
         dm6qnPDvj+mPViTV6oKQbkv5dVpXsP1wTnr6v/Adak87mxwz3asnuOzqOmtI71TJz9nc
         a9quFgsbvQknl81YPX1mjdVLcvdlm5wVCQxRkp1pEbH9JUU8HFDBFrWOKgE5FnKAwf8r
         tlig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="ekuBg/7W";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a24si22149146uas.11.2021.11.22.03.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Nov 2021 03:04:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="ekuBg/7W";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mp77W-00020E-It
	for alex.bennee@linaro.org; Mon, 22 Nov 2021 06:04:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mp6vX-0002fd-4b; Mon, 22 Nov 2021 05:51:59 -0500
Received: from [2a00:1450:4864:20::42f] (port=39727
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mp6vV-0000NH-Kg; Mon, 22 Nov 2021 05:51:58 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d27so31894592wrb.6;
 Mon, 22 Nov 2021 02:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tdq7N3oNCaqvE7IxQ4unaziboqg8QUaCE/ZXK4Tc81s=;
 b=ekuBg/7W7q3hiCgSwO67UU6+u3tB0/hWhHicDyVeOtx1S6FWeUH8pl/bS50pZp44md
 dz7ZOzORVF0HWDTfYcxN5jkppikEM394PpnH70rPe8yo+SXef/ir1vdzK5m/D9qayM1P
 Mj8P6trUPqmmDSYUI9gHqYilxaFA5V6Cwih3VAMhwyK8dILBTunnzoOqlEew+StIb+vJ
 WbI+7TwWS3BA+NWygLL06bXLpotrtf3b/O2Xhsl1SHbirVfDXHLovoWdYrKVXD0643KT
 Ffu+I1rXe5djGfrOqZfwcN4Gske4BV/iLsiaxnmE63NifGJ1eHH1staPQb5dBxQD6uuF
 1wDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Tdq7N3oNCaqvE7IxQ4unaziboqg8QUaCE/ZXK4Tc81s=;
 b=d6ce8I68BhEEkCw6HkDXCNDw5mkdeUBSTsjne10QSUEeN28TnNvMX4S7lHosuzbYuO
 E1CW2yCK82JeU9BUdM9lgQ1/cRDTkzV4+UGgjeCNgngBFjqAjHMWlmcSOI4phr73oLEj
 h6HEwbL6kTgXcQxP4luxOuj4KgMRD5cqyso/75GtmqImTC2JSM46uTI2pPNFarrbo0BN
 ls3vdKGMhirbM24eAQv7omp+leAmft5lfj2M1YUxbuzCGxkPfMq/3l4Uusu1k9qmwAdF
 Drx745MitPUiUaKIXNrVjfsXxWW/QiHtAI9KiAIUcjPlvOKOXYdBA2qa3d/PtuHp9b+Z
 4ybw==
X-Gm-Message-State: AOAM531hA3B/uTfzsdI/XEkhWZKOuAcjyBLKUirDxRhA6rGt2V+uev51
 t3C4zxrXmwog56WCd4sJFnr5xbmRA1Q=
X-Received: by 2002:adf:f40b:: with SMTP id g11mr38059008wro.296.1637578307169; 
 Mon, 22 Nov 2021 02:51:47 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o4sm24345061wmq.31.2021.11.22.02.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 02:51:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/net/allwinner_emac: Replace MII_ANAR_TX -> MII_ANLPAR_TX
 definition
Date: Mon, 22 Nov 2021 11:51:45 +0100
Message-Id: <20211122105145.1053455-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gPrW8Npo1hE+

While both MII_ANAR_TX / MII_ANLPAR_TX have the same value,
the ANAR and ANLPAR registers are different, so technically
the ANLPAR register have to use the MII_ANLPAR_TX definition.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/allwinner_emac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/allwinner_emac.c b/hw/net/allwinner_emac.c
index ddddf35c45d..3aed92b8f1a 100644
--- a/hw/net/allwinner_emac.c
+++ b/hw/net/allwinner_emac.c
@@ -50,7 +50,7 @@ static void mii_reset(RTL8201CPState *mii, bool link_ok)
                 MII_BMSR_10T_HD | MII_BMSR_MFPS | MII_BMSR_AUTONEG;
     mii->anar = MII_ANAR_TXFD | MII_ANAR_TX | MII_ANAR_10FD | MII_ANAR_10 |
                 MII_ANAR_CSMACD;
-    mii->anlpar = MII_ANAR_TX;
+    mii->anlpar = MII_ANLPAR_TX;
 
     mii_set_link(mii, link_ok);
 }
-- 
2.31.1

