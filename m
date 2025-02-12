Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp925771njb;
        Wed, 12 Feb 2025 03:27:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXiui7l+AmI8bCdyrp9XP6lGhopwKwLqsDa26YQMzkxxoP4kMaNPkDANNlEK2SsCn+9r2PN1vG7QFFB+Q==@linaro.org
X-Google-Smtp-Source: AGHT+IECisNEa21ixZUxlQeetRmgG9cbfZEhKdMCyP17JzOpjreathWjEtgsSErffqhoiT17urpX
X-Received: by 2002:ac8:590b:0:b0:467:83f1:71d9 with SMTP id d75a77b69052e-471afc51991mr44023301cf.0.1739359644785;
        Wed, 12 Feb 2025 03:27:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739359644; cv=none;
        d=google.com; s=arc-20240605;
        b=cqhpkt0mFa2f8jM7IxHrYD1jzrICRwSh/WTGDyc1oSIQ4tVXQ8rOtV4U7rmkjKXVXY
         CBw14XB/rnOowWNg+6em0tI8+xVFzau7p/VKBDZ8uUqbVcvKEOUb4y3I2Gg4mJacxEte
         H94XZ5jf5nH1xLA/ZWkup1cFOyMDlJZ29ctwztCqRvspdcI8bUZU5dKwxHInYfujRyuX
         Y1TOphAHxR1Do2UGgugIPt7uhm0g7Gl+Pi0X19FOJxZjpHBts/4q5rdb0zJEVSLmwGVG
         0yUSp+WL1/J2pBhLV41ho5ZqQTooHWtb4A2BnCLaVXfh9RG2CLHSiOXrcyBWapmxEh8l
         Ptaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=F/5SvI1nZOETAaAlXL8oDs7D5HNrYsWDKjSPJuAoVFY=;
        fh=1bRVhBZ3pO54gn2+SDQDz5Rn/eMCiQ3AZRjPzOuV5yQ=;
        b=k2adcaj3SaxFkOBJ8i8prucjz4VEgtG2c9oZcji4JyfGYwXqowOQbxcUX4kRYMZ96U
         Y24jLM4ZznsxMojHd6CpAm+kfXIxcKwQa4cSJZLi6Fxlry0N8arnr5M6l2dHOs839KLs
         2hYPpfIMIH+duYORl5EWZ6mX1bfe22jUav7YpLupfJ4bK2XVOcEe0I40zeR3WBfogZAj
         GqEkFPHV+Lw7NrdVpzEEKotWsTes7z/esAipd2PdAq+ZXvsTO6QNXmS5fapYnRC/eOXK
         kmqgUEZpALpPUo9f+GTS7NfhbNzyug624feGvsfRYwBGgR95htA9159wIB14fMvM3SYJ
         OBKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JpWyRONX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4717d71029csi84500521cf.607.2025.02.12.03.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 03:27:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JpWyRONX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiArV-0006Kg-2X; Wed, 12 Feb 2025 06:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArS-0006Iv-3K
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:24:58 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArP-0004cl-VA
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:24:57 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe82so410808f8f.0
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 03:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739359494; x=1739964294; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F/5SvI1nZOETAaAlXL8oDs7D5HNrYsWDKjSPJuAoVFY=;
 b=JpWyRONXR10L1q5TXKiHCGj/zhqn4YTScOazJYL5vZFa1eAUWnTkamZEvtf+T7cEvl
 uZXvagF2F3ZKjNxrBMV206fZM2KD2ug7520QBr6+WTmqXpQdMxjFFuVNOdlSXX7SDZZ3
 FnMkJpO4TsbfkKMff5DnfGNjZQPCi0W6epgPBflXTaKs1ggLSeVxIkERofi6ObEI6a9K
 Y3JraFm1ZYKDN+HwW7C9flqj3hmFVjXWeDkiIrLw91Ioc7ng0e0qCIOyJPDEIOS/K8Az
 BDavkbQmCv0rMRTENjyLMJ+tqvgP5X+eI26Ams3UZEAygzh42UtsaLQFva/QkWT40otJ
 /bGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739359494; x=1739964294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F/5SvI1nZOETAaAlXL8oDs7D5HNrYsWDKjSPJuAoVFY=;
 b=RgagpCKDLNGEOOz8Z/NTRyEwE75V3RTOL03+ityBArAF4jM04/fBqsxYZXfau+hLwV
 HPFTvR9WndmYLucyWqCKB6z7KJR/dEOFfgqAHH5JnrgEmAQos9d3IBrslvI7lsp2+mqN
 cHLks+PqdX5O/5qHU6FqCJYXX04w56fMsF/1Q3o4HGrdPioQA19A9cyJ6CcOlm0pEuRU
 JcS8AXjn7n4qvP50BXDba3z3hcCI563ov5edW24WdMM008fa5ZL+EuR5ZU23hqXRAFBT
 s+jnpRtb0l7aZHB8M7XWicAYdmrhjalBL4f+jSvgeD01TNq6iPtUgKHUqMIX/xfGHajA
 Potw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ7iMElXN/0iXOKRIcPHFfSCZIDDaQ1G9eBwiBenWJ/iKn/qTT6Fk56Wv2rwZyDc/bpgA2Tdt/mg==@nongnu.org
