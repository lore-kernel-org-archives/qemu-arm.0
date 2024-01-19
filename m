Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp879073ejg;
        Fri, 19 Jan 2024 03:37:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+WptQq5acQhetxnb5lP9Hk+RPAt1Ghht44HcMI13Dy51U3uHDBN6qTEJ3JWWjgZAuBtHS
X-Received: by 2002:ae9:c017:0:b0:783:8d64:884 with SMTP id u23-20020ae9c017000000b007838d640884mr199912qkk.79.1705664251719;
        Fri, 19 Jan 2024 03:37:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664251; cv=none;
        d=google.com; s=arc-20160816;
        b=nEkF2nOhTtRKpLaxN/8coX1JCcGJq+UvvVApQ7+0eDIGxYghhgxlFuJ+N26nKRZPJ2
         jlIl83SzPt+8cGXMrx88Agtvo8eSxP5UYFGhixfoYsMz44XHIcB9wGCdRM5qXDFm6yxg
         l3YwNhaq7RahBKCpSinlwGJhpshh9kH9VxP8vbS3vcNwqh/LTUcuqCj0HGkwEQ6Agppv
         6iRCsneyjpSqpUrWLNNGWcLq6lqZ/IOm38PoyO78U2n0/XQzH6YDNVmNyad/YG/HYVKZ
         hJjulk20nlGCPGbYPo+ZPVgD9MifuBG4ejjPD91VFhXpNWqdoc2pLhkbDO2u6h+4AC60
         IbPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XRUeXWyyJ392ZohYjYrcHzpfLxHyioAU0c9SeFp2B+4=;
        fh=H3gzWMxIGcYpnCV3e2JUJoIjDrs6lUKJhouF472DiR4=;
        b=PyDl0mjpFpzwGkJHgeGzNd6dmxSb+DCtNGMngLHaF2F0qJxda3wq7/RnOVHWPP8pqd
         KKIlVYQYlYsKOZk9/rQc5qSPVBAuvCOeBbHIddV+Nf17hOCO8EmgasMv2OdEUnPLzu1t
         nbltEfIs8Nn5mdenZD4aBf5YlzCbtiOS43e6fteY/VfmWXOBeMhjjMueV6xxoy1PpMr9
         WnKGyPWfups9101Cd5xk6bg7ovZBOk/mA37chyzr94lcSdU83aMfpF/EyhlkzO+QbdH+
         9Y6kYTXiqxJSJOgxHOlK7dXqNFaENeHv23I8xiSKjfnvtImauQzWa79FqB+J0Ya+5ufG
         FdRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U8SlidXb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q16-20020a05620a025000b007833165268dsi15739546qkn.24.2024.01.19.03.37.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:37:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U8SlidXb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnAs-0003YU-Nf; Fri, 19 Jan 2024 06:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAs-0003Y2-8N
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:36:38 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAq-0002of-H8
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:36:37 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-337c5eb1bddso559127f8f.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664194; x=1706268994; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XRUeXWyyJ392ZohYjYrcHzpfLxHyioAU0c9SeFp2B+4=;
 b=U8SlidXbM8Y2dQEorClOwMLGiJs+pXPpw6EGVS1qq8ORi+ImOMGHZamC+MRDYO+jGI
 N1sd7Ndd2QUt0jYauMwXKT1wt0ppuxLuwXvIQ+lQHkb9KLtQ8oIKKT7o9BTvZZ9oHu8U
 PLPUpZwqsJ4djhBgmW5vLoY1eq0tJ1l9P8/u0oAN65ga9HrLO7NnHU+esySc5FMyz8T4
 zpq22KCSjXEuIZqzyTXBmXDTJHyc32UfjHH96lbAym3pNJ6zBgv0qWxdH2i/R3gB2ucI
 VUeAz7yCSPu1GwjaM3JlmtrE7IYJp5VIjCmN3ElJ0xjEfzwjEkLKE/43O7DAaTQ25q46
 aUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664194; x=1706268994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XRUeXWyyJ392ZohYjYrcHzpfLxHyioAU0c9SeFp2B+4=;
 b=a7JlxViSna/AaijNSuGGYwWkMXqPrkCGOgexnxbOB6zkKs13I2QLjIpedwcZiQNRaS
 PGmpEHuUWD5eSV4GE+Rovum2LQaQgXAYpwoir289EVYi5YyDFPrA3E1LMSIF9A4sGf2p
 AKfJ6Mukj6MuJ7cJUd7MiJ/UulEuiBAUMGjf1S1E5XTYJrCtC4nldLQLAUYo3KQy51tQ
 OijC2hkDGSCoLZ8K2p8FTqHoH6hO49bMzRYFBqR4Dse6/bBDiU01VhWWS/z08Sv0SwnP
 QT3fd0SlhgjnzEgFxXK9/T+EuI2l/qAB3O6lyzAm4CFtFgL72LDoAuQxbMZRFKxllYch
 FlYA==
