Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp100978ejc;
        Thu, 2 Mar 2023 11:12:03 -0800 (PST)
X-Google-Smtp-Source: AK7set9ZzxBy2YehFXWnmu9+eQqF3GzjcY0tPa5mnQEKeXAYugoTn4RsKV0LuICb5LVqiZ1/N1SU
X-Received: by 2002:a5d:564f:0:b0:2c7:1206:85ff with SMTP id j15-20020a5d564f000000b002c7120685ffmr9048861wrw.48.1677784323510;
        Thu, 02 Mar 2023 11:12:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677784323; cv=none;
        d=google.com; s=arc-20160816;
        b=oTZL2+tDG1l4iK97kP8R8TVrdffTkCFbNixEGWg5eBOCnhkiB9SCU1an5Dxut8Ha9S
         tbgQW/DKcQHw0bab1PyR/MzMvCN5WZe2vhGYv4SqKgxWOPZZNoUR63jHm6Wfh/XrcELg
         HeKBwwssiYAwNbFcB7VKX5XlGcqF5qnnHSxAaeqXgVyE7hWeAY4y/5FTNUZQ29qZw9LP
         EFsrkUWQshy8N1AZZzz7MAdvLIvtleomP8ze1xaCHRkuy++WtSlxbwpu4sHnWatJXBW8
         2eBhiM30JaiEH03AtpCyfJE9fSh52hbM/YBuvxzuzbFNQyC2rfIXj3rSAiPacSqjkSO/
         dJOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=JlUDP98pypctaCExk/qEu+ba1BGUKb/VtbX6p8o12Pk=;
        b=hdbzFkIzY00QFqSQh9SrvqIB4+xrrZ7pR9zKtw26CxWuXc4YKnA382K/vl8mFjeD8g
         pwdcbgrEQuwx/WD+CcaJLCRJXYtNm1wORgvPi07CLrBipb2vXmmeEaadnFDL7mF2tUti
         vQZFA13i0NPSwgbjNpKCGyxhw8feZ+U50PrB3l0Dox7oSbrtifyFWUmV93Q8RxoWKTJy
         bZiu0uYTS42oY+nJ5pNwTYFrsWuzzgps4EaAu+8Jv4VEoomiJz78l2A+AOXHTJb8dgtU
         aiV+8cyiL538K0XGr5uo2QUZ1LjIAA72zMHVgVSxDpyJVzur7SAT/qbVSxK6rtPILoun
         xQww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from muminek.juszkiewicz.com.pl (muminek.juszkiewicz.com.pl. [213.251.184.221])
        by mx.google.com with ESMTPS id x1-20020adfffc1000000b002c55da4a39dsi118229wrs.367.2023.03.02.11.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 11:12:03 -0800 (PST)
Received-SPF: softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) client-ip=213.251.184.221;
Authentication-Results: mx.google.com;
       spf=softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 89055260167;
	Thu,  2 Mar 2023 20:12:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
	by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SznqlDZupR5i; Thu,  2 Mar 2023 20:11:56 +0100 (CET)
Received: from puchatek.lan (83.11.36.13.ipv4.supernova.orange.pl [83.11.36.13])
	by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 550682606A3;
	Thu,  2 Mar 2023 20:11:52 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Radoslaw Biernacki <rad@semihalf.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 3/3] tests/avocado: add Alpine Linux boot on AArch64/sbsa-ref
Date: Thu,  2 Mar 2023 20:11:46 +0100
Message-Id: <20230302191146.1790560-3-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
References: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vxJLqcokLFZe

To unify tests for AArch64/virt and AArch64/sbsa-ref we boot
same Alpine Linux image on both.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index e36e53d4d5..fdbde4b891 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -148,3 +148,32 @@ def test_sbsaref_linux_max(self):
         :avocado: tags=cpu:max
         """
         self.boot_linux('max')
+
+    # This tests the whole boot chain from EFI to Userspace
+    # We only boot a whole OS for the current top level CPU and GIC
+    # Other test profiles should use more minimal boots
+    def test_alpine_sbsaref_max(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:sbsa-ref
+        """
+        self.fetch_firmware()
+
+        iso_url = ('https://dl-cdn.alpinelinux.org/'
+                   'alpine/v3.17/releases/aarch64/'
+                   'alpine-standard-3.17.2-aarch64.iso')
+
+        # Alpine use sha256 so I recalculated this myself
+        iso_sha1 = '76284fcd7b41fe899b0c2375ceb8470803eea839'
+        iso_path = self.fetch_asset(iso_url, asset_hash=iso_sha1)
+
+        self.vm.set_console()
+        self.vm.add_args("-cpu", "max,pauth-impdef=on")
+        self.vm.add_args("-machine", "sbsa-ref")
+        self.vm.add_args("-drive", f"file={iso_path},format=raw")
+        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
+        self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
+
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Welcome to Alpine Linux 3.17')
+
-- 
2.39.2
