Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp426396ejb;
        Wed, 5 Apr 2023 07:49:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZYP/WAFQKpQPz/SUNvNl2OhS9LN7VxJz/U46hNg+1XWhIAjVPBSqOy44AFOBwFNCIkh06t
X-Received: by 2002:a05:622a:1116:b0:3d5:3a1b:61c8 with SMTP id e22-20020a05622a111600b003d53a1b61c8mr5096038qty.44.1680706140561;
        Wed, 05 Apr 2023 07:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680706140; cv=none;
        d=google.com; s=arc-20160816;
        b=EVWY7FR0Ppb8zPDULXYaWFLYONefcLAZSWxCVRBcrmNqctVhRD29whmIOUDbYNZ99+
         GgUZB0Mx0ZcmjqWSWkpwS7EsSuXqDffawgjVUUQ/bAs74S74wY1orwDS8TRg02pk0X5t
         GFtt4B9B7rlEzu0PMLqDZcTJP+5YeifIW1nqJyV3WCPrp56WqSUR9xmdokEsg6ebz1g9
         83YvYujWVBqfC7HqRsafX9WpaQf8O4DZBjbrzcuhic7lhWIf1DP1l1lv42wX+y5I1Gdo
         /RcUnDDU2mvrdHZX/rWMRctvRFaGbS9qHubUsqah9IQA78Lfd65PrKN0jNUoidbUteJC
         Us+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=99bv911lpH1vvsfwFSruCEc5zE7Hq4j9AjSQnhhiQOY=;
        b=YmkrMt9soiFbDEou/WH6mh+uMSqWq+rd2uY96kHD9v92TyNc8jveB6l582v7i3SHSS
         00h4j9VJj8efUo26rEp905XXsaDNpvSjb2ri+cNWw/4wnXe+nJCcCs6spy1A41CKQ+T/
         7VQKCg2ybwHy0kqLLk8p3j/HweIOEHJ6Sdsoni8H15EOW+lyFTtoxvchnJFUqRt51PvJ
         NcotozrJRONtPGGlnHdFI2YmjgPA+OlnJMscbJm2wjMcgVGUCc/vqrFBOsfPohPxUoll
         CGdF8be9PXGhyuuJxRPkd6Ir5axRLvlaiwuckFnj/v/cYfdx9nWgSEb6XG84JZWjGDyI
         8hkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a142-20020ae9e894000000b007464262b8b6si9236520qkg.636.2023.04.05.07.49.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Apr 2023 07:49:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk4RJ-0005bo-NM; Wed, 05 Apr 2023 10:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pk4RI-0005ae-9p; Wed, 05 Apr 2023 10:48:44 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pk4RF-0005S4-Mv; Wed, 05 Apr 2023 10:48:44 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 5FD5411F092;
 Wed,  5 Apr 2023 14:48:38 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Tue, 04 Apr 2023 18:46:32 +0200
Subject: [PATCH qemu.git 2/2] hw/timer/imx_epit: fix limit check
Message-ID: <168070611775.20412.2883242077302841473-2@git.sr.ht>
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
X-TUID: lSlD4/AxGZGX

From: Axel Heider <axel.heider@hensoldt.net>

Fix the limit check. If the limit is less than the compare value,
the timer can never reach this value, thus it will never fire.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1491

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 0821c62cd1..640e4399c2 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -179,7 +179,7 @@ static void imx_epit_update_compare_timer(IMXEPITState *s)
          * the compare value. Otherwise it may fire at most once in the
          * current round.
          */
-        is_oneshot = (limit >= s->cmp);
+        is_oneshot = (limit < s->cmp);
         if (counter >= s->cmp) {
             /* The compare timer fires in the current round. */
             counter -= s->cmp;
-- 
2.38.4
