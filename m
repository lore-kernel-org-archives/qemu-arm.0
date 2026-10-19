Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C37606A31D
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 19:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xQ/nzEQD
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xItAY-0000uR-7q; Mon, 19 Oct 2026 15:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xItAH-0000qP-FT
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:36:59 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xItAE-0004lT-E1
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:36:57 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso26555235e9.1
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 12:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792438613; x=1793043413; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ISZ432WiNiKyhWGrnzJzq0NSI7GeLyHw+4NNmOBMeMU=;
 b=xQ/nzEQDZUoc3yKBNI1FlrFCfJ97vqZ6dDmD9gYbegx5A5AHabRDbJqoX42dsDVZgy
 7o/wJEkwfEhIyylysWuDp9MbSRwoQNeHiSI9jINf0yi8cgWvqR4dGGmLdCRCDaF2hDIA
 XiIFlYInznHP5W01czGq6HQbybkrqBZFLJgxcJT6+SwSovXXagWHIhyespUqFzM3e06S
 mKRszJebeYo7tZbOSziPDLD3axuNcYX7jYmB7HW3mM/ZdJljAdUkttBoeS2nUGPtypWO
 gTS2RpGSXv5WF8aE1F4w3pEv2zGv/yLh8xXQoKkC0CsBgjQkcaMOu3BjK9IV8sD+TnW3
 JF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792438613; x=1793043413;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ISZ432WiNiKyhWGrnzJzq0NSI7GeLyHw+4NNmOBMeMU=;
 b=S5zJrj+dEZfyBwZVBHLjJsoZTCt7cnZ21SczHx+R+wExet6S+uSS8o9dasJ7XstNgN
 mLC+sztxl0gjZ+c0wv+stH+kQHQpYprj7K5SZuSl/1XUAO5Cb6CWbQzCYw+XkejCrFI/
 xgEqWoYJMrn/g550RHe6YiI76VhoFjReeVfSOaOpwkhcuJMFIoa/pq5/0jj1ZxLOf3jX
 QGghmRiYbsGGzgNCLYn/Tgg6KbQhEHtY5MusfWRZ0BNQYVWOFXaAJzxhqwkMcfzbykmR
 8GUoAZX3FPzWkINhRZJNBMHf9GwZY3k4yJzal7jHr7+4NcH17R3v+J/qqmx0G9gJbZKl
 0G7w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzfaTuVyIqkCcASp2LxzqAtM9n6Vs+AzTGwlIIlrP6razkZLGeZDKmwfEyTREdv2kJse2geZEPOlA==@nongnu.org
X-Gm-Message-State: AFq9FYK/exlks7CDGv+vYp6HTE5l6UcVgdEjxw+29/8nlX9yERmL/L+X
 IDY/BoigOqHGikUu3+RntKlnh5DfGSJhAx2bCd9is1R7s3J5jlMc+qU91H44IIRFbEU=
X-Gm-Gg: AYBFou3u76DGXap72l68kalbKY/C7MjHyAtOR975jZjQ7DtRS0mZRyqgm+0iyBjBZUR
 0NRQ3SLM4SModJPucM+MEmxvSlsLiK0CNePR0dFwotrTJZs5cBZJsfkwcnMmIDBVPoqB+gH520U
 1l9ofADssjj8BYqTK5Pb7uTrEqKSTo4gvFdE+SjkcRluJ/nkhuoz0SQbcM4IHSUNA1goFhtFRZk
 8YujoPj27kWLTDqF1AHh2mPM6bzIR9DUf3vcpNvx0PvrKIth4RyUURO8tj6Ba4Fvkz/zYkJ6MeB
 yLmoNsOwK+Vn/0q5G+LqjB1y5e2fsN8OF5M9qoHFAIk3Rk71pxQCEx3o8nsJJHOVQfw003IKZUK
 /4pMZk/XGv0lKad6NhVaezXZiptf/B7vfOSf+Xdy+GQkIf8gZosbfJ0GSjwI+4GjvCSqFr1a3dk
 NJVjJ2lqnwa+T9eCJNle5ZxxWP03lTMdvAwmDp9gkm36i8Wu1hEKA9XwgAieX7Is4oZ2ySlF/+h
 GUM+21g
X-Received: by 2002:a05:600c:3e17:b0:49d:34:420d with SMTP id
 5b1f17b1804b1-4a1d7601e40mr186469985e9.20.1792438612740; 
 Mon, 19 Oct 2026 12:36:52 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8ce32absm204561225e9.1.2026.10.19.12.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 12:36:48 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8F5105FE0E;
 Mon, 19 Oct 2026 20:27:06 +0100 (BST)
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
Subject: [PATCH v3 15/19] tests/functional: update arm64 tuxrun images
Date: Mon, 19 Oct 2026 20:27:00 +0100
Message-ID: <20261019192704.3220373-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019192704.3220373-1-alex.bennee@linaro.org>
References: <20261019192704.3220373-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We now fetch the kernel from a different location to the buildroot
image itself. This is because we will want to access additional kernel
metadata in future tests.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - reword commit to make it clearer
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


