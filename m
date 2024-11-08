Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp5148281njc;
        Fri, 8 Nov 2024 11:10:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWxTU0KHO2WX9uxeKyuB8fJ06yF0nMqRd808I5UNonal4u0pmkxywNR5F1HUz+tcZroeCvt7+Hdi8yiog==@linaro.org
X-Google-Smtp-Source: AGHT+IG7fF9WRY2jPlqsx1ihIP9BmNLG7SNghYpMONCl1Catssuu2PizhbNhoERPjNpOhNml7SyX
X-Received: by 2002:a05:620a:4009:b0:7a9:bad0:4572 with SMTP id af79cd13be357-7b3318eff35mr786927185a.17.1731093056839;
        Fri, 08 Nov 2024 11:10:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731093056; cv=none;
        d=google.com; s=arc-20240605;
        b=asKk1Tk8P1lhaxIMZ7BAVBVETDO55g8IVRXobQHuMqKA+3kAABySntqFGApu9vmKLn
         VLdxbOtVo6y4DTtZ+pczecqqP59uKF7XalCA8zkD8dF1SQ40HDlyXWhmdXKjLFaCLmJB
         dTyRC7pbPknC4eWnbWdWssiq+VFynqrmF94BeZJmdxm4Lc6fXMur3TuNtOdQEIBC6Yf8
         Ib80Ti/TnBODI50kwJ87cF+Mt+IsL2gTsBE7VX+2KFWnevpcXBrL9TlycgoY9wcNrALr
         xO4HNV0ZhrDKPeo7oArfOJNBJqxUsl3Rr27G5EMDiGFPjoUoor4zn6FRooKtcDGIIJM8
         xDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=At9m5rzWH99Iv6qvPLaYCajHW0bxi1ZNylBU9lm8qmU=;
        fh=i6l1+7t7UvJyfSRC/M0P9sPKkjxHAUsoyvnQQ88Hkv8=;
        b=VZgOzUVFco+LorMRot1wmj2dlXpQYF4nJm7HodqnENzRA/VQ9LDZ5Cx4OXUBQN5eKj
         Pjlf1huphu0ctF1D0uFi4WIHmkmeVEZ8IvRVSHsceOPfUK9uUoenszJ7SHFCQlmTJNA4
         VIdiUJhAC1aavALpo4dlvn9fMpxucNSKOET7+IQOgU+5wkJ2FP4/dokfseiae/IiCebN
         wykbQHS34QVB+Yh1Khubwmf47mfTQUcAjdF1ceOH8qmsWhxMJWP9xKQIfWBrfFfFnOW7
         St1bcN37d5VjurYER3HVGAyCFU5YC5GSUCoelvzzfyRVQYo4LfaKbs0uQAPx1ZkzS+/a
         qqMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=cm4DI3BS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32acf36basi469002785a.415.2024.11.08.11.10.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 11:10:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=cm4DI3BS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9UNR-0000dM-5C; Fri, 08 Nov 2024 14:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3J2IuZwYKCOQXUWaKNMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--roqueh.bounces.google.com>)
 id 1t9UNP-0000az-Ou
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 14:10:35 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3J2IuZwYKCOQXUWaKNMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--roqueh.bounces.google.com>)
 id 1t9UNN-0002R8-TK
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 14:10:35 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6e355f1ff4bso53493507b3.2
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 11:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731093032; x=1731697832; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=At9m5rzWH99Iv6qvPLaYCajHW0bxi1ZNylBU9lm8qmU=;
 b=cm4DI3BSPT8ob8Hif/5+vNnI4hKgjosKe7RTA9X+OU/QXOMSNa9t5xnJwyYJvMUhUT
 d0IMkNcO340xRXqk8OXpaXUvG04fp5ku3eDdn1Wbd2o+tnCN89JJAPetzUnGOpSe2T1D
 V43eTsEeHw1Ei01FEES7+Lu69oiJuPDh4muFCx0fpiBkYm9vVjeVXZ8/da3aSjEjNFKp
 /pep3j3cU550HJaYar4R9/35dp8+RVmvEdmPEoMpCwyVidrZAgiz5ShFnoT75z9zf5ei
 dJEdiy5Z7WsxoDdMwCHQCk7uhP9Hledk89oECRRoNT3Qpm3Yn0ePy8SgB3H8QFaZhA4q
 BMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731093032; x=1731697832;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=At9m5rzWH99Iv6qvPLaYCajHW0bxi1ZNylBU9lm8qmU=;
 b=ASCr4RQfwS4kBwZIapwBU11OpBxt0fpk6nbcoOwhY1KGEJdoZyo6/nd0XzJg+ieYSx
 xfWYTy3xISjxdxhfay+H3fJKNehIPLjbWlIXe00nfERGo7HWSkX3Aa5Ab1j6sukdXzEF
 lrJyd6ZFhBRbaxBkJ9XXqR2p4hUtEnlajCGcwUb3rhUlJ6YcuzayEvdVlL/nexYvwAFC
 rB5kRkHSTeTXwD0/b79lUFKPWmOjYWQ4WaFSOsoz/OckmhJtm/SGvv435dSD7n7JkIWG
 eF4cEX24D6ljMk89DKcdiWz1gDYoLgUxh7sh/HGOFy54PKrIZgIL+j7zUF2+Fz2uz0+o
 3qKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI6H62AhUUu/0eH5PZ9g5VixwZYIW3HhY91CLBouaaUYty/htz3qRGWURLZXzxWZd1k59HtnyJDg==@nongnu.org
