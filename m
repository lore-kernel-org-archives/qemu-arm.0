Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5080301ejc;
        Thu, 31 Aug 2023 06:08:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWPV6sT26fC+XXu3ZTyqG0kYTjPyOIifVKsJlOcVl/wwIZjrYlOBdEs2LfaxSRHtKB+8ex
X-Received: by 2002:a05:6214:4012:b0:64f:8c05:8fc2 with SMTP id kd18-20020a056214401200b0064f8c058fc2mr4236764qvb.51.1693487281669;
        Thu, 31 Aug 2023 06:08:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693487281; cv=none;
        d=google.com; s=arc-20160816;
        b=PXMCCi3ga67wxBPiNrGCWy+WwmBQURULkCZ/OuxKayw+Gal9Z/ZGRWlg5L9fAMjRcr
         xMi5VnI5z3HFcbduPifWbmVWp2tFv/YLkgbdqKyrYmcxMnZWRNLvAraaqrzwnjx1FXUL
         rf45GmxJFhCmLcaCOtULM5LelSF0muQZY18fO1mu6Hy7V89wV0CzaLL3jcnrOFnsPIs5
         CkKR0rWKHt34vmUkQ5xmQrM+3SzDUh9+BAYkg4WTkF7pcvb6Ys5iKs2J6SU/mXY0ozJ/
         DJ23uKhVDRC7FncMiz5zidJhBcUdPazVAp6+XIbVCJpHg/jGYgrdr47mRMwzOBJoKPcO
         72vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=24nF/N+YzUtE3HhDlO2XU4XzAEvrvbZNN4parmEdVAE=;
        fh=7DvjPb8ngx49dTsKIGB6exd/tsDYFhAD7t1B/G+l5Fo=;
        b=JLtEfgVCKyFH/jI1IL/6cJAG5qmaou2t91IRIU9/WxcbnrmCDi/g6L4eOh1bHEFSsN
         BVRRCSCBPuAUpefWjo1o5vnZk8nU+W5b1AOhwytGJVyV+At0N9nA37gG5wM05CPTXo20
         5i1BhAqHydL5VE6wVrESUsubmWA9Emn1ngJX3wg7Rl5QSRnU403tRQ1Lia/dKZgVpTVP
         d+AV4g+6IiNUtA3caeMVqpUc8mPkvHzHx/LL7jql+JH7sdfLGUBGeb8Ydhsu8QlN718n
         Et5Ok9MRxMdJK9U6hXcWjwSCBElNzTmEFEMp6DlHV4qiGuswQGh4TmRlIPqw6Rmjaijg
         7fkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AdqSwMeS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3-20020a0cb243000000b0064c0cf87587si843110qve.289.2023.08.31.06.08.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:08:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AdqSwMeS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbhKy-0007Jz-Jg; Thu, 31 Aug 2023 09:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhGn-0004bL-IU
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:59:37 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhGg-0005w8-32
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:59:30 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-52a1ce529fdso996079a12.1
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 05:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486762; x=1694091562; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=24nF/N+YzUtE3HhDlO2XU4XzAEvrvbZNN4parmEdVAE=;
 b=AdqSwMeSmeNpTUxF+OoIEvGdlgYKiIQlQFeWvycyrkJt6VfM8Ai8r42IKy/SdEHFId
 SE+6OSAoplnWZJxnthYiHgaCmsolT06mSriZPNBfnaRFaag+yLZKVgFaoeOkUOdj+arE
 OXXaPDLzrHu5p40qzzbJ0W6Hbrkz2u1MVwKGx03KbzTq+xXKCCiuZwGwPY6L/vLUAm58
 SbCx9EaJoVXznyVSIWzUVTg/Q9o+3bTJnnwILOsyUL4dGoI8mMgOBPlUBbl7R2FZUWhn
 qrV6C7E3bv7L3ENXpO3m+zeMQzd0W5pasiyX1FH2LlJTG7Z0nDZOqvPeRyUqhMoK2+gC
 Qe4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486762; x=1694091562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=24nF/N+YzUtE3HhDlO2XU4XzAEvrvbZNN4parmEdVAE=;
 b=AiAWAtlarqsUujWBPvNrmoXUbQQkXja5IR3toogTu7XyDgk4WMM3tpLVVwGxxzZHtJ
 t5akzJHn4LW0KhZlxQeRL7JaAgu8naqPjLobIESyc2oz7ty6ze2qc4LCqvw0wYNxrCDR
 fEo1MfZ5miT4hAiEAgVkCCoVsXVCzxU4tCdy8cSIgsVUxQNti2pUcIEHaAlAqGgM+8+b
 FB8+Jdi/KOsPZrjFBX89fBMsAryPp2Ahf0vW9t9sa8dbFiV4nHqe73yE0EvNKo6ZdAXl
 Njqf9IxXjtueAm9y11G3mjdFmicvBpNGUjDD9gReVR2sj93dL4lxcQfCUsoA15nIKH0Z
 8Y6A==
X-Gm-Message-State: AOJu0YztDdI+NgzVAkXlyBmZyQ194G89CxV0B0Nfyc/sdRiTcs6JMPtM
 2S23Kel0JbRHXX+WxmNhPnsjhQ==
X-Received: by 2002:a50:ec95:0:b0:523:b1b0:f69f with SMTP id
 e21-20020a50ec95000000b00523b1b0f69fmr4078743edr.32.1693486762097; 
 Thu, 31 Aug 2023 05:59:22 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a056402055300b005233609e39dsm777727edx.30.2023.08.31.05.59.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:59:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Titus Rwantare <titusr@google.com>
Subject: [PULL 25/41] hw/i2c/pmbus_device: Fix modifying QOM class internals
 from instance
Date: Thu, 31 Aug 2023 14:56:27 +0200
Message-ID: <20230831125646.67855-26-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: ePFd+jjAlOfZ

QOM object instance should not modify its class state (because
all other objects instanciated from this class get affected).

Instead of modifying the PMBusDeviceClass 'device_num_pages' field
the first time a instance is initialized (in pmbus_pages_alloc),
introduce a new pmbus_pages_num() helper which returns the page
number from the class without modifying the class state.

The code logic become slighly simplified.

Inspired-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230523064408.57941-4-philmd@linaro.org>
---
 hw/i2c/pmbus_device.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 44fe4eddbb..8bc9d5108a 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -190,15 +190,18 @@ static void pmbus_quick_cmd(SMBusDevice *smd, uint8_t read)
     }
 }
 
+static uint8_t pmbus_pages_num(PMBusDevice *pmdev)
+{
+    const PMBusDeviceClass *k = PMBUS_DEVICE_GET_CLASS(pmdev);
+
+    /* some PMBus devices don't use the PAGE command, so they get 1 page */
+    return k->device_num_pages ? : 1;
+}
+
 static void pmbus_pages_alloc(PMBusDevice *pmdev)
 {
-    /* some PMBus devices don't use the PAGE command, so they get 1 page */
-    PMBusDeviceClass *k = PMBUS_DEVICE_GET_CLASS(pmdev);
-    if (k->device_num_pages == 0) {
-        k->device_num_pages = 1;
-    }
-    pmdev->num_pages = k->device_num_pages;
-    pmdev->pages = g_new0(PMBusPage, k->device_num_pages);
+    pmdev->num_pages = pmbus_pages_num(pmdev);
+    pmdev->pages = g_new0(PMBusPage, pmdev->num_pages);
 }
 
 void pmbus_check_limits(PMBusDevice *pmdev)
-- 
2.41.0

