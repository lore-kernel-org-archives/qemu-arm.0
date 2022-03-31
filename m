Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp225226lfb;
        Thu, 31 Mar 2022 09:58:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzNnC67feZXGyXGI5SVKXPm30XQI8l2Dnm1EpOyAdEcRFo+ouJ0MVM6Fr1j6/f0VVFUgsL
X-Received: by 2002:a81:6d05:0:b0:2ea:cb7f:9fc0 with SMTP id i5-20020a816d05000000b002eacb7f9fc0mr5735761ywc.297.1648745934265;
        Thu, 31 Mar 2022 09:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648745934; cv=none;
        d=google.com; s=arc-20160816;
        b=soQkaCjKn4w1cLmL30cqU6jZuvIRn4QvRyPztwL8aTypyZ3XCui+GtSdCmzYW4VRWb
         tk9puELlH+GH4CcsjemAUxjFvtj7ZAnnLVYFpKhyo4uhK2jgepQPxTrBPosv9Z3lARkR
         dA3L+AL0Si/XR1NqsnMSjL8uBit2Cx4/PDT6mEqABjy1O7Lmp9u8x6Bxs+4JTlD1md+h
         8wBrdzL6WF//cGat2u+AM87amfUthMLLCS6u3Ynys441zfjaXlrC55EryxNwdvlDaGBY
         py8jbpmqy5zxFpz0ddyvbVM2VvA8yVnu8PP+z+XRhU/mpl7SbaikXh/QD5jwQ3F6F+wk
         t4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature
         :dkim-signature;
        bh=1WRY1D6ylOonmR+UXUnHo7Y5sqkvfCyFsaIhwjq1Gdw=;
        b=PUI5kZfIIdm4y3hGQnw3VnI8gFv8kU3LX1X37Az1H/OQ1b6UZuXuJKWkHnUAz53VSN
         PGTRMyUAp83n6Nd64adJfGBFs6RfH9X3EcaVYHVN7h2bNgrJGnMiTCsn/7Tbl1mZImzM
         J7eEvUOFG25jLM/ltbIkNgP3i6KZT5CCd/nmuYD7bguun8Q84Uj/XucH9AZm2yVioSti
         DQTwa8/JPDdk+xtyhN7bbd/dZ2p0TjEalisppJVlspHyhDlYpnMrB/BR2T9u5pPAiJ4m
         xWmdFgLob0SkrW1vxFtkivFhlgQ585NE60ZBnv4yHaKTNj3ASOeFQGM1EToYIuVvNVl9
         WXeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=H2a+5jpH;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=MaQ9uEkM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e137-20020a81378f000000b002e5bb9dca21si72373ywa.170.2022.03.31.09.58.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 09:58:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=H2a+5jpH;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=MaQ9uEkM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZy8L-0000WJ-Ct
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 12:58:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nZy7J-0000Se-R5; Thu, 31 Mar 2022 12:57:50 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:38583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nZy7H-0000tO-8Z; Thu, 31 Mar 2022 12:57:49 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id B730F3201F73;
 Thu, 31 Mar 2022 12:57:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 31 Mar 2022 12:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=1WRY1D6ylOonmR+UXUnHo7Y5sqkvfC
 yFsaIhwjq1Gdw=; b=H2a+5jpHpnii21qkEk3Ptj0wp7RWjJOY6STOnYpkk86v5Q
 np2dG6KjKo8ZpF/h0hGkU+jCNX/vHQsXqgeg4V26cJx/JXASKB6mpz0+DQHTFPmj
 1H7MmwsRaLfXLeU6vKUngdGPJ+sV5eq7nLRV6Kpw+jAh5wKPwn2gMvd+5b6NVX7e
 AEIPAQbM3V6i2qKr3JzG7SulUq9Sn7KwftQNvyMK173cS+QSpbryR+isP499RHLd
 SwZHA821O3slsxA9CvqdtSlbGvZHGNtI/qVhF1/OarI/enrZ05eeLDVQ04LFYZ6w
 dRq5fTLB3AAAWzOPLuiujCWA7OqwDo4+87DEBFpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1WRY1D
 6ylOonmR+UXUnHo7Y5sqkvfCyFsaIhwjq1Gdw=; b=MaQ9uEkM+mNVoliE/aBsIZ
 2KhvxKFz4JcHEMaypkbsc84Lff+SrgnOO+yf8rwRoK2Q1nYy4lizTzjW2sa9AejE
 oyRsZZ5+hwT+WuJsAQj4u1PSMtHh4+ggAh1cGo3zpDcVp/MuYPb49BbkZdMNwSTQ
 63CMcm76b5mnsX+EH5xSVlfEc3V/wQONIlBKVa65mvfZktkVTJiMXzYzHsB9QLDM
 YymgmONWfUyMjS5lz3fV5gxMvXzwLGNX+/PT2UCzr35h0bCOxj1T8P+lcM4ZRtzr
 ZGmJiOePVLnHdEO0ReGG0JknhTp47NEXfy6KGTYvEeJw5nGTzZOvAWzE/eQz374Q
 ==
