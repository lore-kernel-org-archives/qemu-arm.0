Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp942837njb;
        Sat, 1 Feb 2025 01:17:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWbxYYpqimPIC5nL3XDwioQcecFSsfkP9hRWMeoGXgL6QSbPxffbyVzLE2lyZdc6Ekxrno26KA3kyibUw==@linaro.org
X-Google-Smtp-Source: AGHT+IFpfaDlB/kMFSKy7azjkwkxraOCRO0FpTky/Yu580s8KgO832X7GJCRx8KrFBzocrEZ9jOO
X-Received: by 2002:a05:622a:6110:b0:467:770f:70a0 with SMTP id d75a77b69052e-46fd0a10e78mr158975661cf.10.1738401443851;
        Sat, 01 Feb 2025 01:17:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738401443; cv=none;
        d=google.com; s=arc-20240605;
        b=cxolFS2zErTE/LFxAu4vM+T0ktxaOspDEDeVdyTRra/w92iXXv5Uz2wJXfmKQrwxHI
         KMIJbxbBwSPjy2s5lwkjg3nC8OCZMRgZ9bxYCM6d9a/wk3Gk8v13CB9hpdrMDCeESHWB
         QcLYCe92vaxAdlrVNvNdb5QA2ysyUyPB2NY2Ek9tupjDrmGXbET+9Ocry40KJng8HEfk
         9VTZnOzTyaZSsIsQFhY4KVRbkoAtZ9DNPAVq7i7YnhabsYChmKsTnMxLnjj02ACeTds8
         UkzDFQ5Z30qEb84k4KdxzM/BuJj50jxcMM7QC8IczatX8HSh5M47gg5GdACuUzn1+SRq
         ug+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qyqWIFSMh+oTSqypjVXjebXLGHkmeLQM4JJ2rEUUT8A=;
        fh=H4GbwdQ/2oIyPNlbjSTr+s+fsGzXnEOR03aP94txBto=;
        b=OtmBirlxmmaF+0idxbfTO72lq0hpCp1Tq8MpZrXsYqi+yE8A2AMbXbCQLBFTZfp0w9
         1pJcOkznvGMU4YHd1+qcto+LYGJxJAfM2kjTxrqvQQF7/oAGH9oIIg261bp4OoL2odzg
         qmEdi9zxVXuKeUFmmkWG3VQa1N4k8je/2hjwjfd472zJfuQ/YkfmCK9VH7WHjQk4yXO7
         OqL8roFU+GUrX+B14dOSCe5M9MeaSaTULmYAG5BWoY7DzWfnDynqeYylk0D6YisS4VAa
         ctYPEx5CWU82VUoseGpueKl2BzSYhW4Nu99nTRJNQ9fcgT7Z9PAffwrm2Y8HmCjGCMh6
         pAaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CjDKko0H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1d186fsi58830311cf.411.2025.02.01.01.17.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 01:17:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CjDKko0H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1te9bK-0000zb-On; Sat, 01 Feb 2025 04:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1te9bJ-0000yd-60
 for qemu-devel@nongnu.org; Sat, 01 Feb 2025 04:15:41 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1te9bH-0000P1-KZ
 for qemu-devel@nongnu.org; Sat, 01 Feb 2025 04:15:40 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so2339216f8f.2
 for <qemu-devel@nongnu.org>; Sat, 01 Feb 2025 01:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738401337; x=1739006137; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qyqWIFSMh+oTSqypjVXjebXLGHkmeLQM4JJ2rEUUT8A=;
 b=CjDKko0HgNkFx5zto03ObMoh7zsOr8RTy1NDEgL6hx2aqmM4fz+40c2uf4E2tIMN7D
 Rf/Aq06lAKuDgmJ81d2tpeltPhCT6CtdethGxnvh6eoI0+AkxYsyeFjw5LlrwlwEdrLP
 ER+6VHvVnXgMq1d1rMe0rqjMGE0+7yU0xUCc/La0ZkceFNhdrt5BZTpsQ0bJW4DlM3lX
 IldW9slGWhMaTgFJFj5bCXG2thj6eUwDdL9heJFU8VLmjhUVulqiF6FH8uGYf5va9MPX
 jC3AWdvgDuiZchsT04j5l/CrL2LHPkGNXLJSdPrkrwUrpt3lVsuWtHGrlA3ERdUOkw2k
 CjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738401337; x=1739006137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qyqWIFSMh+oTSqypjVXjebXLGHkmeLQM4JJ2rEUUT8A=;
 b=iNcq6A36WASboSMMdiiZ3kIJwHIpOxDttgW9S9Blgh4EOYUGJzUKYTeoDRHYViWdfD
 oy2vy1A43+ofUHuYNUOO7lRA7EtIL2v9tRCJ43+yiD1Ftgfc0yqzsaCl3mry5fktjsbq
 zzY8l/e4Dp9danxBwzKMxUhyeYuekWdBRrgMSuqF6E6ufxMIUYjQ1MuyWYlibyi+Eo9N
 eOmLJpsOC54eIRWqVzWxaiiGpa6kP4BQ6HCg4cXeyvyt8UKwUU50pStnihyJ/mS4gqcX
 rurtMTioPHSr4l7R4DhdTL+s4FcpfXR00HFqVPvANIk3TUF7NIll2sZ0K456iKwobfKE
 DoZg==
