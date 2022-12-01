Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp465809ejx;
        Thu, 1 Dec 2022 06:30:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6ClwERbdk3OxGSofzSpZ4mVMbQ2+8ax9e64Us/uKmKEwBiSLDdIZD7s3jF3Gxss5CdKcRv
X-Received: by 2002:a05:622a:22a8:b0:3a6:3756:c684 with SMTP id ay40-20020a05622a22a800b003a63756c684mr47776523qtb.10.1669905031912;
        Thu, 01 Dec 2022 06:30:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669905031; cv=none;
        d=google.com; s=arc-20160816;
        b=uidvZa5IBeutPlJc+La4HUy1IpRhMCLEXoepBtIGzpwuCHjXcy9371CzxeO1HHAV30
         mXbejK4wq/20YbKs/YDsF9wMOAGj46Gv7RvAQogmAQzcMwneJRkGCwXmYKk22aojyzvw
         1t47eoC0po0gyYqeHM5qWW8swuqGoz1TA0MP4kRZkQcKzFVQ4fm1tnZ9ApW9NTPsxbxT
         /edIpuIPQXQGs9TbjsH1wsMuUmrGnXh+nIeTKdEUpTWmJmbF98VisUMuHSD9N+WBsuco
         mHVEpskpJXyosLRHB6eTLvN84DPJftKxC0qpQkdlGYzV3zBUAxd5fZPyM0zkb/j7sMCk
         Og4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:mime-version:subject
         :date:from;
        bh=MvSvRoMw+vwgKclT8yE/eH6MR+2dui29fayBNPD6aHk=;
        b=DTNxeyf3QwfqWHSMynd1H7sBPcd0y68phR0zCToRLENPZM07GpoXAn7nCXxTLC6CSW
         fZYzstLAqyomSrZ5rhWNefjuAWIBSjKcNTfbbEn6yL9HrinqTXPQRiG53qL+Gh4AXNXe
         Kr8325Jix+KV08EVdHN8Sv35Bk7uPHyR+CR4ukxXScMXD0puSYQx8B9MS2LGdV9btkHs
         u0rW9PcDi5+D0UBLb6Hi7hj+eREbPvhR1d05t//q6JP+RKUoqRrITJulDIbnOMLWkpzc
         Y9UsCdndG4ZYP7xX+D0t8n8Q0eG5Xfb16ENiyu9Mn8EVVDD9nDpaxWvI3LFLqdXKsoJZ
         exnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ga7-20020a05622a590700b003a51c7c0403si2730437qtb.526.2022.12.01.06.30.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Dec 2022 06:30:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0kZz-0004aP-NX; Thu, 01 Dec 2022 09:30:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0kZx-0004ZL-5l; Thu, 01 Dec 2022 09:30:21 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0kZt-0001My-9X; Thu, 01 Dec 2022 09:30:19 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 18D1511EFD8;
 Thu,  1 Dec 2022 14:30:13 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Thu, 01 Dec 2022 14:30:12 +0000
Subject: [PATCH qemu.git v2 0/1] hw/arm/virt: make second UART available
MIME-Version: 1.0
Message-ID: <166990501232.22022.16582561244534011083-0@git.sr.ht>
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
X-TUID: 2HHaVbRS4K9g

This is a follow-up on older attempts to make a second UART
available for the arm-virt machine in normal world. The use case
is, that this give a simple I/O channel in addition to stdout, as this
simplifies various test scenarios. Especially for non-Linux operating
systems (e.g. seL4) where arm-virt is handy as a generic machine
for testing purposes.

There are existing discussions about this topic at:
- https://lists.gnu.org/archive/html/qemu-arm/2017-12/msg00063.html
- https://lists.gnu.org/archive/html/qemu-discuss/2018-11/msg00001.html
- https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg01613.html

This patch tries to address the concerns raised there and also
avoid breaking compatibility with existing setups.

v2 also updates the documentation in docs/system/arm/virt.rst

Axel Heider (1):
  hw/arm/virt: make second UART available

 docs/system/arm/virt.rst |  5 ++--
 hw/arm/virt-acpi-build.c | 12 ++++-----
 hw/arm/virt.c            | 57 ++++++++++++++++++++++++++++++----------
 include/hw/arm/virt.h    |  4 +--
 4 files changed, 54 insertions(+), 24 deletions(-)

-- 
2.34.5
