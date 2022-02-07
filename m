Received: by 2002:a05:6214:430:0:0:0:0 with SMTP id a16csp1133801qvy;
        Mon, 7 Feb 2022 07:25:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzlNeguBof3nY6VLKT3FbxYR4WKTI9cpdJzb5cjCp1LCV8HpEaJTD3QwVqyWvQXlyHRei9
X-Received: by 2002:a0d:c7c6:: with SMTP id j189mr249988ywd.395.1644247504621;
        Mon, 07 Feb 2022 07:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644247504; cv=none;
        d=google.com; s=arc-20160816;
        b=dJoM+MJIc+4pIgKiYwCAWVr7fbnyTf+l1sHhVtJ/JdlZ370hkGpnN5AkJiWCjWwGqX
         viFi2G4/b8vwshxZM2kmCboeB/taoG3sEdSTtqvNIByjA26VjgxSUnYpDJxKLseJSKhc
         JJpmZ/P3JZIorGsGSutzy6p9c4YUIm63kE/WD9tBEYEUjR3Bpzy+N31SiinqTqj3fifc
         tbeUoRxShRX+1WRUpkEIRgyNagU9f+dV1kW7aAD9mHr4PMq2TOAufh4tZQ5QvpcpVUVq
         fPyebGXGsXsJiklwKSvpot//wlkur65n+hcP7SiC7f3rfZpH8fUHEqFwUwfifDZKdkhw
         3Pnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature
         :dkim-signature;
        bh=kCkgsv5eaUYRiHSMsWv3ktFFO2E9gGbEWbk6zYLA+d0=;
        b=p830QL1pO/Nmie7RpiQ5DNXo4J5c+6ave8ywz690N2NtiJ/3PT+7e2QFbQ019n1ZbB
         /fO4uKcm4mPDk33m2w7sjy6f7PaYOTIg+YFBN4kRJhPoIVAIjWEbQEVMF/ewiYsYBArS
         fMw7mqOwUqyJDVfbAnpMx7teaXzYQdmG9+G/PLYfvVL84zpTd44fziBxlOA9sY8/Kh7D
         woFHJRsVL3+mHsIn7eHTL9q+vaQ+azIfrdOF1MNQalTYw6vYkwCKHj5iDx5Vs2pHNKYP
         lnGknz4xWJzq63H9IRx5ST5VVro2ziupoFR0SvCO2f3o4efb0rdZZ/kQzdHkRip10sts
         gj0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=ma7vUQQh;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=WJvCVlpJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t133si7665995ywb.452.2022.02.07.07.25.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Feb 2022 07:25:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm2 header.b=ma7vUQQh;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=WJvCVlpJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nH5t2-0002IP-6T
	for alex.bennee@linaro.org; Mon, 07 Feb 2022 10:25:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1nH5Z7-0004Ne-SS; Mon, 07 Feb 2022 10:04:30 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:39083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1nH5Z3-0004b7-Ax; Mon, 07 Feb 2022 10:04:28 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0014B32020D3;
 Mon,  7 Feb 2022 10:04:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 07 Feb 2022 10:04:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; bh=kCkgsv5eaUYRiHSMsWv3ktFFO2E9gGbEWbk6zYLA+d0=; b=ma7vU
 QQhJYDbacUyx0oa3r5WBU/vsy+MY6dNqfJrZpqulEOh0sObfeW2nGMSuK006xkOJ
 h00tbsypibl0r2MOXHYWClIEt5CGMX7OPo0jn6D5JTrY9Tp/SdBUZFMnedAzx1Au
 S5A32YRJXEG3+kCWrt6V4mPvgyOEJNaknr7FI1lI/fNj2yMvI4eUGwhzX/AXThSk
 To+czRVPvl3GuodSoaHKDm5WnZYZRgdoVGDrgp4Cqt131NVnf0YxoaTqoqheCwC+
 ysvtYdlChO+mILL0gcY1XVhzwQ3wD7Mu9m8cAEUXCupFFUU329n9PAN716oTWI65
 qXNz8Eku0qo15VIWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=kCkgsv5eaUYRiHSMsWv3ktFFO2E9g
 GbEWbk6zYLA+d0=; b=WJvCVlpJFIB0jm8jTG3D9bXKBfqLpDcH0hqmO8a/4CpNN
 7yt9U/3x3sZ3Ivq6kTBTI8nknNIRlUq2puGp07MI4Kf3FGinkhHwOEfBcR+0EIT6
 6/PMfGCgxC/SUqGeb8l/I0NjJPEMRgMIjqdiHHFfNQy5cebnKyI7RBLWGG+5E5qU
 Se/I+eDkK3uabALqicCo5Y+da7NfxXRxvezTN8HRVhfoPt4dd411pXl61Ou8zi+h
 //bzLTJy/StiXMNX609VokXGnhR2BJWhpHSRnMUX+E3fdnNWKGkLL5ic1jtfQpTl
 X8d2uoqpbMUQWLj5Bciet2HZaA7A2qO21HO7sxCFw==
