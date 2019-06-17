Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2680043wrg;
        Mon, 17 Jun 2019 09:14:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx/aWTa1G7C3DbNNf2KUqe99AyPSYtdTJ0ZVNtjokE1kOPPFWS1rprj29rx3txEX7noJuc7
X-Received: by 2002:a50:9822:: with SMTP id g31mr90658861edb.175.1560788073762;
        Mon, 17 Jun 2019 09:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560788073; cv=none;
        d=google.com; s=arc-20160816;
        b=etZGhfg0g6dMtGVsle0yMWCXvVsfPgjIOb6Y+W2QTKNcOjoGE+dH9wyvcnelCyvtp5
         /jhK2tyX2inwYKbF8UXWri35+n3XS0UldS4ZpSgMPKHnRH204aJ4eV1oBXyWfgVI19Qp
         j6UTujrcnsNiUp/405CoqKuwKQ4It5nb8CNZxqBSLOWwr0D7WhnFAb14WNLPVnObO9vU
         6G7YFwawgVFh3aMqBthOUvbe//joz5h33wcYWN+fpnnuPKxDH5EaiwWbJPnkoNMG+bng
         wtTxvulSUSV89sOmIqlh2DGZ/IOoqdQbilhOy/5h2uoyHvLWuItebRixWm2k0jYTsdfo
         3gIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=GBKRxJrHCawiQUYyR7sgJjC2fNXOZCCtdwiyy0fAiko=;
        b=pWInwdK/F2Zj2fI4wl7bW7vUU9hBMhOnLDu4Zule1AdXYo+7SupYnz0/JXlBxvwcWC
         3uz23vXeSBtiAr9D46HqiPaFfEwAjV69CSIbRwSzFuz9h5iu+T7vb5ruCYJjOluWUaIq
         uDyEuFZ2C+TGNRM7gEVN1Rm/V7oF1RVXOg/tUgqePq2kZKpBZ/jYj6de+MkBJyAE6iru
         6z0/mhGiUwrS9kBacBCesgsHxgCvB189zoGQFCDriBk9ysh3L4dvjdnQXqbYCatquO2O
         hm0uc2CYGriDe+ygclU2yj0F8ZT2k3sLhoE92oi8eA2pABeyaC8F27zaidfyNLV8rUeC
         V1WA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bVN4s7HR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1si7309270eja.95.2019.06.17.09.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 09:14:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bVN4s7HR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcuHA-0007Va-RY
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 12:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44047)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hcu4d-0004Ss-75
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:01:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hcu4c-0005xM-6Z
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:01:35 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38424)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hcu4b-0005vV-Uk
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:01:34 -0400
Received: by mail-wm1-x342.google.com with SMTP id s15so9712757wmj.3
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GBKRxJrHCawiQUYyR7sgJjC2fNXOZCCtdwiyy0fAiko=;
 b=bVN4s7HRjge84dc4IGG81AnrfbHosBSh5+BGZvbLhXtnNkUUqpeSXEz/nCFCpUym8w
 x6QQqHGIwE8bMA0LDwhK89Hzleac0QNTwN/aUx4hT+DB0LjlGJdOrPppvT1rOyuhvRRc
 tNmv5gmtAtLApxER4Wwr/4CPJWKd6dssPK9g0TBj97Uwk7Da4FXTfxhKidqlQlUrVEfZ
 8z8eE0gI1IAyyQHZYCEBwjwXOvLJm17ByOpo7MWrmm72bI/n8BjuzZR2pEU6kW7PQCkG
 1jlO2K9IcZ4HyYrkOUTTiBwK5fv3RHFzGhexhC/0pADG1iU7kHNlDZDVy67jPpR8vTF8
 J1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GBKRxJrHCawiQUYyR7sgJjC2fNXOZCCtdwiyy0fAiko=;
 b=iQAoH5bkGG9ZNdqFglMstm1qwIPdsaiUOxjmLkZ0nDuQf6HjFNkUQofYoLoELHGD2j
 eYerVdlEoePMntYBo6/aShHWQW+qd3Xw09IztCnA50tN8hGhsVoAAWyFPxXNY0Cea5Sg
 vRi1U2Ga8LuJoK8agOzbH4KrrvKM1xtRwQm1Ww2ebD0HdbMcxHkVdS6W6HwvachJFwvo
 pMVvafPmWkyOg9gLqm0KMkTZNcuCpi6M79qKxcLnsfxRc9tRGJoMCylhZEZG5ImleInF
 xpp3/ePvW9B4/OPHhw3rY77KiLSODFmEDojy9k4XAvxCcmzvwC6hdAaG5zeQ45VKHN91
 5T7A==
X-Gm-Message-State: APjAAAWZHWhQNDlGP5D+RW0bbrl2ShIKJg4nj8gnJA3LjMcWWrK/fXKj
 iPz1aiudYjyEQRaTVthePvNoFQ==
X-Received: by 2002:a1c:cc0d:: with SMTP id h13mr18971384wmb.119.1560787292656; 
 Mon, 17 Jun 2019 09:01:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x11sm15545416wmg.23.2019.06.17.09.01.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 09:01:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 17:01:30 +0100
Message-Id: <20190617160130.3207-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH] target/arm: Check for dp support for dp VFM,
 not sp
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XWWUEug6ZgM5

In commit 1120827fa182f0e7622 we accidentally put the
"UNDEF unless FPU has double-precision support" check in
the single-precision VFM function. Put it in the dp
function where it belongs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I just merged the pullreq with 1120827fa182f0e7622 an hour
ago and then I spotted this bug in it...

 target/arm/translate-vfp.inc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 348173d6026..deaddb04421 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1771,10 +1771,6 @@ static bool trans_VFM_sp(DisasContext *s, arg_VFM_sp *a)
         return false;
     }
 
-    if (!dc_isar_feature(aa32_fpdp, s)) {
-        return false;
-    }
-
     if (!vfp_access_check(s)) {
         return true;
     }
@@ -1838,6 +1834,10 @@ static bool trans_VFM_dp(DisasContext *s, arg_VFM_dp *a)
         return false;
     }
 
+    if (!dc_isar_feature(aa32_fpdp, s)) {
+        return false;
+    }
+
     if (!vfp_access_check(s)) {
         return true;
     }
-- 
2.20.1

