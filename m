Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1461A1098797
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 15:53:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3c8A-0007ac-Ud; Fri, 20 Mar 2026 11:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3c83-0007XR-Nz
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 11:51:15 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3c80-0005Vx-Vx
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 11:51:15 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b9358dd7f79so128669366b.1
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 08:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774021871; x=1774626671; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Re1Z7KTF6pGt06r2qKUhhUG6rRUM2+jHUzT54RyU8Vo=;
 b=ONLR23h2OB3+66OF7Xx3ksY71yKh1fkffBSlRn0WYzlcGGVv6S301KIgJa3TZ/AnEB
 WdQyMjPNP+QVbbQfhnVVdKVBEcA4IN7+sH3BKVhtks/F2ymr/iihnhdO5+ZR8dY26H0+
 ZtdMvmnWmVe6bYwP0z2N+OeagcGNTkLu1XZL2k77lqOFgPAJir0piEwMfZCdETBchXaP
 bGFgv6TVWIcjqOytNvTYFizRJ4VGOAiE2BW7y0j4qlpfIcHkKUDtNW8YDPi3OaTYrljh
 CMt33nYSsePhh1zTdvbYZzUJ93yZG1RMYS3W4WI3/J9kn6MA+dSgozzmvvUbgWgfMxOO
 V/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774021871; x=1774626671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Re1Z7KTF6pGt06r2qKUhhUG6rRUM2+jHUzT54RyU8Vo=;
 b=HjyENFq32Px6UO4vtXzLBbPT8VP2i7RBtuOsKQ1TnUpG6ZKN8d9aNEIYjHB8QwfBcu
 ccDSrJKmbySjtmwJMpnwNrjj90o62WNSV3dhw855BT2fqpxNlkIH2ybQMb151wdNgwk5
 5tYhQTM0UWvwaX0eA/Y7Zncm/wcbkrFhr3yypXpf1omDwLC5w6YLHceFEfeojvPr8/Uc
 Vu4mRooD36+pkljiZnobNQstMX1deELG98TJx2tdqVgKbfuwzf9BbIqgGQIGn5gFjjxH
 aZ6q+5l4pl1g0/TOjjy2oD9d+hZGqv2FMlk0vuqctuSchwZTcCzhUvUVeRbHvqQ/L73W
 ktmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURKxIh/PpT98PXyFbvuokRZ7lNWJT2KsiNP5/WaxY7C9tlrYk/eErbXqKB2PDR5UYMv/gNmwR/mQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzw9/dNIbeRESjWwUMnU+bt1QFNhdU54ic4Gko9PYkri1DRY23V
 fVFNzUlJpfn/5eysPvJq78SljCprV1GTneJI+Nz4G21SQ0DmBn4wbAwioHujygfwQlI=
X-Gm-Gg: ATEYQzzfiV4xd54xkVi/hrOFYiM4mHXnWDf7bUR1H1UIECSC+B0wJuAqHsU/v+ui+yq
 np2Ab6829nD0a0HxrQ0Jy6AyOtT4DUszm8gBepdSYek8liRix/FigPR+q4QYD+7FQJBefu5eSIM
 0Kr9pUU0hn8Dn652CJYzJOKVAUcO++Xd94OycbAFJ229tGoVx7lYpqvPYp8CMlB+6MhQLBv1Fi+
 v2rxh0i/t2cTc4Nh9k7vvtFj2zc8DaB1TxewVduK6rnc4CwYWaI+nafKDPqNm6P4drRyeARdxru
 QA6bl3q1+8lKYL+OC9NrTjBvfIRq+8kkuZJrYvH4VujKMdWNtXtHw1RAElH2pqVAvNnqxQyFPQ9
 jTXHaMDAqRlgc2UQyaNAfOetRaMculgymsxrReauRPgdhO5iOmMl4SerysnM9EFkbzQqemGFW/P
 1Ar7lA1y2/QGJYNF5wzG0adbc=
X-Received: by 2002:a17:907:1604:b0:b97:edc1:f9c4 with SMTP id
 a640c23a62f3a-b982f1ed7b2mr288505466b.1.1774021871186; 
 Fri, 20 Mar 2026 08:51:11 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f8dc51sm169939766b.22.2026.03.20.08.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:51:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0C8535F911;
 Fri, 20 Mar 2026 15:51:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Warner Losh <imp@bsdimp.com>, qemu-arm@nongnu.org,
 Thomas Huth <th.huth+qemu@posteo.eu>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Brad Smith <brad@comstyle.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 3/8] tests/functional: allow tests to define decompression
 target
Date: Fri, 20 Mar 2026 15:51:02 +0000
Message-ID: <20260320155107.2143191-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320155107.2143191-1-alex.bennee@linaro.org>
References: <20260320155107.2143191-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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

When dealing with multi-stage decompression we want to specify the
target file name lest we just overload the cache name. It also allows
for something is little more friendly than the cache hash.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/testcase.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
index c2c916f6077..eaec1bea138 100644
--- a/tests/functional/qemu_test/testcase.py
+++ b/tests/functional/qemu_test/testcase.py
@@ -35,7 +35,7 @@
 
 class QemuBaseTest(unittest.TestCase):
 
-    def uncompress(self, compressed, format=None):
+    def uncompress(self, compressed, target=None, format=None):
         '''
         @params compressed: filename, Asset, or file-like object to uncompress
         @params format: optional compression format (gzip, lzma)
@@ -52,8 +52,11 @@ def uncompress(self, compressed, format=None):
         if isinstance(compressed, Asset):
             compressed.fetch()
 
-        (name, _ext) = os.path.splitext(str(compressed))
-        uncompressed = self.scratch_file(os.path.basename(name))
+        if target is not None:
+            uncompressed = self.scratch_file(target)
+        else:
+            (name, _ext) = os.path.splitext(str(compressed))
+            uncompressed = self.scratch_file(os.path.basename(name))
 
         uncompress(compressed, uncompressed, format)
 
-- 
2.47.3


