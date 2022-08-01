Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp2625835lfg;
        Mon, 1 Aug 2022 09:44:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sBpd6UUtQg0xaMUj1rxpDJRM25+Q7qIfO4GQQ6hwhHo1OpcIkqzqB6amIqbbV6niYr372S
X-Received: by 2002:a05:620a:d96:b0:6a7:9300:2ce1 with SMTP id q22-20020a05620a0d9600b006a793002ce1mr12369155qkl.661.1659372267977;
        Mon, 01 Aug 2022 09:44:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659372267; cv=none;
        d=google.com; s=arc-20160816;
        b=Bzq8Xi3VRrDKdGJvTo1cp2FgEXmOgQIS3AY16uXxv0WTu7LlI396WrhuoOGI/sbtPK
         22/dTEacbPZ0DzIb9UysnrezHiyIm0pHCOjKn3+Pa4+vC8mx0E8G1FVTU1rk3oAtnFOb
         FyROmCXdxG2Sir8g4b/mgDjhvg2czSapRjefUSlbW3AvdlrvYq7R908taSktvecFy+jw
         TiOZnhsPhTqP6vvDnGtAGjXNwQt+x8OaMHyRqXkPd55Hu7g3gNcJ92uMaQJN36O5+CSz
         kxpj0oh9b3mbtXMFIIivfxmaY87HXvanPo2bRWNpdPI8ZTSUOJjbothLCxp9xiIAMYPF
         Ta9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=Z0Y9YdxRlgN25SZAc2/guzYPYCo60u8PwZL8904RgRM=;
        b=mdMUxzSiHbsAaslYd99qkSdczIkR4bUZ1+8h7GGgmS1T6QwKqpDaRVSbitaJurc4AX
         TO19DjzwGZuoKWRWIfikQofaXOPq4nCS1nmlx2W0kzRXI7F8+ce9JOBuakKTsNF8JVpi
         NeEJe69JkQuMeYFb0pxKXhbxhqkwT3GAby3ASJGYb0VYFXdIAdRbrD9ZZzaQVbHDvQFK
         Ef5mGbKGOwHQywYnCVh5tP4zb3NfT9qZ2Td/fjDA1/0m7Kr7VgH7iQGp3ZN6/cGKPelz
         Hpe28zBv2q8rEwKIrufHkWobS6hX0fjnlIrcudyLNQNZeF+SadXmSIFwwo4SifuW+qTn
         1PSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16-20020a05620a0f1000b006b472e047b1si7703450qkl.641.2022.08.01.09.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Aug 2022 09:44:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oIYWp-0006Gt-6A
	for alex.bennee@linaro.org; Mon, 01 Aug 2022 12:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIYJF-00053J-Cj; Mon, 01 Aug 2022 12:30:25 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:48247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=LBbo=YF=kaod.org=clg@ozlabs.org>)
 id 1oIYJ1-0006t2-Tn; Mon, 01 Aug 2022 12:30:25 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LxNrX6gvLz4x1d;
 Tue,  2 Aug 2022 02:30:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxNrV1C8Lz4x1N;
 Tue,  2 Aug 2022 02:30:01 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 0/2] aspeed queue
Date: Mon,  1 Aug 2022 18:29:46 +0200
Message-Id: <20220801162948.1920497-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=LBbo=YF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VB2FGhsXYboF

The following changes since commit 3916603e0c1d909e14e09d5ebcbdaa9c9e21adf3:

  Merge tag 'pull-la-20220729' of https://gitlab.com/rth7680/qemu into staging (2022-07-29 17:39:17 -0700)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-aspeed-20220801

for you to fetch changes up to 398c01da9c8c8af5db0b2b4b4888c2bd27218230:

  aspeed/fby35: Fix owner of the BMC RAM memory region (2022-08-01 15:24:15 +0200)

----------------------------------------------------------------
aspeed queue:

* Fix ownership of RAM regions on the fby35 machine

----------------------------------------------------------------
Cédric Le Goater (2):
      aspeed: Remove unused fields from AspeedMachineState
      aspeed/fby35: Fix owner of the BMC RAM memory region

 hw/arm/aspeed.c |  2 --
 hw/arm/fby35.c  | 14 +++++++++-----
 2 files changed, 9 insertions(+), 7 deletions(-)
