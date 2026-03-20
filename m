Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D47410987A1
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 15:53:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3c8I-0007dv-US; Fri, 20 Mar 2026 11:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3c85-0007Ya-TS
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 11:51:20 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3c83-0005XF-Ri
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 11:51:17 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b9358bc9c50so268527766b.1
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774021874; x=1774626674; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Fv5imt9etkCyxA426f2RtHofD804x2pDCK4rcq9hJc=;
 b=OGFzzahRIFAGKF2Ig8pxRZP5J0w0CyfDVYSQ9HOJOhmqn39BinzHaFw0HUShdVMwZc
 K9bYMqAt8CX3jg4Fe6NQgi0fUzCvpZ8JrkMQjNhHePJZh1qbB2SNx2IplqH2Z0w3f12q
 A7JAHY7VD5LZhHjL4wDvO3HhWCw0lGh8QTohc0Isjvo0WffhCwLvU63agzpk/yiO4ehI
 5GIC2UheaEdNX0OQdawFiloVMQwbPs1eKadkvDKgwO3/PWzWPJkdRYS7kRJTIJchKwYV
 2U+QPdbRjTNN225UaGuv+rgDZHv1Pfvrx6+FO2YbuS3w2tE2gXtldAW8/R0PkXaXtLvw
 EyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774021874; x=1774626674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2Fv5imt9etkCyxA426f2RtHofD804x2pDCK4rcq9hJc=;
 b=FPYI2ZRPtSRz/1C6ONiQFsqzK5agWpxAMX9ZIGeT8pDNhby+bdmxAv03nnoJUBC9Wc
 UcwYMDvDsRegGCNUrDjK0h82BRNOvFxfTnF+J4RZ6mnuD2pUn8Doy6L6q+vWfLK2dPHx
 gyVF0Ebnn+NmUMTczcx9BZud1gZxM14n3F9/eOl/CqfxiNTKyWGzaqpuOkJWFikmQx/f
 5D75RS6QBlYNBeW+kydh9oCV2JM569N7/CXhHA0GCSOCw/zKHF4NUmX780sA2K8Wl8Gk
 TzIZH8Lg/fyE8s4PMSaFk75KkmjemlwfFHohLAIHC3ZJlDJ7Tl+TLfczmbVIBWifxGvO
 WTrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8ss/WiuPvatuS0Mh6VH9iS4ITypJW3o4s5/JN2ButNFEs+2oBimOjBnoHHisFBpezfsByelCQ5g==@nongnu.org
X-Gm-Message-State: AOJu0YyR3faB3aowJN9CmwTo4eZf/SM4BaEZUxNkhPNPm2SVR5dJowMp
 /fTgefPm0ASPDDQBRfo6fUW7ixZdDjloNRvd5drcORceYSLwiqfObNLIGGMDEzzHEC4=
X-Gm-Gg: ATEYQzxUG5I+uVixwsnlIkN0z1AULM3o5ITtF9+LROxT0szuuSApr/XRrB/tlwQ8vwH
 yBV35oOhpy2JO70SpJ3DiZOgQZtQVjIS2KlThIzmEoMbD2k9xXO029BFAoNo5jsx56X6QT130mk
 9AGF7J5eGEJ1htERFuFZrnQ59otHRkH+ew2U621pFNxyuzKhBjEdBzbawW7Kp/Td9R2EAjU965d
 BRFaTfSFeGPs0AOm1clpiJFSs4z+JcJLw6+4ttcT2szBdEuke0vQW+tDybxpdddTWT6rLU6m8QI
 16mAmrYZR/woCF0nS2vPakLgaRBkWrxj0D+53m3o0M1CyFHL7QgNZmkjaVbCuhtsewIuPICFBKY
 1/Zv7OW7aZibXfLY9L0Kjp538Ig4nhsQaCPRqPXMx7YKbYp/3LNoGhfhDuHBtptDVrioclQb2pG
 IkrDCWD5rRJVDAqTGu8Mt8tLU=
X-Received: by 2002:a17:907:3fa8:b0:b98:33c5:1bb2 with SMTP id
 a640c23a62f3a-b9833c56788mr190108466b.25.1774021874174; 
 Fri, 20 Mar 2026 08:51:14 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-668cd050c4esm1426956a12.0.2026.03.20.08.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:51:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3D4AD5F932;
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
Subject: [PATCH v3 5/8] tests/lcitool: Remove python3-sqlite3 from the list of
 needed packages
Date: Fri, 20 Mar 2026 15:51:04 +0000
Message-ID: <20260320155107.2143191-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320155107.2143191-1-alex.bennee@linaro.org>
References: <20260320155107.2143191-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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

From: Thomas Huth <thuth@redhat.com>

According to commit 7485508341f4 ("tests/docker: Add sqlite3 module to
openSUSE Leap container") that introduced this line, the sqlite3 package
was only required for Avocado. We don't use Avocado in QEMU anymore since
a while, so we can drop this package now from our list again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20260316135407.209072-2-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/lcitool/projects/qemu.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index 5e34e953514..b78a1d7f2e0 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -101,7 +101,6 @@ packages:
  - python3-setuptools
  - python3-sphinx
  - python3-sphinx-rtd-theme
- - python3-sqlite3
  - python3-tomli
  - python3-venv
  - python3-wheel
-- 
2.47.3


