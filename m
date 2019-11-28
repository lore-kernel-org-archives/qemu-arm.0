Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp7130060lfc;
        Wed, 27 Nov 2019 21:44:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqz1r2GH7rPqQBRF4Bmk/+NF7Uq2W6MlfTfDCqQXzohKVKm6ON10VBb7nbJpu+22NbRuJcG/
X-Received: by 2002:a17:906:af5a:: with SMTP id ly26mr54001667ejb.252.1574919866179;
        Wed, 27 Nov 2019 21:44:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574919866; cv=none;
        d=google.com; s=arc-20160816;
        b=sr48cNO4LMqKoJVprJWfUB6r0ZTeZnNacMyrvcu/H0cmU8V8f/yZnz9Q8MvMRAndBh
         RTIj6hqoQH2knSmYtDEZRXGcsBBgTiMrAsYTAP7qpLFDhlEBZKO4qAfltqy3FpdIxnUc
         vSl9UR6i7z3Dcqr/9d7xg2yjHoS2JMNef1G4o5rOEc/2kfjRg3KPdMarluEFD/D/Orc/
         zGHg/pi6KdkJj/50jlUwt07xCMJEuzI4aENGLGcJl+54PJ5xG4e8aSXt3IOKiF7/uauL
         eNyS9ihfcCv2x4Nv1p+ksECfXTVmtijvfHF2cL0bVSD8xl+TZYNDA4Cx+6Xe6RwLO5Bg
         VBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature:dkim-signature;
        bh=01ZFTCIyyQzgAHksv3qc3gSyHc/JhAe1EDSU5BMpnWU=;
        b=GePBzI4AmCcv5DqbsWtbj70omytZQlwi+JRL00VJSKtFOvD8/MqL3HHKoGTwsTtuIa
         opQqc8gluYjJpKPj4jyJOH6p6jznuP9299SUV8XiIYGHlDay8AYioT1JPkglflmTHCd5
         JQEEeEz+pqyr6zF1vzZf/P/WVPMJJQA+lu2cDD63Nxf68dIWzE8KtYSXBsK3dYvQGfTl
         uO8ZgCNJcsjHzYFwqm2bPMRG4QNAmH1eGkiRxK69wAP83zHHcs2KjzPpD9A2tXCUTQWh
         5myIC4RZ+DSj9YBhLC/meHNY1xww6s7eTVcl7SzqKFRaOpE+7916xVJoTmpGU5bpiOO9
         fZqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=HJqxTCCX;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b="GCiliY/P";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16si11246875ejc.277.2019.11.27.21.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 21:44:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=HJqxTCCX;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b="GCiliY/P";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iaCbI-0006i2-Ou
	for alex.bennee@linaro.org; Thu, 28 Nov 2019 00:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47653)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1iaCb3-0006hE-Pm
 for qemu-arm@nongnu.org; Thu, 28 Nov 2019 00:44:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1iaCb2-0001hH-KO
 for qemu-arm@nongnu.org; Thu, 28 Nov 2019 00:44:09 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:34249)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1iaCb2-0001gJ-AQ; Thu, 28 Nov 2019 00:44:08 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 983D622756;
 Thu, 28 Nov 2019 00:44:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 28 Nov 2019 00:44:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=01ZFTCIyyQzgA
 Hksv3qc3gSyHc/JhAe1EDSU5BMpnWU=; b=HJqxTCCX9R7O2BHVHYRR+lj4FRkVS
 YAgftqKHdOLsP0PRQjbhgfkdEGmAqrxHHhQxETD5N/Ss5+oVtHCDktRgYDUirQBB
 bEnsItxXxNednuEFwYF+hdSpak2vuAOmI0F81fm1BD43BW9YS+aOcDYsErgzW8V1
 DvAKsRX7nH1QUqSzwHDD7e5BjqqaQcmiKsKXRbxLm47JK4i13U/+gKIGjaK2rqTV
 POzz4o1QuCEUwopeXUXgEw2JZ4lbQkXXB1tpmZDKOiH8RLR+wfAyImnpIgBN+6vj
 zVY5olbUYPwjY8gQr5t7LXYlKQmW8dpQ9QEi+959TdthZyR8QjkkEegAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=01ZFTCIyyQzgAHksv3qc3gSyHc/JhAe1EDSU5BMpnWU=; b=GCiliY/P
 zuzRsyTn/ARtM+bUlaouoaGYGlQe74SlpjfMFhrbjfTcX9clELJ50Sdct98ONocu
 APN+q0qdJoqbY4jX2eq9cTevr8YdaNlJTIYHLnlhESx7fzVdYCkhd8wpaldqcyU8
 28sPEWaxbfL2la7LMd2grLoQf8ewB4neXyf8jEEGgeE04csp+XaNZpQf1ctqoe4h
 Hokj5L6UPtYILMyedQCGhkM87ws3WPhdDBzQk9JxD1a09kROM4X+yUUPS54hjwMD
 I+AtYcMbs1wUYKhH9Rit1iqToe7H4Wjr7UpQ/LEnA6jKy1PblvDzWGAPQzJUfin1
 jhmdw2II/9sYDA==
X-ME-Sender: <xms:p17fXelJTa65gH6ptKwuhzmufdQMzOuz-bFfWZhvmykT7fl-5mjZCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeiiedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
 hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
 pedt
X-ME-Proxy: <xmx:p17fXRkEqtTFVdASkoFUysEXbAHtx3t3iDmP-obFmw93idnWX7jyQg>
 <xmx:p17fXfYFjGD9sNY-HP0SxIpOJvNrNau3JFH4NJdEE2q8kMoRNhf2uQ>
 <xmx:p17fXYmMp6sNQz4fanub9o9qklNOGeqqqGk3g4UXt673-dvhw8isCw>
 <xmx:p17fXfw9y1ddQpYAzI9dZPDDqtKKm_rgZoWdCFWpxOJXobnYodiOdg>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3743C8005A;
 Thu, 28 Nov 2019 00:44:04 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH 1/4] target/arm: Remove redundant scaling of nexttick
Date: Thu, 28 Nov 2019 16:15:24 +1030
Message-Id: <20191128054527.25450-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191128054527.25450-1-andrew@aj.id.au>
References: <20191128054527.25450-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 66.111.4.26
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
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, clg@kaod.org,
 joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Azg79WzVWuSo

The corner-case codepath was adjusting nexttick such that overflow
wouldn't occur when timer_mod() scaled the value back up. Remove a use
of GTIMER_SCALE and avoid unnecessary operations by calling
timer_mod_ns() directly.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 target/arm/helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a089fb5a6909..65c4441a3896 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2446,9 +2446,10 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
          * timer expires we will reset the timer for any remaining period.
          */
         if (nexttick > INT64_MAX / GTIMER_SCALE) {
-            nexttick = INT64_MAX / GTIMER_SCALE;
+            timer_mod_ns(cpu->gt_timer[timeridx], INT64_MAX);
+        } else {
+            timer_mod(cpu->gt_timer[timeridx], nexttick);
         }
-        timer_mod(cpu->gt_timer[timeridx], nexttick);
         trace_arm_gt_recalc(timeridx, irqstate, nexttick);
     } else {
         /* Timer disabled: ISTATUS and timer output always clear */
-- 
2.20.1

