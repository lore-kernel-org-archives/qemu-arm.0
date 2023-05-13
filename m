Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp5334284ejq;
        Sat, 13 May 2023 03:10:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4jVJBQErjgEkUJov6g/IuwopNzjAccIEN1Q3S4/8bZC8zxMfxq3XiFsQdcO68G4uc3zIg+
X-Received: by 2002:a05:6214:2402:b0:5e8:b274:46e with SMTP id fv2-20020a056214240200b005e8b274046emr48327593qvb.51.1683972630260;
        Sat, 13 May 2023 03:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683972630; cv=none;
        d=google.com; s=arc-20160816;
        b=y9veaB+QGu0rJlf7oq6oWvwOO7jzpxF4jGyBU4nj9PkLg12+hU76f5NZ9yPU9ECAFK
         yd0U4OwStLdgrdMeNiFIYUjhk6oB6cNmbZBYpGvL79lMU9HwZh5wHlSUcNE2ua+UGAa9
         ZqufccLBueEs0LdA5EGCj8Fsl7Q4taX3b4M3m7NS78q9tdl1OWRfDqIVuube9O2Mz0ed
         MZ/nb1gcV1wJp6LoqAMsnXIgn+RXKs5MXp8JdlYelctWbFS8qDzqkp+1tFu2nbjK2ANP
         IsZ+YeTKZolHIYDviMMZyZDELh68CixK/keI4unKc08PidqOx5U12f8LdOU3CH/wu4/i
         7xSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yK2AXj3fPSIz6Utpl7jtL9tKbRJUXN66thbr8qDAiuQ=;
        b=lv9yLKYpqCrK7jAznhf8r/Jmdg4lWjlDkh4Zyk2AJTQfoOVKUV6PykUJSc3gTsD/3Y
         2d6kSKKiIvVGfAe/Wy0qMDrdU4/qrp2E1843tBlYqcvUJd61L4txEmN3yfFc+pkTaHb/
         fq5x/YwV50eZteM1OgaolcPyYKW3bv0Bsnx5usw5AbWYtvRho9v8N7GX6yQEMrr8if5f
         dTrnppLHa0kS78cb9aA1ujK/MEWJ7/HCacLYNrMHEoduOg7/5i5PpDnBsWjeOqHqBlYi
         gTNNaa9+wOF3zKtJe6qINbfsVLCAvDqWFxWy2UX7fzyTlXvWmSe8n8dWDYib8U2TQ2Bz
         rbtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=dM83n9nU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15-20020a05621420af00b006211693b4bdsi6874701qvd.512.2023.05.13.03.10.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 May 2023 03:10:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=dM83n9nU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxmBy-0008Ho-Rr; Sat, 13 May 2023 06:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pxmBv-0008Fn-8b; Sat, 13 May 2023 06:09:31 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pxmBt-0004Mi-4G; Sat, 13 May 2023 06:09:30 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-966400ee79aso1541188566b.0; 
 Sat, 13 May 2023 03:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683972563; x=1686564563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yK2AXj3fPSIz6Utpl7jtL9tKbRJUXN66thbr8qDAiuQ=;
 b=dM83n9nUFMaLC5GveBnX9eYbelu0mxXCc818g1/fREvWc+EdUIa6hL57y44sPuJLGO
 5JNeHBUgwhuOjFjoLYGh2hw57L2DgAZe/oIiNqEyzBZGsnfu4ElFP2faTtc2BTFz5eAY
 gu75oYYBgq8zhH/ORLxvDeDR3wjwJAgN4KVGy1d6C5kTEt2Eq3K1Nic1mU/gwMZK2E6Q
 pzlPpTSrj8aVJ8HlYmnZkFMmNgzUaQlHv4V+3sObFM/iYVYPxdU+DLjNkIrLNvrgagOy
 PLMTF7KBaeFyybvmDU0B4OiAYZ4hor2f56HPS6ttMs+C8ygHImmxuVUaHCRra2uSasEo
 pxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683972563; x=1686564563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yK2AXj3fPSIz6Utpl7jtL9tKbRJUXN66thbr8qDAiuQ=;
 b=NXcHiliOtTSk69u6+ACKA/Z15mk0+NZMtpb1ZfKF2Enm7a1cBq5UwzM3iUeXhGDOCz
 vvFqG94djAfrBuVsXxhVMtDnvXj9ZVpviOlyes6DN/RH5UIZBzdbWr3VpSIVWTdXDiFV
 f7ErELFFiBEL8libB4VWLXOcdLEsLD8C8AzlBJ8TB+qNA4vT9c/7ek0poWr6NhPta4ps
 D1EUVWwQ/x3TrzfnGjGxD3jYuHyVl7RYlo3RQ4l3xTU+44Qhp0ssZedGXpwd36RqhoU0
 kQXQDZ62zZWMQHv0z5LYQiGtD3u/kNevOHXSsRybiNsT/yOesGn1mWqeSrEbOEgEuDrR
 Y4Hw==
