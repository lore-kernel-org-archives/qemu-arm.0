Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp316698lfm;
        Tue, 16 Jun 2020 22:52:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5Sy8T9/zdJVk0KSX437qT6zzltBmhlYvZHqV845/XNaFJXFDIqS5/4/9MEwyEgEqaUXmG
X-Received: by 2002:a25:da13:: with SMTP id n19mr10134818ybf.45.1592373153506;
        Tue, 16 Jun 2020 22:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592373153; cv=none;
        d=google.com; s=arc-20160816;
        b=mVsC62lrms1rHPohSdN6OHAWAL4vwd/hEVYjucR/TvV+6EAuCELXmmJ6MiVe3EgNOP
         pV931pWefjcmTUM+l5AgxHkJKY9lDgceePYj8TJCVWnJooXvqL0+DDKhgAP83fvX468m
         TkyTGYG4cZT7178fBHSJECyuIDmm1jTTTdcW865Qy8wZzZ1GByh2HymkkMhqkv3OvVLk
         +ncOqEXN4UlxCpUTACmhWNB3sHPivLUh8X1XXaLqbV4k4QNBNINRkhC0l3z61g9UNRW9
         M2Gihch1qJBkQ5ZdWMVOyz+9WUtr1pXA1UYBTd2iRDgPKnXWWv9PtGu/DCpCVEuDj7MS
         H8Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gRuYrkZwAIJ2Q2Q4lPg1tjWevvwY/3xzxDc6xxMros0=;
        b=spW0iYkg2ofLNNjTz9VrTocZoh6Fnl3YscKtdYYOg4XLPpTNflTUVDVZUYxSlTTrFD
         uYTPH3yAcgKHvmeeTkq3yD7O6EawtzvdOs07WBRvGl5NiYdjNhpzPpBusZ0DrLUITivA
         9qfV2u+ZsmRRY4dbMpTwN241d2RS4KPIagCSlDHlHe9Rs+adGHfKeqUbZ3h7gZCmwYoj
         tccCcItr/NBUIXFvFTBKmk2w3npP5YQTqLtsaMbKXF6gCVP3UDm6K6Z7qLTP4OSOOv00
         d8gUp0iooW8Ft+S9DyZvZwpTdKr4Cw2Xyx6yaFpPb9H8id47RvjC9zCXPxXHv2eMt9wN
         cuOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Cof89Yt7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12si17627111ybk.171.2020.06.16.22.52.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 22:52:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Cof89Yt7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlQzw-0002uh-Sx
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 01:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlQze-0002WR-RU; Wed, 17 Jun 2020 01:52:14 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlQzd-0004Qh-5I; Wed, 17 Jun 2020 01:52:14 -0400
Received: by mail-wr1-x444.google.com with SMTP id p5so904722wrw.9;
 Tue, 16 Jun 2020 22:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gRuYrkZwAIJ2Q2Q4lPg1tjWevvwY/3xzxDc6xxMros0=;
 b=Cof89Yt7fJxuUEazQj+qFjLIGw8DqPQqglKC78/AQpiFWD+i7nEbl74QCX6/Mei/w8
 xXM/PAIf36uB6y+XVv50ycasYtfe6Nhc4SEnETLBWE3gy/VjNTK9du5FWSD4G7ipje/+
 IBxggCobZUhXVVL3aVOOeHWQ9s2akRyG3HVr52+Hk+cybOuvw24pepN3p3+0qGKWr0Cs
 ICGaVfwVzxuXaN4FACuv4IodOxjvNemMi+mgeI0KGAWNEyaOiJn2hv4iBGhURsJ98qnR
 BzqMlI37HjVgXeJR7bD44mTdO9Zr0cB2ZU/OsBmpgRYSFrt9oja6fkB4jNKeXznYy7V3
 e8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gRuYrkZwAIJ2Q2Q4lPg1tjWevvwY/3xzxDc6xxMros0=;
 b=KxSNEWVTE84IP4ZslDGNzxUS4CV/E2ROvVmpL9gCVcyMw6rRttTGAFdn5zlvWNtKhf
 jUuwTG+VTsPgjLmUViw0iGKNcLl+7vORT3dlQ7sbWE6qkdjOC4MPEGKnlFFP7mkzMrdE
 g3F4bJOv8a0NJKRk9748drweVhUJhHlpf8xDKzJqCmi0VO7U5zRWu+tY1FIrTZg7NrJ1
 AtYR9CXeo2rQBFe+pZNgCXCdXMMeCLcpAFIpq04npg558u4rAat8lca7RqK9xlAbWn6W
 emen6IDElXlqP3m/aZf+D2WL9MAmeWWMvWUJgkyfaa7n6aeWBZ/UzAR+PqMm28Bj2RTZ
 eyTA==
X-Gm-Message-State: AOAM533MTUPgEvbWq/7k24prltk1PqOPqvQFApQjM5YyQiRKVUNx7Aki
 6jxl5TZs56ZQp5ADBlu+QwNr/Zy6
X-Received: by 2002:adf:ec03:: with SMTP id x3mr6557424wrn.297.1592373131266; 
 Tue, 16 Jun 2020 22:52:11 -0700 (PDT)
Received: from localhost.localdomain (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id d28sm3000809wrc.50.2020.06.16.22.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 22:52:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/14] hw/i2c/versatile_i2c: Add SCL/SDA definitions
Date: Wed, 17 Jun 2020 07:51:54 +0200
Message-Id: <20200617055205.3576-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200617055205.3576-1-f4bug@amsat.org>
References: <20200617055205.3576-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Esteban Bosse <estebanbosse@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wwinT4U9qbEK

Use self-explicit definitions instead of magic values.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/versatile_i2c.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index 040139d701..0ce10a1bcc 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -45,6 +45,9 @@ REG32(CONTROL_GET, 0)
 REG32(CONTROL_SET, 0)
 REG32(CONTROL_CLR, 4)
 
+#define SCL BIT(0)
+#define SDA BIT(1)
+
 static uint64_t versatile_i2c_read(void *opaque, hwaddr offset,
                                    unsigned size)
 {
@@ -76,8 +79,8 @@ static void versatile_i2c_write(void *opaque, hwaddr offset,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Bad offset 0x%x\n", __func__, (int)offset);
     }
-    bitbang_i2c_set(&s->bitbang, BITBANG_I2C_SCL, (s->out & 1) != 0);
-    s->in = bitbang_i2c_set(&s->bitbang, BITBANG_I2C_SDA, (s->out & 2) != 0);
+    bitbang_i2c_set(&s->bitbang, BITBANG_I2C_SCL, (s->out & SCL) != 0);
+    s->in = bitbang_i2c_set(&s->bitbang, BITBANG_I2C_SDA, (s->out & SDA) != 0);
 }
 
 static const MemoryRegionOps versatile_i2c_ops = {
-- 
2.21.3

