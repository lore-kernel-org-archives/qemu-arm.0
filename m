Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3054554ejc;
        Mon, 28 Aug 2023 07:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEb+U2+L4Gth19nj7JvJ5VT0CzuG4Wm5N/4QFOUjSfhX1wz9fiUJOBDfGDXQ7P2BZ/gl6S
X-Received: by 2002:a05:6102:3a6a:b0:443:7c69:4743 with SMTP id bf10-20020a0561023a6a00b004437c694743mr22047390vsb.16.1693234645945;
        Mon, 28 Aug 2023 07:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693234645; cv=none;
        d=google.com; s=arc-20160816;
        b=gTjE1AZyknCEfb/1wUCH5NEYv6pv1NK5bvINjz5k62HfoYZ7KELhIGHF8IxPZmakR+
         58Q6wR3qnAppSnoMSU1EA//vF9aZ2Sn0CV1HQHQQPIlEMXV23CKoO1HtaZizorcQB7c7
         Zn4Eq4C/BZ5DazDKaDzN48CZaQiCGs/tIwUt+3H/YtIr+Iakelr9dQpaDNpqsRsLJG9P
         Zt9N6Q5cJ2sCyiMonGYgBIZe/RQm/Qv5ckdIH2/32sBcBE3EjVNpaOIOrm76Pb10sK+o
         +7hdRGSUGYapL6xB1z2jkxEWlFCLgNYGZLQBzYXIfIUbu9oPzTNbafmOiLw1RtThS0ek
         Lu7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KkhqJAUVJ209lj57L0iB4q2VyrV5eDh4CMuLWSjFz6s=;
        fh=FxYtB1slzL/yn78+bieLaailXu9MIAo7Kb5vkjusizk=;
        b=gnbINjrp+CiEhuh4IrjpoIAl1PcWaThoRN/d/z+bhPg0T3/jQEuelgkwBukJxwZ6/G
         Rz4XGPc2/Zrl6wl8/xgGpT2izxTxjiuFow/kbuyZh+Lus1h0qemuyA8TZ0fKDOLpFdEk
         NLCk3GI+OYDFt18a4pFCtE1TU3Ct793fH96RLmyWBGCmquLRYCwObs6ZfzcBNPx26cOj
         muDova2LcSbBxbVQwcPgYjaobS3MBUxE3s8JQrmAgh33OjhnfrjTMKMExKcftQYSxXBO
         LXyWpRodEyNLqu/5VqHOr+DzuIuKQBctbYItePgR3oVmpV1YOksdl8LME7feHiSD9Z1H
         9iYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OgIUQ+6l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8-20020a0ce508000000b0064e329c4460si4775937qvm.190.2023.08.28.07.57.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 07:57:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OgIUQ+6l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qadfU-0003qn-Dx; Mon, 28 Aug 2023 10:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadfS-0003m7-Tn
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 10:56:38 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadfQ-0000r2-Qk
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 10:56:38 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4018af1038cso31728255e9.0
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 07:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693234595; x=1693839395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KkhqJAUVJ209lj57L0iB4q2VyrV5eDh4CMuLWSjFz6s=;
 b=OgIUQ+6lDyKbf0idKTkCE8+Q1FAhG7mNU12ib6hlwXj2UY30esy1birIswk8Qyt/B9
 gsOtsZ7UwzjbQGAA2jpuPC7oIzNQ3fsqyix/H6MNtxVS8EM7hD4kV+5Ylz5fAUbGKSzE
 YEf6WgnnZIJs4dmqAzvHvh6/APXQqEMlUZPP6VLNSiqsxy2c4GxEQm4q1eyvGWv3ZgQD
 WTznzKwsWlbUlAHWGXngqvvJtvoPZEZUOfpLQFIAVObhzyvisiuMfSgE7yO+vL+YCSey
 eo8s0M33bXJVsz52Ql4uH6fD9F7am1IkHhYL+Y7QMaTDWTOw9VACouI8f9rcJG3cAbPl
 w4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693234595; x=1693839395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkhqJAUVJ209lj57L0iB4q2VyrV5eDh4CMuLWSjFz6s=;
 b=QiWMDtlHM7I/6N5CLFRfkORdbeaPR8degDpjWtv1CUgUSgXw/YnSrcudZofjGiS5kc
 wjh30hejg8zsPHQEfZfPTln+P+SGjPVM3j9e2LIdFk240U4ToN2eUiFp52RoR8thD1xx
 dyWQu/iRdjEZ7pIB7iaBPU/RzswH13YPg3LJnlPdy0MsXsm/lzK9iDJ+fjH1kN6WwXn1
 +MznuwzofiP7Q46PspqkUToW0sU6hSV7s6iStnKqSE3S+dCBi7ASHmVxgeFPEcyJlLqm
 rLxGfx48H209or4JlU4iw5HEBfmjBYpz9PaERHOgNmxApwEhCLnVe6LMXJRKQNUvMTEE
 hPVg==
X-Gm-Message-State: AOJu0Ywp1dR9632vnvYdnxHVmd+LQoHRA5QFLXfhhVHQpqR3/Phxexjx
 JgpmQQBH3qBxs/R1k0q5knLuTA==
X-Received: by 2002:a5d:65c5:0:b0:314:1ebc:6e19 with SMTP id
 e5-20020a5d65c5000000b003141ebc6e19mr18853617wrw.64.1693234595538; 
 Mon, 28 Aug 2023 07:56:35 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 q9-20020adfea09000000b0031c5ee51638sm10782703wrm.109.2023.08.28.07.56.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 07:56:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 8/8] target/mips: Remove unused headers in lcsr_helper.c
Date: Mon, 28 Aug 2023 16:55:45 +0200
Message-ID: <20230828145545.81165-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828145545.81165-1-philmd@linaro.org>
References: <20230828145545.81165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: x+0aG8r27rFt

This files only access the address_space_ld/st API, declared
in "exec/cpu-all.h", already included by "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/tcg/sysemu/lcsr_helper.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/mips/tcg/sysemu/lcsr_helper.c b/target/mips/tcg/sysemu/lcsr_helper.c
index fb57bcbb78..25e03572fe 100644
--- a/target/mips/tcg/sysemu/lcsr_helper.c
+++ b/target/mips/tcg/sysemu/lcsr_helper.c
@@ -8,10 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "internal.h"
-#include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
-#include "exec/exec-all.h"
 
 #define GET_MEMTXATTRS(cas) \
         ((MemTxAttrs){.requester_id = env_cpu(cas)->cpu_index})
-- 
2.41.0

