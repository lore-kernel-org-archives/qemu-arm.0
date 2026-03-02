Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DE7C624C6
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 09:24:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vwzU8-0001Lx-K0; Mon, 02 Mar 2026 04:22:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzU7-0001LK-G4
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:39 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzU5-0007iY-RV
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:39 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4833115090dso42769035e9.3
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 01:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772443356; x=1773048156; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gxlGmMADfBkDj23qA/r1rspF51lHVkOiqdCHs5z6fO0=;
 b=PsXE9euLDwt8maLDX4x8bwfRkqzlrvyKjK2nRV2u6VtSo7+7VYx0TL/7axrYRKbESn
 m4bLA/gzOcehb+ZsGusHSgMBVC0CV9nRrgVJhcOAfsjov5qXGqEyHLO4bMwlwBugRF0D
 6kW58zBChsyqUw+IDOuie3AAIGcvRPRb/J1naeFL6Gjb9ClGSfqwn6qil5u27bB16SiP
 S35SM217gaei0vwp3OIUR9BdC0oHLcFHaIA5lgQwvZuKbMfpWADKccWEHG3vXgxGCO6c
 A7cw+QXSuFzu1ftyXj9vr5kx2mMCHOHLgZLCVz+H3r/+ZU9Gnpu/RNV+QpZLUk/4IJym
 1LEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772443356; x=1773048156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gxlGmMADfBkDj23qA/r1rspF51lHVkOiqdCHs5z6fO0=;
 b=lVGyi3L5MC0HQiTljMjgYgaDnqWVf9LFRfGRuNiYaKGvZOwnGoKJ9xBqmxvgvugz+F
 txPObwrXt+tlj7pL3o2JbYGK35E+s2Qzu1q6aMevxNSUXyop3+ASWA3vSHb5wngEQbeA
 liESvLOTEYAKpLL/q8fyqsu1+qJDBJMNNtZVNpdqBoLxAc5CEOKQILLp76FrqfOpwTKA
 txt5rGPsELDbmtUCw4O2OzGeSy4/dHJ8dhHCpu5Hwb0T17RbJk+gzPFkJ6jAcmc8eK51
 0JQ088+lKcGZaZoAYviOvqt7oXOVG3IGkzNwMFE/lRCo4K78BSMPJvKmbQ9RCLt/+PmJ
 qqKA==
X-Gm-Message-State: AOJu0YyW6JdlcdNCbJGaf6rAuGHe4jrpJcUm5QxNG7gxJqK6+sXQv2jI
 B4cJzdVcXUbkGx86XsZoNWOqcVmO7rSEgi/fu0xuOa374Q7xs1EexjxxVvmTtaAJQNPRO9iG9Vc
 YojCp
X-Gm-Gg: ATEYQzwRYgiJhB9eD3EeISMH+wpmWwR8sKXsMCNXuZu/7FfeYH6HQscelXjpK9l37MZ
 vj5lpTONDglu/QqGDmY4MkiAc28fJMwMqum8xeYXNXsBWS22KN9ZF8FEvCmhLQREC9JuQqIKqRk
 laiC7mJOAU55uaMLu2wCtsEzwOE/YPCsc1Q/UwOem1qQHU/gP7HoRHuLeCT3IbIXXzRbWejpokG
 YORYgz4sbb7WQR1tV7HwDF+G20r0Clqv5/J7PszesEwLK8OMSNTIFT1IoNfH95Ehyyps3FULMDz
 SnM1AUxHus76yBhQX7T8Bng0yBarB/pV4RnLsucVDXPMYj/0BLnGv49wYAjvaFRspPa/eAeA6Cj
 LXJEAFk/bsc57G1hePns8Nj/QDe+fUqv4XcuvBJel+rEzVP402bqfyItnfWjvfTXHywrKBWPUJj
 S1eiE/i5klOYNxA+VK41b0MQ0QPzv7liZ08Z3H8C/LlK5KCm6yZgXLOJxCN+/nlJsjfdQfpLc7Q
 qd7mHk8gIAddPcValQyx7SxViq7HkSbnQb6Kzhlkg==
X-Received: by 2002:a05:600c:46c4:b0:483:b505:9db4 with SMTP id
 5b1f17b1804b1-483c9c0f1d1mr198756705e9.31.1772443356398; 
 Mon, 02 Mar 2026 01:22:36 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb9d9c6sm129435305e9.14.2026.03.02.01.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 01:22:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Yodel Eldar <yodel.eldar@yodel.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 8/9] tests/qtest/test-x86-cpuid-compat: Free allocated
 memory
Date: Mon,  2 Mar 2026 09:22:24 +0000
Message-ID: <20260302092225.4088227-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302092225.4088227-1-peter.maydell@linaro.org>
References: <20260302092225.4088227-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Fabiano Rosas <farosas@suse.de>

Free the test arguments after test execution.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/test-x86-cpuid-compat.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/test-x86-cpuid-compat.c b/tests/qtest/test-x86-cpuid-compat.c
index 5e0547e81b..b2d884054a 100644
--- a/tests/qtest/test-x86-cpuid-compat.c
+++ b/tests/qtest/test-x86-cpuid-compat.c
@@ -65,6 +65,8 @@ static void test_cpuid_prop(const void *data)
 
     qobject_unref(value);
     g_free(path);
+    g_free((void *)args->cmdline);
+    g_free((void *)data);
 }
 
 static void add_cpuid_test(const char *name, const char *cpu,
@@ -161,6 +163,8 @@ static void test_feature_flag(const void *data)
     qobject_unref(present);
     qobject_unref(filtered);
     g_free(path);
+    g_free((void *)args->cmdline);
+    g_free((void *)data);
 }
 
 /*
-- 
2.43.0


