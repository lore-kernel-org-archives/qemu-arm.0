Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3518011ejb;
        Tue, 6 Jun 2023 07:13:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7n0fgwN1gnmDw+HQdndGawvm+EOjA5Bn2h9T9qWrDLQNTGnr+XWVeCo3rmIlQCXae/l+pX
X-Received: by 2002:a05:622a:1305:b0:3f6:b31c:ac2a with SMTP id v5-20020a05622a130500b003f6b31cac2amr2545369qtk.29.1686060827505;
        Tue, 06 Jun 2023 07:13:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686060827; cv=none;
        d=google.com; s=arc-20160816;
        b=E703AZ1ELurnscxfEGZWWPEHcB4WAbL+/hxG4H+8N8XXtsqItZLTsye1pKCpKapdz1
         6XERVViUIpSAMRYWX3rU2pK35/pfPHNkb4OmQnLHJckdcMD0a+o3ed7EFWYC5byQ4pRQ
         TLRGOZrbQTQ8A5DU7Z2RyuGw1hljqaXmy8keJajt1CY/IjPb/fxaV/TjK/XueMr67vo8
         SU+nPHIzaF5XGD1jjMBTsUdPqnHNgShhZbXVnAa5Sd+My7cE5XtbHl9rwIP28MpUmq7H
         6M0HpK23ieLyJmRuWOercyLqkbkff1Cn6CcO0f3W/k9Oz4zpM1ZVIwcYH2SWl9AqdR2p
         sLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8nAhi/2SNnfVAGDO4jkwWlSD81rGbl1OFEARKV9v1gg=;
        b=CVcr9nCqtrnaViu443spSaNQswZcVMkbUkscC7lFhX+LQaWT/MFiPQtZeqWSaYmxfj
         Op090TGTOvHs7n/6/N7tHuBS/xF5MxS4NW65lIT8o77f44IUd3TUq75STY4Fzcc+SnBy
         4LOIf4sJNULYFu4K8LS1/vvmNaE71aj4CIK3bOXkq96KnoIk5Nfe8tbksQxJLyMc5jOh
         5IWCRJHEFlEhBgx85FngNxtJEddtgWn6uDXVbiVW20G4HpXpymzwXx7U7Zh+2clKwbuI
         qpOtqNRvbtdl6lxzgUpAC06fsfo9Vmrn79eAZpK76Lropk3PcTUh8j0J9sVyBptu9s2n
         XVNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZFePHRIr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17-20020a05622a15d100b003f524435b31si6284767qty.588.2023.06.06.07.13.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:13:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZFePHRIr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6XQw-0003ue-8w; Tue, 06 Jun 2023 10:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XQu-0003tT-1f
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:13:12 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XQr-0005Xb-4U
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:13:11 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f6da07feb2so61527825e9.0
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 07:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686060787; x=1688652787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8nAhi/2SNnfVAGDO4jkwWlSD81rGbl1OFEARKV9v1gg=;
 b=ZFePHRIrrHCo5PHUbKJxOssBQTMb4ejob3tZ9F+15+4bt+xksiwzxKQZ0va02vC7Tk
 5862DobTK6pTJnMZ0e94D01Xf+QlzF3r4a3q8Vepc79h68jyXSOmqw3uPspX/iQEAdtF
 ic9jsUlRclmKH2bSIcLWPqphV7cpnbLelnznLbUGR1bOFxGdw5BIuxx5Z9H9AiWZAoPm
 /JjRRnUfpDqtOY58GUC02FK3w3Px76eCvcsAcjEjvLUfG8JZmgUyg/s201LpddtRwvzV
 C7FvK8+eOKs6nSI1M1rQt7XXHF9rz75S69/J7SnrLs20iQWbJeOqzG+n9gzcrYLDguO7
 JY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686060787; x=1688652787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8nAhi/2SNnfVAGDO4jkwWlSD81rGbl1OFEARKV9v1gg=;
 b=A4jqMLCpG8AzdQVn+diXwr9SbkGAamRkpyJIKReFFZU8IWKEMh8mgwDFSsxHznzdzp
 nwIuFz+RRPGDEHySEEVjXCvRoSuV2HF8e9kZeqMxY3VNz31wqKkZs+sW0H3nzPLv9CdB
 r8Di+5F3Xq4+v5CfomcgeHXhjSHSEu0DufLJ5eX4N4v2Sd+r1D4Z5A6FuRDsjJrcEXb+
 ecTvN3bpRT3/FSpzEqtrx+cxU7MhjK4DQEFvPIZlq2OzkptYdFeAKJghYKjzGlLbelWK
 DsvtRcmBSFB3B40Wr0DQfG6THo2H1Q12dIw4dhWWg9LpWide/zh8PiuMkITm7eLOURhe
 iIYA==
