Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp855646ejc;
        Thu, 11 Apr 2024 03:21:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIgomG0ZQ+BlkmMKjAkngf3tXJNrwJWkCLx7yxQYjuw/K9jKyi1OWFxskRUzK8SjiVAXOZPk7n0vFst1TFeLLojk0f4LTK
X-Google-Smtp-Source: AGHT+IGmfsal6OZPNcM6kMH+tMqlBgPuh6S4HFSa42tFHyg5rm5eyjgcEMEJ843MC+eXk4ReU32k
X-Received: by 2002:a05:6102:3e16:b0:47a:36b9:16d8 with SMTP id j22-20020a0561023e1600b0047a36b916d8mr1434445vsv.25.1712830872154;
        Thu, 11 Apr 2024 03:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712830872; cv=none;
        d=google.com; s=arc-20160816;
        b=rvePQgSi0ZMGwiTqSPkarPbHmL2CG+rcEDqh03hYVQ9Nb19yXg92NG449bbiN8H16S
         EzrmP1QJKOIEbzii7WfhjAiTSvd6Xm7jRFNFv+Oe5POjUUHRm/y5CL4cEh5ZWi0tHvyI
         oAo5yWvckre0lXWFPcZy+bt0DYVSjf3SXrhIBB3WUmMdXv36N4rreNJf4NpUpAa+K4vB
         lmQph1BMWyazm8H1byKfvrLBzu26LjcJlI1DonOkpYBIr5TW5uWFwgt9mS6PgEnOoHMX
         WgRW7Fbjj6r9/7YBUZkgEFzFYpNxPVyhm0vX9izHSfQOTpYIC4GwqirXgZQJVcz3tCsJ
         ucqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PowLaTwCiK0zblbMYsUQoyhFkR48l8ASgwvzYVcEv18=;
        fh=sUmKl6kuK1QEm1H6mIwPRtJgzX8TTCQJruBb8zwn0+E=;
        b=boJcM5DgYmReVTyHDtSe3K7AYrwRZnYequ8DlHuapeMytwUpwp9zUsmH0ZknXIgVCd
         uoaDHWyB0GcC2tR7VshZ1RJ7lRFaBc8B78wO6tbnKHpBj5RkPXCNi2WC4x88w8iz/O9Y
         wMPuzRLCaGM/LVWQQ7ebdJaFn5kE1BiauIdeKxJKuuaZv9hFRIsmn0M0WMD2QyyPxQ85
         vFMDCtZ3LiECvXJlr6+QQh+OHbjWyboZ907/dwkE0ibRCyTIuUBes1pskd7159ZcOTTj
         PIoXxasFMFMoMGP+YS8xSVOZlgE//gueXW4ac4pukPhgQ3Uj0NYxTxzf7Y5EHMqSgQt/
         vlUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VQa6Q7Rz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020ad448d3000000b0069b0f06aab8si1123423qvx.536.2024.04.11.03.21.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:21:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VQa6Q7Rz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rurUv-0006Ay-Lj; Thu, 11 Apr 2024 06:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurUC-0005JX-Rj
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:16:54 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurU9-0007aK-Ls
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:16:52 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d886dd4f18so50715551fa.1
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 03:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712830608; x=1713435408; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PowLaTwCiK0zblbMYsUQoyhFkR48l8ASgwvzYVcEv18=;
 b=VQa6Q7RzqhcSjCOYkiD1cPtRDt4kLEAS6oqku4CVnZ3aiZwy6jHfERmvlZQFSKRtX4
 i5E+M4jYt1TtciZdzKSdxVw3QjANQRr6sLJWj8562zU2H0XLwIICqPKjixx5o+GrYu3a
 +9dNr6FLz/cMsboMgv/W75nmxIOigddZY+HqxMH9I8B0bre04zy9ct/dPxR3oPrW8HHU
 sAZ1LB/aNw5Xz+d5N8kM+wEhAhqdTu5Bt/GQoN3UupAgYaexDMl9Fobmj5It42c/P7tT
 yfm2XPyTef0Vivhlp+QnlRoFIKKTvKGxmbj1j/Z0vl5yyNYOlEDTRJaa71ekKnEtPKjJ
 pGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712830608; x=1713435408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PowLaTwCiK0zblbMYsUQoyhFkR48l8ASgwvzYVcEv18=;
 b=u4xjgyC/jvDeTsBLu7YARVoatrPUNJ2ppL+cxWo9e+o4+oTNQ0u7utnSeOX0qJs8D2
 X5o0gNI2zqzs8cGOVnjptMcxGKtur3n1R+2VM7leG3oFW5M8k4srlMcRydEUo3Rj7N/K
 2tkxFOVXVuYdF9lUzMAnj85nK7acoUvSCKj4N9kC9ogGzv0rs936072Co8ddsmq+M7J6
 P9fC+q9/lSJ55w1SUJH+0jSL9qLq26qi7qhOIBozWshDKYnqIATcjU047lVY5xY4XrxD
 aeBfRtoXCarzJOWU0rgxQKpTFZSlYCMBajkxxPbUzULZrfs55qau2LnfmiMT49vrkRZk
 3uag==
