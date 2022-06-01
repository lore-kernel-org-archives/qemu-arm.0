Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp4478540lfh;
        Wed, 1 Jun 2022 14:09:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOvxVxIc2C7fKmvx2u/YYckQdJHEzrhnicBY1ASN75OTpz4me/7zlFn2Z+vaMzBUTNaKB+
X-Received: by 2002:a05:622a:407:b0:2fb:be7b:68be with SMTP id n7-20020a05622a040700b002fbbe7b68bemr1335768qtx.309.1654117750275;
        Wed, 01 Jun 2022 14:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654117750; cv=none;
        d=google.com; s=arc-20160816;
        b=A2YNsagrUYammlUCNd+6A/YmWj9YkCHVbRmH6JwjeVvLus2MsKGcdgWvDJQI9L8b8K
         h1vHusfBQ2YUlJKFxYzjiiV07U1SsCdyM1RXVFita/P/TAzZDfwV4myJygfZRzsHLQOp
         VXy0gfDTXLYDwveLuxO05jcp6iLYFKY+cvQaMShutSqyekoSeL65Sk6aniOaaH5ByGWd
         DunvabXSTPAOUTYlppf+JSpu5DZUgx/1YIWTJFZT33dFPIxPwsxbGjluk9iBx8pHeui4
         Fq9siMnk2lXOs+jXJUg3dZWpDSmthWo197QZfISBsEIAJE9i/BFGh7i+txLSRzDJKjSA
         SMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:feedback-id
         :dkim-signature:dkim-signature;
        bh=dd/M8x+cO5fVJXYnQdacCEg1x3ITfzjZFn9e+e5c7RA=;
        b=k8lH7nhFpe90bJQKbXWUmuLu999bLYKVouNFCns33XGg8hUkO3Mu4HJpSMGTW6JJgz
         SgRFFr0UPZff2VlZVgXdkhRMtWVHCRC+aW/O+phv2LmXpSm/1gmPvz9HdRhVgBH7cbQd
         NFKkBSUggBClHo+cuQ4KP9ZxjHWKPvWh+DmfefE30fG+6MMaIAzTm0ibXWVdFvB7lg02
         LuHMbK7TpUxRP2djWrl3Nrg8268744Nxz+127FK/CPASk8muskST7wadJlqx+tQRtkMR
         029x6Q6TFRDiOmBrUZyUoZtD+WKrBVtH++QuEJF1GjJuL4Wi/wP5tl0N/VMh5q7tIQQt
         dc4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=JIm9tMhu;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=KJICCMBn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf1-20020a0562140e8100b0046267134425si1287538qvb.258.2022.06.01.14.09.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jun 2022 14:09:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=JIm9tMhu;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=KJICCMBn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwVaX-0000oY-Kh
	for alex.bennee@linaro.org; Wed, 01 Jun 2022 17:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwVa7-0000nM-C0; Wed, 01 Jun 2022 17:08:43 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:54177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwVa4-00020a-6u; Wed, 01 Jun 2022 17:08:43 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 851F45C01B4;
 Wed,  1 Jun 2022 17:08:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 01 Jun 2022 17:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1654117716; x=1654204116; bh=dd
 /M8x+cO5fVJXYnQdacCEg1x3ITfzjZFn9e+e5c7RA=; b=JIm9tMhumgvpCSSNOW
 xWFwtdZdLbfqRi1xIiuM+od4oGG9psp2wrKU18TAKkKB3DEMl4q/7p5DbA1+EPCx
 PUoXgHuUBoyM5pntPHpuYoWP7XQyyjJdaaNTHCPoXvydqsLiQXFHKDYMMH7/21QJ
 M/aw5+kb8zJ25qzjXvhzqS1+Vxym1YR3UPYMZq/xWPr2QsrwoLwz7vUFCpMvwQvH
 2WzndtIfRugbSYWwrymlkGdBaBfgYH9GjLrw+Kut6x8hQkCBSsBYpJ+HlTux4kRL
 PN1KZfZkswLLB40ZOPNtv9Qk1TpgcWulFdcX7Kd2ge4t/Qi4bDY33iDtEwNcNrl4
 o8aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1654117716; x=1654204116; bh=dd/M8x+cO5fVJ
 XYnQdacCEg1x3ITfzjZFn9e+e5c7RA=; b=KJICCMBnBZ9BbTvYh0XjVe0FNyPvz
 EX1xY8kwwZ3L9gsACCiITXlTJaOX062njWITAEhEcunqZzd9PJmSJbBTYmHT450O
 3MObWmccfRW5doPPSkId0KEPSJ1xUhu0CFjyjV7PkGvbSLYNSfdviNfhVACAEseQ
 6u4zCyIrj1Jkr2W65GGjeIT0mFyuihJ0x1yB/Tjvz5V4E5dGtl7oV6rEimjb5qXH
 3nMPCEAjHj70Ih0V8bWM178vB+1lpPWPvwKenGvkUuLtYTM/ZKGzpUWKVDnVobgO
 vd/r6HwsD/+GqiCZBtxr5TiHUTMPh/dF1J3NKP5KtDTIHz6X6K7fgH8QQ==
