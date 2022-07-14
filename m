Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp658336lfp;
        Thu, 14 Jul 2022 06:04:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uYEUkv9OgVB1j+boYLBwpGgZKbYPlq3IZLMBdpL90Edd2f17Ua9PAEkGOiqxeEUUDxAdsV
X-Received: by 2002:a05:622a:1047:b0:31e:d70a:a646 with SMTP id f7-20020a05622a104700b0031ed70aa646mr347035qte.209.1657803869108;
        Thu, 14 Jul 2022 06:04:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657803869; cv=none;
        d=google.com; s=arc-20160816;
        b=P2w44w039HVGoYlNW2jlCWzDS25IZiG1S5xTdqIoUOMQhaJKlJ2G9xVqIzv94lssTa
         HaagLTpLMJeDnnoDbg+UUTtmZffbFBEZ2YMXwdtqF1fVIrAttyflScrf+4PHxZL1BdjC
         A2+vJC4oFmXgc2czvnvgObq/RPFoErKFmetMVIUx7PWA+5O7scnMNVsW8UKiYm2jH7UZ
         DRjXVAEl5qUAwd4dXjxRjGIBhV5rJGKaokNgeBdAz5sjP+324+7in/bczy5rx7ZJ8NlO
         tM0uZgths8+d8uuTJp4/dudQihsY0Jv+6c7/JHLUvzNNipgP/PCwDXo+w34kAjtd4m9k
         MCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RIKpd2Q+yGIVTQRutafUU3qoU3iFdQUM9sknwaRG9ho=;
        b=mevwOvIk5Vg2i1Nc0W8qJ8wSHFFp4Dkq0TYKlgZjs4K3V4N1BgxJFVBYbOHTOT0H/Q
         zRnVwcI2VgYr3muwPmnTseMz1NbTMcPa7rxxL1GMZAi1uAieovnNCxWQKdvJwE0SD4ZG
         Gqb8ctAalZdnyvLdRmv7ja3QBO+Fw0NB9srz6fUpekH3ToJc3/UvUgTvCXz4JQ0wdXpo
         D2Dk9dkSpy1j6BlOQjpn1B20XzX1xwd0x2KRbCtkXl8UFlOd39A5wVZXS8d5GR+XDCuD
         MKt3CDW4FXB10LY7jZsq/Bxt0QtcEApaujI3Y5SIZJXHM9oxySPa2J+nD5hpv461IFiF
         7x1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=xoypgF2e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey15-20020a0562140b6f00b0047335b07da7si846010qvb.467.2022.07.14.06.04.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 06:04:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=xoypgF2e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:39474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oByW4-0002t1-H2
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 09:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mkurapat@quicinc.com>)
 id 1oBo6I-0003YM-Cw; Wed, 13 Jul 2022 21:57:10 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:17042)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_mkurapat@quicinc.com>)
 id 1oBo6D-0000VC-BY; Wed, 13 Jul 2022 21:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657763825; x=1689299825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RIKpd2Q+yGIVTQRutafUU3qoU3iFdQUM9sknwaRG9ho=;
 b=xoypgF2eJUzEwdaOwr6zQM1vtFBE1Um5PBTzduBvZEFEI8I5cNuwvlWb
 jYbcnslZBpV/KqeH8dT0vu/uP4vBnaTUhec0aYBX/WQfkZEah0p597FNq
 iUNsFr9TCW8FF+hvXuSgSQ6IG5b2RKol7Sfce+mSBgNiS5BpX1L4ku616 g=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 13 Jul 2022 18:57:04 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 18:57:04 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Jul 2022 18:57:03 -0700
Received: from perseverance.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 13 Jul 2022 18:57:02 -0700
From: Maheswara Kurapati <quic_mkurapat@quicinc.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, "Daniel P . Berrange"
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Graeme Gregory
 <quic_ggregory@quicinc.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>
Subject: [PATCH 1/3] qom/object : add object_property_add_int8_ptr() property
 for 8 bit signed integers.
