Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0F2C982D2
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 17:03:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7FWB-0007MZ-3V; Thu, 17 Sep 2026 13:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FVy-0007FV-Vx
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 13:03:20 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FVv-0001ld-HM
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 13:03:14 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd38e0e5dso13171465e9.2
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 10:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789664589; x=1790269389; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=1kX6+O4tJe0pWhj+BvPQgaI0joLlV1TeCnlxudU5Yr0=;
 b=eUeromc8MwtEv8yxfYcpFO7QOO1SjYfN+pY/0yhMRuz+aSXsRmu4+47/JXc3l4zhWw
 PTYUU1r4bOC/Z38vm31n43oRzUqP/AIcZhlifD49WgY4uiFDo0Y1IBLmbgI8ULPOkUQG
 LO/yiZ/B+VOEzBlekjmYVnnUr3zM5V3mhjAzmPHt5yalNlIFlncNn6r6y/uYeFza13EE
 MzTXkWotUdNNvmGWYqSoCCt/WesekqignnR12EyxYozgWhRBVKD+tXVUsT65wdTM7sDP
 Hq/MOog8zzQUmG7p2wrbK4ryuRI2++ykIvomjVcxEEq8JXAprKtVBsPa0GGQQdAqO+Ru
 A9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789664589; x=1790269389;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=1kX6+O4tJe0pWhj+BvPQgaI0joLlV1TeCnlxudU5Yr0=;
 b=R+du6E73VgrCX01sNWga1Uaj7KKrdgmR/Xah99Q7Hk6fJQMqhw0IeaS/0vrq1M3WnN
 5WoOTMu43N58lu/kb8INdu/yPONTze/Ka+urPS+h/HFuIve3Y2zzGWQIvGWG4VuCXyMp
 7qwwZsDycJlok8450Zu+GZAoG30f9V7o2EVy+t2s7jMPEuHsPDJmB1Wj5GKbs1AQH3zA
 KzAYyQixZSrxvLQbOTMXrBwWLRrdAr+0Q8PsGG8FIVyh7EAqUtTW8um9P7e+iX2RxJ8I
 KfVxSyP9jOoKoUe6MsmCgz9sa85xGzfnafXSrm3kuj7fa0airoVP0cwQ6WvAXsR65EZ1
 FYHQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzGv0SWj9KXX8O2w7D80FKxy8w4Fx92ll0bqsUINSC+F/8oYCFDjT1lk24SNAZ2xltlligVvc31Og==@nongnu.org
X-Gm-Message-State: AFuF++nJEeSYnyDr+7QceleisNvToGzmuQvDScROh6+4i4XF7wvC1PQ2
 NcGY/L0WZoneycoGVmlCTegtUL80p4UzOBs8iZNkw1i1rTO3sBYVa67rDU5yko9FFXM=
X-Gm-Gg: AYBFou1b1jkGhKz6T8+m2PEdeOZkR8jvG4bTfukdt4EEEs/pMI/2o5IjFw603CHoMOH
 FkTQJYVCFKLTLcfVtg92X3LjE7nYrvFRN2ajW6LF/+/6oIqLLgzFcgUr0Aor7ZBw8oomOLhcXYU
 qtWmzpoXMKkClAnZBoMHXxUr7jmlB6kSfzs6+Q5CIJSQMv2IJJw4BPga+ihUyT8o1xacRreUos3
 Hyn2QeALhR62wGgNLdYXnRCM+o42zNDeRiV/5/M2nM/qvcxylOdjRCUur0YUdqcY25kbpemcqS0
 iwCFjkqyk7EPpLVXHka7OWVbR0+OkaP4MmBNgfehCN427EQeC6fZ9fljNJG5Ypva2/OaszeoyJ/
 Egata7f/SSLmxOJERCU8pCzbreFRfVBRWrFIy7c9mcMyAqXqn2QNL1IeuSqk9/BCp89rrbP6kBN
 OfORB59mm6sCcvvZ4lfKEokDy0f2DmMxFDETzy2jrUZZdMyJdsWoHwfESE2KN6EuDvysMVIdk=
X-Received: by 2002:a05:600c:a08b:b0:49f:bd3c:bc21 with SMTP id
 5b1f17b1804b1-49fbd3cbcf4mr52074155e9.28.1789664588678; 
 Thu, 17 Sep 2026 10:03:08 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc4886e11sm502475e9.3.2026.09.17.10.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 10:03:07 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BD2FA5FCB8;
 Thu, 17 Sep 2026 17:56:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 Brad Smith <brad@comstyle.com>, Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v5 15/17] tests/tcg: add console property to docker image
 custom target
Date: Thu, 17 Sep 2026 17:55:59 +0100
Message-ID: <20260917165602.3405537-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917165602.3405537-1-alex.bennee@linaro.org>
References: <20260917165602.3405537-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm2-x10.google.com
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

According to the meson docs this serialises the target in a special
"console" pool which also disables the buffering of stdout. This helps
avoid the appearance of a massive stall when a docker image is built.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 053ef147df0..95f533b0ab5 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -265,6 +265,7 @@ foreach target, plan: tcg_tests
       endif
       t = custom_target(image_name, command: cmd,
                         build_by_default: false,
+                        console: true,
                         output: 'no_output_' + image_name)
       image_targets += {cc_dockerfile: t}
     endif
-- 
2.47.3


