Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp680974njb;
        Fri, 13 Dec 2024 11:16:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUtx9Y5yZ7SZuIElhhF9GlIKFC8t7uncNvfyryo1eVK+X28Utg7qGNS7FX/zYO5Q7Nnm+jJdSI118pAog==@linaro.org
X-Google-Smtp-Source: AGHT+IEbww4B4A/2cOWlaDz87CsorCDOWD6AJ8vLAEJxv5KF49wLH5U3x35GNfzM47HmUD+/qXOv
X-Received: by 2002:a05:6102:418c:b0:4b2:4969:d7df with SMTP id ada2fe7eead31-4b25db3c698mr4972966137.22.1734117388094;
        Fri, 13 Dec 2024 11:16:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734117388; cv=none;
        d=google.com; s=arc-20240605;
        b=X0sCASvyf5QNEZ9qu9JaSC6pX+TJ17jbrFohAzJxVu94hzRffLlSzMSPj6MwqVlYvi
         e0eHk0BvBH/P33L2OPVC5RRI80lduSxaQ3Q5jCmYTo/tNuihhrGhKHgqd/O70h1m/mc6
         Yc+7Bb+eIVXd6RYkd/DpfGYtW+LF7DZatOgM9xqS1iaocWx2pYereqxa3HNnzcJ/IWFX
         iCte02uNBhDGWgPlulgPefdyzB3V9IZRnZlK2wtoNs45TOnKe53QMRW921oOtXfMLqO9
         W/yoHptLGHXhGAOaI3pv7Z8fzPI9iEXshKIhwD7Vlu9NMGNdPSdc4wqcittXRb+87bjJ
         55kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2QX322DCnm5cE0pXBGmrME5GjV/mM7P7qq+mljbXHQc=;
        fh=y+zuf7YY/KGypALmxvuLmkoWbugfMI4rAGjc598d1Oc=;
        b=VPmG5iJrDJqQj16U5gUnF0REtHqD7UazaUatcp9viYbqx8JzQm+fPhISy/lSySwmUZ
         tx5+lI4N3YW6SUXjtj3mmd+3ESxJ5kLhu9XcOXmJh9ii6/FQVGPjhGVhJGmT3WxbRYBy
         zG8egDyza0TXpnWf10PMzJCef8o6IjgA4qKSrApDdfB4NkT6bVpos3D1oVZJH7snc1AP
         Okv+x9C7s0BtYNXbhtdxLVTmCpyLmJrPY/tQw2WgzCvGoG23CjaS1Oyw5H0qXPTIXa7R
         VqZQUjc0lxNCbVSsdHle63xKOhgg39vB9uInGqi67OlXElHguTbI8DkRWI2RuxATmW+w
         XqMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FYbPsRuL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b2704b02b2si23760137.665.2024.12.13.11.16.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 11:16:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FYbPsRuL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tMB3A-0004xT-8s; Fri, 13 Dec 2024 14:10:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMB2X-0003og-U0
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 14:09:31 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMB2R-0006gq-AF
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 14:09:25 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-71e1158fe3eso974903a34.1
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 11:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734116962; x=1734721762; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2QX322DCnm5cE0pXBGmrME5GjV/mM7P7qq+mljbXHQc=;
 b=FYbPsRuLN27DAsU+h5Gq1SIxYwAgHil+XRVB7v44rSfzJWKMCBmU4llcF9VQqWs2LH
 u4ShZjGNFYwHEhbjj0b7y9+oJzH4jpsfzhVjFR9dS3RMv1Uhry0AaoyyNvz6Pw0GXEbD
 /AKY17CxHS0ALGDISIWTBqNTVsyZNI9z7DchhMlemCZp67s747PjABjwt2mNYtJrJ9ml
 2TVXlBe02fc/OnQoFjq4J1hpds+4Gyhu1OxfDXLugDTGcef/flBdwFKqD/SOuAJ3Lt1w
 wTNVZrLEck+zoEpD066C7KTo32V48oUmrMJgFjq/sLC3nRUcALmp5K8/TC9U72lWXhSP
 8fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734116962; x=1734721762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2QX322DCnm5cE0pXBGmrME5GjV/mM7P7qq+mljbXHQc=;
 b=xK0dxFogSH+D78ewjXZEhmuJaCoFhCglEv2CCY0QxktOu/J9/RCxF+/3rF0QfOrpwD
 /ofB4972AaQT+vvJUVbwHMwxzcr7jptpGsGgRJZ22xHi+p3RreXGHz0nqteRQ3UIZJq7
 wI5OLB4RFLI73f31iirz/fuGnlQetPDsPjAVVlARdTfPQwUKC3Vb04u7tRz6VxqRvwtZ
 2iBtne41MJfvXU8P2ErPQEXW6CMpBT2Hw+fOgmea+6NLiJvvVJJGNaaT6/rdVT2F83oI
 mBIPzwUsuQKIMG/gaxXeP+GD89t1zIxvmXppEVmxIyr5P2fs1c9KMeF1i2CD4RoSQGR/
 n3Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXCrA6RME58CTO4uQxXyQF87MOlt+H6shi7MusGPE4314KuEpg1wmzRHV6lmzS3feRkKDBrSoFRw==@nongnu.org
X-Gm-Message-State: AOJu0Yyk0RnUAChCyZOAKVxQIwaWeb4VqU0Imc2kDx+zqR5p2R5ii+rR
 qqaBoUAwc6S6EE5EOTu2ZIEiNtPOHxtpg9m63imnJKVlxOsvlF5iRosDJyUGwJQ=
