Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB919606A31D
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 19:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vRROTqVj
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIt0u-0000SI-1D; Mon, 19 Oct 2026 15:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt0q-0000Rl-L1
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:12 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt0m-00033G-RV
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:11 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso26477985e9.1
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 12:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792438027; x=1793042827; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=EL0Vj3lE1wOMC+825DlATKPDfWDFpznI37+dufm74XU=;
 b=vRROTqVjNVxVlqUwYJUoBWeUbvjq3p6Xu69/zBWVnl5OV13wEpXIruK3UWIoOyqFqI
 022WE0aj1KKIh030q0NAceDfAvLhK4nFdfprSM8rHENHRjpCJ1jDzCRI0dXbkqVIjQve
 MAsOiFMQLC3aaXo2n9i8VtsrxHdQIxG6UjpRWFAYMQWEfQK2yJ6Dd6aK6CwCoZhfbvBX
 y9+8HFnPye6N+5G2jpUhHQDu/V20KkLf8A/QvkD2PAzBHo+GThmAyIEUBAsD6fiSxgy2
 HvYwJbzHqle3O0yYe26eCR4hWWMjJA9rpXUQaVzK/NRCQhrm3fVdUNXqFQMQVOwj0/AC
 vU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792438027; x=1793042827;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=EL0Vj3lE1wOMC+825DlATKPDfWDFpznI37+dufm74XU=;
 b=opSgp/nCkRgD/c33WlrzEg/9J7tSC4jQPhJD6d+V/esZLsgKM9HZxcxB5r0D0nwtqS
 9XKPhhJXhtG612HrG3LWKrmwj9wU8YeY+Qhk7OGJJTxzpkZs3aQQwk5L8ucKpeA5v2aj
 cG7FI2tTaSlm0TJWdjKhO61yUWpyx32e3jew0N39h4oZDfobWswbEfMCEu7gPcBus+IF
 Lo3h4rcJE/+70SK0Mhdfmuylm4dnIpm5ipfnr+MXbuhTquG5SJSUzGXvIwFQJ4WnhaOM
 wp+OhyCsC7aklvax3diO6b95hPOcFHtVUZjXy0/NzsGwqZEUG8RCxXf1tEJvHjJWwrwt
 r4Lw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzLdovLNU0TOs/mc1qBW0r04lfiT4jobg82TbW9QyBWc484l4swrDw5fT+/RDjC5HUAaBADiAk6fw==@nongnu.org
X-Gm-Message-State: AFq9FYJekxiOEa8ixHyBChgng7DKU1J+52LNbEBZOIujo1ndv1IkQb96
 oPflYHycAxDVTrt2vbLOfgkshqt2kS5xMyZxU7w2yHA81BT7ukHuFL4Z9habyY+GpOg=
X-Gm-Gg: AYBFou1cNxI/UmWAWziOx3AwsohrAUr/IuVkaH61fmOLkdzVuaQvyuAJava3A3dBzBu
 lNT9lbLKJIreqioTW6EO/Qr6YAHo3HHVhprs058Aq71xWg8ZxMH3RXr7FWhw72xiMWT4u3IZNim
 QDWEOeYO/TQNjPNWxhiYBEyhSDm2FZE5DS3uvyQ8UsF/7sI6JMqJKExNs5f55sfL522hc2D7inp
 YnljgGqRtVDMp0C/oIdsVkaY/E2p59l1GAtAbns8TjYEOroalgTwrY08CtzEqP8U70TG1UMISKo
 yUrGc1sv94/08MTnfZp48rF6DGgXYQMo/CIjGTD6HH3EFenXPdOkMVQVuIOMvO1W/bO7po8fsI6
 uiu9rC8FQN+eHbEo7r+RFq0Xqb0Pku/4iku+FMmFTACIo1GlTMu+1R1MJwjqy9bqlZzJaksHyF5
 CWVM6JKRiSSA6ayXv0QH4nDTnn+tUUUnC8Px1ez0LF0Y1VTe3RjbGttq+hkcYtJL58Zeboog==
X-Received: by 2002:a05:600c:4f95:b0:4a1:706f:b40d with SMTP id
 5b1f17b1804b1-4a1d75e6f9bmr193127455e9.7.1792438026676; 
 Mon, 19 Oct 2026 12:27:06 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f2c242dcsm13709675e9.0.2026.10.19.12.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 12:27:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1A31F5F8DC;
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
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 01/19] tests/functional: test_acpi_bits requires TCG
Date: Mon, 19 Oct 2026 20:26:46 +0100
Message-ID: <20261019192704.3220373-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019192704.3220373-1-alex.bennee@linaro.org>
References: <20261019192704.3220373-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


