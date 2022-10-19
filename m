Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3478862ejn;
        Mon, 24 Oct 2022 10:41:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM48AdZLECShOSR8D6uQ1iFl2Xq4W3n3GuSHLDcrXx69W7uKxUUPlsrtNE3+Eo79HtbI/HpW
X-Received: by 2002:a05:620a:4482:b0:6ee:e6f8:c5a6 with SMTP id x2-20020a05620a448200b006eee6f8c5a6mr23731507qkp.275.1666633305388;
        Mon, 24 Oct 2022 10:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666633305; cv=none;
        d=google.com; s=arc-20160816;
        b=lGJdrDeOnngrMMbypstyM6l7NAaeOCivAn9tihh9v4+q5No09uWW/KO7BFAeKUiQzJ
         m6AAXXoD7lnW1dltdh0HiDb+Z2UZNcmwkqoMug+GapcC9zJBIqifT2REMMujV6YLjze1
         lkEhicWRSsbie2IN7k3FRTl0/ZMlx5B1c0aiRWUUgZQ2Pj3aQlhDZf8ipvZ9axFuQ7ml
         tZ5QlW5x+cLkPQwSVvrYOkekYV960a9MLH84LlRMZJ636hg5QX7ckH8rvS/iUhS6oCyZ
         8dNu+Hu3auftsVprM+Uw9WjYNvbz6no/HQMMu+rpdKKxyA5dd4auBKGgVWxmnzE3+gWq
         q9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:mime-version:subject
         :date:from;
        bh=Uhr1HbXyypNEHEH3bqMnRxLOfFjK2pwMuM1trJ66AHY=;
        b=HCpqd0k7yN73kQbsgSvQgYGxLZP73X1ogXoe2Kh3BwWb24bbTo4Csu7mmEOzYMJ7Cx
         7yLueDmGkuAr7aHQUyE2k8vkp+UfWjf3UdatMhVy3Ao3BPEMC+es1+7dkOJPIyQznV17
         hzf30HAbnNqUKRCAVlw442Sklh1Gt+mSIvtbXwmvSNZN4Wqo2Y9Z1+7jyFmfCGGqf/Nr
         fEm7wiwy7fHWIUGnPQLtQOPBXTha0Z+w1iuYCYyzU5HjEj0qBXiPsIK0fsQYUddg4xxK
         jutzyV0f+VwZ2j3FLQtoPIfmgTZs2mgTwu0cLobRnbGMNo5zdtFjmFFQQgQwsr5IEqlH
         kBkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv22-20020a05622a4a1600b003976b4bee7fsi310961qtb.657.2022.10.24.10.41.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Oct 2022 10:41:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1on0uF-0001XT-3c; Mon, 24 Oct 2022 13:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1on0u9-0001Vc-LL; Mon, 24 Oct 2022 13:06:25 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1on0u7-0000YY-Sl; Mon, 24 Oct 2022 13:06:25 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id AFB7511EF7E;
 Mon, 24 Oct 2022 17:06:21 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Wed, 19 Oct 2022 15:09:50 +0200
Subject: [PATCH qemu.git] target/imx: reload cmp timer outside of the reload
 ptimer transaction
MIME-Version: 1.0
Message-ID: <166663118138.13362.1229967229046092876-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~axelheider <axelheider@gmx.de>
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VrZiD20qvpIE

From: Axel Heider <axel.heider@hensoldt.net>

When running seL4 tests (https://docs.sel4.systems/projects/sel4test)
on the sabrelight platform, the timer tests fail. The arm/imx6 EPIT
timer interrupt does not fire properly, instead of a e.g. second in
can take up to a minute to finally see the interrupt.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1263

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
Fixed the comment style and the commit message.

> Do we also need to change the other places that call
> imx_epit_reload_compare_timer() in the handling of CR
> register writes ? (Those are a little more tricky.)

The current patch fixed the issue we are seeing. I'm not really
an expert on the QEMU code here and still try to understand
all details. Might also be that we never hit the other code paths
in the end.

 hw/timer/imx_epit.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 2bf8c754b2..ec0fa440d7 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -275,10 +275,15 @@ static void imx_epit_write(void *opaque, hwaddr offset,=
 uint64_t value,
             /* If IOVW bit is set then set the timer value */
             ptimer_set_count(s->timer_reload, s->lr);
         }
-
+        /*
+         * Commit the change to s->timer_reload, so it can propagate. Otherw=
ise
+         * the timer interrupt may not fire properly. The commit must happen
+         * before calling imx_epit_reload_compare_timer(), which reads
+         * s->timer_reload internally again.
+         */
+        ptimer_transaction_commit(s->timer_reload);
         imx_epit_reload_compare_timer(s);
         ptimer_transaction_commit(s->timer_cmp);
-        ptimer_transaction_commit(s->timer_reload);
         break;
=20
     case 3: /* CMP */
--=20
2.34.5
