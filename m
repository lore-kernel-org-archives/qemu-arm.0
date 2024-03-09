Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp368471ejc;
        Sat, 9 Mar 2024 11:25:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUypBhXHUQReOykvHQvDDz7i7g93ox2HflgKThZzguKtWsFelLldaQxqKn+cX3m/unXAT2sSNx8NdYKLqANLKzXM1XAEam8
X-Google-Smtp-Source: AGHT+IF1MQXu35jxL0PSzdqAssV7R4TKGGCH9ohX3mftIdqSQARmxEh9fpkl/k3cie+cMaMh03Lp
X-Received: by 2002:a05:622a:486:b0:42e:fb29:136 with SMTP id p6-20020a05622a048600b0042efb290136mr3810528qtx.9.1710012323748;
        Sat, 09 Mar 2024 11:25:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012323; cv=none;
        d=google.com; s=arc-20160816;
        b=F/87Hy+ZypAuRxxu5nES7ubVB5g0xcfHf8nRJjxZP10TBQOVJ7hkDLCGX5FxDP85hC
         4udvjwVuwZyC0nZi/OVBa/nTyIJkfHadUxBMvPPZIQ2QOQvHtKEXXOS+iL4T3dtYlGDY
         ZMYyvMKifH4mU3DJceyKWfBZmbt7IBh0t7omNtFv4YPbR+fxUr1MlPtUnawaYIT+3lT+
         NMHcjGBxmC7V+4nwkaV2/D4vKG788mU2UvQDH6ev1YaSQJktLCB6HeK/6F+GcWM58G1s
         z63v/oJQAKJooEmLFbTbEhSPiZuOF2gO1FJfbELyLBSa183zXD0CXfUl0N3j1Fj3EGnf
         NLPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=D23dj2T324O3GGxalmLgdyenzdMnRbpccgTLg/T9/aw=;
        fh=U8bUP7hHNMp3TQpSutPk3KVufEwUPvJm1+gBBJA7HWM=;
        b=MiE4kFZPXaP3B9HR+NPnkta5sgdWI/KG35tIif11PGh6sBzEmVKPc9jpyfopiwFVDC
         sjClWGVVrJOIJShvRUroY0VMPtJlHIwKTz03nomDlpOGYaOFFLkyQSheRtKZGWy/SofB
         LE2wdBWy1zm3+BkCG5O33PaWKDJPsiea927yvyNaEldwgb7hTJ6jqTNeead3f9H6TkoP
         j4Wnq6Zppi4+Nlg6jwtuPl160ee9veDob5eGiZVaGhZqp7aUW20xwW8E3VBtrgQOml2k
         iVh5azYO5xB0Pornoz5KxBJEBtzRJusF4wX+9JwJYttiFbcBhbf2+kp1g0WhgWEbVf1U
         iRdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ERIDBqFz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6-20020a05622a198600b0042ef7077bc1si2161892qtc.550.2024.03.09.11.25.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:25:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ERIDBqFz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rj2JJ-0005WF-Od; Sat, 09 Mar 2024 14:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2JI-0005VI-MX
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:24:44 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2JG-0002w5-02
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:24:44 -0500
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-512e39226efso3208624e87.0
 for <qemu-arm@nongnu.org>; Sat, 09 Mar 2024 11:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012280; x=1710617080; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D23dj2T324O3GGxalmLgdyenzdMnRbpccgTLg/T9/aw=;
 b=ERIDBqFzmZ17pH8SpnAgGNi8hOYLx4icONDj6FjNkH8a9Lu86H+sb5p714/R3MmdMI
 tTUH/MCx004PSNJ3wsEPn89NsUoV8J/4Sh/boI3gwrhoBqepIm8kZh55/bJ+WzXUB3ra
 kAR0/XJCG7N+4vOUVvIq4mJ74GmNh7SyGInoY8frLjvAK+SBJloJjBpVhHidlL00fBIJ
 vw4XZkoXdP5AXC4BO4WeMEoOHqeThtvd8nyY6BWlm+IIEsKqm+89HhIXMJTSm9e9cH+a
 Nx0FFYvs1LRIVBZzPsr2nrq+yNk4SHW+/91JRl2ldY56z3sY6pVa+6QRc8K+mJyY8aeq
 ngzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012280; x=1710617080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D23dj2T324O3GGxalmLgdyenzdMnRbpccgTLg/T9/aw=;
 b=UWZgggNaO8Gnm3Dzudy3+aW9HqjbzTpn2nepWrfiyWR3r/I6wgpn9E/zyu4pgTIcJk
 9rjQQR6pRtNkWnsXvH27uncR2cV5MkJLkcnrcjnVrIdLHKvz4fF4SxpbBmNtEZOkSeWN
 N2wPPBwo2OBnY4WubGWwgHgrUOgceeUchqax74BFlG8X32HTEAqGvDDGJvEqTVfLw5lH
 KVOdpdpqL4tj5SNMFYMpfms5/cIBLejB/BBIHD3AWW2fFpWkYtrtlIWpM5ppYQVtEm6j
 U41+dCyngCTvgHSNnhIHAuwGvQ9a3nF6UyZBXm5I7oSWCM2GBQaoA5NAPEWSw+MhdweA
 l3gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdevCjfEEKJIWT6C2fda9WM7fQoQHF4h34dvtLwzIGeR7SOeUrjNLz9IRxwYVz68Mdm6fEFPIHvBwXa8In1c7vq9Qu
