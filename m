Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp1057273ejq;
        Fri, 10 Nov 2023 01:17:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF79gPasve8E9OJMxdipQw/zuQP/sU3jyVJANC2P9yBr80Kojw0jVN9UC/vrtrkOM0PeG5L
X-Received: by 2002:a05:620a:17ac:b0:765:aac3:7667 with SMTP id ay44-20020a05620a17ac00b00765aac37667mr8556881qkb.0.1699607841060;
        Fri, 10 Nov 2023 01:17:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699607841; cv=none;
        d=google.com; s=arc-20160816;
        b=oXPYgv26lL66KgZz9RgmEuXTW7mXUIljfLN+dtL3zN+VNcFyDXzG12mg33VKxTBTxi
         /hDBzvHN2yc7oghgPetXiUXJ75yhcJ4C6Gbg8vV9/FrscOThmkM0JYgJhFkYpB1bckZC
         xbn6mn0UFbVeIlLLDMjLyvPCMS4HxGeH2U/Dhafbgcf3rPEQltSHFKHWcgfxSri18RfI
         j8fCftp046W6RT/3XSCA0GRDbgDvLtUwvvhAmBiCJckHBkHmjWYrLSZat9YVXzRsEvhq
         8vbJyGHsfq5gj9bp9C/yYuJU4Xbxp+xOzDLVd+J7cqTU+lNYdGdXY33WFUUAoBhS8NdN
         RuqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DeFgcUrkNeVKboCpBXlqzidVzZtMesg9/1Y5VQkDHfk=;
        fh=mtodubHTNisGIf3Lih08TuyQelln6PlHviVD0zIjjw8=;
        b=lBdFbAYHWwEBILPXi+VCk6Emwk6VmbDXkPL8awNwazsbINtzLwCxDWTWo/7gglGvUo
         KaOUG7sU/H8hWxhJHIyrZL3y1DMxeMrQm5ndTJy5rlNhZyW7kGzZszeNA6Z3TKrMOS33
         +Ein6IYE1Us83tTYQ4v3sPC4eMfI2hbGKWRkMQ9UBVrJ6nvK/FEFhgjicNTE/+tA8q+6
         5yPWpJlf1aKFWy3Yn4JrbWyzJeTgBCZ5//coob0LbPmyjwma+aj+yHyAoEDhPGKhvOHF
         YKVVPQpOAIr/gNDCG0Lws51rEKDn4bqOl1Xuwq7EhkpTPW0kFfM+4aF75ot5qxecJqZz
         prCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i0c1uFUD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z38-20020a05620a262600b0076db6aaa20esi4370984qko.508.2023.11.10.01.17.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Nov 2023 01:17:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i0c1uFUD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r1NdJ-0002TN-Ib; Fri, 10 Nov 2023 04:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r1NdI-0002T6-5z
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 04:16:56 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r1Nd8-0002nJ-9f
 for qemu-arm@nongnu.org; Fri, 10 Nov 2023 04:16:55 -0500
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c518a1d83fso23781881fa.3
 for <qemu-arm@nongnu.org>; Fri, 10 Nov 2023 01:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699607804; x=1700212604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DeFgcUrkNeVKboCpBXlqzidVzZtMesg9/1Y5VQkDHfk=;
 b=i0c1uFUD2hp/LoozObvIuM36cT6TFPb3dZ+Pm3DnvSjeB9J1aCxD/JZ41WHIyuZ1tl
 nXesEx3omxNKeUzY7GRfm9Dix+ZLpRdKcEzF/5RgVdXwJdzfN/yL046ICYZHq9OvdULH
 undNBgWhNtiKuhYDaCZES0BKdkNt31yUYppso6J+7WOQX/oLoABSxmlVX6Bs+xazA2Nf
 vD/MsVarKBGo6kXS9cmPhOb1sZ6ud0svP3n7/Oi3+5suEJjK9PD9ubuxcSITYivZJK22
 BebX6As9umEkPlK3QenJXmicY5gPmH1JjDMHlfjJQVSGt80ggbIVyEaty+72wuEgmaOK
 W9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699607804; x=1700212604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DeFgcUrkNeVKboCpBXlqzidVzZtMesg9/1Y5VQkDHfk=;
 b=XEn1is2heQv9+KWMgOtrOMpxfpOz4UtemNi0TBaXI133HgHb5PQT3uPu7mJ7AroJjc
 c6dml0mlgx5HJwH4x0UJtmwBZKqATz248E9W9zwpEWpD/crkqPrT+s5ltEASn9ly3Vbh
 SgReCfppv0d+Y9xHzy68kri/M1LkQnFakyCyA+gNaRcfjuyBEs6IgzIiL+9X4gp7Axa9
 CiPSIzf5FBNHH09Y33k6tNKrCNKvQT7U08+Qt/BesH6Zt23fkib7T2g54yCR1VMgrfBo
 JWfPgnbmD8hGQp/FFzwAhDVmDG1mt47g3SSUNdLspyjIp6+XiWKcshGitVHjnlOaWtQC
 OHHQ==