X-Gm-Message-State: AOJu0YwcpNIFSxQi7k5rnm0kXgktmiCjqw2Du1xIuLpiIymjePvdKAcp
 jwL8+y6J/oOuqxT0BT+5bNrAnIvy4i1051AiaJZT/75PIjf28JHx/n1KDcPSoOvb+r6Sd/Blwg9
 pWA==
X-Received: from roqueh.c.googlers.com ([fda3:e722:ac3:cc00:4e:3bc9:ac1c:1ab])
 (user=roqueh job=sendgmr) by 2002:a81:a806:0:b0:6e2:b263:103f with
 SMTP id
 00721157ae682-6eaddc25bb2mr451637b3.0.1731093031707; Fri, 08 Nov 2024
 11:10:31 -0800 (PST)
Date: Fri,  8 Nov 2024 19:10:22 +0000
In-Reply-To: <20241108191024.2931097-1-roqueh@google.com>
Mime-Version: 1.0
References: <20241108191024.2931097-1-roqueh@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108191024.2931097-2-roqueh@google.com>
Subject: [PATCH 1/3] hw/watchdog/cmsdk_apb_watchdog: Fix INTEN issues
From: Roque Arcudia Hernandez <roqueh@google.com>
To: peter.maydell@linaro.org, farosas@suse.de, lvivier@redhat.com, 
 slongfield@google.com, komlodi@google.com, pbonzini@redhat.com, 
 venture@google.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Roque Arcudia Hernandez <roqueh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3J2IuZwYKCOQXUWaKNMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--roqueh.bounces.google.com;
 helo=mail-yw1-x114a.google.com
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
X-TUID: B3Mb+72H5d2B

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
 hw/watchdog/cmsdk-apb-watchdog.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
index 7ad46f9410..e6ddc0a53b 100644
--- a/hw/watchdog/cmsdk-apb-watchdog.c
+++ b/hw/watchdog/cmsdk-apb-watchdog.c
@@ -202,10 +202,10 @@ static void cmsdk_apb_watchdog_write(void *opaque, hwaddr offset,
          */
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
@@ -215,8 +215,25 @@ static void cmsdk_apb_watchdog_write(void *opaque, hwaddr offset,
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
@@ -305,8 +322,14 @@ static void cmsdk_apb_watchdog_reset(DeviceState *dev)
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
2.47.0.277.g8800431eea-goog

