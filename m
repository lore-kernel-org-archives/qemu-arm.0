Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp490553njb;
        Wed, 4 Dec 2024 12:30:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVmzTGRRWy0xqA3M5NbyEByEIPhEwjOAMdLkYvXIDpqViqV03jKQstpLTKENCeDjrvsW2uMhgCeLr38Vw==@linaro.org
X-Google-Smtp-Source: AGHT+IHOvwSOP94EV5gVV54ruAdsco9pVz5Rg/eygl/oiD4tg6nJp2nAmg/dBGIWwDesAbbV87Dj
X-Received: by 2002:a05:622a:1984:b0:466:9300:cb8b with SMTP id d75a77b69052e-4670c09be9dmr133900411cf.20.1733344206547;
        Wed, 04 Dec 2024 12:30:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344206; cv=none;
        d=google.com; s=arc-20240605;
        b=XRsNxjtVAXERLFeqPJCFTzpotas91tBK2tsBBBWB86u9aD9Obs08gGu+F+9eYWp9oV
         CSoXFrcvC3g9RET3KM7b6fNi8qvEixo1i6Kl1Rq4s60FNsA24vKPHTQ7r4z5Rpk6A5GP
         gGr3VFdZlEVFE6llRo9KtHg82zQ99cQCzOU+zAsC3sbm5LFVqZSAjJTiUgHTe5zlgC1c
         J+ZbApjxmbFOPvKMgO/W/9WxdXXjtLaR6lROKZBKil9xqArFa5vr0PEx03sdQONpntux
         r3YE2rDkUobha2jpNvh0qRTvrhUO4cGVK72zYDnrWvodVZawMd1bJ9syd6APPsd+i18D
         6eVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+kCFZSFSFl2GPP7FnxAPq5KUTVvEzSw2EnjHpYSMwwc=;
        fh=00GMm17ve6HOkLHmZbspHxjLmNSVxff/5GI9szYhslY=;
        b=asFNPq1nWZ9Y84/BuFR0PtZsHim3pvRSrcd1YWZ4LCoF42ESXchBrsSjQ8ccJoj2Xh
         EOeAI1yDDLJyEjyEuEzfBE3PxJxWjNppEbjCRTKdayB0mL7QK3VKZOpw1DdAlLHvCe3E
         0sJL56ScjyeEDSXwu4Ox+oyIft22XpCyxba7Y7XTfwueGM9ilYxJkipF0cEvNFCGjgaL
         ZOdSBuUllbeed+Uj9HnFdv+spSUdNzCYpkSaQ+x+q8JU6YGRNysyN3P+gtVqG8HNWGyT
         5ljLVOP8ExIiExn+VxfzLZccx+rfrtLpLprSyMRzVr/Q3Q2yZwUJ3TdKkgg9lARoebB0
         uXww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PTM+th+l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b684923b55si1730924785a.118.2024.12.04.12.30.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 12:30:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PTM+th+l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIvz1-0003Og-Jh; Wed, 04 Dec 2024 15:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyz-0003AL-PT
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:28:25 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyx-0003Uk-3q
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:28:25 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so1323225e9.2
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 12:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733344101; x=1733948901; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+kCFZSFSFl2GPP7FnxAPq5KUTVvEzSw2EnjHpYSMwwc=;
 b=PTM+th+lByViOglR4dEWHAsKgVxSUueLcvOeIDvXbWY/hBirkZpWJ1wVQq379hpKbo
 4nxiSau9O0FOUN/WW5X14hI/zFEvUlHc77ORhJAdkrxfd0zr3bmlykv2C8JgooYyJnyG
 LWc8DXjyYigwQ7RuXmbk+CDLBiBb2O93pWnPZmpCVFNH0g0gtsu2s+ADdF71Vp3dC7vf
 ZvH1MO5DAlg1Tc3MaGmtrSg74qDEhVDcwWeSzvnXlYX4LC8EXG+LF/Bzd8PD0m1cHLgh
 r2dfqhh+QI0SXOncQGKSk4tcEz2k4Y1y7XRsYDgC9cDm9jRvkEFHijZRx7XNfxN0Gjnh
 85Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733344101; x=1733948901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+kCFZSFSFl2GPP7FnxAPq5KUTVvEzSw2EnjHpYSMwwc=;
 b=I+LLa5Q/QSqvW4IvI3R58lCAus1vgOJd9La2Ll3GMRvSP66h0nYi4dofixD1B6QvuI
 aiw9OttEFgwbi6N6HZ3UpBun4Qq7ePYu4lbSXItW9Uc+icslbOW2WT08ta2kO4WziPQh
 Ds5OnJgNsPgbAgPtoAgy+lSBuvTwPRf11AtZ2i6smkbVu3E9kaCy+wDixMj+jy0waVBz
 hMuFuqbCasE3X8AO+JbHdrDeJjvJkaDIuRvpNlGVeSlnx955U22FOV/dVBKhLfoXHAqk
 Z1olkI6NSD/5WS2Yey/ZJq11SS9DfM9FdftpDSqZxDsdWVHY3ofySs4dzLQOI419lI3A
 d9mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5H8OkuBPVIcD1y054IIJWIN40DmjIth7Sd8+tkfGHjrF3hv/I7iGGDeVFonKqqst4UQA4IUNGRA==@nongnu.org
