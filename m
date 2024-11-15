Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1070530njc;
        Fri, 15 Nov 2024 08:04:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCFwucAgh2OFBDN99OGrGYYxW+c3hoZn2mPJuHnV1b8x8F9acEg1Tok1nyeVubBlKEtDRfrvb3yEwsMA==@linaro.org
X-Google-Smtp-Source: AGHT+IF/SJhiTSzUedsJ8scF7/h5CGk5u0HC9I1bKNqkfYMxy/qfq5y6SuYYhtQnh/N0M/vQApU5
X-Received: by 2002:a05:6000:1882:b0:382:2cbd:9a4b with SMTP id ffacd0b85a97d-3822cbda266mr1068913f8f.24.1731686677576;
        Fri, 15 Nov 2024 08:04:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731686677; cv=none;
        d=google.com; s=arc-20240605;
        b=gPmv62I0mtScAO1JoahDYQYpLXe44iID1l9VeRiZNXoSfuU1x9OZqvIaQNJ9azChE2
         Y+n9HeFXLaXIHRZrztO5k0KqV/+oJ6lB/SgAZuAFdmjPGyEgnjcoHShqbfmzIKHpWNOl
         rxg7AQb6nY7bCiISW6zV2sd+Te9+pEgHmJt9336mHiTh6a0/rra1hl41iRXE814bZPng
         IlnCKQAQtY0941d16tQzhuTFi3no/498lrGMPyXGEGMWpgQkI+hi1XqX33TwKUQkso2v
         apZyCpQMGsKFvzqmOou08uHttjONv4CPWrzMUaEeesFSqTxvcZDJY/4zi98sMgninwfJ
         eNrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=HYr7dkbjOM3DhMWGJi0XHGtksaAWQFJUXcJyP4tJoMU=;
        fh=oYCvpz2FUf7/7ly/h7jLAf/eE8L/KhB/5330ORlMqQc=;
        b=N2r9Pay3JkIDGJLplaTwv2Mwy7pv7pqV+Z+1KCJvNMFAPquhq9kpj+ZhVC0syXGJvJ
         RufbgSi8we4QVviRT8rWb9SO6k9Chsn8g8wTIO2Hp6LsEAE5R9excFOst6RgJk3AKltX
         Fva/j3fvVPx3H/8gGIEitQakU8ZTFEZhXuzTZvtxQNeWmT3AKPAYYz3rLDf1yV/74pgW
         m/K8eShstdW3tD/5NzfoW3CM6zFzeCfa05IPDoSMuFyTvnJPB+CKRktO2XjjBDfystm6
         EoLK8j29cx0W6gX9unnTQa4/ifU51gx5O5Mg17MkzuEDB9dlenm80dygV2ihmRZjcb3v
         loJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=MxfYrLR7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3821ae32316si2351058f8f.478.2024.11.15.08.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2024 08:04:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=MxfYrLR7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBynU-0004Ap-6M; Fri, 15 Nov 2024 11:03:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <33nA3ZwYKCN0QNPTDGFNNFKD.BNLPDLT-9QLMNMFMT.NQF@flex--roqueh.bounces.google.com>)
 id 1tBynQ-00049Y-S8
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 11:03:45 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <33nA3ZwYKCN0QNPTDGFNNFKD.BNLPDLT-9QLMNMFMT.NQF@flex--roqueh.bounces.google.com>)
 id 1tBynP-00040y-A9
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 11:03:44 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-e381f9e1395so2648390276.3
 for <qemu-arm@nongnu.org>; Fri, 15 Nov 2024 08:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731686622; x=1732291422; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=HYr7dkbjOM3DhMWGJi0XHGtksaAWQFJUXcJyP4tJoMU=;
 b=MxfYrLR7Fj6HQ8ItFqA+yYZvGb473tJSXJv/+5upqp0CYSlZdlQeaYybSEhR3E6xon
 4Foq3KDQpG3OF/CYju318Yagbj7IpKvRNmWvUevSMixm8IsWPcTen0fJiT6GMkFJO62i
 X6e2VX5mZaBFMC7PwEQ4N9EgiCt7eWS31uIi7r2K9rUpV8rGHgKpCz8boVFvCXb74n1n
 n2xj+5t9bWagnMeYpSUiJQrybmV56DvYa0VyDEGyjka3SjvrHh5xqISVHK2df8qoETud
 MKmThUwlSBWGUZ+OSaHq2dkNPuILQaci0OM1iI5ypZx7YTA1fLZt4CBFFbxiCUaeSj4t
 IWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731686622; x=1732291422;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HYr7dkbjOM3DhMWGJi0XHGtksaAWQFJUXcJyP4tJoMU=;
 b=BHlx9FURPJh615NIz/oBGqvDZhKCXl8c8N6SFgqYlRPKV1JotnTT+5xIKENYpZCVgj
 CuTbDbOb9e5cTH7OLY6ZdbsqcBBbQqfN6eLHkgvTbXyHh0IdtCj/ohiIdgkNH6L9rY4h
 723cyOmKPpfRNs9s6T5QSIgqQ5TZnEpVA6ZlRLQbG6sqXOQqKKJL7w4guipLuK6jcrp7
 A1t0o/OThc7q5YnpCW4jotcQ8LxW1NASwSnshFDm91eZXPszLQ7lAHubdvwBXruR85DH
 nSFKFyc+8YEEY44BNBvuf/MVYsASjpDBFVZ3bNjkv99W+QjdoOk7Ct3kGmkzXkhXMVJZ
 rZIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuPOAwpf6VAJSJnzEIiX0HS1Kpnjbsbhg4IqUeEbKWKTTTmIgcV+ZI6/FlQDb9cCjSdPC+ZszVOg==@nongnu.org
