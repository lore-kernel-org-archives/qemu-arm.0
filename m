Received: by 2002:a05:7022:3c17:b0:97:989a:5032 with SMTP id tu23csp668523dlb;
        Wed, 5 Feb 2025 17:32:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWTtmPUCHxGYjjzrJVR5hQJFU3WlikJOI237IQOVXJrj8c1v7e72/sG14SZjQvLVDTvSI9jTpq0lbGN/g==@linaro.org
X-Google-Smtp-Source: AGHT+IFZ9YBZ1mDxSeSf5lMiaVs+lrLXDFQL53KsYo36be1evCFqz3MzbDVxmE5bar8DXElx9EJq
X-Received: by 2002:a05:622a:1a8b:b0:466:b287:78a with SMTP id d75a77b69052e-47028167706mr77366541cf.3.1738805549822;
        Wed, 05 Feb 2025 17:32:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738805549; cv=none;
        d=google.com; s=arc-20240605;
        b=kVWRbSso+N4xqfDXEAVL/ZHjt9YJvYEI0zAaqutd33S3tnrixSwog+xtnhMKJl3vVa
         CoQPbngYDQ1pLnVK/gDaf9/Tv5ahbu+rJSq/tJz5uYuVzF65E22QCgf/82CSy+Z8vi60
         I0i8+o7WQNGF8yCOMb1lPwKXdvqiOjjWVE+fDj5qxTgjxtHUGTSTg+Sz5CYNm9TCexzd
         275L1/MGDFGhnzhBfjjpzoD7b/ihlauj8nXj508lOV8+xGkhGbnotLZcJA6+7OsxLvD3
         fK+IDjeK9txdpf65D1ViY/9EZWhcuS6BIcXk6WlBul0wYb4MzyABAN1HwMlc/nRbNevX
         474Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=jm11tuE2Xz/Wplg8aBcomuxNIdQPqZVBGw7eKnOjft4=;
        fh=vAmCyELZpI9ciALLrRzdlwv7odCuc4XBF3ESYa1C1oI=;
        b=i5SeFZhhCadPuS3Ty9vM55/e4/1Gww6cOZfr/AM6OsO/hbNgRzOcd4rQRGEQGDN1El
         W2My8B8PssPhY+rfPVgciGyL0WE5mqi24C+XuIGqSHkPIlBZQGq4hf7LrrQNRxrcx+hJ
         NuNV3fBRyaTKVSwg4QirmN65LiV6/cZsbzD/gKc1RENJvESfvVH0zZY5wyyGOSi1oZYs
         CLLv4GVM3C8a/LHw+zz/xzyaY7WZTMKUDeq+nhfH4eiDTCrmxLyHtUkWuVigoon9//Fk
         xLWs6GM6gFISQQpxMqADdsMWJVGOqWIDLMtnnt0uY0ON+WDABWc94IEasEp/qy91VKDY
         vP/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=oeXvGExK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153b74428si1566021cf.258.2025.02.05.17.32.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2025 17:32:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=oeXvGExK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfqk4-0005EG-UO; Wed, 05 Feb 2025 20:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <34BCkZwgKCtUNL81FKJ87FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1tfqjg-0005BF-10
 for qemu-devel@nongnu.org; Wed, 05 Feb 2025 20:31:24 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <34BCkZwgKCtUNL81FKJ87FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1tfqjc-0006sk-UP
 for qemu-devel@nongnu.org; Wed, 05 Feb 2025 20:31:19 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2f46b7851fcso1034267a91.1
 for <qemu-devel@nongnu.org>; Wed, 05 Feb 2025 17:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738805473; x=1739410273; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=jm11tuE2Xz/Wplg8aBcomuxNIdQPqZVBGw7eKnOjft4=;
 b=oeXvGExKysm06dbVmjPUf/kp69ucIrBaorVq08xJ+LA5lXCdC+sMyl4YAbp+LIim9u
 CEtBflaox5FWB2rX3Y+3nYHObvOaiLf8B6R+FIBtjkLMKb1/ce6LZvfomcuewyQISh3E
 jtaCaFoj90POIAfJ+HGNxSBXPTOGjXzNGgA81PIIlOrt2enpON/ZXrNQTDwm5v5KH8gT
 19wLnElowlGUPAhS7GnV+OKks+RSxL9Ir7gJQ4jbnL/w5XLxxhhQbN95bwQmCtFdXg+r
 dQ8BEv5bbZfdi72miV/UasVZPAhT6M+6dCa07g53qeerIEdK/pWQ1Qisut3HUaWHxF+A
 qqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738805473; x=1739410273;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jm11tuE2Xz/Wplg8aBcomuxNIdQPqZVBGw7eKnOjft4=;
 b=ZSe2EqE4iNhlORyA7QicOCA14vL8NANIcU5khDLm3MslnaNtvk6my7rs54MWptBU5I
 NVuRvIdAkSw9f02BG4x0tnxVkIfRNfTHwIA47HHLSthlY2dumcYFwfMtbAG+G3JnxwcC
 YhLBAtiIj1Y6RGZ37ZsTcAp+OTvWhwuqEyuyLMt78MSVzgN6DgxUbos6GidazSfgr55m
 oK33dNVkmtKLWREKvoulIT0HJSk7uYvkyoe1iJUlQ3Jx5HkdCgdlwXMUAKPY1Tn+V5Id
 WLfVd2zVG5aZ185zmPdn9n+YGdV5mhnHJH5sHnPxqkKVQFxrR9JwNy7tjmRvRKrxJNxr
 94Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYhXvJSfBwZgsJFQVbKPYIhRKLZ0q0z5BxnVEFLmsuqXt2N8TL2xpV+dL3griJ77kZ0yuOO5Nzo+Vw@nongnu.org
X-Gm-Message-State: AOJu0YxsqGHrHnHhlMGCyDiDozFkGdUMns99jIGySIgvuW5SFhpwt7pH
 3nr5iu3y0VEnWUsnIItwfiP+7rB7YCXguS6dkfKp00msfxrhRnokQxRdTG2A79EQ23qvmw2VWrV
 6WeZ7QPf/Jg==
X-Received: from pjbsj1.prod.google.com ([2002:a17:90b:2d81:b0:2f8:45ef:702b])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d406:b0:2ee:d63f:d71 with SMTP id
 98e67ed59e1d1-2f9e076c070mr8613168a91.14.1738805472883; 
 Wed, 05 Feb 2025 17:31:12 -0800 (PST)
Date: Wed,  5 Feb 2025 17:30:49 -0800
In-Reply-To: <20250206013105.3228344-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250206013105.3228344-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250206013105.3228344-2-wuhaotsh@google.com>
Subject: [PATCH v3 01/17] roms: Update vbootrom to 1287b6e
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=34BCkZwgKCtUNL81FKJ87FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: bhHhsRhHl6vM

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
2.48.1.362.g079036d154-goog

