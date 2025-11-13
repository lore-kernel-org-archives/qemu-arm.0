Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2308ACD5BBB
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Nov 2025 10:28:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJUWT-00081G-2C; Thu, 13 Nov 2025 05:25:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJUWQ-0007uk-CL
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 05:25:46 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vJUWG-0007KB-F1
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 05:25:45 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b713c7096f9so74289866b.3
 for <qemu-arm@nongnu.org>; Thu, 13 Nov 2025 02:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763029535; x=1763634335; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UkgDEGpjp4w+u5Dg5xmWRAxGeNrpQ0virl1sQpXH2RY=;
 b=SBbsAuyGgLJnIclrrEguHPtQDEsTqraHUDYqFTs82Sj/Q17RJzL1965A2RD5p1IM9V
 ryWlLopJZi/6PNcrhqa/KWTf4I5TQawjFBWehl7VQamRlxPgZMPLcxkSbLy8ZawpEGNV
 DsyiLUrPW0yrWtTCubLc7gcX+EzVG3WKHQ+52j8AtAEwVNbR4BrwcQKd/Dq6hnQNnZRb
 iCz9RoysPocrox1J5uG5mWmjNvpNKfVza1Bho4gJl6hA83FbRVcQPyWV5Hww4ttEryhW
 TkDUuKxwvx7Ld3rYfPY2IJVDzIUMW1ubVdOa+G8+cWwx/+NZHKa8A8EefnqfRWF79ke7
 qe/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763029535; x=1763634335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UkgDEGpjp4w+u5Dg5xmWRAxGeNrpQ0virl1sQpXH2RY=;
 b=L5lkwYZTQTSMI7rcO1/KXpTl/+EUETf0F5MP3Dhadpko+P1TVzzj/LJDWcGupc8fP6
 2emAxWXtw9aJgqk/t9fNdbrQMs3jE295Lo8UTfidyZQWMkdHMUJhmZtEgsUyslDJFEJ2
 umzhXgXJj4W1brYJVVbN8J3yhipVw+9tmD2cHnpU39uEtb17oghCEdtcA0hib2odDHCu
 y7u9Gfb4bC2SeG0KRlLyb0ORVfPmW2IcJgN4ToZ9bPy/yBU2GWbv9SW6J/NRdSkSXYHv
 +5yKqYyOvCfMGq3tzxEnzu8nfyaXkwYYeGDLP7DUgmljpOrFR/4pGfasaYTS6LpKhoIy
 zMBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWThZHCo6wyh3/KqwOptKDdyw/RbVp0WY8ftzKZmLxfvRmnFbj8qUk3RpyP+CpP591BSf163kyanQ==@nongnu.org
X-Gm-Message-State: AOJu0YwgWYCE/51QCu+uzVqqj4aePHZ4J+KKHshR1QfTwy0vcnTHPv7A
 ICbLOHhzG+tweN502cNQsJol8QW9KCS2xmCEfZVFSp5QYCaGqxSHEcYg4LD+ozXe0Ks=
X-Gm-Gg: ASbGncsGHuN7NKSncEBxCBioZFdDLut1cuGBSZqjA3lB0jgTPQTWV1ywqbu1GqLmWFT
 HuCjdatXBO1p6zRrKLiYaWvDWIyrcA2OVjUKiv+eXnGsHkiRWxsUtsrgmASz735B/YfAFuXFVv5
 G3zvah8mWRn/d1epgEJWlEUQI4ZHKB2hzY8KRexKiyDiGuWOQ/R5yL/rP3OACZh7QNj5bb6paM9
 AXRyHdP88X9EK2smeXolk/tfHslrBNtfryFXtmC/eGGjNLboCXyTE2aw2GjrzsYVEXe+nwg1j7T
 24KZ6ebRGz5QHqI8L8nXnMcyPq+zG0A+RzJz2+qtH5CxI7dgyEpe/Qa/cLA4BiPwvfZVbS0h37U
 XSg7FZaJdNq7EppRA7nd3eVJsxALwB+eajeQhc7ZeTpRqARdAaTZqbQbWvjyczJoXZgSen+Q7EO
 mY
X-Google-Smtp-Source: AGHT+IHWeaC0wY9ccVsTiz2phFAUfWFNz9FbjBQkABFLxC/XdOjCNk3RJD2luixLdg+m6NaPZRlaMQ==
X-Received: by 2002:a17:907:bb81:b0:b73:4b56:7a37 with SMTP id
 a640c23a62f3a-b734b567c09mr163198966b.30.1763029534982; 
 Thu, 13 Nov 2025 02:25:34 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm128747866b.1.2025.11.13.02.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 02:25:30 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0D37F601A6;
 Thu, 13 Nov 2025 10:25:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 David Woodhouse <dwmw2@infradead.org>, Ed Maste <emaste@freebsd.org>,
 qemu-stable@nongnu.org
Subject: [PATCH v2 11/18] tests: move test_kvm to share.linaro.org
Date: Thu, 13 Nov 2025 10:25:17 +0000
Message-ID: <20251113102525.1255370-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251113102525.1255370-1-alex.bennee@linaro.org>
References: <20251113102525.1255370-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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

Linaro are migrating file-hosting from the old NextCloud instance to
another sharing site.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: qemu-stable@nongnu.org

---
v2
  - indentation to avoid long lines
---
 tests/functional/aarch64/test_kvm.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/functional/aarch64/test_kvm.py b/tests/functional/aarch64/test_kvm.py
index 9fb9286139f..0a89694ca75 100755
--- a/tests/functional/aarch64/test_kvm.py
+++ b/tests/functional/aarch64/test_kvm.py
@@ -19,9 +19,7 @@
 class Aarch64VirtKVMTests(LinuxKernelTest):
 
     ASSET_KVM_TEST_KERNEL = Asset(
-        'https://fileserver.linaro.org/s/HmjaxXXYHYSqbes/'
-        'download?path=%2F&files='
-        'image-with-kvm-tool-and-unit-tests.gz',
+        'https://share.linaro.org/downloadFile?id=Dt5pQbTe5RrxEii',
         '34de4aaea90db5da42729e7d28b77f392c37a2f4da859f889a5234aaf0970696')
 
     # make it easier to detect successful return to shell
-- 
2.47.3


