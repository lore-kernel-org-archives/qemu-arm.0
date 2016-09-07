Received: by 10.25.87.130 with SMTP id l124csp311010lfb;
        Wed, 7 Sep 2016 06:30:02 -0700 (PDT)
X-Received: by 10.200.52.102 with SMTP id v35mr21290763qtb.5.1473255002701;
        Wed, 07 Sep 2016 06:30:02 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37si24999110qty.156.2016.09.07.06.30.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 06:30:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhcvS-00081L-2M
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 09:30:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp8-0001dO-7B
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp6-0005jP-7i
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:29 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36444)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhcp6-0005j5-0X; Wed, 07 Sep 2016 09:23:28 -0400
Received: by mail-lf0-x242.google.com with SMTP id j41so826386lfi.3;
	Wed, 07 Sep 2016 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=PP9zossZ/X/FGxoQZJ7W4iBHtnL03Q4LZXNIGsm1FN8=;
	b=nJqPd0pBy4NFrPy2nhWGjtcV6GqV2+ZExSUIR1Wq0jAokfU/fIVrdwkbZLPzkV5Zl9
	STKW4SA3cUW4MvUoQRfuPSnr3e2Xo2uqBsqPfdoihS4DBMfBm/aNI3KOPQwJnu536uV5
	oHMfhQANb/WAjYcYpxgYSi7ko7JBQZ3jfVNV5G59icjaf+G2aEQnt052sDsjtfztPAm/
	7EWk0JqX/KUsYKtUcWpyoZfbjxAnHSev+u9VeGNLOoDrdEBBYWwe9eKhDYoyrrH5ORTG
	lV5HfJeMugxDS6cqqO75Jc6A6OmjpdkMS7Muu8Kd7f4kYk5/Wagi6y6vOjweCPVmTeji
	k0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=PP9zossZ/X/FGxoQZJ7W4iBHtnL03Q4LZXNIGsm1FN8=;
	b=FWjaBzSNyA0n23STvkD90WL3LDI08ykw2gL9cy30KBRIJtCy84Rv3JtyJPI9nCc0jr
	c5w6q7GfWNbBW9cwNPK85GPhFAiZBpjNsxafFzeROi5OgLsEYPJtP105Qp+EhBeQnTHg
	Ur3Hi4qw72PlM0NPxAXo5nbxo1pXR8izX+Fxzr00h6YHf0rZt1Shqvn93L1jhHmz5Ubd
	sklJRZMoWpwi0y5zvpdPGnLjvksR8sBnX57xtnwQ4PmHclWdtux+NFgDwrI2aJHDs3gv
	NXjnKuVb5ajzk6DzznqbjX2MiF8BZ2ihrDkDt9EIvE6FLjbg27174n+Lxw/0NcSAbht3
	ATSA==
X-Gm-Message-State: AE9vXwPOYcCecD8102YPT3ibGUv1gM7uy4DZgaSoTos4gb1MkRgjs2cDBELypVtQ9Y0AKg==
X-Received: by 10.25.158.140 with SMTP id h134mr28528lfe.0.1473254607250;
	Wed, 07 Sep 2016 06:23:27 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17])
	by smtp.gmail.com with ESMTPSA id h29sm11375lfi.18.2016.09.07.06.23.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 06:23:26 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Wed,  7 Sep 2016 16:22:24 +0300
Message-Id: <492e22e91b58c2d7092a95f4140222c266b5534d.1473252818.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-devel] [PATCH v16 13/16] hw/ptimer: Add "no counter round
 down" policy
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7WeDrs0dXqbX

For most of the timers counter starts to decrement after first period
expires. Due to rounding down performed by the ptimer_get_count, it returns
counter - 1 for the running timer, so that for the ptimer user it looks
like counter gets decremented immediately after running the timer. Add "no
counter round down" policy that provides correct behaviour for those timers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c    | 9 +++++++--
 include/hw/ptimer.h | 4 ++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index f7f5538..88a1fe2 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -119,11 +119,14 @@ static void ptimer_tick(void *opaque)
 
 uint64_t ptimer_get_count(ptimer_state *s)
 {
+    bool no_round_down =
+                !!(s->policy_mask & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
     uint64_t counter;
 
     if (s->enabled && s->delta != 0) {
         int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         int64_t next = s->next_event;
+        int64_t last = s->last_event;
         bool expired = (now - next >= 0);
         bool oneshot = (s->enabled == 2);
 
@@ -131,7 +134,9 @@ uint64_t ptimer_get_count(ptimer_state *s)
         if (expired) {
             /* Prevent timer underflowing if it should already have
                triggered.  */
-            counter = 0;
+            counter = no_round_down ? 1 : 0;
+        } else if (now == last && no_round_down) {
+            counter = s->delta;
         } else {
             uint64_t rem;
             uint64_t div;
@@ -174,7 +179,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
                 if ((uint32_t)(period_frac << shift))
                     div += 1;
             }
-            counter = rem / div;
+            counter = rem / div + (no_round_down ? 1 : 0);
 
             if (!oneshot && s->delta == s->limit) {
                 /* Before wrapping around, timer should stay with counter = 0
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 131fed1..5ce3270 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -49,6 +49,10 @@
 /* Starting to run with/setting counter = 0 won't re-load counter.  */
 #define PTIMER_POLICY_NO_IMMEDIATE_RELOAD   (1 << 3)
 
+/* Make counter value of the running timer represent the actual value and
+ * not the one less.  */
+#define PTIMER_POLICY_NO_COUNTER_ROUND_DOWN (1 << 4)
+
 /* ptimer.c */
 typedef struct ptimer_state ptimer_state;
 typedef void (*ptimer_cb)(void *opaque);
-- 
2.9.3

