Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp802643ejb;
        Thu, 19 Oct 2023 14:24:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnb6k1EWHAk4zaOr/D8rM0dA9BX3Tp3zwyIQHg/u2n5Dk+cDw60c3CzTZ2UjKgVA4C0+cN
X-Received: by 2002:a05:690c:dd5:b0:5a7:ba54:aef5 with SMTP id db21-20020a05690c0dd500b005a7ba54aef5mr147435ywb.21.1697750696743;
        Thu, 19 Oct 2023 14:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750696; cv=none;
        d=google.com; s=arc-20160816;
        b=efzp3bqAHfScyPpermZKvfeS08TvO2moh6X+MIg0RfOsz5RX8OzHCyJkDX1qRmRvzR
         CeUAVgbk/rlYVfkRWPsXJtwY6bCWQVrakcm2BK8wfUOApQuFbEBKMu5aaZddLqxY2fqc
         JtYIRoZDQEeFTz6toIYp7LSFGIjxYCYX2VVH/YpBU1o9NrydvB6iWT1PurPHjHxKDsWa
         WHMJVOKokuABX/0PqrYzAMEkFXV6Nm18fIe2lnN1sV4Ij3h0TC0MIigSkOKWz3/coag4
         0nr6L/M1oI/SbUXnoX9Z7oy2nfb8zpMSeLKWd9tx+e3kLew1BIAfEe0srfUCMM5Ul/BS
         NMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FcTE23/7CBludJrePacG9mm/Zbftrzi7RnP1Te5vq18=;
        fh=jKtuCgAgYeKfUPFeY2/+Fu/AZWpNmMDcN5hpHEFWb54=;
        b=bHFeQ7FsPUZ8fub6EC+0yRm1Xhz9KPV7bFl4IcdH1PbFHVRD2iZENRKQXv60f8pWrr
         n/+oEWoqDvqCtf3lPO2AMk6zZery24BYrFcKqHuzaMCJzYJnwLzOgcemqvhvqEm7IIO+
         t+JALskfRTsxLTKyUguemYYkvDm6FIklJItK4A0jBUREH864nYn6yPaGe6cm9AjsXCSr
         EpZ/7LNHRP2Mu1GNUQInKJt+2qczZ+3RwrjA+031Mj0qRmXMQWNwJ6AqHKdOw8CeEQ0t
         ON2vFXYQfYGaAl1VrxAEzBt03Zdz1/fcPGy7Vmvc7PhwgkXZ77JgX46k0sjFZkN9Hy55
         ifKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c84m79qi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020a05620a024600b00773f7c8ca33si259981qkn.126.2023.10.19.14.24.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:24:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c84m79qi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaUD-0007iX-9I; Thu, 19 Oct 2023 17:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaUB-0007Qw-D0
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:23:19 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaU8-0001i0-Nr
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:23:19 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4083f61312eso944505e9.3
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750595; x=1698355395; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FcTE23/7CBludJrePacG9mm/Zbftrzi7RnP1Te5vq18=;
 b=c84m79qiAcxGNeHcS5CHOZ3epS2ziNiMcJY5LMusxxjkfj+ueB6k+wz2uMifd9RELe
 YumwVSYKC3t6okSDtVnFG/MCNbo45dOMMAdQq9DWGIPFr8LU5vmx1PoB8NDx6+kaQ8Di
 ZNDEwlWcz8Ub5J9yPmODzWmyrX9holf1uTPX5xXuEvcaF4UfyfLGxgU5WwaUWjPszrhO
 qlKTFVv2VzcPA187M6PWucTthvaKi6+jV3NbTsNzfUpV57HJ9YRcaVoDYQ/hJoZSzOmn
 pXkN9+1tSHS88Y2+JpGUfkCVWY8WiHvMfWG5ndtlnjVUnPuH/u/XFsj3tJnpPFU+CmZU
 OAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750595; x=1698355395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FcTE23/7CBludJrePacG9mm/Zbftrzi7RnP1Te5vq18=;
 b=aQyWA6mrFnUUPD4T+Cuxmh0pBMWcLJd5SSuEMzAyBxKi14Z5XDvSJGOBNiO54UpOmi
 2HU26sMo1mHqs9qKEcLun022TkWKwRwJWuH+J7ri5cdBh+/kmVAbW//xYSR65R8k1B67
 MVRFl5LOEXDsZmSjgqldEVzFIG/yJUghP85VxerkBCyuXGpRu6XvefnWCozKpBvecCUj
 8tbXq1h7t/KOg7RvdWkYl7IxEP26/l242/LuiB9z5EPQavj8WacyBxEkXSDCQkFCWXWv
 tEm307CDtQ/jLVwObsO4fQo0G5yPGfAu9ilSsm2KzRceFASGi2I6sXYLNCTsw810R9/J
 E65Q==
X-Gm-Message-State: AOJu0YwiEucEXeBjmj9Ffqw0ZXDEDPvwNtSdU3vofQ7p12kDChP2grfm
 byugaiXGQV21ioqzhmUx2FpeBg==
X-Received: by 2002:a05:600c:4585:b0:407:6911:447c with SMTP id
 r5-20020a05600c458500b004076911447cmr55922wmo.4.1697750595411; 
 Thu, 19 Oct 2023 14:23:15 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b0040775501256sm530314wmq.16.2023.10.19.14.23.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:23:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 45/46] hw/net: Declare link using static DEFINE_PROP_LINK()
 macro
Date: Thu, 19 Oct 2023 23:18:10 +0200
Message-ID: <20231019211814.30576-46-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
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
X-TUID: 9HogawNzaAAH

Declare link statically using DEFINE_PROP_LINK().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20231017140150.44995-7-philmd@linaro.org>
---
 hw/net/cadence_gem.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index f445d8bb5e..37e209cda6 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1654,11 +1654,6 @@ static void gem_init(Object *obj)
                           "enet", sizeof(s->regs));
 
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
-
-    object_property_add_link(obj, "dma", TYPE_MEMORY_REGION,
-                             (Object **)&s->dma_mr,
-                             qdev_prop_allow_set_link_before_realize,
-                             OBJ_PROP_LINK_STRONG);
 }
 
 static const VMStateDescription vmstate_cadence_gem = {
@@ -1691,6 +1686,8 @@ static Property gem_properties[] = {
                       num_type2_screeners, 4),
     DEFINE_PROP_UINT16("jumbo-max-len", CadenceGEMState,
                        jumbo_max_len, 10240),
+    DEFINE_PROP_LINK("dma", CadenceGEMState, dma_mr,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0

