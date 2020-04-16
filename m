Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1564739lfm;
        Thu, 16 Apr 2020 02:03:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypKgs6IQBNZwjfs/DNqS50jl3FECugX52OXFZqHLaLDVrlnl+5Mf4XaSoPgBlB9It/1jquRh
X-Received: by 2002:ae9:ec12:: with SMTP id h18mr28452744qkg.387.1587027799434;
        Thu, 16 Apr 2020 02:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587027799; cv=none;
        d=google.com; s=arc-20160816;
        b=muf/ESlEytv9/Uo83GP7rlyGhtM61C6Uznv3evITRnLEe2SiskGV/sMGDYh0yO/twt
         /axPTfDEvmlhUbUwm/Tmro5TR1VPqv5WlDOgsXgaUzYX0sScazz/X+LAalTjWqiCpy6s
         cBH/g6e4/5P8MSoQdMJsrwlWz+tphW4mt/XK4WAe0TMoU1hWwwslqavUyQ6KXoIkDZjY
         0F96HaYoSKInZr1jQDsvYr+GvtMrYYAoFpWzWRxypdPFF/dYlGeIoQjvH1jW7R1QgkqS
         iwHwZEcswvecUfGrwujtDx+NzbcLHv4pqtbEn629Z6jxDl6CKSyjRCAXrOedRymMM4IE
         DT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=t0g7U8E3KHE61ic0C65DwUhjti+TQvBSks1i7vapsT0=;
        b=znLFD8V0LKjFFj1EJew4q1gt8Qd9jSTlyRNHb7U1SSlt6BLXaXLON+kRAfw/jQwzqy
         AKs9DIahdShUiNpe4t2ceBAkelt+jvd3fzBnDdHXLfavhlK7/urw1nkUWvquJyv6hz2s
         teHAePBRtN2mGnc3RqBKMSA5CA90Veuu+muvDWPnFRed6Qw4ejys+fLl+2bT4rmlo/aw
         9R+WSvoMqMOB+bOQ99ohWJGNGMbXWIcmVEdV9W/NX6dZpX3tH9Wa6F2noNxUPmgjrnHV
         tvwdlw4L5NzwsuQRPwAQ9CcadubzK3WRs/RCKkeWXhwacHYikJhb74wEK0vb9KBnUnm7
         hQpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Sfy6LfIh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si11119120qvb.95.2020.04.16.02.03.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 02:03:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Sfy6LfIh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP0QY-0000td-OH
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 05:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49373)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rfried.dev@gmail.com>) id 1jP0QI-0000oY-S0
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 05:03:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rfried.dev@gmail.com>) id 1jP0QH-0001Gz-0b
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 05:03:02 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36573)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rfried.dev@gmail.com>)
 id 1jP0QF-0001Ee-P5; Thu, 16 Apr 2020 05:03:00 -0400
Received: by mail-wr1-x443.google.com with SMTP id u13so3916134wrp.3;
 Thu, 16 Apr 2020 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0g7U8E3KHE61ic0C65DwUhjti+TQvBSks1i7vapsT0=;
 b=Sfy6LfIhguA9albT4FxwJotLGBSRus3mDuimprkTAgvAhbq8I8BsSHjVgZzI7lQHbH
 yZm97u6gr3JYOgLRodBAgB49uDs/M9XqEGDH6+eMfKY7fsOzgZvmK2y50UikYE0sGUmc
 WXHi6ygtHrZd12nXYmA1/Cycm7vUIgglu8o5fCworqZrcpYuAN1hzXw5PXj+kWMC5fhm
 5lYuwQNKNOEiHh+CL2X9caCN1D+3K6hpjUFpcbhuFJbSHtBdAdaNGf1B1O3HZPd5F9PI
 mF6O/OgMzrxSZVixA5+We/Yu/iqZ9XfOMCRFE7J9iXgZyGQYOOnoHDQs8y7M9/BnzR0K
 sXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0g7U8E3KHE61ic0C65DwUhjti+TQvBSks1i7vapsT0=;
 b=WjrZE8wDovFH1uf/UDUUmcapd5V4AYH6kEPWWAHD6xGVeNiYjTkjQc8vymEyQzxCwo
 Po/UqFm2Dmy+a6sLFkWDvLtOQib1cDBUNyLTVrBEuRg69K53hhSd3fuGTSzcZ2UzCPzp
 mqfBMwYGeI707NWm1OVzb7BLv7qgvLiM9a3eAAx3EZMAOxLFa2qtr9Ivh+gL5rzbiqFx
 sbMV9E3irsZ5mfKtIRHCv/KwW4f4RzyK9DNchiDi5/WrrRLoi9vxL7f+Q8/GFXypz84v
 +QIlJo5yuCSEOhB6CTA3/G+tPhGWHbh7HMCGJlKYztVIH5gNovYaoZ9qBKDr7LtED1hg
 nwCQ==
X-Gm-Message-State: AGi0Pubz3Ag5s2IiRJ2PP+MEOwUTgcR6+YpPY+a2gug2fKqlgE/DkCAe
 KKYZ5WyrZ08VlIIZKrLib0A=
X-Received: by 2002:adf:8441:: with SMTP id 59mr30522047wrf.237.1587027778157; 
 Thu, 16 Apr 2020 02:02:58 -0700 (PDT)
Received: from localhost.localdomain ([37.142.6.51])
 by smtp.gmail.com with ESMTPSA id h137sm3489092wme.0.2020.04.16.02.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 02:02:57 -0700 (PDT)
From: Ramon Fried <rfried.dev@gmail.com>
To: edgar.iglesias@gmail.com, alistair@alistair23.me, peter.maydell@linaro.org,
 jasowang@redhat.com, qemu-arm@nongnu.org
Subject: [PATCH] Cadence: gem: fix wraparound in 64bit descriptors
Date: Thu, 16 Apr 2020 12:02:47 +0300
Message-Id: <20200416090247.353414-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Ramon Fried <rfried.dev@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hv+hCDAc30f0

Wraparound of TX descriptor cyclic buffer only updated
the low 32 bits of the descriptor.
Fix that by checking if we're working with 64bit descriptors.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
 hw/net/cadence_gem.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 51ec5a072d..b8ae21cc0d 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1238,7 +1238,14 @@ static void gem_transmit(CadenceGEMState *s)
             /* read next descriptor */
             if (tx_desc_get_wrap(desc)) {
                 tx_desc_set_last(desc);
-                packet_desc_addr = s->regs[GEM_TXQBASE];
+
+            if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
+                packet_desc_addr = s->regs[GEM_TBQPH];
+                packet_desc_addr <<= 32;
+            } else {
+                packet_desc_addr = 0;
+            }
+                packet_desc_addr |= s->regs[GEM_TXQBASE];
             } else {
                 packet_desc_addr += 4 * gem_get_desc_len(s, false);
             }
-- 
2.26.0

