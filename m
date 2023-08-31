Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5072028ejc;
        Thu, 31 Aug 2023 05:59:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXhToXnWKeEi7DtlK9MPGAwycsbj4zV04l7/o2MtXDXH2hf/YYZo8YVz2GlJgd0cZPIT41
X-Received: by 2002:a05:620a:24c3:b0:765:a8dc:f5c8 with SMTP id m3-20020a05620a24c300b00765a8dcf5c8mr3208760qkn.35.1693486764966;
        Thu, 31 Aug 2023 05:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693486764; cv=none;
        d=google.com; s=arc-20160816;
        b=sG6k9osm31okjHfv3WuTtqlVfxMuaynAodoFWjAiN/5drEvbHMLmQQBPfu8G6PePeH
         EuME1rrxE3KhZtI9on5RzGFANESFuheNbUEmKaBdQTYVmxH7u75iHyDaVrdp4PRu1mXl
         CvjwSER22rtLdDPaJ2soyapEXc0ZQSFaZ9tiYDSXPgbPoIn9pZAYB9Up94P8HrQrS+At
         +Z/GEPsHBbZIap7IIH07DeNeL5EzfqbSj1Pb47OdUfEUVdOvDJ9uYddb9QLIVjf4Yfzw
         U0zMJ+pL9VmpdZ+slHkX1iWlsOElX3WDnqdjn+PlwetEfJ5XAegxmbTp463tbGkKrVDG
         Bhhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bNsqCjIrn7zPEbmcPc2JoOkFxTFsvtPHpgJNrPfRe3k=;
        fh=SRheZk8w8qaz272zt1Ue91fPcaDByZWGdyOzwrBfBOk=;
        b=xnPHFmEnZR6qO81R/nL74tkU/pj7gO51fohbhIyIicPITzjhx1pVB9kaT4ZD7Veqx5
         fue1QLmVzVJJLEtZYNbN6LoTkMSgc5Z5Z3VYo7WbkbKJjzd/MwOQiz4xyzpd+t/ZcPJM
         5YHZtxG5CQncRjnJNWYezvw5WP58kTZqIRMClmPRYnTMGXC8iKEhkVZw5p0z7HwmEe97
         0Ej+ZIT1IDQoF5wyO+DhwcXylfif9WvZ0+dPrYoE1cDv4IP9eexZ9OItt6xpHLhGToN5
         6EyvXNYf7D/0H05X/l8XgBtc9Luu+oPlIE/QS0+1kRfgwRS24lhHgNDg0nSxW9bJrq8q
         7NNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dy2Oa8eU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10-20020a05620a438a00b0076f21765d39si865046qkp.274.2023.08.31.05.59.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 05:59:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dy2Oa8eU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbhG3-0003rD-38; Thu, 31 Aug 2023 08:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhEr-0002lB-Ai
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:57:34 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhEj-0005Dy-W9
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:57:33 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40078c4855fso7017195e9.3
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 05:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486644; x=1694091444; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNsqCjIrn7zPEbmcPc2JoOkFxTFsvtPHpgJNrPfRe3k=;
 b=Dy2Oa8eUvBjrN+Piny9LuZZhv32bc7Pj6pUUp0rhZWO3ZSKp28fzJdyvxh16mvaWFQ
 olI5o134o2gavn3ocyvuFWordWMIKkYfMzaAPz4lI2XxkH5GXdPe9lnjrN2hVxHLJz23
 Mz+25Ksl2qAiJUMSoBibg1AjA+5oMLlKS3Cy0BA4VByJOmnPNqEgPjSuXywvyAp2Pgv0
 SYfPgwyymGV7vNHJhDEA5HTfV2gPOoRMfvE8TarEhJLW91a+LLr5FrAgW7O/xeRd18sO
 82J0lW2/63Qmlr7n9tkd9Vv+bODoJojUiNi/iTYghbt557sAobdbiKbOz36zpq0Xl5lr
 4Edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486644; x=1694091444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bNsqCjIrn7zPEbmcPc2JoOkFxTFsvtPHpgJNrPfRe3k=;
 b=TARMFfc5GRNEAQS9iE0kINNwlKvtdJtUMgXfQYECX3xsU5PZ6TWqGCcIuIYtab08QO
 NffMWPBK9rKzR7tEo9/Gr8rZAhnOa3R7UARTg9ULwxg6TgxJqxM64ewTeCn6zdfzr5Fk
 Y0uvW74pN5tryluowOgYR9ao+PEJSSZiId+5eZaB4dNI4PHH0Hph1QYf3cCf0D7aOsiX
 kXhciWplgmZHIyQLt640U5n6VtbwIdgko62TblQxEhh2/ohqnn/UL0LyoOVrk0OW0JFg
 yjRzQI0rczDMeh7dsNm3pLPHkgtf8r37Rbucklwp0r382wgkxcPl3yIcc+8JFFic2uvj
 QQ4w==
X-Gm-Message-State: AOJu0YzsRjafInV4P18saSCrjLPRkR+jloHZJhxzM2Vd1zsvu71jitmR
 8/G+7IsdBcU9uSGANYK7kRLRKg==
X-Received: by 2002:a1c:4b14:0:b0:401:dc7c:2488 with SMTP id
 y20-20020a1c4b14000000b00401dc7c2488mr3945207wma.11.1693486644318; 
 Thu, 31 Aug 2023 05:57:24 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a7bcd09000000b003fe0a0e03fcsm5059538wmj.12.2023.08.31.05.57.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:57:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PULL 06/41] hw/dma/etraxfs: Include missing 'exec/memory.h' header
Date: Thu, 31 Aug 2023 14:56:08 +0200
Message-ID: <20230831125646.67855-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: i05m/D4AZ2wp

The 'fs_dma_ctrl' structure has a MemoryRegion 'mmio' field
which is initialized in etraxfs_dmac_init() calling
memory_region_init_io() and memory_region_add_subregion().

These functions are declared in "exec/memory.h", along with
the MemoryRegion structure. Include the missing header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230619074153.44268-3-philmd@linaro.org>
---
 hw/dma/etraxfs_dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index a1068b19ea..9c0003de51 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -28,6 +28,7 @@
 #include "qemu/main-loop.h"
 #include "sysemu/runstate.h"
 #include "exec/address-spaces.h"
+#include "exec/memory.h"
 
 #include "hw/cris/etraxfs_dma.h"
 
-- 
2.41.0

