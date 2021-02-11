Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2227521lfc;
        Thu, 11 Feb 2021 04:43:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlWq/QlmRrI3gPHUygKoQRhClKgVOHMhE0AlCx3huZTfOuKg1NprssGJom7Pp1CWJDHtTY
X-Received: by 2002:a25:324b:: with SMTP id y72mr9981198yby.233.1613047438190;
        Thu, 11 Feb 2021 04:43:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613047438; cv=none;
        d=google.com; s=arc-20160816;
        b=cgyUbJ0lmgMoEosnBJWIVco45g2BhsxLkz1PVX8BcY6qXoD0v1XjGlIIhrHoeFZVOE
         IixL+IgD2O1pV6J7i+20pQ576Yg9VDULZx8n5Er1rdS0LQEa/UGSsPqEvjBSQ21CWfv1
         mLdawexEgDX6AHcoIkZxGBhT0KdQ4SkyaECJk8DA6BCB0btWu/HXGHUceUTnwRp5K7P6
         kx2M3o2pCDh3GSBl0ckBu7459LVtFavi3khWWFC1t7RfqYv+VH711O5T4yi3OuwWrfJW
         AfOT2q/gD0rOObIX2omjsNjjDQ+AyW/ErXJ6tqQ52MJgQrvBjs1g3h6Ba0+PykCKLCwZ
         CUWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=9wJY5jYF3f5w3AxB9/NBTbaqqDz5tmuNC04Oa18k9Qc=;
        b=lEXee04kyXhv5tKaGvD1TGIUro2f/zI8odqeM4HNkHPLh3UC18SZ9nErhRLA2l4AV2
         Tn941eANHD/+lAgUfB62H0lBMTqLaHLtpivUrGgu9x6oDxZtnZ3mhN1+OGyapLjvCMcu
         T7sP1P2y3Lqn4dhzu8q158AfKC0zqFJBDevqrUHzgiIaNK5rk/hydrlPGQ3LcGL2eZ8s
         bfhd5sJzE9Xdgpg4B/16F6FAu6HaPeHBUYAWf1L9HL1LdmUUQpmuJIXinmJMK5bzgMUl
         TRJMLxpdjUsKbOjbUOjS/YWb52jwdZJRN2Kdqk4+oLBmZGnozLPvJnqe9U8uWSgjc/CP
         igRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14si5087907ybi.213.2021.02.11.04.43.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 04:43:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lABK9-00038Y-Jj
	for alex.bennee@linaro.org; Thu, 11 Feb 2021 07:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lABDM-0005KZ-D7; Thu, 11 Feb 2021 07:36:56 -0500
Received: from muminek.juszkiewicz.com.pl ([2001:41d0:1:43dd::1]:38590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lABDH-0007aB-9f; Thu, 11 Feb 2021 07:36:56 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 7B79326026A;
 Thu, 11 Feb 2021 13:36:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yVlK5AhssGWo; Thu, 11 Feb 2021 13:36:45 +0100 (CET)
Received: from puchatek.lan (89-67-26-161.dynamic.chello.pl [89.67.26.161])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id C5E7E2600B6;
 Thu, 11 Feb 2021 13:36:44 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-arm@nongnu.org
Subject: [PATCH 1/2] sbsa-ref: remove cortex-a53 from list of supported cpus
Date: Thu, 11 Feb 2021 13:36:37 +0100
Message-Id: <20210211123638.1820482-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210211122022.1811362-1-marcin.juszkiewicz@linaro.org>
References: <20210211122022.1811362-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2001:41d0:1:43dd::1;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_SOFTFAIL=0.665,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Rados=C5=82aw=20Biernacki?= <rad@semihalf.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aaZOIhgRaYEX

Cortex-A53 supports 40bits of address space. sbsa-ref's memory starts
above this limit.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 1 -
 1 file changed, 1 deletion(-)

diff --git hw/arm/sbsa-ref.c hw/arm/sbsa-ref.c
index 9f70735153..276243d122 100644
--- hw/arm/sbsa-ref.c
+++ hw/arm/sbsa-ref.c
@@ -145,7 +145,6 @@ static const int sbsa_ref_irqmap[] = {
 };
 
 static const char * const valid_cpus[] = {
-    ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
 };
-- 
2.29.2

