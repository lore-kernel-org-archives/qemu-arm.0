Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2113082ejb;
        Tue, 23 May 2023 12:57:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4eiAQPHdtxCA8J+aFqQQEmlhKO6NNrAeOQU5vLKSiJrqFBO/T5iW1jviYyv5kDy7B0D12i
X-Received: by 2002:a05:620a:838d:b0:75b:23a0:de8b with SMTP id pb13-20020a05620a838d00b0075b23a0de8bmr5325547qkn.9.1684871819992;
        Tue, 23 May 2023 12:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684871819; cv=none;
        d=google.com; s=arc-20160816;
        b=Rv0LSjFJurGcfMzJvgUAYng6wReKTfYyX4sMrETeFodAiw7RnfMZ7x8R8oaLotRUlB
         GnW5BiHEde3Bs32kiSPwoLqeKLwo3brqSqWCKcT4k5kAUcikCOtSW+/std8AUoTciluH
         k2hsEYUwl2I1qhc+S1qUIaCn8n5J04Q/wGRMnv+r+Tv9gh+/cL7wRPLL/8JypXXUHqMF
         hFHU8KfBNEPhVkgjRFeHPZpRTnw4b2JRVi1WUw8nLBO4pMyDz3lVaQJIBP2rimptUncz
         S54JyzHmUm1fbjQVjRSP30RyZIJddOVKhRye9MtgRfTcfrut1rLyXIZguUhK8rnW0f8v
         OD7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Anz5dlSMRx2Ue0AdMLdpzN5IRHRJ9vVknwSj+KlouiQ=;
        b=FQVvLDMFGff+XduU4HocySwQbxuuIQpm6/IdYNBsHR0PQGfc2sU01SCLaRtOW2pV3n
         7EazXAXsTHB7iWGwtuRyvk7V4GCTnqJkbVlX0UyZ5yk7t/2pdAReeU+0Ex2X3iOoUFHQ
         HHZ0NS8YecNK6NR9lrPAYVbNXwUmsuJrPmAv7su9cOXqIUotEX0u3P5jIEqZWGYJUt5M
         9hvnkfsNHlB3uDUQl0+TR2C5NOq0AgRqES/sCk4DO/tW4arbnTPBOjnLDsiu5O21xexw
         Ue+fuabmXsxpFnHXVqEBw1jzf9gWvOk1gUAmCb0JnXz/6J+wnpvvfSR238yBLJmDEBGY
         pGdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=lhavaWV+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13-20020ae9e40d000000b0075b281cc115si1431843qkc.221.2023.05.23.12.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 12:56:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=lhavaWV+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1Y7L-0000Pg-U2; Tue, 23 May 2023 15:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1q1Y7K-0000Nh-CN; Tue, 23 May 2023 15:56:22 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1q1Y7I-0006SF-Od; Tue, 23 May 2023 15:56:22 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-96fa4a6a79bso603882466b.3; 
 Tue, 23 May 2023 12:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684871778; x=1687463778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Anz5dlSMRx2Ue0AdMLdpzN5IRHRJ9vVknwSj+KlouiQ=;
 b=lhavaWV+SYTjo+t3S5Fuv8/3rTstVvBx6aE+XMI7G9/YILZZgGoqegTF4DN052SsqQ
 iAUcU3TYay1ie7OJphU2xE9UwUG39MwOdNXusTc91ywsV1Gz/vMjvvuzkU29s8lcwLyg
 FcG9aMbkHKSVgAtUALoFPEqFtbcM6E8AEItXg8G7geYZarXse39HM5IcfEM9AMAfaD24
 29xW+EJjJ5eHKJ/0UJO5u9cRygAavLiHZzZL/l70G95Ki6xN0Lkt+k4gj5N5wKAdEs3s
 i6CLLAmQmZuVVjFmFpdUivzUmd2sP3S2g5ypWy7xSXNGzABiE46QqAXU8Sy9i1FWWKnj
 kCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684871778; x=1687463778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Anz5dlSMRx2Ue0AdMLdpzN5IRHRJ9vVknwSj+KlouiQ=;
 b=gMTz1TQuRWJbFnshSWvzD57UHk58yKa2nGrEQYdRdel+PtMyeysjClfPBwQi4Buj3/
 hoDUKkk/A27yy7lVx7dTgL6dDXyFLnKz81O65rrOf4+FHZdekNA/C825L7YM0vq7The8
 J0RANZNEGPAfPu33e5xrUAAP4k73XOFQkL1yWhxwYrsrQWEaHaRPcpa02NfRcy0Q/lZx
 rGK9WgcJKyTqzVwSuGN6+jKV0NMZkiYP6cuOgyEF5RphNsn0dOC5IlXVycR50VK7cF7/
 KXefiseqyIv33A1IlNyYzbYaf0truBuUTrz/wjsdrpoea5rdJvVp+SQwS8ZPF0dFHUCY
 HOaw==
X-Gm-Message-State: AC+VfDwFxT+YHKFoHs2cIeYnCTGBiBNH0SNP7rRnEqkEnr1fAmfaLXL+
 ti4Hag2VAsyC1QliK89o7rWNjsks1ao=
X-Received: by 2002:a17:907:25cd:b0:96f:3f1c:3fd3 with SMTP id
 ae13-20020a17090725cd00b0096f3f1c3fd3mr12360958ejc.77.1684871778101; 
 Tue, 23 May 2023 12:56:18 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-183-025-113.77.183.pool.telefonica.de. [77.183.25.113])
 by smtp.gmail.com with ESMTPSA id
 dk13-20020a170906f0cd00b00965af4c7f07sm4737740ejb.20.2023.05.23.12.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 12:56:17 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 1/3] hw/timer/i8254_common: Share "iobase" property via
 base class
Date: Tue, 23 May 2023 21:56:06 +0200
Message-Id: <20230523195608.125820-2-shentey@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523195608.125820-1-shentey@gmail.com>
References: <20230523195608.125820-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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
X-TUID: jz0LGIz1osDP

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

