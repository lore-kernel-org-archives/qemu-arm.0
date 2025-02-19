Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1553250njb;
        Wed, 19 Feb 2025 10:47:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX/v+J0FzyFYpz7j6JTEgoarSPnPgWhQ/6/xipUAJpiMOq8NRlLAdTew2Zne4hmPkg986yEzT28LAOQBg==@linaro.org
X-Google-Smtp-Source: AGHT+IGJHOICTW+pKg6+RBhOgyiJXbVPfFuz7S+jzFZzVsiYvq3l2GWyWphCgB5pJdOjyJeWsFb8
X-Received: by 2002:a05:622a:8e:b0:471:fa92:923c with SMTP id d75a77b69052e-471fa9296aamr122211431cf.26.1739990840554;
        Wed, 19 Feb 2025 10:47:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739990840; cv=none;
        d=google.com; s=arc-20240605;
        b=HEv7uPjTAz5ckn65BIr/KLTT0IAra/S7tF2qgZ/qt1ZQKUcA/dyfHvKXmDbio+2WdG
         cc5E3u+sZ4SUJ6ZcMlEieFQZak4j54JRzqUHXyrQcr+pl3uciqfYfAa7hzLkRV8Ol3Oe
         Tiw9ew10I+BSIDAq1tcpU5+NzWh2RztFWwAFe51hxblQ+vVyn79ePBYZG94+Syy3k6uo
         ZbaivZsHDGolppSAeQd2x9ePetbND+6/vmPRuN309Cr+ahw+GrKZ6zRqwXnWMUW0kq16
         mVDj10X5dvF1Mh/301+jXq6uLQEMCCe5ypr9E+BvMNSx+ylpVWy0LpYuLFJz6HAJK6si
         qfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=eJvoLmKWZueB4x2SO77z/CNBY4DFZv1QeYJU8Aspc4Q=;
        fh=biy2AaKCbwpAZ/Lk7Qechxb9C3WSrIx4CYh+Y6obQL0=;
        b=dyfVpXxHO1Yjs0UiH5LjesyKBSTcwaq6CMcAlX9YDDQpKSCCkDTEXjYxMObupT52Iw
         kSjTEE2CZKGyO6AVBqeJy31SRRjAQYt4oECzmu87ZK4/ncQ9yfd1+pS5l1kL4sA6rkGZ
         mlOsRo6Wilfmnfha//h43cx6EKYp8I08+Ce02CgHPPTOIUwJEyUwD8Z2CYJMQjZfbmfK
         ii1tkWhIypRemP9pNZiu5g99MXpdopErtuyFz6Ab7ljVbyPDhA6VC77u/4qhDvwVERvW
         +tcTbmKfYu8PflllBugVQhyyQs89/vnMTY8IQnvO1f3RdrUjPAvLvlIz0QdtfngMDDpk
         4P5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=FO6g1fWU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471f1216b9esi63291701cf.567.2025.02.19.10.47.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2025 10:47:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=FO6g1fWU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkp5h-0002xn-H8; Wed, 19 Feb 2025 13:46:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ASe2ZwgKCGwgeRKYdcRQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--wuhaotsh.bounces.google.com>)
 id 1tkp5b-0002wQ-50
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 13:46:35 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ASe2ZwgKCGwgeRKYdcRQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--wuhaotsh.bounces.google.com>)
 id 1tkp5Y-0004ga-1J
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 13:46:29 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fc0bc05c00so316790a91.2
 for <qemu-arm@nongnu.org>; Wed, 19 Feb 2025 10:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1739990785; x=1740595585; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=eJvoLmKWZueB4x2SO77z/CNBY4DFZv1QeYJU8Aspc4Q=;
 b=FO6g1fWUEWzw4MxizkL5PbRKoDkxwz5pv5/jj3rzqElxak8XfrNK9e2kZZX97tf7OY
 tRZup9XiWTkD/U0amDVk4avtU7vkuQlZmqvSVXeSO/foCOdq8YkQ2m3UUczMozK2Uf6V
 lQDRiI41bUby5vfDv+bj6xRklrVbRdCAOqpinI9KQBE8Mkr+E/3A+DClZub/yKtf3Hf9
 A3xAuvS/gMgliWBoKnPytft6hiFGFgXSP9Vy4sy2Nkali7zFRx7hjXEq/qIQORxlfNfu
 4tuRqItndVPn0+R+SaABJszHOYiqQgc/Tf1trAPA//gaQk5VY6NzddOlycjiMlogt4qr
 arvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739990785; x=1740595585;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eJvoLmKWZueB4x2SO77z/CNBY4DFZv1QeYJU8Aspc4Q=;
 b=Liy3OdfL5wT6dxiQ04v31uDtVpAsi4cdg8iXx4dxP7LpD3sHSSKN/JO73WyULiqEjA
 dBgYDrPKTWffkA3B+QFJ1X54y+CJUvGZscda/VUJKKoPj71nba6fkXygcScOMX475m3v
 QDwJjlGBvnwriJzLGx35ZdJQWVkmEbLCIOZJyTGeyi+Xiezbmc/UE5KQCAgVJ+OxN1A5
 J9igsYaGg/yhkRMkWkRtkHi+cNgTwOFdaRH8UWFGXSkTjolnz6DQWZ6TTNc39besX0Py
 IRY7IXO1Pkj2Rz528sy7gW+tuUnjdE3mY0x09xU5yN1B2SsE5Fy4NVbNHTSeoo6aDo0t
 85Sg==
