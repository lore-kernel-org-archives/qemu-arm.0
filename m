Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp726222lfm;
        Tue, 18 May 2021 12:51:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqkAZNYbNcDVmCWowNrv1l3+Pd0fAMJdsNq1EgmwrXsmC9DH0aFPyVarSTcPVto+Y6LEK8
X-Received: by 2002:a05:6602:70d:: with SMTP id f13mr6107435iox.16.1621367505559;
        Tue, 18 May 2021 12:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621367505; cv=none;
        d=google.com; s=arc-20160816;
        b=BiUdOqQeM7Jq1r00aoFezFXaPDq7ifXOUNgpstY3AQTjnKeMufbDZhbnTMoz3M/p3V
         yIwVwSasqbOE3bd9+fGJcTnbRI8PhDp+AN5254PF+br9LNOJWZZAyYwAy1HOhwjCwAa9
         ZJKDvWtHFAUyV/bR/DzMyj1IgfWBMsF3T71VpS96jwziiskWfecUVA+FdfZFuiJ4wpEr
         VazwXl15iTr3eEqP712roM/aeFYI1AvtntM9b4UNhpwv27S6uyq/UYTTpWWnjVy/ctEw
         46BrGFIa025DbVtllrkjCK1gAlLlmeDqX3yHZPACMJV4MLTzbuR4NkoGjNOHxYjCHQ32
         NFgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=O9O4reEPqLUeYKHwxWKxGpiPoeJSbBXfRrJaRXnaRIE=;
        b=N5KMfWZykXGaCif/j9lQhwT7v23TNxYL6tAGsGURM+SY/1k+vGZd+tGhgxQCNEoguT
         WTeuXmKA/wpklK8qOa0MHG2LVvjIIosFvh6NNRfI9SkqnZS74HacmnTF4PMq+ffnGmBG
         9WYRPzpNt8AT7qzSMyUcbX7zuv9fUH4wrs/GkjsouMIQ/tGPM+80yaesqR9gHjz6QJYB
         LL8NDbV0wZOAne5WNoavZn9i2LcMZAxhCuOYqVzAPHlqTISvygzOz4X9/iTqNtodU0/s
         Zr7vYBXMdTksCOExtw0+kr0YMKAfKGmffAAM1KzeajVB0KSrSdIvUwe1I1XXTSWcNP5v
         Jdlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=G2sobRNl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n2si20528389ilm.161.2021.05.18.12.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 12:51:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=G2sobRNl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:58506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj5km-0007yl-S6
	for alex.bennee@linaro.org; Tue, 18 May 2021 15:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3dhikYAcKCkM0jsyzwjlttlqj.htrvjrz-ij0jqstslsz.twl@flex--venture.bounces.google.com>)
 id 1lj5b7-00069k-Aa
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:41:45 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:56281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3dhikYAcKCkM0jsyzwjlttlqj.htrvjrz-ij0jqstslsz.twl@flex--venture.bounces.google.com>)
 id 1lj5b5-0003i1-P8
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:41:45 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 o6-20020a5b06460000b02905004326697dso14798683ybq.22
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=O9O4reEPqLUeYKHwxWKxGpiPoeJSbBXfRrJaRXnaRIE=;
 b=G2sobRNl/5RLrSEjgjh9UTm/0Ld0mh36P29VmtW6WJsuQcfAKzs5mnFpxoudiZ+FLI
 O27DCUyQuyuCAwtO2m57wu1PJf9dq+9gYrAVJ1nLyDy/l4pg8bNvfR0qaT/QAnAb5YF4
 vpDeevk3skRfUp5fa8cLEMCnQ5l2P/5VrhOR5UdD9ZRIOsh4/H195EE06+ZiWAIskSEM
 jvjEBd59adD5ibre3h1XbMMabRi+agf+7XM02ODS/iNlmZ5sEyMKk1zd4cZ40xh3B6S8
 /Z0oJrGJPoATshLOxORt9O3AekbzTt99KOZzrhV9AWktOwypAJFDmqtWcB0pB6ogGxcW
 UvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=O9O4reEPqLUeYKHwxWKxGpiPoeJSbBXfRrJaRXnaRIE=;
 b=fOgKxjK+zlMbCrF14s26Y/3qEf0he/kKPV1Le7ZOhCP4K2YqQJLD+MnSsmtCX1L5ov
 JfODiyaop2n9S1WkQOsNra83or29KhmfZXuCj4dL9/xtUE6xGPGBK4Vz/nzho2yYc0xL
 1DEpFUrK/9++ztubDF8qUpI4oG9H9ODS/QUAS2K9eSNjvcY8pL7HwoOgrGSUTio5FMsR
 jlGGGGonut2Y+Y/BoOiKT8+6RH0cTQZQfAkIOGR9LVQBEBIuRkEvMjMQWqS9IWN0ogy6
 kQVBpuk6zV6j0ZuUgksHVdZPb/ux76jnoTKTQM9qVH7KwF8npQlOyKsXNounQCJVUin9
 LC+Q==
X-Gm-Message-State: AOAM533ZhcRFSl5sPGTUFYVGe90arKoCpGSokhzSi94XOT4KmY8EC0UX
 z+tlA0h/egLnOWtjGKp6esCqZQBYOkW9
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:5902:8a04:d917:4e93])
 (user=venture job=sendgmr) by 2002:a25:7085:: with SMTP id
 l127mr10221604ybc.293.1621366902104; Tue, 18 May 2021 12:41:42 -0700 (PDT)
Date: Tue, 18 May 2021 12:41:18 -0700
In-Reply-To: <20210518194118.755410-1-venture@google.com>
Message-Id: <20210518194118.755410-5-venture@google.com>
Mime-Version: 1.0
References: <20210518194118.755410-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH 4/4] aspeed: sonorapass: enable pca954x muxes
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3dhikYAcKCkM0jsyzwjlttlqj.htrvjrz-ij0jqstslsz.twl@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w3DY5ZgcHdXo

Enables the pca954x muxes in the bmc board configuration.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/aspeed.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 35a28b0e8b..27fd51980c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -541,14 +541,16 @@ static void swift_bmc_i2c_init(AspeedMachineState *bmc)
 
 static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
 {
+    I2CSlave *i2c_mux;
     AspeedSoCState *soc = &bmc->soc;
 
     /* bus 2 : */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x49);
-    /* bus 2 : pca9546 @ 0x73 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9546", 0x73);
 
-    /* bus 3 : pca9548 @ 0x70 */
+    /* bus 3 : */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9548", 0x70);
 
     /* bus 4 : */
     uint8_t *eeprom4_54 = g_malloc0(8 * 1024);
@@ -562,7 +564,7 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
     /* bus 6 : */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x49);
-    /* bus 6 : pca9546 @ 0x73 */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "pca9546", 0x73);
 
     /* bus 8 : */
     uint8_t *eeprom8_56 = g_malloc0(8 * 1024);
@@ -573,14 +575,12 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
     /* bus 8 : adc128d818 @ 0x1d */
     /* bus 8 : adc128d818 @ 0x1f */
 
-    /*
-     * bus 13 : pca9548 @ 0x71
-     *      - channel 3:
-     *          - tmm421 @ 0x4c
-     *          - tmp421 @ 0x4e
-     *          - tmp421 @ 0x4f
-     */
-
+    /* bus 13 : */
+    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 13),
+                                      "pca9548", 0x71);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4c);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4e);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4f);
 }
 
 static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
-- 
2.31.1.751.gd2f1c929bd-goog

