Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1524824njb;
        Thu, 6 Feb 2025 05:13:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWk6g8aMXMu7t8/2ajIus/29DhCM3KeQrAEscwazoXG/p4ApOjpj3Yo3fgzerR9SRkbVCusIZ651uunaQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFmxxsX4Ta8mmsoZDua6n1+ZI8vAbtXa6NWMDkhqoug6biW7+m7jXvEnycNfdlFCaZ4uS32
X-Received: by 2002:a05:622a:4d04:b0:463:64b2:2e0d with SMTP id d75a77b69052e-4702829e98bmr89722391cf.40.1738847610566;
        Thu, 06 Feb 2025 05:13:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738847610; cv=none;
        d=google.com; s=arc-20240605;
        b=E1tg3owBl6V0zxrKTncjFLc1fePiFTPXAWt4KmXBiuHdi9PBIClI+VGL0cHUzZMJZV
         RmvEPbEOS/149ugjZvwkRpOhVn/eh85jK8K7tQ7W7B9TOfBAQkCABvf+n7+n936bgLvy
         jb33dXMfnE6eN//uQ/a/hKDKbw+7gzH7uNJVXPPbrnv90o9kjeks+/TZi1JSuy+W7kPg
         6a2dLOgfnFnhKQ6fltSvg1Gr3zlHJyfJsNYxf2KddMFW6Qo9HXqxaUp8L9fa7O91Lhma
         AA16Yu3fFr1A4SNLytu3UyjyUbToxP2y5aExLyNlzeDuIMz0YlinwkjmAmk5dA4VXWWQ
         BcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2lrz/Z9U2Uf5jpDeQ6Q5rMzyggw9C9+W1C5t50i9qAk=;
        fh=7NsVx5R+L140HvZ0es4udPXCD2KdHoHcZm3kdyNBbE4=;
        b=S9jbr6YbyNeUaXRg6Ph4o1qCyYIKIYDAzglOV4Vdd229SGSi/Q+43K6F6F2opPZ2l+
         2qzTgu6S6ZHE1+9s4T4fQsi/cXwxbcxIj8k8enhAr8ev3tfOcBaZz/0R+Y3NRVp7+1m2
         As6F/EYw5XTMIv477RGTvNYgOGLJNf7+M4q87mPB4pqTz3196QndcNuQ7jOGkQB8CObj
         0caTMWsnUWj+8eFC8f5UssGrXnuyNEshUlBqFWRCb+MOPiZu1o60/tGjqDKQqbjmFXk1
         alGixK8eUW0/4yvzTPpxjn+mRIz2/1+SEcsFswtf/v/sg7h1SqQeqDQfPjXcsQn8NaXW
         SRLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GQwzIgtA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153b6f7d4si10632131cf.212.2025.02.06.05.13.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 05:13:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GQwzIgtA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg1fm-0005w1-SN; Thu, 06 Feb 2025 08:12:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fj-0005qa-2X
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:11:59 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fh-0008EH-0z
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:11:58 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38daa53a296so398111f8f.3
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 05:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738847515; x=1739452315; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2lrz/Z9U2Uf5jpDeQ6Q5rMzyggw9C9+W1C5t50i9qAk=;
 b=GQwzIgtAAYkXR04+4dUt94hxV2Ur+ZcAsEoU8gReSCvMMGenXDFOUozVlWo1ZM0dNK
 Q4ITZ10nfcLSjyIQ8AQN/ODeq3DgpyoQGYLBQOtAW3wzT9Z3UX+Z66/vSStRb00TsKeq
 DOlFWX8pEGxtqLYhpt9tuKJISwqXq+uXSj59sOaQo1llZglplllj5DPaSow2UcVbb1gK
 lhV8lV8KtDti46kAZIRV+2Aqmts4tWm4Elmkv9A/kxIGVwUnI05M56hHNEMpGNHYDizU
 kP0fiIBfLTMpMmr3LLZ/64HrQg8lCyqTHGRlPv4Z/2tzFjrRSXOOElz7f+WeOGZbABn4
 Sh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738847515; x=1739452315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2lrz/Z9U2Uf5jpDeQ6Q5rMzyggw9C9+W1C5t50i9qAk=;
 b=tC/SousKxvLRU6e/Ta6VnEsiu0UxJQ1WF3rTggOzZ3dwQJ6rRgl3P3nAIOepwk0geC
 F9XlV+JEUR35yBNpkezmLNl1++7DoZEWMRYT+h4mQ9S75wZCqTKCD5pqLKe+0PlNunAY
 cUub6pDp3hNWUgDIZMK7XJ4TFPjgWEqzAVJatSxrMwW0NiLAgL3Ydv/gdmEuM8RxKnoa
 j/1yYf0FIw0SYTXd7/S2xi0U81q9dPgssdy6DUPqj4Fg80erZSlSFPj8y4qBMjW0paOb
 zmQh66Z4+i+/EPV46zlkJ4b1beAJBKfsIdDVXGGaMuSWajgh2AhMO0dtKBKxNEiArpIk
 5Bhw==
X-Gm-Message-State: AOJu0YwV6XbVgaSd/9vj9XMn4pikRuTvOPUi4gUVlYo1pjCBvIZEhOD8
 ZxY0WqKmrdCjFsi9AtHSF2Akr2uCx1lfoMUVsaE1HjDrMfCFhII5iya2Kgs4tOs=
X-Gm-Gg: ASbGncvqEGoBhOat+WaJ6v2GyWGufYeEFwgxncgGUGXCbh3xH00v7Gig5On8x7rnD6J
 8Dhv0tqhZZ42fvKeqiHZ1NFRjt4u89T4E5IIqmafsuKs3SFAa72HUy5oKApGQiFPj0NZVxu8AEu
 89HlhH8/eC40AYFNC8Qt6Y5n7RkEVya4jFdeG9AFf5gHf95e1p4YQNq3LspUMJ0UE4vMYlgfieW
 WNrJUJd4fUFXrFmRfyHciZO+v3zApG7y4yJsttRi4f2LxMGkF4D+gMermuEpbuB2yEeZeLkzxvY
 0nsfabUbAc1aRXEZo0oUDnroyeCfN7qrhF11/L+3MU8t3DpRE3S6628DpHWH+G/j5g==
X-Received: by 2002:adf:f342:0:b0:382:51ae:7569 with SMTP id
 ffacd0b85a97d-38db48a9824mr4189755f8f.18.1738847515103; 
 Thu, 06 Feb 2025 05:11:55 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf4438sm56023825e9.25.2025.02.06.05.11.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 06 Feb 2025 05:11:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 12/16] tests/functional: Explicit endianness of microblaze
 assets
Date: Thu,  6 Feb 2025 14:10:48 +0100
Message-ID: <20250206131052.30207-13-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206131052.30207-1-philmd@linaro.org>
References: <20250206131052.30207-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: 2533W0susn5V

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
index c382afe6bfa..5d353dba5d2 100755
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
-        self.archive_extract(self.ASSET_IMAGE)
+        self.archive_extract(self.ASSET_IMAGE_LE)
         self.vm.set_console()
         self.vm.add_args('-kernel', self.scratch_file('day13', 'xmaton.bin'))
         tftproot = self.scratch_file('day13')
-- 
2.47.1