X-Gm-Message-State: AOJu0YxsvqsZXYg96qgtZE14SVcjUoN3QN2emzRCEo0CFk3/WGWWNIsx
 uEz8ejiw732dh36oxe80q2ABxci7ySofyUdvMc24j2+sdEPWqnA22RgaAAKnAkmHB5pPspaOezK
 SotoWHh2qOQ==
X-Received: from pjbsm8.prod.google.com ([2002:a17:90b:2e48:b0:2fb:fa85:1678])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1e08:b0:2fa:1851:a023 with SMTP id
 98e67ed59e1d1-2fc41150587mr28814437a91.35.1739990785451; 
 Wed, 19 Feb 2025 10:46:25 -0800 (PST)
Date: Wed, 19 Feb 2025 10:45:52 -0800
In-Reply-To: <20250219184609.1839281-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250219184609.1839281-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250219184609.1839281-2-wuhaotsh@google.com>
Subject: [PATCH v5 01/17] roms: Update vbootrom to 1287b6e
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3ASe2ZwgKCGwgeRKYdcRQYYQVO.MYWaOWe-KbWXYXQXe.YbQ@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: kM1FIXxaqdQw

This newer vbootrom supports NPCM8xx. Similar to the NPCM7XX one
it supports loading the UBoot from the SPI device and not more.

We updated the npcm7xx bootrom to be compiled from this version.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 pc-bios/npcm7xx_bootrom.bin | Bin 768 -> 768 bytes
 roms/vbootrom               |   2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/npcm7xx_bootrom.bin b/pc-bios/npcm7xx_bootrom.bin
index 38f89d1b97b0c2e133af2a9fbed0521be132065b..903f126636f9ef5d1100c056656ccfb2b32e5e10 100644
GIT binary patch
delta 90
zcmZo*Yhc^(l+nU*!D9x6DNkDr=09a-2ztoGz`#|*F#jn7L;r()|Np;c0m>C1$z?$0
Ywog`Ma%Vh0Ig_b-VgU<}A_D>d06Rh+WdHyG

delta 69
zcmZo*Yhc^(lu^NO!D9x2$xoRb7CdZGnE#ZCA@Cs+0|QqL!~CZV4E+!GPG)41X52Pe
SmdTy*+~icIZXQJj1ONb5*AzJb

diff --git a/roms/vbootrom b/roms/vbootrom
index 0c37a43527..1287b6e42e 160000
--- a/roms/vbootrom
+++ b/roms/vbootrom
@@ -1 +1 @@
-Subproject commit 0c37a43527f0ee2b9584e7fb2fdc805e902635ac
+Subproject commit 1287b6e42e839ba2ab0f06268c5b53ae60df3537
-- 
2.48.1.601.g30ceb7b040-goog

