Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp100903ejc;
        Thu, 2 Mar 2023 11:11:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+pSk2ZbEwo1/HgTp2nmxujWcxl/Z++GXZYNMKYuTq0mC/QsoEZ+VjAURmtg0Mn1PHW0zBx
X-Received: by 2002:a5d:684f:0:b0:2c7:6bf:16cc with SMTP id o15-20020a5d684f000000b002c706bf16ccmr8308326wrw.32.1677784318452;
        Thu, 02 Mar 2023 11:11:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677784318; cv=none;
        d=google.com; s=arc-20160816;
        b=iwyhvYK0G0026lAA/6jANGnykV0Yd3NqFxJOihs+7UnLQd45QQRfr4eD/cM70bpPYR
         ewdfMqyUZdu5xs5a2zrlSgx+vnOu7RafrPrkXhqHOhx6USS2fNciE/Vs37F0KNjWUdo2
         gZfToeHvb63qMw8Ydrj2XtnTotebXHfgnN4yQdyYnVJB3WAm/rUqMN4SZq9nNvY+DLj1
         k46lCwW1j8BIJoMyuukZbvFkr/iV5Cja1mN+QEuOzgV4dYOJn9d9VgN1g8gMVr7uRVtL
         ByIPrU1hJJDFp9gkimm7jP9n3L9eN2VqMBOh+/agnaKeiMFk1aVrC1F0aZ98HwpOREfy
         wM6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=kf0GWwc942oPPG7VxJqtfXgMCoasVuf9KQzlT6oVV5c=;
        b=AomVYwU1CsR1brUq+t43rTK012X7W7LW8Hm3OCRo1yrEvFl74jYTjgpxO6WeQHaVG4
         XxNDpVuWR7pDkLES3FIh9M5p09as5SHhIbaM1r+7vpIMpAmDHNP0Mn0foRSWzeAcoy1r
         yzeQ1OcoxP0vdvQUz13IUDTEM3wZ91OmHgZa+uK/XGbNRlilCq8oRh6jgGkA8/Wo0InM
         Q5OQWPOtSBm1iERMm4c49BeZ2MpJ79msiOKauoVKchmX/lke9vVhM1NnKaPJ50uKKgjx
         bWusAmOl1dqfi9g0zYshKbuT8AKueR6nkQxZdtZQzYoYi40E+CE/er8S0mrC9RBSmfAX
         sjNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from muminek.juszkiewicz.com.pl (muminek.juszkiewicz.com.pl. [213.251.184.221])
        by mx.google.com with ESMTPS id c17-20020a5d4151000000b002c54f2a103fsi92696wrq.935.2023.03.02.11.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 11:11:58 -0800 (PST)
Received-SPF: softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) client-ip=213.251.184.221;
Authentication-Results: mx.google.com;
       spf=softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 7980A261092;
	Thu,  2 Mar 2023 20:11:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
	by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IdTaJIq_VHC0; Thu,  2 Mar 2023 20:11:51 +0100 (CET)
Received: from puchatek.lan (83.11.36.13.ipv4.supernova.orange.pl [83.11.36.13])
	by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id C74EA260167;
	Thu,  2 Mar 2023 20:11:50 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Radoslaw Biernacki <rad@semihalf.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/3] tests/avocado: update AArch64 tests to Alpine 3.17.2
Date: Thu,  2 Mar 2023 20:11:44 +0100
Message-Id: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: We+DVAj+KoGn

To test Alpine boot on SBSA-Ref target we need Alpine Linux
'standard' image as 'virt' one lacks kernel modules.

So to minimalize Avocado cache I move test to 'standard' image.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_virt.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machine_aarch64_virt.py
index 25dab8dc00..a90dc6ff4b 100644
--- a/tests/avocado/machine_aarch64_virt.py
+++ b/tests/avocado/machine_aarch64_virt.py
@@ -38,11 +38,11 @@ def test_alpine_virt_tcg_gic_max(self):
         :avocado: tags=accel:tcg
         """
         iso_url = ('https://dl-cdn.alpinelinux.org/'
-                   'alpine/v3.16/releases/aarch64/'
-                   'alpine-virt-3.16.3-aarch64.iso')
+                   'alpine/v3.17/releases/aarch64/'
+                   'alpine-standard-3.17.2-aarch64.iso')
 
         # Alpine use sha256 so I recalculated this myself
-        iso_sha1 = '0683bc089486d55c91bf6607d5ecb93925769bc0'
+        iso_sha1 = '76284fcd7b41fe899b0c2375ceb8470803eea839'
         iso_path = self.fetch_asset(iso_url, asset_hash=iso_sha1)
 
         self.vm.set_console()
@@ -65,7 +65,7 @@ def test_alpine_virt_tcg_gic_max(self):
         self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
 
         self.vm.launch()
-        self.wait_for_console_pattern('Welcome to Alpine Linux 3.16')
+        self.wait_for_console_pattern('Welcome to Alpine Linux 3.17')
 
 
     def common_aarch64_virt(self, machine):
-- 
2.39.2
