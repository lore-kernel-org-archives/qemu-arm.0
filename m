Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2111723ejc;
        Mon, 9 Jan 2023 01:28:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtcsSLl0KGNReWy7EhWcyQnC4nBlc5qJ9CEZONj+zBwK2Xzb/eSiUyOMnhKWDkDhcop+Mnd
X-Received: by 2002:a05:622a:2291:b0:3a5:2704:d4c0 with SMTP id ay17-20020a05622a229100b003a52704d4c0mr95656420qtb.31.1673256488784;
        Mon, 09 Jan 2023 01:28:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673256488; cv=none;
        d=google.com; s=arc-20160816;
        b=HbTKawamWNKasPxc3oiVROUOrnMtSeTM50Q5brTAu7pc3AnMdJUCpDIcmuVy++Schr
         9hmMr/wYOZVIqogdbgn2aJlD5OIljoPYBLBcOkkRSP2d9//kbzAXC0A6yzwVEDKSAaA0
         qkHV637vdJp9pTB8EaI0ucg24YLA+p1BbvgDhlWpKv03i4DyZMZ95nY8dXRZNm5tNDpS
         ymdadlsdusxJz7K+HWxjU3XyQPfIK6DgTfD8sy8RGk3QuVAAq3nsKW+ci0mbJf/E9vjr
         AAHTqKOyJ84s5ojk3+ble6RG3d129GyQCoFeH5uGnW0QwYnrrP6U+7+XlUi8GLph987O
         H5nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mJUniGzlTDF6ixFuHu4g7ABnLTHD1CJ9TnkuUuv7wWI=;
        b=Qbv85QdAkMcOnVH5maj7x5VFkveCt9WhIm5b2ZF5phegJ3MqKt3+GsGtTLtN4giL98
         kvETSfEC/JRcwUC+u4oilmyg8j2t/F9YeIDCrQwYvoLutpsZHDjj4t1Z8bRzWaJ+oCdS
         9nYjbjm+1QH8uB2deY8tMXfhBoIbUPn+eBcOL44gV+1KMKsfb78XomOPuHTnG3nqP3Rh
         yCb+cmpwfU31sYnF/MvAFdnYMRdvcQAnkybuvpaOYliOKQJ5UREDMcyS/W96JS70ocUL
         NhfM169zMIu4Qbh3Z7DaQF4lJ6jEQDUoFPKRricda5AaJxucQWKKB0ZpdmkBxLYMnIlg
         vQvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hkCIZQCH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6-20020a05620a438600b006ffb452c996si4077858qkp.294.2023.01.09.01.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 01:28:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hkCIZQCH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoQL-0003te-87; Mon, 09 Jan 2023 04:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQF-0003rl-Qv
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:28 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQE-0005Q7-9h
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:27 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m7so7475901wrn.10
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJUniGzlTDF6ixFuHu4g7ABnLTHD1CJ9TnkuUuv7wWI=;
 b=hkCIZQCHQp1FroAn2gI2/1l5DOwcafYO+5t04QxOmU75E+xSw5ARtl6o9vEBhsefqo
 zPgBgZUq+3w3trwO53EphRoMYBNUHxYhii07midJZnViYQ7WcLZjVLetrjZX5hpDaltV
 Rk92NJeBs8JOycuZ67lzi4+izJU5TFYUOGFvxlbh937oMlhzhVOlM6GwmsEBeWSkxA77
 JaapLuxyYe4K/OKh+z7pwxCmQvOIB6pNOQwR63NJ+XPwyiHA9fBna7tU/uzaBefdS4Cn
 58qRxkhGdnxoEcaIoUYUocRApm6QzIUp1/p9ozLpIbFjel94Lj9XnqLoiQzH+KAvRy7W
 562Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mJUniGzlTDF6ixFuHu4g7ABnLTHD1CJ9TnkuUuv7wWI=;
 b=h7bk1GRgmuwgz2CJMOPhWXzHy/OJj3+fekpmPIPtX1ywzgT95E0QnUxseiyYIj/f3x
 2QYpW1Y3BakCE1MJJB1fucEsAc7iLsh6yD+EpBTBWl2wVg5HpvC42FmiR5oMgFaqmb/3
 +H59m1SdxqqbHqM29TAXDt43y4EWccwc5TtNh/ndhakCsE7KBcr1HAZIHsFM1mKFj+EY
 Kswx9giYY/eHTCRALaz6vb95tByWKrvgYZEuPey0iSLgGnRcjzpXnblnekSYk94w0hxV
 mHKQAddyeWn7RYLJM6I5BNlGKgEuoGGX8gUBOmynuTi7SkuS1cy1yKnkP3pk482XXRgj
 iSKw==
X-Gm-Message-State: AFqh2koXRlC3tcFngWvGARu0XiPJzDMjXRkL+cTdIHcPzt6TxlJmVyCy
 Cm6LI9YW0E/4kBSo7LRJTBuW2VLsyxUXyVxS
X-Received: by 2002:a5d:68cc:0:b0:2bb:9106:d0a with SMTP id
 p12-20020a5d68cc000000b002bb91060d0amr4101166wrw.14.1673256384583; 
 Mon, 09 Jan 2023 01:26:24 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a5d6b84000000b00282194eaf7bsm7799550wrx.71.2023.01.09.01.26.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:26:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/9] hw/arm/musicpal: Remove unused dummy MemoryRegion
Date: Mon,  9 Jan 2023 10:26:09 +0100
Message-Id: <20230109092617.80224-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109092617.80224-1-philmd@linaro.org>
References: <20230109092617.80224-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: u2J4XSPtydvw

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/musicpal.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 813232682f..23359a6ac3 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1071,7 +1071,6 @@ struct musicpal_key_state {
     SysBusDevice parent_obj;
     /*< public >*/
 
-    MemoryRegion iomem;
     uint32_t kbd_extended;
     uint32_t pressed_keys;
     qemu_irq out[8];
@@ -1160,9 +1159,6 @@ static void musicpal_key_init(Object *obj)
     DeviceState *dev = DEVICE(sbd);
     musicpal_key_state *s = MUSICPAL_KEY(dev);
 
-    memory_region_init(&s->iomem, obj, "dummy", 0);
-    sysbus_init_mmio(sbd, &s->iomem);
-
     s->kbd_extended = 0;
     s->pressed_keys = 0;
 
-- 
2.38.1

