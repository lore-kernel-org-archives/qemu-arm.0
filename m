Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1524330njb;
        Thu, 6 Feb 2025 05:12:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUKXZ6pzmj2hd/d3XIeaUDIOlid47vk7JE/I6gWuACygavrrm+0AMITOymuNNrdsogxlplKy8doMruO4A==@linaro.org
X-Google-Smtp-Source: AGHT+IEnaPWaHiOYMMLTvzNJk2j9j91y89fNFo5qaQjq2N4TF64upEDQSk53ttbT7jjE2mypavOw
X-Received: by 2002:a05:6214:3198:b0:6dc:d101:2bb2 with SMTP id 6a1803df08f44-6e42f913696mr106081016d6.0.1738847563284;
        Thu, 06 Feb 2025 05:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738847563; cv=none;
        d=google.com; s=arc-20240605;
        b=g7uitRvqIOVuKLMCurJ1RDUWQzBmutB6bR+meHKQ/85xHgPd/KP9MwU3uRYGdg49HS
         z3ooOps6Ha7RYGQu9eF0EfqW1ZLh29foxN0XbaGuUU82+gmOmZrAx6HDRLu2xiy1jPz1
         9v5YHPe1ebBjRfEx3S1kc1Z9xwZAsV6qPfn6+b5zlfUHXxqkVoZXjd9e+DE9uD8DhAz2
         S4Bey8H1u0D5DzrZtBvmykYslsbXHGnTZNpqL52u2Yb75S7JVXuy9qFOwp/jh5H08Hgw
         AaUx1Aq0of5W2aRAvckk/ssEQTKpN9YmqT/JiCuUgPNEYlB37ridJPQNh4dtT3Vfesas
         p46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=x7ZKmE4pAQbvMAY+EPowVqHDnkT3H+9xilMSzO1l4tA=;
        fh=7NsVx5R+L140HvZ0es4udPXCD2KdHoHcZm3kdyNBbE4=;
        b=gBwN2vXgLVhTeCMiFLhPVkYs6FzcsE/AFnN3icbI6+t/ioD/vZILFW3hbcLn+RZE1u
         wQ0s1pwaHg4GMuBHuc7aoEG1wl94Bhpjeagvx97GGlGyAIFa/OvIgwfC3+szXKx6iXEc
         CsSxpXRrJg7BP5r55NVOk2wWyuLXgavhU18OxgZq1dVt+J0x1ZL6/Kasd2dqO6dqJCQu
         bTCgz0rI1bd194s2n0j5DRIgx5bO5osTVlBmAxMnvaMSRxP7eUHo8FuErwmrPGRL5d9/
         KANz+ZL0kc0BgI2rqIYgb9btg9lCx7Hx5/wfAhMHO/cK41ubgyswkTtLFNB+zdciDRy8
         pIyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cg8ZJB3Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43ba2c34dsi11804766d6.82.2025.02.06.05.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 05:12:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cg8ZJB3Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg1g1-00067a-2P; Thu, 06 Feb 2025 08:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fn-0005yG-RY
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:12:04 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fm-0008Fc-2Q
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:12:03 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so8816845e9.1
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 05:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738847520; x=1739452320; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x7ZKmE4pAQbvMAY+EPowVqHDnkT3H+9xilMSzO1l4tA=;
 b=Cg8ZJB3ZAbT1fnRhl+okfcm3D1zqZ6pGs+bX9A8bu+PgqDDL7QkRcDcwdz9aQB9uRl
 FmAaWRbu7ZC/uA6xgNeIQxzyEVNHNJJgVg9fM8tfhmbWn7O3nd4xNWvbFIZlG534bN8w
 LFrhA3rt1jCbX+rSbcRlQa03AVNQDhmb5idYQXdr8I9qQ8owGqjrI87IjfT3eqmGgx5q
 Ajyav9/OAWM9ODSdJDmOwqB5CjSe8uAfBXR4GD8NyZX2lB8eYkFS8i3Yx71ak5/j3J1K
 v/K35iSaBUEqPJYIzkTFP+HrBqKBnA+/CwpvI0Qgp4ia5ZxTefGlE8selObZbe3HAxcS
 zRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738847520; x=1739452320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x7ZKmE4pAQbvMAY+EPowVqHDnkT3H+9xilMSzO1l4tA=;
 b=Mm8NVvH9MP8fLL3WaUE1lOLBM691comylyctV1ewTaAI3wPQItrQnbEsVi1e5Cq4VW
 yATWzElBhsUuIB/VhSD33hj/prQMXUv5JZ4+rx+JsPrGJK07GMWnnX7eTikJqQivIFqZ
 38Hs31cfL9bFtBnBDVWDGBffYMpvb0WFu9KAJ5EiKzT4ty9UXLHE5M25nPVbA++cJn1g
 VJuIh6mzzS36DMdiJj00V/FyQIoGCjQOEwHObY8l3U1c9utTI8VBkvpoYvkLORoU9Y1g
 JOz1spwPWmw8o0m/j4vnNUH3zNSy0NtrBd36Yhd6l1zdTNquvEFG/tNbu9AodPz9x4jC
 gzRQ==
X-Gm-Message-State: AOJu0YzARzJm1mU69Qi23yu3KotoIxL8vsm1JOxMeTwSEfZGqW3KFRxe
 OuEYDMJ1GRYqakYH9jWu15I4nRIGRyueArMlV2O9WqT0UVbmThojSJ5xBcoAj/Q=
X-Gm-Gg: ASbGncvRmxfRDUDk6xXgXAQEFYshgm1bJlxaUqAIBBdQ26KomcIcL5P4vaRs0+v5THy
 SJ67ND9HPBYbwYtLFiuGEuD8OxCI8cSheNNn1NXqK7oKPicqV0nzkzKzDmgF05lKgYxHL1zLVWj
 7MqqsURZMfl1anX1moAaNUzn+hX4GeNMB02yg1iecdtzT4mcY+Es4xhdmR08SUnUaPne2KYLwYl
 1zI6ni4jQlbyntFrD1ywrBYoXJ464uIVgCEz3JmsgFmxCxX5knBCLQpNgKhInIiaqnXgPDXqT/r
 bIrHtIDZtdy7Xw1SIHTfE2iLjzHdtdSHLSM9Ho67Tmqw04oZaOye7AveBav6CgLNZw==
X-Received: by 2002:a05:600c:3b0f:b0:434:e9ee:c2d with SMTP id
 5b1f17b1804b1-4390d56c256mr44772755e9.26.1738847519976; 
 Thu, 06 Feb 2025 05:11:59 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dfc8a4asm19220435e9.32.2025.02.06.05.11.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 06 Feb 2025 05:11:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 13/16] tests/functional: Allow microblaze tests to take a
 machine name argument
Date: Thu,  6 Feb 2025 14:10:49 +0100
Message-ID: <20250206131052.30207-14-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206131052.30207-1-philmd@linaro.org>
References: <20250206131052.30207-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: Ay71Ug8qpaVr

Make microblaze tests a bit more generic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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

