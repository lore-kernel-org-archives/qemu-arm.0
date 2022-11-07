Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3157495ejx;
        Mon, 7 Nov 2022 08:43:00 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6ZBhse9XYHvuBhyZ639SNcRPPOnB9BM5muKJ59oy0nHyjFDoGqPRNR2DXII78t118e4qlX
X-Received: by 2002:ac8:1409:0:b0:3a5:5f3e:4be1 with SMTP id k9-20020ac81409000000b003a55f3e4be1mr15896678qtj.619.1667839380171;
        Mon, 07 Nov 2022 08:43:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667839380; cv=none;
        d=google.com; s=arc-20160816;
        b=WK+Z6R/XkT2D2T6Wv+X/eTxbYa9HDrtrCRfVGupbmNuhmCaM90ywsopgh7OH2Y+Ox2
         XYtQSgo9sn06VAz+Ae6El/B6NaH5BBp7mcG8yFvTkrBsTopZRcqZzn7xAXYmpIuuneBU
         BYngo/j84OGRR0lSXyvUYrL7uRdhJRYXAT6ClPUNek2sKTLWn+cdeFqvR2ZWBN3VCADb
         xIsPSyh8x2/8dohMap1uw4aFMRo8BxkF2bUJaDttzlc7pKogPly8N152PSC//ocKMmdQ
         GOBn5VUiN9omnWQx3C+EPIJG9fC4wI9eCTi4O1yy6zG/MWiht5OC+uQN2R+JhWnck+wG
         CZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:mime-version:subject
         :date:from;
        bh=85csjXAIzwSS/dfKg4gnf46dACh2W+H8LJp/TI0GJqg=;
        b=vZ1EdRTuZo90FS1W5VFikEUfzFba6N6tYtAgXLosHnwhfeX5QBOz1FTKFLaf2pNtpY
         Q/mqpQFk1nNnh6sn0kNV9RogWpcgoAARNTxIT4dADtSxVh+Oz4sd4BCaDwbjlGaIoyhQ
         MQe0cjpqXC7IwutDVToMUD7CoJay5Mn3c/cQQusE6JG6NAfO9oaLfksWSy5N0f8ZjOCk
         XdaCIIgoUIxK7fKYoxOhBEqXh3gIvKKkF0HMhF98rXh4BB02KE+cFe0Z0UcKSgVkK91B
         JZ2vrLhrc8rQlXKn0rLEqL/318cwVzqeL2dRNt9M7a/5qWuHW3EFLTtv63LDSftaLtQ+
         zH+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7-20020a0562140da700b004b46bdb02a7si4860825qvh.400.2022.11.07.08.43.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Nov 2022 08:43:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1os5Cb-00029c-Tz; Mon, 07 Nov 2022 11:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CM-00024d-9B; Mon, 07 Nov 2022 11:42:10 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CI-0004mX-La; Mon, 07 Nov 2022 11:42:09 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 3DF8C11EED7;
 Mon,  7 Nov 2022 16:42:04 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Mon, 07 Nov 2022 16:42:03 +0000
Subject: [PATCH qemu.git v2 0/9] hw/timer/imx_epit: imprive and fix compare
 timer handling
MIME-Version: 1.0
Message-ID: <166783932395.3279.1096141058484230644-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: j7qKZrtDPp3H

This patch set improves the i.MX EPIT emulation:
- fix #1263 for writes to CR also
- do not persist CR.SWR bit
- remove explicit fields cnt and freq
- software reset clears the interrupt
- general code and documentation improvements

Axel Heider (9):
  hw/timer/imx_epit: improve comments
  hw/timer/imx_epit: cleanup CR defines
  hw/timer/imx_epit: simplify interrupt logic
  hw/timer/imx_epit: software reset clears the interrupt
  hw/timer/imx_epit: do not persist CR.SWR bit
  hw/timer/imx_epit: remove explicit fields cnt and freq
  hw/timer/imx_epit: factor out register write handlers
  hw/timer/imx_epit: change reset handling
  hw/timer/imx_epit: fix compare timer handling

 hw/timer/imx_epit.c         | 408 ++++++++++++++++++++----------------
 include/hw/timer/imx_epit.h |   6 +-
 2 files changed, 231 insertions(+), 183 deletions(-)

-- 
2.34.5
