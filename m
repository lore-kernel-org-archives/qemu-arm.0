Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp341461lft;
        Fri, 24 Jun 2022 06:58:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tYk9TTZVxa1n3frKhc6YZtd7lm0QzOv0ZAO4Wi4DuQ9rC28gj1l5xYv1EO4e/aO9a/wuaC
X-Received: by 2002:ac8:5dd0:0:b0:305:2d49:2528 with SMTP id e16-20020ac85dd0000000b003052d492528mr13210059qtx.464.1656079084315;
        Fri, 24 Jun 2022 06:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656079084; cv=none;
        d=google.com; s=arc-20160816;
        b=KaTBoqZc42Q/QZI7zBs2wzKwD3vxW6NiGkCBkaTo+nBBwuZ6ofQ9WyXQkZcNcZsDHP
         YrQ5pt6HV19jzNkZyT7IbV/gsjOsdIJV76YsSgcKPR5clpH2LhvFsoCS5bxQxXg/NJmz
         lQFmLV0bcHSjr1BQHhxjNrGlQ77K84xApNfTzzaBpP7EQGLxK8Lbz/vN8EcqwZOy1tAa
         zioB+9ryfONvTUdgy1nsqWBGXpy3A2ksFC975UNcnZLY1lmP5GqRNfY69JTLpBTcBYeK
         Ko6GAet7SpfU8WVQGRLHKE/Fti9JYTWc944g80O37u0/zyg8oM73VLo49GiI9+5UV9P4
         Wneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=/D3x0EPgbd1rsMLyHkuf/aV6SyVyhXgHYMBz9CwlEVE=;
        b=VJ2Ad9+FtMZ2YFKHpBbekYlIRC6+Ieca/UYBU5tTcCGBfxTYsTF8ZZtJV2FnKwGtFB
         8idr9wrZKTzjLS/mJio8W+4VPOxLwdltXoG11v8QwSRRjM5ldZrQ7D4TUEdRPVyDr1Lz
         D2W68e5aRJe5twRt92jiJa8DhUv70oMnKEN+CMC1nqe+5ns+tBL6NkWOZTKdMCX2TOJk
         i5PxjaE/C4KnCmd/R+3TU2VWmzqVYL0iU2TCw+wG+iykF//rqH3+3pp9MsauoDxqsYQt
         vLNldz7zgTMK7kCphiFpPz1vvAutUx9Vw9mw8zpQhvVfVr0uG1WYuPqvNfgb/7hhK3fe
         p+dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=vXhbFhtR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19-20020a05620a15f300b006a726c11e8fsi1452364qkm.582.2022.06.24.06.58.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 06:58:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=vXhbFhtR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:50366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4jox-0007a1-Qm
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 09:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaE-0001Iz-SY; Fri, 24 Jun 2022 09:42:51 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaB-0005EJ-Ou; Fri, 24 Jun 2022 09:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/D3x0EPgbd1rsMLyHkuf/aV6SyVyhXgHYMBz9CwlEVE=; b=vXhbFhtR5er3uzbOdjUXJGAu9z
 GCOyWnOdA0ab7TRnE8D75eXkM4/NE85YO4IU4RTYdpkYubvB3Qh5e/JjCONEQwAcXeUtcDh0XKOO2
 jwiiHWXdTtkg2bsVb/swICcBJeHh14p2WJyDGZ/jtZBCFRAJ/YMF3hJAcqwOFerFQVRVOov37tuMw
 q/0mki3EJJ2rLZN3W4ygnlnvylCUcdDqKTNAArEYy0xY5VQW9apu0/qLkcQhH01IqmZxNzwLDXsF2
 3+9KPhbXeUBVv8Ybt9No0zGNVWkxaMKBVN1OjIDXEyb5/+tkhhoa/JEc9iu16uySqCH5uRx9hYzTo
 o9wE7oCmB32HzsvmY1pAl2AbjacJDNAF3w5/Y4c/xZP+jqchvl/RY/S5ZNmBuU8gHCLqE378sfKo0
 BDZAnPr5tDnGC62gn3mZzx5x2OOfgtbGxnKEcOJxeJzzdwgVocjGUyLeKgaGGzVYbLxidQsfS6t05
 1gfLduuNAwiA67+kNXqPkxQ4iZnDfhL2mIPjY4DV1ywnbx01P8Dv7EaH5O6tf0khzQqS/PWGj531J
 AcK9GjgO/EWqR48KuDAYUdB/fh+qvcd2AQtrjvPbAmSSbVfz4cYOS11h838s0QDHP1GzBd8ubwkDT
 F5845J5Lch3Tr/T+vtWUrybF046O1KnRcrvhLCmOE=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYZ-00037t-0y; Fri, 24 Jun 2022 14:41:10 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:32 +0100
Message-Id: <20220624134109.881989-18-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 17/54] lasips2: rename ps2dev_update_irq() to
 lasips2_port_set_irq()
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
X-TUID: jyeWJEZPlxgN

This better reflects that the IRQ input opaque is a LASIPS2Port structure
and not a PS2_DEVICE.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/lasips2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 2ac3433014..adfde1684f 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -253,7 +253,7 @@ static const MemoryRegionOps lasips2_reg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void ps2dev_update_irq(void *opaque, int level)
+static void lasips2_port_set_irq(void *opaque, int level)
 {
     LASIPS2Port *port = opaque;
 
@@ -275,8 +275,8 @@ void lasips2_init(MemoryRegion *address_space,
 
     vmstate_register(NULL, base, &vmstate_lasips2, s);
 
-    s->kbd.dev = ps2_kbd_init(ps2dev_update_irq, &s->kbd);
-    s->mouse.dev = ps2_mouse_init(ps2dev_update_irq, &s->mouse);
+    s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
+    s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
 
     memory_region_init_io(&s->kbd.reg, NULL, &lasips2_reg_ops, &s->kbd,
                           "lasips2-kbd", 0x100);
-- 
2.30.2

