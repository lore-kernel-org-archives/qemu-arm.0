Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp289806ejb;
        Fri, 9 Jun 2023 03:49:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7CT8txGCFjS9P7MVvmHv9qneaWMlnEFAbCasemeHMjIDvBRrOGksFG88m8FcL9Amp+chyn
X-Received: by 2002:ad4:5bca:0:b0:61a:d6af:cb00 with SMTP id t10-20020ad45bca000000b0061ad6afcb00mr1477642qvt.9.1686307774837;
        Fri, 09 Jun 2023 03:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686307774; cv=none;
        d=google.com; s=arc-20160816;
        b=zTJvcAY7pHz/jClGuiQ9YSkX7/BJGEcAizPm10Kqrbqi+hoM7R6EAYKqJdCSHzrGH2
         Tp30ZJegRJgGbpd0AbQc06SdctsTvqL2NGuPtGh1DZwaI7W43ykXlCfqHnFcVvNeLHIM
         OO0fI/u4VC9c2LBVi2Dooi1raZfVFZnL57Q67sOPbdopdBez9SQW/EriBXPrQVahgD74
         XBYMZNX4S2Tq4DHaWFCrpIkrdd5lTAq5kWbJVWXTlWGSqVckl1E7W3ZLQDTDhGlZAu62
         ds1saCImYk22MMTrbUUdqH40XLj0a9XNcsNlWvf+AMljntwi2bvcCtp1+9rq4Ks7sz8h
         nPZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6EMxC9YLsY0bROTkA0K5UDqhCf1EdHUprhT+dzt+OvA=;
        b=USP+YiS5eu3QGymjmy528GOR8QbiMHieKpQ0Vyk/K/1gTh8zCAGDYOLjIp4a6tcqtU
         XLnUh8kLTaoQ1PLQs/jLa3wXLzofnweLJGjSr+k76Sf550nOWQCAZroWwCjEMmf8cO6q
         oq6hpxdJWIWsm4s3ZvV1kMry1Vdu/IX5WfUG2W6AVSUYBg5293DHcA4wbBMwJ8o+jyrU
         x4TGII2Eh/97h83RT5R3dxM4dW/6p1+pc+R36yI0VeKZsfXkeI6/RtTAritb9fp5ZMJJ
         SVSiaXoEprzTp296DVNKfTwi4l2Kv/iGhPX0+adpVdqAfyIpD50+eZKVdGR792gvyMEX
         fZXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Sqn/LN1W";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs9-20020a056214226900b00626190ff5b5si2006060qvb.610.2023.06.09.03.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 03:49:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Sqn/LN1W";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7ZgP-0000DS-8t; Fri, 09 Jun 2023 06:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7ZgN-0008WH-SD
 for qemu-devel@nongnu.org; Fri, 09 Jun 2023 06:49:27 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7ZgL-0001h3-Fk
 for qemu-devel@nongnu.org; Fri, 09 Jun 2023 06:49:27 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f78a32266bso15626825e9.3
 for <qemu-devel@nongnu.org>; Fri, 09 Jun 2023 03:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686307764; x=1688899764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6EMxC9YLsY0bROTkA0K5UDqhCf1EdHUprhT+dzt+OvA=;
 b=Sqn/LN1WkDJdPGdGLfB/RjQCEMRWxVYe120t3R3CXD66+IOcx4HxvAoEFyjnvzuvmH
 zmCjNg/KLfTGeW6apFQXN9bVz3nxtIoJE104ul5Z9pQk4X1QEbmaUqf0i39D1Suikjw/
 xBxuYGNrVr4FRXb+asjWALL4HHExCnXkESK9dJUmEsrhQr0uuyCYv+6/kxDub9jngy6a
 aktiBKsqitgO7xViKG8TdusNG7npI7QENoXEdj61gzbLog83h/oMYCaGdu0ZVfgfKLgA
 moQNXNLHFYGlu63qeDzVbMNtnlk09D/evsdNOKTBAzOrAmg2PDI5FIQ11uZJbKa751sj
 V4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686307764; x=1688899764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6EMxC9YLsY0bROTkA0K5UDqhCf1EdHUprhT+dzt+OvA=;
 b=O5O+9XiF1SjJXGLWqyP923SErj3OH4HJ7Ii/eUiVGRhwy0DbrAzcUv/sW/+3Efw6op
 C78SgYdKPyF9DNaWj1yqcLn+gCeW0gr2Gmg8gTG4g2xjMrEfFjrdZqKTHtzcfywebnAq
 ZNSdjJhqygTVxdG7glHCo4qHItOoy+5CxZdfN9YJTbbNEeotAtDStEdrVlZE6xYZzuOR
 63arnKEAZcvB3FmdnBywSbv8WDxzqlaK6UxkHUeMUbwrc50lfWjTKs+aG2AEkVeVIUGN
 LnIXlJluItFNLSeRY14VBG2OP4SIi1RYbW6FPR9pCTo89A7G2UzVLPMvnasytxsYq1yN
 G3rg==
X-Gm-Message-State: AC+VfDylPMnw4AO/KEqNUZQ4t/aNcYC+wJ6OAsgKihRtjfzdUpl68NDs
 xf4V7ORxVugLFh18uG3qBJjm2JEAyYDHSR8L1Xu7Xg==
X-Received: by 2002:a7b:cbd6:0:b0:3f4:f7c2:d681 with SMTP id
 n22-20020a7bcbd6000000b003f4f7c2d681mr864169wmi.29.1686307763908; 
 Fri, 09 Jun 2023 03:49:23 -0700 (PDT)
Received: from localhost.localdomain (23.171.88.92.rev.sfr.net. [92.88.171.23])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a7bc8c3000000b003f1958eeadcsm2292119wml.17.2023.06.09.03.49.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Jun 2023 03:49:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 19/22] target/arm/tcg: Reduce 'helper-sme.h.inc' inclusion
Date: Fri,  9 Jun 2023 12:47:14 +0200
Message-Id: <20230609104717.95555-20-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230609104717.95555-1-philmd@linaro.org>
References: <20230609104717.95555-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wLo3yBkSwXCg

Instead of including helper-sme.h.inc via helper.h which
is included by all TCG files, restrict it to the few files
that require it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h            | 1 -
 target/arm/tcg/sme_helper.c    | 5 +++++
 target/arm/tcg/translate-sme.c | 6 ++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 5471d6e5d0..c1fb9b7b50 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -559,5 +559,4 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
 #ifdef TARGET_AARCH64
 #include "tcg/helper-a64.h.inc"
 DEF_HELPER_FLAGS_3(set_svcr, TCG_CALL_NO_RWG, void, env, i32, i32) /* SME */
-#include "tcg/helper-sme.h.inc"
 #endif
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 1e67fcac30..95db4b7861 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -29,6 +29,11 @@
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
 
+#define HELPER_H "tcg/helper-sme.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 void helper_set_svcr(CPUARMState *env, uint32_t val, uint32_t mask)
 {
     aarch64_set_svcr(env, val, mask);
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 571bc10471..4396b649e1 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -31,6 +31,12 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-sme.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#include "exec/helper-info.c.inc"
+#undef  HELPER_H
+
 /*
  * Include the generated decoder.
  */
-- 
2.38.1

