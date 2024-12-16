Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2205044njb;
        Mon, 16 Dec 2024 06:19:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXFmhUf0XZJZsI727KI6+SiLQgAeRivxgnNGrq4nIF2howQTNdnAzw5B9wVHdgQCgRxyvAfTz+Z1s/+5Q==@linaro.org
X-Received: by 2002:a05:6a00:c82:b0:728:eb62:a132 with SMTP id d2e1a72fcca58-7290c1b1c49mr16265702b3a.15.1734358749660;
        Mon, 16 Dec 2024 06:19:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734358749; cv=none;
        d=google.com; s=arc-20240605;
        b=TmnXwsHbhDaXYVvdmBpuaqUP3F5WuVBWC8qeIX7jFZqpMi3d1wePLGmxOTLwel5NYv
         kbKSQs3Q3ydIGPF+xbiOrVgzi6sJ3OWGN6QOn++m3LXoGP1PvoPMAZC5FtVofR9fJfXn
         vsmFV+spbBFDJ7TJCXGELwWZvJVpXODr6lMfgVvESzUP9qzcAfr3LfUQIf0bTy3lHZFK
         jsTK7kQInKUBSphM4Ga4TXrMItFS0s6fe3QVJ3X81U9neGdel7jSEXBqQ0Ri9PXBHgtq
         U2MmC7PvqGwxb65e65l73NQ12PyzgKpN2nPVkg5edFtjFI9u9GfbehGsasqML03foGIi
         xuMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oTXeIKSE6vctrvuU18gwO4YmTcatQ3MxyH1mPVyZvCY=;
        fh=UElmTCpbi3yhJcqaxWwUFbsxJEcqYHLxMwZalN5oMNA=;
        b=WzY1Un/BRSgkiluVHZ3e6se4CxjNZa+m0MskzqZVmipyzQH2pUGHkDFt8reaxHqmKi
         Uq5YV1Y8BAEJhzcRVPYQ96g84CU/rCnZJo37YyXE+67qkxPi1Dnt8iqyouN4sYq0YPsT
         2I7QEvjVFGoznXG81J9CNDTG9oBC4OFsgoTxFHQAtGopYFL6SO+DQ0muVXXlXpT9KNoy
         6xX1EyJ3GL9/x2I6MGi0kXseGgIJzAhynexBQ08MMP4pDljn7VzJcxvVLSvQQH1qHJVY
         vqfjSgJU4iItVpiMTLA7rI+fPrF1Uw7nlDvCba57Xg2Ao0pC7VKpMFD7S6sK173FyCJt
         3FAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s9iwnNR1;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7291875b693sor2376798b3a.0.2024.12.16.06.19.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Dec 2024 06:19:09 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s9iwnNR1;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734358749; x=1734963549; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTXeIKSE6vctrvuU18gwO4YmTcatQ3MxyH1mPVyZvCY=;
        b=s9iwnNR14cgqB2u1Xac9XOBJKvvJgqdiVEbj52+plV8imDJC6k/l3AIVYuLU2tsXro
         5dRvPZUuIOkArzwZ2PAk3szQyZo6EzOzrBg9bCI8Zt9Qi2S2tW8OgT6zho00GEyD6g/K
         kOoVF8/GN7ugp2pMZkHG98p8+lykh/M5Jhqy4WuEFLE+4AvauNhqcmED/fOZlfhpc0s/
         O/BTGWYQvS2Xwkz2aIO5v/e6pdceIbixxHFb/skdco2Ar81IjZOUrkU1mSc2kjTKCITe
         BLIHAbm3QkBCAZRWsHQUB/RwC/9CRGBMTSzQmAaotFVCL+uDL/k0H2QAAHjeymDkgs4c
         uSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358749; x=1734963549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTXeIKSE6vctrvuU18gwO4YmTcatQ3MxyH1mPVyZvCY=;
        b=V2/Fsvkv0mfO2rIV79Oxa/CAgdjDcOaPidcGZwNUQXrHYE5UT9NNS1IqAYvKcHmMeQ
         0Wtam1IssnDc9kxuNhwMIjT2M0UE3tXO/k+JMPWi3L1my0cRSo/0nofqsEvrIX5WhO8L
         b3+IVVUzyhsQ8upGt1YovsX4eMwajvD1b0E76kkKPTLEB0Vq4PS/NxrYq01d0PlVwSAP
         Nv1xow8VvTfBAzfkYJ/q6jCqiNH0+lvitSRK4kgPGM1x5Y8M0AHinz1E7NJU2WCr+k6S
         PRRv8/uQvFWGsVqKo7uUtfJYaujq7Lo3XXMtQf4Zlm+7CRaP+0rtbRyeriYDM+/kjThl
         gs1w==
