Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp354209lft;
        Fri, 24 Jun 2022 07:14:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tWyY2XQfuuIyXl3CIGV3MS8KQHNcqHF3UZ+nCBM9hA1kkEn/TlDMfkpS9NtytlCcTlGT05
X-Received: by 2002:a37:614:0:b0:6ae:ef37:8ea1 with SMTP id 20-20020a370614000000b006aeef378ea1mr6836876qkg.618.1656080073619;
        Fri, 24 Jun 2022 07:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656080073; cv=none;
        d=google.com; s=arc-20160816;
        b=X/OwMagtipkt7J8mQZwV+DtGqKEvfWGnx4TawWQISvbu9s5W3G1C5PHryLXZItnh3c
         AP2pZ4PQueKr0IMXaxyv4o0P8KC/EWpZfbJ1jOFLmnKeP3Z7pMTV553OJBvR7kASA/WQ
         s0ZwJ0kXavFd/DFurX7i3A7s7GxStTPX5r2qlLEuHEtOo/pH7ZC3PmEcgo+KAlnRFzcH
         Dms343yDDRYAr4NCFGCAcRtTsXvDDqFm378vUK3GH/OHaEYKbZaUB2BcbSv+UxxLBXm/
         MWBRgKubkhTl3hrgwMwRicPDwE1lfHQ5JqfVB6HTTl5vye7cxwmo4sJZl/nc2H142wGJ
         u+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=TGianUMkJuqH8Nj3HFHjcvnyfGx/mgAtFsGV2iwvZIs=;
        b=IN4+HIZNaTryBzvWdlgc9hd8Y6/5Vohvvl6ewAjpnRo9vr8AntTH6O1gBsY85PT+4R
         dUWHw6X1qTArv0dd4QIzdphGkLHFiA5d405iVpzQ8hCTf88SMa4UJ9iuIKNfwaweSQd8
         SR2TDoKo7GgkP9jbg/QLbrtU1wZOpOerXjuEJUWqsLGjtcef+N8NsR/uYisQEsMvlGQW
         KAaufDl0HauayEEnm2Xp0RJKBjQHeMBFcQBGfhQBphd6oOzWWk64NLYfrXs6ZGi3gIFg
         JuTPooQZ/prXJkAqJru4qRBvoXe8GleapWc2rDikr10vUrPSonDbB8lldQy5z1tOpVnj
         lZ9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=Z7bijtPW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020a056214224e00b004467a86a642si1559587qvc.90.2022.06.24.07.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 07:14:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=Z7bijtPW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:40076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4k4v-00064H-1N
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 10:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbc-0003qi-Ht; Fri, 24 Jun 2022 09:44:16 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbZ-0005Od-0V; Fri, 24 Jun 2022 09:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TGianUMkJuqH8Nj3HFHjcvnyfGx/mgAtFsGV2iwvZIs=; b=Z7bijtPWtQR+Ktp9pFQwIGbpEk
 gvod5z0UP/Qkab84N/pVclLCAF4lDGJ+2T2samBg62WH/no273skn2JD/tlggV65iU2BXtAS0t9QA
 5pPcgLtMYpiXv9BiL4jWkpqgl3XjOPP6Ne9VrbtrAe+9kLN7E90sBsR2E7RgHrQESMkLcZydfEsTW
 e1yy3bErVEKKDxZIDlTJPlwfsUkktHunZmsdGkuJvSs+Sy9WBFBe1tTiLwvQNiRFfSImT3f6c6hgS
 yAzKnD0aO8S3Rtv7QIDG2pUPza+56wY/nZDAgL9yKBo6QJ55wfo68HWKiDswx/dqFiuhXUymJbDqi
 /FbXxWvfoX1WYzcJRoWGYIBVupP0hbTkQcUlErd4BsMjxBVt1ZHMuDgqqSQpLdpvwT/G04bpizNO0
 48+k+9ppvN8YYoyXR2Ye2SgMtScGWkSKfh6INlr/Lr5ueytilDTr2KMyHAbYO4tR92G8mE/ArldhJ
 kAZ6AIKqwfWwDjIqjBsYVQHmee/KU5xeyM98SrAMf2W09UMcIaJpPDUwM1uiW/aA7l79VE7hVRu7K
 MzvyxH+xhRSjkq8VtMW5c5C1WhmIrTIUZs8WfPBmBfbELX+5X81ftCWt/8zUZu0D33yPZD8T7D8Nw
 8jr1r2NVPXLjrz66vi9WSNCA2ENBiNPL6TW11pZaM=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZu-00037t-Ui; Fri, 24 Jun 2022 14:42:34 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:56 +0100
Message-Id: <20220624134109.881989-42-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 41/54] lasips2: implement lasips2_init() function
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
X-TUID: o5gyReVpj9kp

Move the initialisation of the keyboard and mouse memory regions to lasips2_init()
and expose them as SysBus memory regions.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 85da4081e3..8d3a2d88e8 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -265,20 +265,30 @@ LASIPS2State *lasips2_initfn(MemoryRegion *address_space,
     s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
     s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
 
-    memory_region_init_io(&s->kbd.reg, NULL, &lasips2_reg_ops, &s->kbd,
-                          "lasips2-kbd", 0x100);
     memory_region_add_subregion(address_space, base, &s->kbd.reg);
 
-    memory_region_init_io(&s->mouse.reg, NULL, &lasips2_reg_ops, &s->mouse,
-                          "lasips2-mouse", 0x100);
     memory_region_add_subregion(address_space, base + 0x100, &s->mouse.reg);
 
     return s;
 }
 
+static void lasips2_init(Object *obj)
+{
+    LASIPS2State *s = LASIPS2(obj);
+
+    memory_region_init_io(&s->kbd.reg, obj, &lasips2_reg_ops, &s->kbd,
+                          "lasips2-kbd", 0x100);
+    memory_region_init_io(&s->mouse.reg, obj, &lasips2_reg_ops, &s->mouse,
+                          "lasips2-mouse", 0x100);
+
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->kbd.reg);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
+}
+
 static const TypeInfo lasips2_info = {
     .name          = TYPE_LASIPS2,
     .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = lasips2_init,
     .instance_size = sizeof(LASIPS2State)
 };
 
-- 
2.30.2

