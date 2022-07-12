Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1215558lfp;
        Mon, 11 Jul 2022 19:33:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uhc1x01OWgUTDi4XMH04A6KgpI4IHlW8OopALksnVI3RwuKqUWPkOxdY1AJzT3FDalUGeu
X-Received: by 2002:a05:6214:5087:b0:473:3b04:ef41 with SMTP id kk7-20020a056214508700b004733b04ef41mr15461642qvb.81.1657593217895;
        Mon, 11 Jul 2022 19:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657593217; cv=none;
        d=google.com; s=arc-20160816;
        b=MqbUOq4vmqvSMPHTLSBqCBSMZjvJ2Du1z8+g0cDpriMQORjm6NJZTHmRZzZMkuvQlZ
         9eu+jJgq0U63l6a8yBtA+GA/fJ/iJc51TYjBSdWI4zSsUO0h9PTFyIzJjQaP0NfaOJIS
         ksDPMzObAdwMPqFkLzJQnyCuVAYVrkw1podFbGDJ/UylIBYJxfG8n0cTwhAr8Nv6MUWU
         f9vP0ANazcdx9LvoNjOps0ItHngZFhxSCZ+Sco0kDXAOKaqfVojaX5bZXk4xOHO7du5t
         xljCwswVUe6si9Oc6yN57sjh3ne6pv0D5FJnvpArBSVkaXDAXVY4rNIs502lJ2v8b6Ds
         tvrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=VhqGtyrYzVJ9Rd1eruRM4BhB7rRjhoY3NcA1oWCb5BQ=;
        b=T07mTczLhTa+CMS5avyqwSUri2vHjfzaTniYDBqWn0PZD+BO4qBJUdo3VQhYtjdzIn
         Uuqwh5bAc+GZ78hEgOUgzq4fxxmyIrPU2Gz12VvWcx6Cxarw605CHOdIg1nhOveG3+dj
         dJAyEvh9akn5jCwmVHtNl2uTenN28icxFAeKTKjC1K/pPAPzeGeIifAXyqcCyLgYW5Ps
         hXmpMETqfgZxfaeQmhkFC+77vyGMTDcbB6Zs9fCycZ8ebV48Q3oXwU4BZzhlAN6wbEXy
         F45NTFVWWAmtLURMQAdn/Ru/VLORcayi6I4av8Dy20MaM1k6xvv0UauQ3bYI2eZFIy78
         +Gpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=TN5ezanD;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=m07c1kMq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020a05620a29c200b006aed56fc14dsi5957864qkp.339.2022.07.11.19.33.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jul 2022 19:33:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=TN5ezanD;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=m07c1kMq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oB5iT-00083O-9c
	for alex.bennee@linaro.org; Mon, 11 Jul 2022 22:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oB5hV-0007zo-Mc; Mon, 11 Jul 2022 22:32:39 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:36555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oB5hT-0006Yi-7R; Mon, 11 Jul 2022 22:32:37 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 677DA580A06;
 Mon, 11 Jul 2022 22:32:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 22:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1657593154; x=1657596754; bh=Vh
 qGtyrYzVJ9Rd1eruRM4BhB7rRjhoY3NcA1oWCb5BQ=; b=TN5ezanDhc4qbCszTG
 lMaU50vfRITwr172lpq4XLara3rONDfvOjTthxgPxjMDkIv8gAbMc1pDhYXhd8UD
 WlBqwdxeBr3EsDRlDJwSnfVITQO5K7PGz+BAvc5uj00MZp5PgzIK7yapfUonQF7K
 UTWKpsEYaQ/Dxp1Cxn9suB3XlPUWwG3zLOvczaV/AGC+FueKX76jOZL1ehGE59Ji
 cBS8lI00Clmd6sjm3+UMdiWqBw/3zVAcehe92fYYVRig4BnEQdIp7//n73jCe1gM
 EGhLpIUkoCMdRLDGy/mOxOkAQR1j+olNuHHoe0kpIRrOj9ctngign7pVs/PqutOW
 CK4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657593154; x=1657596754; bh=VhqGtyrYzVJ9R
 d1eruRM4BhB7rRjhoY3NcA1oWCb5BQ=; b=m07c1kMqk9B4hU717bQJXGQQVitgi
 WRR6CTUDfaKmt4gaDZC9A+x+tFCYVZffWq0Uwpi/7idPqZ7XWf8KH7K/K7bOpEXv
 Rr8z8FVnRFuqOn2qt5XoJ2itElWWNR2QGvEVCOiIRRuy2uC6oT6d4/nuTn5yQ6/f
 KHCxkxP+/bxGRdjcvD5qfP+3pI+tsSgblqp5pIcwNhSGaYAa5m1s1saNT40wwddV
 VAdHqB3bUzcHs+LIiAuJ6G62uh3IaBK7K8GdQOfJ2zhsw/Ps3JrV2qfic/kmDFn9
 atecGsO9+kIKiAjoQdvkCCvcBHNmQt7lnZwAX6gTGs2iEb0QMOWPob1/g==
