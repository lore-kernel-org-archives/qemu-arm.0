Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1010807lfo;
        Thu, 3 Mar 2022 12:26:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbGeEXQWBial0kn5rygkz7HyiVZetIOGiUhtUqbOQy2asb9VCcNBYzZ+cclZkjUPPj+svx
X-Received: by 2002:a0d:c3c1:0:b0:2db:e196:74c with SMTP id f184-20020a0dc3c1000000b002dbe196074cmr14658651ywd.35.1646339206919;
        Thu, 03 Mar 2022 12:26:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646339206; cv=none;
        d=google.com; s=arc-20160816;
        b=d7lQ6g7leKJfYzF+G2Jnad2/cm//IANAPJSvoZTakFIS6Wf5v6iY9ycRLVKuk6bxd7
         hdliY6bb5hywqwWw/GUPFFC9KPby/iq+s1ihGMxFxOrsCa6rv3xBcz150S0Qf8uniAT/
         +G/EUxUzeeu/qOHcskNq0g8uk1rWEdkM9NqgJVieUrhEiVwO/JaRzWL4RyMg870TTdNp
         BlTbrhNJYYqkiZMKqXy94hmAFbW3iCTYVlN8cwPZobqVgBdnNx/L9Y4USBwMtCMQoUZm
         RmIly68oLkQT0uqS8EZScVNHYlkpkH4JwZuOuOfKHBAbWvsISMQsE9bR/RyHZVdmn07Z
         w4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uXh/JEg5Ojwyym5i/HIshpVVO/CoNEWjAFuxDcAMKaM=;
        b=hVM8MmCj8p9cFLH2x2/B0Rs+dI/DLarVCN+Y20OlXHDF3nDYtG8l+wlNA72nInJRFR
         xqI/Yc0/zLyoaDmkIUuW2vaEM3aeI6hBPFzOI2n7ONG2AxgGVRnEHvh62F2dFzmVIu8o
         aqKYv1fIZdDjPOhZgI0TNbNWEl4fUSzq3f5UkJKawsYUGqoB8nSK9BU6pTnPPyn6hsl3
         UiT2MUgCwoflpg9apd0b8wwptvImP9Whno6fWJ+mlxcBZ2kHpqbh/cRB6yJ2RtiwY5so
         uR3sszM45V6mlzFpNz0XGiURX4L8n2ohH7gWCV+S7nx/48rkWo4TkaUxhEw6UynU83iV
         BUMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t0kvC9pL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t184-20020a815fc1000000b002d7ee4f797asi2658159ywb.137.2022.03.03.12.26.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 12:26:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t0kvC9pL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPs2A-0007ef-Au
	for alex.bennee@linaro.org; Thu, 03 Mar 2022 15:26:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrzL-0001wU-Q9
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 15:23:52 -0500
Received: from [2a00:1450:4864:20::330] (port=42723
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrzK-0001aG-9f
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 15:23:51 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso3942601wmr.1
 for <qemu-arm@nongnu.org>; Thu, 03 Mar 2022 12:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uXh/JEg5Ojwyym5i/HIshpVVO/CoNEWjAFuxDcAMKaM=;
 b=t0kvC9pLVwUMkJQ4I3iU4/DxiKZBqLj20I4aoau3o5xkZgwlCdfX2ZlTIRvHvQwfRF
 tEXJNPIWlWRJcBMltI6ueZSYuuCT7tVlUjbP3SlIa9GujD92TkSOqPa7v5Tm5/MBSgVY
 DGksTdMhOuabrknUVRT9F83S3AkafioBQ5FrGy0ntl7myl/8+ossWuhBMkygXHGeOO70
 NCEcExPJsnysQrkDrn2zAiAYyPF3w4vih+wWdCWsCB/CeC2EvvU9TfNXh0dRWuuccbwD
 5By4sgoegm2ZepJ6fO1e6Stf9H225tjpqPqIESF7nAJ73CAvYhgzSC1K/KEI8pvlkg1Q
 cqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uXh/JEg5Ojwyym5i/HIshpVVO/CoNEWjAFuxDcAMKaM=;
 b=JMaevecHFS0LCT0gZsH49EgUFuIwrct74Gsvzer5a4VgBUVdVQxButddapg1kkbfMm
 aCDMqqgkH5EZdIB+wIVAq5HhjS0mVDW8WeRM68mApjoDppVFwdu97WRUokWFKBuZhR1P
 YAaUEhtcvhP007kATPjSuOjPMmKAyKNvO258dBfOO2lf0YOxrlfBLfPsAIlGgbap/aZC
 GsX2MhY+l/iJLTbslT7iE0BQ8chz1l7y+vE+7sR/AnLDkH//iF9nNrb8OmMG+Z9qjgr/
 y+wD0XIH5MWXBIN0MRgK9XNRY3RYCBjU6/Jb0sq2RMCgYcHUzzjLZA3iiIQM5PJIFoN8
 /g6A==
X-Gm-Message-State: AOAM533VjdWqqjIxYh6eaymLz0kYgJdkrawFftn6NrHsiUkxP+3WLllC
 7LY9s/Q0MULLR69Bhq8NOpCX8ylU5eV/GA==
X-Received: by 2002:a7b:c347:0:b0:37e:68e6:d85c with SMTP id
 l7-20020a7bc347000000b0037e68e6d85cmr5022675wmj.176.1646339027932; 
 Thu, 03 Mar 2022 12:23:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t5-20020adff045000000b001f0684c3404sm517060wro.11.2022.03.03.12.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:23:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/5] hw/intc/arm_gicv3: Fix missing spaces in error log
 messages
