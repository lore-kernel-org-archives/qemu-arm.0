Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp539644njc;
        Thu, 13 Feb 2025 04:23:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUikPHx7qV0Rs0hu2HQ2IelbEFtpVPGTe+nRJR+fIFD6QWNNrKTRyzgKF7gRqqcCgezmo7NiusqWXcG7w==@linaro.org
X-Google-Smtp-Source: AGHT+IECA0Tp8IvMx7iXJYvdElY8Tu6exR2RiUZlE4Yq7eFUSFG2i0oeYOBhGvjDA8KVetyJOWWp
X-Received: by 2002:ac8:5a15:0:b0:471:98eb:efc9 with SMTP id d75a77b69052e-471bed653d5mr48356131cf.17.1739449427753;
        Thu, 13 Feb 2025 04:23:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739449427; cv=none;
        d=google.com; s=arc-20240605;
        b=Wum/QaRWVpmuUvX7bi52BL5ds/aIPGL+LV8/VOVw0aatMPbmRZlvHtKkHrvShSprvI
         NCuioEsD34euHXmcBTrBaPoB/MVZPzrUV40+v0TYJAB7p5V/ALCRVyWYqDavTszY6fu+
         03k1WnMlw0foZRrWt3XLCGeow7V+f/or7xigX2cpxxdhSRIr4SUfdoMPv0uC8Sy93n83
         8uo9xC9bqAPUnoiJUbnfU+ri69JQfP1WVoJ7rO61ouMDOjnmUaZxbDEfxCKFOdQ3RW8R
         sK1ghokPS0TZI6crTz0eDpYwp53otfLG96pSYLMznllFl3zObwNCGmSTYxh0pbI6KcJE
         oR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a0QIUZ9G9ceuu7BOeFAVNnHGygrUdl1K5aeRH+HplWk=;
        fh=dPwajgbu0gyvFXFngwzjA/VsN48QHuG205Ok5GKTz8I=;
        b=aGu+QE0sAnHkisEpZCEsv+f+xqJI89VV/Gui+h5mNaFuOUl61lJmTFoIVKhpHlF6ej
         SqsnsM7oV3d78oNhhNvtQ/67OJRZj7wES0z5dS23c1I2gxIYSqICWi/zOT6tMxPT7fOw
         Yawdm+uF8MmAPGC6uvyrtZQpN+DImuy/A7FQthjR+l6L0lRLy2oWyIGBGQYrhW+aeuGi
         BM5T3pPwDJOHltLkN98yUF6/tS0tVlmgQvdeEvv8Qt7V2jJwg5zCo9VTHhN64qNbZDuQ
         pnV6pq+MTgic8DmGbFHYd/nY8lV3OFS5hPTzsGNiAhuqjyH4mOZ7W9WalgPOppFcQ4er
         2i9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wj28MKwQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471c2b2bc47si12674121cf.277.2025.02.13.04.23.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 04:23:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wj28MKwQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiYEq-00022R-Nz; Thu, 13 Feb 2025 07:22:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYEj-000206-8j
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 07:22:34 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYEh-0002Tw-0V
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 07:22:32 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ab7e1286126so156501566b.0
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2025 04:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739449348; x=1740054148; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0QIUZ9G9ceuu7BOeFAVNnHGygrUdl1K5aeRH+HplWk=;
 b=Wj28MKwQjCLsaCYr0OPKaCevm2TVyfbZqzveO0WvPlt8+TxlJAUji1141zrGwpoahS
 l/zIIQeVXN68kXcYgx9EkxmwmNOCPBHUKCKH4iJMwiToY69GcfGU/mYTt4qI86W26YYX
 PRswk59ilZopiS1T+VzVpNfOXS/vWuDxussSEen4wF6pDd9p9KOnU0r2LxXViRgwcqxT
 V5bRCmlnS2+WexzqVoamHSFtsCL/28iQOuuzTNigwR3OUkLRvF90GlL8i+hMwzBOhZzu
 +cBAKy8VJVuVe3qIU828cpz9rEhzGdRw/OWzwAEmYzSe1zjz4/m1S4/095YeunaE1FQF
 UWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739449348; x=1740054148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0QIUZ9G9ceuu7BOeFAVNnHGygrUdl1K5aeRH+HplWk=;
 b=Q0QrckZvgZDFnItCuaySo6ALtGMCTb8rJQIzxIXZuoFqml83C16B70qp/oG4eXqica
 WUhqi6MnlxRjfX5AHB/EMnnw17JSouHr+RgrYzW9X+OiF7+VSqlek3jWBgmyI2Vf0Syf
 oTRA4V0o0pX+s717HvIr2nVdbBi3dttDcKpHuydOIzV4Ij8XP/5xSDo+rGc8JaFvUeLm
 PAbSzvRRIrvg6RlTzyqzDemnKDVSmwR91Iu5PecXkxOeu1g+D4zJS7sA+VPZA2ADVwC4
 du1d0QJ+5h1KK1ZW+xvaL/uiflNHxlNZcMtM9sJ5IL39Guh9ZUW4kcgQSgY42swSITvr
 KR4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv9YdNuLgIm2kCyqOAeUv2QJZseW2s/z3aj6lxJeI4Xow66hwB1noB47WcppZvX4DjAiy/v0wetg==@nongnu.org
