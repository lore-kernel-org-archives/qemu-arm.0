Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1713812lfp;
        Tue, 12 Jul 2022 15:28:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uHgCjplvCD+KrCHK3OpouH8Loi04bctsdQ7xdRc1bx6rZF7hoHVozdKwJKMn7HlQz1wbjD
X-Received: by 2002:ac8:5956:0:b0:31d:28dc:17c with SMTP id 22-20020ac85956000000b0031d28dc017cmr212488qtz.295.1657664917320;
        Tue, 12 Jul 2022 15:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657664917; cv=none;
        d=google.com; s=arc-20160816;
        b=QxobEfnwNrCNUt7OPUvNL8Mjrj6ZwwNX735ADB9HmWWXqpcVSsAgbPL+PdUSpVlNVA
         wqBHtmdnYvf4uyWew8BNRnD7yNS/YhroJASbY+sGJTQQWZwCmlEe8VZnbOQz9JsyAcLG
         V9jMAZPcwlEoFN9X9XfsIdUmXHdEmumJkiwx1EDCnOXGLR30Oh9htgbCBxHjw8bnVjHv
         citgTYxMmldJ9V6QqTmhK0Hda6i7GiDnQEiVTPEn6Y/Y6c93meDugpN33WnngJPhJA0B
         BU7T0kkVXFXCKxKhMu3m0JWyDbHJBFBmuqC3PNdZnuxy5fnvC35d2PC9uzviHLMqvxD/
         iiKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=kxbXVuEH93jq29Jn3c7L0UjUkuMdQL6+BFBnI8UISUk=;
        b=RntRwcrhfc0mjRolHJKnCgCNA98fRKHgm5tdown+lSchRenDgcelLB7z9hn028WUos
         VMwejr/xxkH2ddRcjpfinsDrjTRST95+KC+pyfP3a+BuA1IraTpxsP7jAr6nYZnaVNJa
         hI3+dViLxCP1/8Dh3AKBoIOpPOLu6x/YHjE1EIuJ3ujfq6y0iM3Kibdy31u7AcPl7fu0
         ZbHSvcdvdjDlkwOOnwoLIrrysWGLvUs0GONED8eVgcy2V2ydyeOj5ZLfThfiHQ/J0OKt
         mIHUNMNCjIl+IFZkK+QoEukQpW7HOq/eAYtUA5Fm98zsN3AIumXAxdoZOj0MfmeBhg9t
         BlBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=EnsqsHXl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020a37f614000000b006a64f4d63a9si5861409qkj.555.2022.07.12.15.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 15:28:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=EnsqsHXl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:56118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBOMu-0001DM-Qn
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 18:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqn-0004m7-BB; Tue, 12 Jul 2022 17:55:28 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNql-0007zW-QG; Tue, 12 Jul 2022 17:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kxbXVuEH93jq29Jn3c7L0UjUkuMdQL6+BFBnI8UISUk=; b=EnsqsHXly40YLV+42Ic4s0pk//
 2BkbikfMoOOQ0UYhxY5aeMtrmavKKM+BSGqf/AYcu7AAii0uUgb/1CpTsMD7mWJUtOGZ0BdDcC3I6
 L5V2xHDPN7VRD4AK84nZIcU9/dtWzDiiJL+3fDtLmDmAUa89uQIeveSac2Fpscv+TNrJoCFpWPtQ5
 gniQpqEL3vr/mNuy/tu1LAQsGGrclyo+nTBNX5KxzUxjNTBbeWyaYPIi+vS/aFL4/I9v+PZ+Vh31J
 YeWFPAUKm8iAmlM/ylZBDGya+ZU6/hdOzODFquUA1iOpRj5K75SuZ2c8GN2S1XnMy2XuZrhPrKJwc
 ArCSI1z7TssS3N2Md0VFLp71yqEmrAI9tiR4V50LaolngK+JlW7/Ecq908xFCkLtqPvNxcFR42ebq
 8+rpTNAmRvNwisXO7dlCUp8/2e4NPcqCJgVhylFIE0jXnnVH/A3zUS6ojpT9fhkTP9TWCJ3iO0NS2
 3uYt4BM8kE2JIbh54+S+OYRA878umjs1RgTznVTntfHIk9qwxM3JOr6p50aNditaLaDP4VmsSlEn9
 yaAw00QxLeJJDcM8Y0YvHe1ftBwaHqfcthWt/sDAkpKApx+WyM3ZzgaIO4P6qq11YeUu3uxojN2si
 rFpJB/10skE4ynE7TLvixjDfErSRmnn6VazYkzP7c=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNp1-000Bqt-VG; Tue, 12 Jul 2022 22:53:40 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:44 +0100
Message-Id: <20220712215251.7944-34-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 33/40] lasips2: don't use legacy ps2_mouse_init() function
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
X-TUID: z5IbYqp4p83I

Instantiate the PS2 mouse device within LASIPS2MousePort using
object_initialize_child() in lasips2_mouse_port_init() and realize it in
lasips2_mouse_port_realize() accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c         | 10 +++++++++-
 include/hw/input/lasips2.h |  2 ++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 4b3264a02d..e602e3c986 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -398,10 +398,15 @@ static const TypeInfo lasips2_kbd_port_info = {
 
 static void lasips2_mouse_port_realize(DeviceState *dev, Error **errp)
 {
+    LASIPS2MousePort *s = LASIPS2_MOUSE_PORT(dev);
     LASIPS2Port *lp = LASIPS2_PORT(dev);
     LASIPS2PortDeviceClass *lpdc = LASIPS2_PORT_GET_CLASS(lp);
 
-    lp->ps2dev = ps2_mouse_init();
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->mouse), errp)) {
+        return;
+    }
+
+    lp->ps2dev = PS2_DEVICE(&s->mouse);
     lpdc->parent_realize(dev, errp);
 }
 
@@ -412,6 +417,9 @@ static void lasips2_mouse_port_init(Object *obj)
 
     memory_region_init_io(&lp->reg, obj, &lasips2_reg_ops, lp, "lasips2-mouse",
                           0x100);
+
+    object_initialize_child(obj, "mouse", &s->mouse, TYPE_PS2_MOUSE_DEVICE);
+
     lp->id = 1;
     lp->lasips2 = container_of(s, LASIPS2State, mouse_port);
 }
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 4a0ad999d7..01911c50f9 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -61,6 +61,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2MousePort, LASIPS2_MOUSE_PORT)
 
 struct LASIPS2MousePort {
     LASIPS2Port parent_obj;
+
+    PS2MouseState mouse;
 };
 
 struct LASIPS2State {
-- 
2.30.2