X-ME-Sender: <xms:8jQBYs4jj-YDnGqGljZCpyiFcJq_KdcxwutE-qwPPpz8JUyR5L-F7Q>
 <xme:8jQBYt5u-7LVpX_kYJSvKTWZCN1J8nNAuSjGagHNDIlymqWl1WaXnpiO7rSeJ_VcY
 rgPe0sZUo8p3mPQNA>
X-ME-Received: <xmr:8jQBYrcAssp3MM55wkL_BNYJVtT3dUD3UAmuQbV2277T8QnWTfVwNrLkXYbCcgqNXM8zKgaQpo0DBxB1X6RJmh3zx-ae5QANObmdV9pjo1pw8JukE4VoMVCkhfZEXaE_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucggtffrrghtthgvrhhnpeekhfeiffejveefveehtdeiiefhfedvjeelvd
 dvtdehffetudejtefhueeuleeftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:8jQBYhIkBtr1g3aViXn-TFBYoBfcTm5AjoocNKddRAeGrThPO_b7NQ>
 <xmx:8jQBYgJM4XEnuterSrbQb-ry6E9Hf4KTdVV8GECpklNssd6W8h3Vgw>
 <xmx:8jQBYizF9TVv1V6P_GbUmSkQJhmuT9AAn9i_aetcBD95rwfLEz7jYQ>
 <xmx:8zQBYlFCsXRHPS5JxY-Uw0e3dV_sMzJqTCA_GXC6MDQN-bbnDjV89Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 10:04:15 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw: aspeed_gpio: Model new interface for the AST2600
Date: Tue,  8 Feb 2022 01:34:06 +1030
Message-Id: <20220207150409.358888-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=andrew@aj.id.au;
 helo=wout1-smtp.messagingengine.com
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
Cc: peter.maydell@linaro.org, openbmc@lists.ozlabs.org, qemu-arm@nongnu.org,
 clg@kaod.org, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L5R4JHJdAmRn

Hello,

This series adds support for a new register interface supported by the
Aspeed GPIO controller, present in at least the AST2600.

The new interface is a single register implementing an indirect command
protocol that allows us to manipulate up to (at least) 208 GPIOs. This
makes it possible to write very simple drivers for e.g. u-boot and
jettison the need for the tedious data model required to deal with the
old register layout.

I've lightly tested the device consistency under Linux. The Linux
driver is implemented in terms of the old interface, so data model
consistency can be tested one way by poking the driver using the
libgpiod tools and then the other using devmem to drive the new
interface.

Please review!

Andrew

Andrew Jeffery (3):
  hw: aspeed_gpio: Cleanup stray semicolon after switch
  hw: aspeed_gpio: Split GPIOSet handling from accessors
  hw: aspeed_gpio: Support the AST2600's indexed register interface

 hw/gpio/aspeed_gpio.c         | 305 ++++++++++++++++++++++++++++------
 include/hw/gpio/aspeed_gpio.h |   3 +
 2 files changed, 261 insertions(+), 47 deletions(-)

-- 
2.32.0

