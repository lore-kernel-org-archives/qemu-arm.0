Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1332795ejc;
        Fri, 13 Oct 2023 00:57:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz2JXQ1uK03EJWfL0kYVgA/jSb41+mUZHakxy+6UuGjTIk76/h2kfn0qbBne8Kvo0TKkPQ
X-Received: by 2002:a05:620a:d81:b0:777:2d58:854 with SMTP id q1-20020a05620a0d8100b007772d580854mr11314180qkl.29.1697183822100;
        Fri, 13 Oct 2023 00:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183822; cv=none;
        d=google.com; s=arc-20160816;
        b=cSx3KrKA7nIwnTEwAcMAbP+XixUqNc+0cdqxJSR+Xy3Bmvs5LGtdzcU1IaQFuYkle5
         mwhrHLS/UiybAxOsY9GPyfDp4diWfYw/RdzJypE195KPWbbBZRPV1tL+KQWNF1MDM5yS
         SgjoXKBifOu2eBRuzhACKEykOYl+MB0uOQn5jmknocS1qmyoT7+uZ93Sm4N4v4nuiPeQ
         RxlbWH0EP1E/cMUajdhALW0LJJ+DBi/48AfwLTPAQZBporB1kqEMc+AIO0Z4kZJrKeCS
         oY8G+9TZl3jf2qG9rADckErXL73I29OFi+76xQPR/bBln9MgzcWy5bPz7RhjIMycTPAt
         gfxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Zt1Cbdxf80sA4qUTrrmRnyL3tHABTBMLvyZdLPFroHM=;
        fh=1CkIaZBADmJB8jP2ieauFT9oPNugo99OaBqF7VaVQrU=;
        b=E8C893QB7IJzhdO7ZKdD07FgYpXtnHJVjRhsjethosLKInfhkH5LLB1XyKuVsvvyWU
         /2yxHip0fuTQpUCqKZRTNbzeSVlkAiOxgmaghopSL95ejahsz5zRGFnNYmJlh+roPmyK
         ytEse8tO8yAVkMscZHqLSa+t06YP5oMuX6Epd8O/LoXKNRD0Qtc1310sWOKv9UWKBsYX
         jw4wIS2l+wC/gfWZ/GaiBSsOodQzjynPxgrYdYSmPcJeGBJWfiYEDAjzg0PzOdL1EiuP
         2Sbfjex92aI0X5yFfpsw6WKlZHvvwTfatIUX3D6vv1SacadmE6aR0YWW7ErduQTr0fym
         cqSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JhSOyziw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19-20020a05620a449300b00773fa71cbb8si818854qkp.512.2023.10.13.00.57.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:57:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JhSOyziw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCyL-0003Br-Vt; Fri, 13 Oct 2023 03:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxQ-00076R-Do
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:42 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxB-00055G-8y
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:51:39 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-406650da82bso18216535e9.3
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183480; x=1697788280; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zt1Cbdxf80sA4qUTrrmRnyL3tHABTBMLvyZdLPFroHM=;
 b=JhSOyziwlr5QOeQAQsrV6IRv0vSWF9AOy7kTmgWgHyEJ97LsUX2xZkYibaxAhzmaWF
 1KSIDF0VScQvzm4U+HAc7ERqeripWbqxK04F5yH4SuQvZPLsMwXCGg+GpoYB86hLb6yg
 MEwZuqRgwWZDMVTetRRNOXmRxw/3Gtv3SAuC8dbR/Cw9SlsvT0+aPZPik2qwgKQ45JJs
 NENT5BNuWgL5zvBBHSngGopGAnYTTqxMbQHn4lNwO7AKz2cBNSOmXw7GJpaiBHWTvHQa
 C+M8p+k9a7JOWQIeFziCEruLRbNuVB12J0korBG2xvRnC6lYdOD9zzXPOESdjw6uCDj9
 W9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183480; x=1697788280;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zt1Cbdxf80sA4qUTrrmRnyL3tHABTBMLvyZdLPFroHM=;
 b=dmPZqSq/3F+PKctIYLUh3t+zEYlLTilJUmmIxyaXYnYv4eANL5meGtqlVQqaRmIeq1
 lhgr6q7FfobZGkh8qme1lqfojVyJgajycqi9JeUNw/xMeqtz4CZ6mqyx7Z/0rJgGfBS5
 l45A5kkcQ8ZVuoXiaTHUkzBZd7ymfG61PVkB8oBIEeDkpAyxsFJnujiOYep4rdFR0nYR
 4tiqmysLQNkNNEvsWXoKlh9peICa0h1kq0KUB80BF4ebZ3nuC/x8GSzEscuYSjDFxt+l
 aa09vriQRXqpDZlV9p16IYWQzYBGQ8cRI35ducCF+OFxMaobmFfPj1ROd4t+q+08vmFY
 mKMQ==
X-Gm-Message-State: AOJu0YyKqR6XHhPwU11EoCVpnBMBnVYf4CxjN7w/M9YNwbexfbTjTNrO
 yBhWGHgAMwyPWN2aI9BAe7g4EQ==
X-Received: by 2002:adf:f403:0:b0:321:5b64:f744 with SMTP id
 g3-20020adff403000000b003215b64f744mr21846560wro.20.1697183480727; 
 Fri, 13 Oct 2023 00:51:20 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:51:20 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>
Subject: [RFC PATCH 43/75] hw/m68k/mcf_intc.c: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:53 +0300
Message-Id: <3cda982b0d9959ff4ca39d90e404a27a489b9340.1697034504.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697034504.git.manos.pitsidianakis@linaro.org>
References: <cover.1697034504.git.manos.pitsidianakis@linaro.org>
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
X-TUID: TJpWRw9RoBby

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

