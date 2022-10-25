Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3157037ejx;
        Mon, 7 Nov 2022 08:42:16 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7lw6CBIbuFywG+mMGzA7haMXoY/afQHx8UwAdtnVLIRom67BLJsGQB82KuomN1IuAPtjjz
X-Received: by 2002:ae9:f40c:0:b0:6fa:43b8:44d0 with SMTP id y12-20020ae9f40c000000b006fa43b844d0mr26516017qkl.637.1667839336321;
        Mon, 07 Nov 2022 08:42:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667839336; cv=none;
        d=google.com; s=arc-20160816;
        b=dkNq1g4UFNN4zPJKGVenDPBWEKDBfSreovFYGMaEQLcJ5eG9Th3N7sSl1jOAvoKaJG
         ifXPv1Fmy5HfcKNFshhkgpIhSH6D23vmYN2kEwurcOYWeLCN8jVh0dd7++ZT0VyxK4rc
         3MHnywVYIcs8GS0A+z3Y3sHXMI1SoYr+bL/voeCfk2NvzKKkbzpT59TuIkY0Q5RL3jkL
         ohYRCVcKOku0kjWPqwxCnsG40sPyWkHvF91iVqUInFPxWo7MQDhAPwEPTPShY443o0lI
         4T1ryzxwafJ+eyMs2S01PDHPhf+9Wh9YRTgU/BY7kjEuVRfFc62Yqx1a5QRYmcbDYY7o
         xe9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=R9O1OuBGZjMfJMQdhxvCmUwhnBBXDW/UdeHD6HTk09M=;
        b=d6NDFIEVEwfupFKT+bXPi30QUFrJek/1SXSABHozwwCkrqVpRRUa0Eo2DeTcBAVrya
         gzrleCKnAB1Zcic6YV4Jbtim4Dg8DGpkx4tpDDrMDXDdIKkKdWf9nVTzXO1a3XlmxHTB
         gxzlDQ1IzGGpdXTlDtZJb2Odg7t8KuzMbpZiqd5TEnKIYb7jyD7EK+ZcTAYbkWVl9Dql
         zJfeJugy+PgfPWwJiDG6YO91RJX/Z3swvg3ggrZyaJs4dpvsH9C6nAtfqbKYf/v/Yi7w
         lx7An0LhQd2jAkjQ33X0WADwQ8CvkZla0e52jfDFy2aox+KjO095n2G9nXdM3dOHOPJC
         ur/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dz10-20020a05620a2b8a00b006fa31ff1adesi4647911qkb.352.2022.11.07.08.42.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Nov 2022 08:42:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1os5CQ-00025S-8I; Mon, 07 Nov 2022 11:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CM-00024c-9U; Mon, 07 Nov 2022 11:42:10 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CI-0004qY-K0; Mon, 07 Nov 2022 11:42:08 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id D61ED11F30F;
 Mon,  7 Nov 2022 16:42:04 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Tue, 25 Oct 2022 20:32:30 +0200
Subject: [PATCH qemu.git v2 4/9] hw/timer/imx_epit: software reset clears the
 interrupt
Message-ID: <166783932395.3279.1096141058484230644-4@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166783932395.3279.1096141058484230644-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0aOhVl/bOyoc

From: Axel Heider <axel.heider@hensoldt.net>

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 2e9dae0bc8..5315d9633e 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -94,6 +94,10 @@ static void imx_epit_reset(DeviceState *dev)
     s->lr = EPIT_TIMER_MAX;
     s->cmp = 0;
     s->cnt = 0;
+
+    /* clear the interrupt */
+    qemu_irq_lower(s->irq);
+
     ptimer_transaction_begin(s->timer_cmp);
     ptimer_transaction_begin(s->timer_reload);
     /* stop both timers */
-- 
2.34.5

