Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F22EDF176
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Feb 2026 15:50:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqvPs-0001tk-It; Fri, 13 Feb 2026 10:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vqvPp-0001sP-VT
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 10:49:10 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vqvPm-0007wt-3e
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 10:49:09 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so148300866b.2
 for <qemu-arm@nongnu.org>; Fri, 13 Feb 2026 07:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770997744; x=1771602544; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=24mz/v1MryEIxNWCR/SjfC1f2r6mmgOqZAjVK6z4IWw=;
 b=TOJt8/MynDP/hOiKooIplh2YrgHBPChrSX40y6HM6gV7BQNe8b5VpVcSiPP5cbG147
 /DO+PzxPEc2EWcXVkex//oOWAehZrOGJluUlLazdmdziasXI6cHqWvo5E7LI9iSnGNt0
 xNo2Wubhc0exSCmLJvfTdAZy9MHayj90ippWuDT/3C9OIwQ96ilZpuMyse8yxD+C65OX
 3bBGqQUg4akgg4fA+WovC2+fAjhhUIZ6zWWbdnHnycWTKE8+Toq+976VHUXMiP6HQfvc
 4yoiyM/uiKvHn353utIgxFrSZiNSA/Z4cXqcDdtUJ1wG6DqD58Ga7Ff9hnkuvrARvKBb
 sW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770997744; x=1771602544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=24mz/v1MryEIxNWCR/SjfC1f2r6mmgOqZAjVK6z4IWw=;
 b=XKW4sW1Zf9t/4/gH0exCupTwSiRVsDmKUYVODXOQkLckna2v5bxvrbuNlrczrxjTeL
 j57RqOGXq/Xzq2XNh8yLEPvjU27j++q58GZjjVN6t4SlBJirnt+9ExTKchOfODmvgV1s
 R4usHjf7UCXzQlnInfFTzVt91yhC7RyvPeQbOb+VV569g8Ruby2WD+dRtl3Zr1NLEXpX
 lG3JyEN2c4rk7AZnQIyg0oddyXOUBDraOL9pMA8pVA8MTj29jblkrU6ps497KNDkjMAS
 B2TJCppmUvVGJobIk5GaTN5EnkOZ6GUE7cBngfiPOjpnnU8XDAVC4tn6f2wwxlA5sLyi
 jDQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs/kmkFQdbkdNr6bKxuq8Qifjb5mTXs4g63WSZIbXiheiY5/xMqR6xTPTrIpzp0HV/fgI7RuSdDg==@nongnu.org
X-Gm-Message-State: AOJu0Yyy5rPmv6Ux7sArEIHbujWzyASFC2iibKlOYBxPnP4AVyUjvu0Q
 fFGiNCnh71KeWlr1eODNUCpjr2Z4X0soj0piEL09QtKf0U4zmsm/tT75gMq2afzr5g0=
X-Gm-Gg: AZuq6aIAGtbu43P5u0Uy4waN/P3FGXfGuQmb0Ddv/zW5liliztzyeb9b1I4Ap4Xopih
 oh+Lw37/SwZcracGIWIqkeK/r9+bm3c7Ai50t+A8KRYs9RUs0Dv00Jvu0OnXLIhykZeej8mIKL2
 8YY3n0842ca1VkUmffX71LEcsi3qbZvGPm/2BlBJ71c6X4VfAPWsGdn32izS49Pd68mSodZNYeq
 L8joIKAWcm/hnZNW70BJeq2Nlrv1L33Jo6MxnLxmcPvjcuQhvvnr/J3e8zQnW8HW3/5GXW2xHJ/
 fU0eDR16RO6WBXic/8WooKftKwD1Q6vjkuHXmAnNeMlMK8RvGCb9xivtgWmVplVqZtRQccDK3r9
 kbBgCOJ5nk+LcnAEPBjGCKgBEEGuFV8Yojh5a4hO8jgFQ0GX2MyMNcinVFSuIZlW/D6+eu1/Be0
 BYu8oBLzzF2tL0Ysp+QBaomoA=
X-Received: by 2002:a17:907:720f:b0:b73:8639:cd96 with SMTP id
 a640c23a62f3a-b8fb42258eamr124000566b.24.1770997744267; 
 Fri, 13 Feb 2026 07:49:04 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fbe2dd709sm24104266b.36.2026.02.13.07.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 07:49:01 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 26A7B5FC7A;
 Fri, 13 Feb 2026 15:49:00 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH 3/6] tests/vm: remove unused import
Date: Fri, 13 Feb 2026 15:48:56 +0000
Message-ID: <20260213154859.1551283-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260213154859.1551283-1-alex.bennee@linaro.org>
References: <20260213154859.1551283-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/openbsd | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 88b31dd9b59..52565208965 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -14,7 +14,6 @@
 
 import os
 import sys
-import socket
 import subprocess
 import basevm
 
-- 
2.47.3


