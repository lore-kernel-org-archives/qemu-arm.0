Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp782772lft;
        Thu, 30 Jun 2022 17:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uCImF1VSPTxhX2L3UaCWagomtpxMGjuEtjgqlpTGNK+A0Tgl8NVzs4N1cFyITT2noMGkv8
X-Received: by 2002:a05:622a:f:b0:31d:314c:f396 with SMTP id x15-20020a05622a000f00b0031d314cf396mr4678837qtw.191.1656634144668;
        Thu, 30 Jun 2022 17:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656634144; cv=none;
        d=google.com; s=arc-20160816;
        b=S8fOjFrEVgAD9cuYQ04vn1yu0l3zSPXQFN2wp3q6iyoxmeBTC3pvWoo148g4HhIC9X
         8VIXN5laavhnog32GkVJ0sbY9Ln5bTphyHOWwoUBoi2BcryVTwIsl7H5tUw2ywxagnmd
         /cDRWiJzPq6BdUqp/GYjcNJwKaw3z4VO/n7XcQlBGjdVdZhhZQmIIyTu5jWHNzYTEnXR
         zkhyz8BFLKgYIP5n+feVL82x/R+pzFuFdxKvNVWK0bTgc9zqPs7Ot4Zy/HDR+mjYxGMf
         1VyYuSWm/uuIfeMyUzkjSVlIZFjf0B8l54VT2meDHjSeTiBxRBvZzTo17Ac2j/i3cu5+
         2auw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=89MgH7JinnVPGaEpvKgswBUACNN0d9k2Uxpb6hRQ0P0=;
        b=Y3IkpcTSFJqoWp2dy2FfKED9YTxK3MrOG9qRql2epeaZeVMbYSacs3f9ZqnXp8nJ+0
         DN0YT6E4S/E+mBCHkqTA2gTEsj/9E4KFnWuPn7+JsBZxqcpJAsh14ny9WZrMp7z3WHoB
         siw6vDh2cg6KXYdZp3daHKKgYvExcBp3YLPlaAHNvEXvHE4D3itfL5w+/+/83IesIo90
         nFxjeC1ApgpxIIEp0HCraNr4fY7B6y2hbS92LFtwaacsHBuroJ8gDcXxtRfY37R4j/c8
         2irI8NQHiJO90oC9nrl9kJraHUi+KCo7J19RcDm1Kq2Jn5z4MLpa3urIjB0B3tj6zIMh
         0erg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=g2+omkfr;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=pWvwEIij;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020ac87c4a000000b00304f3c7c2cbsi13878525qtv.60.2022.06.30.17.09.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 17:09:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=g2+omkfr;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=pWvwEIij;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o74DX-0007U3-Vp
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 20:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o74BE-0006Z3-1Q; Thu, 30 Jun 2022 20:06:43 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:48103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o74BB-0001Jx-Ar; Thu, 30 Jun 2022 20:06:39 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id EF45D2B05A05;
 Thu, 30 Jun 2022 20:06:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 30 Jun 2022 20:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656633994; x=1656637594; bh=89
 MgH7JinnVPGaEpvKgswBUACNN0d9k2Uxpb6hRQ0P0=; b=g2+omkfrGuSvdRBMU2
 ZQKYizJ4ky4Go3PEApa/ERtjxvfOOnPWRlT6PtGa55kqKxyJmvXiunYxQXqvutni
 KBal4yo2KPFscMw3kRZ0ieHyxPnBH18IoBq7LyfYmITPN7zE0ksy7Hm6h5/knPEa
 QH99Icelp6qTQl2UbwGPHbiqyX6f9Wr5wJoydor7aebK6JLzmnHdQkbMJVq/pIE5
 mO8MUPay2REb7vQQRY50sHvsY8didp0H2iLZk6qrO2OtZdFN2Vo8nU0i4k4Ze9qk
 keAUhXJOklhIiBcZIcNIL0G1ra+y4VRXu8d230E1wb2w9DTgzLjWA0gnmeyzlxlf
 V9jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656633994; x=1656637594; bh=89M
 gH7JinnVPGaEpvKgswBUACNN0d9k2Uxpb6hRQ0P0=; b=pWvwEIijq8N1+CgA8uD
 eghUNnokaaKVYfxGwNdpDKpm83Un3PmUP+MqPwIJenc+3VvbF2Jhn53BR8D/1xmA
 3rmnlPo2xz4TYQKVK8cEmeKnaiOvur3ILqhw7ew7ZEE1AHlY/p8MvROG+w68f0yJ
 C38B96nxhj0m/V+/LqhyCTdk+SARSA6Efs2Iw4dzVJnV8eVlUNUr2t59LrjB2Hoq
 /6h25ot93ATSc0wH33aqYFYoqvCrbZw1cZHbBW8Ny45BGL/MXDaFSY/V/glDAOj4
 LXeLal8qyD32koSMTO4X2JXYSa0xFzqCw6wXthB5z/siJuCOTnlBwah39S/CanaO
 Hbw==
