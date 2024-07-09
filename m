Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp1561497dlb;
        Tue, 9 Jul 2024 08:30:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9oAe7fv6ebuc6dre5wWeyvO+HfVGsBsXTaOtznuxnFIh4juj9gCnarAz4eB0L+Dci0U5mkiQBNLGmG0A4g+0Hm9f6eXyP
X-Google-Smtp-Source: AGHT+IGjrOR7qVHcDlF3Pm7b/zoBw8D0HsUeS2LBW6zrPb6eAR/qqXkqKyKv9DsZIf6jmxdTBt7U
X-Received: by 2002:a05:6214:19cf:b0:6b4:4585:8e43 with SMTP id 6a1803df08f44-6b61be08820mr30100126d6.31.1720539013458;
        Tue, 09 Jul 2024 08:30:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720539013; cv=none;
        d=google.com; s=arc-20160816;
        b=H/GK+auUssz/ukb/AQ2OaCS4Z6Onkwo2pt75OohMBt5VzrzwRxsieImrEeAjTXqI8j
         Fl8eg8Q5eoiDQ6LHIQDmYfRySWSRIlAAtnBBkoJCY90bArS004wI8i1k2VsteZo9JQyk
         ThoFiwR8HXEvqbkPZtDwZK221ZUN/gg2Ee1RmiI+I8CQk0P3GBFV0PbshTpVPGEMxIu9
         Qwf1YvMAt/SeLHk67qWvBc4XxHNi39JYDJOfIzidKBfcdywVS4gIlclXaDN7dxfgFy00
         bKk2mlB3GdrifMl9958YkBznVrAxCxPOZNby3tqzgA5fOOb3QnlJ3O3Mu+BopKRi8bjl
         6wpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CXlLcchVuZxoQd5Ht8ddmcX5yuPtqrGnU30hdQCRZeA=;
        fh=Txzf7K5YV+qryaChbcvqA4D4sw+KVK3yVi4ERabJCxo=;
        b=hXzuA8zh7rwEU+gzwUwE4i0EPHB05TG5yHTV/TckxV4ygR+FbVC7Lr7CDyRPnuzI05
         Xijr9tRk4R/Lz/Y/LmBhD2e9H4CzcTfDcblLLncuWzR3E0dt2AptQDrhLr5UIgcDBD8z
         w0/JI7+ObYgxIaTtYKKyrGsQIuu/TNG9S16WUp8ShBxoO3mjfgcBvkJugKsBhdST2HLE
         YWwJmsyi40daNz0QZZ1CRC3jRqjRc5/qZuiqzzgEhxh7vENneF4sJxT0062rxz8g9AhI
         J58D6kz3u+Z8NISH+yZRaG0hDZ4vyysbTDkiazqJdPhj53RBWMzB8nYwzVJ/cRU1FTP8
         Krdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wLBm1JWJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61bace36asi25033286d6.486.2024.07.09.08.30.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:30:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wLBm1JWJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRCjs-0004DJ-A6; Tue, 09 Jul 2024 11:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCjl-0003rQ-96
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:26:38 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCjh-0006Fe-SA
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:26:36 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42679f33fefso5030775e9.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 08:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720538792; x=1721143592; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CXlLcchVuZxoQd5Ht8ddmcX5yuPtqrGnU30hdQCRZeA=;
 b=wLBm1JWJAGCwpEUIz+SWZFY6BqMyJcsMhgoEZ5rmwiUhI1tgCNwQYwRQoFw9/Q/J2J
 Xci4BGQ7p8WlEclhjjblc1so0b1I1d8gX2n8E5Cp3makkfoeps04Ep1BoYrGRJEtM7ZY
 Yw3o/iSBjRdSNdigXN4Q00xOvzhrPo6RnVwO4LV5KojEnKBiAMpN8lu6k8WbonIr6XEU
 Wgs7RISADNilDoIyHFkUUCMzA7Nqzb6gPbn2kmYnHKpGvdaABiFUQOTEt9335jPtB0ek
 J87mJiMsFnCuzcOxLDSrUo+mIPoYa4Mo65wZBQPqBpStUgk0q+KsKpWFFAsnRwsEmDaP
 pLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720538792; x=1721143592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CXlLcchVuZxoQd5Ht8ddmcX5yuPtqrGnU30hdQCRZeA=;
 b=ad1ysIXinDDYDjn+REn15PWplVi0h4UyOeys4d2o4/vSFFQOb0O1aabKfzYKqV6LEu
 9VrsbIVyeGi4Zk7wRlhV8o1KxtlpfPq9KnyH1bOmAlWjqzroWVdP8dAvaVs5bjH+UwXz
 hCfYJqRJgBzjg2/WykCF98NpaeGqyO2i0q49DJil03kAI8p9ze/R6rSIGWg7iMz+i3kI
 aOylAgRaG0yGKCGDK6k/2X3mZjaxM13M9OfEBW53zysAiqbxltTTvI5u2x48UyzEmPOY
 uutQibcN/ZtsxHkixvcoXYVtafCBqLgYxKutBbmD5KoPBMcUh4c/LXiJUdSQltdxrOqD
 0XKA==
