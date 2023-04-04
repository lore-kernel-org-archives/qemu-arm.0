Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp426645ejb;
        Wed, 5 Apr 2023 07:49:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350YwTXb/v7+kctOMBV546cVGzPe2+EEkyjhJGyum1ylDJqthSuPGmRmWcWcl97Bvx1eYnq9i
X-Received: by 2002:a05:622a:100d:b0:3e4:e4e4:ec1 with SMTP id d13-20020a05622a100d00b003e4e4e40ec1mr5431814qte.64.1680706165921;
        Wed, 05 Apr 2023 07:49:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680706165; cv=none;
        d=google.com; s=arc-20160816;
        b=n/hFmutnVZwLJDbO/xGBwKhdkK4SVUTuEjdHUVQY0TMfXFH3M8QSI04rOHf+9Ziyfu
         FzGtcBrO6KKImkH8E3PMWRDl6elgJ6rmvMLI7zFiqgRrU883yEo3UBXjxpq35vhKq3i0
         6DDRXLxfjA/aqu26nusZSyKUF6u/76CiACuAUrNU5kV4m2mMsfT6QAcduaUVsEf5pLE7
         TykHjti6P4FGv8pxF7miLD6sP0AsQyytdO3iQsB7RSSN/EdnJH1Ro7wKmyT5rxc/l6Ro
         acsRcmIj2DNFiD66BYFoHyT2WiHMsPW/sqMlM7VLvy5Z7f7LfRSXDESAE+CNFpfaDZfS
         3RyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=9UsBWSKYHVC9srY/V6BGzuEqEbO1xsJCdqsxvOfjl08=;
        b=O9xcwtg67IHC4tgY/umD5feZj6SVhfUrnjivrynwyipqx3kLawTWF+NLqRuTGHamsB
         ZA3A4QDvyHgsEHBlSk5SEtBE2BndJx4BeRI1BOb/EKzevbbvpE0J8PDcXK520mIqXS4H
         an8kORqoZhdEJe1S2N7vLgUrqV2eK8JEhNKrMo1R3qx7BSYbqW2phcWAhTV5pK2t+vb+
         NPp33E0vJVzX/sbJ80CVZps9D0VqUl0oeBfkD0aC+ZLEyQxzWYnsaFFdfoX+dxhh3uJk
         BdFXH5kx0IY8RkSay54LyGETmpTvarIQveW7q0+IEiScb4IygXfXbnQHy+P9X+OERI7d
         US2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020a05620a0f0300b00745b81d4878si10422558qkl.661.2023.04.05.07.49.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Apr 2023 07:49:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk4RJ-0005b9-2r; Wed, 05 Apr 2023 10:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pk4RH-0005a1-3v; Wed, 05 Apr 2023 10:48:43 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pk4RF-0005S3-M0; Wed, 05 Apr 2023 10:48:42 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 3305611F030;
 Wed,  5 Apr 2023 14:48:38 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Tue, 04 Apr 2023 18:39:18 +0200
Subject: [PATCH qemu.git 1/2] hw/timer/imx_epit: don't shadow variable
Message-ID: <168070611775.20412.2883242077302841473-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <168070611775.20412.2883242077302841473-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: ~axelheider <axelheider@gmx.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e7gcZlH8WDhV

From: Axel Heider <axel.heider@hensoldt.net>

Fix issue reported by Coverity.

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 3a869782bc..0821c62cd1 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -179,7 +179,7 @@ static void imx_epit_update_compare_timer(IMXEPITState *s)
          * the compare value. Otherwise it may fire at most once in the
          * current round.
          */
-        bool is_oneshot = (limit >= s->cmp);
+        is_oneshot = (limit >= s->cmp);
         if (counter >= s->cmp) {
             /* The compare timer fires in the current round. */
             counter -= s->cmp;
-- 
2.38.4