X-Gm-Message-State: AOJu0YyV+SZoErWG1Yrob2Iek570Pd34O1rB91h/Ig03KE/AsN1XSQDK
 M7MuqnMZESeHFsJ5ttLPMv3BANCvfpydZc8vb/80jYXld1vgXyQ6cC8evmOS3+0=
X-Gm-Gg: ASbGncv+pqWTNPAKPP2JWXiNc5nG7+enSYVVpyQtwWSgULSRkqGDH1doDASQ04Z2dtK
 w7aWtDZGEXwP5v3vEPLIv0wqfebpXViJb65c+2oBwQ52JnS/snddTj90clpdwUe608BFetK9Jbw
 +BEQRABcmO1y/+d2JK7P+oRlFnz5go0wtna5mVxNfh7EPovNS96dWCrTY5hAlnbs0gQ+CJXDFgd
 KnuWPklRER9ox+N9WaJJyiLCbIsmbsd/lPMNDICqcDASpipfdwv1K278FY2HpPBOrXo4qPzlPRC
 qlDkt/XULA3LzXha/Gb/9ASX
X-Received: by 2002:a05:600c:4e8a:b0:426:616e:db8d with SMTP id
 5b1f17b1804b1-434d09c8d82mr70145375e9.15.1733344101212; 
 Wed, 04 Dec 2024 12:28:21 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d526b375sm36220955e9.9.2024.12.04.12.28.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:28:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 18/20] hw/core/generic-loader: Use cpu_datapath_is_big_endian()
Date: Wed,  4 Dec 2024 21:26:00 +0100
Message-ID: <20241204202602.58083-19-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: rs9F9gbqRBkH

Rather that using the binary endianness, use the vCPU one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/generic-loader.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index abdd4c08a38..7b3b5f06565 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -31,7 +31,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "exec/tswap.h"
 #include "sysemu/dma.h"
 #include "sysemu/reset.h"
 #include "hw/boards.h"
@@ -66,7 +65,6 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
 {
     GenericLoaderState *s = GENERIC_LOADER(dev);
     hwaddr entry;
-    int big_endian;
     ssize_t size = 0;
 
     s->set_pc = false;
@@ -134,14 +132,13 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
         s->cpu = first_cpu;
     }
 
-    big_endian = qemu_binary_is_bigendian();
-
     if (s->file) {
         AddressSpace *as = s->cpu ? s->cpu->as :  NULL;
 
         if (!s->force_raw) {
             size = load_elf_as(s->file, NULL, NULL, NULL, &entry, NULL, NULL,
-                               NULL, big_endian, 0, 0, 0, as);
+                               NULL, cpu_datapath_is_big_endian(s->cpu),
+                               0, 0, 0, as);
 
             if (size < 0) {
                 size = load_uimage_as(s->file, &entry, NULL, NULL, NULL, NULL,
-- 
2.45.2

