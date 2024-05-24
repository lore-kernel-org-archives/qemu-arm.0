Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1649452ejb;
        Fri, 24 May 2024 05:09:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLAszYz/NGndnrLH3RSk/2YTTwNBqGvvvnTIQ5S8iYQfkM5XXt423HNLS75W3j1v7vatIdjr90EwDPEZUp7ZbgdAr6bxrx
X-Google-Smtp-Source: AGHT+IGtaFqJfREmMo8IGM20sB32l5SkxdSzbl2DRW7lApTIrQenBSeYXdyzw98cYq7s2UGudUui
X-Received: by 2002:a81:49d3:0:b0:61b:b41:cadb with SMTP id 00721157ae682-62a08eeb3femr18189387b3.41.1716552578697;
        Fri, 24 May 2024 05:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716552578; cv=none;
        d=google.com; s=arc-20160816;
        b=HKO1NLQBFlI5U5nrIAFKCwvEB+aEJOTXhvQUgXC5WEm+7azwBIfGkoOsls40JC0shC
         I81BEKEWY7cR7os4qpIbdp7VaBsw1mACiGFCuHq13SlzW7aibo9xHFZrfnZyNLCcN76L
         M3UYZN/yFdiCgtLEib/xvxD4lb7mMkk69Lfy/vjiAkr7pboKhaN85AV9DBb8iqwHhvYk
         YOR+yvwUK6f7m9/i0uktB0AjmNUFb6crH38ptGzM8qC59UoSgziCDhEp1e6EGHBTcSwf
         qPnj/7PZEvzIB9VTLDQnO5UAfDTiSJ3H4FE4pwpv8rqfI+PzcvD5l+ECCaTuCru+zNWY
         XMVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=Zla+Gv8o4HBBE7dWy5WbvhS+yoONny8Y6qew+7abbJ4=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=UsWeDey4dg4ado6OFz1X2Awo1c0KRojCnG/Hpt1HYwB1LtLHTEoB+oKFHfJWOVmKXe
         bRe4VW1sM9Lg+VeFfR3L1phCJtvczQV2AIBA5wJwf1cwBV+xh1QAotQRzBKPlpq4rlrT
         lcEzR0H5yS8/rmJfiWPQHpQymiOY/pIK4G+B2k/bkVgGMxyFgmwdrYLfNvDBcPUfRy9E
         EEJ0wXdKrNQVHR1rfR+FHMiZxuZxqjQuPyscPhXf+phALMbr9m/evLLx6Oz7tI4em+3u
         qzLN3ACRV2wrEYB5bKA4MThFpvI5sl8ekJBJZgg+Lj9mvfQWT7uq6NkSGXvyya0gUfRT
         Dh8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48a3a351790si140529137.467.2024.05.24.05.09.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 05:09:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sATjB-0002my-5s; Fri, 24 May 2024 08:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sATj9-0002m4-Tc; Fri, 24 May 2024 08:08:51 -0400
Received: from dedi548.your-server.de ([85.10.215.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sATj5-0006ZP-2H; Fri, 24 May 2024 08:08:51 -0400
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by dedi548.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sATiz-000J0z-31; Fri, 24 May 2024 14:08:42 +0200
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy02.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sATj0-000C57-23; Fri, 24 May 2024 14:08:42 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 80037480197;
 Fri, 24 May 2024 14:08:41 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Nzh4xmLX5WVd; Fri, 24 May 2024 14:08:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 3C5FE4801F2;
 Fri, 24 May 2024 14:08:41 +0200 (CEST)
X-Virus-Scanned: amavis at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10026)
 with ESMTP id u8OEPFcMl9Xp; Fri, 24 May 2024 14:08:41 +0200 (CEST)
Received: from zimbra.eb.localhost (unknown [192.168.96.242])
 by mail.embedded-brains.de (Postfix) with ESMTPSA id 019974800E9;
 Fri, 24 May 2024 14:08:40 +0200 (CEST)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/2] Zynq 7000 Improvements
Date: Fri, 24 May 2024 14:08:35 +0200
Message-Id: <20240524120837.10057-1-sebastian.huber@embedded-brains.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: smtp-embedded@poldi-networks.de
X-Virus-Scanned: Clear (ClamAV 1.0.3/27285/Fri May 24 10:30:55 2024)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tZdn5A44/wqA

v2:

* Add Kconfig support

* Add array of CPUs to ZynqMachineState

* Add FIQ support

Sebastian Huber (2):
  hw/arm/xilinx_zynq: Add cache controller
  hw/arm/xilinx_zynq: Support up to two CPU cores

 hw/arm/Kconfig       |  1 +
 hw/arm/xilinx_zynq.c | 55 +++++++++++++++++++++++++++-----------------
 2 files changed, 35 insertions(+), 21 deletions(-)

--=20
2.35.3

