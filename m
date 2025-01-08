Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp716126njb;
        Wed, 8 Jan 2025 01:29:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU4GUjQyS5bDXyno/01wzn9k6xaqWnBCkOgD1zMhg9ux978gPxYD9yUb2K0SmA4SyZlQXsbE5OBKWqbPg==@linaro.org
X-Google-Smtp-Source: AGHT+IHZMe3VTA/CZljt+A0lkgI1wE9WF8dMNIfz0LR/1CdxMhFUAMiQPMOof5VbcnMbnjpKsnLL
X-Received: by 2002:a05:6214:400d:b0:6d8:7d63:f424 with SMTP id 6a1803df08f44-6df9b1ea89amr36698716d6.12.1736328540053;
        Wed, 08 Jan 2025 01:29:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736328540; cv=none;
        d=google.com; s=arc-20240605;
        b=CLmkEuYOx1zDVePJgSO1wl/hEOm/Ol+EVRXXzEG4k/HIWWXbG1DTmhojBQVEu+aTtn
         nwr6guvVsx6w5LrTTt10qF/lj26g+JNheeKMAf8WV8vb8Tc3gNZ9/u5Nzh5biYYiWMnt
         z7cD+6dQZxBs1iJw5mL2M7Gc8Vd7AFSiom28wrT3XpY/9jiECnyWvoVogC1h1k+Shf/S
         em7Kue5F5MPDWO5JL8NxGuTiiOySBUsqYZsT78B4fusmihWMWa2m/0RF0/107U1/WxjN
         xArX9x4gkM3Fp39c2rSz98eQxu7AJ8py8v201IPtJb9Cl5cXxk16GdwCkGKgdihLl9sw
         oJ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jwa3/hEOW5oIO38CwUoCPmmJJzY27pAglGUrj1yGlSY=;
        fh=72aN+nYhmJgdPF1ZfVAf9/LUUyyAo4Df33AAx3uZxCE=;
        b=QE6c08eislFrK6GYqN2vdo7+7E5z59UOltLvyIhbM1B0jKcUKxgCBpQEPnEAutkhFp
         lRcVJFRXL2MVh+1NjbSTs/0HJ0+OIqPAEGFvEdH0ac8Ux09Fwipqd9+qOpRavq2IVdkV
         i8pYeIhbl8lIQnE2VOLcDLP57i8iZ8Z87CRAF6vKc6WuNw2/WPXHgIIjd01h83RDU3TN
         PzwLQr0ULwyuxf6DbfmrxL/VucQC5spJ9Z0h9SCixBKlHbHBEDepeMfdR4sW7SENcq1r
         qErDnSLTB7EO/8xL5y19PD9hwnusRJR2lAQQY7hn3LUVeGBopOtRZ7v9iHCMuPrLf0/G
         rEKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=DXTG3TmS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd18101e6esi499910786d6.110.2025.01.08.01.28.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2025 01:29:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=DXTG3TmS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tVSKd-00045m-Tc; Wed, 08 Jan 2025 04:26:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tVSKE-0003xY-1F; Wed, 08 Jan 2025 04:26:07 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tVSKB-0004nq-57; Wed, 08 Jan 2025 04:26:04 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so124492766b.0; 
 Wed, 08 Jan 2025 01:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736328360; x=1736933160; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwa3/hEOW5oIO38CwUoCPmmJJzY27pAglGUrj1yGlSY=;
 b=DXTG3TmSEXzfjrsop/HHcOoMgxMls6jXmjnf/y0hHA/PmQZQa3wXHplZUdf0f4COsH
 FO9LLpxPfmdcNaYhaT68JN5UyXNXb23OmXl0a3o1yHZsBTRi/3KiBUQHyZAmw8iiyS2J
 ALySGEZMGILXr5czYpEVkaBw4D3ZxaeAMQMH1wn6thPa5CzMXAz+fTMZYJQPvdB1V0Ry
 mnjyzHPGVnvDfgrMDDXGqJu/7x81IPCv5eOSYkTMigWS/5JcW5uU5d2Rg817Wq0oP3VF
 X284d8n2tqAf1UlkNb3iIvYm0vh6OeNYAvWWhrCVMjPVmGBiBPCC5j5kJM8rX9sAKFJs
 v4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736328360; x=1736933160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jwa3/hEOW5oIO38CwUoCPmmJJzY27pAglGUrj1yGlSY=;
 b=ISj+TzkrEWYv6x4eI6o684jwzCHuOD9Yv4JcwstQnxvj66gM7xsD3Zqbczw5YWaVoA
 zCeBon3wccOD5aWdYl8TnxG4dw1Lp0tNpWD8ctCDQh/PTlRuH8c+KWoYWgSo+NyHeXiY
 Lm1mNkJAjwBgQie2mTXd8ugqK3EJkMA0bNbsRH6HMGpyaPkJR0eFlM7ZU8higkzqIXS1
 v97TGe+K/lR594epxz9g6bPNu0EtSunpLwHRHl511q/FoJ65XyQ2TVDgRLuWsjyi2YUA
 1EBbPf7eRhuR9wIhMu4RIYJ13KDTvax10KaY54OyobcBu9NRsMj4/tRsEh98gq2nTPHX
 3gJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHhMvy10MrsdyzLbwR69kskGqTGpXmmsEnXInCL4q+MzfNCQKRaPcLGgLwuTM+Bts2gtqp3F1p9e2nxg==@nongnu.org,
 AJvYcCWgLniRdroZUOVMlr4wHNbhYGHTZN/tPo3H/vuL/iJ5uAzTAZIiPQG24Rhcwm3eQuObfQz/1uZ9Yw==@nongnu.org
