Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp963396njb;
        Wed, 12 Feb 2025 04:38:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWs0zHz8sMj0SJ07oHbfitg7vIn3i536Y8C0cU40OetuqQCnWjoQc0tSP74kK5fh+drPPmyWNHcxfWRKQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE5R1xCtsmadgBdkzhc9Rwo63Wgk00xeJlrfkjRte4ZjwhVKQ/EjLQW3pPmcbxC2K5ktYAW
X-Received: by 2002:a05:620a:4455:b0:7c0:7735:5917 with SMTP id af79cd13be357-7c077355a77mr139701785a.9.1739363883152;
        Wed, 12 Feb 2025 04:38:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739363883; cv=none;
        d=google.com; s=arc-20240605;
        b=Jqf9mDRA7jzGXxPirFoKdxLfhsm3sqPzBNhFiB00oNQzjyWrFsK0j8/zd9iqOvOjmg
         0qvNR/1qbFSgDJz7ADXo2dea1xensWN9lM4nAKSC5Kxx67pcF3TUzavMNfV0NSlobeGB
         l/rCf/weJcHQJlTr+LUYJhuOSP824ehoG6N77YgPPneRtDUNsuFiNFB8XQj8pSeHEdb1
         u0KHRSNRc3YgcboMTfYX2T5obqrAJtzjsMyh/B46lBXYPkXi8wDCvDeR1U7My7OgW83m
         L0FUFmvBr9cOubN5RBTFUPTYxf+VPognehivvY9yLJQYJlwRSXPLDAUykk6sgVa4FX+h
         wcJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cvDaF3GKG76GRCi7eSTTtcTkqo3eY1cM/gGguFUqtkI=;
        fh=+c9gm0wrH+jMjIwB5TZ3BoT8b+t8cyWN7siO/3ANym0=;
        b=cqXvzO7oIUYgmMueOV7lf/AHt/fAaxWaCzUb1ZtjbfvBkVIXkFIzg3NSNuy5u08A9w
         amMiW0mjP2FrGdusY6iBelx4gDqcBH+6U/9FLg9EuUky02nA+1C1XgSA1r2IYTMItnwB
         Nnrs98AfBxQPe4ZK42qLv0pK80RMvzBVmeJUaszbUghKqmN3t8L1bF7KgU5y8mX/Y201
         JVlPgkjiNc7eeeDm8zb/cxWrv0xK9aT5bHvUAIQAvsY8qQOv2m5geFSnxwKxNm8oxn9z
         yBIRPhYFbuWdpUpx5GVyPCEbPUQt9zSGCDIc2KRX8s7l+xM8EyfaE4V24H+c0I3wFJOy
         ZBfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hk6EH+Bq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0722a8372si128851585a.242.2025.02.12.04.38.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 04:38:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hk6EH+Bq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiBzc-0003UR-Ey; Wed, 12 Feb 2025 07:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBzS-0003Pf-5u
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 07:37:18 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBzN-0000Ol-Dt
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 07:37:15 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4395a917f33so3403505e9.1
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 04:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739363826; x=1739968626; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cvDaF3GKG76GRCi7eSTTtcTkqo3eY1cM/gGguFUqtkI=;
 b=hk6EH+Bqi0lq4psoQrxuSFd5s7/MjK95JhOzeIMIJYgf8vy2oBQZZ17ZPuUQoq2Gc5
 N/6DjVJx1KYnUqJSrJnvmnrRdHw0qB6Ow6W+kWaxiUiz5WDw+s9ZdNDEUXfZiLw3OodG
 czpiMM6Br/UAkhzkHLDE4EbQIVRbCSX0+D4y0ousgz3+4OonsnQhxdQ79R15oU+5zDSt
 8XSbR2IVDzOVbyZ5Q+tQT0c0KHOVdX36Ksxhw7mZbc4V2TZCHv3CpWPrrRFCNIoAxHUt
 4prUIAIR/XDuKqV7O9dO9glJBIx44BkLPf+28nIIWZ/oUhxi+Gqi24n+eVrXtl6+ouk4
 fRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739363826; x=1739968626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cvDaF3GKG76GRCi7eSTTtcTkqo3eY1cM/gGguFUqtkI=;
 b=P+WgS9fd3wbxuAHj/lMOOULQmU0w/w7+x7BTzrzxls7+CQfKB8a4AfXjQjrr5Ck1OE
 wjBtJIJYf5ZL1MHGqOdHb6YCRTGhXkgvLC9YJ2VDbiV1W6NBji2Ahqgiv5ncwxy3YQ8z
 A2jnFUwZPmgKSl66T1n+SUp5gLg9f3Yk5eu9nhmAj6MgWihPjy17Zm8T6Ot0xINbkmHs
 fCMYW2TtpJ8o8I4dD/anLRX17rZHm0fDtx0arWhPfriiKD8oVFLmIQYyMbblANymlm3G
 f0IHqr9iyRkEDQfxdwBOq70kRTQchdo/ZHVD3lcaLEK+UoBbFz5KdsrRfGZjEV/Mocz0
 akxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq+SmklYZ1tawU8tKQmWbGyw7bMrE4+wuyDMQ9xzycvOXXvpnBUioSaJmVHrZJbpvak7mvi0j17A==@nongnu.org
