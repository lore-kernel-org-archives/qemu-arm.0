Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C51606A31B
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Nov 2026 17:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kAmRUkyJ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOIHS-0000IP-O2; Tue, 03 Nov 2026 12:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOIHD-000088-7q
 for qemu-arm@nongnu.org; Tue, 03 Nov 2026 12:26:28 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOIHA-0006Qs-VL
 for qemu-arm@nongnu.org; Tue, 03 Nov 2026 12:26:26 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a2084d62cdso39606475e9.1
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2026 09:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793726783; x=1794331583; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=hqqeZR9hh82Ok/85fIviXaUdYKynKCQ8FaCgEa2tPAY=;
 b=kAmRUkyJNzKKXQQJH2PU4t1TI1Bp82Yl9s58odVjx6+KQUTTkPLSuwXpyBTPEHErye
 /iR+sbBD9+gVDyFwQ7hBB62rO7Te78SCIZvXooaFrgEjsVnkGrrPTmXDGGqq6K/Ot3FU
 9WjRfLUB8IyEirDda4rYmLry+yUnsC4cQGeGr0EBy0TWvDYQm+Tyo+zQ7UszrnrKr3D+
 guSrKpJO1qakKrhTB3kWFYFhJAX/ojMlF60PumFL66DMD/7gqeSIINR98jVwTp4YC+RL
 i4fyAy3ESBHUsQBJ2ezpQ+uojJJqfrVCtMroZzqf41YmC8fn/1h/RXkBNERR6OVp9sLG
 s2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793726783; x=1794331583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=hqqeZR9hh82Ok/85fIviXaUdYKynKCQ8FaCgEa2tPAY=;
 b=ytVTAuQq0uU9BeiVbPcEWLrkVvRb4cJx3EEg4Go5jaR/KOF6q/TstJNqdwBALBd1gS
 u0vAvAlpxeIFTY/ZUuCn7S7gK+Otx2VrC4MeYvdYWPC9dVHTDmPUtSb2EChLqGrqpXop
 173RhqOdQyNQlbrQ2kBQHFJUCfHDjBvWB0pjHx9rMQXeSv+Gl5ThujO9LH3oldBvsMhe
 HX3xdZjPTGyx4svak7AkIhGeLAGQ93v6IIxLM/tFxPbTgWg5nlFCGQeLS7ZqPO5T0tiX
 FzEC6zJPdWFNeITPFeDhpThj8Scgt1fiKyHww8tuUX6MjJ6F4L74M69j/uK6fLUqjX0X
 kP3g==
X-Gm-Message-State: APuU4Z8rf10BQDGL11vAKJm18Wd//J8KE9mpAfMRp2oobtoqPQYyZOVr
 9SoQsO7PYULbwaX0os9TlG6NpuHLg3uHhk/thRRtrudqMkLhIocM62YiPtJe5Io/Lnor7ctU48g
 4XjVSPKw=
X-Gm-Gg: AYBFou1wpbDzT4kCo6A7LwbMTId/TeJVBHtccDB2QhAZmV4hwvNcdvlDpWLUhBMoeW7
 G6h54Z+kkxup3Lhi+d/A+GNbL6h4wDOEmQW5duTMoUkfa2FcTKTHzxcqKNfT9tDx9OLz6tqMO91
 Fu+uD7oeqBDq528MndIDwbCpmDwKNwWRLgmFl8RA+Z0wnPwup+qyoS3cjrlVUQFIGM01B4fc0WG
 Y4n3o4e52zHuYnV6sTRlU3We32AQsyBgsV2EnoaUtmeQN8z2pW1yv6KM4XXUn0ZkIG+Nd4PAnUS
 Ga+fzRI5JnPPQmhXJVQ+ZvAu0Pk0rU7DRXbc4J0ghO0AZ1jxh/a/2uBez3x5gWrdxMNvHo+oOJC
 pvoUZSl4DfS+QvOGATh24AK+DM5ytsyCw4oE0gQIaZiL6x53gElVqxlm8G9Q0DfQS9jm863wh9U
 ktRtYqJCp+5FIy3MWA1thoWM6TzyKN3bjzb2FpvInqvT2ma+ChJQksajAgqCP8QuXcQwBdXw/SU
 juHdO0hkxL62sc7Xva9FeL2UHkDXNmonEHSWceGuhU28x609TLa5F1yqAROZFlfWUlEPRo2Nufu
 sIOJtls+EzO1spMASOYel2NgJvnD2wVI7iDvL5VacmxVVAth0SlpJWtlnP8X6XVn1G6fBmX7Bjz
 tU0aq4uhUct3TQkXLsx1Q09+SJYSON+2ioy1dPJsCuoyuXYw6yFSrUV8=
X-Received: by 2002:a05:600c:c48e:b0:4a1:f7f4:7cf1 with SMTP id
 5b1f17b1804b1-4ac16bc47f8mr316953545e9.11.1793726783525; 
 Tue, 03 Nov 2026 09:26:23 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac0950d533sm211082605e9.3.2026.11.03.09.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 09:26:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-11.2 4/4] hw/intc/arm_gicv5: Use correct type for value in
 lpi_cache_get_hppi()
Date: Tue,  3 Nov 2026 17:26:16 +0000
Message-ID: <20261103172616.2400758-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103172616.2400758-1-peter.maydell@linaro.org>
References: <20261103172616.2400758-1-peter.maydell@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

lpi_cache_get_hppi() is a function we pass to g_hash_table_foreach()
to iterate over the LPI cache hashtable.  This hash table has keys
which are GINT_TO_POINTER(intid) and values which hold the L2 ISTE
value, allocated as "hashvalue = g_new(uint32_t, 1)".

The function is passed the key and value as type 'gpointer' and has
to cast them to the real types itself, but it incorrectly casts the
value pointer to a uint64_t*.  This works on little-endian hosts
(since we only read specific fields of the L2 ISTE using bitmasking),
but won't work on big-endian, and trips the clang sanitizer.

Fix the pointer type.

Cc: qemu-stable@nongnu.org
Fixes: a0562ada75e ("hw/intc/arm_gicv5: Calculate HPPI in the IRS")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index fd6456cd8aa..a362349e5ed 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -390,7 +390,7 @@ typedef struct GetHPPIUserData {
 static void lpi_cache_get_hppi(gpointer key, gpointer value, gpointer user_data)
 {
     uint64_t id = GPOINTER_TO_INT(key);
-    uint64_t l2_iste = *(uint64_t *)value;
+    uint64_t l2_iste = *(uint32_t *)value;
     uint32_t prio, iaffid;
     GetHPPIUserData *ud = user_data;
 
-- 
2.43.0


