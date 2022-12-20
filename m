Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4545826ejb;
        Tue, 20 Dec 2022 10:18:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7JyRx2Tdm65362BnwGHIOSr9BvJoLYdYDu+yo23xPbiILzkaVAIhlWqE4BKiMsiFrJEjEJ
X-Received: by 2002:a67:f50d:0:b0:3b1:57c3:7181 with SMTP id u13-20020a67f50d000000b003b157c37181mr23386930vsn.21.1671560317791;
        Tue, 20 Dec 2022 10:18:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671560317; cv=none;
        d=google.com; s=arc-20160816;
        b=JN/LwbhaYdfIK4wAa+lXJrVfRYW3mdo3pGwxSBnowhcb67orVWyKgDxNHYmK4pYXJx
         ASG8Zma8ZyeZqF2gkgKUgzgOv56K6LGLK49oIcTxx+GKIJ5g3B4/TsD5TMT5Shy5kupA
         +vCcvAfJR0FyxjI+Ev1BDj91zO51YXhR3tRI7o+ZjoirYYxq9s6yCLgJZGrOETU0lCBH
         Agw5HvCtl2uTdPZ8lFSp/Saeb26BkNReVVT10qK2xJjvSrO60D21UG6IW21S0xCr6Ubw
         0h0LlDpz6IrxPYWwKkFqefI/CQRIEe7HO2+9ZRSbTGP+JvzOdjSdaFC8MqfnrXhx8dCH
         H5BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=jWaWLcGTx5/1SaX+b0hHpJDM9aqIMU7RDtjNLxtDa4w=;
        b=AL9iKTb5jvOEiz20d4rYRbulCvv5lNAh9svkkrR0QhsSij8G9gUOKlRWRbAR86uWX1
         IfrAVFRUdGmeJWv7NHJfERzrmmJ3vQl0rruLSNfHyHWsAtlPxtzzK3Ao5BgCYJg9OmZ0
         MSFylrqr/rpkKCkoDcZsocJlHU8Aru5InVFjdEn0aomKI8lfNtAjdRbSjJYOXZ7ytwaM
         Wu5PtSGG519J+spv723wt2Dl1Vxk0OX3tzpN6rjhNw3q0b9tSZqtcn3Wws6Rmy/8fUzA
         NlWwsE9nNwJB3diCNeBIlIsbglVpEzvhIO773gUWHBm5echYg9vc/yijUS0/CZJt/w8j
         8aJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020a05620a284900b006fbb7fd46fesi5558867qkp.748.2022.12.20.10.18.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 10:18:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7gOv-0001KX-9w; Tue, 20 Dec 2022 12:27:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7gOs-0001KK-NO; Tue, 20 Dec 2022 12:27:34 -0500
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7gOq-00056G-9S; Tue, 20 Dec 2022 12:27:34 -0500
Received: (Authenticated sender: jcd@tribudubois.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 8D48A6000B;
 Tue, 20 Dec 2022 17:27:28 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm@nongnu.org
Subject: [PATCH] Fix i.MX GPT timers for i.MX6UL and i.MX7 processors
Date: Tue, 20 Dec 2022 18:27:17 +0100
Message-ID: <cover.1671548388.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4b98:dc4:8::223;
 envelope-from=jcd@tribudubois.net; helo=relay3-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: rwHUHt8oizL3
Message-ID: <20221220172717.VUNbzimhoC7fGBhKxrFIzGwNMZx6RWcjxXXeWbJBfAA@z>

This patch series allow GPT timers to be used on Qemu emulated i.MX7.

In particular it allows GPT timer to raise interrupts in i.MX7 processor
and supports some of the fixed frequency clocks.

Note: CCM generated clock sources will be added with a later patch.

This also brings some fixes to the i.MX6UL GPT timer as its clock sources
differ slightly from the i.MX7 version.

Tested by running µCOS application on i.MX7D emulated processor. µCOS
is using the GPT timer as its tick source.

Jean-Christophe Dubois (3):
  i.MX7D: Connect GPT timers to IRQ
  i.MX7D: Compute clock frequency for the fixed frequency clocks.
  i.MX6UL: Add a specific GPT timer instance for the i.MX6UL

 hw/arm/fsl-imx6ul.c        |  2 +-
 hw/arm/fsl-imx7.c          | 10 ++++++++
 hw/misc/imx6ul_ccm.c       |  6 -----
 hw/misc/imx7_ccm.c         | 49 +++++++++++++++++++++++++++++++-------
 hw/timer/imx_gpt.c         | 25 +++++++++++++++++++
 include/hw/arm/fsl-imx7.h  |  5 ++++
 include/hw/timer/imx_gpt.h |  1 +
 7 files changed, 82 insertions(+), 16 deletions(-)

-- 
2.34.1