X-Gm-Message-State: AOJu0YxWwD7GQbnKC5VHMY1R+SG884dtr/DYDSvmSjYoua/7ItP/inbt
 RXlm9DpYnx3eQBvASoajr/WVsj+k3spSrwUEagTSWW1I+BwBgNeKfkDq8dj+
X-Gm-Gg: ASbGncsrXlKy5E9lM9QaSmhZx1nVUEaGSM4u+6dtf2Mb8i0JYd7WXxP44XciE73NXF4
 UN/HxZL/QKZqE1unLDvjkz+VPbbpBEeXOqngIeGmIWayjFKguiJ+njSCMqDRNBp+S/EJg5sm023
 QcUjFwG7eeyAAnvuEuXOU+6vCbigRVt3dtcDZa42ve1p6wmd8Zk9DudhFGB0uAPVnzf37XS0vVT
 nKSUy4G8a02v5nZfpW5tT7lcDJ6jiy9w3NxAp/3UC3QQpI+fY1u2U/PMhuAVcD1eD+2XXrX0ZKX
 Fpg7WLoZTZQ7thPh6Ksm3rd3b7Ug/RcCZDUM/wctKTWjiy4=
X-Received: by 2002:a17:907:7f16:b0:aa6:7ff9:d248 with SMTP id
 a640c23a62f3a-ab290501c47mr481318866b.8.1736328360298; 
 Wed, 08 Jan 2025 01:26:00 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-188-106-228.77.188.pool.telefonica.de. [77.188.106.228])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d806feddfasm26116096a12.58.2025.01.08.01.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 01:25:59 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 08/14] hw/sd/sd: Allow for inverting polarities of presence
 and write-protect GPIOs
Date: Wed,  8 Jan 2025 10:25:32 +0100
Message-ID: <20250108092538.11474-9-shentey@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108092538.11474-1-shentey@gmail.com>
References: <20250108092538.11474-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: K6WEIx76p2U+

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/sd/sd.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index aa8d86e1af..a50e5c20c8 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -181,6 +181,8 @@ struct SDState {
     qemu_irq inserted_cb;
     QEMUTimer *ocr_power_timer;
     bool enable;
+    bool readonly_active_low;
+    bool inserted_active_low;
     uint8_t dat_lines;
     bool cmd_line;
 };
@@ -876,8 +878,8 @@ static void sd_reset(DeviceState *dev)
     sd->cmd_line = true;
     sd->multi_blk_cnt = 0;
 
-    qemu_set_irq(sd->readonly_cb, sd_get_readonly(sd));
-    qemu_set_irq(sd->inserted_cb, sd_get_inserted(sd));
+    qemu_set_irq(sd->readonly_cb, sd_get_readonly(sd) ^ sd->readonly_active_low);
+    qemu_set_irq(sd->inserted_cb, sd_get_inserted(sd) ^ sd->inserted_active_low);
 }
 
 static void sd_cardchange(void *opaque, bool load, Error **errp)
@@ -896,9 +898,9 @@ static void sd_cardchange(void *opaque, bool load, Error **errp)
     }
 
     if (sd->me_no_qdev_me_kill_mammoth_with_rocks) {
-        qemu_set_irq(sd->inserted_cb, inserted);
+        qemu_set_irq(sd->inserted_cb, inserted ^ sd->inserted_active_low);
         if (inserted) {
-            qemu_set_irq(sd->readonly_cb, readonly);
+            qemu_set_irq(sd->readonly_cb, readonly ^ sd->readonly_active_low);
         }
     } else {
         sdbus = SD_BUS(qdev_get_parent_bus(dev));
@@ -2797,6 +2799,8 @@ static void emmc_realize(DeviceState *dev, Error **errp)
 
 static const Property sdmmc_common_properties[] = {
     DEFINE_PROP_DRIVE("drive", SDState, blk),
+    DEFINE_PROP_BOOL("cd-active-low", SDState, inserted_active_low, false),
+    DEFINE_PROP_BOOL("wp-active-low", SDState, readonly_active_low, false),
 };
 
 static const Property sd_properties[] = {
-- 
2.47.1

