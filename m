Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp211996ejn;
        Thu, 20 Oct 2022 03:30:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5hb/UXTOkzAq5iGAggHIsL96Y9I5YaNfPHfC5PruBVka394Sh35g4OFhyVgqONxgQpP4BA
X-Received: by 2002:a05:620a:28ce:b0:6cf:933c:40d3 with SMTP id l14-20020a05620a28ce00b006cf933c40d3mr8339647qkp.258.1666261813607;
        Thu, 20 Oct 2022 03:30:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666261813; cv=none;
        d=google.com; s=arc-20160816;
        b=atOkihsFnzIpnTLRB1NjpfRWskM915MaHdX+sbiBZlt+fbOWK6YJ5bKpU2XnB5D5AW
         pDYHLoftWgJEze1nFLEVPBCLF67v21pvDrg8flTGxzWeEPjrxISPdV51qMeEFISaB4ad
         9NtsUE13hkjBwyYYTdEtDJi4I+EXhunrggZcFDDekwldzHw2bkQc/Ls6tf8GFR3ZAa5p
         SmkJESTACBbS0Cn8YnU0Xn4PO+VkH3GmHVzHZn2BKew6Xv3+hYSLVY4ESKSspiX3C233
         g7xucS/Vw4PEfRrOA4S/7Quiv7BSk+J0KDKyzzcNzyV3iIsaa00pmipMHLS5b7coBfVG
         E2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=+TEzLKXHSYLYaRf2ur7/YkVrD096ac7fNMXbBKKnNGw=;
        b=Gw/eHP1yDfC8hZFdMCmupaHsOKMQ1mStQm8/+zHUUggLZhnSSMBnv2/mF0Ks39QzOf
         vaO8K31yVqjoY5haaeudedqJV58lfzbAmyUqOQq2tg/Dj2A3bF+kX2xwLML0Kyu9tOdQ
         igRdS63oIlokxE30o1PMQFKRAiwINODwffxgHfoG7VulZxXkwM1K71o7MSXnHgHA07vB
         j4YkuPfnQPwlN3osbDDSZQLuyrnGMJsyZYeE9PFzz1mNTb5VTm/WLaaSeYwLHDjhvh8S
         sKTGHKgaSty0vvNgo8zlNXXXE63mTX0Gj3lrtQhCTNmu6E6c0Q7L2cZ7zJXUWeLa4JHZ
         YFGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qbSKD5FN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18-20020a05622a149200b0035d48a600e9si11389545qtx.268.2022.10.20.03.30.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 03:30:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qbSKD5FN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54922 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olSoW-00062M-HQ
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 06:30:12 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olShP-0004ah-1l
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 06:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olSew-0004Ks-GL
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 06:20:18 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:45774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olSeu-0004LL-EK
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 06:20:18 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so1827111wmq.4
 for <qemu-arm@nongnu.org>; Thu, 20 Oct 2022 03:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+TEzLKXHSYLYaRf2ur7/YkVrD096ac7fNMXbBKKnNGw=;
 b=qbSKD5FNYtrb4ylu4LG71MbNRMYOQthWLifiQRYxD55kYMt8mcCNCw1Rq7AsruuHGQ
 ESONAlje6LFk8hAJXgdPcuWIyRDuiSYif9bIZ9384jp5R5PNQO5epwZdpPNqcu2p00V0
 XKYsDHM2fEQCH+OGLXqfMwIkQ2RnsAYkweZYM+DCUm8G61CNpDGeObchI5n6h19Ii2x7
 Ax0nLvPcBjIbRBIouQGiy+ZxARVscbye6AM1oj9xoHg8JcjC65yhaNVJ2+VVsNQmAR35
 r439c7vYnPFP+nJubWEQtAa5WVpZELjA4QrovHymmWQyQV3HkTZ24oB11jQzxIPvci/M
 e5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+TEzLKXHSYLYaRf2ur7/YkVrD096ac7fNMXbBKKnNGw=;
 b=BKvF2RLVmf2azvZq0AaeM8915a3ZuRny+y6WgqOPlAEHNnCyq+2VTXDeY2868NQz28
 6EjJ8pxgE1A/yB9Z5KL69XgcO5+cFa+MAgVCKwu0zd2wUM2aUgWHKCZghwoJtnCpXU+k
 V3wscgID7q1SSC5CBIPA9vl8gcQqlyYPOyzIMEmHwLeqUeMNCsRLmtQ9G6bgxYMwsEEk
 NQ+424cqiiBzRBRK++J/EHKY22EhwO8f1KBBd2dmb19sbLPjzyddQNGM1RdD3yAUh94A
 cfCzXsvHuP4RO8hk4CwRWDicw8c2A735sVQHDu34YoBnF4cZPkP8qD1LbgcJNNYfReyL
 eA/w==
X-Gm-Message-State: ACrzQf0W3Q6oHpnQEbahb5+UDot6nCUMRMGdWHt3azlcXHzdzlmsUWUL
 p28Wcv9IVByfN3z+hSCxtcu+4G9yhIt2sA==
X-Received: by 2002:a05:600c:219a:b0:3c6:f259:7e30 with SMTP id
 e26-20020a05600c219a00b003c6f2597e30mr16628662wme.111.1666261214456; 
 Thu, 20 Oct 2022 03:20:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b003b47ff307e1sm2249128wmb.31.2022.10.20.03.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 03:20:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH] tests/avocado: raspi2_initrd: Wait for guest shutdown message
 before stopping
Date: Thu, 20 Oct 2022 11:20:12 +0100
Message-Id: <20221020102012.3015662-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 77f+FyCMrgLt

The avocado test
 tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
finishes wiith

    exec_command(self, 'halt')
    # Wait for VM to shut down gracefully
    self.vm.wait()

In theory this should be fine. In practice it runs into two bugs:

 * when the test calls self.vm.wait() Avocado closes the socket
   connection to the guest serial console immediately, so the
   avocado logs don't have the last part of the guest output:
   https://gitlab.com/qemu-project/qemu/-/issues/1265
 * when the socket is closed, a bug in the QEMU socket chardev
   means that it loses any data that the guest UART has not
   yet consumed. This means that the guest doesn't always read
   the full 'halt' command string, so the test intermittently
   fails with a timeout:
   https://gitlab.com/qemu-project/qemu/-/issues/1264

Work around both of these by waiting for the guest to print the
string that means it has completed the shutdown process.  This fixes
a very long standing intermittent failure in this test.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/636
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/avocado/boot_linux_console.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index ca9d09b0d7c..eed4b49e6e4 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -489,7 +489,7 @@ def test_arm_raspi2_initrd(self):
                                                 'BCM2835')
         exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
                                                 '/soc/cprman@7e101000')
-        exec_command(self, 'halt')
+        exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
-- 
2.25.1

