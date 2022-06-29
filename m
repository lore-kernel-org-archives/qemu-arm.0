Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp413981lft;
        Wed, 29 Jun 2022 05:42:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s/2mhZeLJ4xW/ZUQ6h7S0/MsEQuwX22e7y8pSrKu34JJJCSJXikbeMp5BvcX/2i4G2Vhv1
X-Received: by 2002:ac8:7f4a:0:b0:305:8af:a789 with SMTP id g10-20020ac87f4a000000b0030508afa789mr2141726qtk.528.1656506537466;
        Wed, 29 Jun 2022 05:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656506537; cv=none;
        d=google.com; s=arc-20160816;
        b=AcxHHCpta9ajIHEWzx92pih0fBrC9Do7wIm/orw0Yw6ATAle9/nNyJhpkVtieL+oQW
         +Wpxx7CNQ3f5cf6W6/YB6dGR/evYqxZ1NiKmjzwJbJuCjuniFcDgBdRrOPCChpXEM6z9
         FAYeuR1EjLhl/zLJrChAGY8sw5pepMPMjU1l2Pn3JHTZ5Hrl4DpsKggo2/uhoc++x5jq
         q906Qux85HIOpPHpSoDMDmx3aVHK+c2vv8WprrBawPS1/7QVoKYuDysqFxFBj+XHvV4Q
         S/AIO9Uw9F/708fZoj06T1nBqTXCHtcMcyJHGm5R+4H11uxkVsWMNrHCJ/tbzws22Di7
         5zxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=oxZ0MAzwBYh2zbYHzTIWktk6Z4pgwqOLXrKUMTvOqOE=;
        b=kp8P8YiuvE5pVYGpha9dKpPdW8lMMAyBTmA0B+0kFaBQdFypIBqMjgHanC40PQW0wV
         PqoKW1xUj9TWQO8v0vCyO009xiawRWXczxhI9Sn4A549yvrXJbeFrgg+uqjnO73wjJOQ
         FuJ1ChYNFyNTWAKEnaL4vVE+ZmKfvkS+hDvppVqy9W1iBZBmJs5npDhrVvzH/QYofmW6
         Qdosf8IVKl7QCMBSIOfmRUQ9uFtyPhzw9bQoxuY1LkQZwobNxjJflOo/HUnJ7YKjk6MO
         kCK+doir/yR/KQgaYF5psexDxJmryKb4/I81wmF3qGneJIy+Mfh2moRPsph8W9u8dmLG
         ebXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=gDQrYJpM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13-20020a05620a298d00b006a71394f91bsi10879926qkp.380.2022.06.29.05.42.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 05:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=gDQrYJpM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:60148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6X1M-0000Cx-Or
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 08:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X07-0007ba-RE; Wed, 29 Jun 2022 08:41:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X05-0004db-Gw; Wed, 29 Jun 2022 08:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oxZ0MAzwBYh2zbYHzTIWktk6Z4pgwqOLXrKUMTvOqOE=; b=gDQrYJpM2nbGfL3kP0+YvdrhWV
 ZnjWsiABIlS1gR2E78FfXEWBnbnO9bLhc5KmRPwaQLMiuaNWEf3JnL5YkKSjfs6DC315jihQe+j0Z
 nOktcNUjwj6fUsVO1vcccmEC1YBDJVq36b+0I38H+mqPGNaV+qGmeUvC0kZi2EFHb7iv9XdnVOqID
 D/T5VzGmN+WA6j9WAVtdMIzOdAXFfCF4yLQpjPaasGAlbPP674A9OK7n95EDUrOmsY22rw9TaUWZT
 a9SLrNlZqZM6mJNDxJk8rVFCZB7mBOdK2sxbJfznT0+FsP09VtXuhxOL3q9kqoXQ/Ub1eKpppaI02
 qoIEW0ELUKCJ79cbKdj+eY3PO0Nw+3cpjQOsd8RTfbmdqdIf39dT1cx/qa6u5vAY7B4fdWv0nFeuI
 PYBhfWN0mjx9gs+83L0kUC8fZ9C6fIsNwlE/LhETvzMLfCjIJEL7J61zDGiw7H5o/XHnbEzfDb80D
 ror/olwrfLJ4DjBp8cuixZZI5fHmg6g9sVZEfcAfS3HQIyW8iPbkV03MhlujtIqdGLlkVHT04kr1j
 /tc4BNvDJlONWYr4J6FmlyhKM3403n/HjFjgAESIiu+Guyc72dMjoijk/q0o4aG3hVEI4MCQAPnBU
 9Iln+poQnBrt6mCfV9cEKByo7p38KEbYO404PCJwY=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wyn-0002tZ-5i; Wed, 29 Jun 2022 13:39:37 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:39:50 +0100
Message-Id: <20220629124026.1077021-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 04/40] pl050: introduce new PL050_KBD_DEVICE QOM type
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
X-TUID: LCE6QINafNc+

This will be soon be used to hold the underlying PS2_KBD_DEVICE object.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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

