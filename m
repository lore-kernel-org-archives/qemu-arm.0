Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp802606ejb;
        Thu, 19 Oct 2023 14:24:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHPDWPR7CTpB7nBQXQxbzX9hXi99mCa/IxzpoyV6qaeSBW3EqX/7I1AeEbZkXq6IyuzRcL
X-Received: by 2002:a05:622a:1801:b0:417:af0a:70a0 with SMTP id t1-20020a05622a180100b00417af0a70a0mr4712079qtc.14.1697750692040;
        Thu, 19 Oct 2023 14:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750692; cv=none;
        d=google.com; s=arc-20160816;
        b=NyDcR1hFgRNmZ64I0guGVIPodNjhyBu9YIABk1rN89bdGLFhVCbqifP5iRSz0jjmF7
         r8NXMju1kTafyTmCtx6mkte+SgD3JcEJG3GDN9hgEUsIcEWygoDVZLeFGH/OJ6umbMfb
         uRhRpj1xaIA574bWMkJyqleF2ftonEomoI/Tl9PnMtGKQUWAaDGcrXVuijSrStJAfck/
         Oy3Cq6bNY5exfaFyyHgk5VAIF4Ahjn+nLu5jTU/qrHPGtuc01NwDUeTjfLMLQe2jml6L
         l+D73ousfYEoRSC8705drANglTF06yIucVa46FND3TJy5Bt4xrwCFG3ygQoNXqO6MSF9
         xb/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lLXDjIaupUgxBWcovEKwWLwxqxZJkA8MyfX0vWTG4sA=;
        fh=BkeVh2ZoOUivqTXz/LJJ+iU6gkF7ecRTByI6XgWob40=;
        b=wXzi3i/gala6JG7Wnc4gQmnzSU/oI98C2B4fa/jZ50LhbbPyxHkWVUPuF00Me4wbe4
         Hzea9jgbavevo39YmEbkrCRGX+FjtYN0PXZ0gzdG2dYn1GeBpTAzG7KmRforJssBc03g
         zgFTXjT7T3XyUH+lQteItu2cPOyLZBO/HeoRUzoHKmApq/2FdUQLMPir3977UTk6OD+A
         kkqyGr5k63bKi4hCWaaqiU2jZcLKGkKsWfbTElCwfgQMIhJvdX64dl/L2e6VcH2U7F9G
         9n22OL04/33m9bftE/NvfWqbWV4C+OcNvn9xK2wx5q8s5rG0ET56k/odaftZwt1+VeZb
         3qFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W8U7RJuT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2-20020ac85ac2000000b0041cc48c4959si249140qtd.645.2023.10.19.14.24.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:24:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W8U7RJuT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaTi-0004qN-6g; Thu, 19 Oct 2023 17:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaTh-0004ol-0b
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:22:49 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaTe-0000yk-4z
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:22:48 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4083ac51d8aso1038755e9.2
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750564; x=1698355364; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lLXDjIaupUgxBWcovEKwWLwxqxZJkA8MyfX0vWTG4sA=;
 b=W8U7RJuTBni/24xwk1KWFZewMYeqdu+ljkZwRE1xMT13ZEYtDyf2R6scLDNQolluJk
 DO7/UjtwIlHlVNKXDVMYwOvRlOihpqS3tAULP+T3/UbrTPajAq9NBekhdT83/q6PP84A
 FS5V1Ni6VPL0UbutS0heUsAvDqCHrgFbw7RwYm/+iyb2F9DbelyuqNIhMOsBXBvw+Q/m
 iodD7jqR+ThqAf3VeyOCNtlNYnjCA3JuN0fxUe/EsMkxJuimDxWpIHSqFh8roWMyqhOh
 gZT699fUZ8XppmfDyjYBudioNrWEu6xln25nfLrA59X6l/1Yt31wV865fHwLqAcuF3rq
 DeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750564; x=1698355364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lLXDjIaupUgxBWcovEKwWLwxqxZJkA8MyfX0vWTG4sA=;
 b=VbZJt3UeOOxbCm4aii50puivMnis0g0L3iqpQv2q4BArK8Ww6/cfpseaf97ryg7/Gc
 rNZMKicl/Ngv6aH2w5UPm1POVvJk7HowramjJ/JGV01HVr0gtnXFvDCJNBehS5ppR15+
 SQhP5tByYcY8rOampcUMBPew3nWVywaLRn8F4fgvqxj6xB/vCftSX/QN/jE5JG0Pi4sU
 ajZa5yiJSYoYhhaVsOQI7iMKyMUQB2rqQtA4RYhzqKFMRK9VIEB5GUSM5EIpbzse5LkO
 J+efjjESsIWOD7S+PSJm592DOPPj00JS1Ieet5mn73rjG4JhFMHQi44+YB4YJXVdrIHZ
 M92w==
X-Gm-Message-State: AOJu0Yx6lqvAEe1Fcd5nf8n05NlkUG0TmyGn4r2wZ9K46gDmV+RdUIV5
 WiKemSD2hwict880qVw5gSDrfGHewfkZMfYSzbjZqw==
X-Received: by 2002:a05:600c:15c1:b0:3fc:dd9:91fd with SMTP id
 v1-20020a05600c15c100b003fc0dd991fdmr46703wmf.40.1697750564618; 
 Thu, 19 Oct 2023 14:22:44 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a5d452d000000b0032d8eecf901sm233470wra.3.2023.10.19.14.22.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:22:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PULL 40/46] hw/virtio/virtio-pmem: Replace impossible check by
 assertion
Date: Thu, 19 Oct 2023 23:18:05 +0200
Message-ID: <20231019211814.30576-41-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
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
X-TUID: 66dk99NSGHBx

The get_memory_region() handler is used when (un)plugging the
device, which can only occur *after* it is realized.

virtio_pmem_realize() ensure the instance can not be realized
without 'memdev'. Remove the superfluous check, replacing it
by an assertion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Message-Id: <20231017140150.44995-2-philmd@linaro.org>
---
 hw/virtio/virtio-pmem.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index c3512c2dae..cc24812d2e 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -147,10 +147,7 @@ static void virtio_pmem_fill_device_info(const VirtIOPMEM *pmem,
 static MemoryRegion *virtio_pmem_get_memory_region(VirtIOPMEM *pmem,
                                                    Error **errp)
 {
-    if (!pmem->memdev) {
-        error_setg(errp, "'%s' property must be set", VIRTIO_PMEM_MEMDEV_PROP);
-        return NULL;
-    }
+    assert(pmem->memdev);
 
     return &pmem->memdev->mr;
 }
-- 
2.41.0

