Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3911315njc;
        Wed, 6 Nov 2024 17:26:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVSlR34+ymGSoESXDClSO61sIjerw7TGv4M8sm9PpyNg7/a522NRQTmGVBhMBE7pvcauv3w3g7SGNoIwg==@linaro.org
X-Google-Smtp-Source: AGHT+IEZrTQSKfPgR/0+zbbEH03zZsKNg35sed57VGELH0H5FWnrpBgqlcvbeVzwEPkwfpOTbmYJ
X-Received: by 2002:a05:6122:200d:b0:507:90d1:e91e with SMTP id 71dfb90a1353d-510150e465dmr38684548e0c.10.1730942769868;
        Wed, 06 Nov 2024 17:26:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730942769; cv=none;
        d=google.com; s=arc-20240605;
        b=aQyZ3/qRnxTnNvfwwpwYZbx/mhdbuR80dXwo4H4Bsv323fmAprWjZN827a8F8LwioJ
         LooLj/Rbw9gZUzieR7Bs7q+rORQIFHPqA+1dl1z6WivdNOZkqK2v46+uYYhWe8Dr2MEC
         sJ6ybKWpr/bEuIyC3UPllA/NcC5oOyPtuDbSy1HXsWBtN9zQBIsRYedZB+/bj9EHnokn
         hZ9YfojDpXb8BK60hSCJYTpGzYSiLZYrFdoeZGJ5uq406VLAlQ6ToonumD3MhlEkj302
         l9Zw9wDxAUb2SCZTOM6JMiolvGFsgtKkk1fa/pk2DzLDAiG7qdTlczZaXf/0EU0eoyBE
         HZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iED9jISqfSsG2m+ZE+lZ82AHUiDCp1mFbt2BJhqjoT8=;
        fh=7u/oviiZzTpNPSnFZnzNYp/uuVe4Xx4y/PvkFJyp94Q=;
        b=SmqEY9Dqd4DReqild8J+btYYAuZkUcgSPNHPjwcrNcJ1Xo++idmAsScS3w3nZ9v+Id
         LLboRWG2/b26H7Rlx1MFoO6HUw/f64ZvDSN3+k9+WkQKj5yYs8AcDDMawg//AzuWG4vA
         aJVNByf7t4OzrmHcEQG1L1ddptP72N1tGzkDqLeWyJI26MybYZoIB/acsko0VbsFqjYm
         tbfgk230MDluvQw+FlmijU+yqUWpaqyzHjtoMhOhwwh08iJZFFJtDCyqJR1PEFOY8bQK
         /S1f7VAmbInAVWS46ZfK+uuP+JuBwIc8eulaCl4i78Cn2/FyyFtVsNByTKeFBAXLT9eb
         uoEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GqLflv8e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3966b3347si3414596d6.491.2024.11.06.17.26.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2024 17:26:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GqLflv8e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8rFp-00074O-Nk; Wed, 06 Nov 2024 20:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rFm-0006rl-QX
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:24:07 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rFj-0003Fy-KZ
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:24:06 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37d50fad249so244473f8f.1
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2024 17:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730942640; x=1731547440; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iED9jISqfSsG2m+ZE+lZ82AHUiDCp1mFbt2BJhqjoT8=;
 b=GqLflv8e+4eZPrPz/umye4BqOdqAcYl/hoDhINjbudkRswJKLm/ufy0nYT6fa4UThV
 30ezUJJXA/qCqQ5M48bNO3LNBCOXhnsgYLbKrcjZSux6dFWV/ZxXREGMiTNq4OGoIjI/
 3Ndk5XS9csDw10gu7ThJpbz5AhaGWzUdbilKExpX1HvJCJk6Xj9DeV1DdgFxA2r42vFw
 6sjNlkMLAchq+KgfcHc8nLqFIClLHpJT0UrQluePFpUMXZL+Je8jsgTwTJIB1IePr9oj
 +gcuOvJ8jS11RGCFIjBYWM/38+2W0HRF08dk79dilV+GPptm/Td4osw0aPtVd6I2/0jv
 bnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730942640; x=1731547440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iED9jISqfSsG2m+ZE+lZ82AHUiDCp1mFbt2BJhqjoT8=;
 b=aEZLQt33Tyzhc8hi39uUwj7fIKSPZJWeMl2cFm6yDI0EA6usbSfg6AaojBXrLSXh9U
 JCY0srTAuyD23D/w3IaXgJNN69FYetgdv/hGybjBprEWM95whUUrVK/3+09cTCcPReqg
 7HqYnVN0mWeW9OE/cbTjWG9QXRSHppImVDbL5hYW3RYT14k56tjEB8QDs2C/StzkTGzG
 0qec38FoI6Y80VF2I0IbpdiV6T9gP3I6sBVGf9eQ5nRfUmyFKLIRL3qTb++9ABpBTmOa
 6Eo6L38XzYMCahTlPsXlRIgtiPMedPMGKP86Zq3qneRT0DSItL9trI0PA+p0GZ4EdDog
 6ISg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXujjoHhZt/AyQAjwW58kFTG1WJRi0wOIEfOXMlzQB7ni8MsJeMiw+2oT5VljM+u7vfqRfXMPNgDg==@nongnu.org
