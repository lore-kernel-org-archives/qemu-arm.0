Received: by 10.223.172.38 with SMTP id v35csp7466229wrc;
        Tue, 12 Sep 2017 11:15:50 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAYUDLHvh5qCCFghOCFN87mn+7AY1BGftBesHFkP5YU29HH8YQ3YL/rfC8rUr3DQ3xzooEy
X-Received: by 10.55.144.69 with SMTP id s66mr22128641qkd.111.1505240150469;
        Tue, 12 Sep 2017 11:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505240150; cv=none;
        d=google.com; s=arc-20160816;
        b=EQQfiuEukj7uxxR7UAQmNxM59s1a0JLvRinWZkfDohQ5PWD7q/6nWsYRaJ0VKKHyTW
         swYf+f5A82bD3x15aJF8zBSBmWS+Ce5dijVlxcfr6zZJLu3ZawmBsJ/RY93P9ABhTTv2
         aTaPIi/cqNkn6dx/4OOd2+hDYw0rqUJXuGIKjKO4ll0aOW9T3FVTzU7nqamIL+wWn9yk
         4uP59TMf7F42/WeAhRSELV9bNMv/JTWMwDqHAHDQEjh9Ykz0xodIouQFmfq6ONuMrRUX
         8IOuGK3SvEpWWzCu87MceqJpiiEQdjkSIc17Zu/wTX0kx2rtCOUkLt8RcxdCTgRaQRri
         K/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=stY5Ps6HXs3obf3PcYxE3USHO9aFc13HjVy0YFrAprw=;
        b=jCUrei+V6zvM9cVCBYpdFuMt/E/nLYScWlXEHgeKU8I/eWF+nAxO/LvNao/M04Pgu2
         M0SARZHX0O38s+R/O1PH1VJVrd+/P8U0f9s/xcZA3g8VUEDmsY+nS0349gaN3pcBM1I8
         3+pPWqR9kxhL9HOxSva9cPP/liBvWwrTadTcxJ+Z/iKGYeaAm9LT35MGnMvb7nyz4GYD
         mxBUVkb0ndFuj094nrwRxFivpfDus4V502fw9hcdkCqoS0qFCY7+464IJ5qZgco0plxW
         5TncLcbqHSsQYMVpMtKX5Y17Q7/pVGiNYX9hHrbtcOFxT9FTHNuq5/Ss2lMJRFeYwRRd
         zDkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n70si12670948qkl.107.2017.09.12.11.15.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 11:15:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37955 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drpiu-0004nO-8R
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 14:15:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgy-0003Nb-8m
	for qemu-devel@nongnu.org; Tue, 12 Sep 2017 14:13:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgx-0006OM-3M
	for qemu-devel@nongnu.org; Tue, 12 Sep 2017 14:13:48 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37292)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drpgu-0006Ln-FK; Tue, 12 Sep 2017 14:13:44 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drpgt-00014o-Hz; Tue, 12 Sep 2017 19:13:43 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 19:13:53 +0100
Message-Id: <1505240046-11454-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 06/19] nvic: Make ICSR.RETTOBASE handle banked
 exceptions
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ksuUq+QiQ95S

Update the code in nvic_rettobase() so that it checks the
sec_vectors[] array as well as the vectors[] array if needed.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 585b1a7..edaf60c 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -84,9 +84,12 @@ static int nvic_pending_prio(NVICState *s)
 static bool nvic_rettobase(NVICState *s)
 {
     int irq, nhand = 0;
+    bool check_sec = arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY);
 
     for (irq = ARMV7M_EXCP_RESET; irq < s->num_irq; irq++) {
-        if (s->vectors[irq].active) {
+        if (s->vectors[irq].active ||
+            (check_sec && irq < NVIC_INTERNAL_VECTORS &&
+             s->sec_vectors[irq].active)) {
             nhand++;
             if (nhand == 2) {
                 return 0;
-- 
2.7.4

