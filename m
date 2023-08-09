Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp2788003ejb;
        Wed, 9 Aug 2023 03:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp6tiVQ6/NJh8hhN/2OSHnaD5ga1nTSbwXWO2cN9+62bDrYBLslUQ8M7ClXqlIA/QNx9Sk
X-Received: by 2002:a05:6214:3d9d:b0:635:eff8:2b9d with SMTP id om29-20020a0562143d9d00b00635eff82b9dmr2115432qvb.27.1691576656684;
        Wed, 09 Aug 2023 03:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691576656; cv=none;
        d=google.com; s=arc-20160816;
        b=Sqdu8eKGk20g4BBSULawKPWo0XJ4r3HziLWdPvbALbfqyu/4WZWHO8IrPrSYrb7r+u
         fM4Ukbpw4N0ngmwB5rDy5vbatzczsIM2J4J/d07ZKDbi9q301YEqhkeEmT2Vbw2lqiX+
         uC7IyvGSlf8+VoncmPqhNSDwTFclQjyi68RP6ayBSOa5xrp5rrtZ34O98j+O9n7lTYkA
         92IAQKVkaaCv2gVkJ4qnObzUhZGRaLnyHlQByoOryl1o+ZpZWd+knqBhrbRtFx78gtGQ
         UfTznydz2WLNvc766XFNAURU/02voIOoLcsQIEoUJimz2SPdSXw62KgBBfDUG0DM4wcq
         fq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JjTpRtgk7g09UYe/5wWTzD2WRGklQow3z8dJyWIKW+k=;
        fh=0aR3pg5p0tkLCHNJ7m5rJrw1sBYdep1kLmItjTIN3Wo=;
        b=f2h8vk8nSNGPvD05XEjENApdZia+xiD2LnXvFCjgmiYQPq5Kxg+qGDGL7FVf4kmLUF
         Y4rHL+bCOwp89/JzvVvDnB4+RUnxZdaFQ4KwsYsu36vsapugVpjvjvR9D9izGwaxpdck
         88Is6PJDzQOYLkY59X9GYZ0X2sGyl0K0yA+BKqTwPvYhXW25YI0ggvMpJsEdby5ABPhK
         7xgJmL0vO4VoOexyPdhyVoudPlcTSHX5hJnIwgS6o/Q9eT7dczVZYUKf1qlF0y48KQPX
         aIdFcPIFqziJYqjz5d5yI06N9oSJr8te5A4yzay0fx64CZMR5IEr1I8mYXqQNOsYpOgs
         aL7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=QPPqUOhP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6-20020a0cabc6000000b0063cb0f80bc9si7394568qvb.454.2023.08.09.03.24.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Aug 2023 03:24:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=QPPqUOhP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qTgLs-0006Oc-O6; Wed, 09 Aug 2023 06:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qTgLr-0006Ny-H3
 for qemu-devel@nongnu.org; Wed, 09 Aug 2023 06:23:39 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qTgLp-00055r-K7
 for qemu-devel@nongnu.org; Wed, 09 Aug 2023 06:23:39 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-686f38692b3so6483050b3a.2
 for <qemu-devel@nongnu.org>; Wed, 09 Aug 2023 03:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1691576615; x=1692181415;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JjTpRtgk7g09UYe/5wWTzD2WRGklQow3z8dJyWIKW+k=;
 b=QPPqUOhPvJ9uQTJSPqAgfU5uOvcamSivXh1noFR7uSKtJ7bp4iBQKy8RtyoEnFUHWE
 t4TgU/o4gjM9pXLuphyT27mxPB7ryQBNdUkJqUAh6lyqtfclkfkDQXUAfjQCyw5ddHrN
 v7vqiqEqwuiGuRTcQdowO6WYi8tYaN8wuBB7rGuR+MuLpe8dPtIxc+AyGQBwKDoD59xF
 HPJAz9pp6ZazLRcp0aVDHBo+y1CqdKuhVTyi+3VsbrcA0giFjuzhP/qQSQFpQf4nKxkw
 1CI2kYW71aXp2XUmjsYf6Ylhyoh7opFH5mvkBKCWnNZ3M75c6PLBagWLrgJQ6jYk2IVn
 1Ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691576615; x=1692181415;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JjTpRtgk7g09UYe/5wWTzD2WRGklQow3z8dJyWIKW+k=;
 b=PwmukIEo7BWBEX27ri/m8RstS2ro24GVIFScuM3+61oGvqThl3ba0x0Kqxq5V14FGd
 N64zPtxt6pYMH5ttlTqV7CSvMPswNXAyl2DPg1vnJb+Eod1nGmt2JMl9n6GkdkuyTasI
 qlMU8M1uw4UIYjG5+au2BWB7UNCTJqd8zabZiSZP+H9xHgv4htVnO/WpqvFGxRusz82q
 iBYem6nXP696yRcacfq7CSbHjhaLeRS6O3U/jp+lgm+o6ZKrmkjP2aZEwH47YnDcuDRV
 Jr4aslNy8hKRRxdcXH+K3Xkia2P4nDZrRkLJ8+HY1NmD8rTOWG64XDDgpUWr9zFJs29f
 6EMQ==
X-Gm-Message-State: AOJu0Yzmj5stG0Lr8aa3+4XXPrD7SHIxkNjsxonqAM1M0hKylWIol0v8
 NVm9o7nIy/rzLB338nVuuts+OUkdCBXrBPjXRlRLjOteymXTx1AccZbIG8KK2ZaU0aK6R20YCrE
 orRdR+brOs/+0Jtapmub16Qo5hA/OtvHOltvTGfHLZlObCzPwe9cl0H40YkSJC2dR+de3yOvDnl
 zrSQ==
X-Received: by 2002:a05:6a21:3291:b0:135:8a65:a772 with SMTP id
 yt17-20020a056a21329100b001358a65a772mr2392397pzb.50.1691576615407; 
 Wed, 09 Aug 2023 03:23:35 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a62b615000000b00687375d9135sm9557544pff.4.2023.08.09.03.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 03:23:34 -0700 (PDT)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jason Chien <jason.chien@sifive.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Subject: [PATCH] hw/pci-host: Allow extended config space access for
 Designware PCIe host
Date: Wed,  9 Aug 2023 10:22:50 +0000
Message-Id: <20230809102257.25121-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=jason.chien@sifive.com; helo=mail-pf1-x42b.google.com
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
X-TUID: Us44YTyZYCPr

In pcie_bus_realize(), a root bus is realized as a PCIe bus and a non-root
bus is realized as a PCIe bus if its parent bus is a PCIe bus. However,
the child bus "dw-pcie" is realized before the parent bus "pcie" which is
the root PCIe bus. Thus, the extended configuration space is not accessible
on "dw-pcie". The issue can be resolved by adding the
PCI_BUS_EXTENDED_CONFIG_SPACE flag to "pcie" before "dw-pcie" is realized.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/pci-host/designware.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 9e183caa48..388d252ee2 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -694,6 +694,7 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
                                      &s->pci.io,
                                      0, 4,
                                      TYPE_PCIE_BUS);
+    pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 
     memory_region_init(&s->pci.address_space_root,
                        OBJECT(s),
-- 
2.17.1