X-Gm-Message-State: AC+VfDxhmeckxGkjtp3ZBa2XZlOHrGhTBq8mgj+cbLT/bMPAexB3DIvr
 /FasCy6DENUcbpC6muVcY77AI0U3g60=
X-Received: by 2002:a17:907:9606:b0:932:7f5c:4bb2 with SMTP id
 gb6-20020a170907960600b009327f5c4bb2mr27463391ejc.75.1683972563195; 
 Sat, 13 May 2023 03:09:23 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-013-174-037.77.13.pool.telefonica.de. [77.13.174.37])
 by smtp.gmail.com with ESMTPSA id
 jr18-20020a170906515200b00965f5d778e3sm6645285ejc.120.2023.05.13.03.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 May 2023 03:09:22 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/4] hw/timer/i8254_common: Share "iobase" property via base
 class
Date: Sat, 13 May 2023 12:09:03 +0200
Message-Id: <20230513100906.46672-2-shentey@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230513100906.46672-1-shentey@gmail.com>
References: <20230513100906.46672-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: PYa/pG6TYOke

Both TYPE_KVM_I8254 and TYPE_I8254 have their own but same implementation of
the "iobase" property. The storage for the property already resides in
PITCommonState, so also move the property definition there.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/kvm/i8254.c     | 1 -
 hw/timer/i8254.c        | 6 ------
 hw/timer/i8254_common.c | 6 ++++++
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/i386/kvm/i8254.c b/hw/i386/kvm/i8254.c
index 191a26fa57..6a7383d877 100644
--- a/hw/i386/kvm/i8254.c
+++ b/hw/i386/kvm/i8254.c
@@ -301,7 +301,6 @@ static void kvm_pit_realizefn(DeviceState *dev, Error **errp)
 }
 
 static Property kvm_pit_properties[] = {
-    DEFINE_PROP_UINT32("iobase", PITCommonState, iobase,  -1),
     DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", KVMPITState,
                                lost_tick_policy, LOST_TICK_POLICY_DELAY),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
index c8388ea432..c235496fc9 100644
--- a/hw/timer/i8254.c
+++ b/hw/timer/i8254.c
@@ -350,11 +350,6 @@ static void pit_realizefn(DeviceState *dev, Error **errp)
     pc->parent_realize(dev, errp);
 }
 
-static Property pit_properties[] = {
-    DEFINE_PROP_UINT32("iobase", PITCommonState, iobase,  -1),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void pit_class_initfn(ObjectClass *klass, void *data)
 {
     PITClass *pc = PIT_CLASS(klass);
@@ -366,7 +361,6 @@ static void pit_class_initfn(ObjectClass *klass, void *data)
     k->get_channel_info = pit_get_channel_info_common;
     k->post_load = pit_post_load;
     dc->reset = pit_reset;
-    device_class_set_props(dc, pit_properties);
 }
 
 static const TypeInfo pit_info = {
diff --git a/hw/timer/i8254_common.c b/hw/timer/i8254_common.c
index 050875b497..e4093e2904 100644
--- a/hw/timer/i8254_common.c
+++ b/hw/timer/i8254_common.c
@@ -240,6 +240,11 @@ static const VMStateDescription vmstate_pit_common = {
     }
 };
 
+static Property pit_common_properties[] = {
+    DEFINE_PROP_UINT32("iobase", PITCommonState, iobase,  -1),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void pit_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -252,6 +257,7 @@ static void pit_common_class_init(ObjectClass *klass, void *data)
      * done by board code.
      */
     dc->user_creatable = false;
+    device_class_set_props(dc, pit_common_properties);
 }
 
 static const TypeInfo pit_common_type = {
-- 
2.40.1

