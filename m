Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2886630ejm;
        Mon, 24 Apr 2023 08:19:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350azINtu7OBHjdOLQzyQr6gcGOJHtedMJLr2fOuVyKeYb6OsqyuXoe5rSB/mYutSsNQoL1hF
X-Received: by 2002:a05:622a:170b:b0:3ef:484e:7973 with SMTP id h11-20020a05622a170b00b003ef484e7973mr20787589qtk.14.1682349583528;
        Mon, 24 Apr 2023 08:19:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682349583; cv=none;
        d=google.com; s=arc-20160816;
        b=INWhnFTZHM5u3yLFIRiGWzIovVvlf3veq9QlqAN5Myz/XSoWmD732zNxkh7yhJ6E03
         pc3yNQ3SN1kLVOdS7KPY1GdjTqTNC6H1gdpY8epELWSvvh02OHaxMLn+9liHOQs5/mY1
         ++DrmRt2/ax77+kzg0D8WzUIBMhqRwVl+cPyQdCtPYvXjkg5B2merZny0YIwVb5UHc7A
         lt7DMDfE95fWdFeR3rjErF7SWeV1M00q51D4w4c1ZivnuPBjzdkZPirCnvvlXHBp88kF
         CQGuoq49ZZqEYDHWm0tq1pPPHSGQsmxrC7kiph+StDCEL+bOsBGdc0qHYUhnNb+o6gBy
         0QwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=0ew3Q4Te16gnuQZBIdWPX9nVhsTHp7a/L7LDD7lrC64=;
        b=YayBz2tBXm6AZBQDV/1BHzU3zAXNNWTk1XsctgPUFXB3ONmohoGkT/a1Mge0HFtJ3k
         6kwvqQVkczRvlk9Xw83tjGqAfLZUwzt0Gmqvkh2nZav5iEGei0Q5KQCrrK4L1pFeF4sR
         vRQcAbf+jzf6UQo3i/xGquzHd3reU77iK8VWti09kG6+enwTobiKIwP/7PKuag3hDzHp
         JXm1C/TcpA3ifTIqFXbCqwzqME0DJCUMc2r6JKmeNg+ac8S3y4jz8eX/Meu9how8NtS2
         //+h7KdfFhx/fBRGGgO64/brYTh75pKIoPKFcAtGpV375iM3sqcdNEV66lg59u6Usv8X
         VrOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XGBdXVAu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10-20020a05622a03ca00b003e4e85b1badsi7456360qtx.539.2023.04.24.08.19.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Apr 2023 08:19:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XGBdXVAu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqxyQ-00035R-21; Mon, 24 Apr 2023 11:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqxyP-00035B-EQ
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 11:19:25 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqxyN-000555-Ry
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 11:19:25 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f1763ee8f8so30862435e9.1
 for <qemu-arm@nongnu.org>; Mon, 24 Apr 2023 08:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682349562; x=1684941562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0ew3Q4Te16gnuQZBIdWPX9nVhsTHp7a/L7LDD7lrC64=;
 b=XGBdXVAulx1pnsRt5YwIemP4xWGq8Vom4cLsvUMiC4YbLYQlokP8XjWsbeLwpxntru
 P4DSkkUZJo6aMPtAM9J8mWk4uM1KvOqtkduiU+xuthhFyxm5yv51vNWVE0t/yF78NJUe
 NUVpZ9ZvYaMf2r5D6ux1uBiDTSiR0hLbnozOOQBkXOort8zG2gRRpoYtoGCILKdxBLfb
 XPAlnpPyPgiH1EBGB4dijaFimDYBz/0+AJHZTh0kmT8310aGjyzjv8HRMg17j3C7YlUZ
 ho5qD3oFYKknYlW9pFGFGpx9XP4HKERuKAiAVtVBuQO5k3I+1qExR8gS4EHYQclrNme9
 5FFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682349562; x=1684941562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0ew3Q4Te16gnuQZBIdWPX9nVhsTHp7a/L7LDD7lrC64=;
 b=O7EUZwJ/TQ0iHnl0vSP3tj79hYSttMYe3EYUxTC0Os1bzzK/kuAlLt88jlAQPzVNqu
 S5lAgJUg4RkdkyN3FUgwlTu5it+bHtro6fK1LyDEVAeJYVgSAbXSeWPvYG6hth8QZCDw
 OLESwi/9SyFOnXTOfeo9M/repeNJ+2gj+4CpoQzQYYKUHEemIihu7Ff/ZnAYeRE9s6oU
 102DE2YCZF2dG02nvb1Is1xMqjP9tpzyNOFg+iitoLIQBMJ/amymTUXfM1HZlpuI1tWw
 0CZ0HlyMaemvoRG1NDhOIdOWVu7+fJ46NeRb5gbCK6Mw3yRgHA9tmORnbx3HNl5nT+5u
 eROA==
