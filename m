Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp9949942lfb;
        Sun, 2 Jan 2022 14:00:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKHJOLR1ZDJhqPaduMaoBdxM0yN2RdjaeFIXvV8CKQcKuI+A2UGAieiHt+A3soWISxAdDu
X-Received: by 2002:a25:6907:: with SMTP id e7mr40177984ybc.17.1641160854977;
        Sun, 02 Jan 2022 14:00:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641160854; cv=none;
        d=google.com; s=arc-20160816;
        b=i2kT4FiB0zK+vbiW+nV1S3JdsbtqomObHF50IFGSp/tv8kdIr8O7kP1/vHdEOxDbyz
         lOCpahG6R7NhJahXAGcY0lMO4UFet3X+7xfV9T+wQHYBEIBWq97/l+1aE6ROX4KcDdB6
         s6IYNLNFO5NtOUPonhKYelL1LNmypTVe8oIvZKIcW0mbswIsGQV2acDGqw4BXOZdWXv2
         XYYb7u+vb9o7ftrBRP2kFXUq8V8FSUaPBe2fW8D5hlG2ZJlDGgGYpuFaHj4LI8y1v4Tl
         K7K3rUYiWFg5Gg4nqLZjLAchtB43OsYExzQwsMCTe39mLtWlaFSBvw41mbC/LgDe+ryl
         ILiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=3f5SYfqPTo+WeLjupIzQAU64X+H8Nyvi5ICDdAzt+0M=;
        b=FWkmQGbw1H8967VH/4zdf5D7iUgOYzxbHgYFKlVgCEaKF2TQBPrrBDhD/d+lVo/7AI
         yVJLetCyjx0GMSUbwiM8cjUMsGfqibDnq9ZJz3BFhgCRY8IzQWN3CjCnQ+TZLnW4mDyd
         LE5uV3WSNnmXunsDv4tZxLRhCw9OlHOULnRhin2N8TzvjmlQJ8m7yFOtROEHpZuPeI7S
         MFhsCRVlpjTyEitlI16qme0Bg8d2FCuzyQEjun/SIsbCSxSOCjeTJcKZguQsa/YQOd+W
         WcZcKZw2AQlLvhpqivf63P4+T9W2wl/XoaKwwEJo5prdq40UjM+VM8PJ3kptqjGhumdF
         eLgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Cm7jy0AC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t65si4438803ybf.432.2022.01.02.14.00.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Jan 2022 14:00:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Cm7jy0AC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:42686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n48uM-0006LR-ED
	for alex.bennee@linaro.org; Sun, 02 Jan 2022 17:00:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JSDSYQcKCsI3mv12zmowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--venture.bounces.google.com>)
 id 1n48sa-0005eI-Ie
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 16:59:04 -0500
Received: from [2607:f8b0:4864:20::749] (port=46044
 helo=mail-qk1-x749.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JSDSYQcKCsI3mv12zmowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--venture.bounces.google.com>)
 id 1n48sY-0003mN-Ta
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 16:59:04 -0500
Received: by mail-qk1-x749.google.com with SMTP id
 t8-20020a05620a0b0800b004764cabb1daso15977126qkg.12
 for <qemu-devel@nongnu.org>; Sun, 02 Jan 2022 13:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=3f5SYfqPTo+WeLjupIzQAU64X+H8Nyvi5ICDdAzt+0M=;
 b=Cm7jy0ACn9gyMHVqD9szVbFfqXenyrkoYLFOrihKi6fDUGb0d+THGmLfKiq9+zj8i+
 ECoq2wnNgGyc2GrgDrxSJaQAZRtu13F8DGv6KOqk/e0xMztvAc2NDhYoBx7IktuAMJAB
 lKwTBqiYLRRFW0EjGL20lnaGqQ+Tp6qSWO3k6+eQoGhUgRx8yVVbIy9qjzqOcZgZF9YL
 TjKYZiiKFtsPIpcFLf5r+gsn5pzxYlWeAW0XcmSUI3+Mq4owV6EMVqAogu5VlmNRnh06
 +wi0lTdWN6vDKbPJI5WPfVCWCLRcNrb3uEbceXzRQyyPfYW8Dls/I8unZVJodDXnpsNt
 w2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=3f5SYfqPTo+WeLjupIzQAU64X+H8Nyvi5ICDdAzt+0M=;
 b=7GVbLR2+Jv8buJ3bNzPzzqJ3yWVUHYefrQXQdILtw3nejxwLdXiGi95RrmnRFNKk8N
 KESssGb+bWaYv84KhttxqzWsLt8axqjJghVAjTSv42ktcW6cUjFjPjIIT1gDMBv3Jwi2
 iA3zXre3EW3FBxlDzfpiK5M9eAJqOA11xyCI0EenD4j4eH1Tf2P5fF/47AjmzUxn1iyp
 ypaayzw1JYjFDw7mNhGrhjlAy4pha2f0V/nu2jSuSEQwFouZ22Q/UXBd4YZeABk8h+H+
 3PtxkVFvDA0AIaMY042iZ3bxbEBkLKiUH0UZNtp6ehrHL64dP4W3B4CaaxvRtNduzZQc
 sWKQ==
X-Gm-Message-State: AOAM530XqUqfe9sW++JwpjBozIjyF+zOB8O1HyT3k5eMDSEl1oAqdGcQ
 It9XLIQajAhjfyCxAmxVRVYExT+Vwx51
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:9adc:6d14:2e33:8585])
 (user=venture job=sendgmr) by 2002:ac8:5acf:: with SMTP id
 d15mr38097777qtd.5.1641160741440; Sun, 02 Jan 2022 13:59:01 -0800 (PST)
Date: Sun,  2 Jan 2022 13:58:41 -0800
In-Reply-To: <20220102215844.2888833-1-venture@google.com>
Message-Id: <20220102215844.2888833-2-venture@google.com>
Mime-Version: 1.0
References: <20220102215844.2888833-1-venture@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 1/4] hw/arm: Add kudo i2c eeproms.
From: Patrick Venture <venture@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, crauer@google.com, 
 wuhaotsh@google.com, titusr@google.com, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::749
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3JSDSYQcKCsI3mv12zmowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--venture.bounces.google.com;
 helo=mail-qk1-x749.google.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BEmkWJQmxhCn

From: Chris Rauer <crauer@google.com>

Signed-off-by: Chris Rauer <crauer@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/arm/npcm7xx_boards.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 0866d2f4f0..37de9fef43 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -328,6 +328,13 @@ static void quanta_gbs_i2c_init(NPCM7xxState *soc)
      */
 }
 
+static void kudo_bmc_i2c_init(NPCM7xxState *soc)
+{
+    at24c_eeprom_init(soc, 4, 0x50, 8192); /* mbfru */
+    at24c_eeprom_init(soc, 14, 0x55, 8192); /* bmcfru */
+    /* TODO: Add remaining i2c devices. */
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -391,6 +398,7 @@ static void kudo_bmc_init(MachineState *machine)
     npcm7xx_connect_flash(&soc->fiu[1], 0, "mx66u51235f",
                           drive_get(IF_MTD, 3, 0));
 
+    kudo_bmc_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.34.1.448.ga2b2bfdf31-goog

