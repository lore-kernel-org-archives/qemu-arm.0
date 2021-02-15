Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5504704lfc;
        Mon, 15 Feb 2021 02:38:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZykbFHjSRy8qLrH0QX4vhzbW1dhIVoacCDjrb2smoBokxVEDZzCUHW9nvLWfcDXuur59M
X-Received: by 2002:a25:3250:: with SMTP id y77mr14164155yby.154.1613385513367;
        Mon, 15 Feb 2021 02:38:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613385513; cv=none;
        d=google.com; s=arc-20160816;
        b=DnrtGpwL+pOv2UVzVThApR/dwjuyUuGcpPD1YU7WBD4aNtelO9PoeTKsfQeB6PkA/p
         BPOUDmhZCS5YA1nk8SaUkdM9VxHoQwnvsqvEOOVb+ev0L9zQeWFK6MiUk9aNrkGTlQyr
         Oo8YL6nXWg7DXe8x1ovoospyTe3iYgs06+OhpK9B2JkZv5BdzUf1XFXiPe8YuyXlVpXh
         XkGsGeqhb5rabnQtetTwGrenXBLuGj9R4xUsS5kArD6/OaGzTPy+8IajsO9GbqI+BjS7
         fqh1kElBSEAMKRBPext1RUbn1cd9Gr3FvwAAFLaChULxIB0Y9n7lnZkc/b4I1pH6s4Lr
         VGFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LvF8P5E15O40+Gw1s78SulbtIHDLH/Ds9X/sriTHyPY=;
        b=XpC+0z0LgNQM+aJ0wgPG5D390A2JIQsmpeNyyIkoCqRqDEkmNH2k/QNofUsnEezzal
         A2twgS3DejtJ2kO4Xr5Y7oPQvV24Hz2XDL4Vp/OvoD9XVR84QILg5Ohj7D6Ml/GwLw0h
         nXY5z+QLgNEbxR4UD/SndDOpYRMLG4wte1rV6k7IgDhAOsyIA2qQQJ7rzW6qZ1lXNuMN
         udeO1n84FNTFYpjg7UK4RZoxXrU++xtcqWcHiCZF2XL/YwAtmbDTaLczhgjqS6tVkzsJ
         Vb+g6cMg/L/i3JlQVboFkPqfj9S3t+ayE8kvwX4nhjo5dgyE8Tm0u7fZJKtpzI+0dUIL
         Bn5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OwZWmmH+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x206si11235450ybg.390.2021.02.15.02.38.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 02:38:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OwZWmmH+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBbGy-0003BJ-Ob
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 05:38:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbBB-0004VM-TP
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 05:32:36 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB3-0001jc-Iv
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 05:32:33 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v14so8228219wro.7
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 02:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LvF8P5E15O40+Gw1s78SulbtIHDLH/Ds9X/sriTHyPY=;
 b=OwZWmmH+67QuViAPfJoNecTjOjmDLkz2Pz7l3FwpD5dmEKYEl+NKDrHufot9y+vBpu
 95FruJvL+vrVVPA6CvnN8c4B4BgB+cGyhEA5DHCrLlSMYssxnRrENtFox96ljyLfxfvO
 rWXXB70AXb04VD9SqVUnf86bKQF28CkQHbQC97bee5XMa50LhRTY90F5aQ14DJycs8Nm
 ksAcrzxK1Ijls0fHOIVHDDzJggx3LUFwYOIma1IZKkF6ypY6cT8ITg+S2u54hC9o4eBA
 +UoNvIejGmMFsXcK+gK6eiri2Aw1KNl/u4V27oXXsV/mrVU+CdonvvBj1+pW+YjsTSuH
 u0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LvF8P5E15O40+Gw1s78SulbtIHDLH/Ds9X/sriTHyPY=;
 b=Jvna2TY1Cu1UoMdifWCeZO650HcpgP8q+qMeLIJSuMm8otOoBxMqZYNTQ6WsDGUUKs
 yYlr6F/x1G3euTuaUs9plt2tTUaMwE+cQxvd3UQ5o6DdrpVCfeAxn6z+l4v1TaN2uWv0
 GBjUb3erF/6x6oK9j4DiZZewTPAwmdjfttpXhWGvqwYuMlM4n0Ie/Q+7KZzzg7lI3tXK
 uA60+QtDo136CZFhtZmu55iwDz2gsOCMh/bdWxS0mg0/+BjsDEEx/bT5yAJJXGnyBhSO
 Xa3g0yvt4jPNkMqJweJsQ/VYigSjdj/0ndp/Bxv2+JpT6gjjsmBXNNjS7UNqvP6a8wAt
 HicA==
X-Gm-Message-State: AOAM533zluRw/fgCeDmEXLOfQYGQZnly58cA5F141Grv9pXrhPg+kwYD
 zOb1/vCrHWsBf7fOnRHWKxYvfuygMU/5aA==
X-Received: by 2002:adf:b611:: with SMTP id f17mr17787056wre.8.1613385144453; 
 Mon, 15 Feb 2021 02:32:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 36sm25196300wrj.97.2021.02.15.02.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 9/9] hw/display/omap_lcdc: Delete unnecessary macro
Date: Mon, 15 Feb 2021 10:32:15 +0000
Message-Id: <20210215103215.4944-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215103215.4944-1-peter.maydell@linaro.org>
References: <20210215103215.4944-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uvKW7sQX/eXr

The macro draw_line_func is used only once; just expand it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/omap_lcdc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/display/omap_lcdc.c b/hw/display/omap_lcdc.c
index 2db04fad2fc..0ba42ef637c 100644
--- a/hw/display/omap_lcdc.c
+++ b/hw/display/omap_lcdc.c
@@ -70,8 +70,6 @@ static void omap_lcd_interrupts(struct omap_lcd_panel_s *s)
     qemu_irq_lower(s->irq);
 }
 
-#define draw_line_func drawfn
-
 /*
  * 2-bit colour
  */
@@ -202,7 +200,7 @@ static void omap_update_display(void *opaque)
 {
     struct omap_lcd_panel_s *omap_lcd = (struct omap_lcd_panel_s *) opaque;
     DisplaySurface *surface;
-    draw_line_func draw_line;
+    drawfn draw_line;
     int size, height, first, last;
     int width, linesize, step, bpp, frame_offset;
     hwaddr frame_base;
-- 
2.20.1

