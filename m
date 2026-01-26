Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E993C88E5A
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 07:35:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkH36-000794-5b; Mon, 26 Jan 2026 02:30:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGgV-0003Rm-VB
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:07:03 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1vkGgT-0004l9-8u
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 02:06:51 -0500
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-81e821c3d4eso3969558b3a.3
 for <qemu-arm@nongnu.org>; Sun, 25 Jan 2026 23:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769411186; x=1770015986; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j2wRRRhpw2QeH+ly9lZWVccsQ4eVHSDC2ik4WsoAFuw=;
 b=ErZYfxC+xvpgb8miCD776VPjcUhq9wvF+r/dPKbzpa0bHrb0IZkGwU+PJJEe18wHAw
 IVbifgS1lV1vXKbnqlHxftwy1S022y7344z1xkTjMow0iKTK+m0KpPqo3IORs0r7AUju
 PifBz6BY3GbSlMqlB4ZFuxBo2rks8hdMPLGgyV9PtMHqRz9zyq50iw18rFGKADsNl6Ak
 o6IZVb+Vv5V9nSzC3Xnn7L5nZJB6HehhGWop5E1dy+/7XvBSMJgbdIOkMls31BQjnpvl
 Io2og1YfELSda6T33vjRl1HRQ62I3vsOxmzhcj3NRnj7C1Hh2FVfGL66zu/ZwR5uIH89
 9Dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769411186; x=1770015986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j2wRRRhpw2QeH+ly9lZWVccsQ4eVHSDC2ik4WsoAFuw=;
 b=ZZaavGS1grDGBYkbsJhRGN706wVxCZlIrvnCOPVoX87vLcf8qkzYBuE6aAEX2Rf402
 0+XKrBzC2nHWW4RKYsxnaJW8cy/g/8LsqhtyVSoR7hS+a5wLvA2TNUVqHL7CrYH2lokP
 qsAk9X8VlirQ4tashNhBB3BaWfGU8V83izIvWl4MtAUWxoJcCdzENrBXIa6rzKA/xLhK
 uVVYYIsM2IevAPyDtrfLfOZb+mzMQRogCoH/2enppQRA0VBkl3V3/ETmqXKKvEy9Yh2T
 JMo1CiJQJYGtgve92KPjNUtGY2yJpKcXK3oGakh0t/k5K+1ipmbNTrTKr20WHujBCGLX
 5/vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFS0o1YsXr/+0WaFRxNStChFkRLXA+I+2vT3B09JBsaBsX7hI0mfdLzNrjs3SAyETRt+aF1o+tqg==@nongnu.org
X-Gm-Message-State: AOJu0YxLCHnAIK4CcqpSVL6l/pqnJfbJMs3vscjDkk8mREDkG3ma77ek
 ThLethxztfvUfsJ3xKntkrlHlS5VSE4ut2TGFN2QWoHk/tKeb77uXIdv
X-Gm-Gg: AZuq6aKkaqgF0BgEZdm6qZ2w9G5PnnDbxDJ4duiKtNopbg3StU1bb3ReBz1sRs8Lffb
 g8jJ7eGhUAlr/zfqjbLhinxv8Z4+VA159yuN5qRo0LXNJfIeHokeIlyA4HUVj3gCZwXF5XBBGbv
 QFMY4Aa17s08G6/1hK2u2cMklfCPm5ScLt8HbQc4Bh+s+wQT56vyde0nrB+gWhUVdF8gXMk7oi5
 zYMe2ccZgut2b34ZonlSO4n4FpVvUfvk2i2lQemUEXYuziU1yWoTlvHFdpyJPVDRX9p2lVZja5j
 ALFS6Sz6gTesHYAiIa7AdWPw782r+9DLkH+EQY3F6WQ8jNeupnGGVZdZQC/FgnKOWXAvREgbGAH
 QAc1Ap+w0zVcIjH1gC29yDWFlBFFHRMZcMR05EgLaz4Edp8nOcsUzHGnLNVwM/vMrrVB59fGXnO
 5W6PEn5so9aogJMZKFtIp4Rl5FapSx0GnC9HyJL5WZTQ==
X-Received: by 2002:a05:6a00:3a05:b0:81e:c5a:8c25 with SMTP id
 d2e1a72fcca58-8234129e435mr3211981b3a.44.1769411186608; 
 Sun, 25 Jan 2026 23:06:26 -0800 (PST)
Received: from brahms.. (fp93c00990.tkyc601.ap.nuro.jp. [147.192.9.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-823187716ebsm8661487b3a.66.2026.01.25.23.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 23:06:26 -0800 (PST)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 WANG Xuerui <git@xen0n.name>, Aurelien Jarno <aurelien@aurel32.net>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Stefan Weil <sw@weilnetz.de>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 31/33] .gitlab-ci.d: build wasm backend in CI
Date: Mon, 26 Jan 2026 07:03:44 +0000
Message-ID: <e3c1a6d8112ae8aca34d8a55a0a077026f6dde12.1769407033.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769407033.git.ktokunaga.mail@gmail.com>
References: <cover.1769407033.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This commit adds the build tests for the wasm backend.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 .gitlab-ci.d/buildtest.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index f9a2d4de74..f7843e6e5a 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -792,7 +792,7 @@ build-wasm64-64bit:
     - job: wasm64-emsdk-cross-container
   variables:
     IMAGE: emsdk-wasm64-cross
-    CONFIGURE_ARGS: --static --cpu=wasm64 --disable-tools --enable-debug --enable-tcg-interpreter
+    CONFIGURE_ARGS: --static --cpu=wasm64 --disable-tools --enable-debug
 
 build-wasm64-32bit:
   extends: .wasm_build_job_template
@@ -801,4 +801,4 @@ build-wasm64-32bit:
     - job: wasm64-emsdk-cross-container
   variables:
     IMAGE: emsdk-wasm64-cross
-    CONFIGURE_ARGS: --static --cpu=wasm64 --enable-wasm64-32bit-address-limit --disable-tools --enable-debug --enable-tcg-interpreter
+    CONFIGURE_ARGS: --static --cpu=wasm64 --enable-wasm64-32bit-address-limit --disable-tools --enable-debug
-- 
2.43.0


