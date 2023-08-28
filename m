Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3284625ejc;
        Mon, 28 Aug 2023 15:15:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBD2B5yYlS2Kv0pCrhMO57OmpCg8+gojpMP1PZhBAdqG5LUA5uAA8b4hbylshsHeB3TCoU
X-Received: by 2002:a05:620a:1249:b0:76d:7431:2fc2 with SMTP id a9-20020a05620a124900b0076d74312fc2mr26495929qkl.73.1693260920895;
        Mon, 28 Aug 2023 15:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693260920; cv=none;
        d=google.com; s=arc-20160816;
        b=JUb1X62o5+HKZWrbpLtMp6FWmE0UAWIf/JQk4DkxIF+/APRTh8kbQEm5URbsbT2Q+v
         8Mu/HFJFcQNRVrjeZRG6grsxchfJthF/9W8JUMWro7GoPlltPValBLDW90kcustXin2v
         2P3vwrzjibUS/f7pnSC8SLnqVYN5Kh2IgM8OeS/fk3iMgfYXqahXphk/Q7PxOH5fmVuW
         ipho2AMdxkmU5S1g5DXC69TgIiM35ajJQTTjmhQt3v0d4LhM8cyZ9+bPeKhmrRzv8kVh
         4l8rVobZqMorPmUnUYqtZDdFegk/MnEFzixX2zFElhOjL5uRxQOcyJflb50rTWoFs/mv
         NG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uMoJnfVgaQ/gSCJ1EcKalX6fTZe7ML+oEsM4UrP9ySg=;
        fh=CBJPxJEjNCibwfpZfKrPGtkERKtYgP+G6TPhM7p5XaM=;
        b=jfXFmSc+kV+tczHHJBiCJdaqFd8jmMCKhCbo/hfXnkoxJVSN9CHG7PsQjV1HlHU807
         jdEIBI1saOoKYxlXUw3YSM4IGAmCxQpJUVoc997Zg1BsUnBY79iOHF2CyFPKQicM4mOH
         FvzuklFOxbEmAothLGEgvrIx5SyuKT69xptfB0ZrIUudqbXcdFZ0LkleyiDPCtJA4JUD
         DhPSRQtRsaUlU/yZfTyPmFpbH5OAbbPE/TY1xY7rPTFkPJiz5apyN041XtKCwXfeWRB7
         zD0uNPGn81PsVGexG5zOYufzjeSjj/CbBPLnXqofX2Ny1ZE7K1TD5JJqQD7pSQasrcpN
         GUNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ueRVCvKg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17-20020a05620a249100b0076c7dcef4f5si5388610qkn.156.2023.08.28.15.15.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 15:15:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ueRVCvKg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qakUK-0005u9-Jw; Mon, 28 Aug 2023 18:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUJ-0005tb-Pd
 for qemu-devel@nongnu.org; Mon, 28 Aug 2023 18:13:35 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUF-00048z-FY
 for qemu-devel@nongnu.org; Mon, 28 Aug 2023 18:13:35 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-401b393ddd2so35094555e9.0
 for <qemu-devel@nongnu.org>; Mon, 28 Aug 2023 15:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260810; x=1693865610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMoJnfVgaQ/gSCJ1EcKalX6fTZe7ML+oEsM4UrP9ySg=;
 b=ueRVCvKg2mCfDpdrpsar4KWAKAQlZnxAwTgezKNFmIMX2ApvXjHpM8UyClm6Kh6AoZ
 +A/6w6hOUVCJEvM+CMOL+zSXfNuu9h1yW3UG441TQGuZcNlJhJDtDKEIJ+6Eo/tArxqo
 2gCqWZSJfPo4X9gJTl5qwYxJ4KRLlO0+1MtxCGe8nQmUiXJD6/VoQrG6iPGKNYO3koMA
 m2HxNN1A9VmW4BIe3fruRTWO2x/nQnP4DLfad1mU4NxK+Q7Z72lXiBpc1tFrGfdBb1Jh
 UdHvYI3X7ypsW0cnCK2FXqBqUi62LtnxEA64F25498Qor3zwDNUMG0ondGCHX3IgoyPN
 xAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260810; x=1693865610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMoJnfVgaQ/gSCJ1EcKalX6fTZe7ML+oEsM4UrP9ySg=;
 b=VZJmgVhuaQ3kuSs8qLTIDttojETD2r7ebeI2JKoKOuU0YTpUFwPa0YRNhQ4qkMAPHJ
 +9NFOPjuhGb2+5YMhABNAtoH/BcAIrJnMTClros0A1ilPDs7Hw8xCbqywiCaqhuFgwd4
 +Pf5Wu9o48AVe/RwaS0AeVnlnZOF9X+zV0Jbhsvj78s67KcYzWw200weQrzOo97a8i/O
 03Cna7UHj+ZE//t79HqPTSL3V7E8uQCQf3nYOESld9Q0mwKxYQwW8/03ZsR0QvbRCa+I
 8znMCG0ug+B597xM7ekXzO5aa/O/kk+tF3tOb3cmUll7jwU4INs+Uo3zatG35g6j/MXm
 D4BQ==
X-Gm-Message-State: AOJu0Yx1OmofYuEvK/BdMrNS3xtSwsDkzXh/l7XlzHKPQ6+oefLUM5vs
 nW/OFgeYXGUH1Ygqqw8pACkK3QvoDndA/ysnnwE=
X-Received: by 2002:a1c:f304:0:b0:3fe:4900:db95 with SMTP id
 q4-20020a1cf304000000b003fe4900db95mr21506058wmq.37.1693260809816; 
 Mon, 28 Aug 2023 15:13:29 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a7bcb89000000b003fee777fd84sm11904037wmi.41.2023.08.28.15.13.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:13:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 02/11] target/riscv/pmu: Restrict 'qemu/log.h' include to
 source
Date: Tue, 29 Aug 2023 00:13:05 +0200
Message-ID: <20230828221314.18435-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828221314.18435-1-philmd@linaro.org>
References: <20230828221314.18435-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: VFGa78PXYx7h

Declarations from "riscv/pmu.h" don't need anything from "qemu/log.h",
reduce it's inclusion to the source.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/pmu.h | 1 -
 target/riscv/pmu.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 0c819ca983..d2be06a133 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -16,7 +16,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "qemu/log.h"
 #include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index db06b3882f..36f6307d28 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -17,6 +17,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "pmu.h"
 #include "sysemu/cpu-timers.h"
-- 
2.41.0

