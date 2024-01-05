Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp796156ejo;
        Fri, 5 Jan 2024 07:52:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErTtR4K2y+mWyarjn9oD0b0X7RUDi6b802xt16EPyCnssCCtuhmgf3KUAgBrfB74Kayorp
X-Received: by 2002:a05:6871:a908:b0:203:64c3:7b86 with SMTP id wn8-20020a056871a90800b0020364c37b86mr2445988oab.44.1704469927531;
        Fri, 05 Jan 2024 07:52:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469927; cv=none;
        d=google.com; s=arc-20160816;
        b=XT81HHSuqEMTk4WvEY3C2bZRyqLM7YRRGHLOkHS10OJQ+TnRAKOyQQzDRD5d6lK2xL
         Tul0dKKEbpiSsn1S9IaZM7OZzo/VBk+/64P2NNicD3X7cnnBn6v6Q3r+lSl8tbOvqfha
         XPFDzPRjw0BR+I5GAoCVlpDcf/JkxlwRG2TNRwZmCrcdzeNEpNIXUjwf3n9zRVJXG+AC
         rziIKYPgQ06I9BqDR99qFytwh6M7mGvVR5158wSneySMRN/X/QjL+27iReeMr62A0/FX
         XA2iuUEIZ8D2uHXOOBNaH0UkOYVZVk0OxeVHM+3lKQXop0+5DaT9l/hojp9WtuJOy9Ub
         /HCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=foPbRN9kgz3ubIukCDMoVcakJKSu99lNJLUQRej2Dsg=;
        fh=E/IMe+HuIHQOh8W/HP3CMZ0nY1WkCNldb1wsyc7BhE0=;
        b=O0vAdsojBq8+yzCQI1pOTxU+8F4CG5qjC03Q8/WnTtpLJ62e2ndTKFnXOuljbO8TRa
         wRz7FFZ4+GLesmutIhq9kj+jbZRvrbI2/sogOJyp0yEmcyuK0L/sXDyNu+sbuwL/z65S
         Mlyic+WQ8mgrw1z2gu3Au6yX2ln1PTiSnrMyibwH4EgBv9LPT3u6Om+wzIA9JTWLTxED
         o0JEVuyRCl7HE17FVqJK1TS2r09HwuIcpQpM4XwhdfAqxTqmyV5ms3pIzPBKa8Ib6U1M
         +9zHlYXf+LBPdJITK3hgmR9hdpJEyqTdRp8A6zRcJ+xCwsGdhLJMlRwsRM5l+HQCrtS7
         dvQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pAJGDXvC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15-20020a05620a298f00b007830f0c5846si9465qkp.694.2024.01.05.07.52.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:52:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pAJGDXvC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmQs-0000sL-Jr; Fri, 05 Jan 2024 10:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPn-0005UH-9e
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:47:25 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPk-000459-Sg
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:47:18 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-336755f1688so1408698f8f.0
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469634; x=1705074434; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=foPbRN9kgz3ubIukCDMoVcakJKSu99lNJLUQRej2Dsg=;
 b=pAJGDXvCXqCWtmEX24PENeF/S6BWfWmbADoC/oGYDGPwQKutZ5aONcv7Q3kSxSaRsj
 Vu1dKH40+YAhYVZ7ElIXYKG0OUx6y6xhkG8jaidL7xoZVDljyNVB9qb/gcn66glAF2Ej
 VADCTDYsNLlH/NBBSWO8K0crq+FVsvtxd1WsgGMiKvJDumxUi3bpkr0+gz1s5XSO55CQ
 2H1E3rcmYnn9EzUtcSsrdkwF3eoYzC0hlkyc7a0GnoOvAgaf278CFXcxQKO9qj8ggKRE
 dolEz3LzOa9vJ4XLQMRq/OC+E2g2ngAL1ZDrJWgWWG3DDk2OpuAsv+t9H7skvwZJxfuG
 htyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469634; x=1705074434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=foPbRN9kgz3ubIukCDMoVcakJKSu99lNJLUQRej2Dsg=;
 b=n5wN/K8rjLiBC1R1d4IMmHHlJhBcdyrwFkBBXGs7vk029LwihAM+p1ySvHSMXg0LmC
 FsvP6dmPuULj6JBF+Y1TWTlQSEdAZ0XYMDKNDzoDW7VaB2udjseTSCGc3cd3C8FyXYYY
 8nDuUCoRVwwAyyqaMRFpgL2hPn70mv7uTJcNKw/J1tJW+tS/Bng9si+4SpwQNQPxLj4w
 gROQdY4g9fl3uz/C8H9qFRKSE68MKVaAmj3PhjocUVNc5K7Xtz4IbZBPaiTP5wjudjhE
 Nrweb3PyciUixt9bAWOBjx9VzJyZehgkZorWPM+W6KCiEGmKmthtVMsas0jyw3wBvbJ4
 hjeA==
