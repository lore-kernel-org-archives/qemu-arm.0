Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp924649njb;
        Wed, 12 Feb 2025 03:25:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW+UDBrHY0mT1rUETiCzBAWbAvDo5t0eJNQ5B/UR9DL86vd2qxjWw55K0XhurYc6367HPhqZzvTlAOnhA==@linaro.org
X-Google-Smtp-Source: AGHT+IF2m8WkUkWrHiLNcdFAoGYYw5CAqjCt4+EOeev4DyCZ4tMCY7yn7YLPy5DncPQHYKYmhfvE
X-Received: by 2002:a05:620a:3986:b0:7c0:7770:c565 with SMTP id af79cd13be357-7c07770c6b5mr58800185a.33.1739359503197;
        Wed, 12 Feb 2025 03:25:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739359503; cv=none;
        d=google.com; s=arc-20240605;
        b=GCRiZFW3+nDx6IserQhm98r6VrxO9rjLPVyqQsZ0JYcJvl5Zdv8jG8MeGVubxYGyBU
         qL9sFJnD2mIbmQBg2FWy5BXBLHVVq8xeiuLMfj2QDLLLB3kSd6C7iO1fHphFSlUf23eQ
         vp9ADMFrcoHdrQXQp7z7C9sdcfnXHOsF6jkVjm5fC71I/oaPF8jR7kI6qS/m+QRH6Qss
         nSnet03V647Ka4Pbke1YOc0H/si1fVVTgMNokvGdaT0aOxvhDw5sg7fo0zhUaJvpEkhI
         yLJJXAVYDWymIV/dNHJW5nwIsbvG+oCAsg6Bhbhs9mNr/gsSzKdVKuKdKZi6cSqMLZmQ
         Jy+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IcGwPw1KAay48jXvk36yUAnIISfs7y+i362KBjH7aCo=;
        fh=Ao686aBplFQv6ryzbM3GtviGCpglNwSgShW9QCYoA8A=;
        b=BljFdocVGR07LwA2vzMJr9Uw4bihC3S59VHeG4QeTh0zpaRIXZD6KXhVZLGcYoSmyd
         J4tylv+iD/KiI9IASM/qbSGMDkAPnHFn9vvDKozd6/U18zHmH5+dwUG7iYf1rW5ym9o+
         kuFxq53KwTOarP16t4R5BB4xMO4L1qEQ6n4GwKFujSFhEkcFWfj+yPZapEfFgN8qB8QV
         I7XaCRcl1Uak4crA3wt7EA+8WovynixbCp0xcbHKd1msTPuBVFN5iPXW4Q5EuSzG4Q31
         3mfDXTU6EtCpuSV7T2H/lzC60Wj0mvJyQ+kx5cJawZ9N8yqrgtDmqNaAXGOoqQw3gSzo
         MOYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Aw5ZjrU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041ee6857si1282459185a.631.2025.02.12.03.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 03:25:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Aw5ZjrU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiAr1-0005yL-O2; Wed, 12 Feb 2025 06:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiAqv-0005we-Pp
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:24:27 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiAqs-0004Rj-Gu
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:24:24 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38dd0dc21b2so2763344f8f.2
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 03:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739359461; x=1739964261; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IcGwPw1KAay48jXvk36yUAnIISfs7y+i362KBjH7aCo=;
 b=Aw5ZjrU31SzRONn93F+4iorSSVB99rhJPQe7tOKH5docxDCoacADiEJTrcd3OgRZnq
 8IiGGfXWI32qecV9gluEv4jgIibiC6ELpkVlS6bq3HJf4gWeYy5k0Z9nCylzi/Q8RgMU
 mq/1egRvWYQ5KmX6IJu80BvakfEjQ8QBEKZ1Jeg5oRb7s/fMh73yx3Jv+fzEb4hhoseh
 TONljsp39o2TiKKGbynZi4mMJAipBloqgexKpV1ZQEK3te4aHkFC26loTVlkM5USSSA6
 6pCZ9PA/gXzS7AYccDceFqN6uc5a1WDuRQUnhbCwJJIkET8IsQmGQNX/YD2fLzww3Nkn
 VGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739359461; x=1739964261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IcGwPw1KAay48jXvk36yUAnIISfs7y+i362KBjH7aCo=;
 b=JFw0YTwnr/ya69Rr9lDRhaAcLwYUOSW9qUNRTB4QcNPi7x4hj3Dy8C8JrtneMhBmBT
 997tJj3Y4DN5fVBazOB1M7v9UNuaqe3jCiTfC/ZhZqF4wZAjc9VqsxPNjbybdxIZO3hg
 IgicFQCYG83lQ+V6hKYaWUnA9dw5gv2cD/fQGz4UTL0ZMwKJtMgIwoazAmFSfJmaTO64
 7kMKRfrj7FowJSbxJDMI8hSFmoKqlIrgcloSyEGT65ZixVIK3OVMGtfgdCdUPqhN2GnW
 3jHcSJIUuqG6Mp9u97J5Gg+4n3uJBj4VeZtLMbexRq9k32Jqw21eTM8nwFy2KIV0e+0E
 lgEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDx8ntQeoh2EnONPjEDR/G6jZpg5ZatmYhJ9+m/cYd/D383LMeaeOA8ga6lHdMPf+TLxTSCvCsqA==@nongnu.org
