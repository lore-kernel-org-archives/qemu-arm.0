Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2398662lfc;
        Sun, 31 May 2020 10:40:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwq0ZB8RQU/Y6VBLwrLjqxlWa0ac3vs/ut8vQ1sBUmwJWJk42y2vQ0nkSZHgR24je3KhEtF
X-Received: by 2002:a25:c683:: with SMTP id k125mr2923144ybf.305.1590946826792;
        Sun, 31 May 2020 10:40:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590946826; cv=none;
        d=google.com; s=arc-20160816;
        b=NvPuNYh0EXZ9N8Vq2JGfFzBqrs1ITYhmDr1V1dOrQp+fgUdwjOLSYsKrYq0nP9iWFw
         6HZbQBZMQksjxUk5CQ9rIfVe/sptKskd3WAUkb149yCXf83JwQTNoEhySFq7lIbVHzFf
         7qihvL79qkOVHrtuUNxFIdBxj/y7qcZPkRUkMGy2gsgvSLl6cZB2546idrnosvqiljx8
         Wv5vgEmm/sCqFobkuNBpBX5RUvs730a1KsKB9TE80ympBYcaDPUVF2UbOoRCWXI/tNrt
         HK+LOylEhNpwtXrx3l4vfiIH0QlcWM/18Ab8AOpQWudKf6Xd4ABjiELCE161y5UioPa8
         XYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iYvFEgksB/BdazMa4Cs2c4jhXMbkN0WXaFJS9CHNgVo=;
        b=EaaJ9qWkhylrclRQfHrzs9u8Di1jf+JV6PRsLtDWwvbM9I6C9+cv25OtihOHGuIq9a
         MhfJ0Arh/lieID9yReyewGQi77wJn0q3ZxUBpzHJaYgm05o+6SfXTSCqC2pPSO8kyWK4
         4pThtZ8ZLwomWRU1ycVzfCFjHQOf2sPbE0LXhxLKHFw5/j60Q8mqGyycjPWTtKL4bpkx
         rKQYwvqtAiX9FsfctV/roFVlgF8G11++IFjFpIAOw6CUNketUhBPxFKNgQSVHfddSDTR
         nRxwdIJ5W8ei1ej7w5CwXpLH0gqFmFtqjKHH9AY0KecEqUYQHMnHCYaMhr6Tc8A/JgJQ
         GtsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mLOiMHew;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p65si13780300yba.66.2020.05.31.10.40.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 May 2020 10:40:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mLOiMHew;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfRwg-0006Ks-02
	for alex.bennee@linaro.org; Sun, 31 May 2020 13:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jfRuo-0004As-DB; Sun, 31 May 2020 13:38:30 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jfRun-0004Fs-Fr; Sun, 31 May 2020 13:38:30 -0400
Received: by mail-wm1-x344.google.com with SMTP id r15so9106216wmh.5;
 Sun, 31 May 2020 10:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iYvFEgksB/BdazMa4Cs2c4jhXMbkN0WXaFJS9CHNgVo=;
 b=mLOiMHew1qF2hGdISfFnUSQy6ouAsSbwhEJxg/OGYSPf9xv1xTbVr8mBMRqJHP0j55
 yBAV5qmG/+djftEUqMiPwGr4Bh3GmX3ZVamOeBJXaKaDNXOaK/dz/G5T07RNwS0DFgrY
 c6bALnWU6nCvGXRvmEhcQH90po/UBDda62lpMh8uL/oBuNFtkrZ/+WZD/xRTxEPgKh8w
 YobGHA9manrtqDfq5TIha9eaxMdsJWURJqAn1SCZ+ZvWMz1ywD46nuh/+b1NyAbjDy7+
 GWlf7/+f8s9uLntj5m+01uzRU7k+D/zt9t5VXEvBWhKQ9MlGmJn6WzbC/VlmhCnqS0u0
 g/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iYvFEgksB/BdazMa4Cs2c4jhXMbkN0WXaFJS9CHNgVo=;
 b=GIqEE6VSJVDHFKaIqWl6zYhXNW3evJEIKNysFoHKGaIcFSfBsHMsCjNCALd7L0Hrq0
 SoVay5vEOnzTm9bjVoa6/K87IIM+ozri7YJBmbTKansAdgMK/opZ0rrru7ikiVXf6d14
 Kjz+F3b/tqf5yxq19c3RhepU7Mqt2luzrm8CJWXSuaV0irSaqcpt4Q6D20a4TvsjdSR3
 W336Lrm7armB6Mh2Hha5CAIfHYpAZ3nq8ctM0TWGFA61sLfhUEkXNyaoNWGajNqjq51c
 1JvnnFOkgJAX33S9ZP5jNHN0RN93xuMDVzod/O42mNlOOYujlvhtL/DYvB5HeoihvZNC
 7woA==
X-Gm-Message-State: AOAM533RaHWBf6iLBbz/EKv9R9F2YL47+wvoWuP1C4iEQfdl6vx2UtSv
 m5M4O/ErAHnyXoMtA99xNAyH/L6p
X-Received: by 2002:a1c:4d0c:: with SMTP id o12mr18594700wmh.181.1590946706678; 
 Sun, 31 May 2020 10:38:26 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id l19sm7973121wmj.14.2020.05.31.10.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:38:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] hw/hppa/dino: Use the IEC binary prefix definitions
Date: Sun, 31 May 2020 19:38:12 +0200
Message-Id: <20200531173814.8734-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200531173814.8734-1-f4bug@amsat.org>
References: <20200531173814.8734-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 qemu-ppc@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YqTVNKrNQWTT

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/hppa/dino.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 2b1b38c58a..7290f23962 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -542,7 +542,7 @@ PCIBus *dino_init(MemoryRegion *addr_space,
                                 &s->parent_obj.data_mem);
 
     /* Dino PCI bus memory.  */
-    memory_region_init(&s->pci_mem, OBJECT(s), "pci-memory", 1ull << 32);
+    memory_region_init(&s->pci_mem, OBJECT(s), "pci-memory", 4 * GiB);
 
     b = pci_register_root_bus(dev, "pci", dino_set_irq, dino_pci_map_irq, s,
                               &s->pci_mem, get_system_io(),
@@ -561,7 +561,7 @@ PCIBus *dino_init(MemoryRegion *addr_space,
     }
 
     /* Set up PCI view of memory: Bus master address space.  */
-    memory_region_init(&s->bm, OBJECT(s), "bm-dino", 1ull << 32);
+    memory_region_init(&s->bm, OBJECT(s), "bm-dino", 4 * GiB);
     memory_region_init_alias(&s->bm_ram_alias, OBJECT(s),
                              "bm-system", addr_space, 0,
                              0xf0000000 + DINO_MEM_CHUNK_SIZE);
-- 
2.21.3

