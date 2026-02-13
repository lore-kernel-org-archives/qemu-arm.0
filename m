Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F77EEDF173
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Feb 2026 15:50:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqvPr-0001tV-Pk; Fri, 13 Feb 2026 10:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vqvPn-0001qD-NA
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 10:49:07 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vqvPk-0007wJ-D7
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 10:49:07 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b8f86167d39so131310466b.0
 for <qemu-arm@nongnu.org>; Fri, 13 Feb 2026 07:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770997742; x=1771602542; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g5NYYEIaJ/f+Z41zhK2tmhjKp+U/zpgpByqOPeZc5LM=;
 b=EOnNXpn5n2dIZYZYzMzW0hZdCjwXXbL2JIZKEHt0ZAirqN2LZ+pnBc6n5DiCu1rhZO
 NbIdE0euVzyo9VMVLxYJjpk25ZkPcU0iK8qjpa+QOCG/DFtoITFPDUjPso6VOPSWlyFi
 xkyEUKfYWVfv97+b8lndQVXPwjl/sanNnP6dYsPDL2fD0WHMc8E8WHtEaENdLoO6C7T1
 dUDdMmfAELNJL62Vbh+N4mnL4YCXVT/c2Wdpz8Ff2/DxLcueRJEmcZjGIQ/biUCje5Hl
 TH4Fo6AsyWU8iGtC4/peDx6zIAkYwLEzHOH5Z+BTDUugvU8FseGX5kVYIYduIV93GVCg
 TZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770997742; x=1771602542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g5NYYEIaJ/f+Z41zhK2tmhjKp+U/zpgpByqOPeZc5LM=;
 b=AK5JbGLd/UszeCdz9ijO65D+67Y6PC205N085gzs6i/FdwEJ2JpRjKm0KG6jsWfp0J
 OuS3/jTvxj/JgBiHW5i8kvn6M2YZqYo4hnbZqJkTSOFEFGCbQdn2V9BxH2DHGOZ467Y5
 5AoxOktvrcWr6A1pfSeq0hRTcl7YA9PPhFfDHjyjspWCozp6w7Fyxp/M+FG32BNfzpQr
 oresQBOXeb3MN+2A3UT+YL5lOTEt1MrK8MbWlyg0ASILnwJ1L41NjF6omjm1ZaCQMU6q
 BIsMLsTjS0Xy9ggXU5tywTPlpFg6+5ZyR7BMVt7MbzKf1KOMAHp8kvSKpC61Dhi8FyLT
 Lw6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjDKnv8tx9usq4elcesX64yy2Pao6Qc4/T3PUU/WC+AI8/ZyK8RGy7WHDR4EZcS7dOiRPupiEADA==@nongnu.org
X-Gm-Message-State: AOJu0Ywysb0tECt5NCf+pJ3cH66wpsqYYzi5p2NI1ri8UgCJ9bTXKBRZ
 rzQdS2lYdiML+wtJxiQiOzGUDC0tOq/9yVOOQSq86DMZexrH76sZqILZh2cdLHhR6uk=
X-Gm-Gg: AZuq6aJIfUPElvlMRGuxh8or6cobS1GjLCwYirguEGiQ8meWTZjON80SUO558R0BCFA
 BCaelnCAOILzvtiE6tBcDiWZzFVXGRd7Zoa+LThgPdUxvJ01XX8diLrj/6w7i55D+gPhPukYFox
 UYA3wtjIRmSy0uvuiEpWbddct40IWON9EBWlY2QIkGDu3FHFbxR4hKxuYO23yBshvRhclTrBbQL
 cZ326jkCsm4IKAORCI8gXSgqrB8pDp5MsWyic5YrXeQcj8GLjEpgHJ6Mk65Lr+9++EMcBW9XI4D
 Y6pABSCyLjZee9AgSXQlDdFOkGYTDAazQnsGGZbYmHCSSea7JD3Tm0Ro4PIFU3FPAiOlhJea+mF
 7SaWKf+cUWi3wpqawR4kqGyqMAVfNFKHpRq9hThL8eg5u+h76zTfbSC6cSRTnmE+9pBjFiiBMt6
 BamiDZpK6D2OMTu+zOjswrPLM=
X-Received: by 2002:a17:907:3d9f:b0:b87:9d1d:ec6b with SMTP id
 a640c23a62f3a-b8fb3e3c696mr129603466b.0.1770997742528; 
 Fri, 13 Feb 2026 07:49:02 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8f6ec35688sm267903566b.51.2026.02.13.07.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 07:49:01 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3B1025FC7C;
 Fri, 13 Feb 2026 15:49:00 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH 4/6] tests/vm: fix interactive boot
Date: Fri, 13 Feb 2026 15:48:57 +0000
Message-ID: <20260213154859.1551283-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260213154859.1551283-1-alex.bennee@linaro.org>
References: <20260213154859.1551283-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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

For reasons still not clear to me passing the single dashed
-interactive would confuse the argument parsing enough we tried to
pass "nterative" as a string to the launch command causing failure and
head scratching.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index 14188bba1c6..bf4b83d2a45 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -142,6 +142,6 @@ vm-boot-ssh-%: $(IMAGES_DIR)/%.img $(VM_VENV)
 		$(if $(EFI_AARCH64),--efi-aarch64 $(EFI_AARCH64)) \
 		$(if $(LOG_CONSOLE),--log-console) \
 		--image "$<" \
-		$(if $(ROOT_USER),--interactive-root,-interactive) \
+		$(if $(ROOT_USER),--interactive-root,--interactive) \
 		false, \
 		"  VM-BOOT-SSH $*") || true
-- 
2.47.3


