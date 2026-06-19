Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C031CD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 15:57:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wabah-0007Ke-0U; Fri, 19 Jun 2026 11:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wabaf-0007Jn-BF
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 11:57:09 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wabad-0001JL-8Q
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 11:57:09 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso22788885e9.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 08:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781884625; x=1782489425; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZYzyNb8cWK0U/jLPutHs94OTai/bPC8Nj4yhyZ9mna4=;
 b=KAdD6MxkMdMuT+eQW1MX7amcbDrOQ6ZtYeVMU4EaiXP4zaUwGZqGpJYUHIqP70loka
 XhI9AHCxB+76xN8PwcUk01uUDvojhpl41yX3XsXzhBAkpgDjCUK9XSjigCHLTQOuYX6S
 mGvApVExGbgQUw/DYavCZ4in/TFEgm6SyMeymyVyDMytd7i2M89IoEvKe7LAgv24v3OV
 bhLe+7HhArKuCRg3Q0O16WLt6NU1MIP9N6sD71IvZjUrfJKdIFO40WKQKER9Xkj8lkKQ
 NuVXLHPVsVfKegDE+IP/rrUkMlaCy6kB7J2ewApgK9FUtFbM3pspl353Cner86rjZ6xE
 pTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781884625; x=1782489425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZYzyNb8cWK0U/jLPutHs94OTai/bPC8Nj4yhyZ9mna4=;
 b=slmuQ3Wq0JNRD2P6Wp6z5Ui+bR/jUay1PB4EIPcK8zghyjtPMJszmOhJJH/ztXtcGK
 XcjRrv4AtzRa89kn4jNMdYWAaOlpf/UMXvOYLi4KM7I1vH1ybj9PDNHsQ5ruKMPhsxbE
 p+6E3NvOMY5YVtoC5S/G0ZOewOhDpZG1691hur8/GNpns2pWXFEzxH8YxoQm6Ys1hu9o
 dA22ejuoGT84vkZhDIFDku+WxtBqJuU6A83rIqP2p0pob/rVclWjFJGhpzL2ZEidQsve
 GV0TvxSeXxhokGJDocVxvqNdLaAdAhUhCypbLyZxelCW3o+ZeCJvHWJ4Vu9N44wyoE9T
 axxw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/GUQptiT6Blm6wcmtIe9c27gpNuQX3ygo9vmOoW/Vkd0T8J1JJlWhmhCXr/y5onHN2i/f4yEHtIg==@nongnu.org
X-Gm-Message-State: AOJu0YwGD3UrCpQPDHZJjheUIg5+jpWdoyFYhROQf/idTCdD7Jplhn1R
 5hzsIs4IX9lcJvlW7jUzaXd+qOmivkbSsLUXCu2XUGxgpk9XoRyJTqVHQ5MCEz6f99U=
X-Gm-Gg: AfdE7cmh1uLXAKQdxRISH+IvpSRRoeyXgTqCz66PSNcdAtmBOiMjTMfNBel7JdcDnDL
 AYJj1F/8TXTvNT5G8em3mcyG2q7jqT6XD36WtKPWjxi0fvOD9CJ/ieadoPbCWrikXNEo3KKoVU9
 Hw97sscy/3ziBvHdJtiCYppcCbgaQd8tNudxTbiIcKT1Cb8mMOQ+fJWHgQjobWOIyPCbd93Z4YQ
 n1sIn0SkV9NmnkkQ4TGOHLkYoZ/N4R/dEhIGqi6HBvnrar5h28KBCs0wszxDu894vGEmiGt+tIQ
 ionI841OTgVOlkWxs8jSHhO50uKRPJNdsy7kirlPG2t8ojkc8NFo70ubMkxu5k/mbCyrNtLMzw5
 dZ4cDU9cbn3tylok8IfSBKGFBmJUWsg/wG9kQOcwrm4R3T3NhC9YbLbpTXE88IBq2C4Uf+Nc8cU
 pxL9lQ+f0o1Cqh
X-Received: by 2002:a05:600c:2b17:b0:490:ab8b:1bb3 with SMTP id
 5b1f17b1804b1-4923f5791d1mr55455645e9.18.1781884625543; 
 Fri, 19 Jun 2026 08:57:05 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fd33dafsm86603835e9.8.2026.06.19.08.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 08:57:02 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EC2EA60223;
 Fri, 19 Jun 2026 16:56:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 John Snow <jsnow@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>,
 Cleber Rosa <crosa@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Subject: [PATCH 7/7] gitlab: update bug template for sec issues & tool
 assistance
Date: Fri, 19 Jun 2026 16:56:56 +0100
Message-ID: <20260619155657.944220-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619155657.944220-1-alex.bennee@linaro.org>
References: <20260619155657.944220-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

From: Daniel P. Berrangé <berrange@redhat.com>

Warn that a security issue must have the "confidential" flag
set and that any findings from automated tools must be validated
before submission.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-ID: <20260619123632.1276476-1-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab/issue_templates/bug.md | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
index e20f586008d..faeeb002252 100644
--- a/.gitlab/issue_templates/bug.md
+++ b/.gitlab/issue_templates/bug.md
@@ -13,8 +13,9 @@ older than this should be reported to the distribution instead.
 See https://www.qemu.org/contribute/report-a-bug/ for additional
 guidance.
 
-If this is a security issue, please consult
-https://www.qemu.org/contribute/security-process/
+If this is a security issue, ensure this ticket is marked 'confidential'
+before submission. See https://www.qemu.org/contribute/security-process/
+for additional guidance
 -->
 
 ## Host environment
@@ -49,6 +50,12 @@ https://www.qemu.org/contribute/security-process/
 2.
 3.
 
+<!--
+Note: if this issue was discovered with the assistance of automated
+tooling LLM, static analysis, fuzzers), the reporter must disclose
+that in the description. The steps to reproduce, and any other findings,
+must be fully validated by the user of the tool prior to submission.
+-->
 
 ## Additional information
 
-- 
2.47.3


