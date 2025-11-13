Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08050CD5BB8
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Nov 2025 10:28:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJUWN-0007nO-En; Thu, 13 Nov 2025 05:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJUWK-0007he-BA
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 05:25:40 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJUWC-0007IA-OK
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 05:25:39 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-64180bd67b7so859442a12.0
 for <qemu-arm@nongnu.org>; Thu, 13 Nov 2025 02:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763029531; x=1763634331; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ZvQYhKul0XaLp7b7I6nCbqIpqv4Wu5tHP65PD8Qd2o=;
 b=wLLdXgCtYfUyFz3zD3+kQNRTn6495M7QmROo3BXHXXbD+umZJfYMOFl0yW+iAyHgyD
 gOZsJEbjIzhO4rsSDbCYFkwmQWx7JWT3Mi73Tq1TDrNB4/kyCJCAlE6+LDPlNFcIKr4C
 SsGTiQxQDXyTmJlw3fYap9xY9ZhtdhwOdrKM+mcRQFcmhnRIN3uOzw2wbFuawibkCVSF
 Em8+DL1ILKiRY/O8i2D5/PTym7mbi5wqxf31QJF3hQqc505pnd3CaHOhZxm6duclqix0
 i6M7OfKWW2RhmOiBvWAf9eaHqylqDUFmUwDuRiNDCbCL8Rq+1UwEa57thqQmtcaoTuZp
 BrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763029531; x=1763634331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7ZvQYhKul0XaLp7b7I6nCbqIpqv4Wu5tHP65PD8Qd2o=;
 b=bmXXvhUU59w8OXGPcDM8Bk6fxhuBSsAsA/TdOyWPV2efV4d+n//XzyA73B1tSpW1zd
 CNx0uoUT5oSMu6YjZSQEqDrzmZc1wF5vhVVgYu8KqjlCXkRvqvsIlRo8vzzvtTBgJJ9U
 KnmHkiHJxhfJraYMeu2+EMu+sNlBZA9P6Zkcl21LN1WCw3X0dcBElOR1d06KXmiQAfCL
 OM8t0cC3YdcVGW0qwnTVwm+Puhdqcqkl5/9Ce5qbFRMcfXs3m4wSsDzd6pfFY9tBR/jq
 SiH8xwC9Q79DoUZJEyEpxtzHBAcNb4II84KwHrKfUr94hippzhUWbqrulm+HlURr6N3R
 Vo9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5KM3jKBvwvjChyj1tcWFzdqUj1x81/etl8JBTjTbNu+KQUdZiBTGfdq37MliTOl4rDjvdhPVKPg==@nongnu.org
X-Gm-Message-State: AOJu0YyEmzhQeEJBERuv09oKUk9DBhI+hW0KNO3ZY1Gwd/++xUuNTu+G
 43LO5/ZxOL0dWCcVAsBQkCfd3EtsNZeWsvrAxmMCImUNkUKphtJWlvYoqnOqfI4e8RQ=
X-Gm-Gg: ASbGncvdlvOIdnS0NackcoOs/fVP9uXTYcEK7h3CfxoJ6wDlNlNu7OX9g9UEYKn02ZL
 NiztI+3z3xtNLfHaniGYu3TQ2NFFuSFX6CEWMiNez2MfqHDglOJopM72WtyPhzJPoM7IEttA5DA
 gxmnjct1/CRfj2OxsKKKiWRMe+X4mrRES8nupvhF+ZMhGtdJQmCE9+he2z4T7DKPLVXlQrWhHz6
 /eJJ0HtBx5AznC6gMNqnij587+vu6EbM0/s92womoz4Ot9nOUBn0jZhMr/bUW+OHP5Odkxg1zYl
 QUOMQgOJiPHb9lGMJX7cduSF9kjD+PRE/+IIb06rzc/pvEOIvA85l61MZV3ZTXdCSn9lDNFYiJy
 iThQhEk4bS0/mdgM2PNxbnBTF0R9vdgaPSMang8uO+7+3K1KooY0FyOq7bfMKMCkWs/uBUrc3ep
 sa
X-Google-Smtp-Source: AGHT+IHhvykwA6ZxVyWLrWG9jvY9le83oCeQajzi3WyiOfeEETb1zWcsRQ8ibMwlP8bvH23wNWzkjA==
X-Received: by 2002:a05:6402:27c6:b0:640:95e2:cd17 with SMTP id
 4fb4d7f45d1cf-6431a57e355mr5229280a12.36.1763029531189; 
 Thu, 13 Nov 2025 02:25:31 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a497fc5sm1135737a12.22.2025.11.13.02.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 02:25:29 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BA2935FA43;
 Thu, 13 Nov 2025 10:25:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 David Woodhouse <dwmw2@infradead.org>, Ed Maste <emaste@freebsd.org>,
 qemu-stable@nongnu.org
Subject: [PATCH v2 08/18] tests: move test_virt assets to share.linaro.org
Date: Thu, 13 Nov 2025 10:25:14 +0000
Message-ID: <20251113102525.1255370-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251113102525.1255370-1-alex.bennee@linaro.org>
References: <20251113102525.1255370-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Linaro are migrating file-hosting from the old NextCloud instance to
another sharing site. While I'm at it drop the old pauth-impdef flag
which is no longer needed.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: qemu-stable@nongnu.org

---
v2
  - drop ellipses
---
 tests/functional/aarch64/test_virt.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/functional/aarch64/test_virt.py b/tests/functional/aarch64/test_virt.py
index 63071f9b517..f9e3ec08fad 100755
--- a/tests/functional/aarch64/test_virt.py
+++ b/tests/functional/aarch64/test_virt.py
@@ -60,8 +60,7 @@ def test_alpine_virt_tcg_gic_max(self):
 
 
     ASSET_KERNEL = Asset(
-        ('https://fileserver.linaro.org/s/'
-         'z6B2ARM7DQT3HWN/download'),
+        'https://share.linaro.org/downloadFile?id=3zGlbmXh8pXFewt',
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


