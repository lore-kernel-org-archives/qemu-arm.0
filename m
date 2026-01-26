Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A46D19502
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 17:50:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkQdB-0001gu-4S; Mon, 26 Jan 2026 12:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQcw-0001TO-Jf
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:51 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQcv-0000Cc-3b
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:50 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42fbc305914so4121934f8f.0
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 09:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769449428; x=1770054228; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4XtZvlcq7y9dCibk7QnCziTNJJ4JB6d6R3IFkPvUGo4=;
 b=ff/MRB/o51EzrEIU57dxbZapif6uOF1wjGyjlOSBSo11sKxFBgJXGQUb89dAvJ2X66
 qnHpbj9z4QKgJhGZeju+OSmQ8kvPv8qQop6qwr8Fg6znljXC2GMs9ml1hWHpsnxOXhy5
 P72rAyg68N0zzeSSgUBS8utESpYalYqyrI22ywYyd7wGguO1Dnq2htZ+1YuUs6OOWLzQ
 Jj58aaHeKtrewyaCLdkJumG8kV4cW1+PmrAVKz1Snzm6Xx0hPuKnpzP0E9Fav4b2e40X
 O8lJy+3DKcy+52v95tpjPlV3exYd7SiK7VnY1BrFYuF8TWA7gBgkpAJfxrxuZl3gF7nG
 t6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769449428; x=1770054228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4XtZvlcq7y9dCibk7QnCziTNJJ4JB6d6R3IFkPvUGo4=;
 b=oOJWauBfUTE//yi22ammWfkSYapAieo/7q+oIVjo5AYN80HWKZJgUw4Ki+xBvFksdD
 kkBvrx3x8B8DjmWxiuU/aNtQCSMcHvJa79e+Nhci1dxK8t+3rypmnu6s09vfcsx+I6O6
 ZntyBV3w2ZcSjGIrrUedhQSDKPn+q/etxaTv2Kl9C9zLPcu3xcWZ3LNTeNTwnI6qEn6g
 gmpS0c4EhrJqpYWINx9ScD3WNQS5O5ZQ5WV6PpH/veKI7m2Ygfzi3OPGJrbCqotQMfoR
 8H5I6B1VWVXU6c41cyjWtPrfMKj1DY3xj89OgHF2Sq19q0zPExDvjcH6tgzNq1pN17kE
 9wqQ==
X-Gm-Message-State: AOJu0YwJxQegWSsIGUdELnJN7OT7s18GaRumw57xEbOFsQEcSZLh9tMo
 Hqputv9X0qOGYXnhnK9LGEJlW61DnBUX6B7g4IDTjWnIKeybD9icQvwX
X-Gm-Gg: AZuq6aL4N8ZN+4FfiUklFHJU5ppz2u2IQtU3UpiGZwSEr4zsyzNAaE5tYLM5wRGBqXA
 w5Vux6pTo2k96Vum/N5P7qMqi1D9ahMAuSuUXQp5HOicqaVz2XlglesQ2NYvdX9EjBMpH1QxCvv
 dfZKYZCcXUikf6U0T61nLpEyO+2207s/K4gKFgdw5KYl4/m6QfDNAFAxjPEbcWhx8HxT/5AmZfU
 N3d2TP/mYPEcmA9C5H7OarvtaTELTv2td6qptjNp3s6l8xgWaHmlQpgxL1oR+3oMDNBWgQ9Edeq
 3hFEW7UJb1xEH9hV2pCT/q4BAFcspYSPwpY5M16WAJS4Ako34zL/8bzhmHwwwM3DW1R1RUd8zXf
 0B4DD23ItUV3d8hj5/moAT3Cd4qjgCq08MQeSUkZoPfjrFGCeqOBnEbYq8TL8VS7sugeE/C7ET4
 CNyAxOxGzBHf6xmzmJk/ZTm/+nUglJO0zkI5B2nIpE3MsIhT777jJuiA==
X-Received: by 2002:a05:6000:420e:b0:435:9ee1:f91a with SMTP id
 ffacd0b85a97d-435ca3a43c4mr9883719f8f.53.1769449427416; 
 Mon, 26 Jan 2026 09:43:47 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-71-105.adsl.net.t-com.hr.
 [93.143.71.105]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-435b1e71730sm34199603f8f.26.2026.01.26.09.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:43:47 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 23/27] qom/object: export object_resolve_link()
Date: Mon, 26 Jan 2026 18:43:09 +0100
Message-ID: <20260126174313.1418150-24-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Export `object_resovle_link()` for use by other
subsystems.

This allow callers to resolve object path and verify
type contrains of a link property.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 include/qom/object.h | 12 ++++++++++++
 qom/object.c         |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 26df6137b9..1573d41d4f 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -2034,6 +2034,18 @@ int object_child_foreach_recursive(Object *obj,
  */
 Object *object_property_add_new_container(Object *obj, const char *name);
 
+/*
+ * object_resolve_link:
+ *
+ * Lookup an object and ensure its type matches the link property type.  This
+ * is similar to object_resolve_path() except type verification against the
+ * link property is performed.
+ *
+ * Returns: The matched object or NULL on path lookup failures.
+ */
+Object *object_resolve_link(Object *obj, const char *name,
+    const char *path, Error **errp);
+
 /**
  * object_property_help:
  * @name: the name of the property
diff --git a/qom/object.c b/qom/object.c
index ff8ede8a32..7e16765cb4 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1904,7 +1904,7 @@ static void object_get_link_property(Object *obj, Visitor *v,
  *
  * Returns: The matched object or NULL on path lookup failures.
  */
-static Object *object_resolve_link(Object *obj, const char *name,
+Object *object_resolve_link(Object *obj, const char *name,
                                    const char *path, Error **errp)
 {
     const char *type;
-- 
2.43.0


