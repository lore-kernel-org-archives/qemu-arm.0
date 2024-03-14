Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp205216eju;
        Thu, 14 Mar 2024 02:23:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2ISxQQH6F1W/xD60dzTZ3cFIFLE+jCbk5wouv7iRv8B77Awr5PjwxPl5ABeoruMiG5+0xA3elSNyRAxca7O6dSqFtOIlq
X-Google-Smtp-Source: AGHT+IGCxeZ0XPWzXn3/rO1n4RcYAk9YOK6zgw9Z3WwJrg3CnFkxgCKHJycbRFM3flJTowTWLu2C
X-Received: by 2002:a05:620a:a8a:b0:788:7583:7647 with SMTP id v10-20020a05620a0a8a00b0078875837647mr42534qkg.69.1710408238776;
        Thu, 14 Mar 2024 02:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710408238; cv=none;
        d=google.com; s=arc-20160816;
        b=ebsiM4HTYqQFV6OEIYaBgDx8gQ8Ry6EMLeOL8PKtIL54W7+l9BMAuNGVjRHax5V+D8
         gwf7GFEBFFk8GUrvcKPgU5CBVLUcB8vKO4bjOLL56xRTQ+tlCMyswDG0+WQdeLSUQ2t9
         q8kCpAviVFukaHQ5ehVi+GqIuA045xu6fmYKTtgLsm2iOepRpdbVjpX8YzhgONwzOhw1
         BVo5Vax/9f367C+dw4m1n9Lce89U8RwFtf5GUGfcRLkoUyyGjwTyNOQDaR8Vg28jD7py
         LfFf/irOvAq1/DImuNLldzdikzb0bqRaD56zT9cc7AENn6J2cVDbsnVMuLl/wvQtMs22
         lycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from;
        bh=caJKMCVgz/4gnFbNz97BlPifioYjsyPV5gCVBsw/Wyo=;
        fh=LC/OdAGxp8XjCcxyMB5oH3DeKOnqJHpFVM0U3yCY+4A=;
        b=kDKfgmiPZyM2tXj4osp4XvNDKCKy41ZbVyjjW7zpR0Pb/BBlYFIlRrVrd96xHS4N5K
         m0kzVhWJSM1TKnB/x145+0I47w7MToeNgusa0uNSOu/qDUWM+aAgWSDbWwDN9wZH72zB
         RUfSGd8WvDCtN7qttqZ3mOZVA4hKGdVRbeEm5B7cdx1a/sgVUvQAN9vTu3xkVJCoF0ET
         S2bUpE6ANoUwXucP2AlaJ+/dA4AWgyXX9grTt8pP7kdOYPREI97vvo49oy57+Pv6N0cn
         MW02Ar6MV5gpLOVkCf/Xctb3u77yeomwf6vnoIzbxJRkUxgc4TY0pgrexrN3ZdTnLxZ5
         DVyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wm14-20020a05620a580e00b00789dd83ea07si57628qkn.86.2024.03.14.02.23.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Mar 2024 02:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkhJR-0004ra-FZ; Thu, 14 Mar 2024 05:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkhJK-0004oF-OH; Thu, 14 Mar 2024 05:23:38 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkhJG-0007sV-7i; Thu, 14 Mar 2024 05:23:38 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id B73BF260AB8;
 Thu, 14 Mar 2024 10:23:31 +0100 (CET)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id OEP9ygsYXWPS; Thu, 14 Mar 2024 10:23:30 +0100 (CET)
Received: from [172.17.0.1] (83.11.22.169.ipv4.supernova.orange.pl
 [83.11.22.169])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id CAFD7260B83;
 Thu, 14 Mar 2024 10:23:28 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Thu, 14 Mar 2024 10:23:25 +0100
Subject: [PATCH v2 2/4] tests/avocado: drop virtio-rng from sbsa-ref tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-sbsa-ref-firmware-update-v2-2-b557c56559cd@linaro.org>
References: <20240314-sbsa-ref-firmware-update-v2-0-b557c56559cd@linaro.org>
In-Reply-To: <20240314-sbsa-ref-firmware-update-v2-0-b557c56559cd@linaro.org>
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
X-TUID: teabqtpGsVLG

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

