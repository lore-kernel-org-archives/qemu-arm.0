Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1806315ejc;
        Mon, 30 Oct 2023 04:49:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiBJWMT+Nk58VE70EG/aDtc+FYgDdXgllylJwls9P7EGzxXvFDwdVf29RJeVvMAn7G6PP5
X-Received: by 2002:a05:620a:27d5:b0:773:bf62:b274 with SMTP id i21-20020a05620a27d500b00773bf62b274mr9495180qkp.61.1698666598505;
        Mon, 30 Oct 2023 04:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698666598; cv=none;
        d=google.com; s=arc-20160816;
        b=xqoSMV14WEXxH4gjx+Ak35R+rszCq/zAOsqEItV3g/P0T4HRmCX/ytKGergGO8419s
         +wgudzAEc/w8uh7D/8FHoJgWEiVQwFAo429XZg/8yBuyAK8sB0Ewe4dUGTO3aoCV+i0W
         v7m6Si/sHT+SrTwyIb7/Nj9BmshLEj5qfwge7WsuUPUUnlf+g4DDNMvDxst88hDV2UNC
         DOYH66o/0IO+oQP9PHVHkZNX/SvUk4Hwq3i0ejS+DVmseWwf7rFNU3U7zYKrg6nVvRKG
         LYx9/vi588jnUAcbtQDiVj1EDm4xoFQlQPmusXq1uE43sc8OeJF6znO7EhJPZlnM6ZqO
         qNFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VDC5J/pIZ/iFxlh4YAZWUq7F2Xchn9VZbC5ohU+C9is=;
        fh=yUeHCMY0O7AHgYs4WRBJtcSGK81/h+/8SdmYaglLfmk=;
        b=EwAHqYnNUx8NNuQIf3OdDJFoSlF/xupt6x1wUArX7YcQtM07ttfUwrGt00vVrHmWoY
         gVys4raU78o6yCw4nIv5JWAEhiCiUuSemVOrMdH2GG6b2ci7kTxMQ38yaTP+qyPGtfq9
         K2ipHupVJ4JdPKt94HixPPJXZHxAQVMAGOpjAKdwgPX9UGEpRPT+IjbXyVxKmNbJ0PJa
         vkaRDE5chKneSIiwulk0i1KRZcX4LKSDWj4EVVe3tHVlX/a5hEi6PdlXdtVfCaFzNZ6q
         mLEjkpfXcpHFugvoFgSYs36uyexPTyXTTNpy0aJyHndqT1bnMN//NSsO159g/HLRg0vk
         tKqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qokPl5ib;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17-20020a05620a411100b0077583599c4esi5634111qko.239.2023.10.30.04.49.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 04:49:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qokPl5ib;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxQkf-0007uY-JA; Mon, 30 Oct 2023 07:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxQke-0007sc-0a
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 07:48:12 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxQkY-0007I1-TN
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 07:48:11 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32d80ae19f8so3011582f8f.2
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 04:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698666485; x=1699271285; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VDC5J/pIZ/iFxlh4YAZWUq7F2Xchn9VZbC5ohU+C9is=;
 b=qokPl5ib17X73BeYe2v3FmQyUQgbI/LoKG/kwrq5D98pYbamGZAq1tjjtu/fjSMcio
 jKOyILx36WqBr0EsIltNVmTE2eYwgk3is57CK6nd945GcZfKpYrzTFV1IGo/5T/yG73m
 /6A5eMk3YsQNyEP2phAoitQTCh0fGa9nCapqph+tcbfpCvAwMdBQMvUnoExL6puHAlxc
 1dwMIANbZuJCBeXKtJyMYnDyJxN2Lc5CO30Akba2xWs1i4DIBh6X09E1yZq/451yL9HK
 3EUV2einoBEm/pxXxiWGf3fCft/N+T9nocGDB0RV+T5eQW0GeqFIHyAulo3rOZ0kGsi2
 pTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698666485; x=1699271285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VDC5J/pIZ/iFxlh4YAZWUq7F2Xchn9VZbC5ohU+C9is=;
 b=VfFx0McBJzxaQiEW9L0Li7ifUrknly2Wz/g8XO9a+l/flrZRENxnoKpsUfnkiRteXV
 ZiMEDPEW5bw87OavXwtkYZAItVsCR/6IyZKdzbqTZXOMCIl/M9Gc5HjU0O0XsBPJbU0K
 jCvUpbcotdvJG3fF/cGlaLhNkbC+tNXAjRIsdMveiI1Ft2b+GG0OWcef+RBCq+z4mPGc
 YLnYrTm4jAQboyOP7VWrP3Q3H3OZXB2Agtou1n2wLMQZx8W4WVfzI0h/WrAFPAx+Sbig
 9gJCNVLtIYlvueLRTbvkdNW4jmQeRy/uj39eDEQwIYnlMT/ZaXCEYnnXhIzBp6QlzyCa
 kYsA==
