Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp589291lfk;
        Fri, 13 Aug 2021 16:42:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS4amH7SiZaGtRqMsFZME7sEp8t04AAND0/cI9PQggpj3EHbrkO64s7TGiCYOOW00I4mNr
X-Received: by 2002:a25:be48:: with SMTP id d8mr6151085ybm.521.1628898155842;
        Fri, 13 Aug 2021 16:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628898155; cv=none;
        d=google.com; s=arc-20160816;
        b=LyPOq0rGtieZyiG0dhlp4WAneEDgogB+N5f2b8yPnm4W8k6QkLP6dXwiGWnut6ayiN
         nvWrV6uSISc+PJId0QeX2EmiJT1aRWX+Tex3NnnYZihEAWjEVwtH2YrVVa9VVQPITT3r
         S/Lvm7gILNKvPI8aITeSGLyPAZBnoq4q9QRr47ao28cqMXHDf5j+JX1rRDb5RyimkFHZ
         ExGVIGOavu8PFeX7Y6aWerYN7sPQ0SJKMQe5WiIUKw3e3fdLe/Xo0fZIGpsHVz3AI3FH
         j3Y9CoQ68T0c7DvPeQnn5B7rWeBieYl39VpplNqAdwNYQ7i9Jf0UMXpd9AqkhQfIWfLR
         tjOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=EBDYvPCRpxsguj2bn19Hqr2rt9KDvq/0ddQlCLgiBiE=;
        b=DggWI5RUYsAPzW3j5u+/5phF7I3WPsydMLwk6f8lkNFdJSnpzLrUOQC4cyvcJPTzAV
         oN8xfUnHVvrtDvRVOUY8l2Pr/BfzVKxouifbp28K1hfiQ4vORbvqMJKfctkC1TOKQzJe
         kHS3oxB15RRmmAgM8F1RzszsaRFy+a5lOo2JpdnBEhWbNI9NkfFRPbsBGxnKt5OTS3kx
         7lcTdjhFmir3OvlxBw3JCB53Bfgaz1Vva9PXVbFhe299d+RwKNshWjdN/Ldi5X+tlPLM
         zr3fmx9JTU+CgzlKZEEPmW+FYB2Z8GUdCU3ejdp0xg2Il9Qeud8e6VnQ53m7Rlc6I4/u
         Jj8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=RjYuZjRu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y201si2969960yby.274.2021.08.13.16.42.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Aug 2021 16:42:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=RjYuZjRu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:53562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEgot-0007o1-6z
	for alex.bennee@linaro.org; Fri, 13 Aug 2021 19:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3iQEXYQgKCPYusfYmrqfemmejc.amkocks-Ypklmlels.mpe@flex--wuhaotsh.bounces.google.com>)
 id 1mEghA-0003j8-Gj
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 19:34:36 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:36402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3iQEXYQgKCPYusfYmrqfemmejc.amkocks-Ypklmlels.mpe@flex--wuhaotsh.bounces.google.com>)
 id 1mEgh9-0005xG-2p
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 19:34:36 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 n20-20020a2540140000b0290593b8e64cd5so10670276yba.3
 for <qemu-arm@nongnu.org>; Fri, 13 Aug 2021 16:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=EBDYvPCRpxsguj2bn19Hqr2rt9KDvq/0ddQlCLgiBiE=;
 b=RjYuZjRuZdIIf2w59jM6gFqKJ1uGDYewBkjEFgSvszJWG5SZu/vp2qaqQbxUERFTmn
 rVbO0ZbVbTsKhCc1EJC/RK5UL6nokH8Bo2W14PPe0OMqfwLmBPZR5p03MupP/TLSDF+G
 N0F5zKqflj9X+3fk7aZ/KmIC9IV5hx0zCaeFtFBl3iTwCznKfZH3zzQyeWcOzSLCqx5w
 imdojcKbL7kFsqt7TU/foIH7nM33lujD8OWWxluPNUejvfXxB0MllxdcYp6kjfQttoi4
 0FC6DL7tgJj03il/Am4w037qpHRfP07A3rmUnBaueJF9Hc9fCrmrS8bE8nyqIBRtVsH4
 RW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=EBDYvPCRpxsguj2bn19Hqr2rt9KDvq/0ddQlCLgiBiE=;
 b=NenknlSiG7s15WoFODpCSxoxPYwFevEagjVLrB4smnG/MlIyLrhLUnAjsMkJ0ymcDL
 lM7QH0M8Xchci5iqd7ZrAymmitpGGtdUcg3mq6YU0nBCc3no910G9KoRjEAK0ugZ80ro
 /bT6my0FACmSnaT8yxXfrNuDDfNAnZJU1ZokP2dOgclJberUrUZJG7pKyEmC/o5Igbjt
 OuuZ89+ukRubAWjmMUiutgonp94ubEjCRhgrcr8RCe95EAzp/UOB8nsIUX9sBZuY7LwV
 WqAfwIggoVyNTYKZ5j29Z7OHxwGL0B6/VagAuEnNsHHS3Fo/bU96dJ4uviPsRPWP3Gbb
 9LNw==
X-Gm-Message-State: AOAM533Yp33Q5neiFAwoAhKtToL2w1u1WHqdMHJzwkvV8+FIAuB1DVZj
 0mQZn4NqzXcscBFmq0pw4m4r3W1ddrstXA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a25:404f:: with SMTP id
 n76mr6206163yba.494.1628897673685; Fri, 13 Aug 2021 16:34:33 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:33:50 -0700
In-Reply-To: <20210813233353.2099459-1-wuhaotsh@google.com>
Message-Id: <20210813233353.2099459-5-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210813233353.2099459-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 4/7] hw/adc: Make adci[*] R/W in NPCM7XX ADC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 wuhaotsh@google.com, titusr@google.com, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3iQEXYQgKCPYusfYmrqfemmejc.amkocks-Ypklmlels.mpe@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CpZqda1htjMR

Our sensor test requires both reading and writing from a sensor's
QOM property. So we need to make the input of ADC module R/W instead
of read only for that to work.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/adc/npcm7xx_adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
index 47fb9e5f74..bc6f3f55e6 100644
--- a/hw/adc/npcm7xx_adc.c
+++ b/hw/adc/npcm7xx_adc.c
@@ -242,7 +242,7 @@ static void npcm7xx_adc_init(Object *obj)
 
     for (i = 0; i < NPCM7XX_ADC_NUM_INPUTS; ++i) {
         object_property_add_uint32_ptr(obj, "adci[*]",
-                &s->adci[i], OBJ_PROP_FLAG_WRITE);
+                &s->adci[i], OBJ_PROP_FLAG_READWRITE);
     }
     object_property_add_uint32_ptr(obj, "vref",
             &s->vref, OBJ_PROP_FLAG_WRITE);
-- 
2.33.0.rc1.237.g0d66db33f3-goog

