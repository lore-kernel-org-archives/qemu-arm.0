Received: by 10.28.71.27 with SMTP id u27csp1605899wma;
        Wed, 7 Feb 2018 21:53:47 -0800 (PST)
X-Google-Smtp-Source: AH8x227c0S8MKmjI8xFwH4/EFgiAZMh/NmHpSIb5+fq7xqpd418fQmSNtItIAddvx3RdMACzZDp0
X-Received: by 10.37.188.143 with SMTP id e15mr5740533ybk.361.1518069227619;
        Wed, 07 Feb 2018 21:53:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518069227; cv=none;
        d=google.com; s=arc-20160816;
        b=sYPTjdPqAEw78hJimZWKNc/H12dYiZEG5ctObeRPYoN1nqvfSJEV4Aed20ruq1ltp1
         I1ecRl0k6fMYpQphQyzlxK1HyAVc3EuMAkfqdpa5PPjPjRsn0WNDQGdxVme7Bd2PSTg1
         2Ox2ffEGW4fBAOiUgt0JDG3k2I0+MGHXHUxV7jjguRoLcWOlQ90Y3kLgQBTwIMQqg73N
         C68gnzbL4FK/c+3LfYCGXzU0bBTtNjdkhEzHa1aSel2dhLcWRiV2dEsWKFfxkP8/WEcm
         S6NQL7hYFb0h7xsZNiaR+hm1mvr0pQ+6F2Wl/rhIOBBdrlCrUZzRTqb/3O1D0ikR8mSr
         TvZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=xDtgHURBx9H/HujSrB7TWncFQL/f82PGv0k0TGLqN9c=;
        b=SlpLu4KF0VI0da5BZmkZ2nvgdQZWH7sd+N/gBL4RhzUAMmoRkeXvCyVqpijG4GNPUB
         I43DbH+HF2RdI3+K3+HQdPEFFzT6sN3HOKcCs/hj5/kF79O1FL4zD5mTYZhXnfeAJV2J
         yCoQfpm0OvWIZXH/Kj01WgLDIQn8gKUtJCgwWYA6wNZQV8BzB0AUKNoCtPPv9hBI0LN+
         65Wu/4l5QKoCbNCkmtGf25gNfeiCKo7nytq58UU8Uu/t4IHmrq6jNwQwBNww7JLy1eMn
         H1gJU4M+hYZZOalETu+4WyB6vX9iAFMFmFvRazLpD4kzENuY2uxg8FX1wjXtp0ha5P+z
         wOsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Z7a/94/i;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s192si526810ywg.592.2018.02.07.21.53.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Feb 2018 21:53:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Z7a/94/i;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47642 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejf9W-00035i-UA
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 00:53:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <penberg@gmail.com>) id 1ejf7E-0001si-G1
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 00:51:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <penberg@gmail.com>) id 1ejf7D-0000Qd-Lk
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 00:51:24 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35034)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <penberg@gmail.com>)
	id 1ejf7D-0000Q9-EE; Thu, 08 Feb 2018 00:51:23 -0500
Received: by mail-lf0-x241.google.com with SMTP id a204so4721806lfa.2;
	Wed, 07 Feb 2018 21:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xDtgHURBx9H/HujSrB7TWncFQL/f82PGv0k0TGLqN9c=;
	b=Z7a/94/i/GgM3WYugpNDcjMCWv/wy6KgtmnFlJSmvYrb6bUUIspaADpJ6tfG003W4F
	4QEc6/cmnq0lolmJkzNOgg5IeaVGTZURj8i4DkM9VTAU3WKKuyHYk8mUijlbmqcjSKh0
	INTa7GskKUVKTB8xIezDCT1vLw7lKz7w/uxkPCdrogGDC//ziDFFYNaDtXTIU6XWbHg/
	9juSlfstio14yYTALf2uZXvXRKsThP6Qhhp5EARU70SqZr0aVKQNKrxqsvaUV1eoKaZ+
	xESeENwDzaoqvJoEH+gzRnjqBqdjuU7rikgLCWVGwiK+T+jegcfhDGtMsYWq4M5Omhmx
	jTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=xDtgHURBx9H/HujSrB7TWncFQL/f82PGv0k0TGLqN9c=;
	b=LHYFoUCscNw48a1yCv/X0CSuiLIfyrbgb6HYREMsQ+ULmMI5e2JJEWlJReDRiSSzpO
	wdGDURe6VSENDkbympsx762XFoYlPpt6oaum6EIVHSIg6FSk3YorlLqGILiNyUbkwFar
	Yn4b5IM12DbvKVCe6enHaEKlNCP8ku8hzfgHSBicPYwNF3DHVdjI3K2HoweYTc+rRTvq
	9ymROWVhJk6agm/KCsz9/GBV8Wy+T0S+jF6QdcWYayP+0Cxqk1lJGKsQeI3N1S4iwtm0
	39wrCI0UHFSjSH6DmIkDZgdKOHJIq4vC4woCKkcc6Gh50Mtwa+cxEGGGD0h2DEOhHAiP
	f4/Q==
X-Gm-Message-State: APf1xPBbFkx75pc1yHOeLfvuecj1aB1eElGtt0ZPg8nodyhg54TnFLgz
	guXs3Gqg+CujspUri+dft0WagsGO
X-Received: by 10.25.89.146 with SMTP id n140mr4185355lfb.134.1518069081917;
	Wed, 07 Feb 2018 21:51:21 -0800 (PST)
Received: from localhost.localdomain (81-175-247-183.bb.dnainternet.fi.
	[81.175.247.183])
	by smtp.gmail.com with ESMTPSA id u24sm222525lje.5.2018.02.07.21.51.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 07 Feb 2018 21:51:21 -0800 (PST)
From: Pekka Enberg <penberg@iki.fi>
To: qemu-devel@nongnu.org
Date: Thu,  8 Feb 2018 07:50:39 +0200
Message-Id: <20180208055039.24666-4-penberg@iki.fi>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180208055039.24666-1-penberg@iki.fi>
References: <20180208055039.24666-1-penberg@iki.fi>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH v1 3/3] raspi: Add "raspi3" machine type
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /ZP/0XZpl4Ig

This patch adds a "raspi3" machine type, which can now be selected as
the machine to run on by users via the "-M" command line option to QEMU.

The machine type does *not* ignore memory transaction failures so we
likely need to add some dummy devices later when people run something
more complicated than what I'm using for testing.

Signed-off-by: Pekka Enberg <penberg@iki.fi>
---
 hw/arm/raspi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 66fe10e376..048ff23a51 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -187,3 +187,24 @@ static void raspi2_machine_init(MachineClass *mc)
     mc->ignore_memory_transaction_failures = true;
 };
 DEFINE_MACHINE("raspi2", raspi2_machine_init)
+
+static void raspi3_init(MachineState *machine)
+{
+    raspi_init(machine, 3);
+}
+
+static void raspi3_machine_init(MachineClass *mc)
+{
+    mc->desc = "Raspberry Pi 3";
+    mc->init = raspi3_init;
+    mc->block_default_type = IF_SD;
+    mc->no_parallel = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
+    mc->max_cpus = BCM2836_NCPUS;
+    mc->min_cpus = BCM2836_NCPUS;
+    mc->default_cpus = BCM2836_NCPUS;
+    mc->default_ram_size = 1024 * 1024 * 1024;
+}
+DEFINE_MACHINE("raspi3", raspi3_machine_init)
-- 
2.14.3