X-Gm-Message-State: AOJu0YzOMpasp0VXM3cp8DN0eQZF8yCo2Q0c35yBy2O0V+QWIBaQJU01
 nSEfwov2SsUDE1xGvGrogy8YXX7ukN9eYlnLfyaGadsoTKN27388Erk89DRX3So=
X-Received: by 2002:a05:600c:534b:b0:426:6ad8:3e3c with SMTP id
 5b1f17b1804b1-426707e2fa2mr19303475e9.17.1720538792517; 
 Tue, 09 Jul 2024 08:26:32 -0700 (PDT)
Received: from m1x-phil.lan (vau06-h02-176-184-43-20.dsl.sta.abo.bbox.fr.
 [176.184.43.20]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42662315363sm125665345e9.26.2024.07.09.08.26.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Jul 2024 08:26:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>
Subject: [PATCH v47 05/19] hw/sd/sdcard: Implement emmc_set_csd()
Date: Tue,  9 Jul 2024 17:25:42 +0200
Message-ID: <20240709152556.52896-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240709152556.52896-1-philmd@linaro.org>
References: <20240709152556.52896-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: BbHb1wDnPo2H

eMMC CSD register is very similar to SD one.
Most notable change: the version announced is v4.3.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
TODO: comment magic values?
---
 hw/sd/sd.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 2d737a836f..f580c6b2ae 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -476,6 +476,44 @@ static const uint8_t sd_csd_rw_mask[16] = {
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xfe,
 };
 
+static void emmc_set_csd(SDState *sd, uint64_t size)
+{
+    int hwblock_shift = HWBLOCK_SHIFT;
+    uint32_t sectsize = (1 << (SECTOR_SHIFT + 1)) - 1;
+    uint32_t wpsize = (1 << (WPGROUP_SHIFT + 1)) - 1;
+
+    sd->csd[0] = (2 << 6) | (4 << 2);
+    sd->csd[1] = 0x07;
+    sd->csd[2] = 0x00;
+    sd->csd[3] = 0x32;
+    sd->csd[4] = 0x0f;
+    if (size <= 2 * GiB) {
+        /* use 1k blocks */
+        uint32_t csize1k = (size >> (CMULT_SHIFT + 10)) - 1;
+        sd->csd[5] = 0x5a;
+        sd->csd[6] = 0x80 | ((csize1k >> 10) & 0xf);
+        sd->csd[7] = (csize1k >> 2) & 0xff;
+    } else { /* >= 2GB : size stored in ext CSD, block addressing */
+        sd->csd[5] = 0x59;
+        sd->csd[6] = 0x8f;
+        sd->csd[7] = 0xff;
+        sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_CAPACITY, 1);
+    }
+    sd->csd[8] = 0xff;
+    sd->csd[9] = 0xfc |     /* Max. write current */
+        ((CMULT_SHIFT - 2) >> 1);
+    sd->csd[10] = 0x40 |    /* Erase sector size */
+        (((CMULT_SHIFT - 2) << 7) & 0x80) | (sectsize >> 1);
+    sd->csd[11] = 0x00 |    /* Write protect group size */
+        ((sectsize << 7) & 0x80) | wpsize;
+    sd->csd[12] = 0x90 |    /* Write speed factor */
+        (hwblock_shift >> 2);
+    sd->csd[13] = 0x20 |    /* Max. write data block length */
+        ((hwblock_shift << 6) & 0xc0);
+    sd->csd[14] = 0x00;
+    sd->csd[15] = (sd_crc7(sd->csd, 15) << 1) | 1;
+}
+
 static void sd_set_csd(SDState *sd, uint64_t size)
 {
     int hwblock_shift = HWBLOCK_SHIFT;
@@ -2600,6 +2638,7 @@ static void emmc_class_init(ObjectClass *klass, void *data)
     sc->proto = &sd_proto_emmc;
 
     sc->set_cid = emmc_set_cid;
+    sc->set_csd = emmc_set_csd;
 }
 
 static const TypeInfo sd_types[] = {
-- 
2.41.0