X-Gm-Message-State: AOJu0YwN0Y+4534SPA/4IWhFF7Y+jTYVjN5MYpKx+AobZYLaoxJffc+4
 2piMyTZJOF8gFdV/ZJH6UaBbAL/n6Ufwmkrxp6/8L8rcagiBQtY7uAQH4lCUtGI=
X-Gm-Gg: ASbGncu3aNclEbwUJA+xgIxn4sY4hKrj1xjI6u+EcEdcuXoqh/Mvm8yprty5dwtjS+2
 IV2JLee027rBbEPuwUYaxb4OWYDLSC/EeGq/LorL6wsZ0l0sUlX3lwHtLdpxYjJc33KA++o/eSI
 o3ogNQr79EseY3fdUn2CdhV/KwBSMqJIeA6CxzbL6LqUVZf92BSoR5pphmk9+kc3nOMbkxnx4bd
 +X0NJs77odjg3jOttVM9rFIYh8QfUHrMDGEVZZHaCXGyKbznZh3JGlBhjvHGdETOpDECdejiJGh
 EBq4wa1o/avRcx9v4b2TZ9lvRtGzVtezu51cL47yp6oc7KvnGTURIzt8++LU
X-Received: by 2002:a17:907:3da2:b0:a9e:b2da:b4a3 with SMTP id
 a640c23a62f3a-ab7f347dc2bmr670610566b.42.1739449347940; 
 Thu, 13 Feb 2025 04:22:27 -0800 (PST)
Received: from localhost.localdomain (6.170.88.92.rev.sfr.net. [92.88.170.6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5325ac21sm122673766b.73.2025.02.13.04.22.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Feb 2025 04:22:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v8 1/6] hw/qdev-properties-system: Introduce EndianMode QAPI
 enum
Date: Thu, 13 Feb 2025 13:22:12 +0100
Message-ID: <20250213122217.62654-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250213122217.62654-1-philmd@linaro.org>
References: <20250213122217.62654-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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
X-TUID: fLhA3MDuBtAk

Introduce the EndianMode type and the DEFINE_PROP_ENDIAN() macros.
Endianness can be BIG, LITTLE or unspecified (default).

Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qapi/common.json                    | 14 ++++++++++++++
 include/hw/qdev-properties-system.h |  7 +++++++
 hw/core/qdev-properties-system.c    | 11 +++++++++++
 3 files changed, 32 insertions(+)

diff --git a/qapi/common.json b/qapi/common.json
index 6ffc7a37890..0e3a0bbbfb0 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -212,3 +212,17 @@
 ##
 { 'struct': 'HumanReadableText',
   'data': { 'human-readable-text': 'str' } }
+
+##
+# @EndianMode:
+#
+# @unspecified: Endianness not specified
+#
+# @little: Little endianness
+#
+# @big: Big endianness
+#
+# Since: 10.0
+##
+{ 'enum': 'EndianMode',
+  'data': [ 'unspecified', 'little', 'big' ] }
diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
index 7ec37f6316c..ead4dfc2f02 100644
--- a/include/hw/qdev-properties-system.h
+++ b/include/hw/qdev-properties-system.h
@@ -30,6 +30,7 @@ extern const PropertyInfo qdev_prop_pcie_link_speed;
 extern const PropertyInfo qdev_prop_pcie_link_width;
 extern const PropertyInfo qdev_prop_cpus390entitlement;
 extern const PropertyInfo qdev_prop_iothread_vq_mapping_list;
+extern const PropertyInfo qdev_prop_endian_mode;
 
 #define DEFINE_PROP_PCI_DEVFN(_n, _s, _f, _d)                   \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_pci_devfn, int32_t)
@@ -97,4 +98,10 @@ extern const PropertyInfo qdev_prop_iothread_vq_mapping_list;
     DEFINE_PROP(_name, _state, _field, qdev_prop_iothread_vq_mapping_list, \
                 IOThreadVirtQueueMappingList *)
 
+#define DEFINE_PROP_ENDIAN(_name, _state, _field, _default) \
+    DEFINE_PROP_UNSIGNED(_name, _state, _field, _default, \
+                         qdev_prop_endian_mode, EndianMode)
+#define DEFINE_PROP_ENDIAN_NODEFAULT(_name, _state, _field) \
+    DEFINE_PROP_ENDIAN(_name, _state, _field, ENDIAN_MODE_UNSPECIFIED)
+
 #endif
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index a96675beb0d..89f954f569e 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -1283,3 +1283,14 @@ const PropertyInfo qdev_prop_iothread_vq_mapping_list = {
     .set = set_iothread_vq_mapping_list,
     .release = release_iothread_vq_mapping_list,
 };
+
+/* --- Endian modes */
+
+const PropertyInfo qdev_prop_endian_mode = {
+    .name = "EndianMode",
+    .description = "Endian mode, big/little/unspecified",
+    .enum_table = &EndianMode_lookup,
+    .get = qdev_propinfo_get_enum,
+    .set = qdev_propinfo_set_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
+};
-- 
2.47.1