X-Gm-Message-State: AOJu0Yxisd7bDIpEzzpva0+9fi2awbLuaRFtTPwOHIVlCOFK3yRcUer/
 aq5fvfrRMxj93OGlcsWW2VURCA==
X-Received: by 2002:a2e:3315:0:b0:2c5:2182:48db with SMTP id
 d21-20020a2e3315000000b002c5218248dbmr5774670ljc.20.1699607804405; 
 Fri, 10 Nov 2023 01:16:44 -0800 (PST)
Received: from localhost.localdomain (adsl-205.37.6.2.tellas.gr. [37.6.2.205])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a05600c359600b004080f0376a0sm4537493wmq.42.2023.11.10.01.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 01:16:44 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org (open list:OMAP)
Subject: [PATCH 2/2] Add warn_unused_result attr to AUD_register_card
Date: Fri, 10 Nov 2023 11:16:39 +0200
Message-Id: <4b040fc18cb0e563e92ce084ca18b89a050a8aaa.1699606819.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1699606819.git.manos.pitsidianakis@linaro.org>
References: <cover.1699606819.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-lj1-x22d.google.com
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
X-TUID: v0FMFr5JIB6A

Ignoring the return value by accident is easy to miss as a bug. Such a
bug was spotted by Coverity CID 1523899. Now, future instances of this
type of bug will produce a warning when using GCC.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 audio/audio.h      | 2 +-
 hw/arm/omap2.c     | 8 +++++++-
 hw/input/tsc210x.c | 8 +++++++-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/audio/audio.h b/audio/audio.h
index fcc22307be..b78c75962e 100644
--- a/audio/audio.h
+++ b/audio/audio.h
@@ -94,7 +94,7 @@ typedef struct QEMUAudioTimeStamp {
 void AUD_vlog (const char *cap, const char *fmt, va_list ap) G_GNUC_PRINTF(2, 0);
 void AUD_log (const char *cap, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
 
-bool AUD_register_card (const char *name, QEMUSoundCard *card, Error **errp);
+bool AUD_register_card (const char *name, QEMUSoundCard *card, Error **errp) QEMU_WARN_UNUSED_RESULT;
 void AUD_remove_card (QEMUSoundCard *card);
 CaptureVoiceOut *AUD_add_capture(
     AudioState *s,
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index f170728e7e..59fc061120 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -614,7 +614,13 @@ static struct omap_eac_s *omap_eac_init(struct omap_target_agent_s *ta,
         s->codec.card.name = g_strdup(current_machine->audiodev);
         s->codec.card.state = audio_state_by_name(s->codec.card.name, &error_fatal);
     }
-    AUD_register_card("OMAP EAC", &s->codec.card, &error_fatal);
+    /*
+     * We pass error_fatal so on error QEMU will exit(). But we check the
+     * return value to make the warn_unused_result compiler warning go away.
+     */
+    if (!AUD_register_card("OMAP EAC", &s->codec.card, &error_fatal)) {
+        exit(1);
+    }
 
     memory_region_init_io(&s->iomem, NULL, &omap_eac_ops, s, "omap.eac",
                           omap_l4_region_size(ta, 0));
diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index 950506fb38..003c664b56 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -1102,7 +1102,13 @@ static void tsc210x_init(TSC210xState *s,
         s->card.name = g_strdup(current_machine->audiodev);
         s->card.state = audio_state_by_name(s->card.name, &error_fatal);
     }
-    AUD_register_card(s->name, &s->card, &error_fatal);
+    /*
+     * We pass error_fatal so on error QEMU will exit(). But we check the
+     * return value to make the warn_unused_result compiler warning go away.
+     */
+    if (!AUD_register_card(s->name, &s->card, &error_fatal)) {
+        return;
+    }
 
     qemu_register_reset((void *) tsc210x_reset, s);
     vmstate_register(NULL, 0, vmsd, s);
-- 
2.39.2

