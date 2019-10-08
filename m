Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5432394wrm;
        Tue, 8 Oct 2019 10:18:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwv2y0SIq9xafH7EVlSe90iZGEgN8I9vGxpGKDsYifuN58n+NlVQP7rAEG7Q1RvVeC0f4jq
X-Received: by 2002:a05:6402:383:: with SMTP id o3mr20876493edv.205.1570555111120;
        Tue, 08 Oct 2019 10:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570555111; cv=none;
        d=google.com; s=arc-20160816;
        b=isehyBpxSMAGNpa8E9uyq5VhecDjmr5dH0+zW4MIqjbktRkDGVMMGDz3n+OZw4i6Io
         8E2opAGdO3UaDbY6tqA+BbEGPqJFV2V7OvdIUld6RIsZLtwX1EjK+xU8tzAM3ZYtJ5Dv
         PKxFsoHqN5BtI19VTMJgNEQAv/15fG6bmqzOgUJRIeiD19icKf1K3baIrEY1X38eFO2m
         fnOhVWqmPt+ZzgTZIAJh/JIXoxa7ZpKEa7TSyu+kPugIBp6paLJUoW9iADs7+H1lNSie
         NV1pVTr2BFmnZZROy2E04AvCYD5u7pVKOA6OlHteJ1qkHJKn53XmRJfzz2BUQIgSpVFO
         DOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=naa7xg2s4V4Ih3fFkoGzCGOvDaxJr7Ss6St8GXFDrdg=;
        b=QhrGaLuqUs4pg5HQb/dvyU5m6lO6bsuWcjIrGIkd5foQM0gHm/hBJX1+xf4oTwzA78
         31eOhLxSk3ilx0xJagHYrgVhmp+TSiYIl59fJX32eaC3u8Eaust4RHk3XVuttRsGm5E+
         v5XWcF25F85SVmmVTnrsapm0KumZyaWelikQmticsXX/ioaf8wuXBROaAB3o1xXNLwWy
         5vvoD1W7JomjNBWcKsj1etS8lI8jzB8YBDMg75Bi/sM9O5nb2JhRq+7JKwJGbcLML7Az
         LVyXOT4ENG36Y3TarQlRLz4GqRxZcDk/aKGZBSOGwYW38UrGhqI/PS31xvv9xSGl5nDD
         ax8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Fybt316F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a33si11515537edf.121.2019.10.08.10.18.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 10:18:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Fybt316F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHt81-0006xQ-FP
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 13:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48782)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7R-0006dD-T9
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:17:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7Q-0002Eq-CO
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:17:53 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38351)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iHt7P-0002Dp-Vc
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:17:52 -0400
Received: by mail-wm1-x343.google.com with SMTP id 3so3931913wmi.3
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 10:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=naa7xg2s4V4Ih3fFkoGzCGOvDaxJr7Ss6St8GXFDrdg=;
 b=Fybt316FzjeS3HF9a6qrViSMmsZaV7kgC+Ee2l59Zh4st3gK8fyskTJqzmxDnjfi9a
 bPt0U7taa+Rlc3QixUjfB5WdUmUSP+rTgsgdp75LsXvZVl2+rKUQwvO2ORbuKgeN6Oa0
 FsinJEwk9YmXf6rPSgpjDJYD6d5/QdD6JWFt+arGUcLkBQBtEIL3+UFVbJDcGUbkgov5
 lHRODwz5kUJ1gDE1zwzlAMo5RE3+zjvVHqkn3eAXhHs4GNpIkab3epgaILUJJZHeIZah
 YaOAHYdxxjLF1aa5KtiqPk+bf2SXbGzA2pSZTCsWW4zHnJnAkFfVsDKR2Ndk+lmdlhmq
 OBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=naa7xg2s4V4Ih3fFkoGzCGOvDaxJr7Ss6St8GXFDrdg=;
 b=K2YjyFc4TlVKwA3a1G2j9aoFpR1G/QwkvwTzNySKXeUk/lt8v/1kYKahTWjVFyAb/j
 dANnm65naVwxX3z1mFAofKwLY2ykIe0UoIcGmu3+x5H9cvNi5boel0DMCYRmHG6Mz2yu
 N2KCw4afOThpc3tm59VNwfeKhDk39zmvYI+eoJp/gJFXvV2BqALKP5NBJlaF9wWGjKnH
 VQ+b3yf22Cdmj/2yeWySq0RHZD/mGGDa/dWyQfCCH3D9iaClrh2u300Sub4BDLQgejEp
 m/qKAgb/Wta51ygMoLUI2LN56O2zrlmfHjdtts3a7WcTqBXiaNS0KSLnFwBSGOr9gw5f
 1VxA==
