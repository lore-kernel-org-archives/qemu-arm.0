Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4300486ejc;
        Sun, 26 Feb 2023 21:49:27 -0800 (PST)
X-Google-Smtp-Source: AK7set8XUeKsNGxsW9fk1q+w0lePOTD1y5CRFp0W280jeh7FWuzfPB8w90Sq1V0bDTNV1myLoWqN
X-Received: by 2002:ac8:5947:0:b0:3b8:58d0:b4e4 with SMTP id 7-20020ac85947000000b003b858d0b4e4mr41457864qtz.33.1677476967241;
        Sun, 26 Feb 2023 21:49:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476967; cv=none;
        d=google.com; s=arc-20160816;
        b=lwbQCT/ePq9HPhUb8HVF2kOH6HCPWVAr6V0f2eRS7+HPLvAmGy0UpnM9ActAW0VIdA
         6X6v/zoMIaw1LQYmpS31mhaFZuJbIQItHMlY4M/s69EmxpSjttNSJtzIW8N9vs0zI2Ja
         l8bP9KBon4esCMd4cVNi1X7BVOoztlSxj1onlafgBRmGNHpieaO+M1Rd5S85am+9ma1M
         J6TSqcW7iSAhm0jBPnyACcqqBL+XZse75qaNf2Ryi3nLdkER6ErAp/CIqJ8BfmWKJt6I
         HULf9gp8dg9aprpRRuUfumkqffmGUeYztV3X1QBYTVOZ3rEqsqhGxnIk8/blO7KgGnoH
         nCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oMu/UfowZNJPZ+Z1nOXWigHv/O+5gtKWuTrVMk/F7g0=;
        b=c9P5aLKjOuS9ur/ZeKdO0tVSQervHf1W7xuUe6kxJ6+SX7JFMHopw0yT/J8kD32fs2
         hhbj+kHqoQ0OT95ZWAT00kSkgWXOpbRoEpxRZZEVGaIxK2mMk7hDxK/IidmYNH5CK7qR
         UxH5G40bOh1H0L/KmTIBX5xZqOFF5Uh910NWKqC0SGnxxMCPZq1u9zwJG/MU9AmIkqHB
         RzGBZD5so04+PPIMSqh8hzcubuSd5/YtBxaCGCjLVIFS4rJvUdc5/TEdFRc/0PhTqWbU
         Prdr2zOsRvKZXmfQP7II+Lfo98vgaVpBKYeAN5uWVmJVC9OzyjA0PIquxOOAo88d14SR
         dn3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GbCQgYK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020a05622a1a8200b003b86aa56ae9si5974271qtc.635.2023.02.26.21.49.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:49:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GbCQgYK4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWCG-0001RP-Ig; Mon, 27 Feb 2023 00:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCF-0001Pe-Ol
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:37:11 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCD-0002Qd-TR
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:37:11 -0500
Received: by mail-pl1-x62f.google.com with SMTP id v11so2022150plz.8
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMu/UfowZNJPZ+Z1nOXWigHv/O+5gtKWuTrVMk/F7g0=;
 b=GbCQgYK4QIDZXquSfLjwaM8VLvXl3NZfdSR+K7f4x6xbPqUXXCA7G0bJ/NSehLc62F
 Dy5dzfvd7MGIk11q4Zuo2ARMpBsf5HOCeOKtL7EiqrvpHOHfpZ6n8m/eoSwQrDAZfzH8
 z7dfJ7ANSSe17QNY6USFGaRnwqmUfNfvsgJXZFbEnW7oAeKL+pO6eXmppdbmPMcvaoWd
 Cz4Li5wfB1zJX2lWXlBWeE0b6JgXpkmfaW+XPsmts/oNfe0cwg9UOqa2xI5pCYF6Lm5j
 ej8L+aEYGRfwoAC/Bqt5rbu/+bT+SNFs51Vu1wBFFYpk0u01qzrr4EB4ibkCNENBN1Rj
 bNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oMu/UfowZNJPZ+Z1nOXWigHv/O+5gtKWuTrVMk/F7g0=;
 b=08SmiiFLhUiaghviQckqMTwar6AAsJqmzoWYKkzKU0tEBjRASBiX0CopZ1iNzaZOf4
 Wf6FOoPdpW1RX9Km6AsH/7V8dvWhuFtnI6NdTMkcITqK+C5Kx56Tmc5pz2Pjg2h4avMN
 t0tAAYmh6DI3rBGuCLpW+OgjCtmjx/qJDTqdWEUkg7xkMCnk948Hjs6oHp+iaw+SaAps
 JMHENKrb9nn8UlcRJafQdT9DEjH7jQYkkil0E9XHYcTrCATs9OPJHHkEp0HNprXESbJe
 qLWHh/uDY7EiccTAWecrwuRs5xWRpcsj2Jq9MM8buPkSTJAC/8pBCZLFOIU17jJYIO8Y
 dqQw==
X-Gm-Message-State: AO0yUKUZ0onROPFm3e1jf0TunJ7GC1WMa2j8fQn92UECwiXIVylsdql/
 N2m7hEbhWfB8nS1Hl7tFNbuPYQ==
X-Received: by 2002:a05:6a21:869d:b0:cb:fe3e:e20 with SMTP id
 ox29-20020a056a21869d00b000cbfe3e0e20mr12752517pzb.42.1677476228549; 
 Sun, 26 Feb 2023 21:37:08 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 01/31] tcg: Adjust TCGContext.temps_in_use check
Date: Sun, 26 Feb 2023 19:36:31 -1000
Message-Id: <20230227053701.368744-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: duTNLewBrfRC

Change the temps_in_use check to use assert not fprintf.
Move the assert for double-free before the check for count,
since that is the more immediate problem.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index a4a3da6804..06209e6160 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1375,16 +1375,14 @@ void tcg_temp_free_internal(TCGTemp *ts)
         g_assert_not_reached();
     }
 
-#if defined(CONFIG_DEBUG_TCG)
-    s->temps_in_use--;
-    if (s->temps_in_use < 0) {
-        fprintf(stderr, "More temporaries freed than allocated!\n");
-    }
-#endif
-
     tcg_debug_assert(ts->temp_allocated != 0);
     ts->temp_allocated = 0;
 
+#if defined(CONFIG_DEBUG_TCG)
+    assert(s->temps_in_use > 0);
+    s->temps_in_use--;
+#endif
+
     idx = temp_idx(ts);
     k = ts->base_type + (ts->kind == TEMP_NORMAL ? 0 : TCG_TYPE_COUNT);
     set_bit(idx, s->free_temps[k].l);
-- 
2.34.1

