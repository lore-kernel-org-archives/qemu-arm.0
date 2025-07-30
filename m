Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7834C87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 22:07:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhExj-0004sx-Uy; Wed, 30 Jul 2025 18:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwd-0001e8-1B
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 18:06:43 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwY-0002dl-7y
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 18:06:42 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-23fe9a5e5e8so2857635ad.0
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 15:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753913196; x=1754517996; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HkgXPOtfTDdRhmtR7+6K9lh3sJBO3AG78sxoSa7xDFE=;
 b=Sia224/M9UDwNG/Gs8RYRY5ZdRjtRM/6CvvC5gTgImuvS+nGiPpvriWBk49jgMRPaa
 eDHNyfNTh3Vyr3UdbQ6hJxjWbl63OnmkGXw1QUjqUn9DScOTJc63jy9yDWZ5o1zmVkIw
 2E3pR6Ibz2zCLeRmqpVgVbfJ66Akzb/LWMR1yk8WtuOHQC/C9S1hK6mwxVlwmDAMDfhA
 SOup/o9ac+Ru5Cjb5AzpaIAZtOflHKeCvtvMtd+uO1SA6hTCixwCFgjPcrd0UWCbfHM8
 KA8mMCivXEUGEYityQ+O6bE2APwmNPeQ4/n60INsMLN8AEs/Y3XrLk5lOgSqNV2GRn1a
 ueNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753913196; x=1754517996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HkgXPOtfTDdRhmtR7+6K9lh3sJBO3AG78sxoSa7xDFE=;
 b=N+AafqxphrMJgOqvG00YCEDec67CGuu1Bmr3W8+eRZJLFA8xazw5KX9KDEYx05ySk4
 f4JGD0aYqImK8Om+9b8zqlEEePRV689/UFs9i1KoVRFadXMUuyotmaltVEN2TgIJfPXI
 wv4K6xxLXaTiWV8AEmxK5XbxLHO+aBULi/HE+PWu9jShkO0QYJ/TNzsAQLKhg4xw5IJr
 Sbd5MY93ikylEcabbkSkXJJRnVImT8fqm4BByqwaicF9f8IEC/dhKajkOmQ3YkxgXnWP
 dM7eVDu9YwnuH3jFPTufoEZ6Do+p+JEInIf6A+gVp3N1POO18kkuQh8rRjIVGw2mJMyn
 xG8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF4cIZcqZrMIIQf2mo2NGddnY9MX0FD8s6eFil8BU+bKrafutsCRh6StxHpJj5YHFVCbADLZEsaQ==@nongnu.org
X-Gm-Message-State: AOJu0YwwmyT443Rs8q6JQ1855K7h8/mFYmmzUWhagTeRjb6mUVZ4tmf8
 QFHyiTCdHz0E3vCFKwMdPq22XehnlnPlw6/O9E32jd8UWOD8ScMFeekRoIfkq/N8oag=
X-Gm-Gg: ASbGnctYi8v6i4dPg0Me9eLXo0x17sS7DJEPhjYz5JnDGXIOxgpNmOnZP98SJ2G5fhN
 ucXMaOZTs18jBlxRD9IRq7vT4yH88sRzdzNQ/wvy1t/J6G33xvjR00bzUBWS+KqwvWlCnxStllk
 klGg3MVKLeUviCfvp/DzrW0FltETZjIzQgy6mQgm31ML//EUYkNhPglEjc9MjwnwsgfHCmkOGhl
 X2Vn3j+w4htPJHN8xOcvo2/gAV3qRHBp9SitdhSoKgfMBfZ4h2XH0ZLRSFSR5nPGc4YTmKtZslu
 nTXGHJThgSqhH3EY38A6bmkhcfSAgpV4dI2Ao6zkxkjRP0dJJfGj0vZNJ3XPs873BFl+Tw5+ctj
 JargcYgD9faspdPF8KhRnnA==
X-Google-Smtp-Source: AGHT+IEwidS7gyMXA5LeWThiCer8JwrvnZNz44DvSfCO/Ty70yonQ3n3aS69EaIJU+bGs8fnXBZJIQ==
X-Received: by 2002:a17:902:e54a:b0:240:3c0e:e8c3 with SMTP id
 d9443c01a7336-24096b587b5mr69293715ad.51.1753913196205; 
 Wed, 30 Jul 2025 15:06:36 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d272sm981535ad.135.2025.07.30.15.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 15:06:35 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 09/10] semihosting/arm-compat-semi: remove dependency on cpu.h
Date: Wed, 30 Jul 2025 15:06:20 -0700
Message-ID: <20250730220621.1142496-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x630.google.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 715a22528ab..703db038a4e 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -34,7 +34,6 @@
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
 #include "exec/gdbstub.h"
-#include "cpu.h"
 #include "gdbstub/syscalls.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
-- 
2.47.2


