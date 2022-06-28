Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3319189lft;
        Tue, 28 Jun 2022 08:48:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vW4c98jb0p23G3XTsILLKAcR8nIYouw0Gncxdcc28Xcpb7MfZiqXG+1kSo5E03bOXP4j16
X-Received: by 2002:a05:622a:1ba3:b0:305:15b5:8758 with SMTP id bp35-20020a05622a1ba300b0030515b58758mr14073846qtb.10.1656431326600;
        Tue, 28 Jun 2022 08:48:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656431326; cv=none;
        d=google.com; s=arc-20160816;
        b=AKRtD3H0bdOTBEUNc6ctYy1GVKhkXKtEWX6JUeqEQgrsiPeOQcgs1AIOUm9vyqUiP+
         S/r1kWRUlAou3WKECrO6zLBR3cg1NKG4MzoHJ5xIBjqdlpM2E54yDnyumPKHVXWto5dE
         t/C5mHKDze8r8h8F14ca8zM/TvPfFlXItZavBl7XkKEWHrV+/J9fkCFnYIePRAi2XePj
         BGjbIKF5QhDa99RP4bXZdPJWDEqj0JI9Dhr4dR6bsmfoWMga2xIJ4wJq5EaTHIlIk0wZ
         sViPsDbG7PLRIzF9HzxR95Sp+7JRi2ryXzQr2VVfWX9h/OpOTNRNhLJajaLzDdGsKkUB
         vE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=6VpY1W+ZgwrEYyt2ucjOUINkOzhIamI7xgFt3yI4Pts=;
        b=ZRrCdm2PlJrRa9ShMWeUS9uQINUUac1lvKvi9Fohx64sZcs0QemKFGOTqKKybtHmqc
         wx4Mc8CnbyPUuzlnuNpdwxj2LNLAG3kS514Usbz8cOeX1WweVtWIMMJPTuM2ntT8o5vK
         OMir+Oe2zmk1v6aYHt/F8TvS/+z5YL1PiVRADdcdZHyYdlu6Jku2bjmyurm3J1WlZjaD
         7aSc+Nu0uuUr43qR96lcFkzugNrmVgStm4eT1ZPHqhd/Nbd8WUGhkOIc8CRr7dbd8SV3
         nAmUnkw2Chdi/FMoimTnfw+S73dk5nysNlyfIynRW1d2rhGjOoyryhagmHHIfTYxqSpy
         gxtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22-20020ac85f96000000b00304e9cc7298si8516509qta.703.2022.06.28.08.48.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 08:48:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6DSH-0003it-Vg
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 11:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xpXT=XD=kaod.org=clg@ozlabs.org>)
 id 1o6DRX-0003hW-Bm; Tue, 28 Jun 2022 11:47:59 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:41769
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xpXT=XD=kaod.org=clg@ozlabs.org>)
 id 1o6DRU-0001nj-Mv; Tue, 28 Jun 2022 11:47:59 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LXTWR1psSz4xXg;
 Wed, 29 Jun 2022 01:47:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LXTWN25j0z4xR1;
 Wed, 29 Jun 2022 01:47:44 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/3] aspeed: small cleanups 
Date: Tue, 28 Jun 2022 17:47:37 +0200
Message-Id: <20220628154740.1117349-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=xpXT=XD=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: juS+2dzcGMgP

Hello,

I was preparing a PR and I realized that these small patches had never
seen the light. Here they are.

Thanks,

C.

Cédric Le Goater (2):
  aspeed/scu: Add trace events for read ops
  aspeed/i2c: Change trace event for NORMAL_STOP states

Joel Stanley (1):
  aspeed: sbc: Allow per-machine settings

 include/hw/misc/aspeed_sbc.h | 13 ++++++++++++
 hw/i2c/aspeed_i2c.c          |  2 +-
 hw/misc/aspeed_sbc.c         | 41 ++++++++++++++++++++++++++++++++++--
 hw/misc/aspeed_scu.c         |  2 ++
 hw/misc/trace-events         |  1 +
 5 files changed, 56 insertions(+), 3 deletions(-)

-- 
2.35.3

