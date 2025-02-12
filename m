Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp964338njb;
        Wed, 12 Feb 2025 04:39:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUdnkBbUZ+/c9Vh7ohAfsmAA5OKaPqpzdQ5fadDWdK688tLnguc+DdUevEKSh5HT3E2yC9urWJYxH7CNA==@linaro.org
X-Google-Smtp-Source: AGHT+IFGx+CIJ/S5ZeNONQPrywISrempyoDTBJz4yEOwPY/3BLOj+ZN9O3yPpHBoFryVLAEI7Lwg
X-Received: by 2002:ac8:5a0c:0:b0:471:9b3f:2464 with SMTP id d75a77b69052e-471afe5fa77mr47236331cf.31.1739363992360;
        Wed, 12 Feb 2025 04:39:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739363992; cv=none;
        d=google.com; s=arc-20240605;
        b=FEPOP7WnIXZt2HB6KGomxXuUmUBl2dcG53pZtdIn5L4/LUYuaeOFUlTxCbqsO4oBd3
         lIta9FzsL/bqAymhkD/kSBaCZZS+/r2mWjByvphgVPiVzvD+2qBaqAURTfLRQ2riaMjV
         9LXe4kepKuXdkyq2AuU+o6pOAj+tCOyrZhvswgIY2xQ7NjAXX/tRfC4UXG3Qx4Aae+xr
         NtFe6SZgWgf5gPkw3AKKeyZ1JBPHSB0xO9BRuwxMv/GTrhEtMaT/JVhCDKHQJ5BrhD2F
         ydUMl2vLj70H8XgdbNbzi5CEUgX3MperKnHWkZEVNpBiVesSkmEWbm6j5tuDdVHQN4xr
         REhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=03rJTTNBd3cp6/LXAuK3umtC787I9nHxNQm0tFuSG4M=;
        fh=7B9v73enKv/XffLzvijsJmI5SIsKfXI3VFiYq+hmuMI=;
        b=GBaJbPdHCQp9YKx9ho3pwKh4DLYtyGVLeRFl+hyjGN334yWpyNM0bnCwQMOgF4IHgv
         nx4RWjVQwqCcKa/ouOV7jZUFCGp6/fa3aApvSyJBbOKBnmX8oagkTCDk3L/apvd8VXV/
         qygmGj0rD6EMeQlHXOgWc3UexWl69w5hdNCpvSHzOid2YYIwJUlCR7ibLRore2cBsoCP
         PJT5pmjarAfbOVlErtBl+oWkx5DX3iCRAktKbd4Ql2Rpaxn3pcADxHBsnzbGwPxb/iKO
         R3qSiE8e1CYaDCik6j8fNmOOB5c7REu+RiceV2OtPOJy72KXinyy4wEPpZ8+TuJjZa6l
         0F7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CKvdeYlw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4718ccd7bbesi68750311cf.376.2025.02.12.04.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 04:39:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CKvdeYlw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiC1g-0005wY-Q2; Wed, 12 Feb 2025 07:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiC0B-0003rc-4n
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 07:38:03 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiC07-0000dB-7L
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 07:38:01 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38dcae0d6dcso3057502f8f.1
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 04:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739363861; x=1739968661; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=03rJTTNBd3cp6/LXAuK3umtC787I9nHxNQm0tFuSG4M=;
 b=CKvdeYlwJMI2BNNu3xsP4O4azVu0WKlyUgLaFK6GE9iWxXOPt0MtM4m8qloKltuVK9
 u9/b26kAFb0U2pFs7PKFqKFK4tRqPFHutdzVbjGVmNFEmt9yfJgbMwkzJifwnkJmYw9l
 HWDoC67JJt6tMSTmuF1lZqk+HTZliVhnHwAaW2Q0hi01FtA9KKweU4MJj93Dla6fUS1c
 WszeussVKZIDrHiRn5i6SsW/8uf/+Z3XrKKceopaiHaqUxQNqA+GametzC3b5yRx17Io
 6888Jc8QG2wrmTbHtrIeemqwfv2Bnm6qQD+YSROMyhKtCoX4YKJKfXzvVuycKk5hpMAj
 2cQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739363861; x=1739968661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=03rJTTNBd3cp6/LXAuK3umtC787I9nHxNQm0tFuSG4M=;
 b=V9LM5uYGSSV9+6PAZABjw3PJMP1a2tPQAcHQYn9wDAukvHB36TBnjuvA9X4KwfCcAY
 43Mi+2Q1eaIGFtB5JgsF4I7wbVe4Adm6fVqqrM7ZKTaTETicQ7W7a8APiMycFaONUFUL
 HpImL+5P8Qv/wqZWZc4xWVngIJ/QTGFLD86a/gIGPiAKII44ulUW8Mr0HFPnyuyct1OJ
 nza2pLU/M6MLRzcCKIVIM6w90IQ150BaY2MbZF+lV87PJn7PxcsLgQz9eeigWiOXKM9e
 qGTbj8JxRpAVDzxIncRC9DzRlnie6jsQBMwPSCMoMKgHJKpb8vuRQWBF/b5Sq9gvEzFE
 4Kaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+jwCi/wHU3EjH/R/C2WJSAPxgLMnHc3zwY/H3YPrN706Xi4iVk1YE7VarkR6iavbxhk+miCMmWw==@nongnu.org
