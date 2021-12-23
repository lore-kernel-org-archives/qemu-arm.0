Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp3326584lfb;
        Thu, 23 Dec 2021 04:26:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzM1ep2JEuDzj+fS3VXCsvvuOaPZj5JZ/jYiwqSrBU3Dg9ghSAA5DOf0tESjofNoUWngLTm
X-Received: by 2002:a25:db8e:: with SMTP id g136mr2772424ybf.301.1640262390812;
        Thu, 23 Dec 2021 04:26:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640262390; cv=none;
        d=google.com; s=arc-20160816;
        b=k090h3pbNgL1DJUkTw50FGk2HUUv1qAajCZDRugCQhaWEKxrVNPcC+NR2Ey6zAjWI3
         57SqkXRAtH/boVPWD1qnwXo5sZWVhsw6++XoSe983P7IAPX2vC2dMHNloc4AMpE41+ik
         Jhzt7dtmx8elEmV1ld7l6bMrih9EQiWQNu6wf7JqgAs9iENIDmLcdVJcOQL9j05N9PA0
         8WaGCfgmFs9egKlanbFiwxV8TUKjNrJRg4CUJG7EGCYcaSP/CpkotXl7LgzC05DkcGfB
         cDUR6kGZ33fJ65U59IaOaGtF2i6FGHLpAZBOHZ9ADshTMP3/mNRSnTp3n8U09Ui8Ae8s
         tWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AccLfnY/B/12ZHLoZ2OU6IixKvcUVx9674CliXPrEJo=;
        b=rovCQ+n9Twxg+Iq2uVJj/sV29FApV6xN3R9STiH4lGKMRcTzpHqWxYBWVEuueQ578Y
         M7HIuqqtXketFGYIs0HMjubTZTO84iuE/dgNFzXuASfs5L2ytQTx4ycElIk5AXtkzMcG
         QZrJTQfOdq2qi3dzLAyoG1E7HSLQ6vgDh74NwdlFarYs6wz9WWNmphIvS3IWykDS7hQw
         wYHTwrejzkOeGcihRt78CDJV4ayyIeIWzABYPRSBVbPW+ReZUCf62G4UPa3iq32gjpPU
         g+pKt0BMOZv92yB5eGjl/Jfwcqy2Wuc+WczLn0oz7gGJ52DSed9PcfWe8FeH0g93nl3F
         dgLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="bRL+4kY/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5si6499918ybg.699.2021.12.23.04.26.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Dec 2021 04:26:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="bRL+4kY/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n0NB0-0004kZ-5T
	for alex.bennee@linaro.org; Thu, 23 Dec 2021 07:26:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MlL-0004bd-DG
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:59:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MlJ-0001ED-RS
 for qemu-arm@nongnu.org; Thu, 23 Dec 2021 06:59:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AccLfnY/B/12ZHLoZ2OU6IixKvcUVx9674CliXPrEJo=;
 b=bRL+4kY/zinwtC3pF1HHQOFS2JifjDtsAbfJKltGrh3AUIIf5zlC9osuaNQTaAh4COFfyp
 Z4CxUHmk5kz8mOmd2dc3qq2COm7mrpjbceYCQmLBtLH7X/etVUL48vuf/pU15MoZMe0wyx
 Ysea6vMgVcwSCs6fdIZP6F8fhauohcY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-nVqPIcW6ORyr1S7glfJAlw-1; Thu, 23 Dec 2021 06:59:54 -0500
X-MC-Unique: nVqPIcW6ORyr1S7glfJAlw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r10-20020a1c440a000000b003456b2594e0so1928557wma.8
 for <qemu-arm@nongnu.org>; Thu, 23 Dec 2021 03:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AccLfnY/B/12ZHLoZ2OU6IixKvcUVx9674CliXPrEJo=;
 b=WOAcSNKWlP1OsRlgPsd8bu4x7uTLOZ2BrFWJRkD/8tjEKlQ78o20Ps/6ejr3Ha7UBy
 quC++hZqsqPMp9kSru4mVNov1hfccz3nWAfUaSLsMEwpzw7/9bTChzB/3LercSWQreOM
 2Be0A5R1yx3+yTA6kxQnqXrcDO0cGsOPVtS9VG32mhqr8SMkxg7dmoG6n8jUXoTROuhp
 ypsREUsDW4ItvdiNyHrMR//pgL2NlzeFY5JjW3fK627JOahHXur/vM5azyIZ1wSm3Lnn
 RlwHj1wuSl76wzzWNh2oJ8kECCTzXNmTYtuEf7OZGyi2VqdAXmTaP2B8bWbud3gC/riS
 61mw==
X-Gm-Message-State: AOAM533WmaFk8diiiCUXoq5vW842r56BT/A8nsqFhUdIswWdTHRWrWnY
 bJS7b5Qe1AvZypcJSB+TUVqPuiHA58PcDI3iVguW3vDxTbv1GvT0yKUhk6QA6ehHWybdsRS6Vr0
 +o599rGCCs0SI
X-Received: by 2002:a05:600c:1f18:: with SMTP id
 bd24mr1593856wmb.174.1640260793174; 
 Thu, 23 Dec 2021 03:59:53 -0800 (PST)
X-Received: by 2002:a05:600c:1f18:: with SMTP id
 bd24mr1593821wmb.174.1640260793042; 
 Thu, 23 Dec 2021 03:59:53 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id i4sm7759112wmd.34.2021.12.23.03.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:59:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/23] dma: Let st*_dma() propagate MemTxResult
Date: Thu, 23 Dec 2021 12:55:48 +0100
Message-Id: <20211223115554.3155328-18-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115554.3155328-1-philmd@redhat.com>
References: <20211223115554.3155328-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Sven Schnelle <svens@stackframe.org>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TI/RIK3ncj1y

dma_memory_write() returns a MemTxResult type. Do not discard
it, return it to the caller.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/dma.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index f3cf60d222d..725e8e90f88 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -248,13 +248,13 @@ static inline void dma_memory_unmap(AddressSpace *as,
         dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
         return _end##_bits##_to_cpu(val);                               \
     }                                                                   \
-    static inline void st##_sname##_##_end##_dma(AddressSpace *as,      \
-                                                 dma_addr_t addr,       \
-                                                 uint##_bits##_t val,   \
-                                                 MemTxAttrs attrs)      \
-    {                                                                   \
-        val = cpu_to_##_end##_bits(val);                                \
-        dma_memory_write(as, addr, &val, (_bits) / 8, attrs);           \
+    static inline MemTxResult st##_sname##_##_end##_dma(AddressSpace *as, \
+                                                        dma_addr_t addr, \
+                                                        uint##_bits##_t val, \
+                                                        MemTxAttrs attrs) \
+    { \
+        val = cpu_to_##_end##_bits(val); \
+        return dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
     }
 
 static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAttrs attrs)
@@ -265,10 +265,10 @@ static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAttrs att
     return val;
 }
 
-static inline void stb_dma(AddressSpace *as, dma_addr_t addr,
-                           uint8_t val, MemTxAttrs attrs)
+static inline MemTxResult stb_dma(AddressSpace *as, dma_addr_t addr,
+                                  uint8_t val, MemTxAttrs attrs)
 {
-    dma_memory_write(as, addr, &val, 1, attrs);
+    return dma_memory_write(as, addr, &val, 1, attrs);
 }
 
 DEFINE_LDST_DMA(uw, w, 16, le);
-- 
2.33.1