X-Gm-Message-State: AOJu0YwbTCkAK7vM+u6e7CGubJR4SSaK6hxYBCm66+kPjjxdBKUmxhkb
 eXKCpjN5QvjnTLzmWuDyRalP5eCz93aeMWfdqBRqzGGhElD6JFyvsragG+ESkGE=
X-Gm-Gg: ASbGncsxkdVefqpX2zre0jVJTRp7qSMwLAn+MDMkRflLid2RY3r5OCwJBXQojzf09Qx
 Ip7cX7hA+lH8Egf/SRsRKDu2mBnk+pEB6QQLEclyPn00SVXzMmV3uBW1n2zZpPsGYF7oYFv32v/
 5XW6V2bAUchowqtUFtvrsd/guzysU2nsHnJaU4AJH0JpJhhHwiIA8WR90LnyXsRxf8/lZ0TbRsY
 DQcgAkJqLlNudz7/3eDW97YVheXm2UFfrk1lj1+B5OKlNb87euX+VL7dcNtKswyvMKsxOPio4Cl
 37F8mpY5XjMzbGjFkoT3dfTSBGOtPs1dcdHAPsy33ETfxh38bRu29hSRISEjxcHdyA==
X-Received: by 2002:a05:6000:1818:b0:38d:e304:7485 with SMTP id
 ffacd0b85a97d-38dea265ebfmr1914973f8f.19.1739359460764; 
 Wed, 12 Feb 2025 03:24:20 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc5a8a9e4sm15910608f8f.10.2025.02.12.03.24.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:24:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 01/11] hw/qdev-properties-system: Introduce EndianMode QAPI
 enum
Date: Wed, 12 Feb 2025 12:24:03 +0100
Message-ID: <20250212112413.37553-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212112413.37553-1-philmd@linaro.org>
References: <20250212112413.37553-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: GibkeNrlZ/hp

Introduce the EndianMode type and the DEFINE_PROP_ENDIAN() macros.
Endianness can be BIG, LITTLE or unspecified (default).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qapi/common.json                    | 16 ++++++++++++++++
 include/hw/qdev-properties-system.h |  7 +++++++
 hw/core/qdev-properties-system.c    | 11 +++++++++++
 3 files changed, 34 insertions(+)

diff --git a/qapi/common.json b/qapi/common.json
index 6ffc7a37890..217feaaf683 100644
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
+# @little: Little endianness
+#
+# @big: Big endianness
+#
+# @unspecified: Endianness not specified
+#
+# Since: 10.0
+##
+{ 'enum': 'EndianMode',
+  'data': [ 'little', 'big', 'unspecified' ] }
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

