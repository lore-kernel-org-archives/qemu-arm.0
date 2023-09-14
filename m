Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp835498ejb;
        Thu, 14 Sep 2023 15:42:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDcl62dpL7bQv6O4B5mQT0U9mY1dDDKZhTQLjikEg7oQbghFFoBFzvRgIGUuD+XfVcaWEp
X-Received: by 2002:a05:620a:4445:b0:768:11ff:7899 with SMTP id w5-20020a05620a444500b0076811ff7899mr8724502qkp.64.1694731366900;
        Thu, 14 Sep 2023 15:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694731366; cv=none;
        d=google.com; s=arc-20160816;
        b=qfgI/LlUbBBx2bJMn0jUOBdbMr65OmZtXqx/uNXGyCduZ4Gga7Ts6ULjShjocdE0SA
         98BdzjSH/ZkKuuiVOnCOUmClic2pe2k62CKDPhaQMoLLiTJ/JhTZVClgKPpu8wIk2kyI
         EsTnSphjIZtSLq7757nZU/96WxNmmZ14fvkrhpwkZmKDeqlihG0qzLUnUbHw0KUg5HUk
         um6VDC7mF983tnQIccBqU2EiY5U0jTYHwnsQPUp075JjzRSihC69NRKV7dg4V7WTZZ+3
         gLJSrONnpl/WlsE6oNDhaIHYhX+50XGFqduUbRTsK5uJiKYx5i5313qxfcv9PUdZ8jAy
         Evyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=OlJhU4LHA+fzq8m2hyizz9EI1FeCvDgyPUR6IsKexwU=;
        fh=B5Lugouudq7zpnpheERcCb2tRWWmYNJugNqQhE9RDLA=;
        b=L7Ow+csddShdng4vAbNaFrg3O+FwDI5U6q0oLyp0pRyvIHQpPPF2qj6PEiSspNm8zk
         XD1Z9xvc2MrqY9zJ/r+JPu4lgNYZWoWG6Mnwq3peKT0DNLFDZq+V8XczV184STa4kybf
         FxYwlscWexzRYSF0nCg/VS889ibxH+SRsaIOSlp+EMhNxae1TQ8gR+mZ/rLkmSdv+5uq
         9gxeiaJqMvSm0J2TFbkD3jn+ZmDreZiRs7Tn+kVU122sfAT9OWuNI7+o0m/128m5ofwY
         F10jJ1tBnQgXj3m79IhEBnCXL7/aaH6cNAQyrkOQO6Vs5hwqlUwmiqDeXuhmjCVYYrUw
         ypjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=LIoHyBY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17-20020a05620a04f100b00770728e885bsi1537373qkh.316.2023.09.14.15.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Sep 2023 15:42:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=LIoHyBY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qgv2V-0000c3-Oj; Thu, 14 Sep 2023 18:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3SIwDZQcKCJ0HLJILAFDLLDIB.9LJNBJR-7OJKLKDKR.LOD@flex--komlodi.bounces.google.com>)
 id 1qgv2R-0000b9-Oj
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 18:42:19 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3SIwDZQcKCJ0HLJILAFDLLDIB.9LJNBJR-7OJKLKDKR.LOD@flex--komlodi.bounces.google.com>)
 id 1qgv2Q-0006Iw-55
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 18:42:19 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-59bf252a83aso13312347b3.3
 for <qemu-arm@nongnu.org>; Thu, 14 Sep 2023 15:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1694731336; x=1695336136; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=OlJhU4LHA+fzq8m2hyizz9EI1FeCvDgyPUR6IsKexwU=;
 b=LIoHyBY6ET+LEcr9Jk0kJmheCyaJJpo1a4f0T2roszmhOx6KVGoJ3dLe9rR8RA8d5g
 1S/BzGtGodlzgs3AJy0G/HfPTNBXJtw/gldTdqBaku3EdbyHK/wKkb0y1YXIcAyvCGk4
 YkM1PVcTS6AiTxGNYNQ5NZd7JA6SQUn1EXXiWlcrdn5yoPgCfTjr+SS6GorFWPqFdw5B
 CMwDAsqto2Ovswk0l1Y79D6WJhlQxNetSDfYyx7/KmzusRJwWSo0bP+bBO43q5UdF+vd
 BhoH8AOBLOvAkZpFTlQ605IEO0BByUft8ThAk3UVfFMeMNY/Lvrngzfgfsaq9EFQzaWX
 6BRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694731336; x=1695336136;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OlJhU4LHA+fzq8m2hyizz9EI1FeCvDgyPUR6IsKexwU=;
 b=AStqLxnKLx1Zo1xsoApev9Op0l/tT+KEiacAeqyIXURKamjxV3r/amFXshwRBPX/UR
 CTeW34ilNWa6xSzMzwA6Zz7qVEBcu5fvgiiiE8bLSIrbPHr4ZisL+y5GIxM/jyrsiwlY
 OWvDW28sXFroKqVah2q3BeVWPH6tHUQkwyqMB8kLlm8gR+LKVP1YPvi50P5Hf0EP/E2f
 bEGhzUE6QSduKkEUxqv1zSRSVqXwA49pCGmdBRql2h8JUoruqolmJXgJeowcrOo8Ac/r
 MYSvULyXL1TAfek8R9OK8Z1kCQ3Jy96W2keWxO8IbAho8XzN2LZifErcM/liwJvMtN/n
 kyPA==
