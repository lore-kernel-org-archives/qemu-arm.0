Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D681CA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 00:11:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur3kf-00040H-AV; Tue, 26 Aug 2025 20:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1ur3kd-0003zQ-LN
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 20:10:55 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1ur3ka-0007oD-6U
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 20:10:55 -0400
Received: by mail-pl1-x643.google.com with SMTP id
 d9443c01a7336-24622df0d95so38010065ad.2
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 17:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756253449; x=1756858249; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jBHUz3SuLSqqU/2ZexNeh2quDs8pmox9xIU2PVoduuM=;
 b=et4IEyykNOe/UEvSTRZJeT9GW9S49YoF31Mz/7qk2Dm7eqgK7bTwyFUU5lBW4FVddO
 /ArjdVLsu3yb+xXzULkW4jKTi0QEJQNoCY0cYlIo7rGJOzuTWzM0KLdwkHrE2ocaqk50
 KcviHUxgAGYsT8CQZLJSgRlOs/iTlY82Kp8aTBDROJ4NMhvf44PqtczO20IRrYNTwdUj
 7KQjNjtdeVJ9v+C9NKEBnF83cmRmDwpkQlGkbZ3SkHbNYv8/t0cgOyXP7wMRfcJ1Hvjg
 s8pnqOH0zQ4W31a9jYsAyCeyomDu1BsE3iqRUsVlhhZTFE6cm3f7sY5WU7b+biYfQ4j5
 TGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756253449; x=1756858249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jBHUz3SuLSqqU/2ZexNeh2quDs8pmox9xIU2PVoduuM=;
 b=n7zGEHeDx1s/J++rtMJM3gKOhEj5XEK110RYV1i7lxXvE4vxjorcPyHESGe5EDt4TL
 ure0CPdVrE0T+LKWsVjJeYXO2fI68M3ZHchtx8Ad+N/Hy2o/SZVwnnP67+wRVFoc3F6v
 tMVMhkKlijk/Up8nGDl7Ee4llo/7rLeakraces5AENbl+ULZ8gKtRdIzkZlxlEjou5pe
 wn+UGNZjEQgNexf93BjYH8+YS1Zwncrk0+I+m+mzq2FjJYceK6akBS7gUi6lxA8tFXOd
 mGTDqAX7vyP4vR+TWUjfMTy44mNey7lOMd9hvp9nsaRkhvp5T5QpLnRweWFKAiT9aEbA
 C/4A==
X-Gm-Message-State: AOJu0YzVsdoM9kNIRRkun2ttoaoio9aFfJFzSUSCjr21uVj+Gg9Yy+m1
 P3dgxUmp9UVAE/y09EQ/i70AweJ6qqhIymrYGAwLxn1uf+A4vZbU9KHSEk2AS4ciTKk=
X-Gm-Gg: ASbGncsfKzVUAgelqN7ePgOZoXvjrRPcEEe+ECxbuwRkIUzPIlAj2qJj9UgvwO+cL+c
 nYXNhV+qEXiRK2K7Gnm+kYchyELpVJvHsWto+yHk24RJvC+2yD16s0p7dAxAfCJfOcXHNofyv9+
 aKSJ94yr0ZBCwGFL7VXBS633ot8ydRe105zq/2NhLi0RjHS1GRv702NKZFEPaWCyQid1uUez/DW
 paI8aJjq1wGvaopuLm2cSvXPadifT1yVppWGkBcQhxZ6p7LzMpfU3c/D3LiJwaGnfhWBVCtUAE5
 TFlf5TkjRyZrCbirJa1LuccwSjiMA98mZB43zmxFqJ/1FQaRxxdEoxHXkjrTE+Eu7SK0xv9U2Jx
 w8Qp8LNGdluoc7BmeVpq/h1zO3rO8xMPeAQ4B+g==
X-Google-Smtp-Source: AGHT+IFPch2CscGnBJ7Sb4w0yVGbs7pmZXw70Q1rJ3R6gWBRhnWeBB2WUJIeQ/c0D2pAktsRwK/MuQ==
X-Received: by 2002:a17:902:d4c8:b0:246:96bf:c90b with SMTP id
 d9443c01a7336-24696bfd557mr169274585ad.29.1756253449167; 
 Tue, 26 Aug 2025 17:10:49 -0700 (PDT)
Received: from gromero0.. ([187.75.38.174]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24875471755sm24060245ad.54.2025.08.26.17.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 17:10:48 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	thuth@redhat.com
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH] tests/functional: Fix reverse_debugging asset precaching
Date: Wed, 27 Aug 2025 00:10:08 +0000
Message-Id: <20250827001008.22112-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x643.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This commit fixes the asset precaching in the reverse_debugging test on
aarch64.

QemuBaseTest.main() precaches assets (kernel, rootfs, DT blobs, etc.)
that are defined in variables with the ASSET_ prefix. This works because
it ultimately calls Asset.precache_test(), which relies on introspection
to locate these variables.

If an asset variable is not named with the ASSET_ prefix, precache_test
cannot find the asset and precaching silently fails. Hence, fix the
asset precaching by fixing the asset variable name.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/functional/test_aarch64_reverse_debug.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/functional/test_aarch64_reverse_debug.py b/tests/functional/test_aarch64_reverse_debug.py
index 58d4532835..8bc91ccfde 100755
--- a/tests/functional/test_aarch64_reverse_debug.py
+++ b/tests/functional/test_aarch64_reverse_debug.py
@@ -21,7 +21,7 @@ class ReverseDebugging_AArch64(ReverseDebugging):
 
     REG_PC = 32
 
-    KERNEL_ASSET = Asset(
+    ASSET_KERNEL = Asset(
         ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
          'releases/29/Everything/aarch64/os/images/pxeboot/vmlinuz'),
         '7e1430b81c26bdd0da025eeb8fbd77b5dc961da4364af26e771bd39f379cbbf7')
@@ -30,7 +30,7 @@ class ReverseDebugging_AArch64(ReverseDebugging):
     def test_aarch64_virt(self):
         self.set_machine('virt')
         self.cpu = 'cortex-a53'
-        kernel_path = self.KERNEL_ASSET.fetch()
+        kernel_path = self.ASSET_KERNEL.fetch()
         self.reverse_debugging(args=('-kernel', kernel_path))
 
 
-- 
2.34.1


