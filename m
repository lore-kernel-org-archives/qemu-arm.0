Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp664862lfi;
        Sun, 22 Mar 2020 13:55:45 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vunFmk5Fars4zPCvXwLuNWaNoZ8SY2CDsO2D10LEn3UfpW5fRTcrwk1b33DMQTDF3iuWWOl
X-Received: by 2002:a37:9684:: with SMTP id y126mr17856856qkd.151.1584910545214;
        Sun, 22 Mar 2020 13:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584910545; cv=none;
        d=google.com; s=arc-20160816;
        b=O98GPI3shsnZVhHxgj6EEH6qYs3KwNr9Knv1LTmhBxWD6RXwMFi7lxXZrPpFbpkc/9
         lTNyFy1iTVmnjkRSNzGR7u1ABHjS7o3yXYTCWrGW/ppjcGTh76+8vtD60cDMlnO9bxQm
         WzC60e5BxZ7Ycxpj5u2UTe1ijYA85eIVGZ6rao8Tuo4sd/5/IICm8wOaTOGs/E4NMN08
         rFdm8gdpkr7juABFseOGlIUIGJcF2PuQbrdGEUT6cQUqaRoJ0rj05mP2B314lpIiOTjT
         TqRwwWsjSmDcvZtBtih0R/EuZESAzAnAMYWPsPtsDp4RA9YkLqvqzGWVmT9a7b14tY1g
         8Sig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=Zzy2hYvjYn3wSBM6sGEj1OgFy+nH1+JEHvHfIqt2Yq0=;
        b=Qeycpj1aCZSaBdt1bDrwIg4Ja8wu6IUS2nJ9YlVM60RCgXTTK8sx6At6E/oQ0IAKY5
         +V2tYgPufiii60MSpuDQ5aiiVgEUgBxCqSLKo6qRG8czyJDAI3A5qkBpL9w3A2ljI0T0
         k4Vyb+/Z7+XRaAQFGRHXfQtiPWw4YiEtKxmraslxesX3pFh3r9S6JHd6m8TnDo6oxUwj
         Yzw2FajB7lc4P/yL3UATc8G+sZz3+tMfv6U/N/cnF8knaDm1wFGJ6KN8G94TaSoPxIRP
         BGRC2eFb2K906rJjfRB5DWY3jLU2fzC8l3OB+qxAUPGDd2EzSREPUCQ2va+Wb3rwuWJy
         kkGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l6V2qEsI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14si7118394qvn.209.2020.03.22.13.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Mar 2020 13:55:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=l6V2qEsI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jG7dI-0002lK-Lr
	for alex.bennee@linaro.org; Sun, 22 Mar 2020 16:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40786)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1jG7cO-0001VA-5B
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 16:54:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1jG7cN-00018N-5u
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 16:54:48 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36838)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1jG7cN-00017m-06; Sun, 22 Mar 2020 16:54:47 -0400
Received: by mail-wr1-x444.google.com with SMTP id 31so8420576wrs.3;
 Sun, 22 Mar 2020 13:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Zzy2hYvjYn3wSBM6sGEj1OgFy+nH1+JEHvHfIqt2Yq0=;
 b=l6V2qEsIMwaUc71z0WJb5Sp19aP4RK37tnYt4DmjWM3YxVyiNKD4lwzj/Q+10lBzeI
 YB3we+rfS/rRmn8Jn8s74oWClQsKlwZBiSknwo1J+O4jStt5/u/bIfU+oRUbfN310ZlK
 e5Gko56c1BFryFUyTNnqrppqbh+66DUmGdjrAzFyKzOSv8K/FhTWB/z3wqqk3SD7vJkD
 oRTsCfxzJV2yX02AeIs1ypuRg3soGISYeF5QYcAdvb/FLJdRTxCN4ilpZlxDkMRuhTCd
 Fsh+17W9kO7NBI5OSyklppmCAauCE3nYlljt+sE6SM8IHcDh3B15zytD85Xd6GLIVIsd
 KmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Zzy2hYvjYn3wSBM6sGEj1OgFy+nH1+JEHvHfIqt2Yq0=;
 b=mgEzH/xs5e1XzeoniK96mDhjB8H+NEj5pVtMpBey9iHerEPKDM9jpC5MSYs4lDes+6
 BpzxwD6Wcmkv0PTHtBgdzEHOuBZa1/iJH3chFDGIbemgYq8lVAhp9C8wEmtQQ3C8xBDX
 gwO4edEupG3EJFSdbiwWWmxelFyxMASGLzmVrL8wnQB4DoW50HUDHyZCicLW7gnn7fuS
 3brQvDVFQXHSf+1+2iVTyq8ylT9BjFZ5LP9bkD1gfgcBWrM3DfCA9OaWsszaWkPvYjru
 RTjT0hARQ9/85DxwpN/cuscouCwvRahjxExs71LrbCP3DpGVTEejMGyNC0eAdo8sQAk/
 Z4Vg==
X-Gm-Message-State: ANhLgQ2cYMpKROlHn5edON97L1bq+BboWF6j03mRPx+7j8wfwTprRi9/
 zjIIUz7np/7NWlj2P+nkFykH/Kn6
X-Received: by 2002:adf:f6c7:: with SMTP id y7mr26054380wrp.269.1584910485802; 
 Sun, 22 Mar 2020 13:54:45 -0700 (PDT)
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
 by smtp.gmail.com with ESMTPSA id w7sm21083875wrr.60.2020.03.22.13.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 13:54:45 -0700 (PDT)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/misc/allwinner-h3-dramc: enforce 64-bit multiply when
 calculating row mirror address
Date: Sun, 22 Mar 2020 21:54:39 +0100
Message-Id: <20200322205439.15231-2-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200322205439.15231-1-nieklinnenbank@gmail.com>
References: <20200322205439.15231-1-nieklinnenbank@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: peter.maydell@linaro.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lRsI+6op3MP6

The allwinner_h3_dramc_map_rows function simulates row addressing behavior
when bootloader software attempts to detect the amount of available SDRAM.

Currently the line that calculates the 64-bit address of the mirrored row
uses a signed 32-bit multiply operation that in theory could result in the
upper 32-bit be all 1s. This commit ensures that the row mirror address
is calculated using only 64-bit operations.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 hw/misc/allwinner-h3-dramc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/allwinner-h3-dramc.c b/hw/misc/allwinner-h3-dramc.c
index 2b5260260e..f9f05b5384 100644
--- a/hw/misc/allwinner-h3-dramc.c
+++ b/hw/misc/allwinner-h3-dramc.c
@@ -85,8 +85,8 @@ static void allwinner_h3_dramc_map_rows(AwH3DramCtlState *s, uint8_t row_bits,
 
     } else if (row_bits_actual) {
         /* Row bits not matching ram_size, install the rows mirror */
-        hwaddr row_mirror = s->ram_addr + ((1 << (row_bits_actual +
-                                                  bank_bits)) * page_size);
+        hwaddr row_mirror = s->ram_addr + ((1UL << (row_bits_actual +
+                                                    bank_bits)) * page_size);
 
         memory_region_set_enabled(&s->row_mirror_alias, true);
         memory_region_set_address(&s->row_mirror_alias, row_mirror);
-- 
2.17.1

