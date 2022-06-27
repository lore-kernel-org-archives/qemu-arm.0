Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2640367lft;
        Mon, 27 Jun 2022 12:56:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vv/2P0QuqDuPeaEjp/5iqPcB/gwP8Zh6O9ty7jScTy694/Vy0br3guItAYNzQtbeRxnZSa
X-Received: by 2002:ac8:7c4d:0:b0:31a:6e91:5f7a with SMTP id o13-20020ac87c4d000000b0031a6e915f7amr4865304qtv.441.1656359815203;
        Mon, 27 Jun 2022 12:56:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656359815; cv=none;
        d=google.com; s=arc-20160816;
        b=IZVV1/0ilpkKAOwK8F9Bchn7JAjty8nj6y68XDw61qDWYMak8iBrm8FdZdsI+oO1d0
         jV5yfPL32eDBPmm7kjTxTvJ49gZPPSGCXegnIBJrE+x5NYRy9+iAlKX59bK/A9EufZPT
         QN9hgbBG6MbNGsJv2O/ZT85LOdbB35qocsAe5HfPd7lLlI92qZrVt839Bmy5l1NWWO49
         RhbWqh6gGKtfw+HmK1I6XewTwmGHZuIOXnRGQXk9jWeTYqlnQ3dHkizNzxPPJZs2P9Rr
         NPrK7okAFIFYEk56iUAXjbCoeMz5phzUXySaVTrCfdGE/AMRQOESWUBMPCTtiT9kCRkW
         5LPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=S1yPwEGxngZ43y2+GrPQJjRFjdLmx59CIxlw3mXValk=;
        b=Z4TsR/46av/nPsTdb73hKKtJ6cK6TnW4FQE9YDuNQ/Rj8J9cCxUBjrC8F/JExxcOqs
         kCg228UM3KTC0pmxXxbLpCWPPtHaPS5gTJ5XtAeY+7zNNJ2qaH9aKPeZMdXXxYnYMSEh
         qsxFX+8POSIad3zIAyrKd7m6XZ5IbAPYbT27Y/gO3I3htNQNxuZi2nkCLX6DE8+k/wCV
         93Rz5jPXaMDY5VLOSOHZ45qVPSol4fRPz4T+WXkUYMwu1uUevERB6+jfNLDeOVHokuut
         7dsHuCktW/iOaO0POytr3srHQbmtekFn0S5/DEEhND9c5ubKYYHAZGwbnYpFUWVhp8Dq
         ayfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=f6bGaiQ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020a05620a400800b006a6ab28ffa1si8413490qko.180.2022.06.27.12.56.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 12:56:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=f6bGaiQ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:32826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5uqs-0005m8-HM
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 15:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upK-0004Hv-TS
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 15:55:20 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:21152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upI-0000Wi-8T
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 15:55:18 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1SWB017572
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 12:55:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=facebook;
 bh=S1yPwEGxngZ43y2+GrPQJjRFjdLmx59CIxlw3mXValk=;
 b=f6bGaiQ9CPzwBRHuk6ys0QsiOTCE+15XvY8Qrgac9EimuS66xrTqBt9QgYe6To5t9mFp
 7TyAGdlaoWnhVA/FMLFSDYBBf4bmCE8X/egposdFWB30kEswXIgQ7BvHpf8skunWE75w
 jkuH8TWKradjp1hVQ8CwqHpYujbp3RTSvKw= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gx1p54uw8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 12:55:12 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c085:208::11) by
 mail.thefacebook.com (2620:10d:c085:11d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 12:55:11 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id AE2688D206DF; Mon, 27 Jun 2022 12:55:07 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <zhdaniel@fb.com>, <clg@kaod.org>, <qemu-devel@nongnu.org>, 
 <qemu-arm@nongnu.org>, <komlodi@google.com>, <titusr@google.com>,
 <andrew@aj.id.au>, <joel@jms.id.au>
Subject: [PATCH 00/14] aspeed: Add I2C new register DMA slave mode support
Date: Mon, 27 Jun 2022 12:54:52 -0700
Message-ID: <20220627195506.403715-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
X-Proofpoint-ORIG-GUID: V2e7nd9AzRxu7Klp5OT7tZ8CS7jhjGoz
X-Proofpoint-GUID: V2e7nd9AzRxu7Klp5OT7tZ8CS7jhjGoz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=71779173e5=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E6qXmFuFDJQh

Hey everyone,

I'm sending a big patch series for this, but only the last commit is real=
ly
intended to be accepted right now. I'm just including the rest of them
because it depends on them for testing.

Klaus's changes include the multi-master stuff in hw/i2c/core.c, and the =
old
register mode slave mode support.

My series of patches includes a bunch of changes to eliminate most (if no=
t
all) of the I2C errors reported by the fb OpenBIC firmware for fby35
CraterLake Bridge Interconnect (BIC) (shortname: oby35-cl) upon startup.

In particular, I needed to add the IC_DEVICE_ID to the isl voltage regula=
tor
implementation, which required a fix to the pmbus implementation when
switching pages. We weren't resetting the buffer state when switching
pages there.

I also added a placeholder implementation of the PECI controller, that do=
es
almost nothing, but doesn't produce errors.

I added the fby35-cpld, which oby35-cl queries using master-mode TX and R=
X
commands.

And finally, I added an "intel-me" device (Intel Management Engine) that
attempts to respond to the first IPMB message sent by the BIC. I used thi=
s
to test the final patch, which I actually want to merge, the I2C new
register DMA slave mode support.

All the patches except the last one can be ignored for now if you want,
again, I just included them for testing purposes.

The final patch is pretty rough, but I wanted to start the review instead=
 of
waiting too long. I expect the interrupt handling part will be
the main blocker.

Thanks,
Peter

Klaus Jensen (3):
  hw/i2c: support multiple masters
  hw/i2c: add asynchronous send
  hw/i2c/aspeed: add slave device in old register mode

Peter Delevoryas (11):
  aspeed: i2c: Fix DMA len write-enable bit handling
  aspeed: i2c: Fix R_I2CD_FUN_CTRL reference
  aspeed: i2c: Fix MASTER_EN missing error message
  aspeed: Add PECI controller
  hw/misc: Add fby35-cpld
  pmbus: Reset out buf after switching pages
  pmbus: Add read-only IC_DEVICE_ID support
  aspeed: Add oby35-cl machine
  hw/misc: Add intel-me
  aspeed: Add intel-me on i2c6 instead of BMC
  aspeed: Add I2C new register DMA slave mode support

 hw/arm/aspeed.c                  |  42 ++++++
 hw/arm/aspeed_ast10x0.c          |  11 ++
 hw/arm/pxa2xx.c                  |   2 +
 hw/display/sii9022.c             |   2 +
 hw/display/ssd0303.c             |   2 +
 hw/i2c/aspeed_i2c.c              | 234 +++++++++++++++++++++++++++----
 hw/i2c/core.c                    |  70 ++++++++-
 hw/i2c/pmbus_device.c            |   6 +
 hw/i2c/smbus_slave.c             |   4 +
 hw/i2c/trace-events              |   2 +
 hw/misc/aspeed_peci.c            | 225 +++++++++++++++++++++++++++++
 hw/misc/fby35_cpld.c             | 137 ++++++++++++++++++
 hw/misc/intel_me.c               | 176 +++++++++++++++++++++++
 hw/misc/meson.build              |   5 +-
 hw/nvram/eeprom_at24c.c          |   2 +
 hw/sensor/isl_pmbus_vr.c         |  30 ++++
 hw/sensor/lsm303dlhc_mag.c       |   2 +
 include/hw/arm/aspeed_soc.h      |   3 +
 include/hw/i2c/aspeed_i2c.h      |  11 ++
 include/hw/i2c/i2c.h             |  30 ++++
 include/hw/i2c/pmbus_device.h    |   1 +
 include/hw/misc/aspeed_peci.h    |  34 +++++
 include/hw/sensor/isl_pmbus_vr.h |   1 +
 23 files changed, 1002 insertions(+), 30 deletions(-)
 create mode 100644 hw/misc/aspeed_peci.c
 create mode 100644 hw/misc/fby35_cpld.c
 create mode 100644 hw/misc/intel_me.c
 create mode 100644 include/hw/misc/aspeed_peci.h

--=20
2.30.2

