Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9E6CD4F46
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 17:17:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOIc2-0002JL-Gx; Sat, 16 May 2026 13:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIbz-0002Ia-1l
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:15:40 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIbw-0007wh-5A
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:15:38 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so8360105e9.2
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 10:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778951734; x=1779556534; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K1V+GWtucxSZl1YZ8nu1MtklisKojriGnpVCnzAvOg4=;
 b=ol34DBFuewsCoFEFKHoTuleOmV4Xf2WKIQ7SH83VGFW1BtwfdPRHz4CDMGMq0ot3XK
 2eNQn4giSLbkUw0dMOYixjX1p/VbGGHGC60Aq4PrnhlOG1k7U9yHplq8DENBc3C0RNrO
 foDKjp2v0wiPWoMLz6+LS4HPfErh0PesdZweFqMlej9FeH/dZ++PBTuYWJkJwuhVEBiZ
 XsFDv8+TNPhXku9xVWv+O/IvhaLwXwRNv/2GGHGNTpfnbckI6pq1ZgQIYnzMlQTEhtya
 9tzFOi4gbETOZtun1jSSnObnaFYqr1/raKwiVyZDjRBcQvRmCUWIjy0+GYLjHRk1j1j4
 ZN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778951734; x=1779556534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K1V+GWtucxSZl1YZ8nu1MtklisKojriGnpVCnzAvOg4=;
 b=g0jzrq2HHQWAin/spZTVbjB+AExdox2LYjcceEmPQ8SY410iANeRMygu0fULa397bC
 5YGxONONI6hDZnrDlCdOw2mqtHG+fKT01dYn9mwde1RW5+OOz1I36uZgkpKr7vF8LnHa
 JyDcL0tPx5MoMXxjkxhKIhc37UvL9A9szIiDXRxVfiSMjJX6TwoUP/oYdWTqd2sZuoBi
 BZHhSLgYT5LT5FfYBZK+5YVvrjxcE+s32Qk9aslhDlAsrmkMG6NMHJeelKg5gVIDhMnj
 gWWsVXxgBZ8cnWo3pC1n+b4ugKrOfCmsZKZDgLGq2KZFkgTv57JPaarRXRxebR6Z5XCh
 DF5A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8uvsm/Ylql5slzDHCaMqV4IkGtDDPMOEyzVB3Ny6WZQe1sT9Es6u9mpAtbRrWBY0cq8U6hPBlpcg==@nongnu.org
X-Gm-Message-State: AOJu0Yzf3Wj0+ifK+GCB+ztjNMdvn+3hlMN9xFngEOddB1qvMkLktfNc
 PrVH8a36gMpcwlr7R+uAH0OFLr8s2hV2DZ0fVhWy61DYJsRWo7LyxrlQLJOTSetspJQ=
X-Gm-Gg: Acq92OF+cdqXkcVTKK52mRzm6GC8i9Y1wD1EhRksi1Z0m7M39btHEBrWbKp2nDElPgO
 UY0cLBqYnrxGCLuVwCFBA32QyHB3vdKXHcgHTLsQrjAnujqD7JAbz4eZe55aT+14b/6Zzm7rel5
 6ez4AMBbLZX36jLkaEYhRr4M+6LBlpjZkIotTqF1jztsCrKkRF9Bl0nJ2+SbMJJr3Egu9ypoTqE
 WywNlCfJs65CILrnTmzhdvSH97wnZ2c5an1MHmD3tiZIH3FjIAr7MNXjE+2FCi0B8fyGiUn70XO
 xffX0ULGCETwtHUQHCt8e4yux/4pHg3CuA949PuPi2nwGnbQHOPUckAWLdtWhVtycHU+btNtfM7
 1v1bnGxlTthxiXRuKyGrgv/UnwLGyK0fjbX2HZVirw4vYfR2hNnZIBuhwhfMQ7QBkTsvnm11qvE
 mkonjWnnD3+Rg/Itf+XBNR7pPRjdVPYwkKTonRUKJG0eNLlHaBMuV3k8wKJ0UdNIQxGDBX9D+b
X-Received: by 2002:a05:600d:b:b0:48e:8741:fd42 with SMTP id
 5b1f17b1804b1-48fe60ee64amr95588555e9.12.1778951734492; 
 Sat, 16 May 2026 10:15:34 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe53ab773sm146381125e9.3.2026.05.16.10.15.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 16 May 2026 10:15:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Matthew Penney <matt@matthewpenney.net>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v7 01/21] tests/qtest: fix discarded const qualifier warning
Date: Sat, 16 May 2026 19:15:03 +0200
Message-ID: <20260516171524.19184-2-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516171524.19184-1-philmd@linaro.org>
References: <20260516171524.19184-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Matthew Penney <matt@matthewpenney.net>

Modern compilers warn that the result of strstr() may discard
const qualifiers when assigned to a non-const pointer.

Make 'found' a const char * to fix the warning.

Signed-off-by: Matthew Penney <matt@matthewpenney.net>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20260514191844.105888-1-matt@matthewpenney.net>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/libqtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index bf9284b9a13..b1e06ea364e 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -2146,7 +2146,7 @@ bool mkimg(const char *file, const char *fmt, unsigned size_mb)
 bool qtest_verbose(const char *domain)
 {
     const char *log = getenv("QTEST_LOG");
-    char *found;
+    const char *found;
 
     assert(domain);
 
-- 
2.53.0


