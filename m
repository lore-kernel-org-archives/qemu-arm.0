Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3066449lfh;
        Sun, 22 May 2022 11:33:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrkTAv82rL2u/XbDiL2W8rLzrO+4zA0R5vpXOPD6lLC6mDU+lGs0NxbOvm8b1RL9uQ2VHJ
X-Received: by 2002:ad4:5d64:0:b0:461:e282:16f with SMTP id fn4-20020ad45d64000000b00461e282016fmr14878396qvb.8.1653244382071;
        Sun, 22 May 2022 11:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653244382; cv=none;
        d=google.com; s=arc-20160816;
        b=gXgaoGTylpSg8AXJcW66J6nyo5rqQCIt6sC/SXPfSmNwzvP1dxpPVQe+gHjD2J96L3
         v0h/Sm56UOhhYMBZ0/ishiYTgtbuIYo8b72PJp9PaDrnYRbuaASe8Ot3HLJwfajHF6Y6
         am2wN8sXZmLkGrlw/Vew4MAY1gt569HIz8G75hbtISAvUdpLGaO4znZDG2TZ0aJ5ZQSI
         7jUfsgARSLpSdFP+t5WOak8WiO0B1M5u7hg2AAr4Tj+dXlPeDgfA+DQ60kRw2qRKbuuc
         +THM0RF7ne57MIIdlLISA5L+3ACosGFAE/jk9W7Fz9fRVw+2uFXkBoUz19gw3zePjX6q
         WQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=3Nru0O6d8b5ve64QWJ+ZnYfsswh9BbWWpItYe9mXnFA=;
        b=tIcq1gZBuTxo4JDaWnJHvhGezzY+VQ/CWWSRS0z/qZxPRYaQCLyEBrrjS5oKVy4VyB
         WavmWS4Y5PI/q+smZRoznJb2xYiKYu781HprH0BAX2yEToTqANGgqV9E3qisCm8rMFw+
         bP9/zzSMDlG1bms0pInEIQeF36vTzEImh/2FqljnZ9rYCW2Gd43FFL/o03QTGP/Lz04P
         AlXBdznEvD0kpXWuZk5ezRQTHwUFg3hyY0ouot5cOTTElv9a0yLbW0jU6bnOOCGaMcYt
         gq5Hp7hajpy/1gfjHjPzucH3bE+1WXwT/DuPq2S2rbOMto/7DhNnNs7ecAAXDjMs5HrD
         G0JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=AgTEuPfy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15-20020a05620a214f00b006a335b82e30si831530qkm.505.2022.05.22.11.33.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:33:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=AgTEuPfy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:45568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqNx-0008LT-IZ
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAv-0006uk-1U; Sun, 22 May 2022 14:19:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAq-0003ZY-IN; Sun, 22 May 2022 14:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Nru0O6d8b5ve64QWJ+ZnYfsswh9BbWWpItYe9mXnFA=; b=AgTEuPfyZvNyXoLwSu3iLby5YM
 bRMfuGiAJhBaQL+0e9/+EzIyZgdC/Mt2ktBO7V7l9V5nrR8Y5sQtKHeQDdyW6+fkwUci8aR/o5EBW
 e5OPJHfO0MiBEDEJBuSCBcFmnFzMB3bw/Z51ew2GeHXxiKEOcUZVFL9oGKepiRhIBHQ8T43iOGeW+
 t9zGR0C4AU5X0NS8hBsyqgL7s90hqK5PNpxn8EZjPkrO9GGr1VYujwtJRn8ONQ/qTsHQVoU7L52su
 KKqOlintxpROJ4+eNvEKjorQcYfJhhSn45uvCp0H/tQ4f8ryz+oqMHvWiMFcOOHJe1RnI5pGm4YyT
 n6158qSPqjDgOzU7Rv615uciZNKarefR0zT9zgmkJWdmHVAZl/6xXBpFGAh61yHyeOT8gES6QEMMc
 pGxOV9NRNc7cphXA8yqE9TFAUbCfjLCT3asazi5tEZulrSJm7C9sQNREwp+Z0U6X085q0CmwQe26H
 vCVZWfqDl0Rl6aBlIJKC+Kiy29knTg2xUcTxg63bGeA7bDz+na4owTf/+oTy5xpUj6yLtKQ/25/vY
 R5y72mcLhrRT+ZlODbI+0OuXDlHV+aDvGv4ZKlKCQzcIhzWYqZYMfWAr56/4Q1XeEPzem76anhB0b
 x9aZO3SkOCqfpK9l4/epAcKgMkmjI+rKmjj3JJFLY=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9k-0007pH-St; Sun, 22 May 2022 19:18:21 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:17:58 +0100
Message-Id: <20220522181836.864-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 12/50] ps2: don't use vmstate_register() in ps2_kbd_init()
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
X-TUID: vQwO/9yPGz7r

Since PS2_KBD_DEVICE is a qdev device then vmstate_ps2_keyboard can be registered
using the DeviceClass vmsd field instead. There is no need to use
qdev_set_legacy_instance_id() to ensure migration compatibility since the first 2
parameters to vmstate_register() are NULL and 0 respectively.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 1d223de59f..04360c7f74 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1232,7 +1232,6 @@ void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
     trace_ps2_kbd_init(s);
     ps2->update_irq = update_irq;
     ps2->update_arg = update_arg;
-    vmstate_register(NULL, 0, &vmstate_ps2_keyboard, s);
 
     return s;
 }
@@ -1274,6 +1273,7 @@ static void ps2_kbd_class_init(ObjectClass *klass, void *data)
 
     dc->realize = ps2_kbd_realize;
     device_class_set_parent_reset(dc, ps2_kbd_reset, &ps2dc->parent_reset);
+    dc->vmsd = &vmstate_ps2_keyboard;
 }
 
 static const TypeInfo ps2_kbd_info = {
-- 
2.20.1

