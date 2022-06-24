Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp336262lft;
        Fri, 24 Jun 2022 06:48:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vu1EzbLMTTMhTiYofry1ABAxr17J+yfyD2PDALCVCtcuHbATWFi6qcdBj372D41KBwn6Yx
X-Received: by 2002:a05:6214:621:b0:432:5e0d:cb64 with SMTP id a1-20020a056214062100b004325e0dcb64mr36467840qvx.65.1656078485351;
        Fri, 24 Jun 2022 06:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656078485; cv=none;
        d=google.com; s=arc-20160816;
        b=RpwgPSPkM7P33emysPHQhJDA8d5LL6PWgVvQ8mcMmxjPCSYdBUBLVq9nlt22NFi03v
         QxQIk3fzbfbq4IfQKNOhtwIyr6l8CCAX5CJ3cxyRsaSFt13ydnZt49GUAqcMPhd8z/ly
         suV3ZiGP+CB4e1ZAWIIOqV128op12KE+UmyeYllfuDEQLX92RtSYqAKw5NfbnVx3ZyTt
         CZTc8wDnDUqJdNSiDqqh+S1XLA4FiWZ98mvlEPjNUztWUA3aDXAtBkA5lphMSohzH1TG
         uNRQkx4qyduuuhcIiLq4O0J6ezzpYxhkAXztshDZG27xmBnvCB3IeT5NzJRkbo9Ga8uS
         c0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=pxFtoDkgL+d8Vs2txv3QdzGtbj2AZwsZOXUK0XubwIc=;
        b=uA8GIg8nc7lkR9MoQGw0PtVvROZlMFj13vEaD5UrXpxOmcS5kegF0wsacUyHYk/m0N
         RTkLOhGL/lHm+vVo7jLo2ZH1Fe0SGSxNyhiu1qbQ30PFyZfkbmYhDLn5wk6Y/Zx4RxVa
         6PdiQwhHkGmFb4bRrOAz/9ib7KCAb713/TXnWuAB+K506DCHr2wsGEEB9yi9TyfRF0k2
         yudt385MCHOLol24Y/W0JgZlVqEISASIbgXPCTPMP7jPSG5oZ4gBDBFK0NjbTXlGHxfI
         KECP7fTLTvClb2+jUK5tpHvw6WPIASVqS5Qxq+mVNClJjgDFRSp3iUeg8uAuLXfMllHn
         2PFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=s10v2e5P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gg15-20020a056214252f00b00470849b3c57si1475797qvb.511.2022.06.24.06.48.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 06:48:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=s10v2e5P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:52452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4jfI-0005t6-Pt
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 09:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZI-0007aR-Ca; Fri, 24 Jun 2022 09:41:52 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZG-00055q-Kh; Fri, 24 Jun 2022 09:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pxFtoDkgL+d8Vs2txv3QdzGtbj2AZwsZOXUK0XubwIc=; b=s10v2e5PGgEz9wduw6TalRhPEp
 4/MWXqgUlVLF9ElWwWwiP2xgXuKhIGvAEeGp2NUWihFr3eXg5+sZnEg/cBUl59vOOctDIGTmZqT7B
 MK/FCYOxAprYkSS2/ApTf1CSuLvnCC/m49gPzWimxHiNnD61bQIyKPnhIm4fjTlGxZFntARTs1fLA
 Y5A3VvphhiDk2OSnQqP+bS2CuTHygN3ZfInKY2T87TAsChbq30L2jmkGIe74qc22AdKm7tYFqe10p
 XF3g+3hnX+KgcCscIzmxAeKlpVdVFQYyM/D2SMMtkSmyjDomVWLro8LI/gA3u5bTW6q8xO24XENAF
 FnY6elktTu5iNHjgY2DtQ8OH45iaIG/qP4ppEyZSgz+N3RBBnMSv5ELlUYAzDEgMAjNg4P5bqDYEs
 NeZ66PVJuxU2+r1cVzRo5wAsc9WNQzPM88oRqYo9ZuUPjYednX1SZjD3U1istR9mfqX7D6RDkEYzJ
 Sd5EqK8k/cvQnNQUTkoOHUY4Jc82+rrimI40kyBB1i272zTcKArG0DrHyRcPX0Mj5DN4hnbbC/H10
 ASl3/m6mGKAGsEa0qM2dbNrMs9voNZNmvX1XrsW4wWawdV+y+pRrxIOyGtUoWITXzv5VTAlfWDaqF
 VE4L0fLNAEwB3PAinUTI8NABgeseoiMu8Fl9ZOpSM=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jXx-00037t-AM; Fri, 24 Jun 2022 14:40:33 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:22 +0100
Message-Id: <20220624134109.881989-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 07/54] ps2: introduce PS2DeviceClass
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
X-TUID: mRD8v6bBIMTG

This is in preparation for allowing the new PS2_KBD_DEVICE and PS2_MOUSE_DEVICE
QOM types to reference the parent PS2_DEVICE device reset() function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/ps2.c         | 1 +
 include/hw/input/ps2.h | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 3a770f3b78..fd5236690a 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1283,6 +1283,7 @@ static const TypeInfo ps2_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PS2State),
     .class_init    = ps2_class_init,
+    .class_size    = sizeof(PS2DeviceClass),
     .abstract      = true
 };
 
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index 1a3321d77e..aef892b5e6 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -33,6 +33,10 @@
 #define PS2_MOUSE_BUTTON_SIDE   0x08
 #define PS2_MOUSE_BUTTON_EXTRA  0x10
 
+struct PS2DeviceClass {
+    SysBusDeviceClass parent_class;
+};
+
 /*
  * PS/2 buffer size. Keep 256 bytes for compatibility with
  * older QEMU versions.
@@ -54,7 +58,7 @@ struct PS2State {
 };
 
 #define TYPE_PS2_DEVICE "ps2-device"
-OBJECT_DECLARE_SIMPLE_TYPE(PS2State, PS2_DEVICE)
+OBJECT_DECLARE_TYPE(PS2State, PS2DeviceClass, PS2_DEVICE)
 
 struct PS2KbdState {
     PS2State parent_obj;
-- 
2.30.2

