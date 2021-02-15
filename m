Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5554527lfc;
        Mon, 15 Feb 2021 03:56:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVKHchTEE86lRta/BDf8UiEP8RapiZ4xSVK16uduRlwDZZ+QVk8DVaNwwSosNwLGQv50FS
X-Received: by 2002:a25:324b:: with SMTP id y72mr22006421yby.233.1613390200453;
        Mon, 15 Feb 2021 03:56:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613390200; cv=none;
        d=google.com; s=arc-20160816;
        b=wmtgBCgbQoh7lGnqgWGfof6nRAw+k7/fA6km33NC7QtIl3JG0GXv8sjCMqJSzTltMm
         fD3fFBL80MYsZ4WLChhiB1XYwqyIX3BxzCOFGBKn+9anpReRNjklrw2gCpYLkWVNhadg
         hy9Qd6pzCW5hfaCDn9NpfAq834Q2ZAXg6jsHb4OZwDBoH0HXeAMwl8tAsb1ElX8GSnWW
         zWMMKeG4U0UTY42C7BLzbpKb/uPICJWMx4/xc5emxwx7KOrbflblrrGhGmPLTz4mqA5H
         fsM9+NlTZpO8LpdLLXM5rH9k2USaEba4QEb1R0VPeMnireRNdm4zWKtfnd+JuPwYik94
         hetw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Q4947nZDfKCY91YN+GzWW3j1l05CAmRJnmXZQOGt5go=;
        b=duUxyK13kT/7H3V7XcXgbzk2BPjz759Bgt+RqSD4GmcFCC2PsOowNcTkacdVN+ZYXd
         eQYQEGT4XdHDlEyIaNYbM4gdGPeOet4qiEsgjr3jHo005p8UpLEOCIiMvPhv4w8nDQql
         ZmXVCYknelHlwtueOumu8qAxnnXGpne7YQ+AbxvV7pgxdrjXyIaQofP2SE5Q/lY+Lg+5
         ntCul5x28VqampijSkfsi5e3+Ins4WUc1vzn6/CvrFHXlFIumlPn6rAJbFgbZ2E09QeD
         gZ2STdijlhr+l3wHfWJoGYkb550yglExof8rhEG4jx2l6EoX6ZbRxEAYAenQksa6k6RV
         fD1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lWGzjOTM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2si18292411ybb.417.2021.02.15.03.56.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 03:56:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lWGzjOTM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBcUZ-0005io-Pl
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 06:56:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQw-0000Dn-Bx
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:54 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQu-0004DO-NN
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:54 -0500
Received: by mail-wr1-x42d.google.com with SMTP id u14so8529597wri.3
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 03:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q4947nZDfKCY91YN+GzWW3j1l05CAmRJnmXZQOGt5go=;
 b=lWGzjOTMyq/LBWnPpM9Je6oed0XfNy3ZsyZwO+WB9FL5FHkz0zjJqv8oNNve8X238m
 gEe1nMDaAR+fVT2+TzJV2j9AVjU2JSLRMYSkttxcWjOpHhaRNsavA4dJh/Qt/ryDe33+
 Hyj2M8lgDmOVe1BnAFY2mjzQ25dJSp9PD2Jq+xq2s/4D0FIKdbQxq0maNTZtA6/La30y
 oBAf+J48zUqprPcXIZxETQ9ALzd2LQnEuIpXPqZNR/vT1lky1mMXoglWDFjpWKPd1nlH
 3/LiH6I6msK//bl8QvrP3ZL4fHdlmNTYNQWoUW5aGR4u0+3ccc1tSAhpIjUxJwpfuFZ5
 q0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q4947nZDfKCY91YN+GzWW3j1l05CAmRJnmXZQOGt5go=;
 b=kUn8QaZeukqmfXWQ0z88brk1VOpY8W/XOyVKLbuRfDuosvfHiezgwlertb/+HdT34z
 OfIArIjLiQIlDsIcrS8ulkOkKgZJQW9oZHXqV43HfiSyqeJIOSe+TzLFJOLJ2lVMbuGN
 OY84QN28QKzjxiRq+3V9Om91RwY5USZkvEx7fQHaLe8WYv0QkxSeMimQWKR/DM73j0NI
 Z6JmqO2QXg2YxGuyddht/Oy3sXq7YaS8JRjJA2WBhpo0wgwUd3gK4XHvtz9F8lFwSRpB
 xuM6PpfyrNgseOGXTF9yvkeMJDSc73ZhcG58OEwMdDwEU3hZ9phebf4CPE7D69IATLiG
 vQEA==
X-Gm-Message-State: AOAM532J/TCz8MzkOu0w2JGX8rNGC8zN1q/FavxJWNLBZxt+VcN6ZZ5E
 DxF4fs/HtQ2yRL0U0K+7AJ2KXKtLWuNlMw==
X-Received: by 2002:adf:fb49:: with SMTP id c9mr18704484wrs.72.1613389971566; 
 Mon, 15 Feb 2021 03:52:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 18/24] hw/arm/mps2-tz: Support ROMs as well as RAMs
Date: Mon, 15 Feb 2021 11:51:32 +0000
Message-Id: <20210215115138.20465-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YOac7r535hLc

The AN505 and AN521 don't have any read-only memory, but the AN524
does; add a flag to ROMInfo to mark a region as ROM.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 08dd2cbaa40..cc9d70ece54 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -92,8 +92,10 @@ typedef struct RAMInfo {
  * Flag values:
  *  IS_ALIAS: this RAM area is an alias to the upstream end of the
  *    MPC specified by its .mpc value
+ *  IS_ROM: this RAM area is read-only
  */
 #define IS_ALIAS 1
+#define IS_ROM 2
 
 struct MPS2TZMachineClass {
     MachineClass parent;
@@ -209,6 +211,7 @@ static MemoryRegion *mr_for_raminfo(MPS2TZMachineState *mms,
     if (raminfo->mrindex < 0) {
         /* Means this RAMInfo is for QEMU's "system memory" */
         MachineState *machine = MACHINE(mms);
+        assert(!(raminfo->flags & IS_ROM));
         return machine->ram;
     }
 
@@ -217,6 +220,9 @@ static MemoryRegion *mr_for_raminfo(MPS2TZMachineState *mms,
 
     memory_region_init_ram(ram, NULL, raminfo->name,
                            raminfo->size, &error_fatal);
+    if (raminfo->flags & IS_ROM) {
+        memory_region_set_readonly(ram, true);
+    }
     return ram;
 }
 
-- 
2.20.1

