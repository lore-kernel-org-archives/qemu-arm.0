Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5565692lfc;
        Mon, 15 Feb 2021 04:11:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyY0EdC/BXHLdRuJQRnzB4TaASU0AOi9RSY7AZXVL+IsJs2DumhMgbz/44hHylToOfK7UaW
X-Received: by 2002:a25:80c9:: with SMTP id c9mr22749743ybm.279.1613391087555;
        Mon, 15 Feb 2021 04:11:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613391087; cv=none;
        d=google.com; s=arc-20160816;
        b=pmvvhbOJs9f8bW+ght33bMgt0UNGAxW7s/dqFcv6DV+UiJS+dEq2FsGek90YKbwVnm
         2D0KNqfLFiCxnPXIpUz/l6Yk1AmTGQzxS+iECC9a0+zBVqIv0radETkmHFmaS1SahRGL
         sFvcPisQIJei88FL+JhAa7OTeoT2CwS+KuApaNvsfuVjsX15xm/PRwlv7dPQ8ofkQfjs
         eOFxdyb9Tj/RtfUl7rTsiwvYi6bhYVMd+JYRFcytzq+jqgvYn5AQ83h7VLukZNNAHHb2
         qsYV84+ZAbhaW+r3G3FM/BZ1UZcnhSSZ9L1Qpcz98flwSAUGSdrxijv7xNOqpWxDe5hH
         PSiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1tcAjs6Tc8qQsl3E9FrIN+atfmeW4XdFPz3i2ahNQZg=;
        b=E1lVvmmf67w5efJWdPQfhzMiYmgfUgu0oGcvsApyDjXjO35wrCh10ImXiawGKT36vQ
         8ixjGltAZjCyQnaN4dJUiTefXo6s6BSfhH2z/Zy2lbCxti13nvqCzZZdiajwSJNFsFka
         i25Xo0Ksr14/LRTTVpdTgiDE99peUCxcnNKyJ/U8iEvkjrfOTCKA2Yts9RLlFSWIDp49
         /WON10i2qfqJsfoyKg1SpV6cPqgcejk28h/9U3aC5WEZyxTjaQUvN8HovNC0/3KmU9IQ
         I+U0kjxpsGMsiZiQJyy0by6e46SwGMRTCAYC1kvkuX8RGQl3sLC2hIH1xQYYbM3fNWRG
         W5ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EijJPzjF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c204si18066001ybb.115.2021.02.15.04.11.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 04:11:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EijJPzjF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBcis-0006Kg-S1
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 07:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcRH-0000Oi-PQ
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:53:17 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcRB-0004KL-Oj
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:53:15 -0500
Received: by mail-wm1-x32b.google.com with SMTP id j11so5953765wmi.3
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 03:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1tcAjs6Tc8qQsl3E9FrIN+atfmeW4XdFPz3i2ahNQZg=;
 b=EijJPzjFJs3G562lgGFUbRqLtDIgX/B2FFRNo9gsEc2aX9sgq/wltrNr1gnm1H5/DJ
 rhGWSMnWLp9YQEJ7QC8F9rc2ReBwkN+hDcRbldmhn4v+t+01IJmpsmgrKaoB+1d0yh51
 sUkcexnwDdWDclH0vM/LdBUAOARUBi83hbok4Uuj8B3QNr2NQXZ0b/I69QLdaTNd2Mfa
 T9dWDA4bA+UNzbkKpVSaBqyVMOOyaA3qOS85606Hqd+ODI0OX3Cb2+BPTAhDEyaUy7s7
 bFO8Q+j6aHbtc41UAMS9ndTac2TtwmxKcn4eN6r3FRrpXT6rKQNAihZj9tLfNVJSW+iz
 9IIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1tcAjs6Tc8qQsl3E9FrIN+atfmeW4XdFPz3i2ahNQZg=;
 b=S2qsLEr3/qkZl7VuhCqrhgfVZ6JrNICfDOyXXoU2NVCLTs6hIG/FSMdhPreskJsOMI
 V9eA7comdCAZbikZ4PRVz10kbPOt0P8fc6sYcEgu0vYCjKSdzV3m1IQRztIIGoAtviiA
 VM24j+MYXaxSitLwXcZPmltUbab6wWEmYqycWQPuG2B3ZUaQgLjpwdbilF/e9t7spCui
 DXOjKNHiyQwhB8VhHGrjBfNfe+rQYjqbU0rmmDkTT6Js3fqd0hsJQf5C9HkRMFwNiBjC
 9z5L2WxlJJGZYlU76/71Ah43opYTPgSmiZlid67QlZlx7hKmnyL/0eOzhS9cViYmgIpU
 MZnQ==
