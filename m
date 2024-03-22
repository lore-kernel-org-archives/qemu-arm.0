Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp1273044ejv;
        Fri, 22 Mar 2024 08:58:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9t0nM7qPimnyARwTmc/c0nsY+QtORzPMC3MGMughNqPM7NnhspRuGsyELoFVI9A7Lssbwvv2//19jBva0zPgHaCxFxtbc
X-Google-Smtp-Source: AGHT+IF8S9LdoVrK5Izk5cWpYPd0gFsbUkT3R19nJ6IevztX0DcESBJp+U5KI2OW5VxvWKQr8Dqs
X-Received: by 2002:a05:620a:1277:b0:78a:1891:806e with SMTP id b23-20020a05620a127700b0078a1891806emr2627592qkl.21.1711123111525;
        Fri, 22 Mar 2024 08:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711123111; cv=none;
        d=google.com; s=arc-20160816;
        b=Ax9NsuoSMx4fAXpC9Czy4KSE2YlByIzI/orIn3NkwIjI6sb09DMExIDAeoRftQBFjS
         PHk9ahnwgZix98Kz6bEJFzpS5y1eP8TGtsKDy2EX3oeKKEeizKPd8K4PRrco9vHtSUC0
         F2/pjRcXPU44MPX0ztcZ0eJKYn1xyUnQb/LQAwGSZk8oe6YzGrU6rpAbXMKL5a9/528c
         t6cMSfvZEea3UX7+ysSGE2CY8WDE0jpym4T8ENg8FRF1/ZjFlBPqu5sFab+Ek2SvBbsw
         bXXZcgjW52kIWo75FGgc3DtI7GwnjvzVJfLIi0+CepKmnClsvnpzApclm+AimCdmSO2v
         ESeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2TU+ztvKvf1LMC2G6CQqJztGFsXq/Nhw2cglRUoGn74=;
        fh=mplo/004ycv2wYEPjKAq1bRi+07xxL+F6kaNCOQ9rKU=;
        b=gi3bJD+0lB+taXPiK2rU+JE0oYtvp+jrwGWpxM012bWIYBsAxRVb24xN4P+dZwa9+U
         Ocs3MwgrAfoMb2HXT27fWMUblZSTCR4T10H9qfRY94XTQ3R8vaUeZhUlB8+StZj3QLgR
         5TGhO+w21vLwZrPhrJs8AhIiGmiVD5xU7PoGoufUSDkd29ncqAgDcfFl2drfsc5oXSSM
         1jPs2uAQcp13By/d+oGnMVhkTXB984PjdC/CwJAmS9UuJ2o+B1mT/V/RVnCR7/fb6UeD
         +yxnUTH5bgtZlULAJEGk34D+xgs6Gi6g08HVXz3bAIzXfQ1B0BBZlhrXlQTG1R+mRjXA
         WZAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IRj4kd+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q25-20020a05620a0c9900b0078a29bb73a3si2192828qki.370.2024.03.22.08.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Mar 2024 08:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IRj4kd+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnhHp-0001Aj-S1; Fri, 22 Mar 2024 11:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rnhHk-00017p-5L
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 11:58:24 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rnhHh-0005c2-La
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 11:58:23 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4147e907143so2616095e9.0
 for <qemu-arm@nongnu.org>; Fri, 22 Mar 2024 08:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711123100; x=1711727900; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2TU+ztvKvf1LMC2G6CQqJztGFsXq/Nhw2cglRUoGn74=;
 b=IRj4kd+GPrthWtyOnlnyX43CyFb4Te1FWMpz+4OyGJqkZnyFynoLvD/46mcWJ2E25y
 UXM3+3XM69RmdSLX5FyOJ+xmEFbJrt6bD4iR4KqYYp2UERTwPuwNwZXuQO5i5GULOc4M
 ocTeNcnLEH45R0NTTTd6CxTQEFlEDsXMEP82u6aK0Yt1MH/GZlcsl5m7YxhatXUf5rJi
 fU1FpqCeLSfB61gU4vuNqCX6P39HejAxA3KuUCpwhW2ztUw6KX39gIpu1xizd7YKxTlA
 HdIVUAAKlLdkNqfbCI9MthZ4putL6Ww3FvJiE1E047gfypzs1XiIZe9ZwojBNAhYiYaJ
 wYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711123100; x=1711727900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2TU+ztvKvf1LMC2G6CQqJztGFsXq/Nhw2cglRUoGn74=;
 b=U1dxyCIR0jOQDRD/YnDFyFQTCuzWTaYyT4gVZQN2gwhvLgpuxFCnLVnVaz+p50wR8h
 1cwsgTsanqUxhfRmw7RvlE79LlS0gZG5CaCmt1yjONk29nDeIxIXtSEwEipz/s8t6h2k
 Wglko4UJ8K0A+6tH6CG65d2dJSyfC8NqO+lWFkwtEX6eZGpUeHlUujknCDVHMCPhV4I7
 COZMGHrfS/dzNAmh0nr2inkidgR9CbMXw/Q7yk3pra4tb6+hY60EzcijJdQ1C/o9ox98
 5r1ozrC7O8QSgeyu0FMMh37Knx/PEsBOC/SjrXM9D1JxMZkyCyvpaUMG2QYRXqTWdGn+
 wIpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL/HPq+19+/S8xdDKvdnexpIoI3+tZPlIVvYAALD59HSyClfobjDvz25EUlt59qas8ifKayCoq37F8G6NwCH7Tm7jg
