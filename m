Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp2140709lfm;
        Wed, 19 May 2021 22:16:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKVmpdHItxSIepK2c+NYBREE7OPiv0sz2nCRWVZ9Iawf3oacVr8+iCLtA+LgFz9Rp+JDn4
X-Received: by 2002:a25:addc:: with SMTP id d28mr4891660ybe.448.1621487791242;
        Wed, 19 May 2021 22:16:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621487791; cv=none;
        d=google.com; s=arc-20160816;
        b=EMhmSGCVRiFJCy/FqLnkXM/BdAejb/DX5L+R/bldPzAzco0+CYSymmI2MNq8Hr27ks
         iw+26CNFvEISqh3mIcBIU2w8tDP8iGUQmb1+le/tY1//5P4wPZFRGxw8bo/uJ/Ew4B6A
         GNcObfr5fy5TaKR3WEQLN8p2ckSaspJwpnqdLNo4Th8MGkHEsmOutaov4kPHU1HEDeEH
         rawQqMb+r1KxBOq47jDIxzeW3rct8t5vriuiw5+80iMGUW0oTw31Seq4tji51koufTs2
         rKLcn76Z8Hu+a50QhjYUgTiqY2C4rUwbv5hBEwRHLPcCLgnZ8NGzXxCTbZW3qTyB+Yqr
         mZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=trGsGaryNWUPxAJDqUIpevE5ZbWH+x1Qd17FpqljBXA=;
        b=SzNMRJtPmAMsO0w/vyGQshKzC8Da7IQGcjJyErA9cRS6xluvRaPzFRbH9pj0NIrPCB
         /uQX63MM+hCva+LHDDwyOsaX6ZtHpqCyzOz1lVQwJMsPx/RGpN8rokADhnVXizbMZ2iP
         A5t8c2C+i1aA+M7cgblKFsotHqGcH7GPteyDLitQ95DSZE0trje1eYilwZI++7r3wQln
         ASyHyc719QG0lNnGp6W4GnlKV+6fE0+1GEYbsJd/JOs6JDWVa+XpsW6Cb6rJXOd2ysWt
         mwScufEXEDEPQou4/0odKU9tLnB9zvZ4njvncVn+jiTBONEuu5vsfcgoTf96aQwqXttc
         JZlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AHnpVKmw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5si1507246ybo.393.2021.05.19.22.16.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 22:16:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AHnpVKmw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljb2s-0003zV-JI
	for alex.bennee@linaro.org; Thu, 20 May 2021 01:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljb2N-0003OW-3B; Thu, 20 May 2021 01:15:59 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljb2K-0002Xx-SV; Thu, 20 May 2021 01:15:58 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v12so16184423wrq.6;
 Wed, 19 May 2021 22:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=trGsGaryNWUPxAJDqUIpevE5ZbWH+x1Qd17FpqljBXA=;
 b=AHnpVKmwyHn+wNukIPjogA6Hkn8d1dioPdVLsZvuaYcQaSfNG+Ku+jDM1G9nm+r6RV
 RmGLf6+rYeeG1E2lQw3ShzO80YPxyiadK8BAJ/BsrKxlfDr7IwLoH+HpqyzZn+/zEl98
 c8RxHV0XbuHY27dFqq1XD5F1FM1u7wke3vHz1mCApubSh3skua3LVaZ+DJ4C4mzgTWPz
 r0RymMS5AEuZ262UNDF3TinQ/1URa929gtMyfinmI4U10gSS1PCzIkGx8YxY5RZSzkHK
 b0wZxH9kOmhHmqqYQ/zVeC2x+108z6eTj6PTVwSPaIfY8F6iA/mPYO7QIrjKvkNXKvZr
 QjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=trGsGaryNWUPxAJDqUIpevE5ZbWH+x1Qd17FpqljBXA=;
 b=Lgx15aaI2Nv4wws15gw6FpwXFNkWVaEsqP7fOnh1Bd91KaWXf3lrNtIGx7vchBziRO
 pF2WdwUIsJbXR1O2TFIaDtWsn3P5LbBIYW0SpuEugtEUmT1LbM5uhVJJdW40p4K7yERe
 UjLLPxnM6pzAJkGHTyjQY2so/mfAwhrsrjzL6VT+jInl79ZD/Y8Zf137PsOAa9mHQ7UA
 pY0tpzbN2fBnduT2E2I5kT5DoRrnrpmV1YgEQiL5nmWjEMD0g1cUiFWRuS2QHs9HGcB4
 rzSLRxwjw/w280QEoamUpawE4CrnwNtSPFNRGBzhq2FlZeGO1bxhKgjd8ZbLhT5A/NS8
 qjTw==
X-Gm-Message-State: AOAM532sJ1zZOeaYnyMH54vYc5CuQT49t23+T7Xx1PFTzJ8OwylTNicz
 p0ZLWyzs9GVxroU+ojgUjCoCVeVN264qCQ==
X-Received: by 2002:a5d:6ac2:: with SMTP id u2mr2155073wrw.272.1621487754552; 
 Wed, 19 May 2021 22:15:54 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id p5sm1730612wrd.25.2021.05.19.22.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 22:15:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] hw/core/loader: Move 'write_rom' trace event earlier
Date: Thu, 20 May 2021 07:15:41 +0200
Message-Id: <20210520051542.2378774-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210520051542.2378774-1-f4bug@amsat.org>
References: <20210520051542.2378774-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
X-TUID: P4PAxrSBNInl

It is more useful to trace the event which will happen,
rather than missing an event that failed. So move the
'write_rom' trace event earlier.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/loader.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 5b34869a541..b3c4a654b45 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1142,6 +1142,7 @@ static void rom_reset(void *unused)
         if (rom->data == NULL) {
             continue;
         }
+        trace_loader_write_rom(rom->name, rom->addr, rom->datasize, rom->isrom);
         if (rom->mr) {
             void *host = memory_region_get_ram_ptr(rom->mr);
             memcpy(host, rom->data, rom->datasize);
@@ -1160,8 +1161,6 @@ static void rom_reset(void *unused)
          * CPU definitely fetches its instructions from the just written data.
          */
         cpu_flush_icache_range(rom->addr, rom->datasize);
-
-        trace_loader_write_rom(rom->name, rom->addr, rom->datasize, rom->isrom);
     }
 }
 
-- 
2.26.3

