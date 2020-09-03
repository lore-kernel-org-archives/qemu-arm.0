Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp849452lfc;
        Thu, 3 Sep 2020 13:23:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLN7aoXYyvs2+kv01RKHgzvY5dHHKE/DrPWYcDCGkPVYA6qgJH0h2n0eLnktYH2/CTuiUO
X-Received: by 2002:a25:b611:: with SMTP id r17mr3706469ybj.54.1599164592465;
        Thu, 03 Sep 2020 13:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599164592; cv=none;
        d=google.com; s=arc-20160816;
        b=iDyeYAlGA0mRvKv3Mi7YNuas12y9U67mcXwNNvCGRO2EJp2it6a0+c4X4bpeXlTnsI
         ohgI50qGxWlddpwg0lbxVqcqxuJ6mFJOUHHX84RjxK4ERZnfxrVywMIhTdfg/n5xKkql
         Ekn8TzBSffm5kIaN+W3jZwXuCkdTx9xCrijqTXrQyffP48kc4rYti2LPUpi/Z4PNE+Ek
         I+EPQFG7YCMIJ9i+eOIeLtr1rDrGju8m3QDMYNk0Kbf4Izdkc+h2iP/siMRmOQyQ3vQ6
         bwzKUzPap8ClRx3x6XEiYY2Dqg+q6++Gij0535eNazEgryGEWBgmBbumTKKqyh5yGpo+
         NsuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cAXCKGC6VbvlDmQ7gtrKURJrxX8tvf9unlVaP2aE39c=;
        b=lK20yfGPlGN6EH3/K22DGPjl2CQmkwx/ORfe3GZKyxcr33eEVloQAfo4FANYE7k1H+
         SZDZuLPhTEXcHjBSnaj8A9nGLmUD2NdWoWbelaqd8C9omEHoFOLtGXTqmyHk7Yk5IMzB
         McQANCOkZqarJcx+wmd9jwH7b/wzLs+40VlBE6hOL3bPRfz1mw3tjtLHW2TfmtdG8Z8Z
         1zWKUBm+49QPkVswKtrx+EmN66rFnpsrmvUyl5exn64qBIIBrBBj/+IVRcTjfZnaH3cy
         uAQE0cJK7tagnWGhqqTcf0uSOn4GzN1XArCdDGJYeAVpTLXQUVCSixlTGO0uoOpp67xU
         IGkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="pw6ju/X3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si3807332ybp.156.2020.09.03.13.23.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 13:23:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="pw6ju/X3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDvlH-0000lM-TW
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 16:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDvj8-0006Ec-3x
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 16:20:58 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDvj6-00085M-E5
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 16:20:57 -0400
Received: by mail-wr1-x441.google.com with SMTP id c15so4508734wrs.11
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 13:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cAXCKGC6VbvlDmQ7gtrKURJrxX8tvf9unlVaP2aE39c=;
 b=pw6ju/X3lBFbTFamqIZYwJnw6UGjyzawXYbBlpmmrV8aNUHdz9LHdf5N0cvyHIAvOw
 MwTtdkO42RuTV51u0RH3IeCPiMU8ijrOUIpjKXG0LXcf4uHZjpGwvoHgZcf3sQBlX4Jj
 /lUvTm2+lw4OJXeEdO2itLDNLjyQ7dalndm4e4+q5PmqjrIk2BS0kudPm4di/qmxRJEg
 9kcJpZV68k1sWzX0GFvUK3zT8w5RN+H56R+C1KYORnOtOSmGyRf+N95F6ZXyP7KVJLku
 E4J8F/bk9t235GZcJMwRjx1q88oiTfsj8tY3yH9xm9YJzxrUeNEFb9HktSfU1/S8RzsS
 Ri6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cAXCKGC6VbvlDmQ7gtrKURJrxX8tvf9unlVaP2aE39c=;
 b=kNP6/vP5W47E5S5JlvPYpZwI3ZW5lUxcSx3URVLz0AluFy4alIrgsIG9lxuS8H5d7J
 +N5K7v5aEcNbLuqaiqVdLVK9RFfwYyKihrA4tOWShZjA+tl3qInleBs/gYyV+luVW/z1
 9huZhKIxdneWKouijARH7rWiBNRjaNYartRNY5YE+2sPznYCUQf3qO4hCVAeUX/N5eYB
 c43oMuV5N3UYt4hpc9UwY0fN6YTnJ1e9A3nWW/XSrqTxhiWmZFNVrcDC82CLPNOlJBkX
 Gsgv2toFfyuw7+AH6BJzMu3D1qTxGlHYcR8fuzVixlCtYxf/urVE6nFpmnoNX1dm2VFe
 tHjQ==
X-Gm-Message-State: AOAM533/gKvueNLR4POQa6ZUY8bKbXGu5ZFWT972d4isly4RFwJzLIdR
 Gqj6BmPwM+YaGEE0YsGkQ6zBuVAB/PkQADDM
X-Received: by 2002:adf:8187:: with SMTP id 7mr4243412wra.266.1599164454877;
 Thu, 03 Sep 2020 13:20:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p14sm7285023wrg.96.2020.09.03.13.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:20:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] docs/system/arm/mps2.rst: Make board list consistent
Date: Thu,  3 Sep 2020 21:20:48 +0100
Message-Id: <20200903202048.15370-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903202048.15370-1-peter.maydell@linaro.org>
References: <20200903202048.15370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: emajDtv7UYQO

Make the list of MPS2 boards consistent in the phrasing of each
entry, use the correct casing of "Arm", and move the mps2-an511
entry so the list is in numeric order.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/mps2.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/system/arm/mps2.rst b/docs/system/arm/mps2.rst
index 7f2e9c8d52e..8c5b5f1fe07 100644
--- a/docs/system/arm/mps2.rst
+++ b/docs/system/arm/mps2.rst
@@ -11,17 +11,17 @@ as seen by the guest depend significantly on the FPGA image.
 QEMU models the following FPGA images:
 
 ``mps2-an385``
-  Cortex-M3 as documented in ARM Application Note AN385
+  Cortex-M3 as documented in Arm Application Note AN385
 ``mps2-an386``
-  Cortex-M4 as documented in ARM Application Note AN386
+  Cortex-M4 as documented in Arm Application Note AN386
 ``mps2-an500``
-  Cortex-M7 as documented in ARM Application Note AN500
-``mps2-an511``
-  Cortex-M3 'DesignStart' as documented in AN511
+  Cortex-M7 as documented in Arm Application Note AN500
 ``mps2-an505``
-  Cortex-M33 as documented in ARM Application Note AN505
+  Cortex-M33 as documented in Arm Application Note AN505
+``mps2-an511``
+  Cortex-M3 'DesignStart' as documented in Arm Application Note AN511
 ``mps2-an521``
-  Dual Cortex-M33 as documented in Application Note AN521
+  Dual Cortex-M33 as documented in Arm Application Note AN521
 
 Differences between QEMU and real hardware:
 
-- 
2.20.1

