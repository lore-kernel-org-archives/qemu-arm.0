Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138CDC982D2
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 16:57:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7FPs-0007xH-GB; Thu, 17 Sep 2026 12:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FPJ-0007i9-SH
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:56:22 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FPI-0000jZ-5N
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:56:21 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-485984ebf5cso847817f8f.0
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 09:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789664179; x=1790268979; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vjEGVIoXgiWmRQOuwzLlJ7OnxAMbVyKluxu1drRctLg=;
 b=QPYfJGBwGw7JiLB53BZGa/JpNCB7CVRSlYiqgUiUfZd+8JCadWsXGIOU0pvqhtlHAw
 1KCRxSXh+ALtiakv8SvOmFOAcjuPr6s47wfgvbivIrWm+nlxMCslRj0p7eXW6s1qn51t
 8dhS4bBAvUQn5N+XlHc+DFcYqVN4WXSK0VF2SyBIFKvd9m8iFGgbCtZInYmt2Odo8ZuF
 dNGIda24GkPYd+eXoQ3f+eicNTJZuI/851FwDJYoLXjTK/wDRR01wEptq/3gK29W7Xe3
 YnjudfjMcTT3ETy3igcBfpPqPhx+IRUax7FF2snutXp5RP0RfaLDryXXviXUCAUzpBYf
 GW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789664179; x=1790268979;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vjEGVIoXgiWmRQOuwzLlJ7OnxAMbVyKluxu1drRctLg=;
 b=eWzLBJVTNG/m9AA+IfRuxwZJqAc4MiWUrZ2u5dQtSCCb25mESdTMMwcUqO5Jp+/eIM
 koQe8tuz45CPI5Qhzu2OeLox59o5Os9kAbg3QPjiBHhWepy51a0NiSVWT+XrhGvXP+aT
 CBZriN42mZtm3J/PEW3+gYxPknoacfChg1s19NE5mf2/bFskArHZqJssHFlLdOUZoHG3
 yyKCcG/6umw51sJT2Hrf7xV6Vhqa9l7Q3Kz7Np5cJGEs9BkaK8rGGEogVsi2EMxrBpuu
 8OQDuLFPvdwaDFlelKy6W/ah0FxbPbDhiQdCzuM+c8e4ZUJVFJWD5/zGZXfRt1lyLRhe
 Nbkg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzie9yCwGuQ6nSH0d0T1skA8HDAypFwRXbedc232OB9s2CqidjrvtlJR6jxuQgNd7tyZ8lxSf4HuQ==@nongnu.org
X-Gm-Message-State: AFuF++nbCOIJokDA2TQyVAvwYEHU2jeY8c7diYxKMXnKK7GL+pFiK0TU
 ZAbLx3C30P7QyKaZcE7EqATLBO2OkEA9GNv3NLsBKWzVIHP65sMoKQKtGWtw42eyh3w=
X-Gm-Gg: AYBFou2QjCX7SfsqA9KkmWG8c98GwKKn1VMkRtD+hwW1bUaBn3VttMVe/YpZCeEsWuo
 I2lTMsD1QYtjP1/Nlz0QeZpvTncrbLju+xcj8j6xvbd3rcteZh7+ac62k1oq6yKjedLHHx4v95c
 /GtlFAqq5LlX6ZAU+6EVpE1CguBbiJIFEw/VIfVnyrjbpPNw1rjLQloXIyfPvwo/Oro56GwUX2h
 qlsYQZyhk5wzeMQoaZRz4jx0flK9/SpLrW20U+h78Fxsn3Qv3tGXFMUknj8qSKXm3ZEFFU+MjSc
 aIZAiPAvvLd6p4+4T1h86L/uua5IEujv6Ry4vzBI4aRmN3H6TPn7SM00oG5+H8CEUSpuzgyLvui
 JPppu+pn2qTlOISxCUxLHGAO/NMMhMB+Dmd6hvOGtBWIBFKd1RUnQ4DtpPlTwiHN2OQohwGIuGz
 bFhbjuK2+PumZeQ7d0mcuYfsigqRJX3z9/hHbR93vt2F6HTmkVhB1y5K6xH+7Yp8x9s6UAKEo=
X-Received: by 2002:a05:6000:2512:b0:486:f9d9:fe0d with SMTP id
 ffacd0b85a97d-4870cf445edmr9516416f8f.29.1789664178718; 
 Thu, 17 Sep 2026 09:56:18 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bef7678sm17381540f8f.2.2026.09.17.09.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 09:56:06 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 03D125FC17;
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
Subject: [PATCH v5 08/17] tests/tcg: don't define tests when missing compilers
Date: Thu, 17 Sep 2026 17:55:52 +0100
Message-ID: <20260917165602.3405537-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917165602.3405537-1-alex.bennee@linaro.org>
References: <20260917165602.3405537-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr2-x10.google.com
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

Skip defining the tests if we don't have a compiler to build them.
Otherwise we add a bunch of noise to the reported results. We still do
report when we skip because the compiler doesn't have the features we
need to build.

Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v5
  - alternate patch from Pierrick which keeps validation
---
 tests/tcg/meson.build | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 814f2f8cd8c..5819fdf0bf3 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -499,10 +499,14 @@ foreach target, plan: tcg_tests
         cmd = ['sh', '-c', 'echo "' + skip_test + '" && exit 77']
       endif
 
-      test(test_name, env, args: cmd,
-           depends: test_depends,
-           timeout: 120,
-           suite: ['tcg', 'tcg-' + target])
+      # Do not add a skipped test when compiler is missing,
+      # though we still check all tests are correctly defined.
+      if has_cc
+        test(test_name, env, args: cmd,
+             depends: test_depends,
+             timeout: 120,
+             suite: ['tcg', 'tcg-' + target])
+      endif
       added_tests += {test_name: true}
     endforeach
   endforeach
-- 
2.47.3


