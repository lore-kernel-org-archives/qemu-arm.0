Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2780592lfm;
        Fri, 3 Jul 2020 13:22:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2qZFDccEsAIOHyMfHKzy1VCL1YfihgcK/OFGfnCkNRClNXBj2Kpi6fT1MwlBttffGCBh5
X-Received: by 2002:a25:81c2:: with SMTP id n2mr38159074ybm.520.1593807737820;
        Fri, 03 Jul 2020 13:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593807737; cv=none;
        d=google.com; s=arc-20160816;
        b=YAWwVstd/m72THOa1jDnvGxed3+jNPv6zwaNL5UNpJBn7Jf/hC1RI4FaF3f9UUYmsM
         i1XBKxXQ4ufFpJghrpwtp0An2oxUDDb4nE2GMy+CuGE+AfJLR8GHmPB7U6ACl5XqaX2b
         xPIY0J9N1RXi60PJeFy/pBfcTol2p77jrSmzs8S7E7sAg3w9Hg04n/mmUnksPFEqIFmy
         PiFuQhvWh2zR1JxXPNPdlFL5bErclFIgXPME51f7t8sWY11GTjSTlN457EHbnRyfK4i1
         Avo0CEj7NgMd09Uq0k43H/SkjxXdF0b5IWeWdqYyZdNL/e5WWDTPSbYroT5TcjEkQNzB
         6YTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LbmmUu3oTl3Y5tkkh/O3TvS1Wej2jrXggK29/7bCPIY=;
        b=pBNaTV51FmupP6cQuzz2RebkvzlMR0f10+PH+CpUZ2IU/lnKLoCDaX5+zFVTNX6nC1
         ggUTbqr7nJLIo7PoRJHkxZXFDZpCltEkQEMQNIDPf0tsAzPTGgh0vIJecLQvlUQ8Ox2S
         Osu7Huu+dgcjZQf/QH93QIXyk7WM2XlU5xYq30896cPtvUXjmB7XzAV6s3N+6coiiDsS
         T32+RRTcnqWckY4tUnZPGEYiCd29HoaEXhQvTAdK9e/lPiSQefUrI3XFQZQtPfAABhrW
         xpom1t5KmmSyGXcdh7UNQ7VJ1OiW/guf97ImU5Tvelz/GIBV4atiuj/L4sncNdPsDFk6
         czcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b6vLir8M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v84si12314268ybv.78.2020.07.03.13.22.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 13:22:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b6vLir8M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrSCP-0005Bl-5f
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 16:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrS9f-00088B-AY; Fri, 03 Jul 2020 16:19:27 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrS9d-0001VR-Mj; Fri, 03 Jul 2020 16:19:26 -0400
Received: by mail-wm1-x331.google.com with SMTP id l2so33765615wmf.0;
 Fri, 03 Jul 2020 13:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LbmmUu3oTl3Y5tkkh/O3TvS1Wej2jrXggK29/7bCPIY=;
 b=b6vLir8Mpy1ePg9hSMhI7tz2E8EdrIDjmZwBI0l8SYVQulKjyKHRYaMmhSL/xpJZv7
 48aXdO4cQh8paBc+Uv9yZB5XfR2o2rgMyDIo9mqAZCOfC3g7uxhYeKY2A1A6toJ2Eoim
 dB3/6eN5WarW21jmMpBVHg3lXVz2eFzOjWFrNjHGNGsPJJzckhfZiBePCLlaD3RPkqtU
 bzcXWyF8u7omK+SQSUnva6EOACMThqvcU2dn4YL18hHRqSuUapQ4DHkAs+gOW7GsV9rw
 4SwPaTUIEJ4NB6Kb5K++E31J08ZavGjWiwD4NsP2I5zYfCnWoKGY1bBildpI6Ozfm54k
 tc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LbmmUu3oTl3Y5tkkh/O3TvS1Wej2jrXggK29/7bCPIY=;
 b=kDOd1V7BEiANhNtL+Rjw9Q1sbBG7le/BmdHq/AgLGLEjbogjahC2hg7GWpPDlWIonL
 j2aeo7Zth/gGvz2omatacRcCUo0ZzpH8z1p3MonVN5IeJ1SY582tIPzscVdYSIKard+s
 1boPK++8/0sW08HD3AbRLWhzg+A9ztb2w5tgn120ASE0WisThIYxrHJK4x/ZneURFA8z
 COQfwUzWODL4KKR+tnGu6qyQW90B5njtmqRhvZSl64I8zsWAwRLrcCewApSUPWI3wnpC
 hTiatx/UL84Q461XybUTFV+5i/IK6SHyp/IdrC6LSXyi3Aet9Es7lBYA9nlmo3oYEHgW
 6sSg==
X-Gm-Message-State: AOAM532Vq4H94FE6dE7ZA4HFIF8uyaL00fLyHCUTdUclUtna0wXcQ+E3
 mrHlCWTX0xlAluTLFOrLMPz+xdFrdHU=
X-Received: by 2002:a1c:5a41:: with SMTP id o62mr23588378wmb.16.1593807563814; 
 Fri, 03 Jul 2020 13:19:23 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id u65sm14229625wmg.5.2020.07.03.13.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 13:19:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 07/18] hw/arm/msf2-soc: Mark the device with no migratable
 fields
Date: Fri,  3 Jul 2020 22:19:00 +0200
Message-Id: <20200703201911.26573-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200703201911.26573-1-f4bug@amsat.org>
References: <20200703201911.26573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XhAo66q0va/r

This device doesn't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Add a more descriptive comment to keep a clear separation
between static property vs runtime changeable.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/msf2-soc.h | 11 ++++++-----
 hw/arm/msf2-soc.c         |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index c9cb214aa6..8f85ff8295 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -51,6 +51,12 @@ typedef struct MSF2State {
 
     ARMv7MState armv7m;
 
+    MSF2SysregState sysreg;
+    MSSTimerState timer;
+    MSSSpiState spi[MSF2_NUM_SPIS];
+    MSF2EmacState emac;
+
+    /* Properties */
     char *cpu_type;
     char *part_name;
     uint64_t envm_size;
@@ -59,11 +65,6 @@ typedef struct MSF2State {
     uint32_t m3clk;
     uint8_t apb0div;
     uint8_t apb1div;
-
-    MSF2SysregState sysreg;
-    MSSTimerState timer;
-    MSSSpiState spi[MSF2_NUM_SPIS];
-    MSF2EmacState emac;
 } MSF2State;
 
 #endif
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 3235c76194..bcec389a01 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -245,6 +245,7 @@ static void m2sxxx_soc_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = m2sxxx_soc_realize;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
     device_class_set_props(dc, m2sxxx_soc_properties);
 }
 
-- 
2.21.3

