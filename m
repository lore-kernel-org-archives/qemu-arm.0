Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp2140847lfm;
        Wed, 19 May 2021 22:16:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6SEFvA3D9TntHBm6H63MO08dSvMt0H+dI03+xLxsoWDWkg67pAIjDK2ZLNGJPMj8Qvlln
X-Received: by 2002:a25:2308:: with SMTP id j8mr4182887ybj.499.1621487806209;
        Wed, 19 May 2021 22:16:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621487806; cv=none;
        d=google.com; s=arc-20160816;
        b=LylrBQgKmyzlABVYMmvN1a9z/BkITCMelqPECGrPDddl+tnCh15EGEPRKyx7aZzwSu
         B/UxPraBSvijIv2nlN7/wBx0BHp3B0DB1BSdVQhnYoUCg7ZJZHRc6jxo3/3tRyiQGbO7
         rbdg3b06A906Yfbn7MZXcnQcSgfBbXL1rfDixT9tc/N6twZRsllAPaJNd6mKowxWehF0
         8HKe62eyznIUddDAWbWBml17K8rcgPU83UkW+DIvWUcymA2ZKVeyyxkkg5Y94epAWGm4
         f4FttqZSMiVf/T1a1/bwXyqXNxpLO9dZU8p8yGtWp29cZUObQTRP+wO5Tr/QfmkZrqjj
         101Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mcAunA11//sOCKzq7CO3/y2yGuInMfq776cnfd5eSQU=;
        b=I2Nm9vxoMr09h+yt19/JRnkpUeYR9tKUqamSpGoAA6A/3LBTLy0uXw19+rMkk8iyQZ
         PJ+6jcOzaVPD5065qs95Vr7U6ipKWjbpIz9h7p8AvpcfgtB/ZFSL/+vCDrWU6sP4TSH6
         Vl4O3R9u1k40KWmfHM2KH+7+jlDqWB2rueRH9+k3KbLnnMKVWLucdWxItk06tswZ34pd
         yz/NCED7feyw4AXcK0WjukELtOUJxjTJjac0oPr1xZqYKnQ30zMy8xAarE0FfmzVIKha
         18fNuabm/spjRl0XQm5aZJL8iQoh/6+NMjWN4vcyhvnctyKYA7QwNJjWmPff2on1pD2C
         FnVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TsDEf1u9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o193si1352427yba.391.2021.05.19.22.16.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 22:16:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TsDEf1u9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljb37-0004Nd-K0
	for alex.bennee@linaro.org; Thu, 20 May 2021 01:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljb2V-0003TB-NA; Thu, 20 May 2021 01:16:07 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljb2Q-0002bD-7D; Thu, 20 May 2021 01:16:07 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i17so16164596wrq.11;
 Wed, 19 May 2021 22:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mcAunA11//sOCKzq7CO3/y2yGuInMfq776cnfd5eSQU=;
 b=TsDEf1u9CG1+cYkqPoVDdeXsrLXMbD9IG6YmCWu+UKOxBalK1Oc9XSLCW1xJ0cUldK
 NVhhMFLKCknoh+ih01EDDv6pkDxpw3F6b6Hj88q9M6UlowuyfaM4uakFnqFIfrUoqbhR
 WKZn1h1M4hmGOHDhbcf2Mg3ufiTe4NWjJ3Z1XWo/J8/OPct4v382tcfTWR6jUt+JvyIO
 XK2mySBf3vuMAjpMIgIPShPhoeMDOzb/tS+F3yadDH7PaaSJsT4ZqLYyEFeg082KoCPP
 gpgMN06BYOm9+OWaQodVROSG+zhvw9eXFjMMqu5UI+W5IYCh1Lprt9oSkd09zh2aMoPS
 FFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mcAunA11//sOCKzq7CO3/y2yGuInMfq776cnfd5eSQU=;
 b=NhYPZ56kW0Hcd/xv/rvpZ7/8sH0FQKiYUABnmpM+TQOSzKP0m+tKPflRxfQgBh7gBc
 ONZ3yX6XhoK05vOcNItSiwpQYTv9+jlgeMYzkg4UhF3Qz0zKBZpdCpNRvMcNKj86G7mC
 Q6T/OnjI0BhpldxV4/FPAIQBXcAHyUU4j3tJ+ohq7Z6068FqBm0H3aDhtMTd+3oJoycI
 T595jBxOMgjO0/GaIbZIMsC7pDAKSA+eQKO39mrxEuYvvxQ6zr712nGCUC9YfHdTR/28
 uUjxnkkFPhYlEa5p2VI9vLghKDM256stX0E30T9Do81dlr/rbMdtL+cdIOjbT3eMst07
 A7Hg==
X-Gm-Message-State: AOAM5328tkjwUwBxdHndFO8sEihwoSqf3APouhL607WVObauSHHCKlWC
 Nfo7HjG3JPWh3rbSrlt1nnh470vlNDR+TQ==
X-Received: by 2002:adf:f80f:: with SMTP id s15mr2148251wrp.341.1621487759624; 
 Wed, 19 May 2021 22:15:59 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id p10sm1567272wrr.58.2021.05.19.22.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 22:15:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] hw/core/loader: Warn if we fail to load ROM regions at
 reset
Date: Thu, 20 May 2021 07:15:42 +0200
Message-Id: <20210520051542.2378774-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210520051542.2378774-1-f4bug@amsat.org>
References: <20210520051542.2378774-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1RsElOsDLgnE

If the user provides an ELF file that's been linked to a wrong
address, we try to load it, fails, and keep going silently.
Instead,
Display a warning instead, but keep going to not disrupt users
accidentally relying on this 'continues-anyway' behaviour.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/loader.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index b3c4a654b45..37a2f2c4959 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1147,8 +1147,16 @@ static void rom_reset(void *unused)
             void *host = memory_region_get_ram_ptr(rom->mr);
             memcpy(host, rom->data, rom->datasize);
         } else {
-            address_space_write_rom(rom->as, rom->addr, MEMTXATTRS_UNSPECIFIED,
-                                    rom->data, rom->datasize);
+            MemTxResult res;
+
+            res = address_space_write_rom(rom->as, rom->addr,
+                                          MEMTXATTRS_UNSPECIFIED,
+                                          rom->data, rom->datasize);
+            if (res != MEMTX_OK) {
+                warn_report("rom: unable to write data (file '%s', "
+                            "addr=0x" TARGET_FMT_plx ", size=0x%zu)",
+                            rom->name, rom->addr, rom->datasize);
+            }
         }
         if (rom->isrom) {
             /* rom needs to be written only once */
-- 
2.26.3

