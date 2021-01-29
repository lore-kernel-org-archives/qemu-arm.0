Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp707475lfo;
        Thu, 28 Jan 2021 17:04:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwolQmuNMSQLNgHCcZfvbwpqZ1mvzdTwC0lM14oW+4j7JqH+GkP3h42u0b3rPiVCed6mNnX
X-Received: by 2002:a25:ae83:: with SMTP id b3mr2961422ybj.64.1611882289629;
        Thu, 28 Jan 2021 17:04:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611882289; cv=none;
        d=google.com; s=arc-20160816;
        b=p5NpkWNUn5k56pdB3VBwdOwh6McYDVqSbeB34NM0nHEUpJZFLEIyz6F0ufIlmibAJO
         KwuUSEpW2vCkaWxBf0HunJju0e+69XxA+hsbVCFvttbtAt4Wo862uQDritJNfYK1Oquh
         ubUTU/ZuC8rjkcgWzntASH+vbiugzceYxTXE/f2hh0dyGyFC3tqHituQef9rFqO1z0qK
         FjIez5JuIZRlWfFZV1cF/NI6RrJK72uyNB+zVtl2KZKFwkx0aXxrkriT/j0ujRWtFzlK
         8cIye5gHAyxtbb6qREydvpxUBnQ22I4jKpiIiK3KNEfjcyS1ha2cDnDR9oSjTKLpsOcM
         wooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=ELaBYRMM2IbotDCIKyZuXyvpnGXxuQRotS+jnVcGgmk=;
        b=aInh+ZQWdoDDHnDykzm+g3UEtZ50cobpnF7NzHEu8jNmhh++ULo9wdELu8hUBNPDia
         oUe6vpBTWLaVBxQKKOS33JyOb1onBSeB4uD4HJSeVPguU2sW8FlwNcVWJye34vzxjart
         gNqdPvaG92chRwnC3z9inyCI3eA2E+xV+BGGDGon2snAROeWcn33N125LTcWJtXVw7jE
         bcKzhPTPCj2dU7KIc5yGHz3B2GthP+lxRCfLY318xNvC7M7VvoTagTcV+mnyz4Wpc85P
         Ne2swI7GBestYVVUc1oOpWWojAHgZ7Ttll1iOFez4EiFB9glTl4Kbu5XoqQfHW1EG5TH
         CFTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=HRCvWaTX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si6691293ybb.75.2021.01.28.17.04.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 17:04:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=HRCvWaTX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:47052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5IDR-0003TV-0K
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 20:04:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3C18TYAgKCB4QOB4INMBAIIAF8.6IGK8GO-4LGHIHAHO.ILA@flex--wuhaotsh.bounces.google.com>)
 id 1l5ICt-00032t-8a
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 20:04:15 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:36079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3C18TYAgKCB4QOB4INMBAIIAF8.6IGK8GO-4LGHIHAHO.ILA@flex--wuhaotsh.bounces.google.com>)
 id 1l5ICr-0004WA-G7
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 20:04:15 -0500
Received: by mail-pg1-x54a.google.com with SMTP id f16so5134806pgh.3
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 17:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=ELaBYRMM2IbotDCIKyZuXyvpnGXxuQRotS+jnVcGgmk=;
 b=HRCvWaTXgEvzg559vIeY9WNgVG9kk+zzl5IXFom0uQQwXHbONTVsqbRRLGCVHBTGhU
 CUL3H/Buhk0LRyckH/GKyIJCoAVLA63/YBKw3G+prWDJxsaK3fywZkqRM3gMipTd1UyU
 HmCj3yDxTM9ETyXarFXLevgY3H0tgTkCltYOb4kR2vWswE05aK+VKfxQQSSKfauD8kgS
 Khn/6aqXDtgJWKhRB+oDOlOja8jzuwWznDpX8zWAECoRyB/F0Ed4bbMCCjM5FFksGX9/
 /+wvRJpWYSkwW4WDU41h4T/QOaa516riIjjgTb/xCp73k2LNTODdJ03Fd778aYReZP4o
 Ar8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ELaBYRMM2IbotDCIKyZuXyvpnGXxuQRotS+jnVcGgmk=;
 b=iwvjVdBNNUh59MPRL0FsS0WNYLNVWVqaG0oApT6CMaIhCEVSnHdey5MhK13hMFsgpH
 iR6nswIoZ2OK7mOFB2BKSo8AE5VKKEwqaRCpe6uIxjh+f5egfBtjINJgNVrYApSkKo/l
 E4y1wEcyHrpjYoKcSK5HFujEl5yVFv/b6PHF1NvWpU051JD22bbdSW/3a0q5A3hEB33+
 exjCn1QwU1CvJgATUML9FvAgzac+JpjZO4CurS1AIpESOWm3vzwQ3VXNelpPoPmMSkOx
 XelClqq1B/Q64nTh4VpMhpge5pvFLgRVacKgkr0BCnt7RH3nPhvqf6OE8aWKYrxlFBoY
 cp6w==
X-Gm-Message-State: AOAM530VlhZ9JEMmEe768jN4gwmHN6EpOtExjGubPFUg93iQ7BFw4qNO
 zDbBup6vUYYPpWjU2GIIxapGY9lH5gHk2Q==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:4209:: with SMTP id
 o9mr2049452pjg.75.1611882251532; Thu, 28 Jan 2021 17:04:11 -0800 (PST)
Date: Thu, 28 Jan 2021 16:58:42 -0800
In-Reply-To: <20210129005845.416272-1-wuhaotsh@google.com>
Message-Id: <20210129005845.416272-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 3/6] hw/arm: Add I2C sensors for NPCM750 eval board
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3C18TYAgKCB4QOB4INMBAIIAF8.6IGK8GO-4LGHIHAHO.ILA@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: cminyard@mvista.com, venture@google.com, hskinnemoen@google.com,
 qemu-devel@nongnu.org, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-arm@nongnu.org>
X-TUID: Kut6sgA4hAiq

Add I2C temperature sensors for NPCM750 eval board.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 3fdd5cab01..47a215bd01 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -98,6 +98,24 @@ static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
     return NPCM7XX(obj);
 }
 
+static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
+{
+    g_assert(num < ARRAY_SIZE(soc->smbus));
+    return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
+}
+
+static void npcm750_evb_i2c_init(NPCM7xxState *soc)
+{
+    /* lm75 temperature sensor on SVB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 0), "tmp105", 0x48);
+    /* lm75 temperature sensor on EB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), "tmp105", 0x48);
+    /* tmp100 temperature sensor on EB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 2), "tmp105", 0x48);
+    /* tmp100 temperature sensor on SVB, tmp105 is compatible */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 6), "tmp105", 0x48);
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -108,6 +126,7 @@ static void npcm750_evb_init(MachineState *machine)
 
     npcm7xx_load_bootrom(machine, soc);
     npcm7xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0, 0));
+    npcm750_evb_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.30.0.365.g02bc693789-goog

