Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3054298ejc;
        Mon, 28 Aug 2023 07:56:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEl9Jp2f16Cuhqm5CymoQh3WhcuhOdJscnUjkTdc7xBd5XrzANfHK0KE7SEDnnHfX0Rm95d
X-Received: by 2002:a05:620a:4009:b0:76e:eeaa:a079 with SMTP id h9-20020a05620a400900b0076eeeaaa079mr15595230qko.10.1693234608845;
        Mon, 28 Aug 2023 07:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693234608; cv=none;
        d=google.com; s=arc-20160816;
        b=b0LiPQA6f+SBgsqXWX4bvSsjKoRn+MYRX1SWZZFCF2/U4zej1nDECErSAQ/8iFX6uC
         fHt8qkXPyY+nbLAFKEkHDoTCoPamyZBfF7hX3r1on/uPiJkrUDcBPWojZWgLUGSrSkq1
         sJiEosokCp7sEDC3fTFwNq10ys/CYcTzxAuAlfA99aK1paDqCtHRIv73gvIzOjLqjERA
         yfcCvp7/YtFJkTG2iaeN0wON5kYQlNV8+C3VLRYbrCLoyJmUDiSzRyFCj1LbYHoDEIjO
         Vt4KOJg/WKyxlt70ZcHqzjNhxkaP8JKn3ArVGMPt5HLMQkQiv7nERKp5x5sPgWKQ6t3b
         HQ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CDnk9YSeaoJdQRRB9TTsPC8B6FMZ/ZKTWzxCgLttq3Q=;
        fh=FxYtB1slzL/yn78+bieLaailXu9MIAo7Kb5vkjusizk=;
        b=GZn3ZTltMukEUwysD6k4vYqREvcghQ+ISGrC3lsvp6zfmqEDcy/VY/TqQ2/Y0zmpZR
         cDwMbShIE7ehGADJXZP6+YHADU8RgQai0ACumQMWM8pe92lFcY+8xGJL0rLdIimJpcnO
         ZoWg/LL3WpV8DoNW1ujRoL/D39j1eefv12OELyFxP9HQVWQ49A35JwuKyix6monnc9Ou
         3M/B6uzHm3AqOlMQOO46A99QFRRwfM2rwMrKa2J7A4GZ/5YpRgg1qlOLuUaaXhQRNd5q
         d9iL7Aii77iTdHaMY3qqtm9Y1M4/bbWMrPgwXD4qCMT9reVxMOgaRCeWoAPvoicX+Qd3
         6VTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RX0Ofg5K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17-20020a05620a0e9100b0076cb1cfa02fsi2636414qkm.672.2023.08.28.07.56.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 07:56:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RX0Ofg5K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qader-0003FP-TL; Mon, 28 Aug 2023 10:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadeq-0003EJ-2a
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 10:56:00 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qadem-0000cX-7P
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 10:55:59 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fee769fd53so30419105e9.1
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 07:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693234554; x=1693839354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CDnk9YSeaoJdQRRB9TTsPC8B6FMZ/ZKTWzxCgLttq3Q=;
 b=RX0Ofg5KAXxE9CDOWpykX8qYJeHS2VRbi9dmFytIAybRaja/e+N1aawJ3Ja7qiw78j
 uz/xTipwL1cXatc3MLu2VtGxp3fBWQmLGV0EYsWsOpmMVPBL17/wXaMAwTV+4tKvVcO8
 J2jeyC1jmzJIhk4XCV817THqBF6btaKqOHUSkl4yoYLfl4GiFjYWXHWBjKW6QDvSvThJ
 Ub6qbwgv+uygkpb+BlSuY3p2UODY94HNZUiLhCeQ/A4valJmrYNhCGBQvRyifhTdbn0K
 ZPbra76QKYS8rUU6Ki73MUK7dNR9K0P18fZwvRbej4luWpCnOPMaClw7ioMnOj2XW3To
 b+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693234554; x=1693839354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CDnk9YSeaoJdQRRB9TTsPC8B6FMZ/ZKTWzxCgLttq3Q=;
 b=Fxv6Er/p9I6BhBR5Fg84VCGOEvNm5lbFPE1h8z5D0vqV6siyeKF9HunPAAIV2ORH68
 OHhFD1P4EFlVbPKKwxkbtY/r+IkATrg2Gp/V6B8El89gnk0vCo3h75w2qZT7tb3FLBbn
 SWX/1EaNlMwczT9nw3ypELf5ifY9h9jnXzejW3lqmHCT63KopkC7aUISsLAsQuVOu0m+
 gyFtvUs2u2eEmBbvX9pRSxbri5g2jYMFsuaSaEnUq0cDQSosQVX4VOVh2/J2H1J/Az9V
 yqUdwDOzy6M3bgofbhGLSt/YFgoqBj2gTmFBTrHkFjcfJatfI/qdaxux1U8PZvase/xQ
 OtrQ==
X-Gm-Message-State: AOJu0Yyi5VRPp47BQuvxuUVFjkVQUuoY0Azj4oRQmYNdj4Blmj+m8pBL
 0k1H+RLA69GIUPynkB2shHi+ng==
X-Received: by 2002:a5d:688c:0:b0:31a:dc2e:2db2 with SMTP id
 h12-20020a5d688c000000b0031adc2e2db2mr18174702wru.49.1693234554675; 
 Mon, 28 Aug 2023 07:55:54 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a05600c221300b003fee9cdf55esm10908709wml.14.2023.08.28.07.55.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 07:55:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/8] target/ppc/pmu: Include missing 'qemu/timer.h' header
Date: Mon, 28 Aug 2023 16:55:38 +0200
Message-ID: <20230828145545.81165-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828145545.81165-1-philmd@linaro.org>
References: <20230828145545.81165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: 3Ij1K1bbA7q8

Since commit c2eff582a3 ("target/ppc: PMU basic cycle count for
pseries TCG") pmu_update_cycles() uses QEMU_CLOCK_VIRTUAL and
calls qemu_clock_get_ns(), both defined in "qemu/timer.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/power8-pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 7bb4bf81f7..2537cded83 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -16,6 +16,7 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 #include "qemu/error-report.h"
+#include "qemu/timer.h"
 #include "qemu/main-loop.h"
 #include "hw/ppc/ppc.h"
 #include "power8-pmu.h"
-- 
2.41.0