X-Gm-Message-State: AOJu0YziIKpqZwVzhdedfdTT/3LmFA/lt7mhzwrHjLh0vW6UeOkRCKvs
 AELbV6Lu7MeWotH3UMm5YZO0XeIncDU4OvdC7aqIS66T+7wuNNFoG5FxzBNcgcU=
X-Received: by 2002:a7b:c3d4:0:b0:40e:89a4:27dc with SMTP id
 t20-20020a7bc3d4000000b0040e89a427dcmr1430853wmj.106.1705664194508; 
 Fri, 19 Jan 2024 03:36:34 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b0040d8eca092esm32803585wmq.47.2024.01.19.03.36.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:36:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 19/36] hw/pflash: use ldn_{be,le}_p and stn_{be,le}_p
Date: Fri, 19 Jan 2024 12:34:48 +0100
Message-ID: <20240119113507.31951-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8Zu+WoRV7TRU

From: Gerd Hoffmann <kraxel@redhat.com>

Use the helper functions we have to read/write multi-byte values
in correct byte order.

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240108160900.104835-3-kraxel@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi01.c | 63 ++++++-----------------------------------
 1 file changed, 8 insertions(+), 55 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 67f1c9773a..8434a45cab 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -225,34 +225,10 @@ static uint32_t pflash_data_read(PFlashCFI01 *pfl, hwaddr offset,
     uint32_t ret;
 
     p = pfl->storage;
-    switch (width) {
-    case 1:
-        ret = p[offset];
-        break;
-    case 2:
-        if (be) {
-            ret = p[offset] << 8;
-            ret |= p[offset + 1];
-        } else {
-            ret = p[offset];
-            ret |= p[offset + 1] << 8;
-        }
-        break;
-    case 4:
-        if (be) {
-            ret = p[offset] << 24;
-            ret |= p[offset + 1] << 16;
-            ret |= p[offset + 2] << 8;
-            ret |= p[offset + 3];
-        } else {
-            ret = p[offset];
-            ret |= p[offset + 1] << 8;
-            ret |= p[offset + 2] << 16;
-            ret |= p[offset + 3] << 24;
-        }
-        break;
-    default:
-        abort();
+    if (be) {
+        ret = ldn_be_p(p + offset, width);
+    } else {
+        ret = ldn_le_p(p + offset, width);
     }
     trace_pflash_data_read(pfl->name, offset, width, ret);
     return ret;
@@ -408,34 +384,11 @@ static inline void pflash_data_write(PFlashCFI01 *pfl, hwaddr offset,
     trace_pflash_data_write(pfl->name, offset, width, value, pfl->counter);
     p = pfl->storage + offset;
 
-    switch (width) {
-    case 1:
-        p[0] = value;
-        break;
-    case 2:
-        if (be) {
-            p[0] = value >> 8;
-            p[1] = value;
-        } else {
-            p[0] = value;
-            p[1] = value >> 8;
-        }
-        break;
-    case 4:
-        if (be) {
-            p[0] = value >> 24;
-            p[1] = value >> 16;
-            p[2] = value >> 8;
-            p[3] = value;
-        } else {
-            p[0] = value;
-            p[1] = value >> 8;
-            p[2] = value >> 16;
-            p[3] = value >> 24;
-        }
-        break;
+    if (be) {
+        stn_be_p(p, width, value);
+    } else {
+        stn_le_p(p, width, value);
     }
-
 }
 
 static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
-- 
2.41.0