X-Gm-Message-State: AOJu0YxTdw0KY4oSf0h5WfBDyPyVpO/VI/52zsLE16Sh79uu2zzwO854
 U386Po0apssC/e3zwO0qJYPiZ6k2GG07lXJYj/FqG+DK+/NWVY9aSX7rZs6D68CSEgYnw1DdJbe
 CgUU=
X-Gm-Gg: ASbGncvrJSIaL39X7LssnVChMlc6i5fSa/z2vatx80y8PCpUaPnwzG8w7D8lTMDScVp
 9tMCyuAUz85hmWAofWTLo6rhquDiSxkq85HFufxPZaZr0LYRhhrVm/RUF3YSPyNgtamrIpStNuS
 TXT9q80dxnvl6uhht+odiIdVpvRL8e+zBCPQklH7J5+tlVKxlk55OaCbHJNS+GJsz7dnPobzPjf
 0xfD2lHec1rrkxYX8bwzY7n9ihTUl2Dn057MxkW3sbfag0CD88Ms21T/e3Le8IqEec218ZSoQJQ
 btIorPDacckkr9bAso296O9MasXCEVFEMj6VeWxykL5O1aZ+eL3KKkoEdYnZBiFkyg==
X-Received: by 2002:a05:6000:1f8f:b0:38d:cdac:fc02 with SMTP id
 ffacd0b85a97d-38dea256d2fmr2139711f8f.4.1739363860684; 
 Wed, 12 Feb 2025 04:37:40 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcaf3e4bcsm14359226f8f.41.2025.02.12.04.37.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 04:37:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 08/10] tests/functional: Allow microblaze tests to take a
 machine name argument
Date: Wed, 12 Feb 2025 13:36:57 +0100
Message-ID: <20250212123659.52764-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212123659.52764-1-philmd@linaro.org>
References: <20250212123659.52764-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: 0LpGGziVN1CM

Make microblaze tests a bit more generic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20250206131052.30207-14-philmd@linaro.org>
---
 tests/functional/test_microblaze_s3adsp1800.py   | 7 +++++--
 tests/functional/test_microblazeel_s3adsp1800.py | 7 +++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_microblaze_s3adsp1800.py b/tests/functional/test_microblaze_s3adsp1800.py
index fac364b1ea9..c4226f49cf3 100755
--- a/tests/functional/test_microblaze_s3adsp1800.py
+++ b/tests/functional/test_microblaze_s3adsp1800.py
@@ -20,8 +20,8 @@ class MicroblazeMachine(QemuSystemTest):
          'day17.tar.xz'),
         '3ba7439dfbea7af4876662c97f8e1f0cdad9231fc166e4861d17042489270057')
 
-    def test_microblaze_s3adsp1800_be(self):
-        self.set_machine('petalogix-s3adsp1800')
+    def do_ballerina_be_test(self, machine):
+        self.set_machine(machine)
         self.archive_extract(self.ASSET_IMAGE_BE)
         self.vm.set_console()
         self.vm.add_args('-kernel',
@@ -34,5 +34,8 @@ def test_microblaze_s3adsp1800_be(self):
         # message, that's why we don't test for a later string here. This
         # needs some investigation by a microblaze wizard one day...
 
+    def test_microblaze_s3adsp1800_legacy_be(self):
+        self.do_ballerina_be_test('petalogix-s3adsp1800')
+
 if __name__ == '__main__':
     QemuSystemTest.main()
diff --git a/tests/functional/test_microblazeel_s3adsp1800.py b/tests/functional/test_microblazeel_s3adsp1800.py
index 5d353dba5d2..715ef3f79ac 100755
--- a/tests/functional/test_microblazeel_s3adsp1800.py
+++ b/tests/functional/test_microblazeel_s3adsp1800.py
@@ -21,9 +21,9 @@ class MicroblazeelMachine(QemuSystemTest):
         ('http://www.qemu-advent-calendar.org/2023/download/day13.tar.gz'),
         'b9b3d43c5dd79db88ada495cc6e0d1f591153fe41355e925d791fbf44de50c22')
 
-    def test_microblazeel_s3adsp1800_le(self):
+    def do_xmaton_le_test(self, machine):
         self.require_netdev('user')
-        self.set_machine('petalogix-s3adsp1800')
+        self.set_machine(machine)
         self.archive_extract(self.ASSET_IMAGE_LE)
         self.vm.set_console()
         self.vm.add_args('-kernel', self.scratch_file('day13', 'xmaton.bin'))
@@ -38,5 +38,8 @@ def test_microblazeel_s3adsp1800_le(self):
                 'tftp -g -r xmaton.png 10.0.2.2 ; md5sum xmaton.png',
                 '821cd3cab8efd16ad6ee5acc3642a8ea')
 
+    def test_microblaze_s3adsp1800_legacy_le(self):
+        self.do_xmaton_le_test('petalogix-s3adsp1800')
+
 if __name__ == '__main__':
     QemuSystemTest.main()
-- 
2.47.1

