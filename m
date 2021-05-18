Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp728357lfm;
        Tue, 18 May 2021 12:54:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNVqrw1D68phYpnYPoZvDqZ31WkGfzW1Tr3Z6ejx1N+79Eys2Kl9GsLq4L+BNF5/owZ/9M
X-Received: by 2002:a05:6e02:1bef:: with SMTP id y15mr5865400ilv.305.1621367687445;
        Tue, 18 May 2021 12:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621367687; cv=none;
        d=google.com; s=arc-20160816;
        b=s6mardz+WgGC/rne297DdrynXFgeFeQtht/Z7jb0x3d0PA2lgxJ0em8y4bYDR4/6+k
         GXqcah4wE7uQoRBQiYoHE2C4+M1Z20VpVPGbMqAfmDC+/5KEaSZYCKUJzmeK81zZuxAG
         ckLfYCD4svRTGmzM+Pnu7yrYAqcMauoWMxDRbDQy1eZqngSawLZ217tYTolAGf4Xi55f
         JUV7zIy3yfTuqKp6HitW3etU6o0xciJ45iNHMFxSL6D6w5jZTFgvIH78xIphsRZRQEV7
         KvxFoHyBHMe6fjT9677cWpsedww/ZebOtQSh73Bj1DoLalg4mJj1Lxdtk68aDNE6jvbM
         eZhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=m4GNndj9w5BB2q8HFyXVE7JGjupZSHOpFa5YLNlobZM=;
        b=x9p8uAey/Wgy19T/hjYm+dUlSgt6UTg2c0jtsbO6SJirFtSfobK170x/Vv8ioAZkG9
         MMhp/yyzbVK3glv8XNRsNT+jjX8kgqZj58bgv9LiQrWh8Oz9sG55gP8cwLLBAvw80/7i
         EfCe43p8T1TMMwQvW4+8WNLH2LPJki16Z9/0rwRb+4p2PPc2djA8+gcKXUIcw5Pbh9or
         NPFsLhuEf4ItwA9ARRNrXYWcJ0IbF0N7zb6/n4WjxtPrmmnDXKJ4I18zfb2fjaLdXi+P
         ndj6JYbzXa2+udHZ+mzc/sAH0VPijPHTDNO5y0fTF1xMUBgrfGH0S2Q8GYBKuYSGLqB8
         cbPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=YQ8h5Gck;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12si23675357ilu.42.2021.05.18.12.54.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 12:54:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=YQ8h5Gck;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:37564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj5ni-0004o9-Fg
	for alex.bennee@linaro.org; Tue, 18 May 2021 15:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xxmkYAcKCpYL4DJKH46EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--venture.bounces.google.com>)
 id 1lj5gi-0007tb-GS
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:47:32 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:34773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xxmkYAcKCpYL4DJKH46EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--venture.bounces.google.com>)
 id 1lj5ga-00078P-M1
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:47:32 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 b66-20020a25cb450000b02905076ea039f1so13992112ybg.1
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=m4GNndj9w5BB2q8HFyXVE7JGjupZSHOpFa5YLNlobZM=;
 b=YQ8h5GckbOGoZ27LSe/BtnbzvJRt92ekECt3jXPX08B806bqL50Res0xiY2RHHs3SU
 oF/dp7LJsTpNWEpn8SxOvvYQ/nxFoC6GSZUChkuYrIZQqYAlx40Ei/7TN52fZ3qLAJcK
 s9jIP4DkQxKEmPCAK+dY4Doe7gAf4TmhWaHA5YVI/dQdHSGSVD/AjoYgExYS0MAldAp8
 AIIH+4I3LaWD+BeTqAbuJG2xwqNhO9hn1XcK+2sA/2nzWgdEOH+FbBiwNIWbAdT8UneB
 6YxVNA22FrNQUwzeMsIvQ4Ximh5+fvAdiY7iNIGZeWfAhK4PilZ3ix1AE1c++yVuhJ4I
 XYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=m4GNndj9w5BB2q8HFyXVE7JGjupZSHOpFa5YLNlobZM=;
 b=QKjaVlxCZpkUpOCBGKJKY9oS1sH7tcnIjhg6wEcR8gEX/RFAfQH0WDQMcSzY+d4gB5
 LzDRvUr/M7vCbmT+XudVLNgdnpG7Lq9TpFskFqsDOwIbIjgdisI3ul9rE5XoSm0wsiYd
 Zc/mdDz9nejHZ3US4Y13NR3rp12lLLe2+XOpfQR69mP6DiskvQpFBth/cSL1JgNsx39M
 rdzSAKgLByhCJvvv3FjlXjispy0CmCTR+h957M95fyfSDZb2oRtoMiyWUTVLFw/ukzRl
 tfutuloW9vwoMX7S/6fY1Fsc8bXSo0hWi9HSKfKZCs2qZKnVtpeo9AG+++1xLGrHC3E/
 UtBA==