X-Gm-Message-State: AOAM533ZAed4H6lb8HKQY1jYcKVD6rVwH8UZwTu9JB8v+fpTMt8L/5UR
 0lMyMkPEJnQHLGlV9GgCYoVrNOuYVswlUQ==
X-Received: by 2002:a7b:cbc2:: with SMTP id n2mr13800559wmi.34.1613389988575; 
 Mon, 15 Feb 2021 03:53:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:53:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 23/24] docs/system/arm/mps2.rst: Document the new
 mps3-an524 board
Date: Mon, 15 Feb 2021 11:51:37 +0000
Message-Id: <20210215115138.20465-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XDRoI5OVX2Zw

Add brief documentation of the new mps3-an524 board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/system/arm/mps2.rst | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/docs/system/arm/mps2.rst b/docs/system/arm/mps2.rst
index 8c5b5f1fe07..601ccea15cb 100644
--- a/docs/system/arm/mps2.rst
+++ b/docs/system/arm/mps2.rst
@@ -1,12 +1,15 @@
-Arm MPS2 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``)
-================================================================================================================
+Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``)
+=========================================================================================================================================
 
 These board models all use Arm M-profile CPUs.
 
-The Arm MPS2 and MPS2+ dev boards are FPGA based (the 2+ has a bigger
-FPGA but is otherwise the same as the 2). Since the CPU itself
-and most of the devices are in the FPGA, the details of the board
-as seen by the guest depend significantly on the FPGA image.
+The Arm MPS2, MPS2+ and MPS3 dev boards are FPGA based (the 2+ has a
+bigger FPGA but is otherwise the same as the 2; the 3 has a bigger
+FPGA again, can handle 4GB of RAM and has a USB controller and QSPI flash).
+
+Since the CPU itself and most of the devices are in the FPGA, the
+details of the board as seen by the guest depend significantly on the
+FPGA image.
 
 QEMU models the following FPGA images:
 
@@ -22,12 +25,21 @@ QEMU models the following FPGA images:
   Cortex-M3 'DesignStart' as documented in Arm Application Note AN511
 ``mps2-an521``
   Dual Cortex-M33 as documented in Arm Application Note AN521
+``mps3-an524``
+  Dual Cortex-M33 on an MPS3, as documented in Arm Application Note AN524
 
 Differences between QEMU and real hardware:
 
 - AN385/AN386 remapping of low 16K of memory to either ZBT SSRAM1 or to
   block RAM is unimplemented (QEMU always maps this to ZBT SSRAM1, as
   if zbt_boot_ctrl is always zero)
+- AN524 remapping of low memory to either BRAM or to QSPI flash is
+  unimplemented (QEMU always maps this to BRAM, ignoring the
+  SCC CFG_REG0 memory-remap bit)
 - QEMU provides a LAN9118 ethernet rather than LAN9220; the only guest
   visible difference is that the LAN9118 doesn't support checksum
   offloading
+- QEMU does not model the QSPI flash in MPS3 boards as real QSPI
+  flash, but only as simple ROM, so attempting to rewrite the flash
+  from the guest will fail
+- QEMU does not model the USB controller in MPS3 boards
-- 
2.20.1

