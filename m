Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1153391ejb;
        Fri, 16 Feb 2024 03:08:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUfueVM8C0clg3vd7Ic9NH2znNtOSqtsOkx0fTMrtbEPe2r/3dFOaBK8rgW6n+YjmgaJgRkH4eaqgFyplOvfTO6pNasSzGt
X-Google-Smtp-Source: AGHT+IF+rcJMzgzpxXZm2zyCJso5j462TRUSEmqpwwsUCJMKdiiqttidzzh3AgJmyy60ppJuVRHu
X-Received: by 2002:a05:620a:1478:b0:783:ab18:976c with SMTP id j24-20020a05620a147800b00783ab18976cmr4884571qkl.13.1708081703103;
        Fri, 16 Feb 2024 03:08:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708081703; cv=none;
        d=google.com; s=arc-20160816;
        b=E52NRjHYVp5faWwsxynAO6OP/d2276jAlSO+p6ERC7e8MsdpJdkzJn1Cnuc7iDpQ9Y
         youPNFgR6YZbhH9mzsR1bowgRnmLiuSqknVJa30KtuQStr/5EivU8cZfRBwzXQi7GKNz
         LfthXQymS5ZcUgKwEU5mgaWp5wQUbNl9rGJwASDFoVDxqFWUMQY887IgiI6JWAg+Sdj8
         U/vSCdm6gPreY8E/1w/m9VxH46rE4QfPl8oS/O0UrwKMWdqeOe87ye4Z+uf4KhoHGrte
         gyQtthUaodder83mkQuBYWmNHXa9RsXB4fZIro6mBUHcjgWzfAoh7Y0RA1xYcq1ddQa3
         Cw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/zKKBP4rtXDo5bJMJS/mfNxVsCqCESb5cpbpX3cp4fo=;
        fh=1CsvuuPs9UPSTZuV1m9yFwpqVLOER2vpzJGWrJFmFxE=;
        b=zODFog7v/cKuaNmuQF9QZ15vYOsLKBb/T8nuUKGT9tGg4XMlrr/KafjLpikdGXX1jc
         2K5hdLPJdFwiKrmmp955MZOLTd4uCQoR7nSoBMtV6Q/8lhGhWIfAol00yVhvseBKoEH9
         RA6VGWVqgjlsmF+O2PfIQ4MG2gUa6pi7HQebTwXzXteGuhHP7ZdH2fA46h4A7QaUqEZC
         xhRVC4v3c0i22lGUSpD2cZ3zzKFdV4c/ICZLIQfhYr1qNh5vfuSWa0zTjqzRz4NsGJze
         BwYYuv7v4fxGXfifir8JPkQTWIcjy1Pm/47gxLl10dMkaXk0R3faKjAmWr1dHIavBX+z
         MM3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hgHoEzOT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21-20020a05620a215500b0078728ec0793si3560957qkm.396.2024.02.16.03.08.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 03:08:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hgHoEzOT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1raw1X-0008WT-5h; Fri, 16 Feb 2024 06:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw1U-0008L4-E4
 for qemu-devel@nongnu.org; Fri, 16 Feb 2024 06:04:52 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw1R-00018S-U9
 for qemu-devel@nongnu.org; Fri, 16 Feb 2024 06:04:51 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41243d19ecaso3270935e9.3
 for <qemu-devel@nongnu.org>; Fri, 16 Feb 2024 03:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081488; x=1708686288; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zKKBP4rtXDo5bJMJS/mfNxVsCqCESb5cpbpX3cp4fo=;
 b=hgHoEzOTJE2GAUdiiRHOopema77vTDTSD4nbLnBygQ13j/5siddqlKYhgLWQMwuvpM
 HovwuaGJVjwV2RwJZebBlNkmH3ZIh2Yr3j/FPdNLpwePpUNcaxONY+ev1+puxcpta4ed
 zkXbvCaYzjoAzcsrFr6nfWNGihexkUPC5kRzLhWNY5HhegVUjHdLdKAMkKlWJX4vZlvs
 KtZwXjWB0Yck/8I50TABB2tH1t1maoOYUYZgDrkKA2jWXx+0/qDa9P91lqIdH656Q9CA
 wy7cTaLR1rXo2s9AuB43NiHqHuQ+FWQce4M1crAv/njIu/Rzv2KI/Vo8nZrZlU9XVzH4
 HaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081488; x=1708686288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/zKKBP4rtXDo5bJMJS/mfNxVsCqCESb5cpbpX3cp4fo=;
 b=Hepvf3vzem+D1rCkBq51+gHDED1tgt4QYNebjbz92hrxubhEDfoL4kb/hoR+7TqycU
 NRINbGJ5iTSGjv9Tn8qcqhunRkSKGQhOdhlKcKyjRXMy2gZmVgxej5rjeWhvNydg+3WM
 kS/+fHO5UNkLknpsT7OC404YNc7oF3x0rRwuMkKY9rioLJkSIGkuAboLr8fbcul4e2AP
 MZ1hjml6uq9PsXeE39PN/xmMza+aMgZCrsaHWTkVUHA/49XRx/3G5CBeHN0v/zFkD8pK
 6FzIFKDFLKAMgLNw36tzTBsP2N73xWAsPrzMHFrxJyzePYye/g7QdukXaJWX2B1ctp3v
 GFtQ==