X-Forwarded-Encrypted: i=1; AJvYcCUTIOkc0Bv2W0hAIW7e/jqnGyZU2bq1mEqyk3wsV9CTetBp5Kn6fdKtbF8tdn/w30fHuVXi/q3+MsIj5A==@linaro.org
X-Gm-Message-State: AOJu0Yx8P8mVJdM8Hy7DarR4I2aabOKk3kp1G1G/YFhxFOgCVCi6zDBd
	YxyYj7/uXmUC/dPlFhF/lRSt60Gw4rIuAL0wrrdY1OxR+gi9OwnJ4qI2ti6nOD+wqw==
X-Gm-Gg: ASbGncvr8/vZYp0AwumQgwCm8rp0OCXlPQ2/lsI5dkWWv3tYP0hSCPHze9BI3D/hIwo
	RwXsTNg6BjPvg+v1f6NeRyRqqsiIkOb0arPtBuLJb9wGGHf14Lf7pmmrPsBt59NuGk5xR30NpdC
	IZ7BFUZwCjQZq2LgKofD0LqWVv63CbGmijlU6ZuS2VVCpd5ICoA11XLIzSlbzwRkZLI+6VyrcCh
	nbBo1y9yL/iTNGLsQR2IYpvj5NdB8h2zNi9P2dIM4UN8n7DTZxKeM7YDFg09bg=
