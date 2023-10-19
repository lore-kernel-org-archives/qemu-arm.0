Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp802521ejb;
        Thu, 19 Oct 2023 14:24:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLXvO5+0ip/+VaWrt0gWK6ej+iu0XGpsiMykWYLEp6HN8fYdumJxdW5/a3jPqs3EgwDgVx
X-Received: by 2002:a0d:e20a:0:b0:59b:fb69:1639 with SMTP id l10-20020a0de20a000000b0059bfb691639mr81568ywe.32.1697750682303;
        Thu, 19 Oct 2023 14:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750682; cv=none;
        d=google.com; s=arc-20160816;
        b=hFfdeEG1XNl0nH6ormogWGr9ahtfPgiRty1R8H3DhRVQFBqcYDWOQQ2dh4q9M5wlHH
         nzhjiwf+bSt1j5Hzfr2LJxReIA16vt+W+lPJK1VfUSryuJqkoKvxCTfyXGo+d1a+NwTM
         guYmPgPxkCs1In0Sl3h5RHGAHcQMbURxfJ6sGgvoxbjLzku7P+ROMAap/Afh6tIKJ3IY
         NQXvvLcvMaTso1qKAmOT481SrY7aXr7lqxdPLa84TQdBlMpws7pwedcDSWH65MzMPTa4
         h6l2pIc2J5QSAoad53dduENsrNCf6gZwHCBNvPSbbxEmPFvFvIfioFVd8GmJKa2Bhc+d
         IgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vJ9ZaPpfbPcFNzI45afXvQgHQre2Ry4Lwlv0pUnRA5c=;
        fh=JLjM+ZivWFloiA3k3jGy42N5chpzH2pnh8CUmPxHY0w=;
        b=PZlSbWq2DEYcpNUGazQ4vDp0XMJWZvF1vpuToRsD+Pc4EaO73KeDzX2fpeUHXGh0MR
         4g+FxjReX17MmqEYMH/7WUBh/dtKqJA2R3FNVW6fOiYux93ygeauLyeFdbsQclXn12B4
         4pZB6LxTNE7XId1VlpzOwELMxi0m03TfUQnqJjtoiLVGgBIULP0+wLqJaAVQ/sRxFpb2
         /wS2fsayuafJmcCqBqcREl/wP2uDkppXhVMb/sHSzgSpNxNnS3KpvlkjyE5WUhcZP/xu
         nOva/nvNIIOgEKrBGTYFZMKFVA1xDTMfasAG8XFXPSnxymF28kDOIah1ftpUZ026xXb4
         qJ6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mootwnur;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7-20020a05620a294700b007770bfc2da9si267047qkp.83.2023.10.19.14.24.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:24:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mootwnur;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaTc-0004h2-Qw; Thu, 19 Oct 2023 17:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaTa-0004S0-By
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:22:42 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaTX-0000gY-VF
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:22:41 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso1114995e9.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750558; x=1698355358; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vJ9ZaPpfbPcFNzI45afXvQgHQre2Ry4Lwlv0pUnRA5c=;
 b=mootwnurg06jyGfU97h1CYzTo0cLBrF0Lafp8vuaj0SYCSxIPnd92idv0Empt+VKGU
 qSux/N7HQriLx8o8RYXhBZnap0P5cKKgwUhaIldBSmbo6Lz0P5TJ4YJaEvuEqAh5b4EU
 vOt/OOZQhP7Ith1YBADUTbpYjdRajv8pwT+nan0F9WAw2D37R2uB3DIlhR2M03VLbMQN
 xgH+frCgrxfvEtbv+qDUVTQuCMCM1v/tJ6YVuFAtsXysO0z/bTyhJ2EwotgiSseT+tzC
 Y9hpLfWsztyqGVcoLYFJcN5NH5qAIPQfLssrWnot9n8fw2549KIaGQbQddQTnq3iFvqb
 YheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750558; x=1698355358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vJ9ZaPpfbPcFNzI45afXvQgHQre2Ry4Lwlv0pUnRA5c=;
 b=tIzzPTZVT1er/BNewlOYpYeSGCDxF8dU6k6+z+8zyfn6g6ZQ4a4eFUESx9wcjllqrK
 HhK93psTd06dz9NCLdDebwU8Ple2hP9ZRH8ZbNLUJwkr0x2tMPy3pF5WAZ+wBKUVI7ye
 XxMnQkH+0MH7X30cU7j+8vQml4aBk0T8Wok2OEq6fgcDSosbBc7iJjyGA6B4rsRVkQ1H
 y2oTzGulVTOwc/JTSFNmFflC0UXamFyomu2TuxkGNTVUrxs3dh8NFrGP9fu5seGNuXHH
 4qJhVvMszPIoPMCS75amD/DiQGZhf70wnrlD9+F3p0i7I/VMs/lJS7Cjo3Qoq9Mp5hU8
 zqqA==
X-Gm-Message-State: AOJu0Yyi61rNNEcLoLlDVy9CW64K3oLNNdBp5ySwlx7CDvjlXjV0YywR
 YUquc1BSq6P0MuECz+EszdWF5A==
X-Received: by 2002:a05:600c:3502:b0:407:8e85:899f with SMTP id
 h2-20020a05600c350200b004078e85899fmr53066wmq.16.1697750558265; 
 Thu, 19 Oct 2023 14:22:38 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 az15-20020a05600c600f00b00406447b798bsm5381485wmb.37.2023.10.19.14.22.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:22:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 39/46] hw/s390x/css-bridge: Realize sysbus device before
 accessing it
Date: Thu, 19 Oct 2023 23:18:04 +0200
Message-ID: <20231019211814.30576-40-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: WFY9aEAwgLZC

qbus_new() should not be called on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231019071611.98885-10-philmd@linaro.org>
---
 hw/s390x/css-bridge.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/css-bridge.c b/hw/s390x/css-bridge.c
index 4017081d49..15d26efc95 100644
--- a/hw/s390x/css-bridge.c
+++ b/hw/s390x/css-bridge.c
@@ -95,7 +95,6 @@ static const TypeInfo virtual_css_bus_info = {
 
 VirtualCssBus *virtual_css_bus_init(void)
 {
-    VirtualCssBus *cbus;
     BusState *bus;
     DeviceState *dev;
 
@@ -103,19 +102,19 @@ VirtualCssBus *virtual_css_bus_init(void)
     dev = qdev_new(TYPE_VIRTUAL_CSS_BRIDGE);
     object_property_add_child(qdev_get_machine(), TYPE_VIRTUAL_CSS_BRIDGE,
                               OBJECT(dev));
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* Create bus on bridge device */
     bus = qbus_new(TYPE_VIRTUAL_CSS_BUS, dev, "virtual-css");
-    cbus = VIRTUAL_CSS_BUS(bus);
 
     /* Enable hotplugging */
     qbus_set_hotplug_handler(bus, OBJECT(dev));
 
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
     css_register_io_adapters(CSS_IO_ADAPTER_VIRTIO, true, false,
                              0, &error_abort);
 
-    return cbus;
+    return VIRTUAL_CSS_BUS(bus);
  }
 
 /***************** Virtual-css Bus Bridge Device ********************/
-- 
2.41.0