X-Gm-Message-State: AOJu0YxxMYuNI4RqQt0FECytovQRCkeFLI25PlG/wQmrKFwjHZ134GH7
 gCcgMSU9tk3rPQHouG8SJYOEtqr6xXa1bw==
X-Received: by 2002:a5d:550d:0:b0:332:e667:4277 with SMTP id
 b13-20020a5d550d000000b00332e6674277mr1265526wrv.40.1704469634427; 
 Fri, 05 Jan 2024 07:47:14 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 g18-20020adfa492000000b003365f5e87f4sm1623391wrb.95.2024.01.05.07.47.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:47:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 37/71] hw/audio/sb16: Do not migrate qdev properties
Date: Fri,  5 Jan 2024 16:42:30 +0100
Message-ID: <20240105154307.21385-38-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: KT8FM35JAFmj

Since commit f7b4f61f63 ("qdev/isa: convert soundblaster") these
fields have been converted to qdev properties, so don't need to
be migrated:

  static Property sb16_properties[] = {
      DEFINE_AUDIO_PROPERTIES(SB16State, card),
      DEFINE_PROP_UINT32 ("version", SB16State, ver,  0x0405), /* 4.5 */
      DEFINE_PROP_UINT32 ("iobase",  SB16State, port, 0x220),
      DEFINE_PROP_UINT32 ("irq",     SB16State, irq,  5),
      DEFINE_PROP_UINT32 ("dma",     SB16State, dma,  1),
      DEFINE_PROP_UINT32 ("dma16",   SB16State, hdma, 5),
      DEFINE_PROP_END_OF_LIST (),
  };

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Message-Id: <20231124182615.94943-1-philmd@linaro.org>
---
 hw/audio/sb16.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/audio/sb16.c b/hw/audio/sb16.c
index bf7f35a42b..fd76e78d18 100644
--- a/hw/audio/sb16.c
+++ b/hw/audio/sb16.c
@@ -1325,11 +1325,11 @@ static const VMStateDescription vmstate_sb16 = {
     .minimum_version_id = 1,
     .post_load = sb16_post_load,
     .fields = (const VMStateField[]) {
-        VMSTATE_UINT32 (irq, SB16State),
-        VMSTATE_UINT32 (dma, SB16State),
-        VMSTATE_UINT32 (hdma, SB16State),
-        VMSTATE_UINT32 (port, SB16State),
-        VMSTATE_UINT32 (ver, SB16State),
+        VMSTATE_UNUSED(  4 /* irq */
+                       + 4 /* dma */
+                       + 4 /* hdma */
+                       + 4 /* port */
+                       + 4 /* ver */),
         VMSTATE_INT32 (in_index, SB16State),
         VMSTATE_INT32 (out_data_len, SB16State),
         VMSTATE_INT32 (fmt_stereo, SB16State),
-- 
2.41.0