X-Gm-Message-State: AOJu0YwVtleAf4XKi//bH2KQeSWZVbnNT5BigvvrsIuCkXcPyPPnwDTI
 2PKT9Ts0SwL6FvYbgyoI1i+2J8XTCtcYbdcY65vNF+kKpQfA7p0J+0989R7Nfls=
X-Received: by 2002:a5d:4a4e:0:b0:37d:4318:d8e1 with SMTP id
 ffacd0b85a97d-380611376a9mr30745334f8f.23.1730942640518; 
 Wed, 06 Nov 2024 17:24:00 -0800 (PST)
Received: from localhost.localdomain ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9707d3sm244265f8f.19.2024.11.06.17.23.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Nov 2024 17:23:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, devel@lists.libvirt.org,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 15/16] tests/functional: Explicit endianness of microblaze
 assets
Date: Thu,  7 Nov 2024 01:22:21 +0000
Message-ID: <20241107012223.94337-16-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107012223.94337-1-philmd@linaro.org>
References: <20241107012223.94337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gu7wk0Qm6KTf

The archive used in test_microblaze_s3adsp1800.py (testing a
big-endian target) contains a big-endian kernel. Rename using
the _BE suffix.

Similarly, the archive in test_microblazeel_s3adsp1800 (testing
a little-endian target) contains a little-endian kernel. Rename
using _LE suffix.

These changes will help when adding cross-endian kernel tests.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/functional/test_microblaze_s3adsp1800.py   | 6 +++---
 tests/functional/test_microblazeel_s3adsp1800.py | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/functional/test_microblaze_s3adsp1800.py b/tests/functional/test_microblaze_s3adsp1800.py
index 4f692ffdb1..2b2f782270 100755
--- a/tests/functional/test_microblaze_s3adsp1800.py
+++ b/tests/functional/test_microblaze_s3adsp1800.py
@@ -17,14 +17,14 @@ class MicroblazeMachine(QemuSystemTest):
 
     timeout = 90
 
-    ASSET_IMAGE = Asset(
+    ASSET_IMAGE_BE = Asset(
         ('https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/'
          'day17.tar.xz'),
         '3ba7439dfbea7af4876662c97f8e1f0cdad9231fc166e4861d17042489270057')
 
-    def test_microblaze_s3adsp1800(self):
+    def test_microblaze_s3adsp1800_be(self):
         self.set_machine('petalogix-s3adsp1800')
-        file_path = self.ASSET_IMAGE.fetch()
+        file_path = self.ASSET_IMAGE_BE.fetch()
         archive_extract(file_path, self.workdir)
         self.vm.set_console()
         self.vm.add_args('-kernel', self.workdir + '/day17/ballerina.bin')
diff --git a/tests/functional/test_microblazeel_s3adsp1800.py b/tests/functional/test_microblazeel_s3adsp1800.py
index faa3927f2e..1aee5149fb 100755
--- a/tests/functional/test_microblazeel_s3adsp1800.py
+++ b/tests/functional/test_microblazeel_s3adsp1800.py
@@ -17,14 +17,14 @@ class MicroblazeelMachine(QemuSystemTest):
 
     timeout = 90
 
-    ASSET_IMAGE = Asset(
+    ASSET_IMAGE_LE = Asset(
         ('http://www.qemu-advent-calendar.org/2023/download/day13.tar.gz'),
         'b9b3d43c5dd79db88ada495cc6e0d1f591153fe41355e925d791fbf44de50c22')
 
-    def test_microblazeel_s3adsp1800(self):
+    def test_microblazeel_s3adsp1800_le(self):
         self.require_netdev('user')
         self.set_machine('petalogix-s3adsp1800')
-        file_path = self.ASSET_IMAGE.fetch()
+        file_path = self.ASSET_IMAGE_LE.fetch()
         archive_extract(file_path, self.workdir)
         self.vm.set_console()
         self.vm.add_args('-kernel', self.workdir + '/day13/xmaton.bin')
-- 
2.45.2