X-Gm-Message-State: AOJu0Yx9j+OP81l8Kg2bYqlWPWjKRp3FmIJD5pe8vbSGJ9ep3mkZByBh
 LceQtY0LLa0tneAor0BreCgv/W/s27+1LXBHr5PgZ5ukyqHgqcINuBIURDMhJ7U=
X-Received: by 2002:a2e:bc11:0:b0:2d8:901f:7f50 with SMTP id
 b17-20020a2ebc11000000b002d8901f7f50mr4317602ljf.9.1712830608025; 
 Thu, 11 Apr 2024 03:16:48 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 fm6-20020a05600c0c0600b004156afd6843sm5076156wmb.18.2024.04.11.03.16.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:16:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/13] util/hexdump: Replace sprintf() by
 g_string_append_printf()
Date: Thu, 11 Apr 2024 12:15:45 +0200
Message-ID: <20240411101550.99392-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411101550.99392-1-philmd@linaro.org>
References: <20240411101550.99392-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x230.google.com
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
X-TUID: ViCap7RHg5uS

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience.

Replace sprintf() by GString API in order to avoid:

  [426/1310] Compiling C object libqemuutil.a.p/util_hexdump.c.o
  util/hexdump.c:35:21: warning: 'sprintf' is deprecated:
    This function is provided for compatibility reasons only.
    Due to security concerns inherent in the design of sprintf(3),
    it is highly recommended that you use snprintf(3) instead.
    [-Wdeprecated-declarations]
            line += sprintf(line, " %02x", (unsigned char)buf[b + i]);
                    ^
  util/hexdump.c:37:21: warning: 'sprintf' is deprecated:
            line += sprintf(line, "   ");
                    ^
  2 warnings generated.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 util/hexdump.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/util/hexdump.c b/util/hexdump.c
index b6f70e93bb..2ec1171de3 100644
--- a/util/hexdump.c
+++ b/util/hexdump.c
@@ -19,7 +19,7 @@
 char *qemu_hexdump_line(const void *bufptr, unsigned offset,
                         unsigned int len, bool ascii)
 {
-    char linebuf[QEMU_HEXDUMP_LINE_BYTES], *line = linebuf;
+    g_autoptr(GString) gs = g_string_sized_new(QEMU_HEXDUMP_LINE_BYTES);
     const char *buf = bufptr;
     int i, c;
 
@@ -27,30 +27,29 @@ char *qemu_hexdump_line(const void *bufptr, unsigned offset,
         len = QEMU_HEXDUMP_LINE_BYTES;
     }
 
-    line += snprintf(line, 6, "%04x:", offset);
+    g_string_append_printf(gs, "%04x:", offset);
     for (i = 0; i < QEMU_HEXDUMP_LINE_BYTES; i++) {
         if ((i % 4) == 0) {
-            *line++ = ' ';
+            g_string_append_c(gs, ' ');
         }
         if (i < len) {
-            line += sprintf(line, " %02x", (unsigned char)buf[offset + i]);
+            g_string_append_printf(gs, " %02x", (unsigned char)buf[offset + i]);
         } else {
-            line += sprintf(line, "   ");
+            g_string_append(gs, "   ");
         }
     }
     if (ascii) {
-        *line++ = ' ';
+        g_string_append_c(gs, ' ');
         for (i = 0; i < len; i++) {
             c = buf[offset + i];
             if (c < ' ' || c > '~') {
                 c = '.';
             }
-            *line++ = c;
+            g_string_append_c(gs, c);
         }
     }
-    *line = '\0';
 
-    return g_strdup(linebuf);
+    return g_strdup(gs->str);
 }
 
 void qemu_hexdump(FILE *fp, const char *prefix,
-- 
2.41.0

