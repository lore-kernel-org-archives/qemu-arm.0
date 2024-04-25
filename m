Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1279595ejb;
        Thu, 25 Apr 2024 04:04:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVj2TV1p2i8LdpknAVCR1KWG/u3P4QI64BwhOUOjJfSmyhybiUoyPxNXXy0E0cqirjDngcZFRuQXSPsj5ksFieUuV6yhMS0
X-Google-Smtp-Source: AGHT+IGM1n4CWCaau7N6UlJZRbaYy5xaSc2OOjY4qYYdHXwhQwlHH9MphGBpBMp7zUiaBZcSv6D8
X-Received: by 2002:a05:622a:1a14:b0:43a:139b:14ab with SMTP id f20-20020a05622a1a1400b0043a139b14abmr3638351qtb.0.1714043082945;
        Thu, 25 Apr 2024 04:04:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714043082; cv=none;
        d=google.com; s=arc-20160816;
        b=ByrQkGOx4KF4qVSkCNrCBGyxA3mdu8w39b/3x0wZ0obLUlXzGOGTod6Y9gvYEouWlK
         vy/Yi84DsZCG2QB0yv81lzyvsJusqNpr53agPmMI+Om+Z99I4WI4+LY2X51BbuF7qA9H
         /vgG9J+A+U1EhKmGqy1dVICaUdTNBp8RBE0dG5jrgvmg26gxF0XMP6gOQclvlDeBHyRy
         EoUBt/xpuoaTl+mIBYAqkwM1iszh2sTwvVgI08nYPMtXZWdy8m66JQ4EzX+RzKO73Q9d
         tWfG4gSD93V0rx6Mx7StUUZnqtUCWaNafjCSZaLDJZ85Upv+3kVgtRuMPx+xI6rQtvJr
         /zUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Rf1txhvOtU9A895EpVlfVLIui0ISU1TQahG+lZi6+b0=;
        fh=AjJiCaOEq0bW3CFUfoWHOyxbijSvAbMfggVIeNtEb5U=;
        b=qweHFJDyez6rU5+Fzx4XvTBIx536pmziuPLGV0tbUJwYydysnfVXEKWodL/I+Z80G7
         Onx5OCgTF7c5F8gIkt0xtJ36jQeHsUQDkAiqtPTA2KYw1rJT7UHejNFdtnXSNG+fONQg
         Ndb2aZjF0S2TBtFXuqi+V/M91BjlrXEVefkthpcXFHI1aU+tmjfc88KId2tObQ03ZHC5
         9VYOlHDQU8suLX0vYhqJQOvS4K6GASnG6lCUyldV8cOBjvBtxgC7Bx+7l8gjy7zV4cK2
         yUFeww0xdB5fpIyOYmP6AJVw7XOkiUUNgK55620NrlMSB8ymRH0f86D44afC6hfmo5KG
         fd9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PR5ClGRq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ea8-20020a05622a5b0800b00436969a8c4csi15723553qtb.572.2024.04.25.04.04.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 04:04:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PR5ClGRq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rzwtw-0001dQ-KL; Thu, 25 Apr 2024 07:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwsS-0008DM-NX
 for qemu-devel@nongnu.org; Thu, 25 Apr 2024 07:02:58 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwsP-0008No-VT
 for qemu-devel@nongnu.org; Thu, 25 Apr 2024 07:02:55 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41b5dd5aefaso1540755e9.2
 for <qemu-devel@nongnu.org>; Thu, 25 Apr 2024 04:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714042972; x=1714647772; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rf1txhvOtU9A895EpVlfVLIui0ISU1TQahG+lZi6+b0=;
 b=PR5ClGRqgiiosD0JZPWcJyUawvI/ODaN7ZRYcLTZK25JoSDmN77cwLSCk3vgFT3icb
 rKIrpjor+xpY43qJFwdZp6sV86OTYz6J5RqnB/1/QQqwUzvJMjo4iWlCvqNgrKZrv+cX
 VMg8MtpQV+r/3SERfoQ4b8dqFox6QTZmMkUGZw7Z2UfaWUmSJB1YUirw7UvrTtvN8rm9
 tNfifvy9h13SIE8NRef3T8UwD5UKshoBLO7CEFSB/Zyj68F9oK7K3ZVB4XNQlGCC8JJR
 YWzHph8ohRhGMlhx2937TxhMWxwS+p+aSzHOAQEjXi2QMZpweYU9jHzton+saQYbcU7m
 s9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714042972; x=1714647772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rf1txhvOtU9A895EpVlfVLIui0ISU1TQahG+lZi6+b0=;
 b=ivAQM0MiOy5fVDbXn8JYIuXcwisT70XAgFH4r0HqK1cGVPouMT08xC5ZIj+Zl2O5Df
 XXThUSJlw99vzSKAMJo+T16kTbxnHxj0JMSlz3CJmuco0mNn/6MpNSibqRU/nAQ6OGu6
 L76JX8yszRDKgCKTQmY9rVd5MY+DVjSuKlfTXgIZ3CI/TqyhBD4rPLJ6FR68rebQkMup
 RTIAWTWM88sS8F62dSRP4dCjrqs+VjJPITxY7W4BrgR7ZQajuVk35MXttnBhLx2q+IHT
 g4TtR0UuG8rcf2xpNAopJt/8UrQimNcEPNqpo8MupbYs8/uTWQgerkPAPs/Ri4Wyt3j3
 uiQw==
