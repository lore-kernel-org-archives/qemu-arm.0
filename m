Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1372947ejb;
        Sun, 11 Jun 2023 02:05:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4nzGWKHwYOV3et8h9X5kAirXnz6AUA49xJqj2d6wTVUqNG8KUqw4NVr1EA/FO1FFaZ2cf/
X-Received: by 2002:a05:6214:401c:b0:62d:e73b:c4ab with SMTP id kd28-20020a056214401c00b0062de73bc4abmr679085qvb.1.1686474345477;
        Sun, 11 Jun 2023 02:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686474345; cv=none;
        d=google.com; s=arc-20160816;
        b=t2l+ple1vI5kGC9c4YxeeV5Eqy6BsnavYZND90U8J7rwRO/dN2Tg0VF0HoaF5FQwJ+
         j+rKCrMD/XjLsnw4rSV+gHIeXUEmlhwg2x07euf34eHX2mWM6rEQQI/twcXeV8zqXdoA
         uVy3fMZm5w7b2eUMgOhnt8NYPpLiKpId94k03i6nk5ev07LVQubmcrUooRSIjmqaX/Mb
         Mrr2csV03n8BmxbmhGoF4hocksZLvvOFfaJ6H8WyDA0DI58qTz5kDwdDebwT2jGLdz1p
         ZuqOHc2C/IEHE11Zb1DnQXVtRdGUWHp9XYjVmWorACCxDBzx+eoruCeTvJNhP11c6emm
         j9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7bOi95+MAdYOQf36lFFFxG4Odq562AhoTTqq539rW9I=;
        b=tHq+rmwWmyGC9kTp/x5zfCL/J9lq/XFO2zdwr4l3jw9uxRHaEp33KQjhk3ZNIScocx
         83q2uBU6zHYrorFEhoGqNT5pSC18xG4BsYFwTMy486r3IQ0yvOD/qbwVbgePQmnAa5s5
         9tOgrlZpRB4n5R9Ykd71Zf/zalznekRICTCTKCUAMAdllzflhDG4Iye9FuWR4wTkrILb
         U1NjanEdidlq/RfXC/Zmatj7FJGENpQqI4E0i+KPOnVlziHGTPN7Ig0A7Wy/TE4C2b32
         vq7pg5i63kpu/E82QUZzWrLQBoDU8yrWhMuwqEV55pS4flK53A4BsiNA3Y183PIDjVfF
         aOfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pVvQCGkK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13-20020ad45dcd000000b0062558658712si4601906qvh.246.2023.06.11.02.05.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 02:05:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pVvQCGkK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8Gxn-0006DH-Ud; Sun, 11 Jun 2023 05:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Gw3-00034K-W4
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 05:00:32 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Gw2-00046R-6a
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 05:00:31 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30e53cacc10so1966391f8f.0
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 02:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686474027; x=1689066027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7bOi95+MAdYOQf36lFFFxG4Odq562AhoTTqq539rW9I=;
 b=pVvQCGkKt+lBR/jD68SYizRPTi1X3apKBFe9rOh2WBWZtaGnK2+P+iNT5vmiu5s4tn
 Rhh3Gx/IPP3QtLtJl35AUb/Aluq75RpStzEjk1ArUXz+V8QK/rhTboCQRu3cMlnuWBqz
 1Xu3lEtfIZUNeWxtKqdyJmtsNKj4ZUgqPB5Xqew/ijndssGqVnsv3n6Eaunpa8U6T10W
 GlFNe6uJpGboMda4SwfMC/HAFUzZJQ4V+8G5Pnbwx2anwDu6QL2F700+e4/wXBGioeag
 PnVvvQeUVbhQXQMvBd56284gp/pcE0FO2J6R6g0Vv8W2xlGpXuAisOLa8xIVIXkMHKRe
 7l7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686474027; x=1689066027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7bOi95+MAdYOQf36lFFFxG4Odq562AhoTTqq539rW9I=;
 b=dvBc/IJmvrvQsUMHqzIe8Cn/N2/BNutA1M+RAucMNDbGIeuEnFeU4EEKlDbIaqcRN0
 AfflXxreptmqViyu852bS8N5AuWmd7Sr5JHl+d/SUKFNyrExer8XLQSAUIHM2ZMaVZsh
 B0kUxK4GSTgdLCW3PViQHDck7mvfw2/g2lhIdZ4zPGOtuT15+Pn0ifOzmsVHIsGFDRU2
 bSe/KvCeMDNkWNUQuGug8GOPK1GXG8OV6gX54xBQgbPf1Mj4SfMrrEQCw/p7CGLEio4T
 mZAmIYk/XbDH6AjrO4e/4OWHmfIg9i4MsFtxQHFchx9WT7bb1+TocnUE+4h2qBmYDpuO
 JFlQ==
X-Gm-Message-State: AC+VfDynCrW6b3FS9kDGq15vOORN9JZf/gB9ODvMKh+QGAuuVkMX8O6C
 rkq1WGMIwIrx5AGtAPFNlEjeXg==
X-Received: by 2002:a05:6000:c4:b0:30a:e5f1:eedd with SMTP id
 q4-20020a05600000c400b0030ae5f1eeddmr2207118wrx.67.1686474027539; 
 Sun, 11 Jun 2023 02:00:27 -0700 (PDT)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 h4-20020adffa84000000b0030647d1f34bsm9103172wrr.1.2023.06.11.02.00.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Jun 2023 02:00:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 23/26] target/arm/tcg: Inline 'exec/helper-gen.h'
Date: Sun, 11 Jun 2023 10:58:43 +0200
Message-Id: <20230611085846.21415-24-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230611085846.21415-1-philmd@linaro.org>
References: <20230611085846.21415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 4yfTFufgIKxM

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
CHECK: By extracting some inlined (FP) helpers from translate.h,
we could reduce 'helper-gen.h.inc' to helper.c.
---
 target/arm/tcg/translate.h | 4 +++-
 target/arm/helper.c        | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 3d7c55d3b6..fc6357eae8 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -6,9 +6,11 @@
 #include "tcg/tcg-op-gvec.h"
 #include "exec/exec-all.h"
 #include "exec/translator.h"
-#include "exec/helper-gen.h"
 #include "internals.h"
 
+#define HELPER_H "helper.h"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
 
 /* internal defines */
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d4bee43bd0..89ee68893f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -26,6 +26,11 @@
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 #ifdef CONFIG_TCG
+
+#define HELPER_H "helper.h"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 #include "semihosting/common-semi.h"
 #endif
 #include "cpregs.h"
-- 
2.38.1