X-Gm-Message-State: AOJu0YzDQ3SSrhqO1syfjqaEe00CdPPVkNVysNVjvIOT1lRFsWQxEZlT
 EDisDD6R/wZTUcEKSJluE5ZhPwaJRQQnQr2i3ALkhOPLo5aPbMhZY2V3pVMVpSOUFg/JGnXNjHS
 HfA==
X-Received: from roqueh.c.googlers.com ([fda3:e722:ac3:cc00:4e:3bc9:ac1c:1ab])
 (user=roqueh job=sendgmr) by 2002:a25:53c1:0:b0:e30:b93a:b3e4 with
 SMTP id
 3f1490d57ef6-e382614aae1mr129379276.4.1731686622044; Fri, 15 Nov 2024
 08:03:42 -0800 (PST)
Date: Fri, 15 Nov 2024 16:03:25 +0000
In-Reply-To: <20241115160328.1650269-1-roqueh@google.com>
Mime-Version: 1.0
References: <20241115160328.1650269-1-roqueh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241115160328.1650269-3-roqueh@google.com>
Subject: [PATCH 2/5] hw/watchdog/cmsdk_apb_watchdog: Fix INTEN issues
From: Roque Arcudia Hernandez <roqueh@google.com>
To: peter.maydell@linaro.org, farosas@suse.de, lvivier@redhat.com, 
 slongfield@google.com, komlodi@google.com, pbonzini@redhat.com, 
 venture@google.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Roque Arcudia Hernandez <roqueh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=33nA3ZwYKCN0QNPTDGFNNFKD.BNLPDLT-9QLMNMFMT.NQF@flex--roqueh.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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
X-TUID: 4i9VjIuiPfZ/

Current watchdog is free running out of reset, this combined with the
fact that current implementation also ensures the counter is running
when programing WDOGLOAD creates issues when the firmware defer the
programing of WDOGCONTROL.INTEN much later after WDOGLOAD. Arm
Programmer's Model documentation states that INTEN is also the
counter enable:

> INTEN
>
> Enable the interrupt event, WDOGINT. Set HIGH to enable the counter
> and the interrupt, or LOW to disable the counter and interrupt.
> Reloads the counter from the value in WDOGLOAD when the interrupt
> is enabled, after previously being disabled.

Source of the time of writing:

https://developer.arm.com/documentation/ddi0479/d/apb-components/apb-watchdog/programmers-model

Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
Reviewed-by: Stephen Longfield <slongfield@google.com>
Reviewed-by: Joe Komlodi <komlodi@google.com>
---
 hw/watchdog/cmsdk-apb-watchdog.c | 34 +++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
index e4d25a25f7..ed5ff4257c 100644
--- a/hw/watchdog/cmsdk-apb-watchdog.c
+++ b/hw/watchdog/cmsdk-apb-watchdog.c
@@ -196,16 +196,13 @@ static void cmsdk_apb_watchdog_write(void *opaque, hwaddr offset,
 
     switch (offset) {
     case A_WDOGLOAD:
-        /*
-         * Reset the load value and the current count, and make sure
-         * we're counting.
-         */
+        /* Reset the load value and the current count. */
         ptimer_transaction_begin(s->timer);
         ptimer_set_limit(s->timer, value, 1);
-        ptimer_run(s->timer, 0);
         ptimer_transaction_commit(s->timer);
         break;
-    case A_WDOGCONTROL:
+    case A_WDOGCONTROL: {
+        uint32_t prev_control = s->control;
         if (s->is_luminary && 0 != (R_WDOGCONTROL_INTEN_MASK & s->control)) {
             /*
              * The Luminary version of this device ignores writes to
@@ -215,8 +212,25 @@ static void cmsdk_apb_watchdog_write(void *opaque, hwaddr offset,
             break;
         }
         s->control = value & R_WDOGCONTROL_VALID_MASK;
+        if (R_WDOGCONTROL_INTEN_MASK & (s->control ^ prev_control)) {
+            ptimer_transaction_begin(s->timer);
+            if (R_WDOGCONTROL_INTEN_MASK & s->control) {
+                /*
+                 * Set HIGH to enable the counter and the interrupt. Reloads
+                 * the counter from the value in WDOGLOAD when the interrupt
+                 * is enabled, after previously being disabled.
+                 */
+                ptimer_set_count(s->timer, ptimer_get_limit(s->timer));
+                ptimer_run(s->timer, 0);
+            } else {
+                /* Or LOW to disable the counter and interrupt. */
+                ptimer_stop(s->timer);
+            }
+            ptimer_transaction_commit(s->timer);
+        }
         cmsdk_apb_watchdog_update(s);
         break;
+    }
     case A_WDOGINTCLR:
         s->intstatus = 0;
         ptimer_transaction_begin(s->timer);
@@ -305,8 +319,14 @@ static void cmsdk_apb_watchdog_reset(DeviceState *dev)
     s->resetstatus = 0;
     /* Set the limit and the count */
     ptimer_transaction_begin(s->timer);
+    /*
+     * We need to stop the ptimer before setting its limit reset value. If the
+     * order is the opposite when the code executes the stop after setting a new
+     * limit it may want to recalculate the count based on the current time (if
+     * the timer was currently running) and it won't get the proper reset value.
+     */
+    ptimer_stop(s->timer);
     ptimer_set_limit(s->timer, 0xffffffff, 1);
-    ptimer_run(s->timer, 0);
     ptimer_transaction_commit(s->timer);
 }
 
-- 
2.47.0.338.g60cca15819-goog

