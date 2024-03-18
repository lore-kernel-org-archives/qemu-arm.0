Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp666592ejb;
        Mon, 18 Mar 2024 07:09:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW57IhmXsaJ1vME1a/CO1HD74sYu3l38G8ROn+JwI7gUqSIrHXXZAYjpD2usN0s7MG45EePJZVZ8ZeiVo4Mc6wrbOHibKJm
X-Google-Smtp-Source: AGHT+IG3LdTpVZkVXVR53908O2xZCNk0FFcCaKMg0K5f817QSj9kb3/K7K0Grrds1c1tsaClw8Tp
X-Received: by 2002:ae9:e40b:0:b0:789:e2c1:40ac with SMTP id q11-20020ae9e40b000000b00789e2c140acmr11563382qkc.11.1710770958883;
        Mon, 18 Mar 2024 07:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710770958; cv=none;
        d=google.com; s=arc-20160816;
        b=VSyviP+om5QRo17nTKc546YUVsKxuQs8IUZ/95BRqMO7If1Pq5Dat0vkrigoo2wUN4
         72gCuzDId/S5rFazXtkFgd/aDSdNG9uWuKEN+qmXH84SnEt9ggRCTTsqVdSn0njNJj5E
         kU8t7a1H0NVH4w952k2S81iph8QdHsA4xNi1ZLUNYxtuZYO1iWyOAZskbQrZnGKxmolQ
         3lDpuxSuL3vp0ATD/7fHQA08nAO3LOQvPeWuXesEjY5LiEKJQBDIFxFaXEhoQS8yf5YB
         nGWr2F0qcqmbA2CgAxvhyKeJBlKRmUL+Z14QbJSOWjtI47+3LQ4g/aHvaFmloZMSTf0f
         3tmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from;
        bh=3hVDurQmW4EE2ENRc4QEf83ThCZPBhIKIOOUjf5qAew=;
        fh=LC/OdAGxp8XjCcxyMB5oH3DeKOnqJHpFVM0U3yCY+4A=;
        b=Hl5RSSBbL3G5OHyPloWCZqfZPpgC5CDFlFd6ZAEG3u/n2jUzMeXmJDUcVSeSn/Tjm2
         DBiZOo3CVeOax7zsDOr8APcJEv8NK9jGYF9qwWz8odmu4XuWcSiOUyqOyLoINbncq1OL
         WMPWReQIAUxlQkOSDE9WwyaZIP+GNXtS8EfczrvFcSQHyyx8lo04VIPDPGCXR9pzZqZ0
         ojIYs03eVjdhyw1YCzEXL/lYA7jhFIQutK9NrCW2ZBCARaeHYKGNVQK/x/2TmFBRUVFr
         FGMPs64NihNBDZ/FTGWib2yD2Q7jnOxo3pQv0x77styD1kl+EoEBVImsIGVSE0KL1v1Q
         bUqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17-20020a05620a023100b0078a0366a2c9si1479709qkm.693.2024.03.18.07.09.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 07:09:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rmDfB-0001Yk-E6; Mon, 18 Mar 2024 10:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rmDf4-0001Un-6j; Mon, 18 Mar 2024 10:08:23 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rmDet-0006Fx-Pa; Mon, 18 Mar 2024 10:08:20 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 3ABBD26074C;
 Mon, 18 Mar 2024 15:08:10 +0100 (CET)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 7OOaUM3g0Hl0; Mon, 18 Mar 2024 15:08:08 +0100 (CET)
Received: from [172.17.0.1] (83.11.22.169.ipv4.supernova.orange.pl
 [83.11.22.169])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 01435260BB4;
 Mon, 18 Mar 2024 15:08:06 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Mon, 18 Mar 2024 15:08:03 +0100
Subject: [PATCH v3 3/4] tests/avocado: sbsa-ref: add Alpine tests for misc
 'max' setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-sbsa-ref-firmware-update-v3-3-1c33b995a538@linaro.org>
References: <20240318-sbsa-ref-firmware-update-v3-0-1c33b995a538@linaro.org>
In-Reply-To: <20240318-sbsa-ref-firmware-update-v3-0-1c33b995a538@linaro.org>
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: f64Md0DkD1tI

PAuth makes run timeout on CI so add tests using 'max' without it
and with impdef one.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index 259225f15f..cf8954d02e 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -140,18 +140,36 @@ def boot_alpine_linux(self, cpu):
     def test_sbsaref_alpine_linux_cortex_a57(self):
         """
         :avocado: tags=cpu:cortex-a57
+        :avocado: tags=os:linux
         """
         self.boot_alpine_linux("cortex-a57")
 
     def test_sbsaref_alpine_linux_neoverse_n1(self):
         """
         :avocado: tags=cpu:neoverse-n1
+        :avocado: tags=os:linux
         """
         self.boot_alpine_linux("neoverse-n1")
 
+    def test_sbsaref_alpine_linux_max_pauth_off(self):
+        """
+        :avocado: tags=cpu:max
+        :avocado: tags=os:linux
+        """
+        self.boot_alpine_linux("max,pauth=off")
+
+    def test_sbsaref_alpine_linux_max_pauth_impdef(self):
+        """
+        :avocado: tags=cpu:max
+        :avocado: tags=os:linux
+        """
+        self.boot_alpine_linux("max,pauth-impdef=on")
+
+    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
     def test_sbsaref_alpine_linux_max(self):
         """
         :avocado: tags=cpu:max
+        :avocado: tags=os:linux
         """
         self.boot_alpine_linux("max")
 

-- 
2.44.0