Date: Thu,  3 Mar 2022 20:23:40 +0000
Message-Id: <20220303202341.2232284-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303202341.2232284-1-peter.maydell@linaro.org>
References: <20220303202341.2232284-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: o3fa0PX69jDb

We forgot a space in some log messages, so the output ended
up looking like
gicv3_dist_write: invalid guest write at offset 0000000000008000size 8

with a missing space before "size". Add the missing spaces.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_dist.c | 4 ++--
 hw/intc/arm_gicv3_its.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 4164500ea96..28d913b2114 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -838,7 +838,7 @@ MemTxResult gicv3_dist_read(void *opaque, hwaddr offset, uint64_t *data,
     if (!r) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read at offset " TARGET_FMT_plx
-                      "size %u\n", __func__, offset, size);
+                      " size %u\n", __func__, offset, size);
         trace_gicv3_dist_badread(offset, size, attrs.secure);
         /* The spec requires that reserved registers are RAZ/WI;
          * so use MEMTX_ERROR returns from leaf functions as a way to
@@ -879,7 +879,7 @@ MemTxResult gicv3_dist_write(void *opaque, hwaddr offset, uint64_t data,
     if (!r) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write at offset " TARGET_FMT_plx
-                      "size %u\n", __func__, offset, size);
+                      " size %u\n", __func__, offset, size);
         trace_gicv3_dist_badwrite(offset, data, size, attrs.secure);
         /* The spec requires that reserved registers are RAZ/WI;
          * so use MEMTX_ERROR returns from leaf functions as a way to
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 9f4df6a8cbb..b96b874afdf 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1313,7 +1313,7 @@ static MemTxResult gicv3_its_read(void *opaque, hwaddr offset, uint64_t *data,
     if (!result) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read at offset " TARGET_FMT_plx
-                      "size %u\n", __func__, offset, size);
+                      " size %u\n", __func__, offset, size);
         trace_gicv3_its_badread(offset, size);
         /*
          * The spec requires that reserved registers are RAZ/WI;
@@ -1349,7 +1349,7 @@ static MemTxResult gicv3_its_write(void *opaque, hwaddr offset, uint64_t data,
     if (!result) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write at offset " TARGET_FMT_plx
-                      "size %u\n", __func__, offset, size);
+                      " size %u\n", __func__, offset, size);
         trace_gicv3_its_badwrite(offset, data, size);
         /*
          * The spec requires that reserved registers are RAZ/WI;
-- 
2.25.1

