Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp34917lfc;
        Tue, 2 Jun 2020 18:21:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHxSycRQeYR/Jy9ArtbB9lHvsnyyG78TQhpctcgJMr80eAIqw3PywcbDE/Lf8Hcn8geXxS
X-Received: by 2002:a25:31c6:: with SMTP id x189mr8786795ybx.402.1591147265500;
        Tue, 02 Jun 2020 18:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591147265; cv=none;
        d=google.com; s=arc-20160816;
        b=Yf+KqgWeC4fjlibUdWWevVtyG0cJ3pWsQ3biwXDWN/gucB/4Zpyo21qzHCP8NeBbr3
         FqBs2HtmDA6ozCrO4uWoKhIZM6lQ2Cah7GI2fgFTQ5BZFLzM5xtl9LgcnMPdTFCnSyqR
         v+bOSLrWEKt2ovG+m6OZF7YetkXne/LNZqlnIpYUkTDyVhP6W/HGpjP0RUrE0BXYiopx
         yJ5suG4fBCelIEN14p2iZdAP850PFty1pkZ4T3dqJBJsLUHPOcr9gqWYoNT+h889a9m4
         Syj6IIdulv0JziA596y1CKhr5KUvG7TZqe2oCk/T/EBfNpZ0j1XrtaB8B/2+f7tiNy4c
         lKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=C4qDuL752EiiSk3nsMH6iLKPjyLVOQMWVDOC2KEux/s=;
        b=eNFs/UYdceY9v+otTotdQ9iMI+GTasx+HnWpM92w9JHoQn3vsSCyS7PTLQDKo8LvaA
         D/m40cnaTnJv2YcZSEbtbBlnJm7nuFfG2XKC7zNO/mu+auA8yfWoAtz7EHizlD3XVa81
         GRRUa8Z681+2Jwn0XRf4B2N/S/PfoAo7Fvy9BXoHYyz6YtTvf0gjstGIvxDdneqlt+y5
         LT6RgJUV+Z0pshR12Imtnovw81FaRGpNORLb6KZVfxLO4BESFgMxpTkXK3dSKWP70Ysy
         qMxlk/eAcK852tdBCNxsNyVFDn/jrthChbB/us9BhVz8MC/maXYT/4I/fi+x+y5dBMb4
         ezFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AkB3uzpT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 131si314732ybe.185.2020.06.02.18.21.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:21:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AkB3uzpT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgI5Y-0000sv-SL
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyW-00042o-7C
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 21:13:48 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyR-0003a2-5M
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 21:13:47 -0400
Received: by mail-pl1-x641.google.com with SMTP id t7so209481plr.0
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 18:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C4qDuL752EiiSk3nsMH6iLKPjyLVOQMWVDOC2KEux/s=;
 b=AkB3uzpTGuxEieVSjMGtHxWwJlZmAJJoRb0uBkEqwza+LNGxNHjYgyjCmUNVa0gd6t
 iSKf+2SNR57eagpHllanngZWVqzWfV0cRdc91jOJZt529NQFne0GYs2+0oyqWA9K5wz9
 P0KZ6zE0EXyOJu5kCzNc/aJ/DyJ6avuxVcLBQZOpX3iYW5qqKGc4qC/nO3wIbpsmzx1W
 IGxzJK0uYMPZl3Y8AmsHqoxsmxLOeD0FAt5lGq5QYQQyCZVlaCMxt5aTMOmmyUDbAUkn
 DkanfPaCxZRqTS2Mc05PSHwKll2yGR3r80uJpQqCIKSPk8IzrML90PzwP+seXFevG7fa
 Na8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C4qDuL752EiiSk3nsMH6iLKPjyLVOQMWVDOC2KEux/s=;
 b=SREb6Ry3pcDxmIdd3ndAYx5baiVUZN8Px/gTEUnw/tyfsDi+DwDahaYYgC4BnhRzcH
 BVQlHMSb6pPdiU1xebubxFmfMw45kvhh6tZgYhSqfpi9RZgWJkMQpO/pRFG26Mf8y8F6
 7uD5YlpXjTIhM3+mZ9J22QmFHZc2LNGeL4XlUiK2i1ENhAcFSVtf1GpEfKfCa3A8mWH2
 iLCYgm207Vvzmp+64aWR9jm0wbaurj5NpRPLNyyksgl8+gvJZKBjDHEkhFIM0slHh+LT
 3GiYpXc/eoclmF7QruHoGcruRMKFDBmvLwnaCb1HMg1TCWxkRfPr/cVRGSBTAnX3HyPH
 kung==
X-Gm-Message-State: AOAM530lj3HWzjpVIxDZhwBWE6N6aA+KtH3QohPRrHAhOrmOuG7PbsRk
 kH3Whdt/vYMAUtty0TDE4SxPpRpleC8=
X-Received: by 2002:a17:902:9a43:: with SMTP id
 x3mr27532907plv.332.1591146820716; 
 Tue, 02 Jun 2020 18:13:40 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 17/42] target/arm: Restrict the values of DCZID.BS under TCG
Date: Tue,  2 Jun 2020 18:12:52 -0700
Message-Id: <20200603011317.473934-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 77lIxEKWb//w

We can simplify our DC_ZVA if we recognize that the largest BS
that we actually use in system mode is 64.  Let us just assert
that it fits within TARGET_PAGE_SIZE.

For DC_GVA and STZGM, we want to be able to write whole bytes
of tag memory, so assert that BS is >= 2 * TAG_GRANULE, or 32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0f1a46f531..8e6d4371cb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1754,6 +1754,30 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 #endif
 
+    if (tcg_enabled()) {
+        int dcz_blocklen = 4 << cpu->dcz_blocksize;
+
+        /*
+         * We only support DCZ blocklen that fits on one page.
+         *
+         * Architectually this is always true.  However TARGET_PAGE_SIZE
+         * is variable and, for compatibility with -machine virt-2.7,
+         * is only 1KiB, as an artifact of legacy ARMv5 subpage support.
+         * But even then, while the largest architectural DCZ blocklen
+         * is 2KiB, no cpu actually uses such a large blocklen.
+         */
+        assert(dcz_blocklen <= TARGET_PAGE_SIZE);
+
+        /*
+         * We only support DCZ blocksize >= 2*TAG_GRANULE, which is to say
+         * both nibbles of each byte storing tag data may be written at once.
+         * Since TAG_GRANULE is 16, this means that blocklen must be >= 32.
+         */
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            assert(dcz_blocklen >= 2 * TAG_GRANULE);
+        }
+    }
+
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
-- 
2.25.1

