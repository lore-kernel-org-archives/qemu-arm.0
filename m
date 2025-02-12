Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp925439njb;
        Wed, 12 Feb 2025 03:26:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUe5gmso3aoQN7OFIKHO8dAhpPNzmbZq06fPHCYXC1GL1CJmFQJzwz9X2+GEvGBrVYBF+A0E1Ii2ySzSg==@linaro.org
X-Google-Smtp-Source: AGHT+IGSHJ2Kp37VISkIPTgNhFbMNkhdip7kUtM/iZQAW6Hj9aTmbBRTDAZwyF9vZauD8dZSOzFq
X-Received: by 2002:a05:6214:2489:b0:6e1:c77d:db8f with SMTP id 6a1803df08f44-6e46edb4c39mr40336856d6.41.1739359603884;
        Wed, 12 Feb 2025 03:26:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739359603; cv=none;
        d=google.com; s=arc-20240605;
        b=koojTXB77/UFo+0DZwE/zRekyRV8TQb8mqe6kGtakVwAIJNUfOXwXsYdKkgJeDK14B
         Z1WtcM7cg8baYmCT1YbycKB6ettDydWAK+1dLObH5E8R2sG6rVJ7k+LOppa4c3TeqbWt
         oRWy6CllCIgPMJW7e+f1Y4Am9vvUJxmp8w653+VQixtgixA/w7CknPzg4Kupds9gDXuE
         uzHDJxnImbrkFecbkrTLwE/O74ioWj4Y5QSFudCcPkODxKqqNd/nkMdWeL2isrQwt6Vn
         CP6iwGrgNtDqAKR00A2RTOSxILMuNrUj38l3QUjY/+OdISs8tW8jEFzkMyZ+dlfe6NsG
         Mi7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zk8npvpvvWsz3fYv0R1o0ULJq8hATZnhrjaHmw2ltQw=;
        fh=b/cm5YKpZSpU9aS7BUnl7Q3KJpdY2/K/eOCVWM9TJ7k=;
        b=VBjYgSb0itMB0hYg6GrqHJ3x9nLnMLrOxDVPKZm0AVaAqo3eNEcibCq70sWY/nYFzM
         TdGvpFf6kSOqAWKLbGiBbYGT3RT+/TXIcQys4cxpVhhQLVMOEgksPUBvY31ta4jED66l
         jSJB45y9OmsYcLmwgJlslOv8hvUb+91cSZo3QPvHEDFYTIPp5A/iolcnXv+yVLUru6Ak
         r+4ZNdlvZsxbWSvRQEvEiE2vXJjapSOgkiBGP+oC6N7jTUXMxc6+IovO+ZvMYoEHtNOv
         AH+EwFh12oB09I2FGF8tsZLeTlDiidcB3VlwQwMhDvy9cmgYDsGUPeJ48pcTIhMwakWG
         Ku5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CNognFm6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e456984ce0si82180126d6.258.2025.02.12.03.26.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 03:26:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CNognFm6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiAsL-0007MG-8L; Wed, 12 Feb 2025 06:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArk-0006bJ-9m
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:25:20 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiAre-0004lr-NK
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:25:15 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4394a823036so25675035e9.0
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 03:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739359504; x=1739964304; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zk8npvpvvWsz3fYv0R1o0ULJq8hATZnhrjaHmw2ltQw=;
 b=CNognFm6sFgAeRIj5QsEIEylGLc40lgtPRNoML62/UHsy7Va/awfHlki0SHl8Jo8xi
 iMYz6oPhlf5xILDicEnN8jSQK6ZpqxWnusPP3v71VV8sT43Ba/fb5wijThZsZli6H0Ey
 vG5Jp6Gat+HjyywFuh8W456ovYgZCa3Ml8my8ryBDYN/vqPO4wbspECFPBe+yk1b8zD5
 21qGrLCZTnw0zH2UQ0OK93NNAWEDP87H0/V4Gb0TsD+jOKXZs/IRyVM+TRW0DKif+zxi
 OANMb8eT4t2HlIHgBbKixMM326+VyxN3261ceEhlk0SgO8fhrS4NRT18XrQP+FeplGCB
 SV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739359504; x=1739964304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zk8npvpvvWsz3fYv0R1o0ULJq8hATZnhrjaHmw2ltQw=;
 b=XJItUrUpZjAMzB+grpBsjjbX4JWYjog/ThqtubyP2xq7UWR2Xekho4ZPVfaQr7+828
 KPV0YAShJT1Ew2f9AymrcQh0O/wm9vOx5qD8C6WlsOR8uBNgZXFIzwc+hhMY/GMkAdr8
 ISYWlShavm8Mkt/IJo8qFoL13WVzCLcYBKtLr4j3/0fN0XZbuad2qCkdIF2lK6ANJZ4R
 BvXvc3kDgSv67BqC2EwrSxkFpaKtRY6LLS46oOTfO6laZUl3LVgeEqvB6CQevrz+PJ0L
 LTXgVyN8ACsjVyeQ4DGKzntOcqdgaSaAONUeGNFEt/w7aCtj7EarwQkzz1zVs+zWl5m2
 2k+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgmNGDhKD9YMA+JTQfHsMBvbmWxXk4rvAXr4Qyc7pJH/aplDvklblQG7KIsX2m/Q5gPfd8rfv4GA==@nongnu.org
