Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp608887ejc;
        Tue, 23 Jan 2024 14:25:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8DjncOTZV1kYN8pC76XjaDeFktSwMzIGBpl7VfDqD5EynQKmijlQ4UNNCZQlHbmZGfY8E
X-Received: by 2002:a05:620a:1009:b0:783:42dc:f7f2 with SMTP id z9-20020a05620a100900b0078342dcf7f2mr8490423qkj.57.1706048744468;
        Tue, 23 Jan 2024 14:25:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706048744; cv=none;
        d=google.com; s=arc-20160816;
        b=eBCqUN6FwDDulf2SdZ0I9o134FtDlNw8yar+us3CCsHdpyzJmRS2q0MKmqsbpaaBik
         S0T9gpl4ybZQpf4+5QQuyqYl1QiOcHHkJXPbRdTHF89Zqu0IQW8von37Q5O7mAHydKWz
         0qVKryPon6fjqTw2fctUKjteT4lKGIm46Xi6DCT4s+XkSZUML2gaQSqLCcxc64Ze1AnD
         79UicZujwS0M543uHfKNY97FWurW1AjPpbpJPjZF078p5OVSpDm51IrIMpU6fkXbjDAD
         ApdTzErU/ie4F/RS0RWtvOWKTp6IM3b6bsE0jOW8c5o+b4Cb6nRXK3jhqZu1CFBPJtb5
         PSaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=40uyL4jME8rKLPBjW65z9H56g3H8ne6EwTmJLAFXlkk=;
        fh=vCRQ4SxBRaw/scGiJ+6DsMj2AC960SBJLYr7612eZsc=;
        b=smxZUeDYZlUHur51wMrfY1d72w3rCp/+iQtDY8YCKTn23CMnkaBRnQHOyr3FcQ/RyR
         zphzU/GBQpQ89CeG8a9yEwslyBYKZcXtWQaWfoB70yZRBsBqbg7lKx7lsPLhm7506Erj
         1YVLY80CfKNB8Cy3lH4oJi1zasj4LyRc5xxjOgg+3fDxZFfAB0QteJmu6pCwd+5ORT49
         i4ByD4rPZrAaNqrYSvQ5sbEdhdmDcUDJVoK2/gaF7kXDoNiJqeGw+t12h9lArfSUp8i4
         BH92JMhl2nBEcJHWSY6vuXLv2PuzXIGaSFV572zsnEayweqZ9mr8xoUPuEBRQkIYAcMz
         HFSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OdTN7GTp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15-20020ae9e00f000000b007832941b17csi9093139qkk.173.2024.01.23.14.25.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 14:25:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OdTN7GTp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rSPCu-00053C-8p; Tue, 23 Jan 2024 17:25:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSPCr-00052G-T9
 for qemu-devel@nongnu.org; Tue, 23 Jan 2024 17:25:21 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSPCp-0000gl-3t
 for qemu-devel@nongnu.org; Tue, 23 Jan 2024 17:25:21 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40eb95bd2c6so15507755e9.0
 for <qemu-devel@nongnu.org>; Tue, 23 Jan 2024 14:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706048717; x=1706653517; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=40uyL4jME8rKLPBjW65z9H56g3H8ne6EwTmJLAFXlkk=;
 b=OdTN7GTp7DgZKJzLf9yS84qlNMu9AbSsKcu8gOqX4iAhN1MLPUsXj6E3CiOpzwYiHz
 hwFy6/vMzRgjrvgTOR1mFuO5b5yBaNlPP9+gZlHPtZYbTsuJ8tKkW3afjdGVL2PpcTij
 IYGaVblQxspCR+NAVgK4tcFUNWCPHy7FjvXuVHegVlF6f6mPMpPjfu8Hm5QRSu6jEPxf
 T7dTUXnc+hCJvl2srA/3zo+QcKsVcZnq0bJtaQ9RTvVUY/IU56Wf9ZsU11dOrO+sa9Qy
 HzM07LlEorQ5I3Df9iGJBNQgSeOzt8c12pYDvnqxsjAVdlFIDPyWV7XSeGC4EvTwdXip
 dSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706048717; x=1706653517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=40uyL4jME8rKLPBjW65z9H56g3H8ne6EwTmJLAFXlkk=;
 b=Ze++lzs15C/rnPXqTDc8GmFXanNJzvFTn4MxlJlBeQuBsDj9TkeToSJhUP3Prk2bt5
 9idaKSi2bJJNdwH1XwxCYLwe6JO8B4p6G5ce2XjA5CKrqErAAUtR4StiCJGvzPgrOlYW
 ACARAToMisDZnjgK64yS/lpGSVOagjedHEWFj61QBJkueENK+9D9GzCi80K9XQKV3uJH
 Sl92UWMP/tmvxNkMCCjzze8ixkwp+vLoK2Sganp5wIwB7hWDvDPWb8jQPWR//YUE4dJO
 CTGO7vjyzRbp2J4qtmeodBgMGstZ8nrrasdceNNyJ1N6XkZJPMKSj3K72diqcsoQ56go
 B6fg==
X-Gm-Message-State: AOJu0Yzxyalrk0u0eOlCDEANHriFkHHq6Nq9zTmnKeqc5eL75I81rSm1
 icxQLMeI+IjR4ZJ0uaQthjBdK9/W1dT2ItmvmWLStp/8+fQlrT1M4TqZxQf8934VZOuK4Gz8/+Z
 2
X-Received: by 2002:a05:600c:5398:b0:40e:4afe:12eb with SMTP id
 hg24-20020a05600c539800b0040e4afe12ebmr535181wmb.188.1706048717477; 
 Tue, 23 Jan 2024 14:25:17 -0800 (PST)
Received: from m1x-phil.lan ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 cf15-20020a0564020b8f00b0055c903e61easm787321edb.82.2024.01.23.14.25.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 23 Jan 2024 14:25:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Rob Herring <robh@kernel.org>,
 Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Gavin Shan <gshan@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/6] hw/arm/exynos: Add missing QOM parent for CPU cores
Date: Tue, 23 Jan 2024 23:25:03 +0100
Message-ID: <20240123222508.13826-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240123222508.13826-1-philmd@linaro.org>
References: <20240123222508.13826-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: jV5ov9X0U8CL

QDev objects created with qdev_new() need to manually add
their parent relationship with object_property_add_child().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/exynos4210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 6c428d8eeb..57c77b140c 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -556,6 +556,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     for (n = 0; n < EXYNOS4210_NCPUS; n++) {
         Object *cpuobj = object_new(ARM_CPU_TYPE_NAME("cortex-a9"));
 
+        object_property_add_child(OBJECT(s), "cpu[*]", cpuobj);
         /* By default A9 CPUs have EL3 enabled.  This board does not currently
          * support EL3 so the CPU EL3 property is disabled before realization.
          */
-- 
2.41.0

