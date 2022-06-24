Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp338567lft;
        Fri, 24 Jun 2022 06:52:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uKAejQcbd5r65DSUT86xFvTiMyOK9r0GrumgSK9KimpAe0B05vghJgx+Q3zoXZMxn0Iw9n
X-Received: by 2002:a0c:d988:0:b0:470:a35b:5195 with SMTP id y8-20020a0cd988000000b00470a35b5195mr951066qvj.75.1656078752101;
        Fri, 24 Jun 2022 06:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656078752; cv=none;
        d=google.com; s=arc-20160816;
        b=nqiX08hpa/ihiBP+bfIpVQgwafApZvqNDKvGisOF7Dv1RY2+Zq18C0y6RbwOFDClt0
         eLL/jZ8nII8cXuwu+Z1mrmMDlNerWRJI7NQwzdTC/SmECSqRPq7ILvOFXnZUWqJA8pRi
         Sga2xbGtGTGC9Das3A37bbFyUFqhZt4gP5l8a6db0O8zt2YH32bSLq9gGhxB9t7l+sPU
         uv8c/xoPrgORnEkf3aXyqe2ejsP02FFuIp7MBl+ymAM4Dap9hWr96Z+oSGroepuFYIHB
         KUq7+mdEK41p+CTOpsPauPQB6uLE8C4FJ/yo2WOapavZhKp/UUK0BO3yuMIZ/IKdp6WU
         eipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=eOPw1kWpdkn/vwpylukOqUCehgCzJr4tYfEfjjP1ZSw=;
        b=ZkybNDuQ6lJgw93ls5NAPrvFv55DYjb1CVj14Zdk3o78PUzM1wlyKnDTdRw5ArWEwS
         Rmr41WC/o6JdAW8npOvb3aIie4IqUtyqrFBGSZC+JCjm4bq6DaWNecVxwwBzR3hog/UE
         9rr8caORx/GNP6N1Zs97z6qOkXGY+e0AXoHTyB/pjVwQ+xAp3ZQ2/4B2fVlM1DOv2gFt
         DEDYB7G98Jy8/USbGwmK/C1sFU5c8COZ3LTA1DXIKYKbN52FQ62R9HIIELI6/BFBatKv
         awc+t5nPVMtfB57SlMeezCU2snU91tXoapzXCSfiKpbNz+C+FTjBzKCaKDQmlQkXdGsu
         oSpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=Ai37ZG6Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ib13-20020a0562141c8d00b0047093d0af66si1694823qvb.546.2022.06.24.06.52.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 06:52:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=Ai37ZG6Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:38152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4jjb-0007VG-I9
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 09:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZY-0008P4-Gu; Fri, 24 Jun 2022 09:42:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZW-00058B-UD; Fri, 24 Jun 2022 09:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eOPw1kWpdkn/vwpylukOqUCehgCzJr4tYfEfjjP1ZSw=; b=Ai37ZG6YqXd2nrSM9+Rmfizzvw
 C/AT1+vVM6R6cbdzybakHR2ykAwvdmenBPHAd+QtzWiRaRZctUTAS8Xg6nPPWTmyqDIdrYHwm0bPU
 pyvsOxjPbhI8FEA8KwJa5+sxIk8BnhluCbF7zWjjoqLMTTUMCoQlKlbyw5tkZUbzkXqlD/0Cr/TqJ
 JReCi5al4C1GpGVWUox6erJmbgCSKogUcRGwvmqz0skhDRa2OmR7KXngD3YM1skqsQU2bIFZQ50If
 i1umxLoTTmYK6fNDuvqVKgGjU3odb2+2RFI0ZxHZZZ7yvz4s/VbzlwX4eHy+SV8FJDnKDEpM/qtpz
 Wg0e1EOkNSX0Kw19djajU2Mi/CHTWHGPpVH9IZDz19kuEqLmeVnKQAUFTtml+ON4kGevuMbC8BZq/
 tY8Rv9DvYeY370+ubPfsGdZRBPd3TJhIUmxDlFTYi1uTLdCEJyV60jrH9Z72WaNHO3RtBEwxq5Byy
 Qf1gX94w4A+YdtNj1yC3zrgCl72vsYCxanwrMGRR9sxkPYsu/rQ+u+sSbhX0hQu7hpcEXm7lhw389
 mCY7IHOHQ90wpifvZJ1dNwOtSo2kO4XfY396uj021lsUeb8yke4kUA5xtqFYkJu4Ka4Ky70NGgXvH
 PL16Au5xtcNT+abautY/32xfYxa0Zo/JjtOY3psoU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYE-00037t-7i; Fri, 24 Jun 2022 14:40:50 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:27 +0100
Message-Id: <20220624134109.881989-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 12/54] ps2: don't use vmstate_register() in ps2_kbd_init()
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
X-TUID: nFmH5ghWh1Mp

Since PS2_KBD_DEVICE is a qdev device then vmstate_ps2_keyboard can be registered
using the DeviceClass vmsd field instead. There is no need to use
qdev_set_legacy_instance_id() to ensure migration compatibility since the first 2
parameters to vmstate_register() are NULL and 0 respectively.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index eae7df2096..97e9172ba5 100644
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
2.30.2

