Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp370489lff;
        Thu, 12 Dec 2019 21:49:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqwd0Oagd6GJW7sYtsK/c4tgqnzyPW8ckLAMWJ/nHUOdpbfQiOxEiGbjFgglGPkW8YKO2RlE
X-Received: by 2002:a37:801:: with SMTP id 1mr12470583qki.326.1576216162460;
        Thu, 12 Dec 2019 21:49:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576216162; cv=none;
        d=google.com; s=arc-20160816;
        b=LlSTQZcp2+64tVQn54Fif474+OSFgtQaSopxLIhqS/2ul9fgjicPI08x0w4GvnxGs7
         XeckfMkdd3w3yo9yTEUlTC60pmOf1L/V2WqdXyY6YEVclO2eGcjUqJ860HzwO+4qEqWT
         ebMMUQlJ+1BBzpWjkPGp/s1EScc4w0eDQI7zDEMh9006GFe83Nsp53jua9rNmbp1CaCE
         +gQ5egIFA6EvZ0qEnZteXjzQAT17oa65ufMYIsck835IBa7QQPYmUH6XGk/t5cMMouRM
         n+jZsSA5/dNVgWhzT3kEe6x2TKkBys8sSX8qZrTEOax4DoIIgLyWRIB2wqpLyrAh0WBO
         VV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature:dkim-signature;
        bh=Y2G4Ydhqmr8BBUdomWAJiCRB/fhnREwhAAn2omPfwug=;
        b=RiM8ylu+dszIfxFw47xUoVOBCFY5Nox+QAamdulSiHZ2+ZPNP7VZ+qtqWdaCv2rlNx
         UQU89YYUXx60otB2utk3lR5uqEMbCc1+1208M2/k70L2NT0++0QLPrWgRn3Av0H2rwXG
         WV3mvwfbHQRrEwtiBCTluyGTFpZiZXMrTt1iSMPETHmpYGAR5rjrKRrSDTOoUygeqdZj
         Z/qafneUriVBorvrK+Fi8hZnSsxAEWGE+lxKN22CeA6DhYKNKZEPGBAireQ3DfEZX8ua
         9cKEeo9KCyOd2/k1vBlgYGppcw0hRfc7S3KkHFTDvsDLv00HmK6dPRYcifUGxBkbUXvd
         pojQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=MdCLTp4d;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=MR1gLMwD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si4312556qka.203.2019.12.12.21.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 21:49:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=MdCLTp4d;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=MR1gLMwD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ifdpJ-0003KU-Gf
	for alex.bennee@linaro.org; Fri, 13 Dec 2019 00:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56914)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1ifdov-0003CN-Sq
 for qemu-arm@nongnu.org; Fri, 13 Dec 2019 00:48:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1ifdou-00052G-U1
 for qemu-arm@nongnu.org; Fri, 13 Dec 2019 00:48:57 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:59891)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1ifdou-00050e-Mg; Fri, 13 Dec 2019 00:48:56 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 69B568F7;
 Fri, 13 Dec 2019 00:48:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 13 Dec 2019 00:48:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 Y2G4Ydhqmr8BBUdomWAJiCRB/fhnREwhAAn2omPfwug=; b=MdCLTp4dfLtQJ8a0
 7G8iWhsruhSpcZ+1LMxK8vb9NYpBp/2zF11p9OTPoz4TTEFF6QBid7Fcdy9seGBP
 J5bDR/z5840l0gbz4YKV5yo1RSkiABi6h8TfkLZ+8CG1xotZEpjgV2syIIxvSa8z
 x1YeghQKiaR9ElRtAVrqispkD17orP8aZlnNTFKvOoKWWQlCLb5Hx2RItxn8e7rx
 2PV2QCZREY/Q8+GlbFEB1S8KNpGaYEq5dy4+jWUVEWROeD9ZuWBsGbOxI0n7jQMz
 2nXRuZKjyAIMIIG1mYZ5ncxGOuLTUWVEVyS2j71ItNz2IwpUaMrNx8E6nHB28efC
 BRN9eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=Y2G4Ydhqmr8BBUdomWAJiCRB/fhnREwhAAn2omPfw
 ug=; b=MR1gLMwDMZCGhn8K16fzDJhe1ZeYghY/W8U92hHvm/5NIfj3scf8ok+I3
 5pUl2Ap4gizwFfyTfPf6HKFDOdvAkiup0ZJNxYeZPEbMaqfPVfu1bxi59AhNEiem
 BBL6CGgztrJ4AtwCVGLKLW0ZrRAmKq/Bt1vBnrQQClkAcx+xpMErgjZQOe7zqgV9
 7ckIJHEPxfqoiJ3Roof9z7R2f5GWErSZi9EJK/2TVpuCqvzz6onexbCXHYUL/pTE
 Jhe/fii+QqpT3eWfoNwuVwLEdwqhzgjhhtLnVgdEUFxnOxlTFo6gFEnqMHmxXCo7
 gwoMj2ap729N3np5EnGKtWF0iLMKA==
X-ME-Sender: <xms:RibzXflDqFkqypoaoriat0Hj8rvQHRUe2Err55jxcIpdeb5hqUqtUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelkedgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnughr
 vgifucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtd
 dvrdekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
 jhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedv
X-ME-Proxy: <xmx:RibzXZuNbwyUk0Dot8ylXpgGKTmmLyJ9vzTW0Fa1pC5kg653MreiiQ>
 <xmx:RibzXd8frxzpMH3ECFYNoNuo5iQznVeBgL8ewJKtplYmvjL46vuRsg>
 <xmx:RibzXTMWaNbVsq0b_swMmcOatFl9bQKZdCLzmPL6Dxo3staJotf-KQ>
 <xmx:RybzXccGlFrswB54pYBaNRZKbAHrWNKnhLeElJMCnq8ykUMJGMaNpw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id E07E480069;
 Fri, 13 Dec 2019 00:48:51 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 4/4] ast2600: Configure CNTFRQ at 1125MHz
Date: Fri, 13 Dec 2019 16:19:51 +1030
Message-Id: <080ca1267a09381c43cf3c50d434fb6c186f2b6e.1576215453.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.ec85a2db47c3e10de70fba144e1bc75caf2f0a91.1576215453.git-series.andrew@aj.id.au>
References: <cover.ec85a2db47c3e10de70fba144e1bc75caf2f0a91.1576215453.git-series.andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 64.147.123.19
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, clg@kaod.org, philmd@redhat.com, joel@jms.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o8i/X4yfUxn7

This matches the configuration set by u-boot on the AST2600.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/aspeed_ast2600.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 931887ac681f..5aecc3b3caec 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -259,6 +259,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         object_property_set_int(OBJECT(&s->cpu[i]), aspeed_calc_affinity(i),
                                 "mp-affinity", &error_abort);
 
+        object_property_set_int(OBJECT(&s->cpu[i]), 1125000000, "cntfrq",
+                                &error_abort);
+
         /*
          * TODO: the secondary CPUs are started and a boot helper
          * is needed when using -kernel
-- 
git-series 0.9.1
