Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp65079ejy;
        Mon, 20 Nov 2023 13:35:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFP1kbrdmFiluosuIM8tbx6STTl/KON2AodbNjiGlEjOTQ+FfYl2uWLn/zi8+ccnzai+Wkr
X-Received: by 2002:a05:622a:1b89:b0:418:1088:7d69 with SMTP id bp9-20020a05622a1b8900b0041810887d69mr10256094qtb.18.1700516100026;
        Mon, 20 Nov 2023 13:35:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700516100; cv=none;
        d=google.com; s=arc-20160816;
        b=0C4R4D+uQzh26+Gci1k9G3j1FgyKUlVO9/GT/MlQ/0eIy6HC4Yb9rnBOaK2dcENdOY
         F96OSr2haMIlJDwesYJIvB5Yku1+yRYhYj+Jh8kARa80/e13v7WDOCc/P62NfDnvoV0n
         HVVqkF3uBbu/URsLeyYDPMShVh6Q3hUgUlmcACABrm/BICaYR1BnD+7MmG2VHuuZ4TJS
         lz+yTwblaOdOdbpreJpxbGzBGvU3C14kk08IvH+GQYNBmkN6X+Dqwuau/9yhJVgCHbny
         8ktj/dqJ/5GgyXN+t+GdgfpC//bkPZp3wNY6ymqrVztubxi6WMX+yn8ba83Tln2mXhZU
         rvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LbDA9YGRe7qNIe50oT0Ny26RZPp0o8gVGjIEnbyILZM=;
        fh=toXMQ9nuJ3L4CLQ8EKaTQ8L/ltDlD3GauRZSJpgYVzU=;
        b=viSv4GTou7QwGFElFmd9hKICzC7bhBATFlrQQcsXNvZqgHCDwGMOzSWO48uRySDQLZ
         DNwSRTVzd05NmPyrhVpfOCWCRCEPPctz7y07X0iO/DjCzfXKze8/Ye6ppO9AMoie3tTC
         lyqsJzJ5pUaVr374Fr1Llf92dRf6UM70tIL9d7PQahXmvm23kQgWdlF2YBeo+sKFxJ/t
         eunVcWBL5oRIM9kGBiCpSacg2eel/G7/6ge2hb2NKJmoZzXu+79E11RVQ8wUKmyCXTog
         MImCRTAovLaRhxNQoeRWq/xQrQQ/z7sYTV04Vplvu72WL6hNU2LSys9d72vUjYAP2VB6
         lbEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cAxnqNxG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6-20020a05622a044600b0041220e682d3si7594593qtx.596.2023.11.20.13.34.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 13:35:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cAxnqNxG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5Bto-00016G-Qe; Mon, 20 Nov 2023 16:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5Btn-00014C-J1
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:33:43 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5Btm-0003BM-1p
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:33:43 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40859dee28cso22452015e9.0
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 13:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700516021; x=1701120821; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LbDA9YGRe7qNIe50oT0Ny26RZPp0o8gVGjIEnbyILZM=;
 b=cAxnqNxGWqekkN92GLQ8zKXsAL5t26rbEEO/cjQITi6I/0iv2iMR0CCdu6mTHnApur
 7/bppD+qcmdr58agvZ27FQMBH8ot648OuHSjwlHSXnrDfgyFDDaDdTxP9kQtT5b3e9r6
 c364UHE/lPI9C1jbs9TlF9HAkMQQHFrpozOd9mIn8kz/rphv90aUL0LYJzOnyrLshkBR
 xmdEP+INbq+jiHPFGZweskQOrCD4ivCfkIbvKIZ4t9UwXV2n2WqOynxRtCS8/I2GkJ0R
 Rsx28Sr6PGMUPPzzWeKLqBwmyHaOvCt24S5rHVqGCx7d91t3+sRA/fvja+BxsPyVkGG/
 mIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516021; x=1701120821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LbDA9YGRe7qNIe50oT0Ny26RZPp0o8gVGjIEnbyILZM=;
 b=NHKOIgv+GLg0FqddwVNp8Erejisft6qJX0fHN2putnXQxN8RSuJPb2n8Qf3vscrAGI
 4EKKdoDvkJwmgon0MEGZWHely+NzgnAYlTeAx6aoU8hGxUA6wV8LVvQ44UYom/5cSllW
 yYkWc0BffiiH70UE8ZTYug7uINYEFvquOUvTIqkroVD+9Ijnie+MniHCDwHoaw8xLF85
 zp4+FwjNg/zb9fPY5i5etzTxrmRM83/viByzd0AhLuqs30nnUJXJtWUV4ZFGS5KiTv/b
 up0MnGy5Q+QtI0VFaYj9KQlIjS9nsa9UMTLI7cn3w5A5alCZtuqfKEy3lAFEK5qP96nF
 WRiw==
X-Gm-Message-State: AOJu0YxA4lXMfT6xl8deb6NyRvYvqt8PFS6n5jljEUho5JzsQM8ZI8YM
 LOjuvX3/uNiXA1bRotSCHorQKM7Aevz8r4p8zNU=
X-Received: by 2002:a05:600c:1994:b0:405:40ec:415d with SMTP id
 t20-20020a05600c199400b0040540ec415dmr6998432wmq.39.1700516020706; 
 Mon, 20 Nov 2023 13:33:40 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.190])
 by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b004094c5d929asm14891734wms.10.2023.11.20.13.33.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Nov 2023 13:33:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH-for-9.0 03/25] memory: Have memory_region_init_rom_nomigrate()
 handler return a boolean
Date: Mon, 20 Nov 2023 22:32:37 +0100
Message-ID: <20231120213301.24349-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120213301.24349-1-philmd@linaro.org>
References: <20231120213301.24349-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: iR7dzhxbFz5Q

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have cpu_exec_realizefn()
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 8 ++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 4140eb0c95..8e6fb55f59 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1498,8 +1498,10 @@ void memory_region_init_alias(MemoryRegion *mr,
  *        must be unique within any device
  * @size: size of the region.
  * @errp: pointer to Error*, to store an error if it happens.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_rom_nomigrate(MemoryRegion *mr,
+bool memory_region_init_rom_nomigrate(MemoryRegion *mr,
                                       Object *owner,
                                       const char *name,
                                       uint64_t size,
diff --git a/system/memory.c b/system/memory.c
index 337b12a674..bfe0b62d59 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1729,14 +1729,18 @@ void memory_region_init_alias(MemoryRegion *mr,
     mr->alias_offset = offset;
 }
 
-void memory_region_init_rom_nomigrate(MemoryRegion *mr,
+bool memory_region_init_rom_nomigrate(MemoryRegion *mr,
                                       Object *owner,
                                       const char *name,
                                       uint64_t size,
                                       Error **errp)
 {
-    memory_region_init_ram_flags_nomigrate(mr, owner, name, size, 0, errp);
+    bool rv;
+
+    rv = memory_region_init_ram_flags_nomigrate(mr, owner, name, size, 0, errp);
     mr->readonly = true;
+
+    return rv;
 }
 
 void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
-- 
2.41.0

