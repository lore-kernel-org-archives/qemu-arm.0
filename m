Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp247051ejc;
        Thu, 31 Aug 2023 15:58:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEwJzRJ3WRYrcilyerzkz5l3K0o+MX3fObVzDMBcUQ/qkmFE/b23846RbC0Wx6Q4YydWtW
X-Received: by 2002:a0c:b345:0:b0:63d:d83:8808 with SMTP id a5-20020a0cb345000000b0063d0d838808mr441851qvf.63.1693522693734;
        Thu, 31 Aug 2023 15:58:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693522693; cv=none;
        d=google.com; s=arc-20160816;
        b=KiRBqc4Zn/zZBrh7PgQri2t6EZ6A0raIibcq6fra092bEGMAE2O+hx6Xb8RvQIY9Nj
         hZGFHdeDRVl94gErj9wVmBp5gSrv7Fy8fMc2F2F03h3BTeAkoAIbc3xk9kTyeQJRutW+
         074XyMUs6OT4AvGFFId39yuWVVKJhDaxn/1GMi8C6yiph7EaL1Yo76ISESEXIUD0J9OR
         cgzUzgUxMFkND1ff9RQ1W/boqpEUcHTF1lISYRxha4q7US76FnMUmF6HuRjheJ58befj
         u71p9f926cmDWgV/2NE2gYcZT91DQnUNlJq3uO/dnZRnNfqZ6p3oxKef1new9KXuxCkh
         CMEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=07RpMt5MApgRw9NJGh9PZXX3Pgabrwsg/tvmA1poNBo=;
        fh=idq1fxLttOtnmCkDPrxdp99bvZG1Jl1KEDnEWAr8dSM=;
        b=gqszsywtPMhxqu+qAM5cBK3JePWXty3fU7QEV21EMbkmmQhDLHfstXCG89h7Yr/jKb
         9mfaF8hJjDX+O5ihmmKLQXJvRJLhs7WE2hPbyj0mJFVl04ohA/d8MmA+RRrjxSwogkX2
         TFzgfzQGb3cadhjFUPaTepPmC6CjBHaPc1jYuj7PChDTegShEnZ1rOY2hgNZI+EHMrut
         er5jG63kTsJQyI61EB1B297sWYDWrmnoElTLCfZrrfxh0SLS2rRyxLku+WwiXx6QHwSC
         OIXOi30q65pzLBWMMWAN3hxW1bAkDoKhYWvMIUX6bYqG1FuQyGEp3cCLgEKzOer3akY0
         /XsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lGQGAhhQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13-20020a0ce0cd000000b0064f8756e881si1511378qvk.341.2023.08.31.15.58.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 15:58:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lGQGAhhQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbqb1-0004QF-N2; Thu, 31 Aug 2023 18:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqb0-0004Ko-Eq
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 18:57:02 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqay-00034J-4R
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 18:57:02 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so151898166b.2
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 15:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693522618; x=1694127418; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=07RpMt5MApgRw9NJGh9PZXX3Pgabrwsg/tvmA1poNBo=;
 b=lGQGAhhQSn0lSGUBdZ80+FaS4uKk7iUk9/Q0TpljhNFpiwPV5C2M3ZdHmUBCY3WPge
 hgJGh8e9ONA8cwHkvsaaGXr0DERTa0nAs3Je0RrUVGOYnHuMgFbXGYUyKl/PzflQyhl+
 7o3KIxt41flbhJ4GKK+i1GxTEaxbJ9nyGa4sHcMsKKNA5MSv59T4WDbcwaB6DBgGMksS
 Pfi+kN1Ch06BJruXOyiVOqjYlZW6b/55x1vsIDIgBwUzKnZqm9vry9DoglxrIS5Rn5fp
 jEGBaiOAGcjteoQ5ZPX6tqWt+4rWrFpli/5KOVQt2epqY8BvilzhrhLhWxLEgbuvjfKa
 PmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693522618; x=1694127418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=07RpMt5MApgRw9NJGh9PZXX3Pgabrwsg/tvmA1poNBo=;
 b=CHdUtyenQO/f34+BmVAOr/RAR69FuDa5057KUtVFE11zAJn94xW1ZXyoHA7lqBVr0D
 vG7wcH+5g/8XN6IculROLsGtFAH4FYDi23ejXcUbCKyR/xlUvCP/W2WBJs3FTaNEwcGJ
 DkRBY7eibNnv1VT9rZpg30fJOCbmpOjQ/lCYPnvYyvQhyoKaUphu+It9PDxmOr3XSFmw
 gR7YMW0icvPMD7WD9vc+vvT9Hq22Lwjh+SCehcPcFmCJeYSV3yrhWsf9aTr2wbG6T4xp
 83Riq3Sj6kdfW4uuvnCfEzIyItUM4ZZ/M01IVgAh/JRf7q2H8IDILWKgFmidlW9CUmHn
 JD0Q==
