Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2ECCA9EDD
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 17:06:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGJSp-0006jk-Cj; Mon, 12 Oct 2026 13:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRd-0005I0-2s
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:04:17 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRV-00079w-D1
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:04:11 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a1688d7769so17608925e9.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 10:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791824641; x=1792429441; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=RVZIE8cKbXEFni8QUQVCXUSJYnNbqNxX2KlENDbg14A=;
 b=OgmNZBdXyKeeqEr/ZZolBUeYEbfvVwCOXFkXfZOPKbeTwfOpEzRj0aVFhw7lxOnYl+
 gLOBBPuiSUNXaidFK9kZIt/L5cEIFfPELYZ0yNldnxWJZ724XuZVSQnTTGqg94QPMwG5
 J9ykJilvjjafKbtVijBtfuX1meIze4UygmBm10CBs1kUkqJR/U0uawaFNmihY02Cv+JK
 v6eAiSO0CPkUXBYfxoTOCx4372/9TiAfDxNNwGO6B0kxT+aRupskaUICo3LbDzjvg4eK
 XI+o87ramEaylzAVcugCyzoH8gm6kS1LrmcIZ2qzVMs1BRRZC0XVsJ1Nuh+OEJAAS51G
 E/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791824641; x=1792429441;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RVZIE8cKbXEFni8QUQVCXUSJYnNbqNxX2KlENDbg14A=;
 b=nTiXT8q8mTixrP8zYfehXgj3lFEwQ8m5S3L/K2tqeWgKNpItjUmDYWI8/41cPQK+3h
 vP0LUVZmcyKW7IjIj56j4g+jy1eDjAj1NhiEmPGNJ0wRdfgkxM45IMQ1tV/HhAwPeKj4
 7dZa8GsoU+U9GwBGu6BJDvZSDgbcjLydbqaCA/c99K5OkOpwkg6myI1W1kgr3UqN6WKs
 ed6anjDVEHkvL3DvQ/rA+0ySmpVaJJ42F8t/sJqMPFy8BldwQnDBrDGY+dmEb3or6J2S
 yFyqGx6LM7Jvzt+ju65O/D03wRaik/uqe+PF9eIYwkaKpidat48hgYUYf+qvLkmi2Y24
 DKng==
X-Forwarded-Encrypted: i=1;
 AKwUvBx6LQfO9mXurBfmoRp18PmVKmE6qjgjyahzXlIpKX9/NZiRzZlVxMlgj+3GqvKreFPUjU1S007wuQ==@nongnu.org
X-Gm-Message-State: AFq9FYJ0vmE9SyRibQW6Ek/1OVsSg8ZqNrWCv8vg7c9IuuUz7NJzI+36
 2UMWs78MurtKq3ozDvVIb7uzMe9epX/q9R9keBSgX3AedjeCYrTteCWCY46vlHC4XhI=
X-Gm-Gg: AYBFou0nF8zpqAZAOGlrTEFzcVjTmmop5T7ULqAh1rNvH8xVYmQuwAsNAyHxx6Z2nFh
 6/47BD9orniDWPdYzxBXTjDKAGuywnTtvqysB0tGKwvl6hjKgUUHDzskgtIR98o7hGLIIgdqY2F
 FPHjwsHNPPvicI99+25oKTMT0jGruKBoL6NOFA2hERBjnY2WrPxASW5ts6dgV9SZhdwIwT/sXxG
 ZyQR/4Kprmvf2oiIGiqA25QLvxTffrzJEkwz42fgcdsFL4j1XLXd5PRpz5jC6ZWXXNdzYcosWxf
 E1PChsft0/hoWXA90qC9QEJ1URGxj9cf5D+IQAEDHBTTrOkggGHRQeaQ7dn2AewJMdPykRAmFUR
 i2VlRs9yCV49QEPyzPngpp9Ayujw9ie8AWpcIIJbLUOB1DT0X/FtY+vxh4uuAAPEnISDRrq+5R0
 RyUznxwZcc6KQzfOyAJk67wtmyrceO/QzBE5zmb+eGhpUogTCa3MoYZQW+iAuDiA1A15Nxzxq0E
 sCz2Ob/
X-Received: by 2002:a05:600c:8b06:b0:4a1:7ce1:2eaf with SMTP id
 5b1f17b1804b1-4a18e4e0963mr197241645e9.34.1791824640743; 
 Mon, 12 Oct 2026 10:04:00 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18c1e33d2sm413546105e9.0.2026.10.12.10.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 10:03:57 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3BC096164E;
 Mon, 12 Oct 2026 18:03:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brad Smith <brad@comstyle.com>, Ani Sinha <anisinha@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Keith Busch <kbusch@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Warner Losh <imp@bsdimp.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Song Gao <gaosong@loongson.cn>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 12/16] tests/functional: update arm64 tuxrun images
Date: Mon, 12 Oct 2026 18:03:26 +0100
Message-ID: <20261012170330.1144446-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012170330.1144446-1-alex.bennee@linaro.org>
References: <20261012170330.1144446-1-alex.bennee@linaro.org>
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We now split the fetching of the buildroot image from the kernel
itself. This is because we will want to access additional metadata in
future tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/aarch64/test_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/aarch64/test_tuxrun.py b/tests/functional/aarch64/test_tuxrun.py
index 0ef1b126fae..6de02e1d8b2 100755
--- a/tests/functional/aarch64/test_tuxrun.py
+++ b/tests/functional/aarch64/test_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunAarch64Test(TuxRunBaselineTest):
 
     ASSET_ARM64_KERNEL = Asset(
-        'https://storage.tuxboot.com/buildroot/20241119/arm64/Image',
-        'b74743c5e89e1cea0f73368d24ae0ae85c5204ff84be3b5e9610417417d2f235')
+        'https://storage.tuxboot.com/kernels/6.18.54/arm64/Image.gz',
+        '39f4633bbcb444267d4d829bd28d8868a287c4c160cda64b0fd23fb090571c4e')
     ASSET_ARM64_ROOTFS = Asset(
-        'https://storage.tuxboot.com/buildroot/20241119/arm64/rootfs.ext4.zst',
-        'a1acaaae2068df4648d04ff75f532aaa8c5edcd6b936122b6f0db4848a07b465')
+        'https://storage.tuxboot.com/buildroot/20260924/arm64/rootfs.ext4.zst',
+        '4ab8cec9d1e17dbb1abdf2ae1939ad4f9d0dc2466230f6a119a7c1845cdef0b1')
 
     def test_arm64(self):
         self.set_machine('virt')
-- 
2.47.3


