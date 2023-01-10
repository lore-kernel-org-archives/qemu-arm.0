Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3013701ejc;
        Tue, 10 Jan 2023 01:12:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu6QWr5aoaAYcwu5OtBWPwWkbAcVDPvA4VEVnvBghM3Cj1GMvew4p/VRQ7P+bjapPAx3l1J
X-Received: by 2002:ac8:72c5:0:b0:3a6:a86f:33cd with SMTP id o5-20020ac872c5000000b003a6a86f33cdmr91499370qtp.51.1673341969360;
        Tue, 10 Jan 2023 01:12:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673341969; cv=none;
        d=google.com; s=arc-20160816;
        b=h74ZoN8S4RVbkprXMFVweUHSfUcuhJF0nvfyNbbUtsJRT1WMZjXhTwJ+y2hru22Ykt
         Rzs5mDywf28gxp1WOUeozK6uamAMlgess2U4rSKxrsVSStSNvvh4CM7/rRfSdWRBgKuR
         iOuBToFtlwWip4NRPFfNhxbR49x/635seqyeRyRHQloW8hSBF53dz1zRZ49wuYZRiSss
         scmWUrlSW/3ZOUXLdYe0U6zKrovClvwoZ8QpKyvIDurzAdxv0z0DlPwj1iH2JZAAtX54
         8VgSPAAeHwlbpKKXjnMhvCcDLIy/ypvJefBRmRpBgr+aYmk0vVx3kdNKLKNTHZt0INaP
         3SUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QqhX9d7OWrlFhlOYzosdT2uap07wVT4JcGVQZKlWVp8=;
        b=X1a+lXUYR3NVG50ZaUAvXhr9f05Z2WB8hheBKmuUuQNz99pIxM3EEYCugHLYk2iKYs
         3GlfMHGjDXz/bqdWMF0W+F72MZiWSzLHEIgxmQSXT818eHNKhwAZYe0Apr9oJzLA0nTo
         LQs08mB1lQPDbFp+u7Sk9ktodrhk4tKrsBNZqKOxDIvMl2DJyYpFk7Yzukj0hn6M+xW5
         SAG/t1zwVOEqzeODneUbFpDW9ywtjZFfAFtKLYNNW/fWjdk9xcOfebUj9MvZcqR2gYMv
         6RyZpwWYCpOnY+vKejQXEtJqg+RonO5vfTolWWlZM0bcIiQ4FaibHqMk+cW2z09MKgQZ
         0lFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Th+bt4yJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb31-20020a05622a1b1f00b0039bd3cc46e9si6189854qtb.28.2023.01.10.01.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jan 2023 01:12:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Th+bt4yJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFA0y-0006dC-RM; Tue, 10 Jan 2023 03:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA0w-0006bm-Mu
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 03:29:46 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA0v-0006IE-65
 for qemu-arm@nongnu.org; Tue, 10 Jan 2023 03:29:46 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso4684086wms.4
 for <qemu-arm@nongnu.org>; Tue, 10 Jan 2023 00:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QqhX9d7OWrlFhlOYzosdT2uap07wVT4JcGVQZKlWVp8=;
 b=Th+bt4yJ1lcPNJmp7mm2guWyOANYuNWceYvjvU+oRqcRB4ydQ1ifTIcBQBiktd0C6C
 cwcedNwb75CB+7lHWfu2nLFJB9IyBS1sjdh2pE+ItF4XdghndWH08OM1bxukCVW7iiNG
 ttBllF+GcbM5Bi6QyVtkNWCXv/DVs/I0Uo6B1y7KHEVIUAHlSQyp1m+1Vh685t0wQDOT
 7lwxoO2stSbFWbes7TREhQ80c7+gKNziZz4ktlaUvZ4OkudyZD/ulLiMUVY383iA7qJ4
 a61J93MviWrke6JreQEb4GBpj67WYxVqMtrI4MSe5LhwqEM0aoecQdU71i4ttj8OWuM4
 3Yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QqhX9d7OWrlFhlOYzosdT2uap07wVT4JcGVQZKlWVp8=;
 b=qBXGCxSqUCNTnomIFgPMHyFzLo48MnjE2UkuAlowDl9q/HBmYJf4RJlhESHrM6ykj7
 m7Fv26PYGvqKmUzHFoiN8v6iqRaR5636me4/aXiKWE/DTZf/O5KwB55W+zeaRYMWZkpF
 Xl7akvR94s42FhhXxug+ziWvlvKEyKOfO+raQ7IHzG/vWma9ICPXpbFhgoOhW8X/kVK9
 oERLeLLqLg/QB4q+wDJG/oiOX3+1wRL/qRstf1kugKii8JDE6i5D+vQb8Vw04NsiDst7
 U/uubXV3mYpXKCIhfdIMqeqLhiIwq+P3lEgkNo46Xx23vMzWIund2vFI8FpqwELZKkIC
 WKkQ==
X-Gm-Message-State: AFqh2kqmLomeIDlWpZzs4Es2a3S04PCaXhVOd9AwLu4CKcQhSLA9P3/t
 VTD+y+FAPLTOuZnRoLMKNMl9gw==
X-Received: by 2002:a05:600c:1c11:b0:3d0:a531:5413 with SMTP id
 j17-20020a05600c1c1100b003d0a5315413mr47868871wms.34.1673339384053; 
 Tue, 10 Jan 2023 00:29:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a1c7515000000b003d995a704fdsm13949842wmc.33.2023.01.10.00.29.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:29:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/5] hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
Date: Tue, 10 Jan 2023 09:29:29 +0100
Message-Id: <20230110082932.24386-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110082932.24386-1-philmd@linaro.org>
References: <20230110082932.24386-1-philmd@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ETihgJc37QGs

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/i2c/bitbang_i2c.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index ac84bf0262..e41cb63daa 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -165,9 +165,10 @@ void bitbang_i2c_init(bitbang_i2c_interface *s, I2CBus *bus)
 OBJECT_DECLARE_SIMPLE_TYPE(GPIOI2CState, GPIO_I2C)
 
 struct GPIOI2CState {
+    /*< private >*/
     SysBusDevice parent_obj;
+    /*< public >*/
 
-    MemoryRegion dummy_iomem;
     bitbang_i2c_interface bitbang;
     int last_level;
     qemu_irq out;
@@ -188,12 +189,8 @@ static void gpio_i2c_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
     GPIOI2CState *s = GPIO_I2C(obj);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     I2CBus *bus;
 
-    memory_region_init(&s->dummy_iomem, obj, "gpio_i2c", 0);
-    sysbus_init_mmio(sbd, &s->dummy_iomem);
-
     bus = i2c_init_bus(dev, "i2c");
     bitbang_i2c_init(&s->bitbang, bus);
 
-- 
2.38.1