X-Gm-Message-State: AOJu0YwYlPPlBTfXk7KsEhCFdkApu2JU6smQiI608fqEoZzfkaokv348
 YhPHrOL9j/clLd/avUjvti1m0GsFrfzzWm+0IeE=
X-Received: by 2002:a17:906:224a:b0:9a1:f415:7c24 with SMTP id
 10-20020a170906224a00b009a1f4157c24mr530634ejr.46.1693522618052; 
 Thu, 31 Aug 2023 15:56:58 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a1709066c8600b00989828a42e8sm1246798ejr.154.2023.08.31.15.56.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 15:56:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 08/11] hw/m68k: Clean up local variable shadowing
Date: Fri,  1 Sep 2023 00:56:03 +0200
Message-ID: <20230831225607.30829-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831225607.30829-1-philmd@linaro.org>
References: <20230831225607.30829-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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
X-TUID: 0okhGUc4RTgF

Fix:

  hw/m68k/virt.c:263:13: error: declaration shadows a local variable [-Werror,-Wshadow]
            BOOTINFOSTR(param_ptr, BI_COMMAND_LINE,
            ^
  hw/m68k/bootinfo.h:47:13: note: expanded from macro 'BOOTINFOSTR'
        int i; \
            ^
  hw/m68k/virt.c:130:9: note: previous declaration is here
    int i;
        ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/m68k/bootinfo.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/m68k/bootinfo.h b/hw/m68k/bootinfo.h
index a3d37e3c80..0e6e3eea87 100644
--- a/hw/m68k/bootinfo.h
+++ b/hw/m68k/bootinfo.h
@@ -44,15 +44,14 @@
 
 #define BOOTINFOSTR(base, id, string) \
     do { \
-        int i; \
         stw_p(base, id); \
         base += 2; \
         stw_p(base, \
                  (sizeof(struct bi_record) + strlen(string) + \
                   1 /* null termination */ + 3 /* padding */) & ~3); \
         base += 2; \
-        for (i = 0; string[i]; i++) { \
-            stb_p(base++, string[i]); \
+        for (unsigned i_ = 0; string[i_]; i_++) { \
+            stb_p(base++, string[i_]); \
         } \
         stb_p(base++, 0); \
         base = QEMU_ALIGN_PTR_UP(base, 4); \
@@ -60,7 +59,6 @@
 
 #define BOOTINFODATA(base, id, data, len) \
     do { \
-        int i; \
         stw_p(base, id); \
         base += 2; \
         stw_p(base, \
@@ -69,8 +67,8 @@
         base += 2; \
         stw_p(base, len); \
         base += 2; \
-        for (i = 0; i < len; ++i) { \
-            stb_p(base++, data[i]); \
+        for (unsigned i_ = 0; i_ < len; ++i_) { \
+            stb_p(base++, data[i_]); \
         } \
         base = QEMU_ALIGN_PTR_UP(base, 4); \
     } while (0)
-- 
2.41.0

