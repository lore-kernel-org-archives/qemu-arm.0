Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1505840ejm;
        Fri, 22 Sep 2023 11:15:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk0ChXh7BsOpiaJVS06umVnC0WTPdEr4MHAb4g9dvK4hTBzfLBGOo44pjduhHUkpXQaNPe
X-Received: by 2002:a05:6870:9122:b0:1bb:eb37:1d69 with SMTP id o34-20020a056870912200b001bbeb371d69mr240121oae.14.1695406511960;
        Fri, 22 Sep 2023 11:15:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695406511; cv=none;
        d=google.com; s=arc-20160816;
        b=FeOKWmA2L+Py5vNW7dG98T/+KSLcXurXfqYUSCX2iypYZTQ0SKGjb3hPD+Kur68MRK
         H+dX4tbC7Xn/5UaAQNdU2GNZ3viXjl0h5lOsfnyCmyHgXAwBeAYRFgxP0dKjt65ePluo
         tX4lK6w0gSqEESDdqiaLizDNLh/mNElquvlEcTUv/dh/84dpUtOcTCVN5U+SC9BKVI5Z
         6E9t8xzOTt2GTSIFOL7NPVdaMrXeww6JtQfdBjhNX+aZjrRDLs/8bQEIWHmtJQe+crX6
         rseSLl3fyknWaD41mXoLRAcLary2Bk51Gx3T/QssZDH4Qyt43DtgJ+Z2XnpdTRY/xvpX
         M+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=CpxQY1zQQfP+B92PZ/Ew3AvAau2WsZR51iMdTH0L4fk=;
        fh=hVxhvy1T6gG+KTQ80efY/RddoOU0aIkZCfs2i7IpsQM=;
        b=LpllhcPOZScZVryQJBMQbsvk8taZ8aTkJcUFvQ3y6feD/a+r4oWCbzVb6BO5RECoX/
         E+gkSgCgqHgCJ+ud3+25W1pZowCL8UmZVlJHw+GzJ47Wfd7k/SAsKYJ0QcJbb1VIqX9s
         ZkoYG9rOPeag+WdWFEqP5ZPn1AbkCTa6YIfBq+PKwmrlFLMKxnGWqNzKz/GqTiZLrDia
         oG/fgQwH/ST9V3Uoc+8rrk/MFRiIb/cPY19hBT6cjs0cCxg7MS2R24STWo0FzBYGRXCS
         SUSUBbeBffPMgsz9xTuVtjwSi/yruegUoYRNP1ctg1eZ1asOxm/gsi+5Lf8K0yDpsKZF
         h+jQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2ldPONTt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay44-20020a05620a17ac00b0076ce6cfb22dsi621839qkb.635.2023.09.22.11.15.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 11:15:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2ldPONTt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjkg1-0000Ie-K6; Fri, 22 Sep 2023 14:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ldkNZQYKCK4QfOiSfUccUZS.QcaeSai-OfabcbUbi.cfU@flex--crauer.bounces.google.com>)
 id 1qjkfy-0000Dg-1S
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 14:14:50 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ldkNZQYKCK4QfOiSfUccUZS.QcaeSai-OfabcbUbi.cfU@flex--crauer.bounces.google.com>)
 id 1qjkfw-0007bp-MC
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 14:14:49 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-59f4f2b6de8so960557b3.1
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 11:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695406486; x=1696011286; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CpxQY1zQQfP+B92PZ/Ew3AvAau2WsZR51iMdTH0L4fk=;
 b=2ldPONTtwhGtutIlpzBe8CCc80zI0cHwiJAkDtCsVnKxQNxKX/h4XFk0ZGpd5gscYS
 VDNxdBlauseGCXlc6XYjMBLusSaL4FcRvIHX/uIuofA5WEDR1rmT4iYhpO5P0lXVB+yp
 nIquUpCpmfAw1aHx4KsaNYFyiVG20VjDdVHiagB0tuWbc8eaGU6Nt7w/soQwn9qGSFXI
 vqEC2nLYElGch8LmZYA6zk6tCw3j4FwmER2I+R1Lm+VrzdCFyWj5is4C0mUXUP7dfCEb
 zggixbGDM0z/W1zTYX3S4JvrJyQCjFU9Nq9aNmNsp3EYv8/PNkg0gtWlPQ3sizE1vRdn
 cGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695406486; x=1696011286;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CpxQY1zQQfP+B92PZ/Ew3AvAau2WsZR51iMdTH0L4fk=;
 b=f1nw2kna3VNSWrNT6bwXjsbBH2SVFSrYA6RLZqflq9Nn4a7bo/XEXD3b5vVr0fGHCi
 l1LpnBU+DmVT7YNyB/T15mW84YEc/bv6NqJpjzw1pQKG25Fo5d02tQ8JOYZzdYvPprCh
 SnlXtY+9/vvSh3MBXJvpCjDPkWobJqlqIKbX1WBPmKauHvypXGCliCfHlgOqDuU3U+h7
 xo2kbjUV1vdJeEons8zOD3eb9mpIOKsFR7rwE5I39QPzf5+v1PXyO2JU/SsI8Gk9JjvJ
 +IJrGqR+XRrpuuP3JBjWz+a/jzLIE7R+qBDzuhfgYb7rGLNXfKaPod0UZIPB4DJ6quRh
 dU7A==
X-Gm-Message-State: AOJu0YzeroTZkeywJtNFDyM6JcFpDxgx1vVOnnjmlfOLYJKANOb+5Z7c
 Hmop/BxQOipRcIv+4xg73FsgTW/0Bhg=
X-Received: from crauer-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:100f])
 (user=crauer job=sendgmr) by 2002:a05:6902:1689:b0:d7b:9902:fb3d with SMTP id
 bx9-20020a056902168900b00d7b9902fb3dmr1469ybb.0.1695406485945; Fri, 22 Sep
 2023 11:14:45 -0700 (PDT)
Date: Fri, 22 Sep 2023 18:14:11 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Message-ID: <20230922181411.2697135-1-crauer@google.com>
Subject: [PATCH] hw/timer/npcm7xx_timer: Prevent timer from counting down past
 zero
From: Chris Rauer <crauer@google.com>
To: peter.maydell@linaro.org, kfting@nuvoton.com, wuhaotsh@google.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3ldkNZQYKCK4QfOiSfUccUZS.QcaeSai-OfabcbUbi.cfU@flex--crauer.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: Ue9Y/InIWgYo

The counter register is only 24-bits and counts down.  If the timer is
running but the qtimer to reset it hasn't fired off yet, there is a chance
the regster read can return an invalid result.

Signed-off-by: Chris Rauer <crauer@google.com>
---
 hw/timer/npcm7xx_timer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
index 32f5e021f8..a8bd93aeb2 100644
--- a/hw/timer/npcm7xx_timer.c
+++ b/hw/timer/npcm7xx_timer.c
@@ -138,6 +138,9 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer *t, uint32_t count)
 /* Convert a time interval in nanoseconds to a timer cycle count. */
 static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns)
 {
+    if (ns < 0) {
+        return 0;
+    }
     return clock_ns_to_ticks(t->ctrl->clock, ns) /
         npcm7xx_tcsr_prescaler(t->tcsr);
 }
-- 
2.42.0.515.g380fc7ccd1-goog

