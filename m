Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2956135njc;
        Tue, 25 Mar 2025 15:46:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW56GrXzRIv/zlQ3dduddngtHAlTbIDlUBCQPyDKCCS5D6dn/cozkrtseZHpHKhiB7NJXfSvpSYaeQueQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGkGBGOQzDeUR1iNfpMDSzsVifcmpqRqDBfsoGOUndLwqq4t+gNXpjQOhrlxKgw/KwduyNG
X-Received: by 2002:a05:622a:5587:b0:476:6189:4f2b with SMTP id d75a77b69052e-4771de5d20cmr236714781cf.46.1742942763820;
        Tue, 25 Mar 2025 15:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742942763; cv=none;
        d=google.com; s=arc-20240605;
        b=eD9mBWzKjiaVotVWAM2iaMGPW5E78h2Nsd4V/HSaBIwO5s4na3fw9s8PZ0dHyall8C
         clpyjZTbgGZO8aqnIXphK8CcIn+G1kujtri253hOyS5YS24sUJu0+s8zm3iUz1iBGFZM
         8YdHpXdoBL560/8jFc/nDIl1zDe2gpo8gdZ3+DJCL1L7PqVOPg97+hsc7thw5DEwrvqc
         KIEORWDKMLtPmIWzj7+C9AxKKR/DvQK0WuBeCdqEz8M/4OBQk2Jjn561TNIZXGsZ7bM+
         +MwziTrJTwEkd+PVaY7WilInlmyAErw3mLdnXwx3DFavtm7StpZ/YYm+IPQ5PUPVn1fN
         9mOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rRDzb4lcoabfa1g7TNESo0TRQTsJDJlMbDcBcNVFOTk=;
        fh=o4n70Jf9nfhEXkobOwTWicHHOobb46BiL7k0JNoLHtU=;
        b=agjOy16L6G0u20LIqcl1qhEKUxIk+M18Slt56oS2uWV+RTnGr7OM6XoSy2N7ZxOLlw
         8IhdKrZ1pJK5RUb/Jh2JPnEpckp/jKA03jmJ3pon1jYsD3kompKuCDlc42gPGKkuSr4u
         pLx9eFpr/yxhu99kMlW3gzeFHzW/h5MyHd79BqiZs2cpVVP2xLqDI+dU0dUTNPLiEMe5
         k11GRpjBpKTZEmcNfLFDKxzPFgTN5N00ZGAF0vFy/O7amcNAPZudubWlBVAb9AOCmwi2
         X+hWk4adZPfrLn5ThY2jRaYLAnsCS/B4sqknwfizrOOiuXthEVI+McEPAaP1PYJzsLoA
         vdHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wTPWNk3c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d644d04si105908911cf.599.2025.03.25.15.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 15:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wTPWNk3c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txD0i-0003M6-SP; Tue, 25 Mar 2025 18:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txD0O-00023x-Oz
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:44:21 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txD0L-00076L-It
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:44:20 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso60891365e9.0
 for <qemu-arm@nongnu.org>; Tue, 25 Mar 2025 15:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742942656; x=1743547456; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rRDzb4lcoabfa1g7TNESo0TRQTsJDJlMbDcBcNVFOTk=;
 b=wTPWNk3cyN+IV0t2U7Ul5bXcNcZ0ImvJGn7+KmwU2FV62F+Nd2c94u7F17v6Phq2eG
 khvx5h4j6FhuoPPX1TIBX5XNkwUvlzGv5liLmWU1kGRW44mXnIhz5jG0BMvp242s09Q/
 IhscxvM+dVfCaugQJLpIGY3uj5fe6x4dQrgCb0lYBtDeNU7T0BsCRKF8egKKHlqns8JG
 StXQtgg1jlWB2jOgo07E2+7XfW7UNKqek470mLwJBCPGgPdBvBIzPBNT48mNfs31HtYx
 5Jwz6T63GI/9khEuZBDDS8wkIHfb1TdOs3CVfVCQOCFpYNyOxAH6VfI0MfexBdgU/rLm
 djZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742942656; x=1743547456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rRDzb4lcoabfa1g7TNESo0TRQTsJDJlMbDcBcNVFOTk=;
 b=hyexhsJ77nHj21cojqAhEF4DERlRr99lMQF6fwToX8NxiQ8oBy1fQia7lPJQ09Q5zH
 6Y2r7kO2jl2dsOFebH2ooVxycnO40/BDHr+/LyNAMGWOckioujrfuNDnuyxw0hxq8nKO
 Ovr1s1w91cFda6kzI+7CER3ISw8uF8O2ORv8UpEF7ZPYHnZCa/iaqCQQ86BKTzO290M6
 idmMzUSChuSCOqTinqZ0uKXNXRK8VqD7feb5CgTXDzfFlW1544WNUQdAXzqrXCW1Qz1X
 5/dpDUKobp37qzw9AFL7Stmqpsdfw19jSATYsHkEvX9j4b7eMvVOkcJHHLOM4qBQyuqT
 NQQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj8rqJ/orMR6rn/OEiDdzvnf4QKYsivi79Ynu+CfcoX26THZ74BchSKpk+q//O83+REp3NqiVPBg==@nongnu.org
