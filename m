Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5600164njk;
        Thu, 26 Dec 2024 00:23:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVJWFOVqigSzCX4GzgGe16jrVvNYk/PMoSXLtqIlxP000kEB/KRXV6Y1FtbO3OVqvjrF93FXB9t9OJpCg==@linaro.org
X-Google-Smtp-Source: AGHT+IEPdqKyfrU01uoDzlt0hPn8i3p8DOazoMVtUiC0KB+pQheEX9fhV1NPGuogXotBKJ69nAea
X-Received: by 2002:a05:6214:f06:b0:6d8:92c9:12a0 with SMTP id 6a1803df08f44-6dd233a73c1mr292148406d6.44.1735201405083;
        Thu, 26 Dec 2024 00:23:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735201405; cv=none;
        d=google.com; s=arc-20240605;
        b=j0+NyXn7OXypPSPIsvn1rcY+HiWIDPWw0EiVsaVwFunpugxY6h3N0ElDFMVqVpk9L7
         2y+kJCd3GXal1Yx7UA5R0PcCuJEiykNpOIRkofFxZP0uOgdNI70fC4vErB4v+XYgKtsR
         rllUAzIB7RtiM/twZNSCaY+JXR0/95cvdIfBl34BQQWQG4mYxHNjETmnUIQ+7agoA6zu
         VpCRXAJ1GxC2aAWN84Y+JDxlQY3mzE78+WPSWlotvni78VD/SXngVvsNf5TtmM8T3OQr
         0t0J+eqfv/2NhHG8UgAwCGTiGJEte0kYVDuTS0FltOurhZn0nNup0LFJ49kZbDvmOmo0
         1cag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=VGy+Nj9c83OW8O8chp58gNtXq2XnteX0cby7ElrxjQo=;
        fh=luqczq21R/WVyFsAXY3xjiSk+tbt+bB+3AXcxVMujQk=;
        b=gHpjGuzk8FN/DVPEH6xlM/xRwSsVZOj/zQyxF/iB+k5KmtsfNLFfmu4d1oMp7hcqkR
         spIHTkX1Xe7sbxStrfSMEV5dmjJM/atWA4aqs7D6e6CIiR9kAe6csrz/YZci31NbDF1N
         xMuqPv3OdPhvypy+7dmDVRLVdeSPvtGECZDZMmmKfYV/nCf8Ae0/Md3jacRMWVENNUkv
         lLaZoJcKzIWJ23dJ5qdo1VPyY6oTDIJmVfyfUDj0aQdQV0bMMwI9v67YksqG0XaI9CyQ
         3ai2diFTQc7+xBkuFBA75O3hsPptD9P1xjfXR0Ldsy/dXnR6DdhtQueH9pu8u14oDj0A
         BUtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=qIj+i2Qd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd18102120si165639606d6.14.2024.12.26.00.23.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 00:23:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=qIj+i2Qd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQj93-0007Eb-L2; Thu, 26 Dec 2024 03:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3YBJtZwgKCHsvtgZnsrgfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--wuhaotsh.bounces.google.com>)
 id 1tQj91-0007E4-Ts
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:22:59 -0500
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3YBJtZwgKCHsvtgZnsrgfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--wuhaotsh.bounces.google.com>)
 id 1tQj90-0000Vp-Cr
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:22:59 -0500
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2eebfd6d065so11938163a91.3
 for <qemu-arm@nongnu.org>; Thu, 26 Dec 2024 00:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735201376; x=1735806176; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=VGy+Nj9c83OW8O8chp58gNtXq2XnteX0cby7ElrxjQo=;
 b=qIj+i2QdTBsine+aRyNSy0mwBdbz6SUfWAuCXC1b90Ea+iRsARpXb2xPze3TX/xrgR
 B0nA3imIdUg+L7KgQJ508NW9mJNx4zEr34/gQ1vWSp63cS/MKwimXdid2IOqQblGa8dm
 EDZo7FkrHJfk5qvdYoH8p6VmdX7zB0fIgq0mcUtzo3tJzJpz1lrU+/pSPjt4u1zlHTlV
 0timW8czcvBYwISp040tDlG9k0gzu1H0wQBmE/cYZCV3/8KyYmPeLRxP4Q5uKy9k6ORl
 xBfa0A5oZtNf3qkpLp3mIUvTozS0yRdc6IgyczAYI0cUzb0OiEnpseUMiyqzYiVbXqOt
 Nyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735201376; x=1735806176;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VGy+Nj9c83OW8O8chp58gNtXq2XnteX0cby7ElrxjQo=;
 b=j4+q7gbxooh514N/o2r0OhRxYz2R0DR1Lb4tXSSg5Jgc/zcFc0OaBUHrAX1zzqXD9d
 VDhXyppmoOcI6DckdJPf9GNzIeQpjB7ga+ev+tXtfEwm7YHec3WeutPa/i0kv8pYwPaM
 JN4G8O+cWjwaLjNkBaM/g70bVwG4Eh/ru901+PSPCXUTTlLpKDepVy+oSFXMictVET32
 J0PG628PJJpdvCQZcHrMudGbQ8YUcKPEAOuGtA83tQ6/lrOdW/Y9WNw1OOGhwzkxwRn0
 s9JoK8KeD5i+QNQs8nbtITnFWpNdVWDhFYeO50FFvXfqgSj7jrSdBZ8arV18wKn8oG3+
 Y5DA==
X-Gm-Message-State: AOJu0YyEavrrSYzeZHN7N0DIYOEdXVazbOnWU6fsp+2T25IUfNIP1KKk
 EV7NAij2KF7SMM97spE83k4VFB3wp6/PrChLJ9qdDxa2FFdiSsOkmCe8osmAvBD7vm9vBfE6Hv5
 87CX2DEv8aw==
X-Received: from pfwz25.prod.google.com ([2002:a05:6a00:1d99:b0:725:1e74:6a17])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:8085:b0:725:e309:7110 with SMTP id
 d2e1a72fcca58-72abdd3bf64mr33653526b3a.5.1735201376201; 
 Thu, 26 Dec 2024 00:22:56 -0800 (PST)
Date: Thu, 26 Dec 2024 08:22:21 +0000
In-Reply-To: <20241226082236.2884287-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20241226082236.2884287-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226082236.2884287-3-wuhaotsh@google.com>
Subject: [PATCH 02/17] roms: Update vbootrom to 1287b6e
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3YBJtZwgKCHsvtgZnsrgfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
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
X-TUID: 4HZIBRXI9AdW

This newer vbootrom supports NPCM8xx. Similar to the NPCM7XX one
it supports loading the UBoot from the SPI device and not more.

We updated the npcm7xx bootrom to be compiled from this version.

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
2.47.1.613.gc27f4b7a9f-goog

