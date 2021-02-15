Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5502575lfc;
        Mon, 15 Feb 2021 02:34:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHXmoEwExUodrUea6G4qgg9zAANBmxu0WKOiL+RIn48FtACE3GpcD1qPObR4wEsN2BOnVy
X-Received: by 2002:a25:a08f:: with SMTP id y15mr21776216ybh.349.1613385296046;
        Mon, 15 Feb 2021 02:34:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613385296; cv=none;
        d=google.com; s=arc-20160816;
        b=zgtzMG9zzapT+k8quxTYHNSCaS/0SxBbZqgJ11/XaEByI4BhqBIE8wxtoTTUYVD32I
         nw8TVNpSTDlNScP+YbaP8Ny/6zikg4PLGoE/Vq6iYAXf4QUODKsYI8GxsgBX1m5YwpXf
         mbTNQRlKp913luoKcK+Kdmrq3MMyHYmA41WDqwoxMi4Y6QBOigVMB/U++zQq2UdfJf96
         QvghZC9DBrQFJCsk/2azSK75j2Rheka3KUGDu6bIoqtVhQ0RsDIeojG9I40vRp3cZs54
         YdUasox/NFXcSRX7/hUJrqKtW7Ma5SsftE6/fnmbscHAearZM41dVWLHmd6CJRhof7aO
         Q+YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=a/+Lp00ImdUdFCYzgiMMi+eXXtTKdO25fqdcbshDHFk=;
        b=rV0qlkbaoxJOCOn366kjDZH2rqP+uvYiodTx6Tp1l2slM4Wb5qQIVn3B5kjQ7Sp6BN
         AtI/UBm5VdPvTjXIHmYFGihYhCRT85a1m8wgBvz041q8/70j/SjrxZhNVcjIx7NEjIQW
         YLLoNCS0K3wbfJY3OmrWFE6AYlodG/JzVuK3Fuj614kBlQ7GXHHlJ5inuoDjP1cRj+bo
         m+vMdaBmUYc3pzJxp4Yy25bpAZPFk3QkDOeqamjTkK3760Li/xyQbfS9tqbFhgn0PIA/
         SI7SYFa2i2t5je+0i4XmVLDDqnv4hu2yvS1KoItR/tYqSvbT6SDPKp2XsHGpnwJjtF0w
         cMDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wzf5lP4M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14si13285988ybt.184.2021.02.15.02.34.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 02:34:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wzf5lP4M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBbDT-0006j5-Ca
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 05:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB8-0004P4-7H
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 05:32:30 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB1-0001iS-Ly
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 05:32:29 -0500
Received: by mail-wr1-x434.google.com with SMTP id n6so8223167wrv.8
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 02:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a/+Lp00ImdUdFCYzgiMMi+eXXtTKdO25fqdcbshDHFk=;
 b=wzf5lP4M2v8m9ufOOVGz9/4OfRXiTCbT/YdMpZzPmTEHLBbSeSPxU03oJVjPe9Icsf
 Q+fM+Ryg4bHNT4uFq36lNp8gBxljAyAIb1gAeT7Ty8QKCxJHrLq1RgiD4MQYJp32h9zt
 bG0cBz79TUDL2xyAawmsOjtjI0a1MRB3o1D7Oaw8lrOkMMOb5GMJ1Ibp8J2w4VCb9uNd
 XE7EIp74tstX+p+P1hlY0iqbh6WR5MwOMQlPZZWQFpC6u3DitZGeB/ZucKiJuaP85AaI
 ZiUsYhY+i/BsysJ04t6br3VLxMC2dsbbqwPN2d9wZaHVs0ZtVV8mOEptTZiOw6uPk1mI
 feHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a/+Lp00ImdUdFCYzgiMMi+eXXtTKdO25fqdcbshDHFk=;
 b=FNryc2Y+nWGd4IXeGo4C2ByFf6UEB9eZfubek47FUM0iy32tsU24dILzMfQ6h7p1FE
 r6T0Ugb2CGPMoctFTGuXvTvzSPErG85zOCy48LRR6l+X5/F90/i5EUIKKewby1kdlPXS
 HeDrcQWL5BCPOPRW9UBsaymJ+icB2wcESqvfKIzcqGqhSXH6XVW/M//kczjdYLdOmnhF
 opuNeatfSruLobBEp8XjNPHe1Nxw0RSIkXHD96mPcPdvMPd18KLs3yDl9pT0B9IOcdOl
 KTNGs8k1VDp+dso/T5oPYWNUDk/2OLNi+f57rMhnx0TnxRyNa+SCZV+NR58tizP0kIvI
 nJ7A==
X-Gm-Message-State: AOAM532gYLxGdCWgbsvj6iv7aw6PRbBtT5T3f9IlLzrjqf4j66EPygah
 QSOsuky3tr2PoZfxBTAO57JbAovc8bpgCA==
X-Received: by 2002:a05:6000:152:: with SMTP id
 r18mr17790825wrx.226.1613385142286; 
 Mon, 15 Feb 2021 02:32:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 36sm25196300wrj.97.2021.02.15.02.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/9] hw/display/omap_lcdc: Drop broken bigendian ifdef
Date: Mon, 15 Feb 2021 10:32:12 +0000
Message-Id: <20210215103215.4944-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215103215.4944-1-peter.maydell@linaro.org>
References: <20210215103215.4944-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: pr2aHKr+fyEO

The draw_line16_32() function in the omap_lcdc template header
includes an ifdef for the case where HOST_WORDS_BIGENDIAN matches
TARGET_WORDS_BIGENDIAN.  This is trying to optimise for "source
bitmap and destination bitmap format match", but it is broken,
because in this function the formats don't match: the source is
16-bit colour and the destination is 32-bit colour, so a memcpy()
will produce corrupted graphics output.  Drop the bogus ifdef.

This bug was introduced in commit ea644cf343129, when we dropped
support for DEPTH values other than 32 from the template header.
The old #if line was
  #if DEPTH == 16 && defined(HOST_WORDS_BIGENDIAN) == defined(TARGET_WORDS_BIGENDIAN)
and this was mistakenly changed to
  #if defined(HOST_WORDS_BIGENDIAN) == defined(TARGET_WORDS_BIGENDIAN)
rather than deleting the #if as now having an always-false condition.

Fixes: ea644cf343129
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/omap_lcd_template.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/display/omap_lcd_template.h b/hw/display/omap_lcd_template.h
index c7c5025fb04..22e51d9bffb 100644
--- a/hw/display/omap_lcd_template.h
+++ b/hw/display/omap_lcd_template.h
@@ -139,9 +139,6 @@ static void draw_line12_32(void *opaque, uint8_t *d, const uint8_t *s,
 static void draw_line16_32(void *opaque, uint8_t *d, const uint8_t *s,
                            int width, int deststep)
 {
-#if defined(HOST_WORDS_BIGENDIAN) == defined(TARGET_WORDS_BIGENDIAN)
-    memcpy(d, s, width * 2);
-#else
     uint16_t v;
     uint8_t r, g, b;
 
@@ -154,5 +151,4 @@ static void draw_line16_32(void *opaque, uint8_t *d, const uint8_t *s,
         s += 2;
         d += 4;
     } while (-- width != 0);
-#endif
 }
-- 
2.20.1

