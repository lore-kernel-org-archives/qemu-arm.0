Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp68164ejy;
        Mon, 20 Nov 2023 13:41:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfIYN5Vb7UPSix46YYBhhgSGNxmN+sivOZlkg1j9JYrIgG0ydddkecVfihx+lfjpoMRyWU
X-Received: by 2002:a0c:e00e:0:b0:66d:1624:2203 with SMTP id j14-20020a0ce00e000000b0066d16242203mr8393886qvk.20.1700516492027;
        Mon, 20 Nov 2023 13:41:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700516492; cv=none;
        d=google.com; s=arc-20160816;
        b=YoXQkxBlZzUXA12kQZHffEM6KjDO6/OGG9ebksoOALtqHYtUF7ylGOfkYfv9idWR8k
         ++JXEqnodsj/TB/7iwpVyU5k/g/t02YgVtWbLEwaH1aCR0EuSFAHxERpuhuSjjY/l5u8
         ZSdHi+4lYVnd1iMDI+1pfBSR3IUUwSlDtrHtIoMajoLbiNP5/6zAhc2RWtlY1J/kkS/R
         1Lj1c/tDTJqqclwtE6KYeswy8pbo2xIQhJ9pRbWXxXBu659TX7AzFd2ke6fHTVgN7U2X
         wytdyC6VsopIFouuTCc39+1g8xBflcBkPxUipXhXLzO6QVKkWZ63X33IfwjRpPMqZZod
         T8nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Pno/XIMEfv6sc1E+e58IOA0UG1tXfCuf040vsihGJmc=;
        fh=Ljpz67KUguUCIBLeiOnmYlxWTfvg6mMKNzxYzt1oXKw=;
        b=nsuAL22cpV8hq11LHOUgAiyYZEonSF4ViDI79KrIanbEeypzlJ85qGDh7J58y4NflW
         H1IY3NTPHJMU03o8s5pm59/2N/Ubqm+5qGlDnzsryN9PT9UdA2oZ6pZOhjc7MQ7djKHb
         u3H4hpqThjYOBZA8PyZkxMYYei9IRCZI0nB/zrk5FIAIGbaCgss1mdMm6T5e0ARIU6d0
         z5cI0hj3HuTV41VXc9iQxFPA3hVTdxMEA9UiTI1mgpuHqwmCKXHaF4heCN1bJ6cLDfhG
         MK7wW6p2fxuna+q6QOjSmG9+gPWqGVW3URgnjUHsFkaGA8uBhxy/iyfISIGXUaDjACsT
         YPTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CF5RL0zU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020a05620a450600b00767468da8f2si8247970qkp.350.2023.11.20.13.41.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 13:41:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CF5RL0zU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5BzK-0004YP-W1; Mon, 20 Nov 2023 16:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5BzJ-0004Y3-V0
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:39:25 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5BzI-0004jn-Ea
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:39:25 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32df66c691dso3102944f8f.3
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 13:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700516362; x=1701121162; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pno/XIMEfv6sc1E+e58IOA0UG1tXfCuf040vsihGJmc=;
 b=CF5RL0zUzCIFvd25ju57WC06acxPFagk0euQB638guaostgYaiLpfOgwgmAJRGdFZV
 0oR4IYmsELKTWdHuvUVeKMVhfYq6bpOom/TUGX3rRKKX/Jr1gbqz8BFcm/MjtCGHSneA
 URwaSPLB4K8ONTDvNImP4UZ2oE3ps9RK5fWeZVVLrKX9XQ/qcvoeKDxHz8u+3KGgX9SK
 qcyk2ipAMYF7VHyQmn39y3cISyR72kYPFQgJZQOi+1IkHMTic/vh1eKFEz1wqfsOkvOT
 tvtYysFZGzWlvJZaO+vvoyesgoftXzVcdRaBLfEzn5G+DU8ZIiQsV753M9sEjDVG9S7z
 X7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516362; x=1701121162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pno/XIMEfv6sc1E+e58IOA0UG1tXfCuf040vsihGJmc=;
 b=MIrA2jYeKZTBgXUdIbXKseZJXK3rpDgyry05SlafqGGll53/Bdpm0XvNaGjhsuaHZv
 L3BWrSxpch3JEa2Bx6Dcwu2/ni7d3UUEuDyCXn5xCagKkqS0twzOBr5M170iJ09kBtAE
 Ode5Ui/SKU9226/g5I8ehek1d5yLxZMdjw88GNzTRQ/dEX4IbG8rDUGm6j/tB4Mrxzvx
 pUjdazvip4MsWs4glwcBY319USLjacW7qf5iLETZ5yPfuRULbxk1t5ETW7AJBv5RFFT7
 TT49eqpyTHsq7O28yL/AlfbadFjeqPxH3dyK4+E0XRVFXNugLRtiEWB1EJU8oe9Py/py
 Xozg==
X-Gm-Message-State: AOJu0YwohrkmSsVrtr/747YuZhNtHJhZw5cXBE5HH95aT14+Pn7O1CmI
 DtAKPd97790cJpgV7O4nqUliCQ==
X-Received: by 2002:a5d:4012:0:b0:32d:8855:138d with SMTP id
 n18-20020a5d4012000000b0032d8855138dmr5261429wrp.66.1700516362036; 
 Mon, 20 Nov 2023 13:39:22 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.190])
 by smtp.gmail.com with ESMTPSA id
 f10-20020adfdb4a000000b0032da35baf7bsm12234102wrj.113.2023.11.20.13.39.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Nov 2023 13:39:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH-for-9.0 25/25] hw/pci-host/raven: Propagate error in
 raven_realize()
Date: Mon, 20 Nov 2023 22:32:59 +0100
Message-ID: <20231120213301.24349-26-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120213301.24349-1-philmd@linaro.org>
References: <20231120213301.24349-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: YNGa6OFnoDPs

When an Error** reference is available, it is better to
propagate local errors, rather then using generic ones,
which might terminate the whole QEMU process.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/raven.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 86c3a49087..e34ce47874 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -345,8 +345,10 @@ static void raven_realize(PCIDevice *d, Error **errp)
     d->config[PCI_LATENCY_TIMER] = 0x10;
     d->config[PCI_CAPABILITY_LIST] = 0x00;
 
-    memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_SIZE,
-                                     &error_fatal);
+    if (!memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios",
+                                          BIOS_SIZE, errp)) {
+        return;
+    }
     memory_region_add_subregion(get_system_memory(), (uint32_t)(-BIOS_SIZE),
                                 &s->bios);
     if (s->bios_name) {
-- 
2.41.0

