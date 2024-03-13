Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2354156ejc;
        Wed, 13 Mar 2024 03:09:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxOOHWYKFsuf8tMfXm3xZHARkxmFlgLmgWln2CNLIvnnDsWDilw8RgNxqENYp5vSuJ5Ed1kHad/NNSw3IEMmzXnhqSJgNo
X-Google-Smtp-Source: AGHT+IFaiFo59geydP1ixO/iV1qzx5gN/Kyp5SjfAsPS0Z2sfnJpnopedBkyL5alF4jxkZZX4viE
X-Received: by 2002:a05:622a:5c7:b0:42e:d04a:4c85 with SMTP id d7-20020a05622a05c700b0042ed04a4c85mr17309726qtb.66.1710324540523;
        Wed, 13 Mar 2024 03:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710324540; cv=none;
        d=google.com; s=arc-20160816;
        b=RlYniePlNfV9qBZv9XSfPCTMNx8TJ/9lXpGHuWCj5htEK39+khr68z/PMbjmzJS9lZ
         tMgvf/hPBI+k+fJ7fGWPBeNJQgipF9CLgnF2KdcuWM6R5ADJ1hB5aie9OUbMjDk7BrGp
         c0GjOrhxNv1q3b671tohcR+PVIpRufCmvWmIT72pdSHuJp1WwF9haIihYhxeAVEZPWTF
         UCktNIsLs/yHLRH7yuc7/YdAHSadLODNzvkJLVWFVP7OBxxqKb7fYw//6gV4enVt+4aH
         xVCdNUhS8NXCTuwqCPzgxiq6izpy96oBK+5CNmGUxjyjuSintGJOC7AM4/ntn8/46c0T
         +ibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from;
        bh=caJKMCVgz/4gnFbNz97BlPifioYjsyPV5gCVBsw/Wyo=;
        fh=LC/OdAGxp8XjCcxyMB5oH3DeKOnqJHpFVM0U3yCY+4A=;
        b=wAFMeih5j+iVc5rmpMyEGLX1+vm1HArzHGiFcYHEUTYLPIWa8uyVDO3q8DLSvPOVAt
         6GorXe4z0tE/LndYOXBSp3n09SBZ4Zp6DpKfkTJOJdPo6QlUVMTGhEbZN2W5MlnayMkx
         AGCopCB1q7JLCJyiSHrKRku32fKgK6jbe1X5Tg1j7bf2jPx0fjZXsU517GLBKt9qFAMH
         F3k4vdShjJaQwecUNKngFtAqxst4ZBrW18XTL6lG9FDzz8qCoMdRzZ0SeQU67KspcuaO
         2pEF/d9KaZR2ukmQJFn1uUq5D6G2C/PMZygAwhfw7QCn7EJiPyU0l3bSuZbYk8vqX205
         9C0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020ac8574e000000b0042ef595d151si9329751qtx.269.2024.03.13.03.09.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 03:09:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkLXN-0001qG-Ea; Wed, 13 Mar 2024 06:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkLXF-0001pQ-GH; Wed, 13 Mar 2024 06:08:34 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkLXA-0006UX-T4; Wed, 13 Mar 2024 06:08:31 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 5779F260AB8;
 Wed, 13 Mar 2024 11:08:25 +0100 (CET)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 5ngjmAEiR85Y; Wed, 13 Mar 2024 11:08:23 +0100 (CET)
Received: from [172.17.0.1] (83.11.22.169.ipv4.supernova.orange.pl
 [83.11.22.169])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id C5395260B8D;
 Wed, 13 Mar 2024 11:08:22 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Wed, 13 Mar 2024 11:08:20 +0100
Subject: [PATCH 2/3] tests/avocado: drop virtio-rng from sbsa-ref tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-sbsa-ref-firmware-update-v1-2-e166703c5424@linaro.org>
References: <20240313-sbsa-ref-firmware-update-v1-0-e166703c5424@linaro.org>
In-Reply-To: <20240313-sbsa-ref-firmware-update-v1-0-e166703c5424@linaro.org>
To: qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>, 
 qemu-arm@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: b4 0.12.3
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bLsVXfcA8uiw

sbsa-ref is supposed to emulate real hardware so virtio-rng-pci
does not fit here

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index cbab793455..259225f15f 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -132,10 +132,6 @@ def boot_alpine_linux(self, cpu):
             cpu,
             "-drive",
             f"file={iso_path},format=raw",
-            "-device",
-            "virtio-rng-pci,rng=rng0",
-            "-object",
-            "rng-random,id=rng0,filename=/dev/urandom",
         )
 
         self.vm.launch()
@@ -179,10 +175,6 @@ def boot_openbsd73(self, cpu):
             cpu,
             "-drive",
             f"file={img_path},format=raw",
-            "-device",
-            "virtio-rng-pci,rng=rng0",
-            "-object",
-            "rng-random,id=rng0,filename=/dev/urandom",
         )
 
         self.vm.launch()

-- 
2.44.0

