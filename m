Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69191CCFA1A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 17:20:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIs0P-0006eF-FF; Tue, 11 Nov 2025 12:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzt-0005d3-5G
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:38 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vIrzn-0003vs-BB
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:17:36 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b725ead5800so621166b.1
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 09:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762881450; x=1763486250; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BQS9YQGXlgeLOTl3xkA9NMzA8j1lAZ6Lk0RjehvJU9s=;
 b=fT+vpc8nju5Gyl67tm7Z6CemHcWWmwVEjQBws73mdvD3L/+Qjz744L4qORePi4F8o5
 +FcEUvdmnVfQwsLrvt/HxyW2Hi9o/ngtXppL/naMOpBwkHwgpJmJf+kjXmbEsSRqVhse
 9HD6CpZlOyDLuxZvZnMp9YjR1FdEZJrxrqCGb902nIfRe8PiFY/A7Pvkd66S6AQfOZCE
 YZA2Jz8D8dnNULPTPv24SOTL+tJAL1BAkL819puyAoRldJUOqZ0pH5okPKNCN67S43XA
 LiyB1VzWl2qSmtDQPwAvka4admiVJR5HBQBCWd1nxlPuOM91NJ1zCQdC52HaEzKBln1o
 svrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762881450; x=1763486250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BQS9YQGXlgeLOTl3xkA9NMzA8j1lAZ6Lk0RjehvJU9s=;
 b=xQ7VcJhbABrZ/TYrdG18YFutL7BRJjYe36uLtWWiczIQ3R8G9s5dlexCUZXDDMTOId
 /7lSUFJebwqIIVSiYqfHleWrDM0Zyd8IT9MoEo4FVN9wepIqKvII4OJ+zXf8PVfqwy5e
 XqnmvvKFdam2MYlg0cRmhpyBh1WSjZZFEf6nkuMI/AFn19G2Dom5CVNZ9QaMea7HVazh
 4D3YqQwvvm3miCcyN/tdhBkLZWbnimOkNq5t3lMXaTtqf9B+7RWEO4M4WaN4Tg+s88d/
 3Nr2Vte+XcAOJGDDXlyq6t2jsKFhLUxXcDRMIWCT3hx08mbucRfvXkSjq2e44ZkwRsjw
 1Ecw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjhzPN93nz5VHe2Um8s83D7EUjpWmc21YQFPqigiFPQg6BNIOgnAfyyiVVhCpnGIcCK2vuqvKvLQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywm9fwI+lkmYhhTOR9Peej86LQJB6iVhwms1bkj6TKQAm3Mjgja
 RY5SrSYsACoitmnPNGcHbIW/2UalorwZtNaOQlvfJoPWU7YeczDhzrZ6esLyfdUENeY=
X-Gm-Gg: ASbGncsFaQGHz37b4C6W81GltH2N+eKj48ve8wM44eamiQl8VqStQT8jiNjR6rGpe9W
 gJNgAoKecs8r5cGdwxm+cc2op8hS8dDqdSrGIheuOTfbxErEZuDRvzFuiLG8EmwmVK9uTFRnMiw
 CUerZ5C1h+OFUrS7AL3mO7oH4V9MAKHeE8CizX+1o8Ne3ccZdwUl9JHH54PYicBoYtbyqcXNiW8
 pPFpbGE7vCD4zjtcPT+m5/Ak1fvuMUSoGhy0AL6OVCXrt8pwkYNUb3/t4ft44+7tsRxYBzBIB/g
 fvXrbmUL1cL2AlG2m9/MaGUEHizqbBMrNlunZgYfxcrMhaOZyMiWSPiQ3JiKkNdqrxpqKnVPk+i
 BEhLaXsUnO0ZcKbVYylzFw5r6Iy1aWkEwZqEZUZ/H2wwYqiFal6dl//60yo9hHm8Yv9HhHzfWps
 p4NsxKBTUW8/fUXzTBwju94Q==
X-Google-Smtp-Source: AGHT+IGmR/ME3olvSM99X6DoR1JwsuLQOmDgc8wTfZ7holzl8IRHnHFVCVyVq8lk0Y8ZWbvqZT7lVg==
X-Received: by 2002:a17:906:794a:b0:b70:50f0:e6ae with SMTP id
 a640c23a62f3a-b72e049248bmr1277590766b.46.1762881449654; 
 Tue, 11 Nov 2025 09:17:29 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bfa11271sm1375799766b.66.2025.11.11.09.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 09:17:28 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4521F5FCBD;
 Tue, 11 Nov 2025 17:17:25 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Ed Maste <emaste@freebsd.org>, Paul Durrant <paul@xen.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-stable@nongnu.org
Subject: [PATCH 08/16] tests: move test_virt assets to share.linaro.org
Date: Tue, 11 Nov 2025 17:17:15 +0000
Message-ID: <20251111171724.78201-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111171724.78201-1-alex.bennee@linaro.org>
References: <20251111171724.78201-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
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

Linaro are migrating file-hosting from the old NextCloud instance to
another sharing site. While I'm at it drop the old pauth-impdef flag
which is no longer needed.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: qemu-stable@nongnu.org
---
 tests/functional/aarch64/test_virt.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/functional/aarch64/test_virt.py b/tests/functional/aarch64/test_virt.py
index 63071f9b517..972b7bf783c 100755
--- a/tests/functional/aarch64/test_virt.py
+++ b/tests/functional/aarch64/test_virt.py
@@ -60,8 +60,7 @@ def test_alpine_virt_tcg_gic_max(self):
 
 
     ASSET_KERNEL = Asset(
-        ('https://fileserver.linaro.org/s/'
-         'z6B2ARM7DQT3HWN/download'),
+        ('https://share.linaro.org/downloadFile?id=3zGlbmXh8pXFewt'),
         '12a54d4805cda6ab647cb7c7bbdb16fafb3df400e0d6f16445c1a0436100ef8d')
 
     def common_aarch64_virt(self, machine):
@@ -77,7 +76,7 @@ def common_aarch64_virt(self, machine):
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'console=ttyAMA0')
-        self.vm.add_args('-cpu', 'max,pauth-impdef=on',
+        self.vm.add_args('-cpu', 'max',
                          '-machine', machine,
                          '-accel', 'tcg',
                          '-kernel', kernel_path,
-- 
2.47.3


