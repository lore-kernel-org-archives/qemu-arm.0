Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFF9606D808
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Nov 2026 17:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aVv6hNdl
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOIHB-00007n-FE; Tue, 03 Nov 2026 12:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOIHA-00006i-6z
 for qemu-arm@nongnu.org; Tue, 03 Nov 2026 12:26:24 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOIH8-0006QA-FS
 for qemu-arm@nongnu.org; Tue, 03 Nov 2026 12:26:23 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a2072b9832so6040235e9.1
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2026 09:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793726781; x=1794331581; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=FJKfVYm6VIqMavFwLhCg7yl/Tg1YqwuMPiBUuINmP8s=;
 b=aVv6hNdl/k6UMSq2E8XU1wIe3GvAjdC8Vwfyc94ff9J8CbCiql6Pv6lcAMuAIUjye0
 ctC67Jgf/bYp6Wi6oYbwFk8JxwzWuVpaeOsrkhMS2QQrPbNAU5VAeduzZn8E+01x77fn
 n+oEncnXkBXd9/VYyf7+lCiXUyAb9db1aMENFoRHxzeshzVjbh3CQJj2z6Htuuoc2dZ1
 tcQ6W/H30VUAEUeTGEtBZriLznVRPnTYj5SU4y4Mfh7mdc0f6G/Nd+X9N0j2VqcFYZeC
 juRcPa0B5SKM7T83L5Tp2dZIw/DweiFQ+9NQTX0IAGPdBduo5pvl2YmprIjcCqQBaBOE
 fQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793726781; x=1794331581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=FJKfVYm6VIqMavFwLhCg7yl/Tg1YqwuMPiBUuINmP8s=;
 b=xIzI02/c9vdOLJyNosUcyT2RsEPTH3Wfg4bD6+dOm+REmLggOCjZp661zQq8AtCtDf
 8Jj9pvlUm4sOkRTfVy8q5ytb1R4+MdHPm30P4mKogd5tsvWwcLCeJHU74SFC/5a2xjR8
 nkzLKKMopS8h4yLs1cZv2cnIWbtubMM8Y4WxXj5YO+fUvPm4KCA6iV/V23TEa3g+m6Rq
 /TpDM1lScrUyzlIcAl/v+cjMoSLgbyShJh/81ts3W4tFZnDTw+QHfoFkC/erYXCju4r9
 O/C8amH+XoJ3ojGzWB+/Cg71BSzJXIFVDVB1Ldh1P2SKB5J2g4myaol/9clB8zQHqOOO
 7IXw==
X-Gm-Message-State: APuU4Z9xWOEoZjsZ+dLv9ONoc84NexQC33Sl11pO8Ad8UXX6fElWGy2D
 +VbQ74EQ6/X9A48ljOjGIgcQnvFVbzx8/npVufVol5S0hLMMuJvJ83r7Rz1WDeX47ZubGMMVAV3
 a0A8wS4Y=
X-Gm-Gg: AYBFou3TZbfjsQXrtAj3bRxfKCvko6TqDNcP6hk3CeHnZx9pGMBWOTkkrwLdXKuLfsJ
 FO/Rcn5ui3fleVwgR3wfNEVUVGmDg0FUbA7C6wam8Lz3JuBl/O6No8hDTkPCsI1/Ga1iMLyLvlV
 d/wTltN6UUSMwkIV0+KTDYp3YkkG6HPxbyv4qTtMoUvAjRn11XPJQdKEGfEjE4iqxAzBD+slc0M
 7awJmWMXSyYjumJCIvI7gKncxm+oTsO4Ju80Ca0T3cRXel3AFZfy2loZFoTpv10OHVD48u0LUs5
 6FQVvHGZQ1CIZLNETEBpbphxyDBj70G3RlV3sKY+pMzjFfXUgp9UCttWUJRRuaGIDNqlssmMvAH
 81o5DwWdKLTz4jYf4pIlpvj8V2q9IsqtouYWQu60Verx84yHJ5/7M+i3ttrV3APgi9R3Drul5v0
 O+Now25aRx66Zvx68yckvUHBMIPagbf5M/LAXRytKVvmNyfSA+pIlORIppyf1ah7o6VDq3btSJm
 nPtE9Pvao592SKLWHa2OTH7kd/4VvGS72uGHV2l12QO+lSfm997w8vBf1IRa75RwcnDTEzvABr9
 ZqFi3fTogrEy7Cbn23sR2U9tmbmH7e3nYJ20eVpABxqvBlpX117hb4bX7q4kdu8NSXjKlCsR54n
 tSntnvt+GXWF5E3Nsl6+9kymkD4jDwO6GYw==
X-Received: by 2002:a05:600c:64c9:b0:4a2:180a:3417 with SMTP id
 5b1f17b1804b1-4ac14dd1debmr327086745e9.1.1793726781071; 
 Tue, 03 Nov 2026 09:26:21 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac0950d533sm211082605e9.3.2026.11.03.09.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 09:26:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-11.2 2/4] hw/intc/arm_gicv5: Free memory in finalize
Date: Tue,  3 Nov 2026 17:26:14 +0000
Message-ID: <20261103172616.2400758-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103172616.2400758-1-peter.maydell@linaro.org>
References: <20261103172616.2400758-1-peter.maydell@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

The GICv5 allocates memory and creates hashtables during realize and
as part of its operation.  Free those resources in finalize.

Since the GICv5 is created at QEMU startup and remains in existence
for the lifetime of the process, this isn't an in-practice leak,
only a theoretical one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c        | 11 +++++++++++
 hw/intc/arm_gicv5_common.c |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index d0a8574916b..fd6456cd8aa 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1970,6 +1970,17 @@ static void gicv5_init(Object *obj)
 
 static void gicv5_finalize(Object *obj)
 {
+    GICv5 *s = ARM_GICV5(obj);
+
+    for (int i = 0; i < NUM_GICV5_DOMAINS; i++) {
+        GHashTable *ht = s->phys_lpi_config[i].lpi_cache;
+
+        if (ht) {
+            g_hash_table_destroy(ht);
+        }
+
+        g_free(s->hppi[i]);
+    }
 }
 
 static void gicv5_class_init(ObjectClass *oc, const void *data)
diff --git a/hw/intc/arm_gicv5_common.c b/hw/intc/arm_gicv5_common.c
index 2920b11cc39..cfadfee4f05 100644
--- a/hw/intc/arm_gicv5_common.c
+++ b/hw/intc/arm_gicv5_common.c
@@ -112,6 +112,9 @@ static void gicv5_common_init(Object *obj)
 
 static void gicv5_common_finalize(Object *obj)
 {
+    GICv5Common *cs = ARM_GICV5_COMMON(obj);
+
+    g_free(cs->spi);
 }
 
 static void gicv5_common_realize(DeviceState *dev, Error **errp)
-- 
2.43.0