X-Gm-Gg: ASbGncsYZtE/QNo5JxJag6QG7E3pQJIN6HQxmtDwXGVbL9w/FTUZyJNtiLk6o2DMu9O
 R+wJbUdeetl3Osr8gcD6KIhWlkvx+WaNY28ZvczicnlF8l8vq2nPrvXExx2Xl990kwnTxepmXRL
 tffaMbH3r4he84yAeZ9gE7k+jgVfQPT8AimjxHafVv/2n6ATIdOGO7/LxnKLH3cwgLTBFLc4C7l
 TCWKdRVJW/nQOte/uSJxcbzJFRsXAtXwz4HfE8QJMatfht3T91r/66z7XjYn1uU
X-Received: by 2002:a05:6830:2b2b:b0:71d:548d:6f76 with SMTP id
 46e09a7af769-71e3ba4f66dmr1971252a34.26.1734116961994; 
 Fri, 13 Dec 2024 11:09:21 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71e4834da91sm29697a34.18.2024.12.13.11.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 11:09:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 qemu-ppc@nongnu.org (open list:PReP),
 qemu-arm@nongnu.org (open list:ARM PrimeCell and...)
Subject: [PATCH 25/71] hw/dma: Constify all Property
Date: Fri, 13 Dec 2024 13:06:59 -0600
Message-ID: <20241213190750.2513964-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213190750.2513964-1-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
X-TUID: e52zmyJ6PwaE

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/dma/i82374.c        | 2 +-
 hw/dma/i8257.c         | 2 +-
 hw/dma/pl080.c         | 2 +-
 hw/dma/pl330.c         | 2 +-
 hw/dma/xilinx_axidma.c | 2 +-
 hw/dma/xlnx-zdma.c     | 2 +-
 hw/dma/xlnx_csu_dma.c  | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
index e72aa2e1ce..032afedde2 100644
--- a/hw/dma/i82374.c
+++ b/hw/dma/i82374.c
@@ -139,7 +139,7 @@ static void i82374_realize(DeviceState *dev, Error **errp)
     memset(s->commands, 0, sizeof(s->commands));
 }
 
-static Property i82374_properties[] = {
+static const Property i82374_properties[] = {
     DEFINE_PROP_UINT32("iobase", I82374State, iobase, 0x400),
     DEFINE_PROP_END_OF_LIST()
 };
diff --git a/hw/dma/i8257.c b/hw/dma/i8257.c
index 3e6700e53b..8b04177393 100644
--- a/hw/dma/i8257.c
+++ b/hw/dma/i8257.c
@@ -585,7 +585,7 @@ static void i8257_realize(DeviceState *dev, Error **errp)
     d->dma_bh = qemu_bh_new(i8257_dma_run, d);
 }
 
-static Property i8257_properties[] = {
+static const Property i8257_properties[] = {
     DEFINE_PROP_INT32("base", I8257State, base, 0x00),
     DEFINE_PROP_INT32("page-base", I8257State, page_base, 0x80),
     DEFINE_PROP_INT32("pageh-base", I8257State, pageh_base, 0x480),
diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
index 8e76f88a69..3f392822ed 100644
--- a/hw/dma/pl080.c
+++ b/hw/dma/pl080.c
@@ -408,7 +408,7 @@ static void pl081_init(Object *obj)
     s->nchannels = 2;
 }
 
-static Property pl080_properties[] = {
+static const Property pl080_properties[] = {
     DEFINE_PROP_LINK("downstream", PL080State, downstream,
                      TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 0668caed7c..d5a0a1caa2 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -1646,7 +1646,7 @@ static void pl330_realize(DeviceState *dev, Error **errp)
     pl330_fifo_init(&s->fifo, s->data_width / 4 * s->data_buffer_dep);
 }
 
-static Property pl330_properties[] = {
+static const Property pl330_properties[] = {
     /* CR0 */
     DEFINE_PROP_UINT32("num_chnls", PL330State, num_chnls, 8),
     DEFINE_PROP_UINT8("num_periph_req", PL330State, num_periph_req, 4),
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 73a480bfbf..f09452d0b5 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -611,7 +611,7 @@ static void xilinx_axidma_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
-static Property axidma_properties[] = {
+static const Property axidma_properties[] = {
     DEFINE_PROP_UINT32("freqhz", XilinxAXIDMA, freqhz, 50000000),
     DEFINE_PROP_LINK("axistream-connected", XilinxAXIDMA,
                      tx_data_dev, TYPE_STREAM_SINK, StreamSink *),
diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
index 46f50631ff..1a63d5f3b2 100644
--- a/hw/dma/xlnx-zdma.c
+++ b/hw/dma/xlnx-zdma.c
@@ -810,7 +810,7 @@ static const VMStateDescription vmstate_zdma = {
     }
 };
 
-static Property zdma_props[] = {
+static const Property zdma_props[] = {
     DEFINE_PROP_UINT32("bus-width", XlnxZDMA, cfg.bus_width, 64),
     DEFINE_PROP_LINK("dma", XlnxZDMA, dma_mr,
                      TYPE_MEMORY_REGION, MemoryRegion *),
diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 43738c4350..d78dc6444b 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -691,7 +691,7 @@ static const VMStateDescription vmstate_xlnx_csu_dma = {
     }
 };
 
-static Property xlnx_csu_dma_properties[] = {
+static const Property xlnx_csu_dma_properties[] = {
     /*
      * Ref PG021, Stream Data Width:
      * Data width in bits of the AXI S2MM AXI4-Stream Data bus.
-- 
2.43.0