X-ME-Sender: <xms:hd1FYhrtohsJKxp63C9w_dtWTZDf1urc82M7xrEruwRLqzHKEPhGmA>
 <xme:hd1FYjpsUo2Onz5RZgJ3j00YYKjECwDRkWvq5z-QMAK8WMvp6ydjYJMot4xPlcQHd
 hDT67yvMsNjs8BbEvA>
X-ME-Received: <xmr:hd1FYuOILEIxkHDbkU0hSiZE-JomuZxSUD2tGcg5cbvj3cySyStEQel6Z130SFfjkNOLyMSQuUjIWhcnuX_FrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeegudeghfdvgffgleevtdettefhhfdvieevffevgfelkeethfevteffhfeltddv
 ffenucffohhmrghinhepnhhvmhgvgihprhgvshhsrdhorhhgpdgumhhtfhdrohhrghdpsh
 hmsghushdrohhrghdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:hd1FYs6mGYApWKhRunUSmj9yVK_ZHNGihzMc2klKqL5Ap5JWjmV-Ww>
 <xmx:hd1FYg7e9DwVCRh6A0bcW1X63llaCqHuDS2TyKoB0MvL7NuQfVopiw>
 <xmx:hd1FYki8kU1C3vSrTNUv9a3GCj3ZLRkaM87h1LoJzAha2jQco4f_fw>
 <xmx:ht1FYtwPp9KkoV1Oe8xJ0a4DP0nZ2MkJ2fwD6JoTVXKTBg1W5tSvtg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 12:57:39 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/4] hw/i2c: i2c slave mode support
Date: Thu, 31 Mar 2022 18:57:33 +0200
Message-Id: <20220331165737.1073520-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Matt Johnston <matt@codeconstruct.com.au>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UGbU6MpXmPcm

From: Klaus Jensen <k.jensen@samsung.com>=0D

Hi all,=0D
=0D
This RFC series adds I2C "slave mode" support for the Aspeed I2C=0D
controller as well as the necessary infrastructure in the i2c core to=0D
support this.=0D
=0D
Background=0D
~~~~~~~~~~=0D
We are working on an emulated NVM Express Management Interface[1] for=0D
testing and validation purposes. NVMe-MI is based on the MCTP=0D
protocol[2] which may use a variety of underlying transports. The one we=0D
are interested in is I2C[3].=0D
=0D
The first general trickery here is that all MCTP transactions are based=0D
on the SMBus Block Write bus protocol[4]. This means that the slave must=0D
be able to master the bus to communicate. As you know, hw/i2c/core.c=0D
currently does not support this use case.=0D
=0D
The second issue is how to interact with these mastering devices. Jeremy=0D
and Matt (CC'ed) have been working on an MCTP stack for the Linux Kernel=0D
(already upstream) and an I2C binding driver[5] is currently under=0D
review. This binding driver relies on I2C slave mode support in the I2C=0D
controller.=0D
=0D
This series=0D
~~~~~~~~~~~=0D
Patch 1 adds support for multiple masters in the i2c core, allowing=0D
slaves to master the bus and safely issue i2c_send/recv(). Patch 2 adds=0D
an asynchronous send i2c_send_async(I2CBus *, uint8) on the bus that=0D
must be paired with an explicit ack using i2c_ack(I2CBus *).=0D
=0D
Patch 3 adds the slave mode functionality to the emulated Aspeed I2C=0D
controller. The implementation is probably buggy since I had to rely on=0D
the implementation of the kernel driver to reverse engineer the behavior=0D
of the controller slave mode (I do not have access to a spec sheet for=0D
the Aspeed, but maybe someone can help me out with that?).=0D
=0D
Finally, patch 4 adds an example device using this new API. The device=0D
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
  [1]: https://nvmexpress.org/developers/nvme-mi-specification/=0D
  [2]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0236=
_1.3.1.pdf=0D
  [3]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0237=
_1.2.0.pdf=0D
  [4]: http://www.smbus.org/specs/SMBus_3_1_20180319.pdf=0D
  [5]: https://lore.kernel.org/linux-i2c/20220218055106.1944485-1-matt@code=
construct.com.au/=0D
=0D
Klaus Jensen (4):=0D
  hw/i2c: support multiple masters=0D
  hw/i2c: add async send=0D
  hw/i2c: add slave mode for aspeed_i2c=0D
  hw/misc: add a toy i2c echo device=0D
=0D
 hw/i2c/aspeed_i2c.c         |  95 +++++++++++++++++++++---=0D
 hw/i2c/core.c               |  57 +++++++++++++-=0D
 hw/i2c/trace-events         |   2 +-=0D
 hw/misc/i2c-echo.c          | 144 ++++++++++++++++++++++++++++++++++++=0D
 hw/misc/meson.build         |   2 +=0D
 include/hw/i2c/aspeed_i2c.h |   8 ++=0D
 include/hw/i2c/i2c.h        |  19 +++++=0D
 7 files changed, 316 insertions(+), 11 deletions(-)=0D
 create mode 100644 hw/misc/i2c-echo.c=0D
=0D
-- =0D
2.35.1=0D
=0D