X-Gm-Message-State: AOJu0YzXK8mgwy0xY7jZYgBlDm3N+EUTnRg4l8nqkn/vDAE3DOnM2xSL
 lPDph2UnkXNSKiVT7vtMxbgcM6OrKOtVRZd0hThH808aV9i3obJUBSnisQBHe7A=
X-Gm-Gg: ASbGncs5QLpKEh5SAn3vhQul5yoMkSjzENe4g9ed6lEdiF2Nep9IfxQ9UtQyepzYue3
 tzH8MuNVFiE7PgV8OMzk0WtoIEydpEtqjXY0d2FaCNR2EmECvJU9W886cu7HNztWL5aob/pMAeF
 LNpzagzUEBzFKDt5IWM6+9RPPlFRAoy4w+NqfHSwcnglMxlCNq46AAjRtoqYX6RO6TAwvR7tyKN
 Qzxp2YDfxDPKEEEzOP9Mpmp9fqX1EJpfAgEDt6jqDBHV51lUxIfgJnCMbb8VYN+lkKkf8O8SIO0
 uUCLlWIhFuOxgq3AgisetyQlpPTFIRsa+1NyZK/9YeX4z3uSnSmXvINPgDnpuLWTpg==
X-Received: by 2002:a5d:648b:0:b0:38d:c2ef:e291 with SMTP id
 ffacd0b85a97d-38dea2e93ffmr2618859f8f.39.1739359503780; 
 Wed, 12 Feb 2025 03:25:03 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f2103100csm483962f8f.2.2025.02.12.03.25.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:25:03 -0800 (PST)
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
Subject: [PATCH v6 10/11] tests/functional: Remove sleep() kludges from
 microblaze tests
Date: Wed, 12 Feb 2025 12:24:12 +0100
Message-ID: <20250212112413.37553-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212112413.37553-1-philmd@linaro.org>
References: <20250212112413.37553-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: g2fvC1GxIDzF

Commit f0ec14c78c4 ("tests/avocado: Fix console data loss") fixed
QEMUMachine's problem with console, we don't need to use the sleep()
kludges.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20250206131052.30207-15-philmd@linaro.org>
---
 tests/functional/test_microblazeel_s3adsp1800.py | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/functional/test_microblazeel_s3adsp1800.py b/tests/functional/test_microblazeel_s3adsp1800.py
index 1f0812eec63..d50b98342d7 100755
--- a/tests/functional/test_microblazeel_s3adsp1800.py
+++ b/tests/functional/test_microblazeel_s3adsp1800.py
@@ -7,8 +7,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later. See the COPYING file in the top-level directory.
 
-import time
-from qemu_test import exec_command, exec_command_and_wait_for_pattern
+from qemu_test import exec_command_and_wait_for_pattern
 from qemu_test import QemuSystemTest, Asset
 from qemu_test import wait_for_console_pattern
 
@@ -32,9 +31,8 @@ def do_xmaton_le_test(self, machine):
         self.vm.add_args('-nic', f'user,tftp={tftproot}')
         self.vm.launch()
         wait_for_console_pattern(self, 'QEMU Advent Calendar 2023')
-        time.sleep(0.1)
-        exec_command(self, 'root')
-        time.sleep(0.1)
+        wait_for_console_pattern(self, 'buildroot login:')
+        exec_command_and_wait_for_pattern(self, 'root', '#')
         exec_command_and_wait_for_pattern(self,
                 'tftp -g -r xmaton.png 10.0.2.2 ; md5sum xmaton.png',
                 '821cd3cab8efd16ad6ee5acc3642a8ea')
-- 
2.47.1

