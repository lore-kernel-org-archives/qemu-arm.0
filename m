Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp648461ejb;
        Sun, 21 May 2023 05:31:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5HMHkzyCs2IHmaZWfJAwvjrYigv1h/FGfi7UPXBgwllVSGlLDIcNn/ukfcRBSGamSJGwf8
X-Received: by 2002:ac8:5704:0:b0:3f5:4c06:f49a with SMTP id 4-20020ac85704000000b003f54c06f49amr14112265qtw.17.1684672286229;
        Sun, 21 May 2023 05:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684672286; cv=none;
        d=google.com; s=arc-20160816;
        b=yF+QacK+vg3LkXsZxoOVSS/0jroFBghXfhM7ZQwgr1WejzFgV/wyxDnteauqkOBtvE
         0ux1ZiyZSnnFvy45PAMYTz13zkw+ynPAOttyTXVGp0hj+QsX/VAUYFbGpu4c+DOw5fQh
         JSatQuoRjcLgNlh8vpuxI/6En1S/nu9eJQdTNLTHq3+U+Uuj2Gdc+w49e68MAWO6ELw/
         CiBsMfKeH9hRfzADE6CrFfwwEMV8i+bEdmnBXCH8YXffaVNtsDzo4nUsXDim6FwUDxnb
         2A/RCT22VLlNigwhorwJglbgEkBrj6oO49d7TJE6K8MRvhHGX5ZAlvK214c9hLRSSWwm
         rFKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Anz5dlSMRx2Ue0AdMLdpzN5IRHRJ9vVknwSj+KlouiQ=;
        b=lAfpwFcp0oTX8IaCUdWy3uEcJ56K4L9kc5zMWlVTKSnkr1zcyieS7EGqSz1cWy5b2s
         tAgHtWI35N8tENsNwu5YqYPDm+U8oPfniYYu6esQUWNCH5eszamB/p+HyS9GwyX26YP4
         1RkVVWi3S4BtqMZGpT7RK9+nifQRI1W91NfDNty1NXe4OJT8wm4TL1LO/zJ7r2oHYM6M
         N3qeL06QMlbpLeykK9O5kio9DDChbRAiP6wmQDmCsfLHLQgu+HjLZ7iwWgDRs7YXsUlQ
         BpgRNRM19AchjVpdHgOqxbdy3Skr9ycTojLErCcy3Nja9mn8SgoRPLjbxMqO8nDd3lEO
         AeOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b="I+MGt1x/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15-20020a37de0f000000b007513918a771si1910086qkj.665.2023.05.21.05.31.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 May 2023 05:31:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b="I+MGt1x/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0iDV-00025h-Uo; Sun, 21 May 2023 08:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1q0iDH-0001vT-A0; Sun, 21 May 2023 08:31:03 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1q0iDF-0001kF-Kk; Sun, 21 May 2023 08:31:03 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-96f588bc322so431355166b.1; 
 Sun, 21 May 2023 05:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684672259; x=1687264259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Anz5dlSMRx2Ue0AdMLdpzN5IRHRJ9vVknwSj+KlouiQ=;
 b=I+MGt1x/fVUA/Vfj1B/iex59UobttsBmPNzrgWbROuH/ockZNifRfZIQYY62PbBhXu
 EieTpWwcoyRqrWngEjBM7G0j9QZlgWSFzXk+ApCUIyb75MH3DQvaGi6sia9ziW5tVuXH
 6su5qd2WEfmW4bTwUVhx54ODTq6gSQ2O8xspMD1hRMBDWbL3uljWJBCtQc+knxT42Btl
 ZILE7XxBZp4eW++h6ilKG/NEJxyAx97D3HIEclIWK8qVidASArbdQKi0IuQDR6r/itP+
 kVMXqsWSWT/FehaO8EEQYK6TYvg03ISIgzPywdCr2hO+IljU8OQbRz+mS2Am7P6K3ySu
 w8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684672259; x=1687264259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Anz5dlSMRx2Ue0AdMLdpzN5IRHRJ9vVknwSj+KlouiQ=;
 b=fdxsa4Y9vJ3iAUr/Zi+ct4gDnoHEh63mp1gDZ2v+YjlAJuje5Po+o6WFtgT4He/djj
 Vs5ZTgfRCnCacwsWTHCuWDq6G874Tn1UfQ0nJIuCJjob/FvqM4dZ7vCK13U+keVXoJ3p
 Ol4nAKaLNr8hbRDv0Wkkb7t/QId1XzCYSb9BAVpcjhVzc16OisBailyDU3GG0gHq6R6t
 DipizMprrxsA/1jekMVJKV1+H4sXchNm3JU1iDF40ZXSREdy/ZKyA6klY94l+vQwAXCS
 9oOITYnBY0lU3Fwgij5Ag6TXCB62zRl5zhEZK5Fi1CGWjODGGqbtGHl2vB8USerefLLT
 UlTQ==
X-Gm-Message-State: AC+VfDyA4W1EBkZ2XBy1qJFQ3F0VDuZ31m5/y5n0afxYGMSzaFTfo4w5
 XbZCEegK7KT5VxlDZvUy0gAaoP6pNOY=
X-Received: by 2002:a17:906:58d1:b0:933:3814:e0f4 with SMTP id
 e17-20020a17090658d100b009333814e0f4mr8423846ejs.16.1684672258548; 
 Sun, 21 May 2023 05:30:58 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-191-145-122.77.191.pool.telefonica.de. [77.191.145.122])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a170906729300b00965ec1faf27sm1882678ejl.74.2023.05.21.05.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 05:30:58 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/6] hw/timer/i8254_common: Share "iobase" property via
 base class
Date: Sun, 21 May 2023 14:30:44 +0200
Message-Id: <20230521123049.312349-2-shentey@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230521123049.312349-1-shentey@gmail.com>
References: <20230521123049.312349-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-TUID: /FDeUrWbueBs

Both TYPE_KVM_I8254 and TYPE_I8254 have their own but same implementation of
the "iobase" property. The storage for the property already resides in
PITCommonState, so also move the property definition there.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