X-Gm-Message-State: AOJu0YxjMVnGptVdNiNdskApNnqqBMh3Z2hmwYE+9oebIwFTyXnIhpaZ
 QlUgYp6emgcbZGdtg6UFaV1a9yQE8qiuUJJxCZYg+1kCnX2ChutZIVbhP+w/k+RtK8y7oOdw2vI
 U
X-Received: by 2002:a05:6000:884:b0:33d:4966:fa8f with SMTP id
 cs4-20020a056000088400b0033d4966fa8fmr1957943wrb.46.1711123099991; 
 Fri, 22 Mar 2024 08:58:19 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.178.251])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a5d43c9000000b0033ec9007bacsm2331559wrr.20.2024.03.22.08.58.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 22 Mar 2024 08:58:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>, Luc Michel <luc.michel@amd.com>,
 Damien Hedde <damien.hedde@dahe.fr>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 1/2] hw/clock: Let clock_set_mul_div() return boolean
 value
Date: Fri, 22 Mar 2024 16:58:09 +0100
Message-ID: <20240322155810.5733-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240322155810.5733-1-philmd@linaro.org>
References: <20240322155810.5733-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: JOrYVhmILOFE

Let clock_set_mul_div() return a boolean value whether the
clock has been updated or not, similarly to clock_set().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/clock.h | 4 +++-
 hw/core/clock.c    | 8 +++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/hw/clock.h b/include/hw/clock.h
index bb12117f67..eb58599131 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -357,6 +357,8 @@ char *clock_display_freq(Clock *clk);
  * @multiplier: multiplier value
  * @divider: divider value
  *
+ * @return: true if the clock is changed.
+ *
  * By default, a Clock's children will all run with the same period
  * as their parent. This function allows you to adjust the multiplier
  * and divider used to derive the child clock frequency.
@@ -374,6 +376,6 @@ char *clock_display_freq(Clock *clk);
  * Note that this function does not call clock_propagate(); the
  * caller should do that if necessary.
  */
-void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider);
+bool clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider);
 
 #endif /* QEMU_HW_CLOCK_H */
diff --git a/hw/core/clock.c b/hw/core/clock.c
index d82e44cd1a..a19c7db7df 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -143,14 +143,20 @@ char *clock_display_freq(Clock *clk)
     return freq_to_str(clock_get_hz(clk));
 }
 
-void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
+bool clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
 {
     assert(divider != 0);
 
+    if (clk->multiplier == multiplier && clk->divider == divider) {
+        return false;
+    }
+
     trace_clock_set_mul_div(CLOCK_PATH(clk), clk->multiplier, multiplier,
                             clk->divider, divider);
     clk->multiplier = multiplier;
     clk->divider = divider;
+
+    return true;
 }
 
 static void clock_initfn(Object *obj)
-- 
2.41.0

