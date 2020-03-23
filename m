Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1843676lfi;
        Mon, 23 Mar 2020 12:30:16 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvYBXDjxfz9n7pzOn/sKJbKglwabPxWUUJWSi+vI8xy9ufcC/Jme2HpzfYkYnFY7gtaxEhd
X-Received: by 2002:a37:a6c1:: with SMTP id p184mr22248702qke.338.1584991815274;
        Mon, 23 Mar 2020 12:30:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584991815; cv=none;
        d=google.com; s=arc-20160816;
        b=D5V9i/PlEF2tYwW9cuZKg/9euyZYtzLizSsk/7TrUTaU7mzC3NAvhkbtJlGxj0v4k2
         Hi3TF04sSSWTWXBf5sFFrJPeqZXxEWkfzSuG44obdHoD/TGNMfIHE4YOG8y+YHtbm/jR
         Ot2KxWRgfQynxnaxgGoJ9R+DGZWfdPf/XBIX42GwjKvu008aurydM+9Jcx+m4ik2o5K+
         VfL9xDkaollmYhwGIvitf+jCA30WAQV+AjUGN3YRGUBNAxhhBXHsz9Ti439Qs2VlgTNv
         AdiZKgS/ILasGDlbhcaqM0oPgWnjsjwaQw0GenCXSggY2UGce3po3fF2fmfATm6dt8RX
         Hz6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=aFZT4+DtltuOgjmsXEVbjJcqCfMa/s86Y31iza4rRjo=;
        b=KpYTT59pzt4s3jJWy5szNd6eDCTkT616RFpcjqizRtt+BLh2aQEB36yuLoKukCp5xf
         FX777n4sVHVCdjdQ3ev0z6O9aEPDfa4hvcrkp2I0ggTkl3OXXmwPQJD6J9Ut/NfXMm6k
         NQtARyTxs1GgvNv2nZmD+z5P8BO1A2sv8RSGJR+RF9N8rfTeDPhl7ed4TgmBAvKiu5O+
         Rob0kaJeBf6B4mcHdkG9ifzuhbIu/fAC1+h90lWEj6rGAGkP42YbN0nA+05gqr5nX4ow
         hBDjL+2AhINGS1D6hqvOn30pgMztuNSLVyRJ36kaVBLqIahHNgeaKWrhqdc4QT8bZ9Jj
         j6fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sIkl9Yjj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f33si9525919qtk.260.2020.03.23.12.30.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 12:30:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sIkl9Yjj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGSm6-0001AB-JW
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 15:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1jGSls-00018c-1Q
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 15:30:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1jGSlr-0004u1-2X
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 15:29:59 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40706)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1jGSlo-0004sS-9E; Mon, 23 Mar 2020 15:29:56 -0400
Received: by mail-wm1-x344.google.com with SMTP id a81so762478wmf.5;
 Mon, 23 Mar 2020 12:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=aFZT4+DtltuOgjmsXEVbjJcqCfMa/s86Y31iza4rRjo=;
 b=sIkl9Yjj27jEs30EH2dKNvFFiFedWHffVOg9iqD+7BfQvIrHWDLGplk+DlXjDImCuH
 GoDdleHXHB6JiTU3A+BMRECUEcXODMjclI5Yt0vQ+4ebcj6ByVXSsl6YEKA/rN44ZihC
 X1hsZRzov7SE++VeWh6SKkKKwyK88Ihx6kzZw2knNOxJsM7cSYNc04YY+2h58R2s2/i5
 owWeEenzw+pp49W0D11VdOIyZPwPj+aOme8P/DFfGSZL2F6y2KF1EAYVhHQwSt3txhh7
 WW8SVo0NrMysLmQhVfNkAR1gOPdTRZ1MJShKjUw4AdB/fOaFwcLfEtQKhRWOOAdW0RaE
 Oo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=aFZT4+DtltuOgjmsXEVbjJcqCfMa/s86Y31iza4rRjo=;
 b=r+AE9+OCXv8xup7T4tzVRehtdOSvEDXTQywWbq4pd4bD1jHDVwnFm1eTgqj1cUSMaF
 jdH4yN3H4qFP/pWN6XVpArmInjbfvy0fT2DmuIfHpJZsxlzKfA/XyhY2dc17SCNyaw+E
 z7Ki7e5O1Ii9/Qa6ez0qCZ8HB+BfM/bP9YCslPOaALn+oBi3YJeSVGq83Yyf9TbBBijy
 x/aLNR2G402Sq2+0qmD5jaaJ698duREdAyzDBvd509gqa2VWwnBgRJctBuEM7EBfTnz6
 tU+lHX6EByJGmuW2Z6JRptUCk689bCTjyT9PvqPMfjpQDGmfASCvSmQcgxky8rJ6PW5w
 +V0g==
X-Gm-Message-State: ANhLgQ3aJZN3ug1Iqrn7o0qhYWVqaDa+ams7z3SxcbOKD5Hgb+iAiogf
 gXxAzMYDT++W811UB2hOqszlR3cs
X-Received: by 2002:a1c:ba06:: with SMTP id k6mr977978wmf.136.1584991793474;
 Mon, 23 Mar 2020 12:29:53 -0700 (PDT)
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
 by smtp.gmail.com with ESMTPSA id t124sm769364wmg.13.2020.03.23.12.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 12:29:52 -0700 (PDT)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/misc/allwinner-h3-dramc: enforce 64-bit multiply when
 calculating row mirror address
Date: Mon, 23 Mar 2020 20:29:44 +0100
Message-Id: <20200323192944.5967-1-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: peter.maydell@linaro.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jFCsIpiIcluw

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
index 2b5260260e..1d37cf422c 100644
--- a/hw/misc/allwinner-h3-dramc.c
+++ b/hw/misc/allwinner-h3-dramc.c
@@ -85,8 +85,8 @@ static void allwinner_h3_dramc_map_rows(AwH3DramCtlState *s, uint8_t row_bits,
 
     } else if (row_bits_actual) {
         /* Row bits not matching ram_size, install the rows mirror */
-        hwaddr row_mirror = s->ram_addr + ((1 << (row_bits_actual +
-                                                  bank_bits)) * page_size);
+        hwaddr row_mirror = s->ram_addr + ((1ULL << (row_bits_actual +
+                                                     bank_bits)) * page_size);
 
         memory_region_set_enabled(&s->row_mirror_alias, true);
         memory_region_set_address(&s->row_mirror_alias, row_mirror);
-- 
2.17.1

