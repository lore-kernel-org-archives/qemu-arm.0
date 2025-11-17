Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE0ACEACEF
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 15:52:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vL1Uk-0003mJ-Qs; Mon, 17 Nov 2025 10:50:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vL1UO-0003cz-GQ
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 10:50:07 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vL1UK-0007xW-5B
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 10:49:58 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42b3720e58eso4183175f8f.3
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 07:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763394594; x=1763999394; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+In2d+Biyo55vHenXzzVehXQt3xVthufDl9j93GHiLo=;
 b=itcKBi9wfGFnYbdcanl65Qbdd2UxJSYgTSK92VV1W0QDmtMmLyfIM92+Y4C2oukbsf
 p3T94PcbtKslqEon3E7FV8MJhfzhrT4cncCeyeRdDUv0BIVgDMbGZYG+GAB75tetJxuF
 eKT4HPfvnIIMkw2lvARuTmypnYm4fKp9m4jWNafGmAQpUoSbX5fskrr4D8kq5iHSALG9
 M9Q5X669Aj2ODsYPqtiYg6mES4YxCCUycLE1cLURtjenEG2xJqwKjRvYlI6cfaXcwRXD
 z6dmqUX3x5ztVmHkaNeleI2bA6+3OfWVfXWXn8QUdXXhDG0jFpc612alv/ubEz/CcT7H
 HMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763394594; x=1763999394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+In2d+Biyo55vHenXzzVehXQt3xVthufDl9j93GHiLo=;
 b=Sh0u0pp3fVCxiZ2dctRgg0/sw3KPLV0Gyad92Cx1iwUnDh0NbfOACVm2fNPejQtTFW
 7fopwwG14HE4k5xnvTrzNMsjtAqV+SLrlagmjf2C5/LEHzCBnpcanYepuRheQyNbH6Gx
 brlxSpxEK7lHzYfGcc4IgNJWauIuJWHO+Z4xiStMDdOQDajJvSU+/9kH6mg/Y8f0Pcc8
 sCGtavh5IC+e0PorQ0P8CzHRP7Y5lVn7rDiieLVepw428LJysc0N8zlH4QFMfTLQTRLz
 ErufCMA9vwuGEW7JvtHIP9kXjSDT0xm8uKcBCvVLukqTveOo0c3lkeOmypWR1OeJfHRI
 d7Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtCVBv0JVl/T3JU4fMKXZKJi+1vWv2/P9seZd9vxSmyIPktfUFeI1cOVK9PUb3hjJCToymewrQcw==@nongnu.org
X-Gm-Message-State: AOJu0Yz4dKhgEhIs43AGtK301DBp681bz8bll6W3jeYIfNKQ1Ay60bSS
 O/CYjWPqIaisKEoYxePXaHZZbIHB/LwihGPCT29Ko+x2pa89yXSj0mj1bwBdWZs0lWDtYZVVqUG
 SXzeC
X-Gm-Gg: ASbGncv8kwoogfUAQQ7/w+XY1rCrOK5fvDEhz2YP8id/8Kbm0HmEXpFwdinVjiJ1jNz
 GpDiDYGeKrRW6Z2ixQl1yDCQRAZ/+gX3Q0sR5u807sQCJcIw5fzSFmSbCb0JxV28kOK/d0AEwLh
 ajqEGUHQNeuohP7npdT7hTmMoexy/6+jK9FifhS4kp2Roi21Eu5FcNsGrKIfK1D9V7yMRHpwODo
 /73vny55SfgRgK/yYrVY71Wh4q8WAwlYPNK70pB8wl10XAcrUY9/iHvEO6wNUY0mDUYZqGITDk+
 qIBfnwUtkqoImEHw4u8xhKVY3aZnJdL6qOYMT1n3sy6PjUXb3GFMxVPgWw71h+KYbeNPP0exOon
 5Vw9zVL/7x11hJHVCWdVnqF2Rw8x98jhtFPUj0lcqZCnCbvYKPHJw9VRKTpS2wu2ItQL9cAtkab
 XcfdOtX34uLiM=
X-Google-Smtp-Source: AGHT+IFEtPhDvAMBcCHHzTJvxyzI+CFtjvQ5cp9/uHLyEdeFizf966evWjyHmRh9Dv89UDOd44k9Hg==
X-Received: by 2002:a05:6000:2013:b0:42b:2fc8:177 with SMTP id
 ffacd0b85a97d-42b59390f6amr11559632f8f.49.1763394594196; 
 Mon, 17 Nov 2025 07:49:54 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b62dsm26946790f8f.24.2025.11.17.07.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 07:49:52 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 193F45F932;
 Mon, 17 Nov 2025 15:49:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-stable@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Virt)
Subject: [PULL 07/18] tests: move test_virt assets to share.linaro.org
Date: Mon, 17 Nov 2025 15:49:36 +0000
Message-ID: <20251117154948.4122164-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117154948.4122164-1-alex.bennee@linaro.org>
References: <20251117154948.4122164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
Cc: qemu-stable@nongnu.org
Message-ID: <20251117115523.3993105-8-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

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