X-Gm-Message-State: AOAM532GNNhCDmXgKRnHDSIUjKBbRjL5uscveXz7Cq7poDXAr6uw8RPF
 RLBF2Wkg/1SxNbXegASosGPgLEMiZI1x
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:5902:8a04:d917:4e93])
 (user=venture job=sendgmr) by 2002:a25:1884:: with SMTP id
 126mr9714972yby.124.1621367239016; Tue, 18 May 2021 12:47:19 -0700 (PDT)
Date: Tue, 18 May 2021 12:47:03 -0700
In-Reply-To: <20210518194704.764241-1-venture@google.com>
Message-Id: <20210518194704.764241-2-venture@google.com>
Mime-Version: 1.0
References: <20210518194704.764241-1-venture@google.com>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH 1/2] hw/arm: add quanta-gbs-bmc machine
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Brandon Kim <brandonkim@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3xxmkYAcKCpYL4DJKH46EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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
X-TUID: mhat94XJ4hSJ

Adds initial quanta-gbs-bmc machine support.

Tested: Boots to userspace.
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Brandon Kim <brandonkim@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index d4553e3786..34a214fe79 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -29,6 +29,7 @@
 
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
+#define QUANTA_GBS_POWER_ON_STRAPS 0x000017ff /* TODO: Get real values. */
 
 static const char npcm7xx_default_bootrom[] = "npcm7xx_bootrom.bin";
 
@@ -268,6 +269,22 @@ static void quanta_gsj_init(MachineState *machine)
     npcm7xx_load_kernel(machine, soc);
 }
 
+static void quanta_gbs_init(MachineState *machine)
+{
+    NPCM7xxState *soc;
+
+    soc = npcm7xx_create_soc(machine, QUANTA_GBS_POWER_ON_STRAPS);
+    npcm7xx_connect_dram(soc, machine->ram);
+    qdev_realize(DEVICE(soc), NULL, &error_fatal);
+
+    npcm7xx_load_bootrom(machine, soc);
+
+    npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
+                          drive_get(IF_MTD, 0, 0));
+
+    npcm7xx_load_kernel(machine, soc);
+}
+
 static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char *type)
 {
     NPCM7xxClass *sc = NPCM7XX_CLASS(object_class_by_name(type));
@@ -316,6 +333,18 @@ static void gsj_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 512 * MiB;
 };
 
+static void gbs_bmc_machine_class_init(ObjectClass *oc, void *data)
+{
+    NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
+
+    mc->desc = "Quanta GBS (Cortex A9)";
+    mc->init = quanta_gbs_init;
+    mc->default_ram_size = 1 * GiB;
+}
+
 static const TypeInfo npcm7xx_machine_types[] = {
     {
         .name           = TYPE_NPCM7XX_MACHINE,
@@ -332,6 +361,10 @@ static const TypeInfo npcm7xx_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("quanta-gsj"),
         .parent         = TYPE_NPCM7XX_MACHINE,
         .class_init     = gsj_machine_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("quanta-gbs-bmc"),
+        .parent         = TYPE_NPCM7XX_MACHINE,
+        .class_init     = gbs_bmc_machine_class_init,
     },
 };
 
-- 
2.31.1.751.gd2f1c929bd-goog

