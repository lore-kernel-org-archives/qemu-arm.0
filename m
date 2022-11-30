Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1381397ejx;
        Wed, 30 Nov 2022 09:03:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7M0oTCgrqhaM8MgNoXZvO/zuKoeYW3yX55BBRMAosy9t7iBESuWPe/JBsy0MT19MWuO+51
X-Received: by 2002:a37:8045:0:b0:6fb:db69:3f19 with SMTP id b66-20020a378045000000b006fbdb693f19mr51789830qkd.482.1669827801681;
        Wed, 30 Nov 2022 09:03:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669827801; cv=none;
        d=google.com; s=arc-20160816;
        b=zuOXbqRMxGgD7ntTatILrKizSTW+WhCibHLmbRlMVf/uZG+Qfgh6+LZWVPYoJYHfwg
         eyI6fJrFnWhCGER0hfR16s105zM2XzrMPdaOvZIzKIDscNRcrMNlLVYYLZCDpX5M2JQh
         WOYO6eXHlFgvfZrfCOKglbUAf06nGHMEb7JD5hGvFILtplwSfM/05/aVbyMxneM4xR8V
         4pVNSnyw5bXt5VZUS0aw5l79d9AU9q9AYi3cIIowzAr8E0EXZWAFdDW3VgbhkMXulABz
         qqUZ2xMC0vEzNRd+JPoqE+0HK6h1qe5zLC4e/pNWcAP81VrOFV8UHQVUj1HMOf2gpwSH
         ziXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:mime-version:subject
         :date:from;
        bh=liX4kY1XYwOzLFwyijKqPVug9i8GuVKukziVtz1TrFk=;
        b=lMi1nnfjomNpUl3darWp+RdrF3SBPWZEM5fODHP5KKZbGZkoDzqetYL0yuIHGZ8rYS
         BXpq5o3tcGhuua0Y+U5YCxvEVIXduGQNHKUqRPngReiRdNT4+PyLyC6++4s1BkRLm20d
         eufh9WGQL2gZbgQsj9tub6bC/8cV5FEqeOMgp7fZyvdQ7e4ER0NU9h6ZtNPuB1ZFRDxP
         YyGMc5zzaN2m4midnLlAQixCQF5rj1XgKd2hihUvzDxaE6dpUeADudhZuDqY4wAPXTQ0
         HHN+Hc+U34/PEAQ5F/K0xKW2qGuvbr4CcOrfNd3A5bTCNxtRNFBokj8a9u5RiWeBbkTY
         tB6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l30-20020a37f91e000000b006faffa716e5si948239qkj.577.2022.11.30.09.03.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Nov 2022 09:03:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0QRy-00046e-6I; Wed, 30 Nov 2022 12:00:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0QRu-000443-5W; Wed, 30 Nov 2022 12:00:42 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0QRs-0004lJ-Cs; Wed, 30 Nov 2022 12:00:41 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 9031011EEE2;
 Wed, 30 Nov 2022 17:00:35 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Wed, 30 Nov 2022 17:00:35 +0000
Subject: [PATCH qemu.git 0/1] hw/arm/virt: make second UART available
MIME-Version: 1.0
Message-ID: <166982763526.10484.9925072056712598801-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, daniel.thompson@linaro.org
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
X-TUID: 9aYgYeIUBbH0

This is a follow-up on older attempts to make a second UART
available for the arm-virt machine in normal world. The use case
is, that this give a simple I/O channel in addition to stdout, as this
simplifies various test scenarios. Especially for non-Linux operating
system,s (e.g. seL4) where arm-virt is handy as a generic machine
for testing purposes.

There are existing discussions about this topic at:
- https://lists.gnu.org/archive/html/qemu-arm/2017-12/msg00063.html
- https://lists.nongnu.org/archive/html/qemu-
discuss/2018-11/msg00001.html
- https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg01613.html

This patch tries to address the concerns raised there and also
avoid breaking compatibility with existing setups.

Axel Heider (1):
  hw/arm/virt: make second UART available

 hw/arm/virt-acpi-build.c | 12 ++++-----
 hw/arm/virt.c            | 55 ++++++++++++++++++++++++++++++----------
 include/hw/arm/virt.h    |  4 +--
 3 files changed, 49 insertions(+), 22 deletions(-)

-- 
2.34.5