X-ME-Sender: <xms:U9WXYo_qt5xCfcrhp65iHmFreaDpGev5qpZv9b_hr8Ty9ybw3FYKyA>
 <xme:U9WXYgt11XzdloS_R2_nQ_pg3LmqTOxYtoe5VsTXWzZ-FctE-PKKG3D0mhvL1MBFj
 0DMLcWViuDmTt2NdNc>
X-ME-Received: <xmr:U9WXYuAPj1Uzce0t9oVqRPrtsEDj79CMbz8EWNLPbtoR74suKyrnqZvY8bLH8x9nKD5ibzvXEH5tqV30azaY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledtgdduheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofggtgfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfevvdevgffghfeggfehheekueevhfeigffgfeetfffghfeiueekleduuedv
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:U9WXYodukB2nlruVkXxvfCQ2SKxEMx7HJiP6kDfLJiI6elRIdfoqDg>
 <xmx:U9WXYtMdhIwkUMhCR-_KMNQJ47PvJh6QjLxrsPAJXN53Tj4WnZ4f-Q>
 <xmx:U9WXYinhdoBtxnHvnitTs9N-dg-OaMG_mL80nm8IvA1csy05ZhVtIQ>
 <xmx:VNWXYimQGzE5wiEwewi02RCO6JOaQIa5CXBygvJ4INyMLxBelgt6NA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Jun 2022 17:08:33 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-arm@nongnu.org,
 Peter Delevoryas <pdel@fb.com>, Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [RFC PATCH v2 0/6] hw/i2c: i2c slave mode support
