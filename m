Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp35326lft;
        Wed, 29 Jun 2022 21:58:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vn7uzjAjaoXPJ+4mJ1Mm938zPFLI7W+TlZIjawsCBeLP/eqf9fOA0KdEiifRQTAWmXpPpd
X-Received: by 2002:a05:6214:5019:b0:46b:3c50:78ba with SMTP id jo25-20020a056214501900b0046b3c5078bamr9654998qvb.127.1656565116840;
        Wed, 29 Jun 2022 21:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656565116; cv=none;
        d=google.com; s=arc-20160816;
        b=Za+YE/QdxgxlugKtss+6CQwCUmbshziU+fKTo0xLz1Mfkq54oogwJR2yfs1T00CP4s
         qZ4yJcrNmvNhPF7oZk535ywwaDYqzXk/QrF0qqxPI2yyPfSHQPOhvN/4YkCOYbZKnV66
         UCFf+qlfkACWxmjMzO6dEkhrn+0ided+ZKdezP/I6QLp/QO85duCjDxPbjdCgeHekMfW
         N12nhmYY+3Q6AyCHGARtJV5s4Z+mOx6AUwsOrtts+NEe9rohGx2CN6huQ46STiRxY8ko
         Xp5ve1mVd53F8sd7Cxe5BRx8HWhvuLuN9/8BC5UasDU8Emh1Sk1Xy6LaXWxCxlC9UrNy
         FxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=sPGNqzHM/PBx47tIMAtMTtw90hj1XLyDltpQ/Oc4c3M=;
        b=B2STRRzffFbBOZ+a36VtFPWPF0slCi5ve+ckyvUZix3sJduxXzroK990n4fMSE2ea+
         LEyAdnCw/y0A7VYpMS0J3jgtZlHevlujIjZQMJ65NYx98FyLc7MDwCGDi8AQGypzRjT0
         UJKin/trITXLw3SFMqzMc1u51P8Hq+qpSzvwF5NgC5Ms5/LILI8ZkcumWymuk2siZFnB
         PhSlemsPKV7rBk6Ed0x5XGO9qJ43Y/jcsLAU8Kby8TrThZ76vkjVqgFbgyDRSc55P2AH
         DZWP6SV3n9iCWJZS7MUlHy71Eub1mjAmKWxkeI8UxiOEoBP2GI2RO1F3xPilHk8pWiVe
         cHRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=Y0HWfz12;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=jCVlgAl4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq8-20020ad45968000000b0047067859832si9275048qvb.344.2022.06.29.21.58.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 21:58:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=Y0HWfz12;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=jCVlgAl4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6mGC-0004IJ-8i
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 00:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6mA0-0003Gx-LB; Thu, 30 Jun 2022 00:52:14 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:51741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9w-00072F-0I; Thu, 30 Jun 2022 00:52:12 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id A1A552B058FC;
 Thu, 30 Jun 2022 00:52:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 30 Jun 2022 00:52:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656564725; x=1656568325; bh=sP
 GNqzHM/PBx47tIMAtMTtw90hj1XLyDltpQ/Oc4c3M=; b=Y0HWfz12W4p2k7vWrn
 sRbtxUUF43QAAvzEN2tchR6kL1RF3dbwajYtGqXMldE1/ZVF9Ljqvotpd7yTBvvG
 O71eZb5fPId7AbCFWSPza84hFMp21TZG6lx8+mzU3427l5QVINHxHMjxY2WPthdW
 GBaPZHa49J3+QcNB/L/LP7cXu1TATdpWDdZLP32Bz34zgmqqNN3IgoYTZULsmu6X
 z/+ZgLa16MRLjoZz5DMIEWWbEM3L7nY+LGrg0DO9LEVrXVVlEM/WijPu9AfuioSw
 Du3j5ui3dy8J3oGz8O38LRIgiSSk3otrbPTKe6OWSAc7u/lNvnu7HyHdHeHnbwgL
 PaIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656564725; x=1656568325; bh=sPG
 NqzHM/PBx47tIMAtMTtw90hj1XLyDltpQ/Oc4c3M=; b=jCVlgAl4/r+9oF/AFLR
 8hA1vAEqYNFw7wSeTJtK9+9yryX/qSgd3KEBXnfoNy8w5mMVgcr+tWyGm3GUDU/g
 07F38TNvNXQOG2mEOi4G3mv+eG1YlGBG630FhfmLqvext/0aslUBmYtrv/rUO+Xj
 m+U1xNC9fZQ3r9kcWWt6xZ3enNBjP+kFKw5wkWmtcYft7TiqOI6Jshlh+LwZrCtz
 PVn3DU4OOgO60mZkfGiXWKQgPBk+d1V6EjY0ef6jGHWEx+jhYx6SecdsoUWulPHc
 GmCvBHuB3g6bKqsDhmK5kXpLxdH8fUGvpQ+ZQWqgnifpbrWU9Z4Qlkr8UNU7nkPL
 i0w==
X-ME-Sender: <xms:9Cu9YtQ-m6eYjFcHHrXQFiKxVHWRdXtVgwqS22cp8r_WmVQNVDfIZg>
 <xme:9Cu9YmxU8uKMQc_1O-xKF-d4ExfZ2YifhOTpGVLSYmCVhXoD-kE-xSkjHXiP3IdcJ
 c8hOsP9rl8toiI5FM0>
X-ME-Received: <xmr:9Cu9Yi1S98s11_l2nqkRe5fA7BxB6Tci1mvT2ATGsxw2dLViJAkvnN_Zqs98hT_mA658TzxKOjy4VgUUttQlWCIuojurzFq1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpeektefhieevgfduvdeiueetteegtdeuueevieelffevueevveehhedukeejtdek
 teenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvg
 esphhjugdruggvvh
X-ME-Proxy: <xmx:9Cu9YlDXgRhOrkulo1Dj6RphVNOYamCOmL0iQSdK_41Y-4dhmo8_Kw>
 <xmx:9Cu9YmhRvjBVy1EDVgZ0T9vkdyM8np5LVxRPzyIeVfftsHPezsyTZw>
 <xmx:9Cu9Ypq18nr4W_WriBMb5pqabyb-5993xBdWRIOzEQS3wIIS9Z3QZA>
 <xmx:9Su9YvUfgwx0pD02IfTKqIguEzaPPhd2WYTNzEOgTZeftf5ve0g-WWGPcBI>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 00:52:04 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v3 09/14] hw/sensor: Add IC_DEVICE_ID to ISL voltage regulators
Date: Wed, 29 Jun 2022 21:51:28 -0700
Message-Id: <20220630045133.32251-10-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220630045133.32251-1-me@pjd.dev>
References: <20220630045133.32251-1-me@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=me@pjd.dev;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +h8jArKBBTL/

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

