Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF75ACA9ED0
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 17:05:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGJS4-0005U1-Ar; Mon, 12 Oct 2026 13:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRZ-0005Gi-SO
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:04:11 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRV-00077w-Df
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:04:09 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a0e1b0681bso15373985e9.3
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 10:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791824635; x=1792429435; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iXTLXKXswaoS8fK2iy7Al3ZjuS4aIMD3U9wC6kd44r8=;
 b=xsX1ARC810mvewGHTkIH8zaO0efejFnxSYyMnE6FhjWrKuZLHXRQVbnR6T+AurK/m3
 LzsxvXEtvo/rHyUO/XhW1IC/dsIzinpUuSQ3mzidh+ORcnm7oAzDhpA2+mcM2QZGgD60
 a4MGDzFodEe2CG38jTzUsbUQ98b+ARZ9WB6xSDopg0gV+yOgF9+7GAimrksBTaHmJL+m
 WPvYysvmZnCOSZLqqCrcSiW4wdSpA9PgxIgIQNjTyTmJXgoKLtYbud5d/96JDE4boPde
 T+M8tbfyNufTt8pPNukzfK4VwipTpwDcBVvN2B8elUP0QhqwTXh//z79XTqxHR8Wfki2
 Jctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791824635; x=1792429435;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iXTLXKXswaoS8fK2iy7Al3ZjuS4aIMD3U9wC6kd44r8=;
 b=K4kIsLOf12YAjt4JGA5XkXXI9+25EKch+63ChpT74wI3mijn9VHB4hKmIpr9hHPgri
 KM/cWLT3oFZgEm2Fm5WRlxWPeWJY1/7dlzIunYTpUjb5C8N105hEIWMnzXMHXjEnN31b
 aPA8ep2I1rXpAo9tWLqOxbXhZgG22dVw1N2RizfO/pv2IwKGmlRRcplVR+BWbcBE1der
 Aqd5L+PkNFtpz3gkF6F003BsiolnyfhM/vRPlap5tzFULOiUA8bHR2ZDYs5g+9v7Q8c9
 cEQf/xRtZZQkKrdhpIk9JI6DIf+TG3NCsoCWyvyC/KyqFvt8ww/n40AfpOcLQRufWneb
 8SGw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz1YtTJD8exH5rIjk1xZQKTKZcoHppd3AK7Kwnb84+td7CjarytpZuF/apfl+G0vvEFVZCONUjh3w==@nongnu.org
X-Gm-Message-State: AFq9FYIXoIIsrYFz1u1h37mB0QTYbuS4VbjXXWekI7XdXKMcov56jMl2
 xXbZSEj15yLe4X0+QEhyG+ftjDbF2UhTOQkvVRjVN73MwFelHscjFp1uvreQeW1qcGo=
X-Gm-Gg: AYBFou3OObmCFI1WqqQhKaipFvN5AYSrbZHykCbdsxJ8HBixk6nhskn1LskB/hDLtiy
 4p5q6a+jCWP9N6qAOEss3DYe+99p9Jksb7kUFVb6Idle95EXnhfUUm6pcTkVig6RuFZ/2ztpS5V
 v4edOPkA8vE1PHvW3HUp/vEs0oGDeE8RjG/ONL638A+F+2vduCauTvScLe5xQy1uHiXh6I8xt8a
 a4kUq44qjJI9FEb8EdmXYp8cXwD8kx3moPMzE/ZKqdJoPgDkvJK65GBJ9X7JSEA/AbPq1gJm3FH
 JUIqtVMHCu2JKmz0+F9TdxOvz4hKVO6j2hkUzOtZQ0ahN47xMqtP72/lruYVnbUOyOOBw3BjfQG
 vjY/CsspcDxm2OFvnG15o7yX05vznekEKKV/aIPVfOi3N9k20Mkwnp5AeKydnou/0AZQSNg8Vnp
 3VqLgwFfvYfi83Sev4sY9Df7eEsxEezPyuO3NEMYMGflJUqlNHvdgeBggNLkSPghnJnClU9w==
X-Received: by 2002:a05:600c:524a:b0:4a0:251f:a726 with SMTP id
 5b1f17b1804b1-4a18e4a54f2mr203339365e9.24.1791824635485; 
 Mon, 12 Oct 2026 10:03:55 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be8c5e7sm377433855e9.4.2026.10.12.10.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 10:03:50 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A04125FA43;
 Mon, 12 Oct 2026 18:03:31 +0100 (BST)
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
Subject: [PATCH v2 06/16] tests/functional: update x86_64 tuxrun images
Date: Mon, 12 Oct 2026 18:03:20 +0100
Message-ID: <20261012170330.1144446-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012170330.1144446-1-alex.bennee@linaro.org>
References: <20261012170330.1144446-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20260930164649.433573-10-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/x86_64/test_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/x86_64/test_tuxrun.py b/tests/functional/x86_64/test_tuxrun.py
index 729f6447d05..026b373accb 100755
--- a/tests/functional/x86_64/test_tuxrun.py
+++ b/tests/functional/x86_64/test_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunX86Test(TuxRunBaselineTest):
 
     ASSET_X86_64_KERNEL = Asset(
-        'https://storage.tuxboot.com/buildroot/20241119/x86_64/bzImage',
-        'f57bfc6553bcd6e0a54aab86095bf642b33b5571d14e3af1731b18c87ed5aef8')
+        'https://storage.tuxboot.com/kernels/6.18.54/x86_64/bzImage',
+        '24a3ade610c2cc426ff821050de8a35930b0371357d94cc2c334abac6658552b')
     ASSET_X86_64_ROOTFS = Asset(
-        'https://storage.tuxboot.com/buildroot/20241119/x86_64/rootfs.ext4.zst',
-        '4b8b2a99117519c5290e1202cb36eb6c7aaba92b357b5160f5970cf5fb78a751')
+        'https://storage.tuxboot.com/buildroot/20260924/x86_64/rootfs.ext4.zst',
+        '8e310455b0244414ccff29c507f7ccfd4032e3587cc405e49ab0322738e3e27c')
 
     def test_x86_64(self):
         self.require_accelerator("tcg")
-- 
2.47.3


