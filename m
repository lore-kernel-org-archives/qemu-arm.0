Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3830139lfa;
        Mon, 2 Nov 2020 03:10:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1Zldy2CjagjEA+KhacP9GftaY+VzyugnwggOLBvdofVINvFU3ADTMEwn0ztTTmuU4RuHj
X-Received: by 2002:a25:35c6:: with SMTP id c189mr19038490yba.289.1604315405088;
        Mon, 02 Nov 2020 03:10:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604315405; cv=none;
        d=google.com; s=arc-20160816;
        b=xMDqgxP9KtHJHmkhJ/oBYViVYRRIxFES0KD+XAwGhti94LbMIAyl4Fc6F222h1JIIb
         6fWFQa8zklxDTMlDb9ifjngJawdWTswJJtayILTdg2eDgRueuR3xy5mkEIjmlw4iGKvA
         rD7VNhp5AorDTwW9pO6Wflmrf4fXPxnzVVwQfL8OVTdep79hxFMZAU02ZVUp9H6JP4lS
         9gTx3oU3cfrp4mgiPMSYVmGEoJZ023W8pKxMytl+5DjXIODAEJbdbSjxYpIiGdC+elkE
         Mh84A20y7rIelxfHrAHYQDtiZ+EBgqau5K2xA41ar8HyZNH4SdFMGoyH/39arhOm+5nT
         mu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:message-id:date:subject:to:from;
        bh=R7QPMcaqfZH1H87LA8ythUhjU1y6/QOpdFJT9EQyyAs=;
        b=uAmhkzkwtEdpQMqgrZUb2TKT16TmGF0gjmk8T1auhvZEC1DYIXXMo9NxS7nAqUmqvN
         CiH7qll7ah1APbEjeKcvvJbizj+v3dc3L6/bnJQWSgB0mbzp9FonXZUrSTsXyplarphy
         szPSNsfnVjq0YookLYmq7eE35SlbS5J06nN77nCHxtnECRO+B+3qUiUYOfBfa3HZ+OEm
         F2ZCmnkouG0VrNxH9SHhPOgdevgoBtw6vySVIpUJszesfMsCLiaoN9lOHrCsZ8KW7yue
         kLAHo0EnL8/Zt6oo99BTKdhoLzqGa3KnRAHSD0gGzkExGs0JdQbqQ59MsORK1qsQCb6r
         Em8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si15807459ybt.70.2020.11.02.03.10.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 03:10:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZXiu-0007A8-Do
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 06:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kZXgw-0004ms-UZ; Mon, 02 Nov 2020 06:08:02 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:39658
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kZXgu-0001fE-P6; Mon, 02 Nov 2020 06:08:02 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id A291E5FBC5;
 Mon,  2 Nov 2020 12:07:58 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: [RFC][PATCH 00/14] ARM Secure EL2 extension
Date: Mon, 02 Nov 2020 13:07:57 +0200
Message-ID: <1762176.tdWV9SEqCh@basile.remlab.net>
Organization: Huawei Technologies, Finland
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 05:57:15
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9Pwazxjde4fg

	Hi,

This patchset attempts to add ARMv8 soft-MMU target support for the
ARMv8.4-SEL2 (Secure EL2) extension.

Patches 1-4 are just some initial clean-up / revectoring.
Patches 5-9 add support for running EL2 in secure state.
Patches 10-13 add the secure state stage 2 translation.
=46inally patch 14 enables SEL2 for the fake max CPU.

It is preferable, but not necessary, to apply the 3 bug fixes I sent
last week first.

Comments welcome.

=2D---------------------------------------------------------------
R=C3=A9mi Denis-Courmont (14):
      target/arm: add arm_is_el2_enabled() helper
      target/arm: use arm_is_el2_enabled() where applicable
      target/arm: use arm_hcr_el2_eff() where applicable
      target/arm: factor MDCR_EL2 common handling
      target/arm: declare new AA64PFR0 bit-fields
      target/arm: add 64-bit S-EL2 to EL exception table
      target/arm: return the stage 2 index for stage 1
      target/arm: add MMU stage 1 for Secure EL2
      target/arm: add ARMv8.4-SEL2 system registers
      target/arm: do S1_ptw_translate() before address space lookup
      target/arm: secure stage 2 translation regime
      target/arm: set HPFAR_EL2.NS on secure stage 2 faults
      target/arm: add ARMv8.4-SEL2 extension
      target/arm: enable Secure EL2 in max CPU

 target/arm/cpu-param.h     |   2 +-
 target/arm/cpu.c           |   2 +-
 target/arm/cpu.h           |  75 ++++++++-
 target/arm/cpu64.c         |   1 +
 target/arm/helper-a64.c    |   8 +-
 target/arm/helper.c        | 408 ++++++++++++++++++++++++++++++-----------=
=2D---
 target/arm/internals.h     |  53 +++++-
 target/arm/op_helper.c     |   4 +-
 target/arm/tlb_helper.c    |   3 +
 target/arm/translate-a64.c |   4 +
 target/arm/translate.c     |   6 +-
 target/arm/translate.h     |   1 +
 12 files changed, 407 insertions(+), 160 deletions(-)

=2D-=20
R=C3=A9mi Denis-Courmont