X-Gm-Message-State: AAQBX9fz8yiks+Ah79NkGvotbJUWeDpEfaIMtKo3FGRuAC57eZlDW2/W
 hYtUSiI9Y8BrQ2F4l17+0LyWca7QqIw723lxilI=
X-Received: by 2002:a05:600c:b49:b0:3f1:72db:4554 with SMTP id
 k9-20020a05600c0b4900b003f172db4554mr7908798wmr.1.1682349562055; 
 Mon, 24 Apr 2023 08:19:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a05600c0ad000b003f198dfbbfcsm6740939wmr.19.2023.04.24.08.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 08:19:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Subject: [PATCH] hw/net/msf2-emac: Don't modify descriptor in-place in
 emac_store_desc()
Date: Mon, 24 Apr 2023 16:19:19 +0100
Message-Id: <20230424151919.1333299-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iUvpqS8oXMzb

The msf2-emac ethernet controller has functions emac_load_desc() and
emac_store_desc() which read and write the in-memory descriptor
blocks and handle conversion between guest and host endianness.

As currently written, emac_store_desc() does the endianness
conversion in-place; this means that it effectively consumes the
input EmacDesc struct, because on a big-endian host the fields will
be overwritten with the little-endian versions of their values.
Unfortunately, in all the callsites the code continues to access
fields in the EmacDesc struct after it has called emac_store_desc()
-- specifically, it looks at the d.next field.

The effect of this is that on a big-endian host networking doesn't
work because the address of the next descriptor is corrupted.

We could fix this by making the callsite avoid using the struct; but
it's more robust to have emac_store_desc() leave its input alone.

(emac_load_desc() also does an in-place conversion, but here this is
fine, because the function is supposed to be initializing the
struct.)

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is one of a number of issues that prevent 'make check-avocado'
working for arm targets on a big-endian host...

 hw/net/msf2-emac.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
index 7ccd3e51427..34c1f768db0 100644
--- a/hw/net/msf2-emac.c
+++ b/hw/net/msf2-emac.c
@@ -120,12 +120,16 @@ static void emac_load_desc(MSF2EmacState *s, EmacDesc *d, hwaddr desc)
 
 static void emac_store_desc(MSF2EmacState *s, EmacDesc *d, hwaddr desc)
 {
-    /* Convert from host endianness into LE. */
-    d->pktaddr = cpu_to_le32(d->pktaddr);
-    d->pktsize = cpu_to_le32(d->pktsize);
-    d->next = cpu_to_le32(d->next);
+    EmacDesc outd;
+    /*
+     * Convert from host endianness into LE. We use a local struct because
+     * calling code may still want to look at the fields afterwards.
+     */
+    outd.pktaddr = cpu_to_le32(d->pktaddr);
+    outd.pktsize = cpu_to_le32(d->pktsize);
+    outd.next = cpu_to_le32(d->next);
 
-    address_space_write(&s->dma_as, desc, MEMTXATTRS_UNSPECIFIED, d, sizeof *d);
+    address_space_write(&s->dma_as, desc, MEMTXATTRS_UNSPECIFIED, &outd, sizeof outd);
 }
 
 static void msf2_dma_tx(MSF2EmacState *s)
-- 
2.34.1

