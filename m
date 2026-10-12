Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDDFCA9EDD
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 17:04:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGJRp-0005PI-7z; Mon, 12 Oct 2026 13:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRL-0005CP-8c
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:03:55 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRH-00075B-Sh
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:03:53 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-49ff680331aso16948895e9.3
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 10:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791824625; x=1792429425; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=EL0Vj3lE1wOMC+825DlATKPDfWDFpznI37+dufm74XU=;
 b=fg4MZz2PYmPVYgoNs5wc/C3fbbRdP6XHjosp7FSU3i7Dia0+2OIrt5S3AAHieagwS2
 w8L6tAGyxPZQ4OxPp38lHaTvjsxTrqciclcvZtdic8+M9+wntoExIJ5SZ+bz3fnBaknf
 FqNwVjv8TzFcHESdxtX203B0oETJGEfwK3jiDlR+bbuquwSyuBp8vlqvPYYIUzwYo+Vt
 +H7G2FVjGHi6xA2GJG6qxMfNQBfvvado5j6QRJOyoNUyVHprOvupgwus2KeM6St5g8/H
 mIZcP/7srQM8WUE7gJY6WyHcepNGM9WOHo7bKvLvLkXegtOFCWAN+df5vnhdcHNTXv36
 l+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791824625; x=1792429425;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=EL0Vj3lE1wOMC+825DlATKPDfWDFpznI37+dufm74XU=;
 b=tGrWOK5Kz/8+kspQ2s+LP3rahqlxwT2AXnMQz0LEP9JlcVGBFynmPKpJ8Q46RGBPJc
 q2Mn80iCtpFvu4zo1M5pKbOiAk/5UdbIXvUQXUdWp0XaaUHhZAZHjrd1ATNoiRf4ZHFU
 hnV/KsB+uTrYD3E3Cmnq/5U+5iw2kxFzQy41nbMCavQxDQBeCc48mj6g7Tc1NygR+Itq
 4T6MsMBcBZY2Zf5yhUBSIumyHsCqfBtR962fP6fZx0iBDq3GBWs2ob0zbVDrSJo3N9QN
 esL2dVVpqjrVx6NuDc0XhxIEp2ZZVI3206cmRUyLE9b8i26GveeoLYoRqLkswtLN3h+O
 +uGA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzZb9W6IDLWFwa8ka++zgrGHT3A8dTDBcQhZ/+NbBk22GG2T9uMlwESCd5X4qDBTPrSUH5W0Tz/ug==@nongnu.org
X-Gm-Message-State: AFq9FYJlUn1LRABv9b/TEqXy+LF/kxKb9xtspIaCV9w0ngYOOrBGo54q
 nuUOf/O8A7Yh7ZOAcFr08T6PvRAGdGvE4hhSJrMAx59IK7K7a3zXfn7WJt1cwYAAjKM=
X-Gm-Gg: AYBFou1gGRlxgdsVBwpL15P/1Bh3OEEn4gnJ7UWCdqiFk5gruy+ccy0mfS4SgnfKZR3
 3TIoVAA83kORHDivwwcX5eKG7YFATyZ2UpAr8/Sg8IikIM+EMmNz2GWZgVmYICI40x00G8Ss2Qd
 BFlTuFpX21juMi+/SECVQbbv+5WpVvlcRBb7I0IZOnrarPyvwBxT9TMs8AQfCRvy+3D+oVEJstW
 QiJKc7khadXxJfdaawNEHoZPGXFf3xnYEoBr52HM0Ifg5+M699nR3XYUgjulPOhJnMbaZkthB8u
 jLC5s6SJB0C947g69LS/5NMogMVXr6L6zBcnRbnAQi7EU1KKTLjkzrVatLaGe9n+GdWxvg2uuM0
 t+BniSsbtK4/Qbi3WLfaJn4VLF5QYzSAbSK79FQpHcgcQXewhwb4XsvHX1evp4tvKIYZ520amap
 10Au/o6xUzRLUAskY6yZFwxZabAjklEPQ5sL7AIxRbUDQ9U40KQQPoGwMsJlCyyA1mFetWwA==
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id
 5b1f17b1804b1-4a18e47aa9amr208081735e9.6.1791824624010; 
 Mon, 12 Oct 2026 10:03:44 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0aaaaebsm456786f8f.14.2026.10.12.10.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 10:03:33 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 21E9A5F8D4;
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
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 01/16] tests/functional: test_acpi_bits requires TCG
Date: Mon, 12 Oct 2026 18:03:15 +0100
Message-ID: <20261012170330.1144446-2-alex.bennee@linaro.org>
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

Running a full thorough test suite on a KVM-only build fails due to
acpi bits needing icount, therefor tcg. Declare the restriction so the
test harness can skip it.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Message-ID: <20260930164649.433573-2-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - add comment
---
 tests/functional/x86_64/test_acpi_bits.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/functional/x86_64/test_acpi_bits.py b/tests/functional/x86_64/test_acpi_bits.py
index ec716d643bf..d445660f0ed 100755
--- a/tests/functional/x86_64/test_acpi_bits.py
+++ b/tests/functional/x86_64/test_acpi_bits.py
@@ -303,6 +303,9 @@ def test_acpi_smbios_bits(self):
         """The main test case implementation."""
 
         self.set_machine('pc')
+        # see icount comment below
+        self.require_accelerator('tcg')
+
         iso_file = self.scratch_file('bits-%d.iso' % self.BITS_INTERNAL_VER)
 
         self.assertTrue(os.access(iso_file, os.R_OK))
-- 
2.47.3


