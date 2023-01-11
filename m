Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3820624ejc;
        Wed, 11 Jan 2023 00:51:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtplxX48zmtM6H9xfzARwVgJ8EYSyN4iM1jkkohsfnXE2EboXakrFptQBBQsc0qC10O4CQS
X-Received: by 2002:ac8:1097:0:b0:3a5:7a30:bd22 with SMTP id a23-20020ac81097000000b003a57a30bd22mr79105622qtj.53.1673427115748;
        Wed, 11 Jan 2023 00:51:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673427115; cv=none;
        d=google.com; s=arc-20160816;
        b=A3MkPDM54os+QHNhU1m1+IV1rVqAeTR3B6e/D7McFyd/rDN7h6ajalVbViG5MRLjBI
         4s/cHvw66D05pIHIQxDlCpXUe6tmL4s5xfGnit32IioZ78T3MAa30MjacSOkV8VIA6sm
         EGbEe06dO5VuNAH2XDw/8iOqNSTxNJMyxGEcieuBtdeacl5PIRocYJ4ei4leeA3TO5CC
         apeHTj4CMxJKBsixNwBi6Ozfo3S8WDPO7V/w8JJt8Gi3PeqQl8RRydtJ5Q7OfFsqrS0x
         c8m6ZLK1Rm8+1VC14cNY3CiUQgSlIRuAnQ2fEom5tx6GX0O3ls99wV6rLMEPEwnAbwDC
         5eXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QqhX9d7OWrlFhlOYzosdT2uap07wVT4JcGVQZKlWVp8=;
        b=qr6K3MOZyL6I0nZLb5EOqCIKSvLS/lvmpsCLYqZDW2B2JL1cicwW/M2GjUyJDSjJfo
         bdYdaBJO4DBSN7BZ/lbQJLMFtQQ+AihUHTFyrQlzImgZiRbOiq5Avgn44Us5Niu6vhkD
         nl7q1aSci++i05dQHzvtQ2BwehvTnwD+NhecOsPr2pZDJGyaORuXnzlJcQkub7eN7W3z
         TjAnmfKa+bIQElay8uHEehVGeSD2DaJjHKdtKoRroi3WF04MbrIGPRGOmXZY5tqCBPbQ
         rsuvZ7BCLsvvmz+FAHXYhFomds0QniNqzbvkkXQUiPAtiL3BnjHBG9Vhfs5NDdJL3kx9
         CaBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qs+/e/za";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w25-20020a05620a095900b006fc9552c034si7456227qkw.312.2023.01.11.00.51.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jan 2023 00:51:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qs+/e/za";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFWol-0003Jn-4B; Wed, 11 Jan 2023 03:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWoZ-0003Bp-An
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 03:50:32 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWoX-0007cJ-O8
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 03:50:31 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 ay12-20020a05600c1e0c00b003d9ea12bafcso8403857wmb.3
 for <qemu-arm@nongnu.org>; Wed, 11 Jan 2023 00:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QqhX9d7OWrlFhlOYzosdT2uap07wVT4JcGVQZKlWVp8=;
 b=Qs+/e/zaOY/tJH6z6W0tOYMKOhvkFd9y6V+YqgPBZonuTIpeatoplaVdgk5DpTYx9R
 p59vu8uTu/MlpaznSOIUN6F7I5ksUMELsLmLRzfyJfM1oyvhVvbwnYGekI/VvFt7wolc
 fyxcMxjHDbV1P+qk1qyfsIGbb0EYr/8b4qQ4C18KNNqpVGqnBo7TEX++7rsVT9btOGNI
 LjFkGF4cpvrG709+IKOvq+QhoktGMdFjkIzGOJRY6apnmi/5NreOgSrPxnuiq6fBvAic
 oPxOTCv3Shv0rlRZJCqQ1kRG6VK9uAL7pt9rqfY4mKw+wdEe6uUGjNC0v1VOeUmZu6ha
 UQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QqhX9d7OWrlFhlOYzosdT2uap07wVT4JcGVQZKlWVp8=;
 b=4UWUMQUDi6TGuENh+2/WGo5i4BJCpUrfzip3gdidne7DLkEGK1AlWzDTr8RdkTXb62
 KE/JU5p+soXIlmnQWkDx4eP7l2vroSWHucywfaZ7PJlzC/C+NiMAwLSA1so1xrer1PLH
 nCY7jSrCFblhxiFs/0y7D27I8I9yV+twlQxS+vrGp1JeRPM4omfIQp3InPgeeqs/822s
 0CVyfNh65oxHP6WNe463NMOJLbK82OxMeXLRFZZgVh0P+PUTvGQRoAVvoV1r8Xv8RNec
 VcMhpDKPfNDYMCho/+XcWni20i4ELoyQiS1y6Xy/eYvEjKIp1XC4+H7CghvmTKpKeaPh
 TiGw==
X-Gm-Message-State: AFqh2kpg6rBmz+dKq6B5pMJmXG3jx0sQxhWDWcaBUh1nDfkvRPYS/qEO
 Yp1oXkfMpOlDUCbCluCTdf+WIw==
X-Received: by 2002:a05:600c:1da3:b0:3d3:4dbc:75ef with SMTP id
 p35-20020a05600c1da300b003d34dbc75efmr51264789wms.17.1673427028123; 
 Wed, 11 Jan 2023 00:50:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c511300b003d9862ec435sm5963864wms.20.2023.01.11.00.50.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 00:50:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 2/5] hw/i2c/bitbang_i2c: Remove unused dummy MemoryRegion
Date: Wed, 11 Jan 2023 09:50:13 +0100
Message-Id: <20230111085016.44551-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111085016.44551-1-philmd@linaro.org>
References: <20230111085016.44551-1-philmd@linaro.org>
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
X-TUID: 7CxQ9oauOr1G

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