X-Google-Smtp-Source: AGHT+IFQ0OCKWhpsklZ+GIj/kxhOlJJx0UulXpkNuuBcmhP8O7lp0Y8LO9PCT4XCTDZ3I05BvDOQGA==
X-Received: by 2002:a05:6a20:6a11:b0:1e1:aef4:9ce8 with SMTP id adf61e73a8af0-1e1dfe6a00bmr20051541637.28.1734358749223;
        Mon, 16 Dec 2024 06:19:09 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([177.189.100.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bad8acsm4948815b3a.146.2024.12.16.06.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:19:08 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	philmd@linaro.org,
	alex.bennee@linaro.org,
	thuth@redhat.com,
	armbru@redhat.com
Cc: gustavo.romero@linaro.org
Subject: [PATCH v3 6/7] tests/qtest: Add API functions to capture IRQ toggling
Date: Mon, 16 Dec 2024 14:18:17 +0000
Message-Id: <20241216141818.111255-7-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216141818.111255-1-gustavo.romero@linaro.org>
References: <20241216141818.111255-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OWTPA7+qEnpk

Currently, the QTest API does not provide a function to capture when an
IRQ line is raised or lowered, although the QTest Protocol already
reports such IRQ transitions. As a consequence, it is also not possible
to capture when an IRQ line is toggled. Functions like qtest_get_irq()
only read the current state of the intercepted IRQ lines, which is
already high (or low) when the function is called if the IRQ line is
toggled. Therefore, these functions miss the IRQ line state transitions.

This commit introduces two new API functions:
qtest_get_irq_raised_counter() and qtest_get_irq_lowered_counter().
These functions allow capturing the number of times an observed IRQ line
transitioned from low to high state or from high to low state,
respectively.

When used together, these new API functions then allow checking if one
or more pulses were generated (indicating if the IRQ line was toggled).

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest.c | 24 ++++++++++++++++++++++++
 tests/qtest/libqtest.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 8de5f1fde3..dfe3139a88 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -83,6 +83,8 @@ struct QTestState
     int expected_status;
     bool big_endian;
     bool irq_level[MAX_IRQ];
+    uint64_t irq_raised_counter[MAX_IRQ];
+    uint64_t irq_lowered_counter[MAX_IRQ];
     GString *rx;
     QTestTransportOps ops;
     GList *pending_events;
@@ -515,6 +517,8 @@ static QTestState *qtest_init_internal(const char *qemu_bin,
     s->rx = g_string_new("");
     for (i = 0; i < MAX_IRQ; i++) {
         s->irq_level[i] = false;
+        s->irq_raised_counter[i] = 0;
+        s->irq_lowered_counter[i] = 0;
     }
 
     /*
@@ -706,8 +710,10 @@ redo:
         g_assert_cmpint(irq, <, MAX_IRQ);
 
         if (strcmp(words[1], "raise") == 0) {
+            s->irq_raised_counter[irq]++;
             s->irq_level[irq] = true;
         } else {
+            s->irq_lowered_counter[irq]++;
             s->irq_level[irq] = false;
         }
 
@@ -999,6 +1005,22 @@ bool qtest_get_irq(QTestState *s, int num)
     return s->irq_level[num];
 }
 
+uint64_t qtest_get_irq_raised_counter(QTestState *s, int num)
+{
+    /* dummy operation in order to make sure irq is up to date */
+    qtest_inb(s, 0);
+
+    return s->irq_raised_counter[num];
+}
+
+uint64_t qtest_get_irq_lowered_counter(QTestState *s, int num)
+{
+    /* dummy operation in order to make sure irq is up to date */
+    qtest_inb(s, 0);
+
+    return s->irq_lowered_counter[num];
+}
+
 void qtest_module_load(QTestState *s, const char *prefix, const char *libname)
 {
     qtest_sendf(s, "module_load %s %s\n", prefix, libname);
@@ -1902,6 +1924,8 @@ QTestState *qtest_inproc_init(QTestState **s, bool log, const char* arch,
     qts->wstatus = 0;
     for (int i = 0; i < MAX_IRQ; i++) {
         qts->irq_level[i] = false;
+        qts->irq_raised_counter[i] = 0;
+        qts->irq_lowered_counter[i] = 0;
     }
 
     qtest_client_set_rx_handler(qts, qtest_client_inproc_recv_line);
diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index f23d80e9e5..b73c04139e 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -389,6 +389,34 @@ void qtest_module_load(QTestState *s, const char *prefix, const char *libname);
  */
 bool qtest_get_irq(QTestState *s, int num);
 
+/**
+ * qtest_get_irq_raised_counter:
+ * @s: #QTestState instance to operate on.
+ * @num: Interrupt to observe.
+ *
+ * This function can be used in conjunction with the
+ * qtest_get_irq_lowered_counter() to check if one or more pulses where
+ * generated on the observed interrupt.
+ *
+ * Returns: The number of times IRQ @num was raised, i.e., transitioned from
+ * a low state (false) to a high state (true).
+ */
+uint64_t qtest_get_irq_raised_counter(QTestState *s, int num);
+
+/**
+ * qtest_get_irq_lowered_counter:
+ * @s: #QTestState instance to operate on.
+ * @num: Interrupt to observe.
+ *
+ * This function can be used in conjunction with the
+ * qtest_get_irq_raised_counter() to check if one or more pulses where
+ * generated on the observed interrupt.
+ *
+ * Returns: The number of times IRQ @num was lowered, i.e., transitioned from
+ * a high state (true) to a low state (false).
+ */
+uint64_t qtest_get_irq_lowered_counter(QTestState *s, int num);
+
 /**
  * qtest_irq_intercept_in:
  * @s: #QTestState instance to operate on.
-- 
2.34.1