X-Gm-Message-State: AOJu0Ywpj9cuxTmi0T/HYAgaRM9m8GCOVantY246+L89pMP2d5307UYY
 NV/PzsEpWdjdi2BOhfCdV/k2nR1Q3Ho9ys7fMeyzC4nmD1fB/VJ0oZ5q/XrzgeMA8DT+SNaA/VT
 V
X-Received: by 2002:a05:600c:6a07:b0:410:ed9f:7acb with SMTP id
 jj7-20020a05600c6a0700b00410ed9f7acbmr3427466wmb.40.1708081488237; 
 Fri, 16 Feb 2024 03:04:48 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a1c4c0a000000b00410794ddfc6sm1951788wmf.35.2024.02.16.03.04.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 03:04:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH 14/21] hw/pci-host/raven: Prefer object_initialize_child over
 object_initialize
Date: Fri, 16 Feb 2024 12:03:05 +0100
Message-ID: <20240216110313.17039-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216110313.17039-1-philmd@linaro.org>
References: <20240216110313.17039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: MbEeNZAqWEPr

When the QOM parent is available, prefer object_initialize_child()
over object_initialize(), since it create the parent relationship.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/raven.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 9e47caebc5..5ef25edba6 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -290,7 +290,6 @@ static void raven_pcihost_initfn(Object *obj)
     PCIHostState *h = PCI_HOST_BRIDGE(obj);
     PREPPCIState *s = RAVEN_PCI_HOST_BRIDGE(obj);
     MemoryRegion *address_space_mem = get_system_memory();
-    DeviceState *pci_dev;
 
     memory_region_init(&s->pci_io, obj, "pci-io", 0x3f800000);
     memory_region_init_io(&s->pci_io_non_contiguous, obj, &raven_io_ops, s,
@@ -328,11 +327,10 @@ static void raven_pcihost_initfn(Object *obj)
 
     h->bus = &s->pci_bus;
 
-    object_initialize(&s->pci_dev, sizeof(s->pci_dev), TYPE_RAVEN_PCI_DEVICE);
-    pci_dev = DEVICE(&s->pci_dev);
+    object_initialize_child(obj, "bridge", &s->pci_dev, TYPE_RAVEN_PCI_DEVICE);
     object_property_set_int(OBJECT(&s->pci_dev), "addr", PCI_DEVFN(0, 0),
                             NULL);
-    qdev_prop_set_bit(pci_dev, "multifunction", false);
+    qdev_prop_set_bit(DEVICE(&s->pci_dev), "multifunction", false);
 }
 
 static void raven_realize(PCIDevice *d, Error **errp)
-- 
2.41.0