X-Gm-Message-State: AOJu0YwHgov8w0/YY5jWLwA5XczQHLcAQS/6pNctgwCc+lN5C1wXAT9s
 N4UghdG3Us5lCeFGuh2zrBuIWcvGvt7fdWJTiUfTxWW3dWJXUQrgdkDDpTEcq1QJP+b6MSLpZ9x
 M
X-Received: by 2002:a05:600c:4ec9:b0:41a:bf5d:c30a with SMTP id
 g9-20020a05600c4ec900b0041abf5dc30amr5646980wmq.18.1714042972013; 
 Thu, 25 Apr 2024 04:02:52 -0700 (PDT)
Received: from localhost.localdomain ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a05600c0a4900b0041b43d2d745sm2089435wmq.7.2024.04.25.04.02.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Apr 2024 04:02:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PULL 09/22] hw/riscv/virt: Replace sprintf by g_strdup_printf
Date: Thu, 25 Apr 2024 13:01:42 +0200
Message-ID: <20240425110157.20328-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240425110157.20328-1-philmd@linaro.org>
References: <20240425110157.20328-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3cYkD4kADdJT

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1.
Use g_strdup_printf instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
[rth: Use g_strdup_printf]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240412073346.458116-26-richard.henderson@linaro.org>
---
 hw/riscv/virt.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d171e74f7b..4fdb660525 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1617,10 +1617,8 @@ static void virt_machine_instance_init(Object *obj)
 static char *virt_get_aia_guests(Object *obj, Error **errp)
 {
     RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
-    char val[32];
 
-    sprintf(val, "%d", s->aia_guests);
-    return g_strdup(val);
+    return g_strdup_printf("%d", s->aia_guests);
 }
 
 static void virt_set_aia_guests(Object *obj, const char *val, Error **errp)
@@ -1741,7 +1739,6 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
 
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
-    char str[128];
     MachineClass *mc = MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
@@ -1767,7 +1764,6 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
 #endif
 
-
     object_class_property_add_bool(oc, "aclint", virt_get_aclint,
                                    virt_set_aclint);
     object_class_property_set_description(oc, "aclint",
@@ -1785,9 +1781,14 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_str(oc, "aia-guests",
                                   virt_get_aia_guests,
                                   virt_set_aia_guests);
-    sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid value "
-                 "should be between 0 and %d.", VIRT_IRQCHIP_MAX_GUESTS);
-    object_class_property_set_description(oc, "aia-guests", str);
+    {
+        g_autofree char *str =
+            g_strdup_printf("Set number of guest MMIO pages for AIA IMSIC. "
+                            "Valid value should be between 0 and %d.",
+                            VIRT_IRQCHIP_MAX_GUESTS);
+        object_class_property_set_description(oc, "aia-guests", str);
+    }
+
     object_class_property_add(oc, "acpi", "OnOffAuto",
                               virt_get_acpi, virt_set_acpi,
                               NULL, NULL);
-- 
2.41.0

