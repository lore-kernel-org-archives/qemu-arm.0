Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5601747njk;
        Thu, 26 Dec 2024 00:28:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWoPHbF4+CzM35wm0SHYiUhDmfYWOrRBKw8Nf227hBHs6Pt/twL903FJr7kj1z+XJeOXOxP1cztxQ6uRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGxOaxu36BDk8bcOz+e33ml8QufPrr8D+tMvwjBXxafrl8A+PEAFAa3u3mzh75xfc3R3twu
X-Received: by 2002:a05:620a:4549:b0:7b6:eba3:2e08 with SMTP id af79cd13be357-7b9aa934508mr4601992685a.7.1735201707635;
        Thu, 26 Dec 2024 00:28:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735201707; cv=none;
        d=google.com; s=arc-20240605;
        b=AVKgNYSFEhtsnFM7s8UK6TvEeAXqU3QN0U9l7n78ez7ONrtcmAkU6aWLzI34iJx782
         nXPphbzvwTZE3yikHapEfts2SRFC6R8An58GE03hFj6kwAZdjeGYQI4h79KZgMX9/c4+
         dJk6NGODnKhsjF6BXbaG8wYqb7X9U7eoaRhiiWYL+7/cM+xQl3StGeuyytbg6i+tP1qj
         cSLPVsPFSb45muhMa8ojSaaZjzxiJME/0oq0gXAufo6EBY5iMlf8row7C49sfZdRrRMe
         RIOVNWBNI4maXC8I8/ui8wOU45jUnkqCF1LpFL5B0oVV57b4PD4OeIIJ6pWSLa5elMnF
         d18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=VGy+Nj9c83OW8O8chp58gNtXq2XnteX0cby7ElrxjQo=;
        fh=luqczq21R/WVyFsAXY3xjiSk+tbt+bB+3AXcxVMujQk=;
        b=bkOACprx+FicxP6Y577vEXNZFfUdUGM/JO0beBGQZjt01lIFkwf+zrGW5xDNsoBIUn
         uLJUeW+SrQSOkXZ8rLVp8GRLno7GaChpn0UrNj33WZy2i//l57VkY0Iyc8BoefwRJxWg
         mDIsH9EuieN+2VCGYRwZjdyOhPnoe/1YXEkb0jtpa3wT6q880gPFqzWV0B+etTHZfpZl
         eoQo8DqOaK2VvM5jbpvo+1al5oDBAj3f7zts+vMIZt68t9eAM4DUWdqczpYxpvuOPagh
         4wMIfS99pn0TZA4oxml2lQYTtNEm8i9e8CBjhYtbQAUZE1izMURuCTTngVDusVfZR8cH
         jwvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=YsGwfEYG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac2ab6fesi1707007485a.10.2024.12.26.00.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 00:28:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=YsGwfEYG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQjEI-0002XN-8o; Thu, 26 Dec 2024 03:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3mxNtZwgKCLgusfYmrqfemmejc.amkocks-Ypklmlels.mpe@flex--wuhaotsh.bounces.google.com>)
 id 1tQjE8-0002DZ-J9
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:28:17 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3mxNtZwgKCLgusfYmrqfemmejc.amkocks-Ypklmlels.mpe@flex--wuhaotsh.bounces.google.com>)
 id 1tQjE7-00019W-2c
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:28:16 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2ee8ced572eso7884666a91.0
 for <qemu-arm@nongnu.org>; Thu, 26 Dec 2024 00:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735201691; x=1735806491; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=VGy+Nj9c83OW8O8chp58gNtXq2XnteX0cby7ElrxjQo=;
 b=YsGwfEYGQI/ItVd3c/VVXJYqfQDEjZpaVSVtX2tgWDYBcYqieo6taqCRzJ2Jasj95t
 8p7B1uTK6QUBVp2FjIB3CPI3BgEQBrSVtoPrsMTlwVxi4O9jQHM5Gd2jPuGALstzTzBq
 KM6kLWFYpyO3CiAPtcy0YwwuJdp2zaS2tZymsVvvATcCHj4maFX3fxR3WpqSDU1GxUJ3
 PMYJetUuHb2NcOzrQUvO6nOSb614+LjIFDQ0mUKN3N1kBTjtY6H6RNLddtdanWR2IPEN
 r5idH+NTZeIFdb0vo2sAW/zRNwP+kx1i9fiKc7P4C0wOAYO8GAhZBc9hfl/0LpqYVJoH
 u8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735201691; x=1735806491;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VGy+Nj9c83OW8O8chp58gNtXq2XnteX0cby7ElrxjQo=;
 b=CBrfNj7rseaFDNqzFrQNa/7TWAY6m6/j+1otI1csiiSZdshTLQtKcTs1laWZT7JQms
 kGUu0+rc+ES1IB2D4fKcIT8ZWnZ9n2M+i/wqIbxRp9Gpxoak+kTYMqT4omTax4YbNMFW
 QxjQlXoVxZtgvUg0q0tzFc/fcHmg9twHiOc5m5zLwEztaKQddgwqmcT303SlU+58ViwS
 2Vv9aXFvW+A3BZP2AqrWI5+b2Yzvjo8kxR8o39umXixpLlITZnW3NP/1akXw0EdAcyHS
 llN3aZMOexfNCIcO/lTTsMWPbLuqYVlFFB7yjjThBh1A2/WFZGlCs6A0Wf8dEWcS1L8O
 64Pw==
X-Gm-Message-State: AOJu0YwRaUTSeOsH/D4m8Jx7GAI/XRdtq9eHo4NRRfqQRgyyaThsR4I0
 QXpkF9jpt1/JZlQ4v2TFBTRNLIF/Z2/D0BzHgpwfDZXR++Ikj2nX5rLzjoL+ED2plfgF1e/YYyM
 3/D84ipFhYA==
X-Received: from pjur6.prod.google.com ([2002:a17:90a:d406:b0:2ea:d2de:f7ca])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:fc48:b0:2ee:8e75:4aeb with SMTP id
 98e67ed59e1d1-2f452e49238mr34728560a91.17.1735201691592; 
 Thu, 26 Dec 2024 00:28:11 -0800 (PST)
Date: Thu, 26 Dec 2024 08:27:45 +0000
In-Reply-To: <20241226082800.2887689-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226082800.2887689-3-wuhaotsh@google.com>
Subject: [PATCH v2 02/17] roms: Update vbootrom to 1287b6e
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3mxNtZwgKCLgusfYmrqfemmejc.amkocks-Ypklmlels.mpe@flex--wuhaotsh.bounces.google.com;
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
X-TUID: frgNdSwmSlTk

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

