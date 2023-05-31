Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp230742ejb;
        Wed, 31 May 2023 13:39:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7RQjYKs+41bHQVqcQ8SkvzN0s+I9BwjKrgcW2fG9vpvTAoRXAlwfmIcnnCUJf7xeE8N3p8
X-Received: by 2002:a05:622a:1489:b0:3f3:8f39:3473 with SMTP id t9-20020a05622a148900b003f38f393473mr7494286qtx.26.1685565571185;
        Wed, 31 May 2023 13:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685565571; cv=none;
        d=google.com; s=arc-20160816;
        b=tD+xfFa5nENfd5JX7jpPT1qpz1kGUgh/e2duERkHUJV83P/9pV6DFF+pfWd+ZMXdjo
         xewwsQ83CK/5VUmJ/cp7sxUyCJSdQRMI4y5ev17Zh0ekxkUbcYDLF2h/iUwEMyYp133M
         vdQXJbdZxYW7au4M++qUuMrJMn+lWXoHbHmj8H2gDH47EWqNwQSEWrswBEVhkIYkLcOB
         XyNBIy4cVt20W9ECpr4WE792tUjIL1j/oBovk8nFODtyQyfvq5astKftW2dr+4oJNVzU
         b7h2VIAULIO41D5Nynf/zVewL4Uap1HczH08XpUSKvA3z7DGwdB0dhurdqagvtTOmrc3
         kTiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uEwvjd8H0pBzSI4zIAJ+UnyR+kTgNch6Orzmem2MX0A=;
        b=U6mFCyPVDpmRw0y9VZLLLnJhK7yLZnwmy4CNVyCuGwUauQIPNCj3xzuRC7Ypsj5I3+
         1fq6O7f6/EwE5Ql4QfDWd8Ke2uyHwsA4Njrmj3y88k3/HB7jeLfwVUX7F+S7X8X/fzb7
         5rpCcxrrHeWq5h4qTk+0lXRknRzkND09ojbrBLLdstv2Eqcr6KK51YfvRbrI20cFCpFp
         cj8dSUCSjSKh6Ekq48+sVulrjCd0XcdDqHr2ZvuBkrjtbhv/VqdBTvCYt8Y2QXprR7w2
         zh58J97tIUj9jR15hOx4r+MEWOXOTwQzkh41Jer42eJ4AR+8licdOdOTPZGvXFVa9Z5z
         RPbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YWIISxO9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18-20020ac85a92000000b003ef3704f5dasi8469697qtc.463.2023.05.31.13.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 13:39:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YWIISxO9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4SZ6-0000Lx-NM; Wed, 31 May 2023 16:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SZ3-00008i-Q7
 for qemu-arm@nongnu.org; Wed, 31 May 2023 16:37:01 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SZ2-0003NF-7V
 for qemu-arm@nongnu.org; Wed, 31 May 2023 16:37:01 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f6d38a140bso1210155e9.1
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 13:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685565419; x=1688157419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uEwvjd8H0pBzSI4zIAJ+UnyR+kTgNch6Orzmem2MX0A=;
 b=YWIISxO9hQd5X9nGqB5u96JUNy3fPpsO7x9uZgjm3fkI+GMCo4/lJq+GTqQXwV6QJ7
 c3Fl8UvYgu5xmQUz0n4rlDV9tJmqTwHvQ2T+REUhpM7mQKFsgK6uxBMHgaE4YCxbG1vu
 3uJrv/nLewPkNiPYQKJ77fl8xR6L4bhTVj4mMzZXYToiijdIXzOkKikCrNM3AGMgDXqk
 R0luTWqA4cslZrtbGpw2Pi/gzrRxmxwxEk4nqEFglmUI4IYJ3CvSQFSpgClV08/pCraR
 XIDqaE7jlYa39fWjJ4O5Dg7PjDCeCgWHKMLX4J43PM88I3RPBdStXneXc8IjySRtQraL
 OKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685565419; x=1688157419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uEwvjd8H0pBzSI4zIAJ+UnyR+kTgNch6Orzmem2MX0A=;
 b=hUM5HATp0cG647x2Ot2HksXENnk6k3esX+tH86i1AojmmLfABWZBSsSYBURdHdmMPB
 nrduqxKcKNTpp3Plp0XFfISYjUYc7CkclkO8XLQzeSHaw/lwloewFtFWPVfGejMwV5MU
 tB3oI34E4nRm7lk0HMEiCygT6KGqciE8nwXZUTKwmtiT/MWg9ewK4el6NjkOBD5GXZEC
 Z2xsA7Qrg5hIydnfS+Gv74rVgFD4moqpjSt9Upnelm2+3yJxADFl99lzcUWWLmitc8Uj
 orJCj6qbriyw0WHc06Smd2k6NZToO9tCz+R2MoLxtr1Q1M5hbWHTPBs9DQTsPJFkManx
 GNAQ==
X-Gm-Message-State: AC+VfDzrGRa1gYbb20QWR5x2p5n/JkqVN8gfgTVUx0s3sksPeJ/fqNrO
 lYvdJTysGHi+vvrYWbPb99Fh9w==
X-Received: by 2002:a05:600c:3d1b:b0:3f5:867:1aba with SMTP id
 bh27-20020a05600c3d1b00b003f508671abamr301535wmb.15.1685565418864; 
 Wed, 31 May 2023 13:36:58 -0700 (PDT)
Received: from localhost.localdomain ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a05600c0b4f00b003f611b2aedesm22011624wmr.38.2023.05.31.13.36.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 31 May 2023 13:36:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/15] hw/timer/arm_timer: Use array of frequency in SP804State
Date: Wed, 31 May 2023 22:35:54 +0200
Message-Id: <20230531203559.29140-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230531203559.29140-1-philmd@linaro.org>
References: <20230531203559.29140-1-philmd@linaro.org>
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
X-TUID: tzI5pHcD+OB1

SP804State use arrays for timers and IRQ levels. Be consistent
and use another one for the frequencies. This will allow to
simplify using for() loop statement in the next commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 510ec74a51..4d31f917f6 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -204,7 +204,7 @@ struct SP804State {
 
     MemoryRegion iomem;
     ArmTimerState *timer[2];
-    uint32_t freq0, freq1;
+    uint32_t freq[2];
     int level[2];
     qemu_irq irq;
 };
@@ -308,8 +308,8 @@ static void sp804_realize(DeviceState *dev, Error **errp)
 {
     SP804State *s = SP804(dev);
 
-    s->timer[0] = arm_timer_new(s->freq0);
-    s->timer[1] = arm_timer_new(s->freq1);
+    s->timer[0] = arm_timer_new(s->freq[0]);
+    s->timer[1] = arm_timer_new(s->freq[1]);
     s->timer[0]->irq = qemu_allocate_irq(sp804_set_irq, s, 0);
     s->timer[1]->irq = qemu_allocate_irq(sp804_set_irq, s, 1);
 }
@@ -324,8 +324,8 @@ static void sp804_unrealize(DeviceState *dev)
 }
 
 static Property sp804_properties[] = {
-    DEFINE_PROP_UINT32("freq0", SP804State, freq0, 1000000),
-    DEFINE_PROP_UINT32("freq1", SP804State, freq1, 1000000),
+    DEFINE_PROP_UINT32("freq0", SP804State, freq[0], 1000000),
+    DEFINE_PROP_UINT32("freq1", SP804State, freq[1], 1000000),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.38.1

