Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4423460ejb;
        Tue, 20 Dec 2022 07:37:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7ODnhiKf70I1hzjzJXxzt9KF1afINO9lE4qgsCOVT7eUdwsXK0V2e+9sKFP6pxSlV6rA1r
X-Received: by 2002:ad4:4511:0:b0:4d8:8f4e:3a47 with SMTP id k17-20020ad44511000000b004d88f4e3a47mr45570363qvu.42.1671550638029;
        Tue, 20 Dec 2022 07:37:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671550638; cv=none;
        d=google.com; s=arc-20160816;
        b=bVgSTuuWYnuhzIo3o/wVxyyfzRBhMBEu2+tH3aqYb9CteF6nsefeTTUYz+KQGMJemZ
         oay61CXd7esKOYF6dGrJkvdImPF3moHneoRbNRIphR7a1m7werhCOTjHSk1q7EyymBTe
         HtBtR4O5IDNOKFKBbo89b62HFgSUbfahCZGX2vREWs3OcWt36mFa+8dQvOCSEKBgiVf4
         +mRNZJgPkXraaXcqIUj1UkLbxH/Q4UQDmShLf0Tp9NwVI9gp11Ql2OK4KDzaNVNXgygl
         xAAzcZLeGQHasmL8bcvDOvrYSOel1siCplBSmnHCjt/jC4WTnhuvRJGqymDXvnNskgrz
         SnVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=jWaWLcGTx5/1SaX+b0hHpJDM9aqIMU7RDtjNLxtDa4w=;
        b=hEMBD3jcFrRNI0ilsbFEk8R10YYKDpOqmnGM745s1x1N/hWx/uJS8zR3H3eTx2z+fZ
         BxdjYkKy9Gh1+SAUokSMWpFk/ISD386r0IDxbSVbcEWyrKxCnc/vzMKAkSquSnoTDY33
         eHQq334M4VU9sxKS0XaXiA4P1EHXx9NgKzwT4PUOdwy1AqHmyUm1mOfc/2rgIY5UmA51
         BlXPaKSRSTOrCFiaivwjKNcGmjdbkrj9+6Awwq0NTuruNW7g2/kyDu5gZHYrNK7oIztO
         Lg0JGrNFNRqGs5HaoG/XV6I3mvK50LitKvlDtvraHl18+/SURH2HPo7pgAbIGcaOitV7
         6ehA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ge10-20020a05621427ca00b004bba3906eb6si5330785qvb.20.2022.12.20.07.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 07:37:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7efx-0006fS-1g; Tue, 20 Dec 2022 10:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7efv-0006aa-5Q
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 10:37:03 -0500
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7eft-0003vt-En
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 10:37:02 -0500
Received: (Authenticated sender: jcd@tribudubois.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 94BBAC000E;
 Tue, 20 Dec 2022 15:36:56 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [PATCH] Fix i.MX GPT timers for i.MX6UL and i.MX7 processors
Date: Tue, 20 Dec 2022 16:36:54 +0100
Message-Id: <cover.1671548388.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4b98:dc4:8::226;
 envelope-from=jcd@tribudubois.net; helo=relay6-d.mail.gandi.net
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
X-TUID: 35usbUB1kS0P

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