X-Gm-Message-State: APjAAAUTwCsNPWqTAw9kUMnwbhcMrk+5cJ/TzpMb1tFwpWqLxuR96F5H
 18ZnI0deO2E0fw6J7jogAZLRKLdtTKwLDg==
X-Received: by 2002:a05:600c:2489:: with SMTP id
 9mr4591426wms.131.1570555070234; 
 Tue, 08 Oct 2019 10:17:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z9sm19135541wrl.35.2019.10.08.10.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 10:17:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 05/21] hw/arm/musicpal.c: Switch to transaction-based
 ptimer API
Date: Tue,  8 Oct 2019 18:17:24 +0100
Message-Id: <20191008171740.9679-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008171740.9679-1-peter.maydell@linaro.org>
References: <20191008171740.9679-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kzYNnujSRB+M

Switch the musicpal code away from bottom-half based ptimers to
the new transaction-based ptimer API.  This just requires adding
begin/commit calls around the various places that modify the ptimer
state, and using the new ptimer_init() function to create the timer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/musicpal.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index b3624d5e280..f68a399a984 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -843,13 +843,10 @@ static void mv88w8618_timer_tick(void *opaque)
 static void mv88w8618_timer_init(SysBusDevice *dev, mv88w8618_timer_state *s,
                                  uint32_t freq)
 {
-    QEMUBH *bh;
-
     sysbus_init_irq(dev, &s->irq);
     s->freq = freq;
 
-    bh = qemu_bh_new(mv88w8618_timer_tick, s);
-    s->ptimer = ptimer_init_with_bh(bh, PTIMER_POLICY_DEFAULT);
+    s->ptimer = ptimer_init(mv88w8618_timer_tick, s, PTIMER_POLICY_DEFAULT);
 }
 
 static uint64_t mv88w8618_pit_read(void *opaque, hwaddr offset,
@@ -879,16 +876,19 @@ static void mv88w8618_pit_write(void *opaque, hwaddr offset,
     case MP_PIT_TIMER1_LENGTH ... MP_PIT_TIMER4_LENGTH:
         t = &s->timer[offset >> 2];
         t->limit = value;
+        ptimer_transaction_begin(t->ptimer);
         if (t->limit > 0) {
             ptimer_set_limit(t->ptimer, t->limit, 1);
         } else {
             ptimer_stop(t->ptimer);
         }
+        ptimer_transaction_commit(t->ptimer);
         break;
 
     case MP_PIT_CONTROL:
         for (i = 0; i < 4; i++) {
             t = &s->timer[i];
+            ptimer_transaction_begin(t->ptimer);
             if (value & 0xf && t->limit > 0) {
                 ptimer_set_limit(t->ptimer, t->limit, 0);
                 ptimer_set_freq(t->ptimer, t->freq);
@@ -896,6 +896,7 @@ static void mv88w8618_pit_write(void *opaque, hwaddr offset,
             } else {
                 ptimer_stop(t->ptimer);
             }
+            ptimer_transaction_commit(t->ptimer);
             value >>= 4;
         }
         break;
@@ -914,8 +915,11 @@ static void mv88w8618_pit_reset(DeviceState *d)
     int i;
 
     for (i = 0; i < 4; i++) {
-        ptimer_stop(s->timer[i].ptimer);
-        s->timer[i].limit = 0;
+        mv88w8618_timer_state *t = &s->timer[i];
+        ptimer_transaction_begin(t->ptimer);
+        ptimer_stop(t->ptimer);
+        ptimer_transaction_commit(t->ptimer);
+        t->limit = 0;
     }
 }
 
-- 
2.20.1

