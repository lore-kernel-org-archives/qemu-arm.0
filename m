Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp352024lfc;
        Thu, 22 Jul 2021 21:37:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylBBTdT5i9zU2gEYdt3waRDE3kSmMAf3WLE5cDiZlKAzMYFMLmCYN9IjLw46MMWVWllXYi
X-Received: by 2002:a25:c683:: with SMTP id k125mr4046790ybf.107.1627015033009;
        Thu, 22 Jul 2021 21:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627015033; cv=none;
        d=google.com; s=arc-20160816;
        b=P3tyEBMrAcJFl+MEszRglt4BHtcgc7ss99E3tHyRw8HfYRnkNYHr3PyWqtd3wK/4on
         M1UkONem7mvD3ycFxQrq5mZSTf9luh9tDoDhN+4BYHWjldv/Q++abcPcxGtyv9mSTNNV
         lPS+l+e9fbs/syjJ57o9gOxu6sLLsoM9bqB3H5nlzuSxKwRvB8gj3jf/eSXyOKAAAyDl
         mIsRspRW9m+qvfqHklWVUMapMiDodEN09oyLtuvJCrSNDY83hHM1L9XLnR17TOl2QuE1
         b8vzgROtm3HBvRu8jHhGYnlmfX95F6Wv4t1sM6YjuHECkxmnaaL3CTdwV8hOd33yOFbB
         12pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature
         :dkim-signature;
        bh=REnU9gwaMNcgjImzi20459JDkQ4gVCf1GEUhjAFVRtA=;
        b=DQOOHOzbBPPZYucGyrfyQZyXgZyzCqxfLHs9nhmFEbjtylGI8YsZMyaFKeD5QIv1uD
         WH8W8zaEzymPGx8vfDRvXSH0A0tcAO0QxnYIDuTK1R17TApkqp0f/z0K9SsLZINBZynZ
         7blO4p93m6bABlW8JUGMCNMQPqrpSkkKRlMEuraGgrmsFRZ6ut0dVVXnBUbcyNsRd+h5
         8+flkTEr93YslIw+6VGjeC6yMFfRNuWfNfctmHBVOQHg+01sd4ArNmihoILNDcIOr4JH
         K90dGprov7rYvFFcC+RY+hY5AkJ374QxAIDESzF4BUMAASO1/CcN2p8wo4W5ej0Q6JpJ
         MstA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b="fV3N/8q1";
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=lOqy+zbv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si30175759ybb.25.2021.07.22.21.37.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jul 2021 21:37:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b="fV3N/8q1";
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=lOqy+zbv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6mvw-0001ei-Am
	for alex.bennee@linaro.org; Fri, 23 Jul 2021 00:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1m6mvn-0001eR-F2; Fri, 23 Jul 2021 00:37:03 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:38599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1m6mvl-00080b-QK; Fri, 23 Jul 2021 00:37:03 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A2FD35C00DB;
 Fri, 23 Jul 2021 00:36:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 23 Jul 2021 00:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=REnU9gwaMNcgjImzi20459JDkQ
 4gVCf1GEUhjAFVRtA=; b=fV3N/8q1fuK/Oau0s4Im5erOup3ZXmPr2Ihsfa629P
 NFfzkDVLSB2MufKO5amK3zfJdeIcO4TAYo6Tye/aCBsrKvF/M/xyK7r8kUhhTVf6
 hb7mSX1cnM4YrwRF5Gx/Yhi0bfEuZ1IbZhF63nOuawcctnelqeGV1EIhi35D6E7a
 fryoi/NfjNytkCVu8tCij0mJSDmAZGQUC598zzJIkdJhfPGo032oIDAcswmoo72H
 0DuDsXoh2hzFeh5ofgvcJ9ivSHADsgy2e+GqJ7IfvKkUSQKxAOK5Dda2QDSOB+SL
 egL/UvmIy8jhDDDdsZgfxsCzYeywjsdb0gRTFtfYuNNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=REnU9gwaMNcgjImzi
 20459JDkQ4gVCf1GEUhjAFVRtA=; b=lOqy+zbvPutBjKUfehyMZipaGKxKJRJHF
 V3UtaRmvJ8pWd3Q+otuWf4+z0ir9lE6LfYrhzhQj9YAXl9fTTYdmjI7mHox2v2ry
 EDPoQ3JU7qM6+Ko1Oi3yTYFZCTkkuKeqOwRGJlG3MmHw+9b2HBGwTV3o20BIU0Fa
 aGZjXcD9rSzXE2tGVg5/H6Otqp2SX3ng88EWIkjj/aLqLExd8ujBvAf+kKLETO06
 nIC2n8I1N1emQux6uVLnorD+XABxa6+DcCex/fboKO7/oUh1gb1DTiHWqRRJyW8w
 FEtYgNgW8WkczlG/gSpp/M7kqClzdvQivJv1viymU44GXmqqo+69Q==
X-ME-Sender: <xms:aUf6YHuPjntI__BV7WsMSl8rm5BYrWmz7CDImCeubDEi8WgYQ2d_vQ>
 <xme:aUf6YIe19edB2wcszPHUiDXz_r_UpIceg76UJiK9Q1zucSrku7aTZbNVi7JSkRyyB
 4KXz42roa6s0bBotw>
X-ME-Received: <xmr:aUf6YKzsiebtI_ehNPNdxfPd39rfx0eSKzHGwVncCmC8nKr8_2nytdjI8fxo1UHYG8RFF3q5vWNMPDo2hqob7F5IhxPv8frC4qgn8dYKXrhWGvcF8arzE4PoO22xM9a152xwSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdektdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
 ugdrrghuqeenucggtffrrghtthgvrhhnpeekhfeiffejveefveehtdeiiefhfedvjeelvd
 dvtdehffetudejtefhueeuleeftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:aUf6YGO5z67GuzXsHf0KcHgZ_VD96MaJi5jrfJgaI73T8KZq-qfOHw>
 <xmx:aUf6YH-liAx5-juSZ9wVpoMXJnNuHUgbn7qIM5zMMQBAEg2S1QeirQ>
 <xmx:aUf6YGUt2U6JoVt4c441poCJT8N8G7amawp-axSKTSx-63xB82AYQQ>
 <xmx:akf6YKb6cT1HmD5lvFo7kR-nJhhu66Z83xviL-nfW33I8IibECAYMQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jul 2021 00:36:55 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: clg@kaod.org
Subject: [PATCH] misc/pca9552: Fix LED status register indexing in
 pca955x_get_led()
Date: Fri, 23 Jul 2021 14:06:24 +0930
Message-Id: <20210723043624.348158-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=andrew@aj.id.au;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, joel@jms.id.au,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WvYpSt++VPtL

There was a bit of a thinko in the state calculation where every odd pin
in was reported in e.g. "pwm0" mode rather than "off". This was the
result of an incorrect bit shift for the 2-bit field representing each
LED state.

Fixes: a90d8f84674d ("misc/pca9552: Add qom set and get")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/misc/pca9552.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index b7686e27d7fa..fff19e369a39 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -272,7 +272,7 @@ static void pca955x_get_led(Object *obj, Visitor *v, const char *name,
      * reading the INPUTx reg
      */
     reg = PCA9552_LS0 + led / 4;
-    state = (pca955x_read(s, reg) >> (led % 8)) & 0x3;
+    state = (pca955x_read(s, reg) >> ((led % 4) * 2)) & 0x3;
     visit_type_str(v, name, (char **)&led_state[state], errp);
 }
 
-- 
2.30.2