X-Gm-Message-State: AC+VfDylyLIdTpq3OJt3IocpfJf8FQ8RhZFKGC4N4wbaGVIm5LiouTrS
 SMHoSAkSjZfaikHGY7XVNwkfeg==
X-Received: by 2002:a05:600c:2056:b0:3f2:549b:3ef2 with SMTP id
 p22-20020a05600c205600b003f2549b3ef2mr2147438wmg.17.1686060787430; 
 Tue, 06 Jun 2023 07:13:07 -0700 (PDT)
Received: from localhost.localdomain
 (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr. [176.184.50.104])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a05600c365400b003f60fb2addbsm17816209wmq.44.2023.06.06.07.13.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 06 Jun 2023 07:13:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/5] target/arm: Rename helper template headers as '.h.inc'
Date: Tue,  6 Jun 2023 16:12:49 +0200
Message-Id: <20230606141252.95032-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230606141252.95032-1-philmd@linaro.org>
References: <20230606141252.95032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: A5G7ntMu+LTR

Since commit 139c1837db ("meson: rename included C source files
to .c.inc"), QEMU standard procedure for included C files is to
use *.c.inc.

Besides, since commit 6a0057aa22 ("docs/devel: make a statement
about includes") this is documented as the Coding Style:

  If you do use template header files they should be named with
  the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
  being included for expansion.

Therefore rename the included templates as '.h.inc'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h                               | 8 ++++----
 target/arm/tcg/{helper-a64.h => helper-a64.h.inc} | 0
 target/arm/tcg/{helper-mve.h => helper-mve.h.inc} | 0
 target/arm/tcg/{helper-sme.h => helper-sme.h.inc} | 0
 target/arm/tcg/{helper-sve.h => helper-sve.h.inc} | 0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename target/arm/tcg/{helper-a64.h => helper-a64.h.inc} (100%)
 rename target/arm/tcg/{helper-mve.h => helper-mve.h.inc} (100%)
 rename target/arm/tcg/{helper-sme.h => helper-sme.h.inc} (100%)
 rename target/arm/tcg/{helper-sve.h => helper-sve.h.inc} (100%)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 3335c2b10b..4218d98b51 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1039,9 +1039,9 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
-#include "tcg/helper-a64.h"
-#include "tcg/helper-sve.h"
-#include "tcg/helper-sme.h"
+#include "tcg/helper-a64.h.inc"
+#include "tcg/helper-sve.h.inc"
+#include "tcg/helper-sme.h.inc"
 #endif
 
-#include "tcg/helper-mve.h"
+#include "tcg/helper-mve.h.inc"
diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h.inc
similarity index 100%
rename from target/arm/tcg/helper-a64.h
rename to target/arm/tcg/helper-a64.h.inc
diff --git a/target/arm/tcg/helper-mve.h b/target/arm/tcg/helper-mve.h.inc
similarity index 100%
rename from target/arm/tcg/helper-mve.h
rename to target/arm/tcg/helper-mve.h.inc
diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h.inc
similarity index 100%
rename from target/arm/tcg/helper-sme.h
rename to target/arm/tcg/helper-sme.h.inc
diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h.inc
similarity index 100%
rename from target/arm/tcg/helper-sve.h
rename to target/arm/tcg/helper-sve.h.inc
-- 
2.38.1

