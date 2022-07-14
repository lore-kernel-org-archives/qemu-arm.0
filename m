Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp728624lfp;
        Thu, 14 Jul 2022 08:49:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vDS+btSxhgY6EqJCaU9TmKWH5zpHUzYqNtkuOQmr692UdOjwXLG+swDnWu1T1ZxIlUp0bh
X-Received: by 2002:a05:622a:1206:b0:31e:cd42:3ebb with SMTP id y6-20020a05622a120600b0031ecd423ebbmr7293040qtx.160.1657813772498;
        Thu, 14 Jul 2022 08:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657813772; cv=none;
        d=google.com; s=arc-20160816;
        b=T7oN1NvAZHdXFUBe2olmGqT9o+q4NjRTrP0xoBjdcRNNuaBT3Vde+dlN4eTY5pwoZJ
         4/7dis0R/M36WSEBgH1Ef1muQhrb4JRNJ0ay5kDeCPJpqr/YOKZtVgjDl6eOlGxm67ZB
         7KFAP4vK/xe3nuXLgZEupCXOx0Zam81MPMzWh4CiGvE5kZr0kBnbHhqvOMoRgI20ee9B
         0WpxOj6Oha7OYF9XXOB7Mc9adu8kPFcfH9nQqtmi8V4XYbzRkz6ILMc541uCbVTxyeDs
         CPtwKTRpJCHbUhWtDeBd06rqOoIE63WiE2OV1WM5X7ZsfPxb4NIFw8ezDmkNZoAy2T+f
         JU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=FKhn5WcWMhDkPeyAyv1ODaumKdA3KDOj94yvkfzh1I4=;
        b=dVsnFX55kTRK1Qee1yVHxi7pYO2BSM7egGVIBSWkhUgSE8/9vNDXP+mIwUYF2SzOOC
         HPMs2kVzTU7MeD7CyK/gCkwroFsIK3TxAFXcvSQrskoiWB8UXeR7AsWgwAciMiVgrjPc
         RuYCy/5LxV/qRHo3lsaWRhIjd8sOguFC65ibfXAgx+b1NLJMHwuYQLxi27sSUJkDJOO7
         ySnhvrQQgBzOgu9Gybi/caT+0c2MU7unkADcYQnJsWI5wUWiCeNVfKcpvqWmLnMYb1W7
         2gECKa4XABZ/7AzKZjRCMIBsmvL6C7nx2Yl0p+un2CMyi+dtLMS2NZs5nH+Akd/1qwQA
         dTAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13-20020ac84a0d000000b0031eb1dcaab2si1112673qtq.326.2022.07.14.08.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 08:49:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC15o-0003rN-0M
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 11:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC122-0005NJ-LG; Thu, 14 Jul 2022 11:45:39 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:59425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11z-0000lR-8H; Thu, 14 Jul 2022 11:45:38 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJjR6qgFz4xvN;
 Fri, 15 Jul 2022 01:45:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJjP6kxXz4xdJ;
 Fri, 15 Jul 2022 01:45:29 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <peter@pjd.dev>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 12/19] docs: aspeed: Add fby35 multi-SoC machine section
Date: Thu, 14 Jul 2022 17:44:49 +0200
Message-Id: <20220714154456.2565189-13-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
References: <20220714154456.2565189-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: VtbFU6NwUA+s

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

