Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13E4C982D2
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 17:04:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7FW8-0007K3-FC; Thu, 17 Sep 2026 13:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FVr-0007Cw-SD
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 13:03:09 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FVo-0001jf-Vb
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 13:03:07 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912df756so7998075e9.3
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 10:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789664583; x=1790269383; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=tf+mkj5hW2gXQd4FRj9pMR3/7nIVm2YxClIiD4Ub4A0=;
 b=qH8bL8a9XnlYnjPAWvhPC283AA231wib9sgaqa0+fxAjk2FWczxZwUqZA0k2XGUMDn
 WFLrocsP5F4EnYgVGYzKyYfWcBFz0+RL3i2BuD+wxvXzXtjZDB20b1e8KDYHNmeiZrNb
 e+n43Nke6ryvA0eF7l5Mc9R6DHchLfcLy57qNfYqrBqPa12KAqEl/HTnva/iFuXN+Wp7
 khprRcbgHnh1m6h9VAkulxOoqdai1qS0iVyOcz3FQWpU/WW6R1aPK+mpV7DUoI4OqR9p
 kOHYy/Evkl7/LRjsNaRq7c90v+6Erhzso/nqVPK1BJvnuqvyQLjVP83h3xZ5hbrI+ifX
 lAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789664583; x=1790269383;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tf+mkj5hW2gXQd4FRj9pMR3/7nIVm2YxClIiD4Ub4A0=;
 b=eW3VA/XE9Sp68FTXmsBOADwKsa+MYEA7vaFqZqz6Vsw/slLd0bQYPR9cftFkQvwIDc
 PKCQWGF62QI89bLN193Xlidtmd8J8LUOICxJDQtKKq1tydw7rpy/rmhpdL09kavvuqVX
 nWNQJXFMkzoZrxj9qbU+qKd8flHTyHh0MRdoq5/RnfKn6dYGCVBPYEwSXz2zTTWuItVh
 YVDXV7ARP2+BK5AxZYGs+myRhgxgvfePdHjrgpPD9LlLDCqvofJbkMEB6uQ3Nye/jlLp
 JFCYFm8Rq0hqmKjiUuop7pNPoz3kcxtDNkEga1//OLvPpyBdhVm9RyVkgauPfEhI/097
 FROw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwW9A7mIXYo9/gG3AxMowFW5NChqzxRJe5mUno03xfl8issFusB/pkJNC/O6NWHC7ISyhbDYKXHbQ==@nongnu.org
X-Gm-Message-State: AFuF++lyxGpAmR9WuNDEq0JMJYoR3pHyIQqwm//hIjHmHsvvqw6Rwyvx
 v41nQT7rgGnLuZfQEjiv2Nshj5a69ZAozitCzIC/eQX1Iam4ej62U+eHPBpWBUyrG7U=
X-Gm-Gg: AYBFou28LZv8mwiaq3+Us56khh2V02s/erTVLN0CDHNJ0UvD62y4Z0eJt2Kwb65fatv
 bCM6cpaip3dBK39BkGkF8pi/rXJjM2ccUdHRVnpz1aWsZPWSTRXaTkx6wCnE5qJ5ZQna3YcKTIB
 P3FgDLYpUZeJ0h73BUT1p8eMGKwkv83vg+U39NE62KalBKI/ceV1NjHh+gkzz55hhQ9MXLyZ1Wo
 8MTE66vC1ntpHCVR2EF7eKhGgeXfLUSWPSNTi0LOFPl4BkPa6T2bAOt8kc5CWWyUKkZNAJNIccl
 5sMmoInrXg2JzWJUAy36obHJZM5uNs3DArgrq/kn1PYf8ps/OqbXO+25LILNWfkfOI4syUn10fH
 uLfGEjPZ9hWtcBTCWDw3A47THBjaUrqu1kwXhSyN+wJI7NYXTiJVsrvv3R2ywfLn3Y8AbCNUOOi
 Aq3LpSIHshGO9WT+jzzpcedOdcWQWFrs6MI2OZ6XwhSocI3y312IkffBRPCXFddiqDdlC3syE=
X-Received: by 2002:a05:600c:198e:b0:49c:fc6e:8cb1 with SMTP id
 5b1f17b1804b1-49eb7346e60mr90402225e9.21.1789664582984; 
 Thu, 17 Sep 2026 10:03:02 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbbd83e39sm121609765e9.4.2026.09.17.10.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 10:03:02 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D967C5FCC6;
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
Subject: [PATCH v5 16/17] tests/tcg: Fix building outside of the source tree
Date: Thu, 17 Sep 2026 17:56:00 +0100
Message-ID: <20260917165602.3405537-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917165602.3405537-1-alex.bennee@linaro.org>
References: <20260917165602.3405537-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Running TCG tests from a build directory that is outside of the source
tree fails with:

    [...]/qemu/tests/tcg/multiarch/libs/float_helpers.c:228:1: fatal error: opening dependency file tests/tcg/s390x-linux-user-float_convs.d: No such file or directory

This is because the build directory is not mounted into the container.
Add this mount. Do not bother with preventing overlapping mounts, they
are harmless.

Fixes: 27939ad414ca ("tests/tcg/meson.build: introduce cc_dockerfile and cc_docker_host_arch")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20260915110855.491985-1-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 95f533b0ab5..a5e0462732d 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -277,7 +277,7 @@ foreach target, plan: tcg_tests
       mount = mount + ':' + mount
       here = meson.project_build_root()
       cc = [docker_wrapper, 'run', '--run-as-current-user', '--',
-            '-w', here, '-v', mount,
+            '-w', here, '-v', here + ':' + here, '-v', mount,
             'qemu/' + cc_dockerfile, plan['cc']]
       has_cc = true
     endif
-- 
2.47.3


