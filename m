Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2699722wrp;
        Fri, 20 Sep 2019 10:41:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxTAGuUgx3in4YKu0HZrE/K9Hf8UiS+FzblGCidzyrF8OGfV4fJVMY68NJHVkD03iG6qYUy
X-Received: by 2002:a17:906:19d9:: with SMTP id h25mr20180983ejd.43.1569001267628;
        Fri, 20 Sep 2019 10:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569001267; cv=none;
        d=google.com; s=arc-20160816;
        b=xz+wcILnias32MUwIr15YOMx0LTZVvbJpcrMaYo48kK2rkkp+cArwkY4e5m6o+akFG
         PXKNzpfvp0JRvILmpj7syerH7u6MUzwCMADDbqmUxSi/e6ouhQG3kWS3ulb0RtYRZT9K
         1DQNszsMJA5d6TYDUrWBdW5GvjyRq7XKmolQqS/FqTFzdVo/5rTA9HPkdloZb9hQ+vyj
         L9q/nrd8bIKQQkGvDS8QdLm5cJThtGsXwjdzD3eYQHMaxnTyAIKk2Nqieyg9ifkOLvXc
         cEEFVVwpmjKV7D9N4/J0BtIBeqVp43bF0fWBN4n0sUtzRbkqC6vPx336l9eERbeFNyNP
         EqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=pd1d+il4V+KkThmMTERSYGXdeHgQGOjSI8wZb/+55zM=;
        b=mHBQHMk23n68/3WpwybzEqtoMDBAH5/JjU9s38FAiMovNiEju8UlcFUDt2JdijvmLm
         XfVd3J4hs7AInz7fa6FvcVi8KSkpgFzOZ+OKT8riaLDrNyfIbb0YT1Ktaga4ZNONatHu
         x2Orkf5mx+mZDQR29/eD77A4UC9N6UDErz25N05vXbpZQ1N2dUNy9GtXy+RXZG9zUVrV
         +5wuEkZcy3xDLj8VSNYwoPHOI4KPSIp/hgd6P8FEh0+Mlls9blmovkpSavsBEAB5GUh8
         8ATVSqbK1n7H2LNri3EedZzZ0X+kdPCYxypc7txipBqUdhKwDAKafYt+mLIAUMBBvKXJ
         PAAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dZAYsfq3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si1642619edm.407.2019.09.20.10.41.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2019 10:41:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dZAYsfq3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBMu2-0006T0-Kx
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 13:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iBMtg-0006Q8-I0
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 13:40:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iBMtf-00008F-1p
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 13:40:44 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44386)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iBMte-00007r-Sm
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 13:40:43 -0400
Received: by mail-wr1-x441.google.com with SMTP id i18so7571727wru.11
 for <qemu-arm@nongnu.org>; Fri, 20 Sep 2019 10:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pd1d+il4V+KkThmMTERSYGXdeHgQGOjSI8wZb/+55zM=;
 b=dZAYsfq3BnTXrhPNXwWj5FbwPIBkonMcemnzkmg4/rgJAoO630LTjjjv3kwwa2qH51
 suIC05jyge/GygtOfpnFLSikuGu5SbOERB5N2DFSkkRXNHrAhVM9t6dAlYyg7wtl4Ogh
 y7MkRvoNK3aeDK7E5bftNOV/UmlBoWAauKelqK3lwf93q+bClN0g0PH7A7hb5ugC3lhh
 yMfqw4JPUtfSqBCsEUkNGwuNbHzO8+C0HyNckz6sLhacbYzoLikm9t5dWoHOt/uYgw2g
 cdBkibvaM8E3VWfUBQybbtlNYLnE21+a9BpPI8Mt/hGDCMrBEC6K46kSy/X3YAj0YKHw
 M2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pd1d+il4V+KkThmMTERSYGXdeHgQGOjSI8wZb/+55zM=;
 b=ZXQUd8Xhnpv8OsixSiqEp0jSkI5zoYiypfRrJ/7soxe6N3ryge+TzCxMLtLZrtGuXg
 U3RdcRXrRK6EV5OFtmVWe7fxoCfnVBzDMPqIIulaYHygEUL/lCKYcAXsUwkLWH8oPxL6
 yktJZCGbYyLAw7cDSPmD85v91Sv48g3dBaOlxe69uELA/tqfJXaLXhMDlUpVydeuUzRc
 arGm5qDq3dOAB4sK7Vw/Wbd3K6ha36wdlX/T4G4pmI0p5UTur9ecKu7OGDfaPml8YHp7
 muZXy5wBlP7iJKkJHj3mcaJq5D3Qqo6dC8jIXH7/dU8PuvDtl4A8FXF5Fw2SUkMhGQMv
 Grzw==
X-Gm-Message-State: APjAAAVkG2eyaMSG26kg/5idz2/mJGlTlObUQg3gyd1Due/U6kWsF6Xw
 hDnm8qMuGMmty2a9LG+8RX6vCGsdGDpfqQ==
X-Received: by 2002:adf:a350:: with SMTP id d16mr12503364wrb.326.1569001241540; 
 Fri, 20 Sep 2019 10:40:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b144sm2710547wmb.3.2019.09.20.10.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 10:40:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/boot.c: Set NSACR.{CP11,CP10} for NS kernel boots
Date: Fri, 20 Sep 2019 18:40:39 +0100
Message-Id: <20190920174039.3916-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yGpCsO/4UuN2

If we're booting a Linux kernel directly into Non-Secure
state on a CPU which has Secure state, then make sure we
set the NSACR CP11 and CP10 bits, so that Non-Secure is allowed
to access the FPU. Otherwise an AArch32 kernel will UNDEF as
soon as it tries to use the FPU.

It used to not matter that we didn't do this until commit
fc1120a7f5f2d4b6, where we implemented actually honouring
these NSACR bits.

The problem only exists for CPUs where EL3 is AArch32; the
equivalent AArch64 trap bits are in CPTR_EL3 and are "0 to
not trap, 1 to trap", so the reset value of the register
permits NS access, unlike NSACR.

Fixes: fc1120a7f5
Fixes: https://bugs.launchpad.net/qemu/+bug/1844597
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index bf97ef3e339..25422660545 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -754,6 +754,8 @@ static void do_cpu_reset(void *opaque)
                     (cs != first_cpu || !info->secure_board_setup)) {
                     /* Linux expects non-secure state */
                     env->cp15.scr_el3 |= SCR_NS;
+                    /* Set NSACR.{CP11,CP10} so NS can access the FPU */
+                    env->cp15.nsacr |= 3 << 10;
                 }
             }
 
-- 
2.20.1