Date: Wed, 13 Jul 2022 20:56:35 -0500
Message-ID: <20220714015637.817066-2-quic_mkurapat@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714015637.817066-1-quic_mkurapat@quicinc.com>
References: <20220714015637.817066-1-quic_mkurapat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=quic_mkurapat@quicinc.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 14 Jul 2022 09:01:55 -0400
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
X-TUID: 8G93EDXzrCO/

Current implementation lacks the support to add signed 8 bit integer
property to an Object.  This fix adds the necessary infrastructure
routines.

Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
---
 include/qom/object.h | 21 ++++++++++++++++
 qom/object.c         | 60 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/include/qom/object.h b/include/qom/object.h
index ef7258a5e1..60b88ed685 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1764,6 +1764,27 @@ typedef enum {
     OBJ_PROP_FLAG_READWRITE = (OBJ_PROP_FLAG_READ | OBJ_PROP_FLAG_WRITE),
 } ObjectPropertyFlags;
 
+/**
+ * object_property_add_int8_ptr:
+ * @obj: the object to add a property to
+ * @name: the name of the property
+ * @v: pointer to value
+ * @flags: bitwise-or'd ObjectPropertyFlags
+ *
+ * Add a signed integer property in memory.  This function will add a
+ * property of type 'int8'.
+ *
+ * Returns: The newly added property on success, or %NULL on failure.
+ */
+ObjectProperty *object_property_add_int8_ptr(Object *obj, const char *name,
+                                              const int8_t *v,
+                                              ObjectPropertyFlags flags);
+
+ObjectProperty *object_class_property_add_int8_ptr(ObjectClass *klass,
+                                         const char *name,
+                                         const int8_t *v,
+                                         ObjectPropertyFlags flags);
+
 /**
  * object_property_add_uint8_ptr:
  * @obj: the object to add a property to
diff --git a/qom/object.c b/qom/object.c
index d34608558e..1a0e64157f 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -2450,6 +2450,26 @@ static char *object_get_type(Object *obj, Error **errp)
     return g_strdup(object_get_typename(obj));
 }
 
+static void property_get_int8_ptr(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    int8_t value = *(int8_t *)opaque;
+    visit_type_int8(v, name, &value, errp);
+}
+
+static void property_set_int8_ptr(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    int8_t *field = opaque;
+    int8_t value;
+
+    if (!visit_type_int8(v, name, &value, errp)) {
+        return;
+    }
+
+    *field = value;
+}
+
 static void property_get_uint8_ptr(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
@@ -2530,6 +2550,46 @@ static void property_set_uint64_ptr(Object *obj, Visitor *v, const char *name,
     *field = value;
 }
 
+ObjectProperty *
+object_property_add_int8_ptr(Object *obj, const char *name,
+                              const int8_t *v,
+                              ObjectPropertyFlags flags)
+{
+    ObjectPropertyAccessor *getter = NULL;
+    ObjectPropertyAccessor *setter = NULL;
+
+    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
+        getter = property_get_int8_ptr;
+    }
+
+    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
+        setter = property_set_int8_ptr;
+    }
+
+    return object_property_add(obj, name, "int8",
+                               getter, setter, NULL, (void *)v);
+}
+
+ObjectProperty *
+object_class_property_add_int8_ptr(ObjectClass *klass, const char *name,
+                                    const int8_t *v,
+                                    ObjectPropertyFlags flags)
+{
+    ObjectPropertyAccessor *getter = NULL;
+    ObjectPropertyAccessor *setter = NULL;
+
+    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
+        getter = property_get_int8_ptr;
+    }
+
+    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
+        setter = property_set_int8_ptr;
+    }
+
+    return object_class_property_add(klass, name, "int8",
+                                     getter, setter, NULL, (void *)v);
+}
+
 ObjectProperty *
 object_property_add_uint8_ptr(Object *obj, const char *name,
                               const uint8_t *v,
-- 
2.25.1

