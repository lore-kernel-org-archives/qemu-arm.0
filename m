Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1FF606A31F
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 19:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uoapzhCf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIt1c-0000wB-Gq; Mon, 19 Oct 2026 15:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt13-0000Vf-Ch
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:26 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt0z-00036l-Qv
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:24 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a1df146015so13638315e9.0
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 12:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792438040; x=1793042840; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=EPqkEo+REEQvki6c4nWZaj2y2OF71gOMMkGDiVxPDRA=;
 b=uoapzhCfltbPDIMAx63L571X0/xtPLIEh/E7ABA/mIM0rdVbGQJXuTSx66ZGJN2m82
 amxlOAkuIDkWfVA5PjtcypPWjgAY0OppwswO8c98jKdwK26suFoLKmrT3y0FBLp6S/Cz
 xjSlD2J3fxPXFodRUqzIl/XQRqp5uDKH73DRAvoPkkx04/H4CviwQosAPgH45ObM4pS7
 jd14ImUv42ZVBs5Zw8g2ZM0ym3nMlPm/Ifp+pQxCLYU4lSSGcGIY841S4mTjAODRGpEm
 T10U+gmJ7N64h3K0taFNGFyfR52oWk06+fm5anTqzsXOM3fzdxNX1XZ84VP0SkbXuTki
 fycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792438040; x=1793042840;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=EPqkEo+REEQvki6c4nWZaj2y2OF71gOMMkGDiVxPDRA=;
 b=eWx+SQYRUsZ9f8FM+y7gl/8Nyov7FPR0aHvH1HXJwJ6BHucKMk5wmCfGTztgVGyQL5
 USLoFl6dTta4jqkHum7Pvp2LRSYtPLFQH/0IfCWnMSsPZIJIp0zxd4vzoBzWzBvykrhR
 I0onF1yYTP7TJRZfwhJhHCO5bat6R8Vp8EW2nVRnN0NcZPXjP4AT60UfjOtgPgFQkMyv
 LlUT+ZDuZT5aqgGhCGqebfMr6EWUupxsUbhIKRWkuIg+RYNSKk3Pu2fVPgjptUR6b5oK
 z2nBG7MkTOafZGc9MDI9XsaaqJBksGOwYez12nDHBEfRfjHYcOGD5Fgj9+Q9Zr5YBsFY
 REog==
X-Forwarded-Encrypted: i=1;
 AKwUvBwXXaOHuRkOpAPGlBRqYkBbCxTFJw3rh9OZiBv5aujPpel7sxwRBTNsFGUIxIbbeppInavCXISbpg==@nongnu.org
X-Gm-Message-State: AFq9FYIRA97iuYt9d7SzHk10Od8UDMcOwhxhAA2/qJlf882elY54tLhP
 dB5DsZ7Ehnd1qPmCQ9LpFOJ0LIGeRbD5NBrXUFc2nOV5fnU7VdqeuVaL3dpMeo/9n3E=
X-Gm-Gg: AYBFou26g7zddeL2Q1phPv5pTswlO1bwVdJrDC+qWZOAL/rRD0EpOIUTC38Qs1ksq+A
 S3ABlD/0AAjQbew5v/t3tSjHtbdJLuiofPgOru+Cn9DFyaX6pwrRZOg1nWtbvbv3sX0yZBO+hJD
 GnRKvSeBg+JdGY1Jj63aXUPL4EIBqEvNbCJz6JeZlrl9ovWuHKciAQm3wReQeGmDvkPfQF6tsTj
 Twn3QtTv4ATTIESUMlAnJY2tfcmkfUW6Bp8f08WedfKzMkrhp+zCB8cyM1n+BsD08fxs0urB6j4
 HfA/OWUPIj+xhvQhsMu9ASPqommQNG55TnukGqD93CsxsMiIXUmZ69ms9fajZfhiAissPdz3+zc
 VyEPM13DfF+8RD9NOdHMKt82/THBXQYVzPJBoa/P5Nyem69EkJNPtWdA/PNkfuUAyA98Ve8Mf3b
 KkE7uwUwWFJ0Xn7xu5b61ZVfhfETkDCPpt2lcre+8B5N8a5Brn5hJi5VWpoD5UjdLa5OFeVA==
X-Received: by 2002:a05:600c:1f8d:b0:4a0:1b14:d00c with SMTP id
 5b1f17b1804b1-4a1d75ab306mr211471665e9.3.1792438040283; 
 Mon, 19 Oct 2026 12:27:20 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f2c9f7dcsm12738855e9.1.2026.10.19.12.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 12:27:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9FEFF5FAB3;
 Mon, 19 Oct 2026 20:27:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Keith Busch <kbusch@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Ani Sinha <anisinha@redhat.com>, Anders Roxell <anders.roxell@linaro.org>,
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Brad Smith <brad@comstyle.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>
Subject: [PATCH v3 06/19] tests/functional: split x86_64 tuxrun into tcg and
 kvm run
Date: Mon, 19 Oct 2026 20:26:51 +0100
Message-ID: <20261019192704.3220373-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019192704.3220373-1-alex.bennee@linaro.org>
References: <20261019192704.3220373-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add an explicit "kvm" run to the tuxrun tests. Although running on an
x86_64 host would probably have defaulted to "kvm" anyway we want to
exercise specific features later.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20260930164649.433573-8-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/x86_64/test_tuxrun.py | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tests/functional/x86_64/test_tuxrun.py b/tests/functional/x86_64/test_tuxrun.py
index fcbc62b1b0f..729f6447d05 100755
--- a/tests/functional/x86_64/test_tuxrun.py
+++ b/tests/functional/x86_64/test_tuxrun.py
@@ -24,13 +24,28 @@ class TuxRunX86Test(TuxRunBaselineTest):
         '4b8b2a99117519c5290e1202cb36eb6c7aaba92b357b5160f5970cf5fb78a751')
 
     def test_x86_64(self):
+        self.require_accelerator("tcg")
+
+        self.set_machine('q35')
+        self.cpu="Nehalem"
+        self.root='sda'
+        self.wait_for_shutdown=False
+        self.common_tuxrun(kernel_asset=self.ASSET_X86_64_KERNEL,
+                           rootfs_asset=self.ASSET_X86_64_ROOTFS,
+                           drive="driver=ide-hd,bus=ide.0,unit=0",
+                           accel="tcg")
+
+    def test_x86_64_kvm(self):
+        self.require_accelerator("kvm")
+
         self.set_machine('q35')
         self.cpu="Nehalem"
         self.root='sda'
         self.wait_for_shutdown=False
         self.common_tuxrun(kernel_asset=self.ASSET_X86_64_KERNEL,
                            rootfs_asset=self.ASSET_X86_64_ROOTFS,
-                           drive="driver=ide-hd,bus=ide.0,unit=0")
+                           drive="driver=ide-hd,bus=ide.0,unit=0",
+                           accel="kvm")
 
 if __name__ == '__main__':
     TuxRunBaselineTest.main()
-- 
2.47.3


