Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2679254eja;
        Mon, 6 Nov 2023 03:09:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8nXJShmUQrjQLiK694Gbtl5ZF0umF/S1WOZWDUoqu0lcEIeYLA+c+D7qH56b7xultitMU
X-Received: by 2002:a17:902:c412:b0:1cc:c273:603 with SMTP id k18-20020a170902c41200b001ccc2730603mr3429422plk.42.1699268971809;
        Mon, 06 Nov 2023 03:09:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268971; cv=none;
        d=google.com; s=arc-20160816;
        b=SHLVPDiaKRkbPUfVU66moImXfS8DNIY68RkpfaPlXQ53L1PrfLJbIIw9X6bZAcIg6m
         Z3JnU3ENlPo86SiGuOJiLjJxbusWQXtbCr/5FbFq2qINEyYNCZWS4X1TGpeNLL15mJaP
         wCJqZch0BY+ibmCeEVEzrarHGDruEX29emZ3fF5fP+whMRLUyHsEAxtA6VxNBPKEaAr7
         10yTZvyo2KAJUhPdhlFZ4TeHyjC5wD3VH+6OtA6plf1RUO2K/aVQhBjNM+qje1xbnAMy
         e79+JYs+fUhsebSp9Xeeq3bqjJtYCdtm5iA5uT042ymPRUJLrWmopDx15rJE37ee9dtG
         VGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=X3TRJ7mvtWFdvHNvT+G6kpqIlBzXe7wSn3LOLdu3gVg=;
        fh=c1Hsd908U9PKLwue3PgIR6OEtkIdu11a71wsyXYOJoE=;
        b=SgPJIMDuhQ55bCnRkm37K1Wx94Mk95bE775gzA6Mb6jDpIabseAeqLq9Jan9aTWKxS
         zfaC5HPPx2iSfv0p9oDsziCJyQuP8Ow+U3VYvBZK5/H3aMVVafSjc7q4uQUu4HI8KX0b
         NRPvjNxNPj8+O/2DFDrrFIIpsOP1wVbYiovJoSWaYF9Z5W2s2GBBxtkp8LDjfgYXlGhr
         T+oiET7t+pAAr2eDKFN2WJL6vf6+wG/gZznMftChXN6r/o4UWz6TRtFNdOP8o+qoSHfp
         0rpWIO6QczE/tlhITbgdXRg4CasDxa/VYl0qqchjQ8lPSytfnpvW987E+0vPmUSaoLIW
         JSqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OOe5vG9a;
       spf=pass (google.com: domain of kvm+bounces-719-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-719-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-719-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id i10-20020a170902c94a00b001b81a112f9bsi8356551pla.586.2023.11.06.03.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:09:31 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-719-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OOe5vG9a;
       spf=pass (google.com: domain of kvm+bounces-719-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-719-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44D23280D7B
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD9F18B0C;
	Mon,  6 Nov 2023 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OOe5vG9a"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F5F1BDCC
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:09:23 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FAF7FA
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:09:21 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40837ebba42so27346555e9.0
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268960; x=1699873760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3TRJ7mvtWFdvHNvT+G6kpqIlBzXe7wSn3LOLdu3gVg=;
        b=OOe5vG9a6beO9wl2CTEWZvgsrja2Y2Fee/67KVeV3+8BholjyGgrMdjN3tT6JTOgQY
         CHLsIWpQzvWMnWuOr8bPfcqzsmIXFukAiIcKpmPOCkhTQHxC4Pf4FtZbWtC6Gsj2KElz
         ROKmE/JoGDmBIb7tWKPAXZLE/hdGsgMFBAiwmyFZcNYo7Lgi5xX/TZ3RFMpWIZF3O1OZ
         ks6sPp+aL8bk9v3JkfjMu3ATN6Yo7+BZqf/YFfuBAUlrzwPtcogi2X71FVw3frULq0RQ
         VmjqeOrnwX09H3VWzQLbdxs1FwRKgGfmrNtVse/ZdCrVQpj6n0qad3n3eTUghDttUjl8
         1R2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268960; x=1699873760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3TRJ7mvtWFdvHNvT+G6kpqIlBzXe7wSn3LOLdu3gVg=;
        b=KFNs+2rluSERaTVktprhKCyxllMv5QtO6mc7muvvFD0EM67aGdWwPE3tf8hmPHhczb
         P8+NMhKP0FbvAOFqx54/kxX7ex4q1SzduFE7e4as+zRtWuiWmaxcvbHRon4zRyGOP5KT
         /f1bOBsa0+5Ejb/cG58PhZVzjykBGX3zuxQng403P0kXfY2JybMlI29YWfZmqTsHhQBI
         ntQhXA63sMv9AlqdYh2U8TCRw3wSaU1g+2cCJZRWBH3j4DipZgUJK2J673rpvXUrv/WU
         7/vy/x6zHvSacMezHrxoGa08NR9Kta2swKFBkClBJyXqWgSZj4GzM2o68+RvW4UVDeAj
         /3Pg==
X-Gm-Message-State: AOJu0YxQ990ubCNLtBdKU37FrocJk+Z5TScfUtmfCh1uGcLjzHdBtlwg
	7ohfDPAFGOcwShpdbNwoG4TeDw==
X-Received: by 2002:a05:600c:46c8:b0:3ff:233f:2cfb with SMTP id q8-20020a05600c46c800b003ff233f2cfbmr23090503wmo.23.1699268960044;
        Mon, 06 Nov 2023 03:09:20 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b00405d9a950a2sm11977070wmq.28.2023.11.06.03.09.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:09:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Titus Rwantare <titusr@google.com>,
	Hao Wu <wuhaotsh@google.com>,
	Corey Minyard <cminyard@mvista.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 50/60] hw/i2c: pmbus: add vout mode bitfields
Date: Mon,  6 Nov 2023 12:03:22 +0100
Message-ID: <20231106110336.358-51-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vX0Rn1EJe0ZL

From: Titus Rwantare <titusr@google.com>

The VOUT_MODE command is described in the PMBus Specification,
Part II, Ver 1.3 Section 8.3

VOUT_MODE has a three bit mode and 4 bit parameter, the three bit
mode determines whether voltages are formatted as uint16, uint16,
VID, and Direct modes. VID and Direct modes use the remaining 5 bits
to scale the voltage readings.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
Message-ID: <20231023-staging-pmbus-v3-v4-2-07a8cb7cd20a@google.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i2c/pmbus_device.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 7dc00cc4d9..2e95164aa1 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -444,6 +444,14 @@ typedef struct PMBusCoefficients {
     int32_t R;     /* exponent */
 } PMBusCoefficients;
 
+/**
+ * VOUT_Mode bit fields
+ */
+typedef struct PMBusVoutMode {
+    uint8_t  mode:3;
+    int8_t   exp:5;
+} PMBusVoutMode;
+
 /**
  * Convert sensor values to direct mode format
  *
-- 
2.41.0