X-ME-Sender: <xms:Qt3MYhowLbj3plnJDXelHVgg8a6mnBVTTLNRe5o3wvk9W0ERRwgj3Q>
 <xme:Qt3MYjrzYjAD1fpZLLdqUZ2s792KBuchqwQ50qgIPJZKhkJfhQNdKzWkRWKIff7Wx
 zuCAu3YuQO5pnK8tYQ>
X-ME-Received: <xmr:Qt3MYuMDgP2GIG2k5VrO1kDkXGHqDOtt6WKHhiEmrONFCCI-k6H9cNHMR-Co8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgedgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
 redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
 esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteelgfeuleeffffffeekiefghfej
 uefgtdfgteeigeekvdefffevieekvdelteevnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:Qt3MYs4FJ6d57Np4jB_mEBJVZ0wynaifDO0bqtzuS3_3d0RsxSA4uQ>
 <xmx:Qt3MYg5RAHVS0LoKk4pyjw3IuIr6_2oByvTznDAJ4qCf1j6LSoLjCg>
 <xmx:Qt3MYkizw3e0sYzznTVRoNCitajXZa3NUAcrjlTbVoDCiLz6fUvGFg>
 <xmx:Qt3MYiurE3gyjZpc6f_mo228LmbaJnzFuiAdLq9JJfNjkHOF0ysEpw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 22:32:33 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] aspeed: Add fby35-bmc slot GPIO's
Date: Mon, 11 Jul 2022 19:32:19 -0700
Message-Id: <20220712023219.41065-4-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220712023219.41065-1-peter@pjd.dev>
References: <20220712023219.41065-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: DnokFSxRMIWe

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6fe9b13548..0ce9a42c2b 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1343,11 +1343,23 @@ static void fby35_reset(MachineState *state)
 
     qemu_devices_reset();
 
-    /* Board ID */
+    /* Board ID: 7 (Class-1, 4 slots) */
     object_property_set_bool(OBJECT(gpio), "gpioV4", true, &error_fatal);
     object_property_set_bool(OBJECT(gpio), "gpioV5", true, &error_fatal);
     object_property_set_bool(OBJECT(gpio), "gpioV6", true, &error_fatal);
     object_property_set_bool(OBJECT(gpio), "gpioV7", false, &error_fatal);
+
+    /* Slot presence pins, inverse polarity. (False means present) */
+    object_property_set_bool(OBJECT(gpio), "gpioH4", false, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioH5", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioH6", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioH7", true, &error_fatal);
+
+    /* Slot 12v power pins, normal polarity. (True means powered-on) */
+    object_property_set_bool(OBJECT(gpio), "gpioB2", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioB3", false, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioB4", false, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioB5", false, &error_fatal);
 }
 
 static void aspeed_machine_fby35_class_init(ObjectClass *oc, void *data)
-- 
2.37.0

