Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp70387lfp;
        Wed, 13 Jul 2022 00:59:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uBLlpEPThUKvRoPkcWboKsYznHqja7bImuWWMlyGkcw31nfWRgEGx7UYo/Ltf/IA1wgQI/
X-Received: by 2002:a05:620a:e06:b0:6a7:316a:33f1 with SMTP id y6-20020a05620a0e0600b006a7316a33f1mr1496035qkm.52.1657699161888;
        Wed, 13 Jul 2022 00:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657699161; cv=none;
        d=google.com; s=arc-20160816;
        b=c1wJnU2IzIV1MxPzzIXTg3QdkOI+Hlg742QHN+WnQC96YCXUifdCdx8shMxbjsM4vb
         Viecx+UquWdttMoDG95LKbeZQvRqxdSyAdo3uICOcR23tIwFt20hGNWr+0BAJqfcCo1v
         E6HTGxGC6A2fPNWeMK+Ua+SD06lqkMOPWkqttR9SfCa6+zY0MHwl2apU/6ddrBLPhrMy
         gvNtzrTvo1n/tf396Xn9LDnDsmf+EY72mFILtYiTg/2WeYStnqMgil2Bbf+F77f+zIyr
         p3NLqepL1OCDqvkAgm8c9ge3U49WtdOhxVrw0Zd9lRJ2YX1pMsWhWfOBdHixHjm6C8pE
         7vZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=FKhn5WcWMhDkPeyAyv1ODaumKdA3KDOj94yvkfzh1I4=;
        b=LfVqrXfxdiJnT452k0pnrTmOj5EvZG0KUeWlEV2581b4qMnmfxWqxuv/w9X1nUHQm2
         uZ7yBbGTqKPXlKmp/hiAsTYv1OLEism+JcF9ZH1T0MeHVs71n1FQ5TxXZiRONllgAhxU
         ekqF099ytGFJinvrqLJgcXtmafuFFjJdlX+Jhnwr0mH4prHx5KCr3XUigZHPbN/otquP
         4SO5a3v1P0toXgDJKJx2Gs9+DaSWdSMI3UEEsCu6yuzNqkxnQK4e4jOwXI2L8praEV3O
         Vd8/bri3qTNyPPydPUMapIFwDXUULGgGDWxr7kXTHQiTJo5PvODh4BK0nUfTQvuXJCKB
         MQjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd6-20020a056214400600b0046e495730bfsi7342159qvb.127.2022.07.13.00.59.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 00:59:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBXHF-00065C-Be
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 03:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBn-00087D-RR; Wed, 13 Jul 2022 03:53:43 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:36009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBj-0002aa-SN; Wed, 13 Jul 2022 03:53:43 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LjVHP0W0pz4ySZ;
 Wed, 13 Jul 2022 17:53:37 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LjVHL5Fzfz4ySW;
 Wed, 13 Jul 2022 17:53:34 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 12/19] docs: aspeed: Add fby35 multi-SoC machine section
Date: Wed, 13 Jul 2022 09:52:48 +0200
Message-Id: <20220713075255.2248923-13-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713075255.2248923-1-clg@kaod.org>
References: <20220713075255.2248923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=zHgX=XS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B37mO5Si2X2I

From: Peter Delevoryas <peter@pjd.dev>

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
[ clg: - fixed URL links
       - Moved Facebook Yosemite section at the end of the file ]
Message-Id: <20220705191400.41632-10-peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 5d0a7865d3a6..445095690c04 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -182,3 +182,51 @@ To boot a kernel directly from a Zephyr build tree:
 
   $ qemu-system-arm -M ast1030-evb -nographic \
         -kernel zephyr.elf
+
+Facebook Yosemite v3.5 Platform and CraterLake Server (``fby35``)
+==================================================================
+
+Facebook has a series of multi-node compute server designs named
+Yosemite. The most recent version released was
+`Yosemite v3 <https://www.opencompute.org/documents/ocp-yosemite-v3-platform-design-specification-1v16-pdf>`__.
+
+Yosemite v3.5 is an iteration on this design, and is very similar: there's a
+baseboard with a BMC, and 4 server slots. The new server board design termed
+"CraterLake" includes a Bridge IC (BIC), with room for expansion boards to
+include various compute accelerators (video, inferencing, etc). At the moment,
+only the first server slot's BIC is included.
+
+Yosemite v3.5 is itself a sled which fits into a 40U chassis, and 3 sleds
+can be fit into a chassis. See `here <https://www.opencompute.org/products/423/wiwynn-yosemite-v3-server>`__
+for an example.
+
+In this generation, the BMC is an AST2600 and each BIC is an AST1030. The BMC
+runs `OpenBMC <https://github.com/facebook/openbmc>`__, and the BIC runs
+`OpenBIC <https://github.com/facebook/openbic>`__.
+
+Firmware images can be retrieved from the Github releases or built from the
+source code, see the README's for instructions on that. This image uses the
+"fby35" machine recipe from OpenBMC, and the "yv35-cl" target from OpenBIC.
+Some reference images can also be found here:
+
+.. code-block:: bash
+
+    $ wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
+    $ wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.13.01/Y35BCL.elf
+
+Since this machine has multiple SoC's, each with their own serial console, the
+recommended way to run it is to allocate a pseudoterminal for each serial
+console and let the monitor use stdio. Also, starting in a paused state is
+useful because it allows you to attach to the pseudoterminals before the boot
+process starts.
+
+.. code-block:: bash
+
+    $ qemu-system-arm -machine fby35 \
+        -drive file=fby35.mtd,format=raw,if=mtd \
+        -device loader,file=Y35BCL.elf,addr=0,cpu-num=2 \
+        -serial pty -serial pty -serial mon:stdio \
+        -display none -S
+    $ screen /dev/tty0 # In a separate TMUX pane, terminal window, etc.
+    $ screen /dev/tty1
+    $ (qemu) c		   # Start the boot process once screen is setup.
-- 
2.35.3

