Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp205457eju;
        Thu, 14 Mar 2024 02:24:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVDbyKR/HlcaxUKX4Oah/fl5/KnQHeiUTSmTtKBgwSWrjw4I8eh9ynM0GPDeWW9ft3HjhLMwFwMEJaYfLAv7lLurMX3Wwf
X-Google-Smtp-Source: AGHT+IHOGH3BTEWv9YzHxMqxl9msL9vctpTY3EHS0rswYuReITgPTTehdti8x2VPOWy5V+kFsrJ3
X-Received: by 2002:a0c:aa56:0:b0:691:488d:363b with SMTP id e22-20020a0caa56000000b00691488d363bmr1043572qvb.58.1710408274449;
        Thu, 14 Mar 2024 02:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710408274; cv=none;
        d=google.com; s=arc-20160816;
        b=x96YQKVQcdTNA7P3taIJmR9H398yk1O2UfZiWzOOfrwqkdkss4E8eGsQOCxMHoHghT
         3NIe0GBDw/IfSliLUMHjGEmaH8I9olMPz5n8mP+IbSqZNjbxjItCG3DUIJF+mf0QiAUg
         QOQKZ/jxQ81Odivh28nMELsvb6gWtXT3JMRCm8DBC0/EmUql3n+NC8i3elSBuAp68pv+
         huIfgLoH1Svx0jc6JeZ4dl/B57aCZE+NZhvfZMXotEo0uEy7+fsXlgQY6/5/BPgdzCYE
         qoVt9L82N2l1ygqUTmsZ4dQC1xr9x48HtLg587+TzKqowOlEG3TIsuqyYhJxTPmFPaTo
         /tlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from;
        bh=eeXoXU5LVZKqH/pT1e0L1PHQOxPU9uloHyWLOAah9uY=;
        fh=LC/OdAGxp8XjCcxyMB5oH3DeKOnqJHpFVM0U3yCY+4A=;
        b=y+8wlkaHDx38WqWHEkwJIvC3B+qrzXLnDYhk89C12pC51wnaw2RIDc5yZMpJJXV7UH
         j5+kvtwuxKnqz98SBkfWPp5BHUUAqgBWuM0DwMsqlD8cBnhpw17bMHpxIn02l5ZCN4cU
         FnchIKloGixYZQEphXhViuXlrGsiWFnPqsAdw3HCmpWi16dnkIJDQYbImH7byYzzS3uG
         TaujGfEnLypmFZzzWIjRFXPoPGlmvHVvr9hcPQ/0/7+g/T2qcvGafD7caPmGFqs5qDNc
         0rjVwnBz2UVwpF4JaOFqldp55tce6Rs/FcFSuopBpLP9nwqtPRwzNXFjd6cIzvs4eXhO
         +2Xw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11-20020a05621421ab00b00690cbfacdc4si222503qvc.521.2024.03.14.02.24.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Mar 2024 02:24:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkhJS-0004rs-Ai; Thu, 14 Mar 2024 05:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkhJK-0004oN-VZ; Thu, 14 Mar 2024 05:23:39 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rkhJH-0007so-J3; Thu, 14 Mar 2024 05:23:38 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id B8F922600DA;
 Thu, 14 Mar 2024 10:23:33 +0100 (CET)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id BKMXOj-3mhbc; Thu, 14 Mar 2024 10:23:32 +0100 (CET)
Received: from [172.17.0.1] (83.11.22.169.ipv4.supernova.orange.pl
 [83.11.22.169])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 6A643260835;
 Thu, 14 Mar 2024 10:23:30 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Thu, 14 Mar 2024 10:23:27 +0100
Subject: [PATCH v2 4/4] tests/avocado: sbsa-ref: add Alpine tests for misc
 'max' setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-sbsa-ref-firmware-update-v2-4-b557c56559cd@linaro.org>
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
X-TUID: HOluvQUNwwqH

PAuth makes run timeout on CI so add tests using 'max' without it
and with impdef one.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index 0e52dc5854..0dd2eff0de 100644
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

