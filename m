Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp219237eja;
        Thu, 22 Feb 2024 04:57:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW/vykiC0IDnoMd4GkfhCVl0kQAwDLJSabCPtCVdh2+pRRKNkWEM2AeaiJdiygtj//lDBE3z2mlx6VH2oL/U8YXiFMXjQt7
X-Google-Smtp-Source: AGHT+IGxMpB7jWCgdsVHphug4pJSKmBnejOmwh1xRwqFrtcB79xsxF+EzHjAzZkk4LF0JuLIXlE5
X-Received: by 2002:ac8:5815:0:b0:42e:1f39:e653 with SMTP id g21-20020ac85815000000b0042e1f39e653mr11381431qtg.65.1708606629024;
        Thu, 22 Feb 2024 04:57:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708606629; cv=none;
        d=google.com; s=arc-20160816;
        b=a9EESC8x3+J6R+Qvt+qZ8x8dl+nHIQIZEQKErMYj1jMnoYFneipM45E/7uldLBcDp+
         od+NriVFPfyDSBbio1vrZHKcnt6FjYYCLl2nTr3AxoPQDVHBEYcjADk22gQJnIBpXu+s
         3oJrLmkCM5JU9AJ5mOQhAct8NwzCJ+P+JumexwEuKsIF851TmPj4XkbcJ7yziAXQG6LH
         j2Plg6LB3kUxVSlwoj5Wxbhoh1IUDV9fBS2M4nvYoFFhmtgeG7YhdJfhhJs97q4Eg10+
         H1KhyZM1D4LjYrlB5ii4zGhcsBaEt71YbYZog1z9EP4Ek7hhpnPDKsVXPXQkloLJbgVJ
         4lmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NITcCbTrMmjEc1uhZkNKiyfNNYFXJBPxx+OU8JE8tD0=;
        fh=T5vXk0CNd69fX6X9vOQTIObfaHhQK0vhf568q75Yz8Q=;
        b=depETb1EOWlP8DKQMqmr3Dn+GAK9MCZ8da1vN9K8C+P81vct9nh8NJc312wGw8U78r
         BHdIqHFQyaOkl8gg8ETHyc+z591G0KhKJCmlcABz1S+dYGjJVa6+SjMDVBjlXMnCUVBa
         0bjPuDBhuYKKn67Jg24JstrERc1M4IoRNqQIYiqFUWkoJoytrgK4Rk/zXMl351d3yXPh
         C36sUYbcay4wGMV1vsyKrCo0mPmb2a1luXotnphtvH0cNOju8YMF757Hchil8gxrCchB
         wisOyYfwOFcWHyoa7QkV6xQMjQ39cUMA4qKflAIkOZicUcJFi30uqqox+m57wUEdGI1d
         F7AA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NiPFoOWx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl24-20020a05620a1a9800b007879e6bd725si1141671qkb.638.2024.02.22.04.57.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 04:57:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NiPFoOWx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd8cC-00066S-86; Thu, 22 Feb 2024 07:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd8bw-000608-QK
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 07:55:39 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd8bt-0004mg-N2
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 07:55:36 -0500
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-512b84bdaf1so5638811e87.1
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 04:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708606532; x=1709211332; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NITcCbTrMmjEc1uhZkNKiyfNNYFXJBPxx+OU8JE8tD0=;
 b=NiPFoOWxhJ0SaA3o8YgxJRYJ/wOrTw4etA1Vu+yYed4+zNwk8oOD9uWzpBvfTpSukJ
 QmJADSLv7mBNCMeyKN9Mi1AQQXlUpOubhNEDIxTj3grzxOdvk/h7rj9Zy+KhFegUrpTN
 4zl9NtKGbTXUUZEJ5f+yp/4L7h2TkbwvZmYoVhnXjX346grm76ntgIZF1kzzgLqJ62aE
 vWv/cA2qgvcyK//udiucbKpwc6sHLyKPju9fJj3rgF2c6Z39tiPxCqPLcFcbfi+b5u6k
 MOSna1OM2yG+JpeJhK23MwNXwUBtZIRJn/QtXc0OddVA0bGODYSqMC3NE4SM8dxy8ah+
 V0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708606532; x=1709211332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NITcCbTrMmjEc1uhZkNKiyfNNYFXJBPxx+OU8JE8tD0=;
 b=smKadX2AebZCMRsas3nxO8a2h/c8e3o+QSt3aVn0pgvVfXBHmwDZ2EiL2b7OxUjbcR
 2hqQl7heGF8D23f58TyrKNdHpLZ0IDDMGkdoUpa7wuU56vrIslLjEfra0roE1WxOCT9K
 6qzSvopfpjbJoA5G3Jvai2VQ+7hltN9RvOHsvFKnEMVxB/yQ23DZUrGCZdnQiBhplhZz
 WTGsTfyjkPHXcYdxv1apbg4wLmixkZkhsTb2S9CSfyZn23EJDVlnxL3R06KXiiz8DAdc
 3NyfuKuSd1fHbaeA91TvaA3cUy/fWKdnQkeQDqDBErU+kuH8KYKMAiU7lSjXZqCTMub+
 5P+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy8KGGygeg3+9p22bprU/olS8wP6O9AJlUAoTGO2A9PVk8kd3eKfrWFd2ERwnZECuT0nOLqp9K+qK9Vf9fOKvxeh7m
X-Gm-Message-State: AOJu0YzzeX2bh9zH50G4QpySbR4aK4cB5ftIn5bjpfOx7ymV0AXeXEL7
 cjRQUa0jW9cz1jrClNrrLjrBThc1TPt0BxaCQaieo2DJyQrBMn82KXCp4HlIdFw=
X-Received: by 2002:a19:650c:0:b0:512:a5c6:499c with SMTP id
 z12-20020a19650c000000b00512a5c6499cmr9291184lfb.12.1708606531957; 
 Thu, 22 Feb 2024 04:55:31 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c358100b0040fccf7e8easm6348704wmq.36.2024.02.22.04.55.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Feb 2024 04:55:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>
Subject: [PULL 08/32] hw/ppc/pnv_bmc: Use qdev_new() instead of QOM API
Date: Thu, 22 Feb 2024 13:55:10 +0100
Message-ID: <20240222125517.67131-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240222125517.67131-1-philmd@linaro.org>
References: <20240222125517.67131-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12f.google.com
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
X-TUID: qO2KXlyPzydm

Prefer QDev API for QDev objects, avoid the underlying QOM layer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20240216110313.17039-6-philmd@linaro.org>
---
 hw/ppc/pnv_bmc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
index 99f1e8d7f9..0c1274df21 100644
--- a/hw/ppc/pnv_bmc.c
+++ b/hw/ppc/pnv_bmc.c
@@ -269,13 +269,13 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor)
  */
 IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
 {
-    Object *obj;
+    DeviceState *dev;
 
-    obj = object_new(TYPE_IPMI_BMC_SIMULATOR);
-    qdev_realize(DEVICE(obj), NULL, &error_fatal);
-    pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);
+    dev = qdev_new(TYPE_IPMI_BMC_SIMULATOR);
+    qdev_realize(dev, NULL, &error_fatal);
+    pnv_bmc_set_pnor(IPMI_BMC(dev), pnor);
 
-    return IPMI_BMC(obj);
+    return IPMI_BMC(dev);
 }
 
 typedef struct ForeachArgs {
-- 
2.41.0

