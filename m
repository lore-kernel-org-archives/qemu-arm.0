Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02D3E9A04A
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 14:41:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt57H-0000Ag-0c; Thu, 19 Feb 2026 09:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt57E-00009R-SQ
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:34:52 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt57D-0002yh-9i
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:34:52 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-435a11957f6so852891f8f.0
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 06:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771511689; x=1772116489; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QX6XlP9jfOn4IIWrQN3XN3SqDJFysVZcAsWU0gp3e3g=;
 b=Qc0nJf1VjHNzrNrEtqqTfeYJY0fCP1vbIjw6Psq5+ZnP4wixgehim1dp5xrrzeJwjJ
 ypzEwIzPYt0Cpij+syztNT0cPgAOCvILbo4YdEf1sYEAfx/RcLnUkZnbuC55EkuCPYOU
 1/27hByLNC1reSPxePTqmP59ISaOAEVPaJpm2XOFF8iB9wgN0fRZkoDMsdeTYE9THjs7
 EeDplaIy3mHcx428v2rh/nV4RAfzTpQJBsmiR98rbslRPgi1R214hn9lHliXzgjr9EIT
 mFAbtt6KfOfNmQDXdfgIMJmq6US5kfEaqtCtARV/EZsQlv6+V00ZuM8aA8pIDZ2K6/EU
 lhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771511689; x=1772116489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QX6XlP9jfOn4IIWrQN3XN3SqDJFysVZcAsWU0gp3e3g=;
 b=rbk4cUH60xaon2cIy+ommfPUTnDoF9GWWUBBtzJYdiMu+unhdW01rIAiQNdFxjGllM
 9WuE55mJrPAaY0M8YDsfqaCaNyFhTKvZiP+G/oE3PkWK+5GmsPUVK5IK6nsDhIAE6ebz
 lEt0ZG9sQ7Fb1Ny/zxGVXKeSkf+3C0UWqB/WrBxr6WfPsbzcm9T+RtzctZUSEkb+kzkk
 3SnXhI3WqLFiUkI8GCcmOkRkaAY9/bvYUTl05oNWQ1D5Ywx8rmEajbJbswCDj/WdUV9y
 JwAFIP5KWF4EydvhgsdpWm7Nlmj7lSslD/HxGIhKaKCEPm/x57Sl1aOaWbH11UAVJ0bx
 fv8A==
X-Gm-Message-State: AOJu0YzVZjVeTup6lJ/1jrFD9U6RH8gr9lYr+5e2t79ghu/iVTyq8ii8
 dpsklyMqvrkckOSeKrfSurH/OxuYI8jNcHu5adNYbusmP6WvfSoXJ8s9
X-Gm-Gg: AZuq6aLD0NOsMn31umwpS5NKA2uFBJfGHXFpyYIsjfM4HSbPSILhF8btrLdkDMtKsQJ
 xaJTkxEupAsJlaUw1cJxxnT/udwkCP/YbrUDkZ8UmOAId5vqNdygfl9cV6FaojUSik4dBxKhfVr
 2i6yh6nax/Tb44QefyOnCL/hXpZqeZxu+uUFnWNWeTEf/oQaRB2kIvYj4TsVaAVlkI0K34Nz8zG
 XZjQBBpV1iaHqkO2b+c7ZjIi1hLbs9GPpI+7Z6FGtDk9rLixgrQOdDH3woek2bzriLt3gD8IKwc
 YlKk9w1dFtp0eT4nSCbhmR0SDhCdYrFVqYv3H0XtLs1TO/X6LUqYegR5SOTnfOsC8LPFY9BCnTt
 l8JDqoilVJSVP00XgvFYCPt/bKSj7cMnFbLgLOuaRQV9OCLFJUrxlZ6yKzrgW+3f9HD6Cu+cP70
 eXlv5Nvw23MnpefJsux0tGDIB6dGf2ve7t7/dSbjTkM8ISCqSPGdGJEQMbzj1uzbiswidBTogbS
 RDlI9I=
X-Received: by 2002:a05:6000:40cd:b0:42b:55a1:2158 with SMTP id
 ffacd0b85a97d-437978d4f1emr35146756f8f.17.1771511689364; 
 Thu, 19 Feb 2026 06:34:49 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-129-182.adsl.net.t-com.hr.
 [93.143.129.182]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43796abd259sm52022770f8f.24.2026.02.19.06.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 06:34:48 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 09/33] qdev: Add qdev_prop_get_array_elem_type() helper
Date: Thu, 19 Feb 2026 15:33:08 +0100
Message-ID: <20260219143332.3316679-10-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
References: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Add a helper function to retrieve the element type of a qdev
array property.

This is required to initialize objects from a HW device tree,
as neither device tree properties nor object's property array
reveal underlying property type.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/qdev-properties.c         | 12 ++++++++++++
 include/hw/core/qdev-properties.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index ba8461e9a4..f92ccc35d8 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -950,6 +950,18 @@ void qdev_prop_set_array(DeviceState *dev, const char *name, QList *values)
     qobject_unref(values);
 }
 
+const char *qdev_prop_get_array_elem_type(DeviceState *dev, const char *name)
+{
+    const Property *prop;
+
+    prop = qdev_prop_find(dev, name);
+    if (!prop || prop->info != &qdev_prop_array) {
+        return NULL;
+    }
+
+    return prop->arrayinfo->type;
+}
+
 static GPtrArray *global_props(void)
 {
     static GPtrArray *gp;
diff --git a/include/hw/core/qdev-properties.h b/include/hw/core/qdev-properties.h
index d8745d4c65..19fed85248 100644
--- a/include/hw/core/qdev-properties.h
+++ b/include/hw/core/qdev-properties.h
@@ -218,6 +218,7 @@ void qdev_prop_set_enum(DeviceState *dev, const char *name, int value);
 
 /* Takes ownership of @values */
 void qdev_prop_set_array(DeviceState *dev, const char *name, QList *values);
+const char *qdev_prop_get_array_elem_type(DeviceState *dev, const char *name);
 
 void *object_field_prop_ptr(Object *obj, const Property *prop);
 
-- 
2.43.0


