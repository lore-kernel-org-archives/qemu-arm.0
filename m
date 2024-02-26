Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2203521ejf;
        Mon, 26 Feb 2024 09:39:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXoZQJva3Mhe6QBhWNs3MZASIPYLF1FQ/6Gz5Wi0iG7myOm3sy0quxybCvDHPWh1LYSYT1AYtm+oAIsk+xfMudFxyQ0Q1c1
X-Google-Smtp-Source: AGHT+IE6dKj2QKoDCHQYB+b7Vh2RPaIfmSSacs5KTPBcu6GkhhETpV1dbQ+X+72vxhzHQzyBqYz1
X-Received: by 2002:a0c:cc90:0:b0:68d:1d9:2be8 with SMTP id f16-20020a0ccc90000000b0068d01d92be8mr8846374qvl.51.1708969140416;
        Mon, 26 Feb 2024 09:39:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708969140; cv=none;
        d=google.com; s=arc-20160816;
        b=DKZNDNbT8/Abs0lhyxhZ6AlJHVPieqpCAhiMmQoH4AHeAdHJqwtssnOB7ByPBexyOA
         QrwwCHXIgzoNpHsEd9+XbMISA6vnh5/JGL752ACQ8sTrBFVKeEyCsVWo8Po5qSScXb3m
         17eWo45iWg9XQ0PQP1H868XnnO/JYZU3Wtf6pW7B1m1+7Fm1a0IX2VTCjxGL5aumabjI
         3i/pc2YawVRmEJYsmv7hmuJaai0boKSWzsUlo4qVRRrsI7g579KkssRQ8eC/M41TYGNw
         dFUvAROuNLHGyi2ZJ4iIFE981Prp3upmhL/1GNT3W7ip1/PBLPejZXIh0ByebSnqrLLQ
         YJ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=67Ry2a6gAfjKQBP9Yw9WSNGqndsJgD876RK2i0/zSrw=;
        fh=oQfXyeu5MNVyHvEzkBn+7hq0ylS5fLAj/sLY3qrixbU=;
        b=RVxbjz5HZ1z72AJMMGU5LVaZcwohjRNpH3DSQiQoHsrMjGI4a5K7hYK47VYgNqHtd6
         HSgZs1kx433KzH2Nf8XX32Y6F3bwdtat1kLjbWCSTPDvZ2d4VRrLzrRwkM2ATUCKvkjP
         2CVI8IRjuJjzv1QWZyTkKTDVfG3itRBKaaPcWmraGH1LJnLWNqRvNkG6yP+Q4E5qoK7m
         jMT4B8jz5h5PUGv5nkNdeR8y3mrBjBfa2j3mqSfRuWBsBeT63zYcIsYArDVoSmtsHsqH
         XH5hl0n7LNtdWJb0AvvYtiA4IeTjZK3CQaOLk51rKooYuN6UXAND8KryZdrpl1WTaP2z
         pIvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XpU3iXAm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2-20020a056214194200b0068fe5e2d4easi6051684qvk.558.2024.02.26.09.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 09:39:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XpU3iXAm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1reewC-0004ii-RA; Mon, 26 Feb 2024 12:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reew9-0004Yu-3R
 for qemu-devel@nongnu.org; Mon, 26 Feb 2024 12:38:45 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reew7-0007AU-JS
 for qemu-devel@nongnu.org; Mon, 26 Feb 2024 12:38:44 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-412a3371133so10231845e9.2
 for <qemu-devel@nongnu.org>; Mon, 26 Feb 2024 09:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708969121; x=1709573921; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=67Ry2a6gAfjKQBP9Yw9WSNGqndsJgD876RK2i0/zSrw=;
 b=XpU3iXAmdkQdSxPVWMsr9IASBDwk2ok8jOtvQSXVffxNNURBnWoZej4effi9QX6K9L
 PQkw8ReTUlgMgPMmTLAy9lvF//76/DTvZDkPKaxRQiTLbtv/y5Ujb6bcyHP7UALnS5bS
 DhhAHfree9PgsQe3A6t8vSwpGLKDyqqp7wdsJCd8VEUODcwUl707xWTImBV2jU3Fd99r
 CC+r29kGY0ZtXauTtOaYasDa8DPX3Wy0Uvh3R+rQfP7DuabrtwJrKLixE6IA6AsJoENI
 YeFxqJz1YDGpAq7Zxj21CEmUroqqjBLp6KaaUKOXejHmdKjHwZWmsizRE1eoRn+Ek7Mt
 AZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708969121; x=1709573921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=67Ry2a6gAfjKQBP9Yw9WSNGqndsJgD876RK2i0/zSrw=;
 b=qkRlLTQZey8nl17A805aAEwcGN0GpxEaV8r/Nf+QHVzNzUyTxsjOIZdNiUTgy8bLM9
 fUqr1GYeN/jAmd6gvbVXAJAuYkS/G6nkIGCGqpNsHkFzqoC+XDhK4V2an3G1cXpg7DTK
 cLO2Bz6/Xd5TAoTj9i1toD/79sPud86RrQK3P6J5l1e50QCi4kDwMOvm3c5BMXGnWx8f
 wMQvl+CXU+1wF6g/inXKm3vwY++mrvBOPcYIA89Kzvgn1Y3dALclqjfvo9e9tAks0xYe
 +1BZU61myFxjuCD/7zlcHTZfEPO9KFI032F1gbZGmZ5gKVj7w3iOOtGUioC9GU7+/Kc8
 5XfQ==
X-Gm-Message-State: AOJu0Yzub4zR23dAJKbJbrHCXdKIsNkvHynAeVEo+lBUigIxsA56jdpP
 qrJVqJTlHw1J1FXWl9DFVUVMVH4QP9QjrlkGyUAbMzE2N2s2Dc/5t+m+EDi/SHnpK2N73SiIXt1
 F
X-Received: by 2002:a05:600c:4706:b0:412:a313:5a5f with SMTP id
 v6-20020a05600c470600b00412a3135a5fmr3562490wmo.4.1708969120904; 
 Mon, 26 Feb 2024 09:38:40 -0800 (PST)
Received: from m1x-phil.lan ([176.187.223.153])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a05600c4ecd00b00412a1307106sm6258725wmq.43.2024.02.26.09.38.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Feb 2024 09:38:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 6/6] hw/sysbus: Remove now unused sysbus_address_space()
Date: Mon, 26 Feb 2024 18:38:04 +0100
Message-ID: <20240226173805.289-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240226173805.289-1-philmd@linaro.org>
References: <20240226173805.289-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: enBUso39IMxJ

sysbus_address_space() is not more used, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/sysbus.h | 1 -
 hw/core/sysbus.c    | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 14dbc22d0c..3cb29a480e 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -83,7 +83,6 @@ void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr);
 void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
                              int priority);
 void sysbus_mmio_unmap(SysBusDevice *dev, int n);
-MemoryRegion *sysbus_address_space(SysBusDevice *dev);
 
 bool sysbus_realize(SysBusDevice *dev, Error **errp);
 bool sysbus_realize_and_unref(SysBusDevice *dev, Error **errp);
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 9f1d5b2d6d..ad34fb7344 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -298,11 +298,6 @@ static char *sysbus_get_fw_dev_path(DeviceState *dev)
     return g_strdup(qdev_fw_name(dev));
 }
 
-MemoryRegion *sysbus_address_space(SysBusDevice *dev)
-{
-    return get_system_memory();
-}
-
 static void sysbus_device_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *k = DEVICE_CLASS(klass);
-- 
2.41.0

