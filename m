Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2217874lfo;
        Fri, 5 Feb 2021 09:50:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUARM2inplT/9vlW3seoOjMhL+2BFiHBuHdvlbovuqZqt4St5tiN5lduYi9yyes/ojQSWC
X-Received: by 2002:a25:3bc4:: with SMTP id i187mr7738303yba.146.1612547423463;
        Fri, 05 Feb 2021 09:50:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612547423; cv=none;
        d=google.com; s=arc-20160816;
        b=wohMHaXCXrRzbJtk1EERO90pokaKqL9D74iTWgs07R4ZJaodA/og6omj0I97srQou3
         9ZupUVvEPx1O0RrjqkqGWPHk/zEvGB7vf0UrfD9YlWM3u+Nrl0D41pIycVq4ylGnY5Gu
         y286+iakQ/y6LLCx/3dV1Q0BzCDsr5QmhxX+5/HdwetOphFy5L0WdEilRsndk3fdtXNr
         f8JGuXcVW90LeXM4D2VTXpQCfXr6GdA1YwZyTaOVn0pj2JH/DCrtOQLKhNWpjFRoGjNV
         3bsRnTdavMaxowlUaBweIkEb2vmkxA6Cto1e+jIxdbjogUWCbQcb1vdVPs2kBZqbhwgi
         wfuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jBPg420nC8pQh3qALQMd4OOROzhv7e66E6mvu1AgKfg=;
        b=g+fVjTbQmEGgmCXR7A37VPgUJSt8Xaxie3u/ICBbrKQheR1aVCUYw3hpembwtoVxkh
         w2K8jrUcycpfSBlB+TsswDe8SkFe9L+MQTnUgnc2ffETRSVrulrvNgaMNka7QyprNRgB
         5PDnjIhl55JDW/Sj4clb2+CrpIxgZfhQiWNV9Ant42mvKh3Aq2m4/uGWcPtbABOw4aaz
         lLmrkXH/CVjoPOeXnUdvS1W50CrmPsfH2pC27AnjWg8EFDG++rFfAfYEFxYtwPhH0M8Z
         Tw4Ihpm3BCL9yxWAzRWpor9P8cB2xdln6O3c6aT0cmy9YJpdqAiU+ropPlz7/wc2MhCI
         6V8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aMO9rVa9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m139si9416967ybm.411.2021.02.05.09.50.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 09:50:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aMO9rVa9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l85FO-0003d0-NZ
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 12:50:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Tl-0006t0-K6
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:09 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TO-00045G-Io
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:09 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m13so8408654wro.12
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jBPg420nC8pQh3qALQMd4OOROzhv7e66E6mvu1AgKfg=;
 b=aMO9rVa9eBZJ7k5HnfJuACbVQZpsAuYiABnsXFmGortX5AI9bs82hCReJ0hhSOAdRx
 srhrMiEcByg14dQdRlXIzSx1j40I0sYlNuhski9P+/3rfOraUEY3R7UWhyRxhhYs1usT
 Fm3j1cDH9WueZwN0FSNHp6mfQNTV1SWogaWyg0QQaIBInMo0osQrI3SPqoVcKhsYYUd3
 JFiwVicvLvDSdzVczd/zWEfXCKJ547wUDgcFFL9yzNXU53IFh7FiX1a/vxfnaY1EaVfm
 ZWMl7tQK/b/6cmPBqJw0URU+d7FfFNQ0Ujy4llfPx5OLRH/L8QDHiWzh8hd3C9DZqctp
 +XGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jBPg420nC8pQh3qALQMd4OOROzhv7e66E6mvu1AgKfg=;
 b=Fo7ZnpyGmJe6nSrYs5FfYNgTgTkWevfTBpm6OvE3h3nrzs0zssjxfm0YN0yaXW9ITY
 bHk4m3VIjylUpEYxLNB7VeST1jBrKN4U5n7zQkTla3SU8d0mxHab/IBxZ0mFr/q0xPvO
 GijEI5Re47QO+PwBhudJxmbmKfln+GhEkVCT56lF0BIJMedmWFYCPyfX6Cbt1z340yuq
 KjZNMk3was8pZe60FRfT1qsTU+Nm1qqfWGpOJxeQjqI2Y2yL7bJ9CFYK+3sAM93UM100
 vQPKkyMwIacocy/f1MGHYy8XzWMmDBBwv3LErLml7NzmUdMuCSDulQEGYcZ+hZ6FjGDl
 ms9w==
X-Gm-Message-State: AOAM531JLioNWUzGgMKuElbEE0jgXpVTpG6LCxl2jGXQrbJLEONESnQo
 FxQL8I8bKGkod2BlOebvc+Usu419kkp+Uw==
X-Received: by 2002:a5d:6842:: with SMTP id o2mr6221786wrw.310.1612544437055; 
 Fri, 05 Feb 2021 09:00:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 19/24] hw/arm/mps2-tz: Get armv7m_load_kernel() size argument
 from RAMInfo
Date: Fri,  5 Feb 2021 17:00:14 +0000
Message-Id: <20210205170019.25319-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OchNNbVYFUDm

The armv7m_load_kernel() function takes a mem_size argument which it
expects to be the size of the memory region at guest address 0.  (It
uses this argument only as a limit on how large a raw image file it
can load at address zero).

Instead of hardcoding this value, find the RAMInfo corresponding to
the 0 address and extract its size.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index ce5e804c734..17173057af2 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -525,6 +525,20 @@ static void create_non_mpc_ram(MPS2TZMachineState *mms)
     }
 }
 
+static uint32_t boot_ram_size(MPS2TZMachineState *mms)
+{
+    /* Return the size of the RAM block at guest address zero */
+    const RAMInfo *p;
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
+
+    for (p = mmc->raminfo; p->name; p++) {
+        if (p->base == 0) {
+            return p->size;
+        }
+    }
+    g_assert_not_reached();
+}
+
 static void mps2tz_common_init(MachineState *machine)
 {
     MPS2TZMachineState *mms = MPS2TZ_MACHINE(machine);
@@ -789,7 +803,8 @@ static void mps2tz_common_init(MachineState *machine)
 
     create_non_mpc_ram(mms);
 
-    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x400000);
+    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
+                       boot_ram_size(mms));
 }
 
 static void mps2_tz_idau_check(IDAUInterface *ii, uint32_t address,
-- 
2.20.1