Date: Wed,  1 Jun 2022 23:08:25 +0200
Message-Id: <20220601210831.67259-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: qqyfyCr+i8Hv

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi all,=0D
=0D
This RFC series adds I2C "slave mode" support for the Aspeed I2C=0D
controller as well as the necessary infrastructure in the i2c core to=0D
support this.=0D
=0D
v2 changes=0D
~~~~~~~~~~=0D
I finally got around to working on this again. I'm sorry for not=0D
bringing a v2 to the table earlier.=0D
=0D
Mad props to Peter and Jonathan for putting this series to work and=0D
pushing it forward! Thanks!=0D
=0D
This series is based off C=C3=A9dric's aspeed-7.1 tree, so it includes the=
=0D
register fields. This is all "old register mode", but Peter seems to=0D
have added support in new mode.=0D
=0D
There are some loose ends of course, i.e send_async doesn't handle=0D
broadcast and asynchronous slaves being sent stuff can't nack. But I=0D
wanted to get some feedback on the interface before I tackle that.=0D
=0D
This series=0D
~~~~~~~~~~~=0D
Patch 1 and 2 are small Aspeed I2C changes/additions.=0D
=0D
Patch 3 adds support for multiple masters in the i2c core, allowing=0D
slaves to master the bus and (safely) issue i2c_send/recv().=0D
=0D
Patch 4 adds an asynchronous send i2c_send_async(I2CBus *, uint8) on the=0D
bus that must be paired with an explicit ack using i2c_ack(I2CBus *). We=0D
have previously discussed how we wanted to handle the issue that some=0D
slaves implement this and some do not. Using a QOM interface was up, but=0D
couldn't figure out a good way to do it. I ended up decided against it=0D
since I believe this have to be a run-time check anyway. The problem is=0D
that a slave can master the bus and try to communicate with *anyone* on=0D
the bus - and there is no reason why we should only allow asynchronous=0D
slaves on the bus in that case, or whatever we would want to do when=0D
devices are plugged. So, instead, the current master can issue an=0D
i2c_start_send() and if that fails (because it isnt implemented by the=0D
target slave) it can either bail out or use i2c_start_send_async() if it=0D
itself supports it. This works the other way around as well of course,=0D
but it is probably simpler to handle slaves that respond to=0D
i2c_start_send(). This approach relies on adding a new i2c_event, which=0D
is why a bunch of other devices needs changes in their event handling.=0D
=0D
Patch 5 adds *partial* slave mode functionality to the emulated Aspeed=0D
I2C controller, that is, it only supports asynchronous sends started by=0D
another slave that is currently mastering the bus. No asynchronous=0D
receive.=0D
=0D
Finally, patch 6 adds an example device using this new API. The device=0D
is a simple "echo" device that upon being sent a set of bytes uses the=0D
first byte as the address of the slave to echo to.=0D
=0D
With this combined I am able to boot up Linux on an emulated Aspeed 2600=0D
evaluation board and have the i2c echo device write into a Linux slave=0D
EEPROM. Assuming the echo device is on address 0x42:=0D
=0D
  # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-15/new_device=0D
  i2c i2c-15: new_device: Instantiated device slave-24c02 at 0x64=0D
  # i2cset -y 15 0x42 0x64 0x00 0xaa i=0D
  # hexdump /sys/bus/i2c/devices/15-1064/slave-eeprom=0D
  0000000 ffaa ffff ffff ffff ffff ffff ffff ffff=0D
  0000010 ffff ffff ffff ffff ffff ffff ffff ffff=0D
  *=0D
  0000100=0D
=0D
Klaus Jensen (6):=0D
  hw/i2c/aspeed: rework raise interrupt trace event=0D
  hw/i2c/aspeed: add DEV_ADDR in old register mode=0D
  hw/i2c: support multiple masters=0D
  hw/i2c: add asynchronous send=0D
  hw/i2c/aspeed: add slave device in old register mode=0D
  hw/misc: add a toy i2c echo device [DO NOT PULL]=0D
=0D
 hw/arm/pxa2xx.c             |   2 +=0D
 hw/display/sii9022.c        |   2 +=0D
 hw/display/ssd0303.c        |   2 +=0D
 hw/i2c/aspeed_i2c.c         | 152 ++++++++++++++++++++++++++++-----=0D
 hw/i2c/core.c               |  70 +++++++++++++++-=0D
 hw/i2c/smbus_slave.c        |   4 +=0D
 hw/i2c/trace-events         |   4 +-=0D
 hw/misc/i2c-echo.c          | 162 ++++++++++++++++++++++++++++++++++++=0D
 hw/misc/ibm-cffps.c         |   2 +=0D
 hw/misc/ir35221.c           |   2 +=0D
 hw/misc/meson.build         |   2 +=0D
 hw/nvram/eeprom_at24c.c     |   2 +=0D
 hw/sensor/lsm303dlhc_mag.c  |   2 +=0D
 include/hw/i2c/aspeed_i2c.h |  16 ++++=0D
 include/hw/i2c/i2c.h        |  30 +++++++=0D
 15 files changed, 428 insertions(+), 26 deletions(-)=0D
 create mode 100644 hw/misc/i2c-echo.c=0D
=0D
-- =0D
2.36.1=0D
=0D
