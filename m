Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E94C982D2
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 16:57:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7FQ0-00080p-8L; Thu, 17 Sep 2026 12:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FPS-0007ki-Qc
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:56:32 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FPQ-0000qP-UV
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:56:30 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f6350faaso682791f8f.0
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 09:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789664187; x=1790268987; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=++nhsAjVYxHqC7ITngNw+KCNgr01nqcmt43kfCcAxLk=;
 b=jbibokHQ542O8uMXsNu1t5mGejUGqJsxwWy1uNInCxCuAbzYNCjvrWhI3LoRXX5+4F
 vHv5ZGXK/qS1aL5gWfVMzep6L5CPiVyAk4y9wCaBFDK5M/F5XwF6qyE3klQXhEopMPrd
 y6nJ/7qb5Z1g26untEiSuBKhehvrrTE+708NvJ9YE5FpyX8E0KTsO8Iz6A86LCNEr5vt
 uZyuClOofQaa25tymqp9I4zJo+//KDNNBDJa3kCfoCuzpoMjq10YlFi0JN90poJy9TDi
 XqMIyzy50xf7uHMisdQ0pCvIInZ+3c2RP5XWIVB2FhMVYT/R06xL/mQnA3Tc0aZpsuAj
 6ZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789664187; x=1790268987;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=++nhsAjVYxHqC7ITngNw+KCNgr01nqcmt43kfCcAxLk=;
 b=jhl5XxyJgodbTRLrAJxr7nIpI5KlGFKKFQIP2Q/BA0vD71l6jh1mnVr59f7xFSY1Ja
 J2ZB98w02DdrYHdiOD2EsKl5lzR14HuLAkOCbqT69h5LQlWER4XBQCxUrgiKazjiYYqm
 pD/v/MR7gWQtSvddZkWDSBBdMZtElCqrh/yfUdBzkprheXb0Ka3dIiIz+/sBEu2/NSEw
 C5HTegvGv8AFWLG/Q2PBRvmzavYu09aATeMgSmGuzncFcy5F15d+Z44yISoUT/m6rudQ
 FcTzowqpwnybmjuYEmpbrMavfvFlKyo46llIEqiHsEcu9yyPuOC1EBa3JVB0LZxGBUoU
 Gwgw==
X-Forwarded-Encrypted: i=1;
 AKwUvByAR9n5LFc6ZadSMg9d2f1/BNpZ3YU3Oh4aFQnmDYLMIquXq2sjXrkYtMW9AMNOxfXIpQPDrYmLkA==@nongnu.org
X-Gm-Message-State: AFuF++mz3zshCR1VqwV0D5sQvfAj6tWF8KSy0m5bRx1g3EzWsE+S43kx
 PunMgj4XZU9H0FJvryCa34ehQbfvv6B3y9u8TDvsVIrKPbpeqZlNaCUYbfw5fJ115yk=
X-Gm-Gg: AYBFou1Y2D6BBwJyg2jPDpKqXf3r1fGFJK0JyIod6RcEkBWTOr1O1G4O8rk3zpBn8QQ
 1Pd8qhgMAZ+W1aWKgr3o6yn4dJOunCn/ReCLN9yDN7dlWZmlsWZ7dF+FvOu7sw6kJakGvCjbD8U
 4oigJfIMNRlrg7VB6PPzYHDZdhZT1kcb0D1PaD9wTNhu1qBFD3L4uAkuLUUr07Oyjeiwh6E8+TL
 5RPIrKepyR02VCEZ5gzhyZsUfRAGoUvxZ3FUIGnhmtomq4RyiBjBH4/HwRaRv2sK5tSPddHrpsj
 i0hKQX6XdnI0t2fBw8dYJ2wuGAYLpNKlvFxofng7dsS+2e5KBaeQ2nMjs7LwsPBJpTFJA2unsL+
 kpV2xOoT8n4ygwlXOI0S5HMM0XwY/C/9QIUrsS1YuKCoScOce2As7Bq5np39ppQAsvNdD2geb6j
 IwZKGeyXgCnw8n0CkLwpx0b90Gk/lUquX+/L7uJ2MHCnqUzFsLnzy/v+MZDuQV3bpBQlLlQW0=
X-Received: by 2002:a05:6000:1884:b0:487:71a:be5e with SMTP id
 ffacd0b85a97d-4870d067873mr10557384f8f.28.1789664187325; 
 Thu, 17 Sep 2026 09:56:27 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf1fa70sm16797285f8f.9.2026.09.17.09.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 09:56:18 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3DC5A5FC4B;
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
Subject: [PATCH v5 10/17] tests/docker: remove used _read_qemu_dockerfile
Date: Thu, 17 Sep 2026 17:55:54 +0100
Message-ID: <20260917165602.3405537-11-alex.bennee@linaro.org>
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

This is no longer needed since the functionality using it was removed.

Fixes: 07056db1b50 (tests/docker: remove FROM qemu/ support from docker.py)
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 6090a9dc957..fd0cbdfe856 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -175,16 +175,6 @@ def _check_binfmt_misc(executable):
     return interp, True
 
 
-def _read_qemu_dockerfile(img_name):
-    # special case for Debian linux-user images
-    if img_name.startswith("debian") and img_name.endswith("user"):
-        img_name = "debian-bootstrap"
-
-    df = os.path.join(os.path.dirname(__file__), "dockerfiles",
-                      img_name + ".docker")
-    return _read_dockerfile(df)
-
-
 def _dockerfile_verify_flat(df):
     "Verify we do not include other qemu/ layers"
     for l in df.splitlines():
-- 
2.47.3