X-Gm-Message-State: AOJu0Yyj5puNNcnm2p38BUIx9xlmuJWydIE5/KilBysQUZGccTvMhAxs
 n1tmUwI66w/Jc9ma5JFNro0Z5U+7dOgsbWr35IWETbluZusLSswtChNhx817D00=
X-Gm-Gg: ASbGncsOysjCxw5qhnwG9U+iM9Ez2WeLJkbNPJ9oPEMSrbbJxUym/H4upuBfGvoQjd9
 dTb+BZSqKWnPLUV91r6fTj0tp8CIWe8VXlSTWEiAwS+CRyjLfVF4PRR9lyEOhvGXyQkyhAdOQXe
 UsSR1YGSWVRWrziCpHpC8DtfY6kwlCazJ6cpgYvd3a77968lS2HOQH7l0jJtrI4+RQFTx9Ed8gb
 NrKMAALBujhRngPPOjGh1GHNGlD8LIU2Oht9li4P39kWqHZGsAzd4bVtugNORjVbpIL0VanusiX
 FtVWwlcSPwWNwOOOUmtNsPK6IVhgR4lpRXDlc9S7lGjSCB4FmtSF1AAZ6X9GZrVOVw==
X-Received: by 2002:a5d:4c88:0:b0:38d:d93b:5899 with SMTP id
 ffacd0b85a97d-38dea266daamr1950525f8f.21.1739359494210; 
 Wed, 12 Feb 2025 03:24:54 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc9ef8ac6sm14517102f8f.27.2025.02.12.03.24.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:24:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 08/11] tests/functional: Explicit endianness of microblaze
 assets
Date: Wed, 12 Feb 2025 12:24:10 +0100
Message-ID: <20250212112413.37553-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212112413.37553-1-philmd@linaro.org>
References: <20250212112413.37553-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: onUOVAgwlkbT

The archive used in test_microblaze_s3adsp1800.py (testing a
big-endian target) contains a big-endian kernel. Rename using
the _BE suffix.

Similarly, the archive in test_microblazeel_s3adsp1800 (testing
a little-endian target) contains a little-endian kernel. Rename
using _LE suffix.

These changes will help when adding cross-endian kernel tests.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20250206131052.30207-13-philmd@linaro.org>
---
 tests/functional/test_microblaze_s3adsp1800.py   | 6 +++---
 tests/functional/test_microblazeel_s3adsp1800.py | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/functional/test_microblaze_s3adsp1800.py b/tests/functional/test_microblaze_s3adsp1800.py
index 2c4464bd05a..fac364b1ea9 100755
--- a/tests/functional/test_microblaze_s3adsp1800.py
+++ b/tests/functional/test_microblaze_s3adsp1800.py
@@ -15,14 +15,14 @@ class MicroblazeMachine(QemuSystemTest):
 
     timeout = 90
 
-    ASSET_IMAGE = Asset(
+    ASSET_IMAGE_BE = Asset(
         ('https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/'
          'day17.tar.xz'),
         '3ba7439dfbea7af4876662c97f8e1f0cdad9231fc166e4861d17042489270057')
 
-    def test_microblaze_s3adsp1800(self):
+    def test_microblaze_s3adsp1800_be(self):
         self.set_machine('petalogix-s3adsp1800')
-        self.archive_extract(self.ASSET_IMAGE)
+        self.archive_extract(self.ASSET_IMAGE_BE)
         self.vm.set_console()
         self.vm.add_args('-kernel',
                          self.scratch_file('day17', 'ballerina.bin'))
diff --git a/tests/functional/test_microblazeel_s3adsp1800.py b/tests/functional/test_microblazeel_s3adsp1800.py
index 5bf94d88dd8..ccebf5c2ce1 100755
--- a/tests/functional/test_microblazeel_s3adsp1800.py
+++ b/tests/functional/test_microblazeel_s3adsp1800.py
@@ -17,15 +17,15 @@ class MicroblazeelMachine(QemuSystemTest):
 
     timeout = 90
 
-    ASSET_IMAGE = Asset(
+    ASSET_IMAGE_LE = Asset(
         ('https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/'
          'day05.tar.xz'),
         'b9b3d43c5dd79db88ada495cc6e0d1f591153fe41355e925d791fbf44de50c22')
 
-    def test_microblazeel_s3adsp1800(self):
+    def test_microblazeel_s3adsp1800_le(self):
         self.require_netdev('user')
         self.set_machine('petalogix-s3adsp1800')
-        self.archive_extract(self.ASSET_IMAGE)
+        self.archive_extract(self.ASSET_IMAGE_LE)
         self.vm.set_console()
         self.vm.add_args('-kernel', self.scratch_file('day13', 'xmaton.bin'))
         tftproot = self.scratch_file('day13')
-- 
2.47.1

