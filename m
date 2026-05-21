Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5092CCD5BB1
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:19:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3Hj-00044K-1r; Thu, 21 May 2026 09:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hh-00041y-30
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:17:57 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3HZ-0008SB-AJ
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:17:54 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-449d6c68ed8so3133166f8f.0
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779369467; x=1779974267; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3yYafY8TJmCrFTnnXsB+UoyMxcWEdJ2PX05QeDqqFg=;
 b=KQhjupdc6rVwk5uIjFctuDfPm0PyeJGAC2syoghxUzzTGEkV9E1FMBzfKr33+SmUzs
 NZm3ZEaCW3EOMwgSScdclfhnF0e+i1aFOGEmIK8N4BYyuNPin0osO8HtnwoZr4N1ZjgW
 FrmKOU1rsMoNERo9oB5c8BprEi1sZtKnK0CuOXRc39f0yhJohU/lYDsgICJTKhTzEkgU
 LRJ80RIJieknxSsRcHJORxV0B/f+Qz/Br2L/iSTd0mDTUm79QwnvS6SBv5x0HozPoNFV
 c3CqnH+V0pDENurOnyQsa17g5rVPfqAmkCzMWy+5LPWUR10ZEtM+hAgoYuFWsjXH7P0d
 LfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779369467; x=1779974267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I3yYafY8TJmCrFTnnXsB+UoyMxcWEdJ2PX05QeDqqFg=;
 b=frdl5fSzLms4ImM9VHKH8P+GZK0APHZth6L37dJN6Za0xUJJFRsD9MJmcAKkbvjHyK
 HPRyn8iDQpeqmZ1NKUNT2+jWcQmfcg5AUaZ1mCZ9RCGEiqKCUpyVAdxUdbslO3uG70Fp
 j4LlZF9jlRWTiaKHDBCwyZ/2bEXnUa6o+xeAo9BDT4YhR2PYQUX1nY/vdO6FZTWum41f
 hW5hbIbbaAD+JBXMbOjT6xmjZDRRidNZPwqcgE4MF5qVgjHHLYmK+069/qoCvOMgcZSH
 six3VNR5lvRpmmPrgdXbY1tspyhmlojTdPPn6B1cst4SQBw/UYP+ELLJv3abD5XWaoqH
 QsXA==
X-Forwarded-Encrypted: i=1;
 AFNElJ85ordz2whHnbJJzhIaR56OI6k+drNz8ATiNjVyb5rPUFiCPRtZPY1XQ0FUe7xbDEtLtaafB9XEYg==@nongnu.org
X-Gm-Message-State: AOJu0YzbLa+CU5Gh1rSNuV6djYqfc821QrokBr2r7M8wz3QCpSaW0vL3
 5uy0i2rqjjX8pNP+mgC1gyTLUD5b4+uT2RHd/VtaFJ//+AXTDXgdQgYLYNTAmGKbr7U=
X-Gm-Gg: Acq92OFzgjJN30JwWfDiDQ7H1iSGyNl1VY5PBRbVrIvXD5yvYP14lsbr66PJwYgrEyU
 YgsDKVmwlPXxV4GAaC4GORBO1OuJ0l+L9IUb2z6u80y/ZHqw88I/1O4G4cBt7c50Ewar29GSgKp
 0ctzFHcPCZ+nPfy0UblKsPKo2zv6GAAoEwk/Mn+UQyZlEfzUYDO3BWe2Xek3yUWgx+MfCRHr+Z4
 tUZ16WpbZrZBZZDCIsreTiDuf3Uvsy1nyamGzApdp3WGHaHdDSDG7NedKZ13J80/PkZ0L/rqIWr
 yI+9wFm1EfCjZ1NPTbjldzOzyFjsMBxOysiD+Pya+ACBFvnWkFE5twCEoW+1UqXpYmpJlJc1jQu
 bN963f1QvyzHUtcnpCMSRwMAP5GRnAvyDILzpThQ1uQ4VGMmO2IYJCclAdDTf/PKXBO38cC1/en
 GnKUpf80FNbPhvadF+zgH50SOthqMVLK0pwA==
X-Received: by 2002:a05:6000:430b:b0:45c:1c89:b1c6 with SMTP id
 ffacd0b85a97d-45ea3bef175mr4903860f8f.33.1779369466607; 
 Thu, 21 May 2026 06:17:46 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa7cf1c2sm2827719f8f.4.2026.05.21.06.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 06:17:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 09BEF60338;
 Thu, 21 May 2026 14:17:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Song Gao <gaosong@loongson.cn>,
 John Snow <jsnow@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v2 08/16] gitlab: update issue template for binary test cases
Date: Thu, 21 May 2026 14:17:30 +0100
Message-ID: <20260521131739.540157-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521131739.540157-1-alex.bennee@linaro.org>
References: <20260521131739.540157-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

Binary test cases are sketchy because they can be vectors for phishing
and other malware. Lets strongly hint that source bases tests are
preferred and binaries should have their provenance declared.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-ID: <20260511161757.105994-1-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab/issue_templates/bug.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
index 53a79f58284..e20f586008d 100644
--- a/.gitlab/issue_templates/bug.md
+++ b/.gitlab/issue_templates/bug.md
@@ -55,6 +55,10 @@ https://www.qemu.org/contribute/security-process/
 <!--
 Attach logs, stack traces, screenshots, etc. Compress the files if necessary.
 If using libvirt, libvirt logs and XML domain information may be relevant.
+
+If attaching binary test cases you should describe where they were obtained
+from, preferably linking to the original source. We greatly prefer test cases in
+the form of source code that can be audited before compiling by the engineer.
 -->
 
 <!--
-- 
2.47.3


