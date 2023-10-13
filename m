Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1338032ejc;
        Fri, 13 Oct 2023 01:07:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY54TJKc8P78ouDCfgP7FQZtgPL2/IZK97+NlBHHF5NOHQyrcnoy4v1CETLuXpClYOQUXh
X-Received: by 2002:a05:620a:b5a:b0:770:9bd2:b3be with SMTP id x26-20020a05620a0b5a00b007709bd2b3bemr25992786qkg.5.1697184457019;
        Fri, 13 Oct 2023 01:07:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697184457; cv=none;
        d=google.com; s=arc-20160816;
        b=PG4SHaYuLoIR4IEjp7q10bCE6VEEUkFxqNBogsiRaGjgkwt9zlXBXpCR1VOtGwXEmC
         +mFDXlGKH9leuR0a0YJxISI4m+kc250CKj6YLkQK7/ltv2MStoqHSx12a8O6QqalUjgf
         vd+q/NmagKPvpBobVNoSyf7/ePXhyjDkC6oJsSuDjfHdbsINfoTq9foVFxmBjh9NO3Gd
         cgmEJEaYkO6DD0oLnjooaW74u6gKTcQr2XINygImvlrpjBPEOizTJMGYnDznwqG8c9qo
         sfXN4+qEtA/yQf9AxfW0bw8wetHim9Zzwv3qK21yN4ITimxPS2lSt5XNm8x/+1Bqwdxf
         H0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aZTz17RhWxoUZ3hVHX7ypZhIj3NVSXDU2Rg89KVwrPE=;
        fh=1CkIaZBADmJB8jP2ieauFT9oPNugo99OaBqF7VaVQrU=;
        b=deTBxwfK+nkeEpUBq97fU5meTSoi2G+O5FfaSyAO4TuhPsgj467QTIpoFoWUTvRY+Y
         /33clD2Oc310FI7s/V6THOTV6cKy3/1sLF84ZMlw0f2ExfTX1DAvqOSmmaBj1+Fg+qC8
         hZy0gPfTNZGQ0Xx6tbHpb9BldXyRGO8BKkCwy6H8JT74ip3IKfVB3JVey7hsMDtHlUAh
         85rTtU6tStaj+sfaXoCRGAUXQWC6cnFdFVyGucTDVfA9mOq7znkk2nC6RFU/S3+9Gq6B
         8OJK4Ei7ZnxtVMuKtg2u/jiTmKN+xOWPVTClU4VP+I40yOWmY2/VS2P5jLM3HjFs1uaW
         8Fmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yo6QvDN5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a05620a0c4700b0076dbb17e788si863974qki.721.2023.10.13.01.07.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:07:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yo6QvDN5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCxv-0001Rm-TR; Fri, 13 Oct 2023 03:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxT-0007CT-JD
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:46 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxK-00057R-Qo
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:43 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-405505b07dfso18716665e9.0
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183486; x=1697788286; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aZTz17RhWxoUZ3hVHX7ypZhIj3NVSXDU2Rg89KVwrPE=;
 b=yo6QvDN5qXYK1qGQZg1y6wlvqPGS1mxdFEWQvR4KeVsQ8oW8pER0MQ1iXkI5Fe+nxU
 IsgL4MwWMKSWTf8QOxTXSbZ/rotGnn10szX9IUwx2H8jBbIajOTYPMBg4lKzZ3K5yMBz
 eHqfGlUFUhBGV7O8omOJ8SQ8sXjHmksLlNNc3SOfnZJWVfE8fJVS33uE3sr/MoOio3oH
 3nr9H/3vuAxhc9SuQT/I2b7+CaoFv9//l2TLKcFRB01+UOyNhmaRP1xx/jtlADqHgTsU
 A6oMsWTqUIO9OAakdqeJmkfPMbl/TXZcBq1TuFHLs51j+PgGBgV5rNMuh2oDoyfDcpsc
 Aitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183486; x=1697788286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aZTz17RhWxoUZ3hVHX7ypZhIj3NVSXDU2Rg89KVwrPE=;
 b=W8kYr5bWAgYrsauQjqEn6BAFvDF1ZZT4pu/IGw2n8ZjOgVIJxcn29f9zEgqIG9QwvE
 X7r9UncAvV43SR8N9IxczYkcb+dFBI2aRFNMcABzLmuAXAnqTH/KD0Kg65X4E3wssGjA
 iszpw97KerFaPcq26euWTC+TJbqPFqW3N9NXhZFWQprWFi4LAtMWcLrIaL718XxOk8eq
 AGXU8z4iUg5u1F7UqwVWIg9sBW9TDQ24XQnGuG7SIxzCYJKN2ufMQwFt1MxLzpfn/c9O
 mIHbHeM61tiIRWKFD2AhPQNmIIt1dtV+48Dz3Bu2m5PLiJhbwvae8wq1HGpFujKDNvSz
 mHdg==
X-Gm-Message-State: AOJu0YwKtfLZQ+X+zSPGAPUA0SUD+a1LzYE+ZAMbXVL61mM5b0NZFqaV
 tR1aj9/dLhkyQhhV7pAv09U69WNfZfU1gPkLoXI=
X-Received: by 2002:adf:e288:0:b0:329:6d7c:ca71 with SMTP id
 v8-20020adfe288000000b003296d7cca71mr15995250wri.17.1697183486466; 
 Fri, 13 Oct 2023 00:51:26 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:51:25 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>
Subject: [RFC PATCH 44/78] hw/m68k/mcf_intc.c: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:56 +0300
Message-Id: <afd58b7b36d587594754b695313ed01232f6735f.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: 77HU6SSYnJNI

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/m68k/mcf_intc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/m68k/mcf_intc.c b/hw/m68k/mcf_intc.c
index 4cd30188c0..9556a0ccb7 100644
--- a/hw/m68k/mcf_intc.c
+++ b/hw/m68k/mcf_intc.c
@@ -58,34 +58,34 @@ static void mcf_intc_update(mcf_intc_state *s)
 static uint64_t mcf_intc_read(void *opaque, hwaddr addr,
                               unsigned size)
 {
     int offset;
     mcf_intc_state *s = (mcf_intc_state *)opaque;
     offset = addr & 0xff;
     if (offset >= 0x40 && offset < 0x80) {
         return s->icr[offset - 0x40];
     }
     switch (offset) {
     case 0x00:
         return (uint32_t)(s->ipr >> 32);
     case 0x04:
         return (uint32_t)s->ipr;
     case 0x08:
         return (uint32_t)(s->imr >> 32);
     case 0x0c:
         return (uint32_t)s->imr;
     case 0x10:
         return (uint32_t)(s->ifr >> 32);
     case 0x14:
         return (uint32_t)s->ifr;
     case 0xe0: /* SWIACK.  */
         return s->active_vector;
     case 0xe1: case 0xe2: case 0xe3: case 0xe4:
     case 0xe5: case 0xe6: case 0xe7:
         /* LnIACK */
         qemu_log_mask(LOG_UNIMP, "%s: LnIACK not implemented (offset 0x%02x)\n",
                       __func__, offset);
-        /* fallthru */
+        fallthrough;
     default:
         return 0;
     }
 }
-- 
2.39.2

