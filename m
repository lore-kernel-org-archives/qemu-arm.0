Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1432652ejj;
        Tue, 26 Mar 2024 08:46:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9AkcofxLDZ+2s2mNiZgY1QrUhdM5Vu/FtLmVR/SXaOu/5/nsPPW9TqY31R7RsERiUExllCC6MlkN3absUMG1+WVYxKlfg
X-Google-Smtp-Source: AGHT+IGuGnJ+320fPHpp7YlYdxyy1j6+5dLwPtn1xqf2LwFT/9eMLTkf2eEGEGlnACtKt+qaDWlf
X-Received: by 2002:a05:620a:5a02:b0:78a:4276:3a0f with SMTP id wv2-20020a05620a5a0200b0078a42763a0fmr1576406qkn.57.1711467969202;
        Tue, 26 Mar 2024 08:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711467969; cv=none;
        d=google.com; s=arc-20160816;
        b=pA0TAx8JLZ8Ih2cjnE/DUSjjWxVOlME3Q7qZa3GjUK5VdjCfwQaRr+spbTTBjHBuzX
         V3S3/BuZ+R+fYed8QBJ3zbPkqOCQrIlU+N+fVm2ktes7xD7B44xh50ErZ0wENuwxUj1M
         8d1GwcSqhFW9VhALxt/RSybn5DWJeTOgog5h1cCx3WCDDprJmtGQ8emxxM1RBK2v34vl
         lZwluu31KWjTGjnbxaTOvj8T2iARKjNCKdVsnijbif4Nnu3HE7289TW8h3hkrAC8MmtU
         Ie58mwKfeXYapNQ/PKRIslVY+9AGJOSRmz3dT85ThqbRJFZEJq2m0frqa4PK2lVIr2/r
         R6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cEpSqRrZid1z1e37NHudEuzz5YNqDapUwXxK6rE0oII=;
        fh=OYWJvq3POC1xXXbfoy/DvX2LA6tMGzC3T+rFxYxe9+c=;
        b=lGBnH9Xip7Yw4MgApj9Cc3tHcwdbTYJa7NaCUfCs8BVI8DxCgar9A+YbLW/CPPcSn8
         b1fGEThYIUGLBC404QxkeP50tcHm465bOSi5PvHrt1Fos4UbVtLsXls+59aM6usk0axV
         v6Y0R3OW3XpAomkETKrSAAiCd+YNDZ2ZiygHPLual9cWpCrcEpOM4xYqv+oHbZPTJD70
         JUwcfvb6wlce88sjsA+30eo7rKHRD4mv9tcjL0aSUh1QtXr16jMVaE36pIg7B2MnyukF
         T+SkPL8JCUe+7JvhBrBaalo75E5XbTQ9hk5ow2Rv/Kr1GI+G2rTIUFac8zS8U6uSNH7C
         owBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SHsd5c8T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id op33-20020a05620a536100b00789e7ecd60esi7562948qkn.719.2024.03.26.08.46.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 08:46:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SHsd5c8T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rp8zg-0003mH-MJ; Tue, 26 Mar 2024 11:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp8zc-0003hz-CC
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 11:45:40 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp8za-0001BK-NR
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 11:45:40 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4148d7b89d9so9625175e9.3
 for <qemu-arm@nongnu.org>; Tue, 26 Mar 2024 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711467937; x=1712072737; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cEpSqRrZid1z1e37NHudEuzz5YNqDapUwXxK6rE0oII=;
 b=SHsd5c8TYX8qJFueCgo0EsI22nDG1ks16kPkbO9T1/B9g1N2Mj8ArG/aW0NnY4wZJa
 udLXqCVPf6a3NpD5a3fu6qMRAwIRnTYXc/GxcQEBDZ4W2IdLiO5HomnW5tlFp51Gsqti
 nuYGliiTC4hg22cU14OdEtbVI/LK8yQiUoWN4tceHRpODRGVblabWhDRldm1si+XoIZA
 67hUU8/Ic3NV96epOcfXrxq8vnYPuI+uF3t6TQNZOp27kfg21K0RybyMEUPj6CQ/SXkE
 ywf2RMbXcUPlXHSgZhMCSETynvmuvxU4KDjo8BtwUUOJTf7XgGEa8kOVoelYPmU/yhLb
 tkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711467937; x=1712072737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cEpSqRrZid1z1e37NHudEuzz5YNqDapUwXxK6rE0oII=;
 b=Kn8XxgQinMAcsBzsZ51LhZUG5nuo/t3oNSe0hgdC/O2sbxst2IGUr49cC6hT2J3JWV
 R3ZOIfpskYEbAeN6jrk8mMmhn/Ng5NHrhkd/43j8x6Vg4YYbnA3cO4ETk+ekjbN4XyoH
 eeAdU5NS+jzo4SydzbhjhnJkEJr19nO+P66euxLa3UwiixgxEHt3goHYpntPrDH432nE
 Y5aJASerRK4lljpZjpFjrILy/ExKDaycA2zK5jfeoODNG9d+dgQ3rq9oIgH5guw3k099
 gWaGrhZECIzAgsgMBLHRu5HnECpIYYtmnRHsUqpUWkTDCPGwAt9iYJUIaX8Zye70+MxJ
 fR1g==
X-Gm-Message-State: AOJu0Yxs69jhUfdLTH33X/9PNJ+r++g+z856p9fCTinGVSWSX1UeoUfL
 JZ7WNmsy0eptHnty8qzsyHOHEplt+ja3hOkW9hcsFQjaD0shrGKQxVQrL4OVwrxVdWRqyZ40LtD
 G
X-Received: by 2002:a05:600c:3113:b0:413:ee55:8bba with SMTP id
 g19-20020a05600c311300b00413ee558bbamr9797996wmo.4.1711467937217; 
 Tue, 26 Mar 2024 08:45:37 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.229])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b004147ec48845sm11842490wmo.26.2024.03.26.08.45.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Mar 2024 08:45:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Luc Michel <luc@lmichel.fr>, Alistair Francis <alistair.francis@wdc.com>,
 Damien Hedde <damien.hedde@dahe.fr>
Subject: [PULL 05/13] hw/clock: Let clock_set_mul_div() return a boolean value
Date: Tue, 26 Mar 2024 16:44:56 +0100
Message-ID: <20240326154505.8300-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240326154505.8300-1-philmd@linaro.org>
References: <20240326154505.8300-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: ctXzdDtajQH9

Let clock_set_mul_div() return a boolean value whether the
clock has been updated or not, similarly to clock_set().

Return early when clock_set_mul_div() is called with
same mul/div values the clock has.

Acked-by: Luc Michel <luc@lmichel.fr>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20240325152827.73817-2-philmd@linaro.org>
---
 docs/devel/clocks.rst | 4 ++++
 include/hw/clock.h    | 4 +++-
 hw/core/clock.c       | 8 +++++++-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index c4d14bde04..b2d1148cdb 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -279,6 +279,10 @@ You can change the multiplier and divider of a clock at runtime,
 so you can use this to model clock controller devices which
 have guest-programmable frequency multipliers or dividers.
 
+Similary to ``clock_set()``, ``clock_set_mul_div()`` returns ``true`` if
+the clock state was modified; that is, if the multiplier or the diviser
+or both were changed by the call.
+
 Note that ``clock_set_mul_div()`` does not automatically call
 ``clock_propagate()``. If you make a runtime change to the
 multiplier or divider you must call clock_propagate() yourself.
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