X-Gm-Message-State: AOJu0Yx/XzaHjES41PC/4GltPmzQ3kn5dscBTZZxMOepvcUNwc/d+TrP
 rnyqltZzBvDHgY5osDfQcrZ1AJurIC7PdknRg+7wL/J6sK8gmkNP4i5LFlVpYP/5+fqNejO1MMB
 U9Mg=
X-Gm-Gg: ASbGncvLknSH/Xep4qAcFDVN1ax2YsqdgGh7eS8iYOarwOsDvl2q13aDN8qJtkAiwPF
 GQYx+1SScJRlrq+ZlJUNq3O/y0JCPLQVft1cfZKag9OzBE1FUARGJPgOKsEYiSb8WMsZv24AQXX
 5cWo2AB36Mi37YZqAP8YqLIskKNxxIdEkOboG3W1AzgNgTTJpFMmUTB2flli7i16uhswx8CFssL
 U86agwnP0VTzHH6mpzNg8z5jeJiwxT5G0W8RmvR/jqkMNqbjmgZMtyln+4/LUPL5D+U8y17ywn3
 IOmrSApEC0HAUGOML+v4iZYc5VifCBxTQwPsO4CHYnLpp0/ZS12a5UVevNKJ/XDmTA==
X-Received: by 2002:a5d:6d86:0:b0:385:df43:2179 with SMTP id
 ffacd0b85a97d-38c51967fd9mr10269078f8f.17.1738401337027; 
 Sat, 01 Feb 2025 01:15:37 -0800 (PST)
Received: from localhost.localdomain (232.170.88.92.rev.sfr.net.
 [92.88.170.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc1317fsm118446185e9.8.2025.02.01.01.15.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 01 Feb 2025 01:15:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jared Mauch <jared+home@puck.nether.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 devel@lists.libvirt.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/7] hw/arm/raspi4b: Declare machine types using
 DEFINE_TYPES() macro
Date: Sat,  1 Feb 2025 10:15:22 +0100
Message-ID: <20250201091528.1177-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250201091528.1177-1-philmd@linaro.org>
References: <20250201091528.1177-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MM8zYUyxuDVe

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. Since
we are going to add more machines, convert type_init()
by DEFINE_TYPES().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/raspi4b.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 1264e0d6eed..5c78d26f957 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -121,16 +121,13 @@ static void raspi4b_machine_class_init(ObjectClass *oc, void *data)
     mc->init = raspi4b_machine_init;
 }
 
-static const TypeInfo raspi4b_machine_type = {
-    .name           = TYPE_RASPI4B_MACHINE,
-    .parent         = TYPE_RASPI_BASE_MACHINE,
-    .instance_size  = sizeof(Raspi4bMachineState),
-    .class_init     = raspi4b_machine_class_init,
+static const TypeInfo raspi4_machine_types[] = {
+    {
+        .name           = TYPE_RASPI4B_MACHINE,
+        .parent         = TYPE_RASPI_BASE_MACHINE,
+        .instance_size  = sizeof(Raspi4bMachineState),
+        .class_init     = raspi4b_machine_class_init,
+    },
 };
 
-static void raspi4b_machine_register_type(void)
-{
-    type_register_static(&raspi4b_machine_type);
-}
-
-type_init(raspi4b_machine_register_type)
+DEFINE_TYPES(raspi4_machine_types)
-- 
2.47.1

