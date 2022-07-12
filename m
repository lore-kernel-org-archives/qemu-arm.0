Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1703505lfp;
        Tue, 12 Jul 2022 14:59:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tNsuC4s2N3gGUaW8Ehjv+aVHfOhGYlyCMaE9uPFeowCeXMalH7GvUQFoWTs3BYFxAOAn7M
X-Received: by 2002:a05:622a:44:b0:31e:b6a9:69b0 with SMTP id y4-20020a05622a004400b0031eb6a969b0mr116821qtw.540.1657663146575;
        Tue, 12 Jul 2022 14:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657663146; cv=none;
        d=google.com; s=arc-20160816;
        b=yUk4yAirtYa3EzHoOHNonmRXH1vwt3xAjdeQmLbZhEMU6M+waLlAsmvL47bLz17kau
         it/d72wiaXquKDBl2mfKV0xL5FOvCw/2aUikupEROl9ktf9AE0/9vvwVgFluIbqkkFEl
         z4+FPQCrA0E4lUju90Znpk/0O7QiPKatYF3EbFxFYSfEngkN+btg7P7Nm3vZqC9SNcVY
         1KwrspFacki7Aym8PtOdLL8Jc/r/iABjMhJ4ywft77B9HWaNj9ZdePhzSvkdPO+Fh9fc
         rv4RkuvO3Z3LiyQwkGsbzDHbswZ9p6vmaTXQf98PYFgV4G/uir/GG28xa036pPVLOj0C
         GFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=uDT2uipZT8z6bkAKveew0pvhFqY6LzU+aWOiOwvHlLw=;
        b=kHUCSuT/zgyH6UpIFMUstFSukPR4YqKR2KXb/Kgal26Q+Aa+YYz5pKdAi7a+C4Onyq
         BQ7861jdsk592nfoQA3EropqeriD1u2xSdTCbF/gMY3/A50Eto9raFTD1izJxO7HuDNf
         oC3h7juXbn6VIZeO40Inf04/U1qo9JU/6sdSAooBYNo4vjEqEtjkwQMehv81mTBXVx4U
         AUtlpn6I6reGwIVsiSYGAgizgUgUKS24q7IpM7BjuKKy7Ty/eb98G8Sf6pCdcaT8hzlh
         gBKh9FOniPO12dqCKI4Vgkg8UNlTVEJmdrMA7xHm4sGJTfAQf1CfMVE0F/CgjEGkP+l8
         lf6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=MbUPoKBj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h23-20020ae9ec17000000b006b5b7a0ac77si20494qkg.389.2022.07.12.14.59.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 14:59:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=MbUPoKBj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:38870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBNuL-0000cp-2s
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 17:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNot-0008SB-I7; Tue, 12 Jul 2022 17:53:27 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNos-0007oQ-3U; Tue, 12 Jul 2022 17:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uDT2uipZT8z6bkAKveew0pvhFqY6LzU+aWOiOwvHlLw=; b=MbUPoKBjTS6HqTfJcq8pFHI+sf
 KJbKrM7DpvfPAs41K2pZW1CBMDbl23KjIYna+YzWIhVr1pbq7N30ONraoY3gdTW5pIi4aieQLAXrf
 4q/m5OudPLpf8V7/hxODzU9f8f9jdV7h4ub8kumcXbXVvqKczl+OvSfKyH+Lq30OfnMRmG1UlFIxp
 8pE0jkGEY17ZPitKSBWgF0PEnRxazi3tSGbpfYAVtbqS9PmsPlUyZP+mIyz/RyXiO6dXLiSM3IBiS
 8Tio/0znBaml+n4EHJ4C43Q1zAhOc8XxZm8ySsKWaebvAXMDTJsUQwgZprEJI8fmNMx26mELJpxbe
 WP/3N2vKwM+12Apf3gKVEe5QAp2sH4F6ZvkhkfsCcfAWLRneS8e+jzNkMVerjgelWZaPAwU4EBJJq
 YxVKc8Z0ANnxcDn+g+G+p7JVREdnmpRQONLeK+R1nS2ltLDsBjW3wXwqI+2QJsvxXlf0NYm3ZJqgL
 P4nhA3f4W+SAc6OeQ6XU1SWqNOqg+FT4i31YB8ySi7NRVbWkqhS1XM4XBoUGqR6DoNBO4eQhPLtxK
 UVIkO6LnRjGBCcil2GcihZzyfmCwMgvKlg7v9xCa1BPxrW48v4tnE5ftEJ2YMfKHzYovPX8uYBnMa
 l92xeCVR1HimqJyrw/8+DqeJapmfOPMTH2HIDSdGA=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNnP-000Bqt-Gx; Tue, 12 Jul 2022 22:51:59 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:15 +0100
Message-Id: <20220712215251.7944-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 04/40] pl050: introduce new PL050_KBD_DEVICE QOM type
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L9CshvsxqVql

This will be soon be used to hold the underlying PS2_KBD_DEVICE object.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pl050.c         | 3 ++-
 include/hw/input/pl050.h | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 0d91b0eaea..7f4ac99081 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -182,9 +182,10 @@ static void pl050_mouse_init(Object *obj)
 }
 
 static const TypeInfo pl050_kbd_info = {
-    .name          = "pl050_keyboard",
+    .name          = TYPE_PL050_KBD_DEVICE,
     .parent        = TYPE_PL050,
     .instance_init = pl050_kbd_init,
+    .instance_size = sizeof(PL050KbdState),
 };
 
 static const TypeInfo pl050_mouse_info = {
diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
index c1f6c5a1fb..9ce8794bd0 100644
--- a/include/hw/input/pl050.h
+++ b/include/hw/input/pl050.h
@@ -32,4 +32,11 @@ struct PL050State {
     bool is_mouse;
 };
 
+#define TYPE_PL050_KBD_DEVICE "pl050_keyboard"
+OBJECT_DECLARE_SIMPLE_TYPE(PL050KbdState, PL050_KBD_DEVICE)
+
+struct PL050KbdState {
+    PL050State parent_obj;
+};
+
 #endif
-- 
2.30.2

