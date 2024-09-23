Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp2013569njb;
        Sun, 22 Sep 2024 20:57:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNNm/z810k3IihC5nKS9XEzNmV8uLVCR/k+/mynN6SMQ2NhofmH14XFLh1YaeaQFFZ4PtZz4WIUY2L7g==@linaro.org
X-Google-Smtp-Source: AGHT+IFaTmmVE+CHmCI1wX7gmf+jKUeydm3OPwRyHTxoL2mXB350wuCsIQmYyIslm7LZiJzzP8Q2
X-Received: by 2002:a05:6214:5d0e:b0:6c3:6e36:eff5 with SMTP id 6a1803df08f44-6c7bc731d76mr197226906d6.22.1727063840007;
        Sun, 22 Sep 2024 20:57:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727063839; cv=none;
        d=google.com; s=arc-20240605;
        b=O5pOW82QOeBlK/rBj8z9Qm8q2e5f2DPggNN68sNnd8SeGGcBCRB5Tx9VgxgMcbuHRC
         kYzhf3xicKNw8p+lfxxevcl1PzvFVUOj0MB/FHsilvqq/6I4RU4md+hsZhXpE2qHmVTC
         +6taXS0fhxDwFYvfVx+Cb1+zqipePgBxwjGwV7hVy5dKtdxtXnSvgfSKmBTEeTOAV53A
         GmKMGmTwtAozJFOTQrjFd+hv7TlNIdm3E/wgoKpVm7ZYz4HWu8MNOBYND4zyUZ6huhBz
         E2FKfuuL6aiGKzw2I29OtZNT0vuEDuIpT6xxEYk9PcINv6C27P635iJ2VcVjKRdVpo9S
         Jjvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=E2uzwVRkGTuOhx/oZCm4pumFP8kgGkpwDofQ0KG8LJQ=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=BUoH+9MO9yzuYrXz39ZJAZKkII59PLEDEmEecfLUDyz6mXajZJllLf03P+qv/SjFT8
         yM+6eN4YjYYMkfhTwDj3gJLZYqKhAlEB+8TV9T4yPsgPEW9oq6McFitbG2h8/kFz5kD4
         obeNUp7imY3r6d7bKLfUOHGmV+JiKn+ouQmmuDagIsnFSE++ppBL/RjQLUbxx+K6WwhG
         fCXw218V9UZQD8uYOk7TnfkGigvJRUB/n301WHoycjP4NiJnHZ/jg+IUO5I2qosk7dFs
         lXhBntLZ4lBSym1kdWUHdaSnfbP8jZrVDFWNlAQ6M1fAzt9+zmD6M3/pG1hI4Q43Luwn
         wzHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e5acd58si96316866d6.515.2024.09.22.20.57.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Sep 2024 20:57:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ssaBr-0006VZ-2V; Sun, 22 Sep 2024 23:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1ssaBp-0006Oe-40; Sun, 22 Sep 2024 23:56:45 -0400
Received: from dedi548.your-server.de ([85.10.215.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1ssaBm-00013F-3y; Sun, 22 Sep 2024 23:56:44 -0400
Received: from sslproxy04.your-server.de ([78.46.152.42])
 by dedi548.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1ssaBh-0004WM-0i; Mon, 23 Sep 2024 05:56:37 +0200
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy04.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1ssaBh-0002vO-1t; Mon, 23 Sep 2024 05:56:36 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 677744801AF;
 Mon, 23 Sep 2024 05:56:36 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10032)
 with ESMTP id ipd4KPDT_QJi; Mon, 23 Sep 2024 05:56:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id A269D4801BB;
 Mon, 23 Sep 2024 05:56:35 +0200 (CEST)
X-Virus-Scanned: amavis at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10026)
 with ESMTP id OnhaEP9SxUgN; Mon, 23 Sep 2024 05:56:35 +0200 (CEST)
Received: from zimbra.eb.localhost (unknown [192.168.96.242])
 by mail.embedded-brains.de (Postfix) with ESMTPSA id 77F6748006F;
 Mon, 23 Sep 2024 05:56:35 +0200 (CEST)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/2] Fix secondary CPU reset for Xilinx Zynq 7000
Date: Mon, 23 Sep 2024 05:56:30 +0200
Message-Id: <20240923035632.81304-1-sebastian.huber@embedded-brains.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: smtp-embedded@poldi-networks.de
X-Virus-Scanned: Clear (ClamAV 1.0.5/27406/Sun Sep 22 10:30:52 2024)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: 2DwDTJhzdVW1

I recently added the support for CPU1 to the xilinx-zynq-a9 machine
(hw/arm/xilinx_zynq.c). However, the reset behaviour doesn't match exactl=
y with
the hardware. After a system reset (SRST), the CPU1 should execute a wfe
instruction and then load the start address from 0xfffffff0:

https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM/Starting-Code-on-CPU=
-1

Sebastian Huber (2):
  hw/arm/boot: Use hooks if PSCI is disabled
  hw/arm/xilinx_zynq: Add CPU1 reset

 hw/arm/boot.c        | 30 +++++++++++++++++++-----------
 hw/arm/xilinx_zynq.c | 25 +++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 11 deletions(-)

--=20
2.35.3

