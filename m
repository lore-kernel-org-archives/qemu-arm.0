Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44540CD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:21:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3I6-0004R5-8K; Thu, 21 May 2026 09:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hk-00045j-6I
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:18:00 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hg-0008WE-Q4
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:17:59 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-45e6a4d0be0so2665436f8f.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779369471; x=1779974271; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hda4e9PNEMyhesRE8+tUzLA86UmpB6c7B/SqvsDjFos=;
 b=Iw0OBqbOaQB7gu8p1FvR6Ev/HOcfO5LwT7+isn2mv2mhyqBqJugVeBB97lmj7sXsE0
 g6GeScGGkAiQIvsz2P5x2Az8m6Fjxdg5jK+l6jbm8LPX68lksMivLZ7bo5A6OjNuuVP0
 5KBjxu0LWVz7AkoxvSbMcs60DldH5XeJHsRXWfTwCl1ChouLHdhpYFrg/XM6AzXSfYIf
 2XKq0rDQru/Dqj/QKtaEmp/H2gYmgmps2UkSrdrigE0g3ggmJIbRJGUgXRyux4faVTjr
 7VRQyeV1BgU7TTqdJfuVYIbbO1Zjj7bCcaW6EC6JULAxsdheKig6k1ChtRl1Zs6JBHop
 rTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779369471; x=1779974271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hda4e9PNEMyhesRE8+tUzLA86UmpB6c7B/SqvsDjFos=;
 b=oxK10CkH+K05ZVATnAcqNEoBM546yFPIOSmoSdppDj9i+wA3h0tZFxNsyxr4gCBenB
 C1PuroBZw8AqYCIIVJ0/OhECbB2rkWUA+tefWsz3Oe0ytejEma8KNloetNppbS8mbU4b
 afU5dtVWIwcS4lGUkltuxdSzlPmKgyVQOLOZ7Mgx9vgERBm5jHLufsDY7/B2cQK8ILYH
 u2kD23Pol/UMz4Sbwr6EK+wWwGz5qGPTOnz/2eziRnxnmdmLSFFLLsYllkaJdS4neVum
 C9F2es822pyayzF5GsyR7lLmg3TjiSEJB4pPGdBDzUlGT14eEAsa4wUcA78SEQAsrlYi
 4Mhg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/gTGEANsFs1/UmrBoQ3sMBDnA3Bf/6R/tsC01HKqzpv/oTzVvm6klY+gzWknJmhgntea9BXR9KjQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy1pENzwkCGXKnFKSiTo+yu2hyE4HAJY9NEsN6O1COpIy/C6BWs
 oyG7JE3z0yMmLp6ijXQuNHMScPHw0ByEqgVvO+8uALk+E/Z4OndarZ3p2CWUo1ZD3qA=
X-Gm-Gg: Acq92OGaL2mQu7XR0iAuYM4ed0yYar3rXSXdWGWJ/mqMGtmZ7hPPEfFUn+9D7NMKF+8
 9pSHcawmMReYeNNSG/+5AHPeUPB0WWUUpc26kUpCXaRAJ5LAzQFb74f4P9Q8LXE60sopFniXFh/
 81ZlIGkXiel2GbeAMIlOgqMnH5oryeYeJBYhL2sjWJ9wvgQy+FTzcPIJuFvylrTRDhqzHuWF29T
 Kqmb+4kMJz3VicZVIW2wDPZp8anDL1P0jt+M/1S5g22qKqnZ0QkWgkCSAqzRqnMmZUpEnxMhU7w
 ZDjvEHq3Q8FIWGlSp/beTu2oWKtNli+adoiZns8WxbjLHNqfJobU4CO89x/nxxgLF9pVjm1HjFC
 R2Pw7Af1m1FFDWtNCreZE8ngb98uIIommVkN6uAyHDwnfk6I3P9Lr6BLp8YptCRAS15y5y0XnUi
 BBrDptpYw5S3GqFgsz6bCMYZs=
X-Received: by 2002:a5d:5f44:0:b0:45e:739e:499 with SMTP id
 ffacd0b85a97d-45ea37be6c5mr5360918f8f.13.1779369471436; 
 Thu, 21 May 2026 06:17:51 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa92dfb1sm2856162f8f.20.2026.05.21.06.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 06:17:48 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7A28660E4E;
 Thu, 21 May 2026 14:17:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Song Gao <gaosong@loongson.cn>,
 John Snow <jsnow@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v2 13/16] MAINTAINERS: Cover debian-tricore-cross.docker with
 TriCore section
Date: Thu, 21 May 2026 14:17:35 +0100
Message-ID: <20260521131739.540157-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521131739.540157-1-alex.bennee@linaro.org>
References: <20260521131739.540157-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Message-ID: <20260518102222.80735-5-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c04fc1cd2e8..62754d18341 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -458,6 +458,7 @@ S: Orphan
 F: target/tricore/
 F: hw/tricore/
 F: include/hw/tricore/
+F: tests/docker/dockerfiles/debian-tricore-cross.docker
 F: tests/tcg/tricore/
 
 Multiarch Linux User Tests
-- 
2.47.3


