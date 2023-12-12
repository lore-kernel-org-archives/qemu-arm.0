Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp864601ejo;
        Tue, 12 Dec 2023 04:34:36 -0800 (PST)
X-Received: by 2002:a17:906:b842:b0:a19:a1ba:da69 with SMTP id ga2-20020a170906b84200b00a19a1bada69mr3246589ejb.144.1702384476622;
        Tue, 12 Dec 2023 04:34:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384476; cv=none;
        d=google.com; s=arc-20160816;
        b=NcHl06yUqLTD8UNQe0wJ+xtrcTt+3iEfyuVKG9+LpwoA53W9WecrQiKMpJ78awIjif
         aaTjKTpYl9W2qa8XQ2FP8Umwysw4JTrBxeIe85rBAHpfIBipIzYojlhDUi4Eu+uvo5oM
         OYPCVtZrXq/suVZf3k8blQHXuzzj/GMIXXsw1V/bCSKSI2rpL1qOLHjdqfZWK+fOL8/K
         g0VtQZjOuXDEr0HYZYpcnxyGFpOg7suHN0kI1eljYvoChVZJl+ztP9yYXZqUZQ8Rlfyj
         9tKDf8tp0yPbINzr4db2jjTCojM1gwcyQtuhOMWHMBiovVUJF1SpN7lOVBVqB2Ews5yy
         oNcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MXgjVQ2n+XwsEUqQbXGRL1Mo/9FL6x1+dKtNElcWrbs=;
        fh=gLv/fLsneP+NoZglr2Fx6cBcBP2mPFyvD4cPt6IOrfo=;
        b=E4koxXfbxevbortgLYItgzzidDWlCr7QDuxyQ0ZL/3U2LYhg1AvVVEsPTcsKRMXnZ5
         8iqV6rKU9o4bXyxT8D33KTznImA5PhUc23b+ebv8OrMoyPpD1/rT5VyuJcHM+1++Y1Uu
         VtoHzSQKCBFgmeuFDmyvEaYppqxb/jalVC5N7m+CfaBaLIHo4LowMzyQPvNgy5REwojy
         rcXg78Gss2M2dS33XJzOUa8GNfwDZuh9/WFAWufePM84mtEr+b/yCQY8AE03DZGN/g2o
         LH761Uxxtvpxn87ZwRPscBCltkAyzeaHZIvQr4jqoBIp4Otlvxv2nz8WGWK1WBk2quZS
         CvjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Alsh//6T";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id my8-20020a1709065a4800b00a1dcec295b7sor2437103ejc.7.2023.12.12.04.34.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:34:36 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Alsh//6T";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384476; x=1702989276; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXgjVQ2n+XwsEUqQbXGRL1Mo/9FL6x1+dKtNElcWrbs=;
        b=Alsh//6TRruObYyHlCo7OxoIVoITStCrlCjyOsdyny7WOg0EYDl+eXFu2j4uTSau+Y
         97nhKMj0u9LD2sTgnT+P/deEC2WRFah3G8Om8JbKODBFKx9Ou+cIocqUdVvVHQqGxkX6
         z2MVaPmgocYtAjwuVREbh13EuWp51O50LRlhTS6tMZ99eX/E+7dZ11c+I+wSuWUW4ABw
         ctqET4fqQeej+b71Snlhe5VQuTZ85MjoY1VgSqKq6qUA8Sj71Ofv5gGoWetwzo6eF0G/
         dVJLIHTb/4EojMoWPh4w11wKfBl5dpSDi7I/Ka9fU5fPqkxIslV//nSOD8JI48UKqDpr
         xGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384476; x=1702989276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXgjVQ2n+XwsEUqQbXGRL1Mo/9FL6x1+dKtNElcWrbs=;
        b=XMX4kXRSuh89gb1b8OlgVko840Cy9OM6fud++gRBha65BiCPebiMfRM+SywYjUI3KN
         sVqH/lwzPbnm5tHuqcBNLUWNXrE9J++DgbolOyww8y9lchAaolLJT5Rb4+TY2bITnFvN
         /c7ah/FgfAqpVN/U5Pax6Q53oPF9NHuVk/NO1dPVUbOW90lVmECFOjwGLNyl+fPSWAkX
         g5dx+HSMIRWKBUMiRe1cExW3x3IDK+gL0P4zL2OwVm0ZrVUv3VLdW6R2a1ZFmGfVs2bt
         Mgu3yi3RNCKBJT7XeXUi+be0iFCaszrxIigsQaejZdGcpoeGVz4l/wKcVtxLgdlaRbsu
         b1tQ==
X-Gm-Message-State: AOJu0YxKO15Q5KyueND5TDAOjdRSmqlgb8uy90BowMRMfq3Vas+s7bzr
	/CO9nzu4hu+oWJBzfqwNVgyVZ/yk
X-Google-Smtp-Source: AGHT+IGJIpETCZ65W8iTAUZEGfLAHHOlaBeQwlHzrT8mSCbAuf4WHyQKmmp/N7JttIU8DAxSRgFdIQ==
X-Received: by 2002:a17:907:d25:b0:a1f:6b64:6a52 with SMTP id gn37-20020a1709070d2500b00a1f6b646a52mr3881128ejc.43.1702384476170;
        Tue, 12 Dec 2023 04:34:36 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id h7-20020a170906530700b00a1b32663d7csm6210926ejo.102.2023.12.12.04.34.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:34:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH v2 04/23] accel: Include missing 'exec/cpu_ldst.h' header
Date: Tue, 12 Dec 2023 13:33:40 +0100
Message-ID: <20231212123401.37493-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nDTYxcGlDyoZ

Theses files call cpu_ldl_code() which is declared
in "exec/cpu_ldst.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translator.c        | 1 +
 target/hexagon/translate.c    | 1 +
 target/microblaze/cpu.c       | 1 +
 target/microblaze/translate.c | 1 +
 target/nios2/translate.c      | 1 +
 5 files changed, 5 insertions(+)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 38c34009a5..5b019a0852 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -12,6 +12,7 @@
 #include "qemu/error-report.h"
 #include "exec/exec-all.h"
 #include "exec/translator.h"
+#include "exec/cpu_ldst.h"
 #include "exec/plugin-gen.h"
 #include "tcg/tcg-op-common.h"
 #include "internal-target.h"
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 666c061180..744dc4fc3f 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -23,6 +23,7 @@
 #include "exec/helper-gen.h"
 #include "exec/helper-proto.h"
 #include "exec/translation-block.h"
+#include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "internal.h"
 #include "attribs.h"
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index bbb3335cad..91d7cd9061 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -28,6 +28,7 @@
 #include "qemu/module.h"
 #include "hw/qdev-properties.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/gdbstub.h"
 #include "fpu/softfloat-helpers.h"
 #include "tcg/tcg.h"
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 49bfb4a0ea..1c9a364c2b 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "disas/disas.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "tcg/tcg-op.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index e806623594..a74eb6909f 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -25,6 +25,7 @@
 #include "cpu.h"
 #include "tcg/tcg-op.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "disas/disas.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
-- 
2.41.0
