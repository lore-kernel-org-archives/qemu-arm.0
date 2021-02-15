Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5506213lfc;
        Mon, 15 Feb 2021 02:40:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyr+xtQHEXzCi0//RDzLa8kYdizu/+1crleRACxQXpllRc2JIkt14x37jVvZ0NI+GYmCPeX
X-Received: by 2002:a25:d214:: with SMTP id j20mr21355608ybg.147.1613385643675;
        Mon, 15 Feb 2021 02:40:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613385643; cv=none;
        d=google.com; s=arc-20160816;
        b=knPT9TJSl3IHWLuM7BaFt2od2JTCgYIpg/l83DbVipd3CRLdkwAMJFLS9rt0MRf9HL
         SDxYHvt5/hH1lQbMZPEiZgKx2E9fRXoJ4NGCzY/WaF1d5pl9KH6tOU2hihxbF4zTNEmR
         19rdavtK8HaaCnkQJayH6jip/Voq/cxafPOS5lj6r/iQjcBTm7FhLrWjCjaJQyqvQV7J
         hJBAhOUNjuusefph1IbqjBANcpdJXBFhaLdcKOk8c6S46+n2zgskL76ApATIEq96rdRS
         42aC/agp7+3+IwJE2l14h/jfmKsw2zvKt/+hq8u9hOARHNsmC929M9pboCw0H0N1b5yU
         aQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kTAUyENAZSmntGrsJs6kE2c/p5aLv9Krgur9nleNNPg=;
        b=NCDBs+tNdFD4jDKQrNWlS9TWRQmyhb6gEvT0Og/j938/bqaF59R5v2OkAAPhCfDNsY
         vThMkL6oaPDtU+CAXhm4QVMw1wrayjpTzziVVSGM3GTmEJJDiNo9DEOjutVDKKAN+EoU
         2Clh33et+ECWxJtPKUJ0NZT2qVh4nxTZTAx8JdWdUGJs4+ngfTWIrfHNlN6pn+ikCGDG
         XYwN0AAG3AO69dsbSGtUedJFsH04MXDoZvCrHNN44fWotIpYs4WPdFzFGCt3Real4eKS
         X6oZvwI0GGCqpBI3Pl2xHHiEZ91EUquu6T2/0qYZTc8VMsVRnobELVuc40cxd5wXTxrN
         tbcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bzavho7h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si16316447ybk.0.2021.02.15.02.40.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 02:40:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bzavho7h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBbJ5-00066Z-0y
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 05:40:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB9-0004RE-42
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:31 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB2-0001if-SI
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:32:30 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v1so8243639wrd.6
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 02:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kTAUyENAZSmntGrsJs6kE2c/p5aLv9Krgur9nleNNPg=;
 b=Bzavho7h2B5sLcd9jZsmIHvxTsNEDzcTMs5HrOC4QSSqri9931kvmKQG2ci85jie8L
 /xeYtF6HfVqQo/YqtwDfgyTx+83bijFR9DpxAmzy8pQ1GJ0JLR42iPg4OEopgjkakCwy
 43BECxpHJqww2kCCcqb6bSthJ+D6tYqivF++HKwSeUE/HULyJVSle/w2ZpurxZ9n3fbc
 zBOXLbiZMoVQL2F7C4KtMkDzWUh5HkjpdCov/GfH5MYdnBM+MyEV/wUwtLm7Gbk4p75p
 o7UeHQgjiwf5DuIy+4wBIoF7eeepDXTrokjnO1+MHL/MUKfzpHt1Ab7OWgbT4DZdG9jA
 wLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kTAUyENAZSmntGrsJs6kE2c/p5aLv9Krgur9nleNNPg=;
 b=qNNrAVhxeDOi0qoCNOlKoESQoTArfVjQaQO7J2/sMI8nzX50Rwmw1X5vmu05ciKNPX
 KhyPkcuqGDzLaxx2ubxepbarUGBoG/iBsdUsiQhZ0xPfXLDxEMfuiANshdcqARjfU7Nm
 JRK0oGedPCkhXfImynsot3UmcMWwahphAcCv7+Za79x5N6UuocCi77krTgqZvjcCefYw
 MSdmS3KIAg5/VFz5yiJVy8ZQtRUtmSrNs/xhwJc/cx5tihhWbPRJgr1VPPpffQzvdUUM
 We0151g5elQdhIZpuoa7nYUVJusfgC91yCa5nPBa4+2aNGleIFF3CGL6OpT+edgUibID
 D6rQ==
X-Gm-Message-State: AOAM532CFoekN1LcLNG2FWfj3C2nTK1GvbPakJuco1hjtI5aAO4IznG9
 kHTQLoJdGx6cWOUwF7JCisjfeY5KEQ+pTA==
X-Received: by 2002:adf:ce91:: with SMTP id r17mr17791324wrn.219.1613385142954; 
 Mon, 15 Feb 2021 02:32:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 36sm25196300wrj.97.2021.02.15.02.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 7/9] hw/display/omap_lcdc: Fix coding style issues in template
 header
Date: Mon, 15 Feb 2021 10:32:13 +0000
Message-Id: <20210215103215.4944-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215103215.4944-1-peter.maydell@linaro.org>
References: <20210215103215.4944-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QPgEcelS68TL

Fix some minor coding style issues in the template header,
so checkpatch doesn't complain when we move the code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/omap_lcd_template.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/display/omap_lcd_template.h b/hw/display/omap_lcd_template.h
index 22e51d9bffb..a2f86eee3c8 100644
--- a/hw/display/omap_lcd_template.h
+++ b/hw/display/omap_lcd_template.h
@@ -61,7 +61,7 @@ static void draw_line2_32(void *opaque, uint8_t *d, const uint8_t *s,
         b = (pal[v & 3] << 4) & 0xf0;
         ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
         d += 4;
-        s ++;
+        s++;
         width -= 4;
     } while (width > 0);
 }
@@ -88,7 +88,7 @@ static void draw_line4_32(void *opaque, uint8_t *d, const uint8_t *s,
         b = (pal[v & 0xf] << 4) & 0xf0;
         ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
         d += 4;
-        s ++;
+        s++;
         width -= 2;
     } while (width > 0);
 }
@@ -108,7 +108,7 @@ static void draw_line8_32(void *opaque, uint8_t *d, const uint8_t *s,
         g = pal[v] & 0xf0;
         b = (pal[v] << 4) & 0xf0;
         ((uint32_t *) d)[0] = rgb_to_pixel32(r, g, b);
-        s ++;
+        s++;
         d += 4;
     } while (-- width != 0);
 }
-- 
2.20.1