X-Gm-Message-State: AOJu0YwmrL/NCDIyoD9jtxOD53M9qccUDc6dj3Iw/z2hbJsB6r5awPdA
 xlZH9BOTBfpTqyGA5FzDM58i44fMx4Jd
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a81:4413:0:b0:59b:db15:498c with SMTP id
 r19-20020a814413000000b0059bdb15498cmr1069ywa.10.1694731336779; Thu, 14 Sep
 2023 15:42:16 -0700 (PDT)
Date: Thu, 14 Sep 2023 22:42:10 +0000
In-Reply-To: <20230914224211.2184828-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230914224211.2184828-1-komlodi@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230914224211.2184828-2-komlodi@google.com>
Subject: [PATCH 1/1] hw/timer/sse-timer: Add CNTFRQ reset property
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: komlodi@google.com, qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3SIwDZQcKCJ0HLJILAFDLLDIB.9LJNBJR-7OJKLKDKR.LOD@flex--komlodi.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: uDZhpgle/U9r

This can have a non-zero reset value, and cause the kernel to complain
about a CNTFRQ mismatch if TF-A (or firmware in general) does not
initialize it (because it expects the value to be non-zero out of
reset).

To fix this, we'll just add an object property that people can use to
initialize the CNTFRQ reset value.

Signed-off-by: Joe Komlodi <komlodi@google.com>
---
 hw/timer/sse-timer.c         | 4 +++-
 include/hw/timer/sse-timer.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/timer/sse-timer.c b/hw/timer/sse-timer.c
index e92e83747d..a727f05bac 100644
--- a/hw/timer/sse-timer.c
+++ b/hw/timer/sse-timer.c
@@ -376,7 +376,7 @@ static void sse_timer_reset(DeviceState *dev)
     trace_sse_timer_reset();
 
     timer_del(&s->timer);
-    s->cntfrq = 0;
+    s->cntfrq = s->cntfrq_reset;
     s->cntp_ctl = 0;
     s->cntp_cval = 0;
     s->cntp_aival = 0;
@@ -430,6 +430,7 @@ static const VMStateDescription sse_timer_vmstate = {
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_TIMER(timer, SSETimer),
+        VMSTATE_UINT32(cntfrq_reset, SSETimer),
         VMSTATE_UINT32(cntfrq, SSETimer),
         VMSTATE_UINT32(cntp_ctl, SSETimer),
         VMSTATE_UINT64(cntp_cval, SSETimer),
@@ -442,6 +443,7 @@ static const VMStateDescription sse_timer_vmstate = {
 
 static Property sse_timer_properties[] = {
     DEFINE_PROP_LINK("counter", SSETimer, counter, TYPE_SSE_COUNTER, SSECounter *),
+    DEFINE_PROP_UINT32("cntfrq-reset", SSETimer, cntfrq_reset, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/timer/sse-timer.h b/include/hw/timer/sse-timer.h
index 265ad32400..ad84c24940 100644
--- a/include/hw/timer/sse-timer.h
+++ b/include/hw/timer/sse-timer.h
@@ -43,6 +43,8 @@ struct SSETimer {
     QEMUTimer timer;
     Notifier counter_notifier;
 
+    uint32_t cntfrq_reset;
+
     uint32_t cntfrq;
     uint32_t cntp_ctl;
     uint64_t cntp_cval;
-- 
2.42.0.459.ge4e396fd5e-goog

