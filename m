Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4247658lfp;
        Mon, 3 Feb 2020 10:11:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqzb87iF3X+U3/7rtzrmApu247pOeIQjhG6R83WsgCfDBph/1KZwHun5OtSicODExcoNDHPu
X-Received: by 2002:a37:ac16:: with SMTP id e22mr25100760qkm.168.1580753519785;
        Mon, 03 Feb 2020 10:11:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580753519; cv=none;
        d=google.com; s=arc-20160816;
        b=WGOG0LRalJR0x4Rs8+dBzPtz98oROCktWNMunS43SK+4iLiGGixyz1AMmBRmt0xBPn
         vV+yXDu4R1rMMeUlCFIdea8EjQ23/j+AqushZ/DPw5DwiJo/jUd4hLVk8QS13VskDPJE
         PYI2fq3vp3IOKg+nzpD7dLBns7jMbio9dYwzEdHmg4I0WmCbWR9eQ+3CSprgkOm72KOd
         gRS3IZBYDzOf9C1bx+/C966t+tsYMtYtSPC31pXj4YhUYbcBaM1wfQJJVeNzLsXhyy/A
         MSg51WF2VpxdgBPAZ8g/1gxEJhMrIeit1pHnYBSyms8cTpgmKg93+D27znWs8IMuxbnl
         h6Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=etoHwdNyoSRutm5MdnEpD2P8ySOBKOPV8Ax17Ri7UPA=;
        b=k2V3ukFEjC/vPB9BOfqZWYhjdRANaBB6aLRmV2HBZ/3Cjl4GYPG1d+MKnwMavsIix8
         7fOe1bvvdTAUMtei9WLPey+oEnB1b1JmH009P2Mo9pNew/qiqoW3ch3T1ge5hlcwtckB
         35BCQh1PEeJYcG4I6GdHdbxja/z+y5Lwvqsre98AuSbbeuJQ4Fi0FtCrTaSyJmXFf+ij
         SsFSsEkNxhGFAuLWDQlcUMMOaV/rc85vy1Nvl5ulYLtDqc4T0yfThEcxSP0avkxa4Ll4
         bPaUEIGZLWA9sn2iWjFRn58bM9ZFlWxZbaYeDrF33ZzRYkH+A9GSu5VzH3W1Se4NMGeA
         NzLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rIzUlwSx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w136si2010417qka.165.2020.02.03.10.11.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 10:11:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rIzUlwSx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iygCU-0005Hm-7V
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 13:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45074)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1iyg9v-0001V0-1y
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 13:09:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1iyg9t-0004Rz-R0
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 13:09:18 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33026)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1iyg9p-00042J-LZ; Mon, 03 Feb 2020 13:09:13 -0500
Received: by mail-pg1-x541.google.com with SMTP id 6so8246560pgk.0;
 Mon, 03 Feb 2020 10:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=etoHwdNyoSRutm5MdnEpD2P8ySOBKOPV8Ax17Ri7UPA=;
 b=rIzUlwSx2cU9kTKSnSzkf/21PjTuERz6i0hT7ZLCiLODznauFpKYy8BXOCofpfctH/
 1D5aM91f+pt6xWAwHzqVckWSU+EypB9pqUAfRzLFXUX7Bcct44ym1CPqMuqS52BHtMym
 EF8YDBclpRtYKLtK+hkjwRxEYDMZ/kytOIDx5FSwoOlWZpT/mxh4trjf5lthlagS9xVi
 yWNA/roMAU8ZC3CKTTZ9YeRsCxnb8xYoC216ATprYQxVqZQkLecNKzCiPNutmP2nHZXV
 QfVoJvq1ftfRQFlCu3zG5e+MpfO3CTR2yq2VMF05m6x2z8WgZWnq6tnJ8suEgIgTKjlI
 4/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=etoHwdNyoSRutm5MdnEpD2P8ySOBKOPV8Ax17Ri7UPA=;
 b=gytas3wdBMtMYxYp2s4PqlZyoH44rFZzkY0fanEP36EY9a3kCgQNAgOZRSh1g0dJHU
 x/XRzb7vUh7coQyQ/s34xuPLIXyG8nysfbkfweZs4XTmD01rfQXLjCRinrVbBHLCub/S
 pbQI+EuCmqo/eOt5skkWAMyD2SU4imEfarl6eeAVQXN5HbJEIqwmAFgDhExvGp/hCYYz
 8j2jaRl0OEw79T0C0LAax4qogAHwT47owevKLNV2hUWKyFK/yB/uYnxcKSIXxVYxqngG
 49fHjKbpD0FGC5+ECLvJrE884ma4BXod5YS2twqCBkne3V0DFQe1O6VfOmMZtlJJTuYO
 Y5VQ==
X-Gm-Message-State: APjAAAXm+ilX2O5K78KVAp2w+oRFWv3UQdopFWwwVqRFOFT1uH4bCQpp
 b2zsT1trOrpKDkyXOHHbyag=
X-Received: by 2002:a62:4d87:: with SMTP id
 a129mr25624154pfb.116.1580753349506; 
 Mon, 03 Feb 2020 10:09:09 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 10sm21451759pfu.132.2020.02.03.10.09.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Feb 2020 10:09:08 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 3/3] aspeed/smc: Fix number of dummy cycles for FAST_READ_4
 command
Date: Mon,  3 Feb 2020 10:09:04 -0800
Message-Id: <20200203180904.2727-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200203180904.2727-1-linux@roeck-us.net>
References: <20200203180904.2727-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aPb5EemQwsm5

The Linux kernel recently started using FAST_READ_4 commands.
This results in flash read failures. At the same time, the m25p80
emulation is seen to read 8 more bytes than expected. Adjusting the
expected number of dummy cycles to match FAST_READ fixes the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/ssi/aspeed_smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index f0c7bbbad3..61e8fa57d3 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -762,11 +762,11 @@ static int aspeed_smc_num_dummies(uint8_t command)
     case FAST_READ:
     case DOR:
     case QOR:
+    case FAST_READ_4:
     case DOR_4:
     case QOR_4:
         return 1;
     case DIOR:
-    case FAST_READ_4:
     case DIOR_4:
         return 2;
     case QIOR:
-- 
2.17.1