X-Gm-Message-State: AOJu0Yy+VMfa8UVC3i4o5x0/kC1jt+Npi72q0FBffBjtme2dneFdn/v8
 mbcczxLSj86EOYuZyfVUsgCUP2b73jOEO/vLbAOiRq9Rjxc41fdZaMoAvK4E6QE=
X-Gm-Gg: ASbGnct/YlQYblIvVpkM4+3pRw1vzUMOp3KFoWH7lKeuc89JJdpk5lhXBNpm7CAK4p7
 KmIoNAkkRkVlY61GZJidVlxrl44WYS/e2bYGf4pZNSegFxv6LycsN+sBefTkaIg7Flvrt1P17XF
 nKHLwILXvBTNiLOqgrHjWNbQmcnu642tUk5tLOQ/Nptm6V5L0a/WLjMY6kPbu92TyMD5aDEtaQk
 E/bnNoDmf/TsZ7WYsdbY/BIB12k16U7s4oeVEwRm6G0dq/aSMwUwWHIuLJqVlXN7JIa0L4ZYxPY
 UzK/E4ld1ceABQVWQP2SKHchPpkcIBtEUe7gVOWArd6IlrJv15TeBRnL/nEJLzBBUbMldK/YkzZ
 xDT0RDCWqiUC6ApiRiljjcOWmgIhGUg==
X-Received: by 2002:a5d:47a5:0:b0:390:f699:8c27 with SMTP id
 ffacd0b85a97d-3997f902e3dmr16502105f8f.12.1742942656024; 
 Tue, 25 Mar 2025 15:44:16 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f99561dsm15172846f8f.12.2025.03.25.15.44.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Mar 2025 15:44:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Glenn Miles <milesg@linux.ibm.com>, Samuel Tardieu <sam@rfc1149.net>,
 qemu-block@nongnu.org, Patrick Leis <venture@google.com>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH-for-10.0 11/12] hw/sensor/temp: Categorize and add description
Date: Tue, 25 Mar 2025 23:43:09 +0100
Message-ID: <20250325224310.8785-12-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250325224310.8785-1-philmd@linaro.org>
References: <20250325224310.8785-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: Z6Bt/y8qfuxB

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sensor/dps310.c  | 2 ++
 hw/sensor/emc141x.c | 6 ++++++
 hw/sensor/tmp105.c  | 2 ++
 hw/sensor/tmp421.c  | 4 ++++
 4 files changed, 14 insertions(+)

diff --git a/hw/sensor/dps310.c b/hw/sensor/dps310.c
index 6966a53248b..e1e6df6b60a 100644
--- a/hw/sensor/dps310.c
+++ b/hw/sensor/dps310.c
@@ -207,6 +207,8 @@ static void dps310_class_init(ObjectClass *klass, void *data)
     k->send = dps310_tx;
     device_class_set_legacy_reset(dc, dps310_reset);
     dc->vmsd = &vmstate_dps310;
+    dc->desc = "Infineon DPS310 temperature and humidity sensor";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo dps310_info = {
diff --git a/hw/sensor/emc141x.c b/hw/sensor/emc141x.c
index 33c1bd330fd..6adb94e7ff5 100644
--- a/hw/sensor/emc141x.c
+++ b/hw/sensor/emc141x.c
@@ -280,19 +280,25 @@ static void emc141x_class_init(ObjectClass *klass, const void *data)
 static void emc1413_class_init(ObjectClass *klass, void *data)
 {
     EMC141XClass *ec = EMC141X_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
     emc141x_class_init(klass, data);
     ec->model = EMC1413_DEVICE_ID;
     ec->sensors_count = 3;
+    dc->desc = "SMSC EMC1413 temperature sensor";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static void emc1414_class_init(ObjectClass *klass, void *data)
 {
     EMC141XClass *ec = EMC141X_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
 
     emc141x_class_init(klass, data);
     ec->model = EMC1414_DEVICE_ID;
     ec->sensors_count = 4;
+    dc->desc = "SMSC EMC1414 temperature sensor";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo emc141x_info = {
diff --git a/hw/sensor/tmp105.c b/hw/sensor/tmp105.c
index ef2824f3e1b..6a38f2c6670 100644
--- a/hw/sensor/tmp105.c
+++ b/hw/sensor/tmp105.c
@@ -323,6 +323,8 @@ static void tmp105_class_init(ObjectClass *klass, void *data)
     k->recv = tmp105_rx;
     k->send = tmp105_tx;
     dc->vmsd = &vmstate_tmp105;
+    dc->desc = "TI TMP105 temperature sensor";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo tmp105_info = {
diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
index 007f7cd018b..ba42ab328e0 100644
--- a/hw/sensor/tmp421.c
+++ b/hw/sensor/tmp421.c
@@ -342,6 +342,7 @@ static void tmp421_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
     TMP421Class *sc = TMP421_CLASS(klass);
+    g_autofree char *name_up = NULL;
 
     dc->realize = tmp421_realize;
     k->event = tmp421_event;
@@ -349,6 +350,9 @@ static void tmp421_class_init(ObjectClass *klass, void *data)
     k->send = tmp421_tx;
     dc->vmsd = &vmstate_tmp421;
     sc->dev = (DeviceInfo *) data;
+    name_up = g_ascii_strup(sc->dev->name, -1);
+    dc->desc = g_strconcat("TI ", name_up, " temperature sensor", NULL);
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 
     object_class_property_add(klass, "temperature0", "int",
                               tmp421_get_temperature,
-- 
2.47.1

