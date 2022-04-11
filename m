Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1764586lfq;
        Mon, 11 Apr 2022 09:59:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznxDM6gIrd1T0EsQ9IHSkZxyDPUmp5dzgeg0iTFCgGGkPUfCLG9qzHqMpETwsnIdcuo+MW
X-Received: by 2002:a0d:ffc1:0:b0:2eb:5353:3199 with SMTP id p184-20020a0dffc1000000b002eb53533199mr25597854ywf.440.1649696348080;
        Mon, 11 Apr 2022 09:59:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649696348; cv=none;
        d=google.com; s=arc-20160816;
        b=KYOsdvOo6dLD/G5nYyVnDqmMuqv3cmQbKqkE//JM8eu8JyTpB2+H6nfHajcLO1yR5Q
         uvUgqI1l5GnN+FqspP/oFzcTDd1AtHzBmBJW+YtjihgqR6ZreB41udCllfnmGe4Jx6o6
         9DVv7O4p8UP8vxizi3/pdcQZRy26fmhUlel+F7FnHx3oIBR7Ra/kNPChY64GcJebGfeU
         ztWW9ROiApIDEceMACD6nRJYezximU23T8/4YA/E2EPoZ9n2nfzJcSJmLkv4XgTWnD3+
         unq7ov7jv9mI7RiUs54TV1Owz4KpiuKb6GSzjyf130h6WpAAtg4TLZD2GtZTMt+nuK7T
         ZDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=PBwivsX+CNRca4Tf4iFbEeHQqaqr2duXLo8VWx6ckBY=;
        b=Xc/N5DhoKqXUVK5EdpfC5IPYUYRHViPJbCMEQXoSNV7yUI9rq0f2qX3Rya6N/NpBnA
         h4DbTO/RxWtp1d3e9IL/H+WzhlIqHSuSFVd8OnzIOGHbnN0QFwUrrfTMbQ/0mg7hV9OW
         BunsVi0t2yCy0XBw1yebkuiUmXyXi7DUdfuH2X/g4EDaRtEWugnPmFPOfm+DSacwDHxY
         6K8C31n8C1KezCGcjjTSdsMZsLYfc2MRA7tjbmTZu6HBSWnGX5joCR0c+lkNREWMzNAN
         OKP46bZ5yydyzTfQUWi38FvWSHoOYepthpCWApO5n9i4+frKvXWuBEddrMKUKqx+o1tH
         eUnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Ip3XfDt6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f72-20020a25384b000000b0063df0e6817esi4356163yba.694.2022.04.11.09.59.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 09:59:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Ip3XfDt6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:48028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndxNb-0007zm-FG
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 12:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3SV5UYggKCHAkiVOchgVUccUZS.QcaeSai-OfabcbUbi.cfU@flex--wuhaotsh.bounces.google.com>)
 id 1ndxNN-0007v7-9K
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 12:58:53 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:36695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3SV5UYggKCHAkiVOchgVUccUZS.QcaeSai-OfabcbUbi.cfU@flex--wuhaotsh.bounces.google.com>)
 id 1ndxNL-0004f1-Lq
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 12:58:52 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 c32-20020a631c60000000b0039cec64e9f1so6112298pgm.3
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 09:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=PBwivsX+CNRca4Tf4iFbEeHQqaqr2duXLo8VWx6ckBY=;
 b=Ip3XfDt6LwMxzZzBkyRC+VfpMnCBEfTIE7zkhHQP1bgV9Dg0KHGiG7HL9rr+FTjwjm
 bDj+uFskAzIzjEfykZm//ewfSWTgrUtjajYxEprErKi4nXC9N9zVUDVLVIwREyMaOPAa
 mq/nZWmp0jTQGe0oykHb0ESymX+xiOhc0mF1mV2IFjGoxii+me9ftFAyKIC1BxrklSIH
 JKADiJ/e4DjshWaNErF90Dc4cPYF9KMAgwQ3XI0JkpHLkNTF3ZP7mVOyW1hh7a243XSC
 52f3ojjGqeJ4SyecUJGjqtLTwMzzY9K/Ews3Cmjgh93+CRhCKWz6sykWWGMuhOEW9WKg
 bnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=PBwivsX+CNRca4Tf4iFbEeHQqaqr2duXLo8VWx6ckBY=;
 b=OjL4UGzRe3Srp6zuHLyXBg3nbO7hoEn4O37qAQYuT0TOcLOP2LfcNIzUB1SLnjdzHm
 j2+zt1A83Vp+Faa3N8ETFgGTm+orSbK4StbTKr0k2bfG4vqYpUkfhpt0XSzNdAEXea7p
 60vixEpeKahPSsXBKkvmiuLXB9UNCOkHby8KR4wykXEYZhjcFd9mHwkCAeBKYjcfvIWx
 gf0I3IKzBt//p+Tvn3LciHSZ5aC1zV94qex3b6ITVbCoyb96nCd87ESt3Vauqa6z5n3m
 Ny9qTewoBd/0y7b7pq8JmqXBJ7WDMQowQB1hNHMsysehYB/70FS/6PIADNxJlOkrpgTl
 xT2g==
