Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2890671lfq;
        Mon, 14 Dec 2020 12:25:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4keBJupo8M3b7L7M85U9EEkhpQIUUNaYKprbd0B1owx9Z4kLi4+FhWoJb+ui1pv0H1su8
X-Received: by 2002:a25:234d:: with SMTP id j74mr29720153ybj.93.1607977538699;
        Mon, 14 Dec 2020 12:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607977538; cv=none;
        d=google.com; s=arc-20160816;
        b=QxVJVUd4n0bnh1dTRMRvKGg0pnvtNINRh7xipyq/b9Xhuh6qXcie10p3xEK3JCpoSf
         +nIayfF8+FnO7dQXGbnIf+rwjhFfzDKU080fymxZlZe8j7OVd40UbYJnvXaEYFJ8AgJp
         an0xXvwkZJkNX47r4DKUKfGQyMjxlQ7H7x+U1POhvhfblfsTUf0EvEUj7rHC9ClAQ60f
         9uVapH3h3XAe3PF7Or5c23zU4da47ob2vCLW9dm1jbLoOyFPyEuWParalTV1Fcew6TY0
         sxfrzSBVCKNf0NMqFt2ZlRXNxjSy9EfyzUHQzbftEFK198mgrwcLCc0hgMfJbUu8YBy5
         PrUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8uKymEvHxLhI/HESvCLlvDaFGVnfnEsKv4uQPw8Lgj0=;
        b=lsQqlEYUXAznWFeokST63r/qIjCFZmVsrIAvoX6lw+kRg1RGB/S6jhq0vu99pIpj9S
         2eQB4VsvRPlKiULOsVPhFC4sedwvvnDuQDEVi+1rb5+AwQeP4x40ZQ2fa+lBpXCCMr/O
         1MCsT/QSBusf5mnBVRtFlcZ4ILiH999ahpGm6/1RtjpHuVjRxsgXww+xOATM1ISNp4Gf
         V9XUC9EFnjTB1Jajv0y6tBFTB3guD5c3HCXDnAlZJJtjqVhQ6T6mSXrnzFPptADZGnfY
         b7fg4D4OHq1S6wqXOHhSqfE9n/iKv0hKZDj+1mZSfPFF0/YUaKNnSZ/e6uFKWIZUvnWX
         BRVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=b3Jg1bD0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n21si18405379yba.428.2020.12.14.12.25.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 12:25:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=b3Jg1bD0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kouPa-0002D7-30
	for alex.bennee@linaro.org; Mon, 14 Dec 2020 15:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1kouNp-0000Yo-8P
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:23:49 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1kouNn-0006et-Qk
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:23:49 -0500
Received: by mail-pg1-x541.google.com with SMTP id c12so12948421pgm.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 12:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8uKymEvHxLhI/HESvCLlvDaFGVnfnEsKv4uQPw8Lgj0=;
 b=b3Jg1bD0h40cQzECQaVmhjMaJsCTGQCvcddKA7qpx2D5/nzfex2Ja6oUAL3hHc2H1D
 H7nu++PnTyMYRj/LvigPXQ/82j8XzI6yamCwMC4mF99soHwVBHYgR0xClHtOYslIw85B
 plOzD2ING28+yT2R5Kj2f7VT2ANkjGrOeKbFRujbyM6Ai9N3A3dQ3JQieDSUZhXeKc/d
 v4bSVlLO/yOi4BUVYec4KtIHFZ95lfUbiZe8r01X5WRK5k6BcRz3jJTVgkCzWh6agiOk
 t9JYJR9GjnVvRfSYpla4PO2d5KLmFZcNz8Q/4bsFG35m5rKzCQsADufZjfgIICmF/SAz
 b8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8uKymEvHxLhI/HESvCLlvDaFGVnfnEsKv4uQPw8Lgj0=;
 b=ZAcu2uVXR/q3VHuCp+A34jVt5QfC3iMLfljctSCGJ26t65+nhRBc+NEAZQcYSwAXm3
 LjJ7hcEUZtL/HJfcgUpkWO+3vQfSq2rVy9jL1Q30zgidRD5/YXLLgAF3gqk9gXaNXqeW
 DQ2v4QcapGwyO52JUI823D/qjMV4UnA3efM04CNLeL6EuP4kP2N4KyjxBWlD8nJEgcu1
 7oWTvSSMIyV75JuojlLf9NwW5z+PxwRp59oB2YuSMi1tdiLUrbTFN+m4WSR3dQyxMlyA
 pEyJ6uSUfoAebOhU/gA1AKfx1NCjACyl2cMV54yN6hvbFbwJet15V16mQvhPilnu9NMA
 niCw==
X-Gm-Message-State: AOAM531X/Suih/1Um/hqQgkP1W8vhDlA51BTtS8E96/YN7SM5tiK7Tto
 f28CIoBWw2d0d3aeeSqzFu4+M6z0N3BBDQLEUU4cI18EOiOVG5JlsaFpWvquV8CGkpUM+vD1Zle
 54VEqO2Nvsg+MmLUXKA17ROMiQKEXLaaTjZqwLbI912mGPcj6NCQcVWdg2v/VQuZy/rG67OIRIw
 ==
X-Received: by 2002:aa7:9722:0:b029:19e:2832:4f63 with SMTP id
 k2-20020aa797220000b029019e28324f63mr25482629pfg.58.1607977426221; 
 Mon, 14 Dec 2020 12:23:46 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id a141sm20927524pfa.189.2020.12.14.12.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 12:23:45 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64 CPU
 type
Date: Mon, 14 Dec 2020 13:23:29 -0700
Message-Id: <20201214202329.26765-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214202329.26765-1-rebecca@nuviainc.com>
References: <20201214202329.26765-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=rebecca@nuviainc.com; helo=mail-pg1-x541.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wIeMa5siPmYI

Enable support for FEAT_TLBIOS and FEAT_TLBIRANGE by setting
ID_AA64ISAR0.TLB to 2 for the max AARCH64 CPU type.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 649213082ff9..4b9c5887cc1c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -620,6 +620,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);
         t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
-- 
2.26.2