X-Gm-Message-State: AOJu0Yy0JtYTOD8qY5G2/ANoQku+kJ081AQsUsiWvtIoeEZeH7OfYUxa
 S2G9+FC4DLKJ6pz3lBMpNLWXEJ330Fj1ZdY5ppONsqoasN0h6SFbvrSKbQTgYxM=
X-Gm-Gg: ASbGnctP6B8vWjVXKFGKQsWoujZVoP2yUctRwssjoYaTg1hgWjph0vNrCptpUdHJ1Ai
 ChbTI3MU3T/3zAxm4uydxIb/CPVNMoQIUARtB3svRam0vyPhd3kbyeATB5qbbNzbdEEgU1d62vn
 HMuE/3DAHglmLLVcD/gujHpnAi3ns3ZJ5iQOqwRFu24wZhUJlTAEok1CI9gJXYDdafs2cIXdrnf
 +0X6Kk5RFEnun0jHcynJrEzsoep6AL7/1RtuOC3fUQsyxtmpZCmLyldtHNiVOFh8ow5X6chjOI8
 iNMAFiHqleWT8W8TST4y3QUtpTrREXoOvUbbYfPaMRAJgANgHjjZvsNYkYJ11zvWHg==
X-Received: by 2002:a05:600c:1508:b0:439:5b5c:e03b with SMTP id
 5b1f17b1804b1-4395b5ce0d2mr15307345e9.6.1739363826533; 
 Wed, 12 Feb 2025 04:37:06 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04f208sm18657015e9.6.2025.02.12.04.37.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 04:37:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 01/10] hw/qdev-properties-system: Introduce EndianMode QAPI
 enum
Date: Wed, 12 Feb 2025 13:36:50 +0100
Message-ID: <20250212123659.52764-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212123659.52764-1-philmd@linaro.org>
References: <20250212123659.52764-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: NJ4V5NuieiqE

Introduce the EndianMode type and the DEFINE_PROP_ENDIAN() macros.
Endianness can be BIG, LITTLE or unspecified (default).

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qapi/common.json                    | 16 ++++++++++++++++
 include/hw/qdev-properties-system.h |  7 +++++++
 hw/core/qdev-properties-system.c    | 11 +++++++++++
 3 files changed, 34 insertions(+)

diff --git a/qapi/common.json b/qapi/common.json
index 6ffc7a37890..33d8df19f67 100644
--- a/qapi/common.json
+++ b/qapi/common.json
@@ -212,3 +212,19 @@
 ##
 { 'struct': 'HumanReadableText',
   'data': { 'human-readable-text': 'str' } }
+
+##
+# @EndianMode:
+#
+# An enumeration of three options: little, big, and unspecified
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