X-Gm-Message-State: AOAM532b0zm9aUXymHe/2+H578PNBUsIhKVrYht94sGdxT4UK5vsFp+R
 0dzySI5rPiJM4Uxymb7L4Sawytm3uFm0YA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:903:244a:b0:158:558c:2227 with SMTP
 id l10-20020a170903244a00b00158558c2227mr7843714pls.121.1649696329961; Mon,
 11 Apr 2022 09:58:49 -0700 (PDT)
Date: Mon, 11 Apr 2022 09:58:41 -0700
In-Reply-To: <20220411165842.3912945-1-wuhaotsh@google.com>
Message-Id: <20220411165842.3912945-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220411165842.3912945-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
Subject: [PATCH v2 1/2] hw/misc: Add PWRON STRAP bit fields in GCR module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3SV5UYggKCHAkiVOchgVUccUZS.QcaeSai-OfabcbUbi.cfU@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: fL+OgZbDqO9a

Similar to the Aspeed code in include/misc/aspeed_scu.h, we define
the PWRON STRAP fields in their corresponding module for NPCM7XX.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 include/hw/misc/npcm7xx_gcr.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm7xx_gcr.h
index 13109d9d32..9419e0a7d2 100644
--- a/include/hw/misc/npcm7xx_gcr.h
+++ b/include/hw/misc/npcm7xx_gcr.h
@@ -19,6 +19,36 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 
+/*
+ * NPCM7XX PWRON STRAP bit fields
+ * 12: SPI0 powered by VSBV3 at 1.8V
+ * 11: System flash attached to BMC
+ * 10: BSP alternative pins.
+ * 9:8: Flash UART command route enabled.
+ * 7: Security enabled.
+ * 6: HI-Z state control.
+ * 5: ECC disabled.
+ * 4: Reserved
+ * 3: JTAG2 enabled.
+ * 2:0: CPU and DRAM clock frequency.
+ */
+#define NPCM7XX_PWRON_STRAP_SPI0F18                 BIT(12)
+#define NPCM7XX_PWRON_STRAP_SFAB                    BIT(11)
+#define NPCM7XX_PWRON_STRAP_BSPA                    BIT(10)
+#define NPCM7XX_PWRON_STRAP_FUP(x)                  ((x) << 8)
+#define     FUP_NORM_UART2      3
+#define     FUP_PROG_UART3      2
+#define     FUP_PROG_UART2      1
+#define     FUP_NORM_UART3      0
+#define NPCM7XX_PWRON_STRAP_SECEN                   BIT(7)
+#define NPCM7XX_PWRON_STRAP_HIZ                     BIT(6)
+#define NPCM7XX_PWRON_STRAP_ECC                     BIT(5)
+#define NPCM7XX_PWRON_STRAP_RESERVE1                BIT(4)
+#define NPCM7XX_PWRON_STRAP_J2EN                    BIT(3)
+#define NPCM7XX_PWRON_STRAP_CKFRQ(x)                (x)
+#define     CKFRQ_SKIPINIT      0x000
+#define     CKFRQ_DEFAULT       0x111
+
 /*
  * Number of registers in our device state structure. Don't change this without
  * incrementing the version_id in the vmstate.
-- 
2.35.1.1178.g4f1659d476-goog

