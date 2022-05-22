Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3074751lfh;
        Sun, 22 May 2022 11:56:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/I/ahn+0GBMpsDLA+moRl7tJ/6AF4NQpeE8Xc1dnRLF6YbfxvvP9jFXH6onPuzLcLhYPE
X-Received: by 2002:ad4:5967:0:b0:462:2ab3:2f with SMTP id eq7-20020ad45967000000b004622ab3002fmr4351468qvb.53.1653245812386;
        Sun, 22 May 2022 11:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653245812; cv=none;
        d=google.com; s=arc-20160816;
        b=XNDSd/EVzX6N7OV2milRL1r5YOT8theAsV6yIKthKvs2zAb9uAGEX9voxR7gCBCbh3
         4oLiqfkqVoZQfm8Tl0mYmvkkl9lxfgEtPjM32xDA/TDygal7Q9cf6F7r+BZIMhZJ3DtH
         IgY0C4UzH60pZiYbTTnt6BA4dqrVl4VjJr3Zrol/t0BaH8pqs6AOe8FOQ6Y3WKGN7yDM
         36gUl3XhBpTvljfr9HcPrNH5qQUxMjvAMeJ7esjUNWgcTj3+N1fMLkT73ErbL6EJrzyA
         BQbt0wGceOUQczf/BVnkTBHKAq7FPUjQBfy3UJiI9ZCIDrtexZXTgjwwD7ZbpzYBi21s
         NW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=PPN6jbft81bAGJphsFLXBpXRnqk5NMJmqaITu3n369E=;
        b=cnIno7uqkEBdflKT+/sG/7t+8Ux9OBBeKvcmQ12X770nLE3kCkluh/7TlFIEJoLALz
         vALXq7kPdedl+NpIHLGqi7vWs28EzqqNOX8bP7gqETOyX0y5Y4swbo3awNaVXIMn+9nN
         FLOhegLRPMkhnAsg2s6m06hG6HRMGjwMpnsY7cW9Y7NH1rk+JX4dcO6o1Jnj6TdJ5O9v
         iU7Gc4mbehxU4UU5Z+aeBkdVw+iZHzj+BRgXWbubxry8k1eshcn4KmZvnTlfW6X7ZMw/
         IRNVtj6vrt3C7fy+WXe8CuUV7L7S6j4WnVwh6B8Yekd/u7M10xpLQY/Hoflf5zms0Nj7
         QtFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=TsYzrmtT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2-20020a05622a104200b002e1fbf3be71si1898058qte.98.2022.05.22.11.56.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:56:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=TsYzrmtT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:39432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsql1-0001TR-SJ
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBw-00082q-G8; Sun, 22 May 2022 14:20:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBo-0003py-JS; Sun, 22 May 2022 14:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PPN6jbft81bAGJphsFLXBpXRnqk5NMJmqaITu3n369E=; b=TsYzrmtTMCBvOPw5duAMbLCtmf
 SzvzYGeiTGa3S5ypQ3kPCA6dbcJO+GNdimqD1ncxSoWY3WywC3KQAw+k9zN0eGD/z5FERqnXOV4NJ
 HPZmswVWFGkCXEcXjA7CGXD04TSnCGpoExWyKlRFM+hGWCBUjls2yCONGquBnehxVhCJwzxb/NCLB
 Z7AwnfmGBOLn30sXsyeXzZoovbYP3kCNqoNBees76Sr+l3ECQRCxAYVO8Ft1K7JRhjNFqoMwR2OLe
 vr/lWB3+/UaKRhoZL25U8rGHvdbk/zKA8smWg9IOysZgho/2p+LeZh+fe8xfMLyKf/3Dlm2IEXS0z
 IPIjb3ENno8V7be1ovMxMLB7kEfctYWP7mgspSulSEuKNaS5+y+JrxYFIR73CV3FKtJo2/iP22yOw
 1cOh4UempOhMkNjYRrT7jp075MPln7QYEjdZH9uqfvG6pGB+ec+x/971VMqa7NiISSAhplADl/6hp
 PI/MmfRYXrpB2UvSxaO2eWGaMzf8FHHYPN4Syy3vfsFnrwFiF3IwWA1rq4yqaVp2INtgVz/UvwBWC
 o+c7R/wlkV8NNLYI4YycVQqBpTu5rNibIUdSz1lGV6rtYTL6CQ4ESaJ0qKv/ZsvXUPJ8betvOwJau
 +CRKLwCgw7f+oDvsD05BFNFV8XWMYcboVIpwQOWmQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAM-0007pH-V6; Sun, 22 May 2022 19:18:59 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:17 +0100
Message-Id: <20220522181836.864-32-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 31/50] ps2: make ps2_raise_irq() function static
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
X-TUID: 4673Cy4dq8KW

This function is no longer used outside of ps2.c and so can be declared static.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c         | 2 +-
 include/hw/input/ps2.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index e3ee69870b..8b76ce1cdc 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -172,7 +172,7 @@ void ps2_queue_noirq(PS2State *s, int b)
     q->count++;
 }
 
-void ps2_raise_irq(PS2State *s)
+static void ps2_raise_irq(PS2State *s)
 {
     s->update_irq(s->update_arg, 1);
 }
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index 4e8de912c6..d04d291287 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -102,7 +102,6 @@ void ps2_write_mouse(PS2MouseState *s, int val);
 void ps2_write_keyboard(PS2KbdState *s, int val);
 uint32_t ps2_read_data(PS2State *s);
 void ps2_queue_noirq(PS2State *s, int b);
-void ps2_raise_irq(PS2State *s);
 void ps2_queue(PS2State *s, int b);
 void ps2_queue_2(PS2State *s, int b1, int b2);
 void ps2_queue_3(PS2State *s, int b1, int b2, int b3);
-- 
2.20.1