X-ME-Sender: <xms:ijq-YpMbmT06pV6qDrjl_ijVNRl05eG8pKdXUgFpU2NRpeXWLprFYg>
 <xme:ijq-Yr_rcPbRVMk0aJtVLlthN8oHkOKnZlo70vfSHR3ETvT39wFWlEctHwGUt5W4q
 5EBfyP0YtFi8LGvYh0>
X-ME-Received: <xmr:ijq-YoRSVk9YDy_fR2wlhzXj3v7RsgdrBTpZ5HCW7HpvkkqePKR66tyq-fT4qA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpeektefhieevgfduvdeiueetteegtdeuueevieelffevueevveehhedukeejtdek
 teenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvg
 esphhjugdruggvvh
X-ME-Proxy: <xmx:ijq-YlsmdyS6bsfsUm24-2VPvv-ae6wR_Z9mSzOqtNi9HP5WpJHwbQ>
 <xmx:ijq-YhfbWBWcVdn-gYunh7FCx7stYV4_gymgSbJySLrpC0UCAwsVHA>
 <xmx:ijq-Yh2PxlfrMouo2IcJmViijAgwbL13T8YupongdPyqv9kHKv1t1w>
 <xmx:ijq-YiqUpaD4MT_rHnvI4oPdfm8jeW46w7v9FhNXix6kfRpbHChtNkRRABs>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 20:06:33 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: qemu-devel@nongnu.org, clg@kaod.org, titusr@google.com, qemu-arm@nongnu.org
Subject: [PATCH 2/3] hw/sensor: Add IC_DEVICE_ID to ISL voltage regulators
Date: Thu, 30 Jun 2022 17:06:25 -0700
Message-Id: <20220701000626.77395-3-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220701000626.77395-1-me@pjd.dev>
References: <20220701000626.77395-1-me@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.27; envelope-from=me@pjd.dev;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: ZWM3DcmFX5+Y

From: Peter Delevoryas <pdel@fb.com>

This commit adds a passthrough for PMBUS_IC_DEVICE_ID to allow Renesas
voltage regulators to return the integrated circuit device ID if they
would like to.

The behavior is very device specific, so it hasn't been added to the
general PMBUS model. Additionally, if the device ID hasn't been set,
then the voltage regulator will respond with the error byte value.  The
guest error message will change slightly for IC_DEVICE_ID with this
commit.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/sensor/isl_pmbus_vr.c         | 12 ++++++++++++
 include/hw/sensor/isl_pmbus_vr.h |  5 +++++
 2 files changed, 17 insertions(+)

diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
index e11e028884..799ea9d89e 100644
--- a/hw/sensor/isl_pmbus_vr.c
+++ b/hw/sensor/isl_pmbus_vr.c
@@ -15,6 +15,18 @@
 
 static uint8_t isl_pmbus_vr_read_byte(PMBusDevice *pmdev)
 {
+    ISLState *s = ISL69260(pmdev);
+
+    switch (pmdev->code) {
+    case PMBUS_IC_DEVICE_ID:
+        if (!s->ic_device_id_len) {
+            break;
+        }
+        pmbus_send(pmdev, s->ic_device_id, s->ic_device_id_len);
+        pmbus_idle(pmdev);
+        return 0;
+    }
+
     qemu_log_mask(LOG_GUEST_ERROR,
                   "%s: reading from unsupported register: 0x%02x\n",
                   __func__, pmdev->code);
diff --git a/include/hw/sensor/isl_pmbus_vr.h b/include/hw/sensor/isl_pmbus_vr.h
index 3e47ff7e48..aa2c2767df 100644
--- a/include/hw/sensor/isl_pmbus_vr.h
+++ b/include/hw/sensor/isl_pmbus_vr.h
@@ -12,12 +12,17 @@
 #include "hw/i2c/pmbus_device.h"
 #include "qom/object.h"
 
+#define TYPE_ISL69259   "isl69259"
 #define TYPE_ISL69260   "isl69260"
 #define TYPE_RAA228000  "raa228000"
 #define TYPE_RAA229004  "raa229004"
+#define ISL_MAX_IC_DEVICE_ID_LEN 16
 
 struct ISLState {
     PMBusDevice parent;
+
+    uint8_t ic_device_id[ISL_MAX_IC_DEVICE_ID_LEN];
+    uint8_t ic_device_id_len;
 };
 
 OBJECT_DECLARE_SIMPLE_TYPE(ISLState, ISL69260)
-- 
2.37.0