X-Gm-Message-State: AOJu0YyYr2Z63YAiXp9OqdY1U+bW/vHm7d9IzFfyjUo9NHpEt57EWtoj
 0DfBhTBNNnYiPA+NhdraiVYxZAZ0I4enWidd+n/7aFyPLRaDPLOA75BMzqlEjyE=
X-Received: by 2002:a05:6512:a96:b0:513:1cc7:ae4b with SMTP id
 m22-20020a0565120a9600b005131cc7ae4bmr2003705lfu.4.1710012280216; 
 Sat, 09 Mar 2024 11:24:40 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 rn16-20020a170906d93000b00a441a7a75b5sm1174678ejb.209.2024.03.09.11.24.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:24:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Eric Auger <eric.auger@redhat.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 24/43] qdev: Add a granule_mode property
Date: Sat,  9 Mar 2024 20:21:51 +0100
Message-ID: <20240309192213.23420-25-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: MiA+l46JOlnW

From: Eric Auger <eric.auger@redhat.com>

Introduce a new enum type property allowing to set an
IOMMU granule. Values are 4k, 8k, 16k, 64k and host.
This latter indicates the vIOMMU granule will match
the host page size.

A subsequent patch will add such a property to the
virtio-iommu device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240227165730.14099-2-eric.auger@redhat.com>
---
 qapi/virtio.json                    | 18 ++++++++++++++++++
 include/hw/qdev-properties-system.h |  3 +++
 hw/core/qdev-properties-system.c    | 14 ++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/qapi/virtio.json b/qapi/virtio.json
index a79013fe89..95745fdfd7 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -957,3 +957,21 @@
 
 { 'struct': 'DummyVirtioForceArrays',
   'data': { 'unused-iothread-vq-mapping': ['IOThreadVirtQueueMapping'] } }
+
+##
+# @GranuleMode:
+#
+# @4k: granule page size of 4KiB
+#
+# @8k: granule page size of 8KiB
+#
+# @16k: granule page size of 16KiB
+#
+# @64k: granule page size of 64KiB
+#
+# @host: granule matches the host page size
+#
+# Since: 9.0
+##
+{ 'enum': 'GranuleMode',
+  'data': [ '4k', '8k', '16k', '64k', 'host' ] }
diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
index 06c359c190..626be87dd3 100644
--- a/include/hw/qdev-properties-system.h
+++ b/include/hw/qdev-properties-system.h
@@ -8,6 +8,7 @@ extern const PropertyInfo qdev_prop_macaddr;
 extern const PropertyInfo qdev_prop_reserved_region;
 extern const PropertyInfo qdev_prop_multifd_compression;
 extern const PropertyInfo qdev_prop_mig_mode;
+extern const PropertyInfo qdev_prop_granule_mode;
 extern const PropertyInfo qdev_prop_losttickpolicy;
 extern const PropertyInfo qdev_prop_blockdev_on_error;
 extern const PropertyInfo qdev_prop_bios_chs_trans;
@@ -47,6 +48,8 @@ extern const PropertyInfo qdev_prop_iothread_vq_mapping_list;
 #define DEFINE_PROP_MIG_MODE(_n, _s, _f, _d) \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_mig_mode, \
                        MigMode)
+#define DEFINE_PROP_GRANULE_MODE(_n, _s, _f, _d) \
+    DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_granule_mode, GranuleMode)
 #define DEFINE_PROP_LOSTTICKPOLICY(_n, _s, _f, _d) \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_losttickpolicy, \
                         LostTickPolicy)
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 1a396521d5..b45e90edb2 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -679,6 +679,20 @@ const PropertyInfo qdev_prop_mig_mode = {
     .set_default_value = qdev_propinfo_set_default_value_enum,
 };
 
+/* --- GranuleMode --- */
+
+QEMU_BUILD_BUG_ON(sizeof(GranuleMode) != sizeof(int));
+
+const PropertyInfo qdev_prop_granule_mode = {
+    .name = "GranuleMode",
+    .description = "granule_mode values, "
+                   "4k, 8k, 16k, 64k, host",
+    .enum_table = &GranuleMode_lookup,
+    .get = qdev_propinfo_get_enum,
+    .set = qdev_propinfo_set_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
+};
+
 /* --- Reserved Region --- */
 
 /*
-- 
2.41.0