X-Gm-Message-State: AOJu0YznWe6o8KKJl+EwHewrK6p1phUWpltT0u0wt6vBFcFX4p2qUg8T
 nWa31Kw0TPVm6t/2SBLINc8Wd1AVszeCwbLGnFQ=
X-Received: by 2002:a5d:6d0d:0:b0:32f:7d60:d62e with SMTP id
 e13-20020a5d6d0d000000b0032f7d60d62emr6754847wrq.27.1698666485590; 
 Mon, 30 Oct 2023 04:48:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 az30-20020adfe19e000000b0032f7d7ec4adsm5262268wrb.92.2023.10.30.04.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 04:48:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v2 3/6] qdev: Add qdev_prop_set_array()
Date: Mon, 30 Oct 2023 11:47:59 +0000
Message-Id: <20231030114802.3671871-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231030114802.3671871-1-peter.maydell@linaro.org>
References: <20231030114802.3671871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qb7EhnP+BMmR

From: Kevin Wolf <kwolf@redhat.com>

Instead of exposing the ugly hack of how we represent arrays in qdev (a
static "foo-len" property and after it is set, dynamically created
"foo[i]" properties) to boards, add an interface that allows setting the
whole array at once.

Once all internal users of devices with array properties have been
converted to use this function, we can change the implementation to move
away from this hack.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/qdev-properties.h |  3 +++
 hw/core/qdev-properties.c    | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index e1df08876c6..7fa2fdb7c94 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -206,6 +206,9 @@ void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
                            const uint8_t *value);
 void qdev_prop_set_enum(DeviceState *dev, const char *name, int value);
 
+/* Takes ownership of @values */
+void qdev_prop_set_array(DeviceState *dev, const char *name, QList *values);
+
 void *object_field_prop_ptr(Object *obj, Property *prop);
 
 void qdev_prop_register_global(GlobalProperty *prop);
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 357b8761b54..950ef48e013 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -3,12 +3,14 @@
 #include "qapi/error.h"
 #include "qapi/qapi-types-misc.h"
 #include "qapi/qmp/qerror.h"
+#include "qapi/qmp/qlist.h"
 #include "qemu/ctype.h"
 #include "qemu/error-report.h"
 #include "qapi/visitor.h"
 #include "qemu/units.h"
 #include "qemu/cutils.h"
 #include "qdev-prop-internal.h"
+#include "qom/qom-qobject.h"
 
 void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
                                   Error **errp)
@@ -739,6 +741,25 @@ void qdev_prop_set_enum(DeviceState *dev, const char *name, int value)
                             &error_abort);
 }
 
+void qdev_prop_set_array(DeviceState *dev, const char *name, QList *values)
+{
+    const QListEntry *entry;
+    g_autofree char *prop_len = g_strdup_printf("len-%s", name);
+    uint32_t i = 0;
+
+    object_property_set_int(OBJECT(dev), prop_len, qlist_size(values),
+                            &error_abort);
+
+    QLIST_FOREACH_ENTRY(values, entry) {
+        g_autofree char *prop_idx = g_strdup_printf("%s[%u]", name, i);
+        object_property_set_qobject(OBJECT(dev), prop_idx, entry->value,
+                                    &error_abort);
+        i++;
+    }
+
+    qobject_unref(values);
+}
+
 static GPtrArray *global_props(void)
 {
     static GPtrArray *gp;
-- 
2.34.1

