Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1258702ejs;
        Wed, 10 Jan 2024 11:54:02 -0800 (PST)
X-Received: by 2002:a05:600c:1907:b0:40e:4275:5aad with SMTP id j7-20020a05600c190700b0040e42755aadmr1038078wmq.166.1704916441994;
        Wed, 10 Jan 2024 11:54:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704916441; cv=none;
        d=google.com; s=arc-20160816;
        b=EV600sX6AhY6j6CHkwjqYdwtkLR4ngorq4W0A5QCgs5wtapXozA0ELt4Fecaa74yM3
         UISAEtPuB/0FWyH8iJxmlM2bSN4zG84whq2Gr5X932n8TLfXOExH9gD7v0B8eS+AWWPP
         Sm2x1AeoeI+3y17398iMQSdGQ3ME21An3YrrV/THaVAa5lajDCw30IotvKxSyRNclaAL
         mGxlOtV8u63iCF50q8ouHQ4n9fsfnC1KArbgriDpddolKjZMg/XIKOB9ym+BbV48VQej
         Tim3BkI/ZuWz91sUL0mJ7vF/sX8I1XQrNxbNR0qb17oUtxFKmEp5FyzUkABey1sS2OCw
         jxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fOLjDR/IKNF0Xh0mudwkf1U6/g8RGHkdFKaUB2oy+80=;
        fh=0Bn9ysFO5uhdOoEvdDNDnkwY7yFMuDt2XLw3k0zcWt8=;
        b=c8VVjeZNSC+c4FlnxVTvztPCGsigtnCnAFRKKNaPnKhRGbmcsUZ4bgwHjVdX60NVk1
         rzJWucq+g8D+bF4sMb69bwFcAY5TCyrmZCHE1+vv9Lmz6/zCsowVVtm5Hu6lSk/G8nsB
         XjpENxxIlBshOFKVQG8Bt3Z7GOvIUq/+GYxQS2fmYLgD4uOrWswaLHIWWoUJiXmap7nz
         Jf1w3IMWKROg4zzCzjjH1r5Ei6Dr/14nE+QW1ZJPJW1nkEdmGB9RaQLuF18ZEz89sTs0
         tHzatB79eSJ+CNUKQtHW/1dXlzTcwbk+jkk+aCLWkLjw33bAhzO/d3/9uvq9BZL+FjMf
         4LNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vgju70Fq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u2-20020a7bcb02000000b0040e44be3645sor2297327wmj.4.2024.01.10.11.54.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 11:54:01 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vgju70Fq;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704916441; x=1705521241; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOLjDR/IKNF0Xh0mudwkf1U6/g8RGHkdFKaUB2oy+80=;
        b=vgju70FqTraDCLYnbdXYesxXTazOHnUjA+fyZVOewQh/MCQ+pp8GyoH9TS9gr8aCv9
         sJNZ9khoq7frZ2QytaI9cpC7KpbDz4BtOvJcboljKk+KNxJJaTadPeI1DSuZNNtzxNmJ
         9rDe0eLF/VDTs4r5Vc4DDrA4s58/0sJ0ZYQ/jIOTgtsprnqrHqUlp5DDlF9Z8vPufZOK
         3hwfAjmjDO1z3VroULgN4LRO4h0wDhINAPuRvM4OSKS9f8UxIr1QJM2Gl8Uu+/9RZ8ZQ
         UuFFOQNKH3HWITiYtURWUSF400uzzDwvSxV460+Wktu0q+cnERV4TTcfEdNnQdtsVqqU
         hsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704916441; x=1705521241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOLjDR/IKNF0Xh0mudwkf1U6/g8RGHkdFKaUB2oy+80=;
        b=fZK44AXnutQKIFj2KX2o/4/wKfwYEjiVMHt/49ugwhq3DY/sby4IDM9Cv/7rkgr9SL
         gGsqI/mZfAvYXjDrUVyZn82WPDfdC9o47WkK9BQeicVwdAHEYeUgIZOIz+Glaw73tP0w
         YXlDoq3APjZj8i1emT/JGvABFGN5IyU991wH+lzhN8KoJ31AdPstE8eTjfYgn5Acle6l
         w5b0m3gTQM2dihaH7WdFJ5GIqjqQSFqcSFWfwohaacJQMyEi+M+sBdHgcGC3Upmg3qiK
         +6U37NPT8ChblpXAyq4JjzV6APoEnqf5/b9L/9Ig/n81CecaLbY50O7OhtQbd5OO9OPq
         JiHg==
X-Gm-Message-State: AOJu0Yy7Lm1+awah1RpFvwcFJ4pvhvM4YNWYiLzLgE1IINBd03MzWg5y
	Q7uV4x+EWi7f6saPAkt3ND7R9+6873sDLRgx
X-Google-Smtp-Source: AGHT+IFVcjqlQhh9IFV2hlFnA4ke87gdFQSLw0a78PKhvCLIBAzbhPLNgdGMZHqNjSOYGEZo/ChByQ==
X-Received: by 2002:a05:600c:a019:b0:40e:3fa2:213 with SMTP id jg25-20020a05600ca01900b0040e3fa20213mr939693wmb.147.1704916441650;
        Wed, 10 Jan 2024 11:54:01 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c4f9000b0040e53f24ceasm3216630wmq.16.2024.01.10.11.53.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Jan 2024 11:54:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 04/14] hw/arm/armv7m: Always set 'init-nsvtor' property for Cortex-M CPUs
Date: Wed, 10 Jan 2024 20:53:18 +0100
Message-ID: <20240110195329.3995-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240110195329.3995-1-philmd@linaro.org>
References: <20240110195329.3995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GypWWiVA1N7U

All CPUs implementing ARM_FEATURE_M have the 'init-nsvtor' property.
Since setting the property can not fail, replace

   object_property_set_uint(..., "init-nsvtor", ..., &error_abort);

by:
   qdev_prop_set_uint32(..., "init-nsvtor", ...).

which is a one-to-one replacement.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index b752049add..530729f42e 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -309,6 +309,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     object_property_set_link(OBJECT(s->cpu), "memory", OBJECT(&s->container),
                              &error_abort);
     qdev_prop_set_bit(cpudev, "start-powered-off", s->start_powered_off);
+    qdev_prop_set_uint32(cpudev, "init-nsvtor", s->init_nsvtor);
+
     if (object_property_find(OBJECT(s->cpu), "idau")) {
         object_property_set_link(OBJECT(s->cpu), "idau", s->idau,
                                  &error_abort);
@@ -319,12 +321,6 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
-    if (object_property_find(OBJECT(s->cpu), "init-nsvtor")) {
-        if (!object_property_set_uint(OBJECT(s->cpu), "init-nsvtor",
-                                      s->init_nsvtor, errp)) {
-            return;
-        }
-    }
     if (object_property_find(OBJECT(s->cpu), "vfp")) {
         if (!object_property_set_bool(OBJECT(s->cpu), "vfp", s->vfp, errp)) {
             return;
-- 
2.41.0
